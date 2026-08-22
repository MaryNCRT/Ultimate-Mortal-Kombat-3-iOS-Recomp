/*
 * demo.c — a character, animated, on a stage, lit by the engine's own lighting.
 *
 * This is the first thing in this project that puts the recovered pieces
 * together and moves. Everything it draws comes from formats this repository
 * specified and code it verified:
 *
 *     .bones      the skeleton                    docs/SKIN-FORMAT.md
 *     .skin       influences, topology, UVs       docs/SKIN-FORMAT.md
 *     .skinanim   one quaternion per bone, per frame
 *     .meshset    the stage geometry              docs/MESHSET-FORMAT.md
 *     .lighting   per-vertex light for the stage  docs/LIGHTING.md
 *     PVRTC       every texture                   docs/PVR-FORMAT.md
 *
 * No emulator, no engine binary, no asset shipped with this repository.
 *
 *     demo <res dir> [character] [stage] [--from N --to M]
 *
 * Defaults to SUBZERO_STANDARD on GRAVEYARD_LEVEL_SCENE playing SZSTANCE, which is
 * frames 140..149 -- found with `python tools/animate.py SUBZERO_STANDARD
 * --list`, which names every clip from res/framelists/.
 *
 * ## About the shadow
 *
 * **The shadow here is not the engine's.** The binary has a shadow FLAG --
 * `clear_shadow_bit` clears bit 0x10 of a per-object flags word, and
 * `_ShadowOffset` and `_ShadowHeightFromGround` are real globals -- but there
 * is no shadow renderer anywhere in the symbol table, and no mesh named SHADOW
 * in any of the shipped meshsets. So what the original did with those three
 * symbols is not established.
 *
 * What this draws instead is the character flattened onto the ground plane in
 * black: the cheap projected shadow a 2011 mobile fighter would plausibly have
 * used, positioned with the two globals' names in mind. It is dressing, it is
 * labelled as dressing, and it should be replaced the moment somebody finds
 * what actually reads those globals.
 */
#include "platform/platform.h"
#include "platform/gl.h"
#include "lime/meshset.h"
#include "lime/scene.h"
#include "lime/skin.h"
#include "lime/light.h"
#include "lime/pvr.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WIN_W 1280
#define WIN_H 720

/* SZSTANCE. See the header. */
#define IDLE_FROM 140
#define IDLE_TO   149

/* How long one animation frame is held. The game runs its animation at a
 * divisor of the display rate and `next_anirate` is what advances it; that
 * function is not decompiled, so this is a chosen tempo and not a recovered
 * one. Ten frames at 12 Hz is a breathing idle. */
#define IDLE_HZ   12.0

typedef struct {
    LimeMeshSet ms;
    GLuint     *tex;
    LimeScene   sc;             /* the scene graph: what goes where */
    int         has_scene;
    int         loaded;
} StageGeom;

static StageGeom g_stage;

/* **This used to be 170.0f, a number picked by eye. It is now 1.0.**
 *
 * Two separate things were wrong, and each one alone looks like "the stage is\n* the wrong size":
 *
 *   1. The `.meshset` loader divided vertex positions by a flat 32767, a
 *      figure fitted to land the shipped data in [-1,1]. The original divides
 *      by the mesh's OWN `boundsRadius` -- Graveyard carries 316.2 on its
 *      gravestones, 23.1 on its ground and 16.4 on its moon -- so a flat
 *      divisor renders every object at the same size and none at the right
 *      one. Fixed in runtime/lime/meshset.c.
 *
 *   2. Nothing placed the objects. A stage `.meshset` holds its pieces in
 *      LOCAL space and the `.scene` positions them; this demo drew all 58 at
 *      the origin. Fixed by walking the scene graph below.
 *
 * With both corrected the units come out right on their own: a gravestone is
 * 74 wide and 104 tall, the ground plane is 2,839 across and flat, and the
 * fighter is 106 tall. `scene->scale` -- the field LIME_RenderScene hands to
 * glScalef -- is 1.0 for Graveyard, which is what LIME_LoadScene stores at
 * SCENEINFO+0x60 (`mov.w r3, #0x3f800000`) when no `.offsets` overrides it.
 *
 * `--stage-scale N` still overrides, for inspection. */
static float g_stage_scale = 1.0f;

/* Which frame of the scene's visibility stream to show. Graveyard carries
 * 1,001 of them; a stage is static and frame 0 is the arena. */
static int g_stage_frame = 0;

/* The reference is a side-on view -- the camera the game itself uses. The
 * orbit is an inspection aid, not the shot. */
static int g_orbit = 0;

/* --list: report what every scene node resolved to. */
static int g_list = 0;

/* How far the stage actually reaches, in world units, measured at load.
 *
 * The far plane used to be derived from the CHARACTER's size (radius * 60,
 * about 6,400 units). Graveyard's moon sits at z = -27,483 and its sky plane
 * at -28,629, so both fell outside the frustum and simply were not there. A
 * stage decides how far the camera must see, not the fighter standing in it. */
static float g_stage_reach = 0.0f;

static LimeSkeleton g_sk;
static LimeSkin     g_skin;
static LimeAnim     g_anim;
static GLuint       g_char_tex;

static float         *g_pos;        /* skinned positions, N*3 */
static unsigned char *g_lit;        /* one grey per skinned vertex */

/* the expanded triangle list: three corners, each with its own UV */
static float         *g_vb;         /* M*3 * 3 floats */
static float         *g_tb;         /* M*3 * 2 floats */
static unsigned char *g_cb;         /* M*3 * 3 bytes */
static long           g_tri_count;

/* ------------------------------------------------------------- textures */

static GLuint upload(const char *res_dir, const char *tex_name)
{
    LimeImage img;
    GLuint id = 0;

    if (!lime_texture_load(res_dir, tex_name, &img)) return 0;

    glGenTextures(1, &id);
    glBindTexture(GL_TEXTURE_2D, id);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    /* Rows go up exactly as decoded. The game's UVs are authored for this data
     * as it stands; flipping here breaks textures that were already right. */
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, img.width, img.height, 0,
                 GL_RGBA, GL_UNSIGNED_BYTE, img.rgba);
    lime_image_free(&img);
    return id;
}

/* ------------------------------------------------------------- the stage */

/* Stands in for LIME_FindMeshByName, which the scene loader calls with each
 * object's name to bind a graph node to geometry. The original returns -1 on a
 * miss and the caller narrows it to a byte, so 0xFF is "no mesh". */
static int stage_find_mesh(const char *name, void *user)
{
    LimeMeshSet *ms = (LimeMeshSet *)user;
    int i;

    for (i = 0; i < ms->num_meshes; i++)
        if (strcmp(ms->meshes[i].name, name) == 0)
            return i;
    return -1;
}

static int is_event_marker(const char *n);

static int stage_load(const char *res_dir, const char *name)
{
    char path[1024];
    int32_t i;

    snprintf(path, sizeof(path), "%s/%s.meshset", res_dir, name);
    if (!lime_meshset_load(path, &g_stage.ms)) {
        printf("  stage: could not parse %s\n", path);
        return 0;
    }

    g_stage.tex = (GLuint *)calloc((size_t)g_stage.ms.num_meshes, sizeof(GLuint));
    if (!g_stage.tex) return 0;
    for (i = 0; i < g_stage.ms.num_meshes; i++)
        g_stage.tex[i] = upload(res_dir, g_stage.ms.meshes[i].texture);

    /* The scene graph. Without it every mesh sits at the origin, which is what
     * this demo did before and it looks exactly like a broken stage. */
    snprintf(path, sizeof(path), "%s/%s.scene", res_dir, name);
    g_stage.has_scene = lime_scene_load(path, &g_stage.sc,
                                        stage_find_mesh, &g_stage.ms);

    /* Measure the placed geometry: the far plane depends on it. */
    if (g_stage.has_scene) {
        int32_t n, v;
        for (n = 0; n < g_stage.sc.num_nodes; n++) {
            const LimeSceneKey *k = lime_scene_key(&g_stage.sc, (int)n, g_stage_frame);
            const LimeMesh *m;
            float mat[16];
            if (!k || k->mesh_index == 0xFF ||
                k->mesh_index >= g_stage.ms.num_meshes) continue;
            if (k->palette_index >= g_stage.sc.palette_size) continue;
            m = &g_stage.ms.meshes[k->mesh_index];
            if (m->vert_count <= 0 || is_event_marker(m->name)) continue;
            lime_qst_matrix(&g_stage.sc.palette[k->palette_index], mat);
            for (v = 0; v < m->vert_count; v++) {
                const float *sv = &m->verts[v].x;
                int a;
                for (a = 0; a < 3; a++) {
                    float w = mat[a] * sv[0] + mat[4 + a] * sv[1] +
                              mat[8 + a] * sv[2] + mat[12 + a];
                    if (w < 0.0f) w = -w;
                    if (w > g_stage_reach) g_stage_reach = w;
                }
            }
        }
        printf("  stage reach: %.0f world units\n", g_stage_reach);
    }

    if (g_list) {
        int32_t n;
        printf("  node                 mesh             texture                   tex alpha\n");
        for (n = 0; n < g_stage.sc.num_nodes; n++) {
            const LimeSceneKey *k = lime_scene_key(&g_stage.sc, (int)n, g_stage_frame);
            const LimeMesh *m;
            if (!k || k->mesh_index == 0xFF) {
                printf("  %-20s (hidden)\n", g_stage.sc.nodes[n].name);
                continue;
            }
            m = &g_stage.ms.meshes[k->mesh_index];
            printf("  %-20s %-16s %-24s %3u %.2f%s\n",
                   g_stage.sc.nodes[n].name, m->name, m->texture,
                   (unsigned)g_stage.tex[k->mesh_index], k->alpha,
                   g_stage.tex[k->mesh_index] ? "" : "   <-- NO TEXTURE");
        }
    }

    g_stage.loaded = 1;
    printf("  stage: %s, %d meshes", name, g_stage.ms.num_meshes);
    if (g_stage.has_scene)
        printf(", %d scene nodes, %d palette matrices, scale %.3f\n",
               g_stage.sc.num_nodes, g_stage.sc.palette_size, g_stage.sc.scale);
    else
        printf(" -- NO .scene, drawing unplaced\n");
    return 1;
}

/* One mesh, with the client state and the matrix already set up. */
static void stage_draw_mesh(const LimeMesh *m)
{
    glVertexPointer(3, GL_FLOAT, sizeof(LimeVertex), &m->verts[0].x);
    glTexCoordPointer(2, GL_FLOAT, sizeof(LimeVertex), &m->verts[0].u);

    if (m->indices)
        glDrawElements(GL_TRIANGLES, m->num_faces * 3,
                       GL_UNSIGNED_SHORT, m->indices);
    else
        glDrawArrays(GL_TRIANGLES, 0, m->vert_count);
}

/* True for the markers LIME_RenderScene branches past. These are spawn points
 * for effects, not geometry; drawing them fills the screen with white
 * NOTEXTURE polygons. The engine tests the MESH's name, five letters, and
 * Graveyard ships several. */
static int is_event_marker(const char *n)
{
    return n[0] == 'E' && n[1] == 'V' && n[2] == 'E' && n[3] == 'N' && n[4] == 'T';
}

/*
 * **The engine picks its blend mode from the mesh's NAME.**
 *
 * LIME_RenderScene tests the first letters of the mesh name and branches to a
 * different GL state for each, at 0x0005fa0e onward:
 *
 *      name[0..4] == "ALPHA"   0x5fc08: cmp 0x50 'P', 0x48 'H', 0x41 'A'
 *          _limeEnableAlphaBlending_Basic
 *          _limeDisableDepthWrites
 *
 *      name[0..3] == "ATST"    0x5fc4a: cmp 0x54 'T', 0x53 'S', 0x54 'T'
 *          _limeDisableAlphaBlending
 *          glAlphaFunc(0x204, 0x3f666666)   -- GL_GREATER, 0.9f
 *          glEnable(0xbc0)                  -- GL_ALPHA_TEST
 *
 *      name[0..4] == "EVENT"   not drawn at all
 *
 * That single glAlphaFunc call is the ONLY one in the armv7 slice -- found by
 * decoding every Thumb BL and BLX in the binary and checking the target
 * against the import stub, which turned up exactly one caller.
 *
 * `ATST` is `A`lpha `T`e`ST`, and it is not a curiosity: Graveyard's cutout
 * foliage is named ATST_tree003..009 and ATST_Grass..003, and their textures
 * are 62% and 71% transparent. Without the rule those two draw opaque and put
 * white cards across the middle of the stage -- which is exactly what they did
 * before this was found.
 */
static int is_atst(const char *n)
{
    return n[0] == 'A' && n[1] == 'T' && n[2] == 'S' && n[3] == 'T';
}

static int is_alpha_material(const char *n)
{
    return n[0] == 'A' && n[1] == 'L' && n[2] == 'P' && n[3] == 'H' &&
           n[4] == 'A';
}

static void stage_bind(int idx, float alpha)
{
    if (g_stage.tex[idx]) {
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, g_stage.tex[idx]);
        glColor4f(1.0f, 1.0f, 1.0f, alpha);
    } else {
        /* **220 of the 1,620 textures are PNG, and the loader only reads
         * PVRTC.** The big stage atlases are the PNG ones -- Graveyard's is
         * GRAVEYARD_COMPLETEMAP.PNG, 1024x1024 RGBA. Until there is a PNG path
         * these meshes have no texture, and leaving them at GL's default white
         * makes them the brightest thing on screen. Dark grey says "missing"
         * instead of shouting it. */
        glDisable(GL_TEXTURE_2D);
        glColor4f(0.16f, 0.16f, 0.18f, alpha);
    }
}

/*
 * The scene walk, following LIME_RenderScene's own order:
 *
 *      glScalef(scene->scale, ...)              -- SCENEINFO+0x60
 *      for each node:
 *          key = keys[ stream[frame] ]          -- 0xFFFF means hidden
 *          skip meshes named EVENT*
 *          alpha == 1.0 -> blending off, depth writes on
 *          ConvertQSTMatrixtoPCMatrix(palette[key->paletteIndex]) ; glMultMatrixf
 *          LIME_RenderMesh
 *
 * The palette index comes from the KEY (`ldrh r0, [r5, #6]`), not from the
 * frame -- see docs/RENDERSCENE-SIGNATURE.md.
 */
static void stage_draw(int frame)
{
    int32_t n;

    if (!g_stage.loaded) return;

    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);

    glPushMatrix();
    glScalef(g_stage_scale, g_stage_scale, g_stage_scale);

    if (!g_stage.has_scene) {
        /* No scene graph: everything at the origin. Wrong, and visibly so, but
         * better than drawing nothing. */
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        for (n = 0; n < g_stage.ms.num_meshes; n++) {
            const LimeMesh *m = &g_stage.ms.meshes[n];
            if (m->vert_count <= 0 || is_event_marker(m->name)) continue;
            stage_bind((int)n, 1.0f);
            stage_draw_mesh(m);
        }
        glDisable(GL_BLEND);
    } else {
        glScalef(g_stage.sc.scale, g_stage.sc.scale, g_stage.sc.scale);

        for (n = 0; n < g_stage.sc.num_nodes; n++) {
            const LimeSceneKey *key = lime_scene_key(&g_stage.sc, (int)n, frame);
            const LimeMesh *m;
            float mat[16];
            int idx;

            if (!key) continue;                     /* hidden on this frame */

            idx = (int)key->mesh_index;
            if (idx == 0xFF || idx >= g_stage.ms.num_meshes) continue;
            if (key->palette_index >= g_stage.sc.palette_size) continue;

            m = &g_stage.ms.meshes[idx];
            if (m->vert_count <= 0 || is_event_marker(m->name)) continue;

            /* The engine's rule, and the threshold differs between its two
             * renderers: the opaque one tests 1.0, LIME_RenderScene tests 0.97.
             * An opaque node turns blending off and depth writes on and then
             * draws anyway -- it does not skip. */
            /* The name rule first -- it is the material -- then the key's
             * own alpha. SRC_ALPHA / ONE_MINUS_SRC_ALPHA is not a guess: it is
             * what limeEnableAlphaBlending_Basic was MEASURED to do, by
             * driving the recompiled original and recording the GL call
             * stream. See docs/RENDERSCENE-SIGNATURE.md. */
            if (is_alpha_material(m->name)) {
                glDisable(GL_ALPHA_TEST);
                glEnable(GL_BLEND);
                glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
                glDepthMask(GL_FALSE);
            } else if (is_atst(m->name)) {
                glDisable(GL_BLEND);
                glAlphaFunc(GL_GREATER, 0.9f);
                glEnable(GL_ALPHA_TEST);
                glDepthMask(GL_TRUE);
            } else if (key->alpha >= 1.0f) {
                glDisable(GL_ALPHA_TEST);
                glDisable(GL_BLEND);
                glDepthMask(GL_TRUE);
            } else {
                glDisable(GL_ALPHA_TEST);
                glEnable(GL_BLEND);
                glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
                glDepthMask(GL_FALSE);
            }

            stage_bind(idx, key->alpha);

            glPushMatrix();
            lime_qst_matrix(&g_stage.sc.palette[key->palette_index], mat);
            glMultMatrixf(mat);
            stage_draw_mesh(m);
            glPopMatrix();
        }
        glDepthMask(GL_TRUE);
        glDisable(GL_BLEND);
        glDisable(GL_ALPHA_TEST);
    }

    glPopMatrix();
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);

    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisableClientState(GL_VERTEX_ARRAY);
}

/* --------------------------------------------------------- the character */

static int character_load(const char *res_dir, const char *name)
{
    char path[1024];
    LimeMeshSet ms;
    const LimeSkinBlock *b;

    snprintf(path, sizeof(path), "%s/%s.bones", res_dir, name);
    if (!lime_bones_load(path, &g_sk)) { printf("  no .bones\n"); return 0; }

    snprintf(path, sizeof(path), "%s/%s.skin", res_dir, name);
    if (!lime_skin_load(path, &g_skin)) { printf("  no .skin\n"); return 0; }

    snprintf(path, sizeof(path), "%s/%s.skinanim", res_dir, name);
    if (!lime_anim_load(path, &g_anim)) { printf("  no .skinanim\n"); return 0; }

    b = &g_skin.block[0];
    printf("  %s: %d bones, %d skinned verts, %d tris, %d anim frames\n",
           name, g_sk.count, b->num_matrices, b->num_verts, g_anim.num_frames);

    /* The body texture is named by mesh 0 of the character's own meshset --
     * the .skin does not carry one. */
    snprintf(path, sizeof(path), "%s/%s.meshset", res_dir, name);
    if (lime_meshset_load(path, &ms)) {
        if (ms.num_meshes > 0) {
            g_char_tex = upload(res_dir, ms.meshes[0].texture);
            printf("  texture: %s%s\n", ms.meshes[0].texture,
                   g_char_tex ? "" : "  (not decoded)");
        }
        lime_meshset_free(&ms);
    }

    g_tri_count = b->num_verts;
    g_pos = (float *)malloc((size_t)b->num_matrices * 3 * sizeof(float));
    g_lit = (unsigned char *)malloc((size_t)b->num_matrices);
    g_vb  = (float *)malloc((size_t)g_tri_count * 9 * sizeof(float));
    g_tb  = (float *)malloc((size_t)g_tri_count * 6 * sizeof(float));
    g_cb  = (unsigned char *)malloc((size_t)g_tri_count * 9);
    return g_pos && g_lit && g_vb && g_tb && g_cb;
}

/* Expand the indexed skinned positions into a plain triangle list, because the
 * UVs are stored PER CORNER: a shared vertex appears in several triangles and
 * carries the same UV each time, but there is no single UV per position to put
 * in an indexed buffer. */
static void character_build(void)
{
    const LimeSkinBlock *b = &g_skin.block[0];
    long t;

    for (t = 0; t < g_tri_count; t++) {
        int c;
        for (c = 0; c < 3; c++) {
            unsigned v = b->tri[t * 3 + c];
            long o = t * 3 + c;
            if ((int)v >= b->num_matrices) v = 0;

            g_vb[o * 3 + 0] = g_pos[v * 3 + 0];
            g_vb[o * 3 + 1] = g_pos[v * 3 + 1];
            g_vb[o * 3 + 2] = g_pos[v * 3 + 2];

            g_tb[o * 2 + 0] = b->uv[t * 6 + c * 2 + 0];
            g_tb[o * 2 + 1] = b->uv[t * 6 + c * 2 + 1];

            g_cb[o * 3 + 0] = g_cb[o * 3 + 1] = g_cb[o * 3 + 2] = g_lit[v];
        }
    }
}

static void character_draw(int as_shadow, float ground_y)
{
    glEnableClientState(GL_VERTEX_ARRAY);

    if (as_shadow) {
        /* NOT the engine's shadow -- see the file header. The character is
         * squashed onto the ground plane and drawn flat black, blended. */
        glDisable(GL_TEXTURE_2D);
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        glDisableClientState(GL_COLOR_ARRAY);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        glDepthMask(GL_FALSE);
        glColor4f(0.0f, 0.0f, 0.0f, 0.45f);

        glPushMatrix();
        glTranslatef(0.0f, ground_y, 0.0f);
        glScalef(1.0f, 0.0f, 1.0f);         /* flatten */
        glVertexPointer(3, GL_FLOAT, 0, g_vb);
        glDrawArrays(GL_TRIANGLES, 0, (GLsizei)(g_tri_count * 3));
        glPopMatrix();

        glDepthMask(GL_TRUE);
        glDisable(GL_BLEND);
        glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
    } else {
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
        glEnableClientState(GL_COLOR_ARRAY);

        if (g_char_tex) {
            glEnable(GL_TEXTURE_2D);
            glBindTexture(GL_TEXTURE_2D, g_char_tex);
        } else {
            glDisable(GL_TEXTURE_2D);
        }

        glVertexPointer(3, GL_FLOAT, 0, g_vb);
        glTexCoordPointer(2, GL_FLOAT, 0, g_tb);
        glColorPointer(3, GL_UNSIGNED_BYTE, 0, g_cb);
        glDrawArrays(GL_TRIANGLES, 0, (GLsizei)(g_tri_count * 3));

        glDisableClientState(GL_COLOR_ARRAY);
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    }

    glDisableClientState(GL_VERTEX_ARRAY);
}

/* ------------------------------------------------------------------ main */

static void perspective(float fovy, float aspect, float zn, float zf)
{
    float f = 1.0f / tanf(fovy * 3.14159265f / 360.0f);
    float m[16];
    memset(m, 0, sizeof(m));
    m[0] = f / aspect;
    m[5] = f;
    m[10] = (zf + zn) / (zn - zf);
    m[11] = -1.0f;
    m[14] = 2.0f * zf * zn / (zn - zf);
    glLoadMatrixf(m);
}

/* Grab the framebuffer to a PPM. There is no way to claim a renderer works
 * without looking at what it drew, and a window nobody can see is not
 * evidence. `--shot out.ppm` renders one frame and exits. */
static void screenshot(const char *path, int w, int h)
{
    unsigned char *px = (unsigned char *)malloc((size_t)w * h * 3);
    FILE *fh;
    int y;

    if (!px) return;
    glPixelStorei(GL_PACK_ALIGNMENT, 1);
    glReadPixels(0, 0, w, h, GL_RGB, GL_UNSIGNED_BYTE, px);

    fh = fopen(path, "wb");
    if (!fh) { free(px); return; }
    fprintf(fh, "P6\n%d %d\n255\n", w, h);
    /* GL row 0 is the bottom; PPM row 0 is the top */
    for (y = h - 1; y >= 0; y--)
        fwrite(px + (size_t)y * w * 3, 1, (size_t)w * 3, fh);
    fclose(fh);
    free(px);
    printf("  wrote %s (%dx%d)\n", path, w, h);
}

int main(int argc, char **argv)
{
    /* Positional arguments are the ones that are not flags and are not a
     * flag's value. Taking argv[2] blindly made `demo <res> --shot x.ppm` look
     * for a character called "--shot". */
    const char *res = NULL;
    const char *chr = "SUBZERO_STANDARD";
    const char *stg = "GRAVEYARD_LEVEL_SCENE";
    int from = IDLE_FROM, to = IDLE_TO;
    int i;
    float lo[3], hi[3], centre[3], radius;
    double t0;

    const char *shot = NULL;
    double shot_at = 0.0;
    int npos = 0;

    for (i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--from") && i + 1 < argc) from = atoi(argv[++i]);
        else if (!strcmp(argv[i], "--to") && i + 1 < argc) to = atoi(argv[++i]);
        else if (!strcmp(argv[i], "--shot") && i + 1 < argc) shot = argv[++i];
        else if (!strcmp(argv[i], "--at") && i + 1 < argc) shot_at = atof(argv[++i]);
        else if (!strcmp(argv[i], "--stage-scale") && i + 1 < argc)
            g_stage_scale = (float)atof(argv[++i]);
        else if (!strcmp(argv[i], "--scene-frame") && i + 1 < argc)
            g_stage_frame = atoi(argv[++i]);
        else if (!strcmp(argv[i], "--orbit")) g_orbit = 1;
        else if (!strcmp(argv[i], "--list")) g_list = 1;
        else if (argv[i][0] != '-') {
            if (!res)      res = argv[i];
            else if (npos == 0) { chr = argv[i]; npos = 1; }
            else if (npos == 1) { stg = argv[i]; npos = 2; }
        }
    }

    if (!res) {
        printf("usage: %s <res dir> [character] [stage] [--from N --to M]\n",
               argv[0]);
        printf("  res dir is Payload/UMK3.app/res from your own copy.\n");
        return 1;
    }

    printf("UMK3 demo -- everything below is read from your own copy\n");
    lime_light_init();

    if (!plat_open("UMK3 - decompilation demo", WIN_W, WIN_H)) {
        printf("could not open a window\n");
        return 1;
    }

    if (!character_load(res, chr)) { plat_close(); return 1; }
    stage_load(res, stg);

    if (from < 0) from = 0;
    if (to >= g_anim.num_frames) to = g_anim.num_frames - 1;
    if (to < from) to = from;
    printf("  playing frames %d..%d at %.0f Hz\n", from, to, IDLE_HZ);

    /* One pose up front, to frame the camera on the character rather than on
     * whatever the stage's extents happen to be. */
    {
        LimePalette pal[LIME_MAX_BONES];
        lime_pose(&g_sk, &g_anim, from, from, 0.0f, pal);
        lime_skin_apply(&g_skin.block[0], pal, g_sk.count, g_pos, g_lit);
        character_build();
    }

    for (i = 0; i < 3; i++) { lo[i] = 1e30f; hi[i] = -1e30f; }
    for (i = 0; i < (int)(g_tri_count * 3); i++) {
        int c;
        for (c = 0; c < 3; c++) {
            float v = g_vb[i * 3 + c];
            if (v < lo[c]) lo[c] = v;
            if (v > hi[c]) hi[c] = v;
        }
    }
    for (i = 0; i < 3; i++) centre[i] = (lo[i] + hi[i]) * 0.5f;
    radius = 0.0f;
    for (i = 0; i < 3; i++) {
        float d = (hi[i] - lo[i]) * 0.5f;
        if (d > radius) radius = d;
    }
    if (radius < 1e-4f) radius = 1.0f;
    printf("  character bounds: %.1f  centre (%.1f %.1f %.1f)\n",
           radius, centre[0], centre[1], centre[2]);

    glEnable(GL_DEPTH_TEST);
    glDisable(GL_CULL_FACE);
    /* GL_FLAT, not GL's default GL_SMOOTH. docs/ENCARGO.md records this as a
     * real difference: leaving the default gives softer shading everywhere
     * than the original produces. */
    glShadeModel(GL_FLAT);
    glClearColor(0.05f, 0.05f, 0.07f, 1.0f);

    t0 = plat_time();

    while (plat_poll()) {
        int w, h, span, fa, fb;
        double now = shot ? shot_at : (plat_time() - t0);
        double pos;
        float frac, ang;
        LimePalette pal[LIME_MAX_BONES];

        plat_size(&w, &h);
        if (h <= 0) h = 1;
        glViewport(0, 0, w, h);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        /* advance the clip, looping */
        span = to - from + 1;
        pos  = now * IDLE_HZ;
        fa   = from + (int)fmod(pos, (double)span);
        fb   = from + (int)fmod(pos + 1.0, (double)span);
        frac = (float)(pos - floor(pos));

        lime_pose(&g_sk, &g_anim, fa, fb, frac, pal);
        lime_skin_apply(&g_skin.block[0], pal, g_sk.count, g_pos, g_lit);
        character_build();

        glMatrixMode(GL_PROJECTION);
        {
            /* Near is set off the fighter, far off the stage. Graveyard needs
             * 30,000 units of depth for its sky and about 5 for the near
             * plane, and one number cannot serve both. */
            float zfar = radius * 60.0f;
            if (g_stage_reach * 1.2f > zfar) zfar = g_stage_reach * 1.2f;
            perspective(45.0f, (float)w / (float)h, radius * 0.2f, zfar);
        }

        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        ang = g_orbit ? (float)(now * 12.0) : 0.0f;
        glTranslatef(0.0f, -radius * 0.30f, -radius * 3.6f);
        glRotatef(6.0f, 1.0f, 0.0f, 0.0f);
        glRotatef(ang, 0.0f, 1.0f, 0.0f);
        glTranslatef(-centre[0], -centre[1], -centre[2]);

        stage_draw(g_stage_frame);
        character_draw(1, lo[1]);       /* the dressing shadow, see the header */
        character_draw(0, 0.0f);

        if (shot) {
            /* one frame, at a chosen moment in the clip, then out */
            glFinish();
            screenshot(shot, w, h);
            break;
        }

        if (!plat_swap()) break;
    }

    plat_close();
    lime_bones_free(&g_sk);
    lime_skin_free(&g_skin);
    lime_anim_free(&g_anim);
    if (g_stage.has_scene) lime_scene_free(&g_stage.sc);
    if (g_stage.loaded) lime_meshset_free(&g_stage.ms);
    free(g_pos); free(g_lit); free(g_vb); free(g_tb); free(g_cb);
    return 0;
}
