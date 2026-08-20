/*
 * RenderMesh.c — src/lime/common/RenderMesh.cpp (mesh loading)
 *
 * Hand-written from the disassembly of the armv7 slice (0x0005e2b8,
 * 0x0005e7f4, 0x0005ea34) and verified against the oracle: the original
 * LIME_LoadMeshSet, statically recompiled, was run over the game's real data
 * and this implementation reproduces it — see tests/test_rendermesh_diff.c.
 *
 * The format itself is documented in docs/MESHSET-FORMAT.md, and that
 * specification was itself checked by running EA's loader over 590 files.
 *
 * Difference from the original, deliberately: the original allocates through
 * limeMalloc and reads through limeLoadFile, both of which are iOS platform
 * layer. Here allocation is plain malloc and file access goes through
 * lime_load_file(), which the platform layer provides. Behaviour is identical;
 * only the plumbing changed.
 */

#include "lime.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Header sizes and strides, all verified against the real files. */
#define MESH_HEADER_SIZE   140   /* name[64] + texture[64] + verts + faces + radius */
#define FACE_STRIDE          6   /* 3 x uint16 */
#define DISK_VERT_STRIDE    26   /* int16 x,y,z + float u,v + 12 discarded bytes */

/*
 * Reads a fixed 64-byte field and advances the cursor.
 *
 * The original calls Read64CharsFromMem, which copies exactly 64 bytes and
 * returns the advanced pointer. The stored string is not guaranteed to be
 * terminated within those 64 bytes, so the destination buffer is 65 and the
 * terminator is written explicitly.
 */
static const uint8_t *read_64_chars(const uint8_t *src, char *dst)
{
    memcpy(dst, src, 64);
    dst[64] = '\0';
    return src + 64;
}

void LIME_FreeMeshSet(MESHSETINFO *set)
{
    if (!set) {
        return;
    }
    if (set->meshes) {
        for (int i = 0; i < set->numMeshes; i++) {
            MESHINFO *m = set->meshes[i];
            if (!m) {
                continue;
            }
            /* Same order the original frees in. */
            free(m->meshName);
            free(m->textureName);
            free(m->verts);
            free(m->indices);
            if (m->vertLight) {
                free(m->vertLight);
            }
            free(m);
            set->meshes[i] = NULL;
        }
        free(set->meshes);
    }
    free(set);
}

/*
 * Returns the INDEX of the first mesh whose name contains `name`, or -1.
 *
 * Note it returns an index, not a pointer — easy to get wrong, since every
 * other function in this file deals in pointers. The original matches with
 * StringInString, a substring test, not an exact comparison: asking for
 * "SKULL" will match "SKULL3".
 */
int LIME_FindMeshByName(const MESHSETINFO *set, const char *name)
{
    if (!set || !set->meshes) {
        return -1;
    }
    for (int i = 0; i < set->numMeshes; i++) {
        const MESHINFO *m = set->meshes[i];
        if (m && m->meshName && strstr(m->meshName, name) != NULL) {
            return i;
        }
    }
    return -1;
}

/*
 * Loads a .meshset.
 *
 * `useLighting` asks for the matching per-vertex lighting file, which lives at
 * STATICLIGHTING/<name>.lighting — the extension is swapped, and the folder
 * prefix is easy to miss.
 *
 * Careful with the lighting buffer: the original only fills it with 0xFF when
 * lighting was REQUESTED and the file turned out to be missing. With
 * useLighting == 0 the branch at 0x0005ebae skips the memset entirely and the
 * buffer is left uninitialised. That is reproduced here rather than tidied up,
 * because callers may well depend on it.
 *
 * Only variant A is handled, which is what the original handles too: pointing
 * it at the 25 scenery files (variants B and C) makes it read nonsense counts.
 * Those go through a different engine path.
 */
MESHSETINFO *LIME_LoadMeshSet(const char *filename, int useLighting)
{
    size_t light_size = 0;
    uint8_t *light = NULL;

    if (useLighting) {
        char lightpath[512];
        snprintf(lightpath, sizeof(lightpath), "STATICLIGHTING/%s", filename);
        size_t n = strlen(lightpath);
        if (n >= 8) {                       /* replace ".meshset" */
            memcpy(lightpath + n - 8, ".lighting", 10);
        }
        light = (uint8_t *)lime_load_file(lightpath, &light_size);
    }

    size_t data_size = 0;
    uint8_t *data = (uint8_t *)lime_load_file(filename, &data_size);
    if (!data) {
        free(light);
        return NULL;
    }

    MESHSETINFO *set = (MESHSETINFO *)calloc(1, sizeof(MESHSETINFO));
    if (!set) {
        free(data);
        free(light);
        return NULL;
    }

    snprintf(set->name, sizeof(set->name), "%s", filename);
    set->texturesLoaded = 0;

    int32_t count;
    memcpy(&count, data, 4);
    set->numMeshes = count;
    set->meshes = (MESHINFO **)calloc((size_t)(count > 0 ? count : 1),
                                      sizeof(MESHINFO *));
    if (!set->meshes) {
        free(set);
        free(data);
        free(light);
        return NULL;
    }

    const uint8_t *p = data + 4;
    const uint8_t *light_cursor = light;

    for (int i = 0; i < count; i++) {
        MESHINFO *m = (MESHINFO *)calloc(1, sizeof(MESHINFO));
        if (!m) {
            break;
        }
        set->meshes[i] = m;

        m->meshName = (char *)malloc(65);
        m->textureName = (char *)malloc(65);
        if (!m->meshName || !m->textureName) {
            break;
        }
        p = read_64_chars(p, m->meshName);
        p = read_64_chars(p, m->textureName);

        memcpy(&m->numVerts, p, 4);
        memcpy(&m->numFaces, p + 4, 4);
        memcpy(&m->boundsRadius, p + 8, 4);
        p += 12;

        m->fullBright = IsTextureFullBright(m->textureName);

        /* Indices are copied verbatim: 6 bytes per triangle. */
        size_t index_bytes = (size_t)m->numFaces * FACE_STRIDE;
        m->indices = (uint16_t *)malloc(index_bytes ? index_bytes : 1);
        if (!m->indices) {
            break;
        }
        memcpy(m->indices, p, index_bytes);
        p += index_bytes;

        m->verts = (LIMEVERTEX *)malloc(sizeof(LIMEVERTEX) *
                                        (size_t)(m->numVerts ? m->numVerts : 1));
        m->vertLight = (uint8_t *)malloc((size_t)(m->numVerts ? m->numVerts : 1));
        if (!m->verts || !m->vertLight) {
            break;
        }

        if (useLighting) {
            if (light_cursor) {
                memcpy(m->vertLight, light_cursor, (size_t)m->numVerts);
                light_cursor += m->numVerts;
            } else {
                memset(m->vertLight, 0xFF, (size_t)m->numVerts);
            }
        }
        /* useLighting == 0: left uninitialised, as the original does. */

        /* 26 bytes on disk become 16 in memory; the last 12 are dropped.
         * u and v start at offset 6, so they are NOT 4-byte aligned — memcpy
         * rather than a cast, or this breaks on ARM. */
        for (int v = 0; v < m->numVerts; v++) {
            const uint8_t *src = p + (size_t)v * DISK_VERT_STRIDE;
            LIMEVERTEX *dst = &m->verts[v];
            memcpy(&dst->x, src + 0, 2);
            memcpy(&dst->y, src + 2, 2);
            memcpy(&dst->z, src + 4, 2);
            dst->pad = 0;
            memcpy(&dst->u, src + 6, 4);
            memcpy(&dst->v, src + 10, 4);
        }
        p += (size_t)m->numVerts * DISK_VERT_STRIDE;
    }

    free(data);
    free(light);
    return set;
}


/* --------------------------------------------------------- LIME_RenderMesh
 *
 * armv6 0x0008104c, 20 bytes.
 *
 * Picks one mesh out of a set by index and forwards to the single-mesh
 * renderer with an alpha of 1.0. The mesh pointer array lives at
 * MESHSETINFO+0x48.
 *
 * It is a tail call, so the whole function is four loads and a branch -- the
 * only thing it really contributes is the constant 1.0f, which is how the
 * opaque path and the fade path share one renderer.
 */
void LIME_RenderMesh(MESHSETINFO *set, int index,
                     TEXTURE *tex0, TEXTURE *tex1)
{
    MESHINFO *mesh = set->meshes[index];       /* MESHSETINFO+0x48 */
    LIME_RenderMeshSingle(mesh, tex0, tex1, 1.0f, 0);
}


/* ---------------------------------------------------- Read64CharsFromMem
 *
 * armv6 0x00081238, 36 bytes.  __Z18Read64CharsFromMemPcS_
 *
 * Copies a fixed 64-byte field out of a buffer and returns the advanced
 * cursor. This is how the mesh-set loader walks the name and texture fields,
 * and it is why both are exactly 64 bytes in the format.
 *
 * Note the copy runs the opposite way from the argument order: `src` is the
 * first parameter and `dst` the second.
 */
char *Read64CharsFromMem(char *src, char *dst)
{
    memcpy(dst, src, 64);
    return src + 64;
}


/* ---------------------------------------------------------- RenderAxesLines
 *
 * armv6 0x00080a6c, 12 bytes.
 *
 * **Compiled away.** The body writes its three arguments to a stack slot it
 * immediately discards, then returns -- what is left of a debug helper whose
 * contents were behind a preprocessor switch that shipped off.
 *
 * Kept here because an empty function is a finding: anything expecting axis
 * gizmos from the retail binary will not get them.
 */
void RenderAxesLines(float x, float y, float z)
{
    (void)x; (void)y; (void)z;
}
