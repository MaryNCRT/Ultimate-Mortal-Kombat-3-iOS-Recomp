#include "skin.h"
#include "light.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BONE_SIZE      25       /* 24 in the ROBO variant: eight child slots */
#define BONE_SIZE_ALT  24
#define ANIM_HEADER    12
#define ANIM_HEADER_ALT 16      /* SINDEL_STANDARD, an extra leading float */
#define FRAME_FIXED    16       /* int32 tag + limeVECTOR3 root */
#define BONEANIM_SIZE  20       /* quaternion + one unidentified word */
#define WEIGHT_SCALE   (1.0f / 65536.0f)

static uint32_t rd_u32(const uint8_t *p) {
    return (uint32_t)p[0] | ((uint32_t)p[1] << 8) |
           ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24);
}
static int32_t rd_i32(const uint8_t *p) { return (int32_t)rd_u32(p); }
static uint16_t rd_u16(const uint8_t *p) {
    return (uint16_t)((uint32_t)p[0] | ((uint32_t)p[1] << 8));
}
static float rd_f32(const uint8_t *p) {
    uint32_t u = rd_u32(p);
    float f;
    memcpy(&f, &u, 4);
    return f;
}

static uint8_t *slurp(const char *path, long *size)
{
    FILE *f = fopen(path, "rb");
    if (!f) return NULL;
    fseek(f, 0, SEEK_END);
    long n = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (n <= 0) { fclose(f); return NULL; }
    uint8_t *data = (uint8_t *)malloc((size_t)n);
    if (!data) { fclose(f); return NULL; }
    if (fread(data, 1, (size_t)n, f) != (size_t)n) {
        free(data); fclose(f); return NULL;
    }
    fclose(f);
    *size = n;
    return data;
}

/* ------------------------------------------------------------------ .bones */

bool lime_bones_load(const char *path, LimeSkeleton *out)
{
    memset(out, 0, sizeof(*out));
    long size;
    uint8_t *data = slurp(path, &size);
    if (!data) return false;
    if (size < 4) { free(data); return false; }

    int32_t num = rd_i32(data);
    long rest = size - 4;
    int rec = 0;
    if (num > 0 && rest == (long)num * BONE_SIZE)          rec = BONE_SIZE;
    else if (num > 0 && rest == (long)num * BONE_SIZE_ALT) rec = BONE_SIZE_ALT;
    if (!rec) { free(data); return false; }

    LimeBone *bones = (LimeBone *)calloc((size_t)num, sizeof(LimeBone));
    char *claimed = (char *)calloc((size_t)num, 1);
    if (!bones || !claimed) { free(bones); free(claimed); free(data); return false; }

    const int slots = rec - 16;
    for (int32_t i = 0; i < num; i++) {
        const uint8_t *p = data + 4 + (long)i * rec;
        /* the int32 at +0 is not a child count and nothing needs it */
        bones[i].x = rd_f32(p + 4);
        bones[i].y = rd_f32(p + 8);
        bones[i].z = rd_f32(p + 12);
        for (int k = 0; k < LIME_BONE_CHILDREN; k++) bones[i].child[k] = -1;
        for (int k = 0; k < slots; k++) {
            int c = (int)(int8_t)p[16 + k];
            if (c < 0) continue;                    /* -1 marks an empty slot */
            if (c >= num) { free(bones); free(claimed); free(data); return false; }
            if (claimed[c]) { free(bones); free(claimed); free(data); return false; }
            claimed[c] = 1;
            bones[i].child[bones[i].num_children++] = c;
        }
    }

    int32_t root = -1;
    for (int32_t i = 0; i < num; i++) {
        if (claimed[i]) continue;
        if (root >= 0) { root = -1; break; }        /* two roots: not a tree */
        root = i;
    }
    free(claimed);
    free(data);
    if (root < 0) { free(bones); return false; }

    out->num_bones = num;
    out->bones = bones;
    out->root = root;
    return true;
}

void lime_bones_free(LimeSkeleton *s)
{
    if (!s) return;
    free(s->bones);
    memset(s, 0, sizeof(*s));
}

/* --------------------------------------------------------------- .skinanim */

bool lime_skinanim_load(const char *path, LimeSkinAnim *out)
{
    memset(out, 0, sizeof(*out));
    long size;
    uint8_t *data = slurp(path, &size);
    if (!data) return false;
    if (size < ANIM_HEADER_ALT) { free(data); return false; }

    /* Read frameSize from the header and never derive it from the .bones
     * file: ROBO1 animates 20 bones against a 25-bone skeleton. */
    float scale = rd_f32(data);
    int32_t frames = rd_i32(data + 4);
    int32_t fsize  = rd_i32(data + 8);
    int32_t header = ANIM_HEADER;

    if (!(frames >= 0 && fsize >= FRAME_FIXED &&
          (long)ANIM_HEADER + (long)frames * fsize == size)) {
        /* the 16-byte variant, whose own frame count reads half the truth */
        scale  = rd_f32(data);
        frames = rd_i32(data + 8);
        fsize  = rd_i32(data + 12);
        header = ANIM_HEADER_ALT;
        if (fsize < FRAME_FIXED || (size - header) % fsize) {
            free(data); return false;
        }
        frames = (int32_t)((size - header) / fsize);
    }

    out->scale = scale;
    out->num_frames = frames;
    out->frame_size = fsize;
    out->num_bones = (fsize - FRAME_FIXED) / BONEANIM_SIZE;
    out->header = header;
    out->data = data;
    out->size = size;
    return true;
}

void lime_skinanim_free(LimeSkinAnim *a)
{
    if (!a) return;
    free(a->data);
    memset(a, 0, sizeof(*a));
}

bool lime_skinanim_frame(const LimeSkinAnim *a, int32_t index,
                         float root[3], float *quats)
{
    if (!a || index < 0 || index >= a->num_frames) return false;
    const uint8_t *p = a->data + a->header + (long)index * a->frame_size;
    root[0] = rd_f32(p + 4);
    root[1] = rd_f32(p + 8);
    root[2] = rd_f32(p + 12);
    for (int32_t b = 0; b < a->num_bones; b++)
        for (int k = 0; k < 4; k++)
            quats[b * 4 + k] = rd_f32(p + FRAME_FIXED + b * BONEANIM_SIZE + k * 4);
    return true;
}

/* -------------------------------------------------------------------- .skin */

static long parse_block(const uint8_t *data, long size, long off,
                        LimeSkinBlock *b)
{
    memset(b, 0, sizeof(*b));
    if (off + 8 > size) return -1;
    int32_t nv = rd_i32(data + off);            /* "num_matrices": vertices */
    int32_t nt = rd_i32(data + off + 4);        /* "num_verts": triangles */
    if (nv < 0 || nt < 0 || nv > 1000000 || nt > 1000000) return -1;
    off += 8;

    const long need = (long)nv * (4 + 8 + 96) + (long)nt * (24 + 6);
    if (off + need > size) return -1;

    b->num_verts = nv;
    b->num_tris = nt;
    b->indexes = (uint32_t *)malloc((size_t)(nv ? nv : 1) * 4);
    b->weights = (float *)malloc((size_t)(nv ? nv : 1) * 4 * sizeof(float));
    b->pos = (float *)malloc((size_t)(nv ? nv : 1) * 12 * sizeof(float));
    b->nrm = (float *)malloc((size_t)(nv ? nv : 1) * 12 * sizeof(float));
    b->tris = (uint16_t *)malloc((size_t)(nt ? nt : 1) * 3 * 2);
    b->uv = (float *)malloc((size_t)(nt ? nt : 1) * 6 * sizeof(float));
    if (!b->indexes || !b->weights || !b->pos || !b->nrm || !b->tris || !b->uv)
        return -1;

    for (int32_t i = 0; i < nv; i++, off += 4)
        b->indexes[i] = rd_u32(data + off);
    for (int32_t i = 0; i < nv * 4; i++, off += 2)
        b->weights[i] = (float)rd_u16(data + off) * WEIGHT_SCALE;
    for (int32_t i = 0; i < nv; i++) {
        /* the entry's first matrix feeds positions, the second normals --
         * the loader allocates them the other way round, which is the trap */
        for (int k = 0; k < 12; k++) b->pos[i * 12 + k] = rd_f32(data + off + k * 4);
        for (int k = 0; k < 12; k++) b->nrm[i * 12 + k] = rd_f32(data + off + 48 + k * 4);
        off += 96;
    }
    for (int32_t t = 0; t < nt; t++) {
        for (int k = 0; k < 6; k++)
            b->uv[t * 6 + k] = rd_f32(data + off + k * 4);
        off += 24;
    }
    for (int32_t t = 0; t < nt; t++) {
        for (int k = 0; k < 3; k++) {
            uint16_t v = rd_u16(data + off + k * 2);
            if (nv && v >= nv) return -1;
            b->tris[t * 3 + k] = v;
        }
        off += 6;
    }
    return off;
}

static void free_blocks(LimeSkinBlock *b, int32_t n)
{
    for (int32_t i = 0; i < n; i++) {
        free(b[i].indexes); free(b[i].weights); free(b[i].pos);
        free(b[i].nrm); free(b[i].tris); free(b[i].uv);
    }
    free(b);
}

bool lime_skin_load(const char *path, LimeSkin *out)
{
    memset(out, 0, sizeof(*out));
    long size;
    uint8_t *data = slurp(path, &size);
    if (!data) return false;
    if (size < 8) { free(data); return false; }

    int32_t count = rd_i32(data);
    LimeSkinBlock *blocks = NULL;
    int32_t nblocks = 0;

    if (count >= 1 && count <= 8) {
        blocks = (LimeSkinBlock *)calloc((size_t)count, sizeof(LimeSkinBlock));
        if (!blocks) { free(data); return false; }
        long off = 4;
        int32_t i = 0;
        for (; i < count; i++) {
            off = parse_block(data, size, off, &blocks[i]);
            if (off < 0) break;
        }
        if (off == size) {
            nblocks = count;
        } else {
            free_blocks(blocks, i < count ? i + 1 : count);
            blocks = NULL;
        }
    }

    if (!blocks) {
        /* ROBO1 and ROBO2 have no leading count -- their first int32 is
         * already the vertex count and the file is one bare block. */
        blocks = (LimeSkinBlock *)calloc(1, sizeof(LimeSkinBlock));
        if (!blocks) { free(data); return false; }
        long off = parse_block(data, size, 0, &blocks[0]);
        if (off != size) { free_blocks(blocks, 1); free(data); return false; }
        nblocks = 1;
    }

    free(data);
    out->num_blocks = nblocks;
    out->blocks = blocks;
    for (int32_t i = 0; i < nblocks; i++) {
        out->total_verts += blocks[i].num_verts;
        out->total_tris += blocks[i].num_tris;
    }
    return true;
}

void lime_skin_free(LimeSkin *s)
{
    if (!s) return;
    free_blocks(s->blocks, s->num_blocks);
    memset(s, 0, sizeof(*s));
}

/* ----------------------------------------------------------- the pipeline */

/* GetMFromQuat2. The quaternion is (x, y, z, w) -- w last. */
static void quat_matrix(const float *q, float *m)
{
    const float x = q[0], y = q[1], z = q[2], w = q[3];
    const float xx = 2*x*x, yy = 2*y*y, zz = 2*z*z;
    const float xy = 2*x*y, xz = 2*x*z, yz = 2*y*z;
    const float wx = 2*w*x, wy = 2*w*y, wz = 2*w*z;
    m[0] = 1 - (yy + zz); m[1] = xy + wz;       m[2] = xz - wy;
    m[3] = xy - wz;       m[4] = 1 - (xx + zz); m[5] = yz + wx;
    m[6] = xz + wy;       m[7] = yz - wx;       m[8] = 1 - (xx + yy);
}

/* out = a * b, both row-major 3x3. */
static void mat_mul(const float *a, const float *b, float *out)
{
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            out[i*3 + j] = a[i*3] * b[j] + a[i*3+1] * b[3+j] + a[i*3+2] * b[6+j];
}

/* out = v * m, the row-vector convention Xform2 uses. */
static void vec_mul(const float *v, const float *m, float *out)
{
    out[0] = v[0]*m[0] + v[1]*m[3] + v[2]*m[6];
    out[1] = v[0]*m[1] + v[1]*m[4] + v[2]*m[7];
    out[2] = v[0]*m[2] + v[1]*m[5] + v[2]*m[8];
}

typedef struct {
    const LimeSkeleton *skel;
    const float *quats;
    int32_t num_quats;
    const float *root_pos;
    LimeSkinMatrix *palette;
    int32_t visited;
} PaletteWalk;

static void palette_recurse(PaletteWalk *w, int32_t bone,
                            const float *parent_r, const float *parent_t)
{
    const int32_t n = w->visited++;
    float r[9];
    if (n < w->num_quats) quat_matrix(w->quats + n * 4, r);
    else { memset(r, 0, sizeof(r)); r[0] = r[4] = r[8] = 1.0f; }

    const LimeBone *b = &w->skel->bones[bone];
    /* the root's translation comes from the animation frame, not the file --
     * the palette walk gates that behind a counter that fires exactly once */
    const float local[3] = { n == 0 ? w->root_pos[0] : b->x,
                             n == 0 ? w->root_pos[1] : b->y,
                             n == 0 ? w->root_pos[2] : b->z };

    LimeSkinMatrix *e = &w->palette[bone];
    mat_mul(r, parent_r, e->m);
    vec_mul(local, parent_r, e->t);
    for (int k = 0; k < 3; k++) e->t[k] += parent_t[k];

    for (int k = 0; k < b->num_children; k++)
        palette_recurse(w, b->child[k], e->m, e->t);
}

void lime_skin_palette(const LimeSkeleton *skel, const float root[3],
                       const float *quats, int32_t num_quats,
                       LimeSkinMatrix *palette)
{
    static const float identity[9] = { 1,0,0, 0,1,0, 0,0,1 };
    static const float zero[3] = { 0, 0, 0 };
    PaletteWalk w;
    w.skel = skel;
    w.quats = quats;
    w.num_quats = num_quats;
    w.root_pos = root;
    w.palette = palette;
    w.visited = 0;
    memset(palette, 0, (size_t)skel->num_bones * sizeof(*palette));
    palette_recurse(&w, skel->root, identity, zero);
}

void lime_skin_pose(const LimeSkin *skin, const LimeSkinMatrix *palette,
                    int32_t num_bones, float *pos, unsigned char *col)
{
    int32_t base = 0;
    for (int32_t bi = 0; bi < skin->num_blocks; bi++) {
        const LimeSkinBlock *b = &skin->blocks[bi];
        for (int32_t i = 0; i < b->num_verts; i++) {
            const uint32_t idx = b->indexes[i];
            const float *a = b->pos + i * 12;
            const float *nb = b->nrm + i * 12;
            const float *w = b->weights + i * 4;
            float p[3] = { 0, 0, 0 }, n[3] = { 0, 0, 0 };

            for (int k = 0; k < 4; k++) {
                /* four packed bone bytes; 0xFF is an unused influence slot */
                const uint32_t bone = (idx >> (8 * k)) & 0xFFu;
                if (bone == 0xFFu || (int32_t)bone >= num_bones) continue;
                const LimeSkinMatrix *m = &palette[bone];
                float o[3];
                /* the influence vectors already carry their weight, so only
                 * the translation term multiplies by w */
                vec_mul(a + k * 3, m->m, o);
                for (int c = 0; c < 3; c++) p[c] += o[c] + w[k] * m->t[c];
                vec_mul(nb + k * 3, m->m, o);
                for (int c = 0; c < 3; c++) n[c] += o[c];
            }

            if (pos) {
                pos[(base + i) * 3 + 0] = p[0];
                pos[(base + i) * 3 + 1] = p[1];
                pos[(base + i) * 3 + 2] = p[2];
            }
            if (col) {
                const float len = sqrtf(n[0]*n[0] + n[1]*n[1] + n[2]*n[2]);
                /* vertex colour IS the lit skinned normal: monochrome, and
                 * the only shading these characters have */
                const float l = (len < 1e-12f)
                    ? 0.5f
                    : lime_light_vert(n[0]/len, n[1]/len, n[2]/len);
                unsigned char g = (unsigned char)(l * 255.0f + 0.5f);
                col[(base + i) * 3 + 0] = g;
                col[(base + i) * 3 + 1] = g;
                col[(base + i) * 3 + 2] = g;
            }
        }
        base += b->num_verts;
    }
}

int32_t lime_skinanim_idle(const LimeSkinAnim *a, const LimeSkeleton *skel,
                           int32_t step)
{
    if (!a || !skel || a->num_frames <= 0) return -1;
    if (step < 1) step = 1;
    const int32_t nb = skel->num_bones;
    const int32_t nsamples = (a->num_frames + step - 1) / step;
    const size_t dim = (size_t)nb * 3;

    float *feat = (float *)malloc((size_t)nsamples * dim * sizeof(float));
    float *mean = (float *)calloc(dim, sizeof(float));
    float *quats = (float *)malloc((size_t)(a->num_bones ? a->num_bones : 1)
                                   * 4 * sizeof(float));
    LimeSkinMatrix *pal = (LimeSkinMatrix *)malloc((size_t)nb * sizeof(*pal));
    if (!feat || !mean || !quats || !pal) {
        free(feat); free(mean); free(quats); free(pal); return -1;
    }

    for (int32_t s = 0; s < nsamples; s++) {
        float root[3];
        lime_skinanim_frame(a, s * step, root, quats);
        lime_skin_palette(skel, root, quats, a->num_bones, pal);
        /* relative to the root, so a character travelling across the stage
         * does not read as a different pose */
        float *f = feat + (size_t)s * dim;
        for (int32_t i = 0; i < nb; i++)
            for (int c = 0; c < 3; c++)
                f[i * 3 + c] = pal[i].t[c] - pal[skel->root].t[c];
        for (size_t k = 0; k < dim; k++) mean[k] += f[k];
    }
    for (size_t k = 0; k < dim; k++) mean[k] /= (float)nsamples;

    /* every animation departs from the stance and returns to it, so the frame
     * closest to the mean of the stream is the stance */
    int32_t best = 0;
    double best_d = -1.0;
    for (int32_t s = 0; s < nsamples; s++) {
        const float *f = feat + (size_t)s * dim;
        double d = 0.0;
        for (size_t k = 0; k < dim; k++) {
            const double e = f[k] - mean[k];
            d += e * e;
        }
        if (best_d < 0.0 || d < best_d) { best_d = d; best = s * step; }
    }

    free(feat); free(mean); free(quats); free(pal);
    return best;
}
