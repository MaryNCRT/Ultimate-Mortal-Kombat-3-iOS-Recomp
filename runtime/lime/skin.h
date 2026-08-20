/*
 * Characters: .bones, .skinanim, .skin, and the skinning itself.
 *
 * The formats are docs/SKIN-FORMAT.md; the arithmetic is the verified
 * decompilation in decomp/lime/RenderSkinned.c -- GetMFromQuat2,
 * CreateMatrixPaletteRecurse2, Xform2, DrawSkinnedMesh2. tools/pose.py is the
 * same pipeline in Python and is what this is checked against.
 *
 * Three things here are counter-intuitive and are properties of the data, not
 * of this port:
 *
 *   - a block's `num_matrices` is a VERTEX count and its `num_verts` is a
 *     TRIANGLE count. The names come from the loader's own buffer tags;
 *     the meanings come from the render loop.
 *   - a vertex's four influence vectors are already scaled by their weight, so
 *     only the translation term multiplies by w.
 *   - the palette is walked depth-first and consumes one animation entry per
 *     bone VISITED, so frames are indexed by visit order, not by bone index.
 */
#ifndef LIME_SKIN_H
#define LIME_SKIN_H

#include <stdbool.h>
#include <stdint.h>

#define LIME_BONE_CHILDREN 9        /* eight in the ROBO variant */

typedef struct {
    float x, y, z;                  /* offset from the parent */
    int   child[LIME_BONE_CHILDREN];/* -1 = empty slot; slots are not packed */
    int   num_children;
} LimeBone;

typedef struct {
    int32_t   num_bones;
    int32_t   root;
    LimeBone *bones;
} LimeSkeleton;

/* One palette entry, in the shape Xform2 reads: a row-major 3x3 and a
 * translation. SKINMATRIX43's rotation stride is 3, not 4. */
typedef struct {
    float m[9];
    float t[3];
} LimeSkinMatrix;

typedef struct {
    float    scale;
    int32_t  num_frames;
    int32_t  frame_size;
    int32_t  num_bones;             /* (frame_size - 16) / 20 */
    int32_t  header;                /* 12, or 16 for the SINDEL variant */
    uint8_t *data;
    long     size;
} LimeSkinAnim;

typedef struct {
    int32_t   num_verts;            /* the header's num_matrices */
    int32_t   num_tris;             /* the header's num_verts */
    uint32_t *indexes;              /* num_verts, four packed bone bytes each */
    float    *weights;              /* num_verts * 4 */
    float    *pos;                  /* num_verts * 12: four weighted vec3 */
    float    *nrm;                  /* num_verts * 12 */
    uint16_t *tris;                 /* num_tris * 3 indices into pos */
    float    *uv;                   /* num_tris * 6, one pair per corner */
} LimeSkinBlock;

typedef struct {
    int32_t        num_blocks;
    LimeSkinBlock *blocks;
    int32_t        total_verts;
    int32_t        total_tris;
} LimeSkin;

bool lime_bones_load(const char *path, LimeSkeleton *out);
void lime_bones_free(LimeSkeleton *s);

bool lime_skinanim_load(const char *path, LimeSkinAnim *out);
void lime_skinanim_free(LimeSkinAnim *a);

bool lime_skin_load(const char *path, LimeSkin *out);
void lime_skin_free(LimeSkin *s);

/* Root position and the quaternion of every bone in one frame. `quats` must
 * hold anim->num_bones * 4 floats. */
bool lime_skinanim_frame(const LimeSkinAnim *a, int32_t index,
                         float root[3], float *quats);

/* CreateMatrixPaletteRecurse2: one LimeSkinMatrix per bone, depth-first, the
 * root taking its translation from the frame rather than from the skeleton.
 * `palette` must hold skel->num_bones entries; bones past the animation's own
 * bone count fall back to identity, which is what ROBO1 and ROBO2 need. */
void lime_skin_palette(const LimeSkeleton *skel, const float root[3],
                       const float *quats, int32_t num_quats,
                       LimeSkinMatrix *palette);

/* DrawSkinnedMesh2: positions and lit vertex colours for the whole skin.
 * `pos` takes total_verts * 3 floats, `col` total_verts * 3 bytes; either may
 * be NULL. Lighting is the engine's own -- monochrome, from the skinned
 * normal, which is where a character's shading comes from. */
void lime_skin_pose(const LimeSkin *skin, const LimeSkinMatrix *palette,
                    int32_t num_bones, float *pos, unsigned char *col);

/* The resting stance, as tools/pose.py finds it: the medoid frame. Frame 0 is
 * not the stance -- a .skinanim is every animation the character has, end to
 * end, so frame 0 is whatever happens to come first. `step` samples the
 * stream; 1 is every frame. Returns -1 if it cannot be computed. */
int32_t lime_skinanim_idle(const LimeSkinAnim *a, const LimeSkeleton *skel,
                           int32_t step);

#endif
