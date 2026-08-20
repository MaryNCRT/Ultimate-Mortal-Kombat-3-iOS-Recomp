#include "meshset.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Variant A ("compressed" -- characters and effects) is what LIME_LoadMeshSet
 * itself reads: a 140-byte header, then indices, then 26-byte vertices whose
 * position is int16 scaled by 1/32767.
 *
 * Variants B and C came out of a different export path and use float positions
 * with a 136-byte header. C has no index buffer at all -- the triangle list is
 * already expanded, three vertices per face.
 *
 * A reader must try A first and fall back, because nothing in the file says
 * which variant it is. The tell is whether the walk lands exactly on the end
 * of the file (or on the vestigial text block the exporter left behind). */
#define HEADER_A     140
#define HEADER_B     136
#define FACE_SIZE      6
#define VERT_A        26
#define VERT_B        20
#define POS_SCALE  32767.0f

static const char TAIL_MARK[] =
    "//=====================================================\n"
    "// Ptr to each MESHINFO";

static int32_t rd_i32(const uint8_t *p) {
    return (int32_t)((uint32_t)p[0] | ((uint32_t)p[1] << 8) |
                     ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24));
}
static uint16_t rd_u16(const uint8_t *p) {
    return (uint16_t)((uint32_t)p[0] | ((uint32_t)p[1] << 8));
}
static int16_t rd_i16(const uint8_t *p) { return (int16_t)rd_u16(p); }
static float rd_f32(const uint8_t *p) {
    uint32_t u = (uint32_t)rd_i32(p);
    float f;
    memcpy(&f, &u, 4);
    return f;
}

static void free_partial(LimeMesh *m, int32_t n) {
    for (int32_t i = 0; i < n; i++) {
        free(m[i].indices);
        free(m[i].verts);
    }
    free(m);
}

/* One parse attempt under a fixed variant. Returns the final offset, or -1. */
static long parse_as(const uint8_t *data, long size, char variant,
                     LimeMeshSet *out)
{
    if (size < 4) return -1;
    int32_t num = rd_i32(data);
    if (num < 0 || num > 100000) return -1;

    const int hsize  = (variant == 'A') ? HEADER_A : HEADER_B;
    const int vsize  = (variant == 'A') ? VERT_A   : VERT_B;
    const bool indexed = (variant != 'C');

    LimeMesh *meshes = (LimeMesh *)calloc((size_t)(num > 0 ? num : 1),
                                          sizeof(LimeMesh));
    if (!meshes) return -1;

    long off = 4;
    for (int32_t i = 0; i < num; i++) {
        LimeMesh *m = &meshes[i];
        if (off + hsize > size) { free_partial(meshes, i); return -1; }

        memcpy(m->name,    data + off,      64);
        memcpy(m->texture, data + off + 64, 64);
        m->name[63] = m->texture[63] = '\0';
        m->num_verts = rd_i32(data + off + 128);
        m->num_faces = rd_i32(data + off + 132);
        m->radius    = (variant == 'A') ? rd_f32(data + off + 136) : 0.0f;
        m->variant   = variant;
        off += hsize;

        if (m->num_verts < 0 || m->num_faces < 0 ||
            m->num_verts > 1000000 || m->num_faces > 1000000) {
            free_partial(meshes, i + 1); return -1;
        }

        int32_t nverts = m->num_verts;
        if (indexed) {
            if (off + (long)m->num_faces * FACE_SIZE > size) {
                free_partial(meshes, i + 1); return -1;
            }
            m->indices = (uint16_t *)malloc((size_t)m->num_faces * 3 * 2);
            if (!m->indices) { free_partial(meshes, i + 1); return -1; }
            for (int32_t f = 0; f < m->num_faces; f++) {
                m->indices[f * 3 + 0] = rd_u16(data + off + 0);
                m->indices[f * 3 + 1] = rd_u16(data + off + 2);
                m->indices[f * 3 + 2] = rd_u16(data + off + 4);
                off += FACE_SIZE;
            }
        } else {
            nverts = m->num_faces * 3;      /* already expanded */
        }

        if (off + (long)nverts * vsize > size) {
            free_partial(meshes, i + 1); return -1;
        }
        m->verts = (LimeVertex *)malloc((size_t)nverts * sizeof(LimeVertex));
        if (!m->verts) { free_partial(meshes, i + 1); return -1; }
        m->vert_count = nverts;

        for (int32_t v = 0; v < nverts; v++) {
            const uint8_t *p = data + off;
            if (variant == 'A') {
                m->verts[v].x = (float)rd_i16(p + 0) / POS_SCALE;
                m->verts[v].y = (float)rd_i16(p + 2) / POS_SCALE;
                m->verts[v].z = (float)rd_i16(p + 4) / POS_SCALE;
                m->verts[v].u = rd_f32(p + 6);
                m->verts[v].v = rd_f32(p + 10);
                /* 12 further bytes the engine loads and never reads */
            } else {
                m->verts[v].x = rd_f32(p + 0);
                m->verts[v].y = rd_f32(p + 4);
                m->verts[v].z = rd_f32(p + 8);
                m->verts[v].u = rd_f32(p + 12);
                m->verts[v].v = rd_f32(p + 16);
            }
            off += vsize;
        }
    }

    out->num_meshes = num;
    out->meshes = meshes;
    return off;
}

static bool landed(const uint8_t *data, long size, long off)
{
    if (off == size) return true;
    /* the exporter left a text block after the data on some files */
    long n = (long)sizeof(TAIL_MARK) - 1;
    return (off >= 0 && off + n <= size &&
            memcmp(data + off, TAIL_MARK, (size_t)n) == 0);
}

bool lime_meshset_load(const char *path, LimeMeshSet *out)
{
    memset(out, 0, sizeof(*out));

    FILE *f = fopen(path, "rb");
    if (!f) return false;
    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (size <= 0) { fclose(f); return false; }

    uint8_t *data = (uint8_t *)malloc((size_t)size);
    if (!data) { fclose(f); return false; }
    if (fread(data, 1, (size_t)size, f) != (size_t)size) {
        free(data); fclose(f); return false;
    }
    fclose(f);

    /* Nothing in the file says which variant it is, so try each and keep the
     * one whose walk lands exactly. */
    const char order[3] = { 'A', 'B', 'C' };
    for (int i = 0; i < 3; i++) {
        LimeMeshSet cand;
        memset(&cand, 0, sizeof(cand));
        long off = parse_as(data, size, order[i], &cand);
        if (off >= 0 && landed(data, size, off)) {
            *out = cand;
            free(data);
            return true;
        }
        lime_meshset_free(&cand);
    }

    free(data);
    return false;
}

void lime_meshset_free(LimeMeshSet *ms)
{
    if (!ms || !ms->meshes) { if (ms) memset(ms, 0, sizeof(*ms)); return; }
    for (int32_t i = 0; i < ms->num_meshes; i++) {
        free(ms->meshes[i].indices);
        free(ms->meshes[i].verts);
    }
    free(ms->meshes);
    memset(ms, 0, sizeof(*ms));
}
