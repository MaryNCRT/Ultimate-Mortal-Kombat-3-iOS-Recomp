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
 * **This was a guess, and the guess turned out to be right.** This comment used
 * to say there was no shadow renderer anywhere in the symbol table and that
 * what the original did with `_ShadowOffset` and `_ShadowHeightFromGround` was
 * not established. Both halves are now wrong.
 *
 * `RenderAnimatedCharacter` (armv7 0x0005c16c, decompiled in
 * decomp/gamecode/Players.c) is the shadow renderer, and it does exactly what
 * this demo does: takes the vertices the body pass just skinned, paints them
 * black, and flattens them with `glScalef(1, 0, 1)`. There is no shadow mesh
 * because there was never meant to be one.
 *
 * What it does differently, and what this demo should be changed to match:
 *
 *      glTranslatef(0, (y - ShadowOffset) * -100 + ShadowHeightFromGround, 0)
 *
 * -- so the height is not a fixed lift off the floor. It scales with the
 * fighter's distance from `_ShadowOffset` by **-100**, inverting the sign, and
 * only then adds `_ShadowHeightFromGround`. SHADOW_LIFT below is the stand-in
 * for that second term and there is no stand-in at all for the first.
 *
 * Left as it is for now because the demo has no `_ShadowOffset` value to read;
 * fixing it belongs with the rest of the renderer work.
 */
#include "platform/platform.h"
#include "platform/gl.h"
#include "lime/meshset.h"
#include "lime/scene.h"
#include "lime/events.h"
#include "lime/skin.h"
#include "lime/light.h"
#include "lime/pvr.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* **The transparency model, in one place.**
 *
 * LIME_RenderScene hands any node under this alpha to AddToTranspMeshList, and
 * FlushTranspMeshList draws that list with:
 *
 *      limeEnableAlphaBlending_Additive()
 *      limeDisableDepthWrites()
 *
 * **Additive, and therefore unsorted.** Additive blending is commutative, so
 * a+b+c is the same pixel in any order and the list is drawn in insertion order
 * with no depth sort anywhere. decomp/lime/RenderScene.c says exactly that, and
 * warns that adding a back-to-front sort is the thing a port is most likely to
 * "improve" by mistake. This demo did precisely that, to stop Graveyard's sky
 * painting over its moon -- a problem additive blending does not have, because
 * adding a dark sky to a bright moon cannot dim it.
 *
 * It also fixes Balcony's torches. TORCHFIRE2's key alpha runs 0.034 to 0.900,
 * so it belongs on this list; PARTICLE1 is a flame on a black field with alpha
 * 255 everywhere, and drawing that opaque paints the black field too -- a grey
 * box around every flame. Added, the black contributes nothing.
 *
 * The threshold is 0.97 and it was established by bisection against the
 * recompiled original, not read from a literal: 0.9700 behaves as opaque and
 * 0.9699 does not. */
#define SCENE_OPAQUE_ALPHA 0.97f

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
 * fighter is 212.5 tall, which puts a gravestone at his waist. `scene->scale`
 * -- the field LIME_RenderScene hands to
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

/* Multiplier on the gameplay camera's distance. 1.0 is the retail
 * framing; larger pulls back to show more of the arena. */
static float g_cam_dist = 1.0f;

/* **The field of view is 25 degrees, and it is read out of the binary.**
 *
 * LIMEDS_Set3dMode is the ONLY caller of CreatePerspectiveMatrix in the armv7
 * slice, and it loads its arguments as literals:
 *
 *      0x5d966  ldr r2, =0x3f19999a      ; 0.6   -> _ratio, and the aspect
 *      0x5d96c  ldr r1, =0x3edf66e7      ; 0.436332 rad = 25.0000 degrees
 *      0x5d972  ldr r3, =0x43c80000      ; 400.0 -> far, pushed at [sp]
 *      0x5d978  mov r3, #0x3f800000      ; 1.0   -> near
 *      0x5d97c  bl  _CreatePerspectiveMatrix
 *
 * and CreatePerspectiveMatrix computes sin(f)/(1-cos(f)) = cot(f/2) into m[5],
 * which is what gluPerspective puts there for a FULL vertical fov. So 25
 * degrees, not the 45 this demo had been using.
 *
 * That single number was the "background is too small" complaint: 45 degrees
 * makes everything behind the fighter 1.87x smaller relative to him, because a
 * wider lens spreads the same world over more frame. Nothing was misplaced.
 *
 * **The near/far pair is NOT used here and that is an open question.** The
 * engine passes 1.0 and 400.0, and Graveyard's own geometry reaches 28,629
 * units -- its moon alone sits at z = -27,483. A 400-unit far plane cannot draw
 * this stage as the files describe it, so something scales the world before it
 * reaches the projection and this port has not found it. The demo derives its
 * far plane from the stage instead and says so.
 *
 * The distance and eye height are fitted from a 1920x1080 capture of the game
 * itself, two frames of it, and the fit carries its own check:
 *
 *      fighters apart (frame 1996)   d = 4.88 heights, eye = 0.64
 *      fighters close (frame  961)   d = 4.09 heights, eye = 0.67
 *
 * **The camera pulls back as the fighters separate**, which is what every MK
 * camera does, so the distance is not one number. The eye height barely moves
 * across the two, and that stability is what says the fit is sound rather than
 * two unrelated numbers that happen to solve.
 *
 * An earlier pass read these off a compressed screenshot with a HUD over it and
 * got 3.30 -- far too close. At that distance the near, BRIGHT half of the
 * cobble plane falls below the frame and only its dark far edge is on screen,
 * which is why the floor looked flat and dim and why its far edge read as a
 * hard line instead of fading out. Measuring the video fixed a defect that
 * eyeballing a still had introduced. */
#define GAME_FOV_DEGREES 25.0f

/* **The zoom is the engine's, and the endpoints are literals.**
 *
 *      _camzoomedin   0x0014dfb4  = 3.60
 *      _camzoomedout  0x0014dfb8  = 5.55
 *      _Camera        0x0014fa74  = (0.0, -600.0, 146.0)
 *      _CameraLookAt  0x0014fa80  = (0.0, 0.0, 0.0)
 *      _zoomedoutweight            the blend between the two
 *
 * MK cameras pull back as the fighters separate, and this is where that lives.
 * The two distances measured off the capture -- 4.09 fighter heights with the
 * fighters close and 4.88 with them apart -- fall INSIDE [3.60, 5.55], and the
 * eye height measured there (136 to 143) sits against the 146 the binary
 * carries. Two independent numbers landing where the code says they should is
 * the check; what is NOT established is the unit the 3.60 and 5.55 are in, so
 * they are used here as multiples of the fighter's height because that is what
 * makes our measurements land inside them, and that reading is stated rather
 * than assumed.
 *
 * The demo has one fighter and so no separation to track: --cam-zoom picks a
 * point on the line, and the default reproduces the mid-fight framing. */
#define CAM_ZOOMED_IN   3.60f
#define CAM_ZOOMED_OUT  5.55f

/* 0 = fighters together, 1 = fully apart. 0.451 gives the 4.48 fitted before. */
static float g_cam_zoom  = 0.451f;

static float g_cam_eye   = 0.66f;
static float g_cam_pitch = 0.0f;

/* --list: report what every scene node resolved to. */
static int g_list = 0;

/* --only SUBSTRING: draw just the stage meshes whose name contains it. An
 * inspection aid -- telling "this surface is black" from "there is no surface
 * here" is otherwise guesswork. */
static const char *g_only = NULL;

/* --no-cull: draw both faces, to tell a missing surface from a culled one. */
static int g_no_cull = 0;

/* The stage's file stem, for its sibling `.events`. */
static const char *g_stage_name = "";

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
static void mist_load(const char *res_dir);

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
    g_stage_name = name;
    if (g_stage.has_scene) mist_load(res_dir);
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

    /* **The one glShadeModel call in the armv7 slice, and it is scoped.**
     *
     * It sits at 0x0005e372 inside LIME_RenderMeshSingleIndexed -- the STAGE
     * mesh path -- and loads 0x1d01, GL_FLAT. Scanning every Thumb BL and BLX
     * in the binary turns up no other caller, so the skinned character never
     * sets it and must not inherit it: its vertex colours are one lit grey per
     * vertex, computed from the skinned normal, and GL_FLAT throws two of every
     * three away and turns a smooth limb into a bag of facets.
     *
     * The demo used to set FLAT once at startup and never restore it, which is
     * why the fighter looked polygonal. */
    glShadeModel(GL_FLAT);

    /* LIME_RenderScene enables it right after the tint colour:
     *      0x5fa3c  blx _glColor4f
     *      0x5fa40  movw r0, #0xb44        ; GL_CULL_FACE
     *      0x5fa44  blx _glEnable
     * The stage's geometry is authored one-sided; without this the far wall of
     * every solid is drawn too. */
    if (!g_no_cull) glEnable(GL_CULL_FACE);

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
        /*
         * **Two passes, because the engine has two.**
         *
         * LIME_RenderScene does not draw a translucent node where it finds it:
         * it hands it to AddToTranspMeshList and FlushTranspMeshList draws the
         * batch later. Ignoring that and drawing in node order is visible on
         * Graveyard, because its sky (node 2) comes after its moon (node 1) and
         * sits 1,146 units FURTHER away. Both are translucent, so neither
         * writes depth, so the sky blends over the moon at 90% and puts it out.
         *
         * So: opaque first with depth writes on, then the translucent nodes
         * back to front. The sort key is the node's origin in VIEW space, read
         * from the live modelview matrix, so it stays right under --orbit as
         * well as under the gameplay camera.
         */
        struct { int32_t node; } defer[256];
        int ndefer = 0;

        glScalef(g_stage.sc.scale, g_stage.sc.scale, g_stage.sc.scale);

        for (n = 0; n < g_stage.sc.num_nodes; n++) {
            const LimeSceneKey *key = lime_scene_key(&g_stage.sc, (int)n, frame);
            const LimeMesh *m;
            const LimeQST *q;
            float mat[16];
            int idx;

            if (!key) continue;                     /* hidden on this frame */

            idx = (int)key->mesh_index;
            if (idx == 0xFF || idx >= g_stage.ms.num_meshes) continue;
            if (key->palette_index >= g_stage.sc.palette_size) continue;

            m = &g_stage.ms.meshes[idx];
            if (m->vert_count <= 0 || is_event_marker(m->name)) continue;
            if (g_only && !strstr(m->name, g_only)) continue;

            /* Under the threshold it goes on the list, whatever it is named. */
            if (key->alpha < SCENE_OPAQUE_ALPHA) {
                if (ndefer < (int)(sizeof(defer) / sizeof(defer[0])))
                    defer[ndefer++].node = n;
                continue;
            }

            q = &g_stage.sc.palette[key->palette_index];
            glDisable(GL_BLEND);
            glDepthMask(GL_TRUE);
            if (is_atst(m->name)) {
                glAlphaFunc(GL_GREATER, 0.9f);       /* 0x204, 0x3f666666 */
                glEnable(GL_ALPHA_TEST);
            } else {
                glDisable(GL_ALPHA_TEST);
            }
            stage_bind(idx, key->alpha);

            glPushMatrix();
            lime_qst_matrix(q, mat);
            glMultMatrixf(mat);
            stage_draw_mesh(m);
            glPopMatrix();
        }

        /* No sort: additive is commutative. See SCENE_OPAQUE_ALPHA. */
        glDisable(GL_ALPHA_TEST);
        glDepthMask(GL_FALSE);
        glEnable(GL_BLEND);
        /* SRC_ALPHA / ONE is what limeEnableAlphaBlending_Additive was MEASURED
         * to do, by driving the recompiled original and recording the GL call
         * stream. See docs/RENDERSCENE-SIGNATURE.md. */
        glBlendFunc(GL_SRC_ALPHA, GL_ONE);

        for (n = 0; n < ndefer; n++) {
            const LimeSceneKey *key =
                lime_scene_key(&g_stage.sc, (int)defer[n].node, frame);
            const LimeMesh *m;
            float mat[16];
            int idx;

            if (!key) continue;
            idx = (int)key->mesh_index;
            m = &g_stage.ms.meshes[idx];

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
    glDisable(GL_CULL_FACE);
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);

    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisableClientState(GL_VERTEX_ARRAY);
}


/* ------------------------------------------------------------- the mist
 *
 * **The stage's fog is a separate scene, instanced at spawn points.**
 *
 * Graveyard's `.scene` carries seven nodes named EVENT_gymist002..010 -- `gy
 * mist`, graveyard mist. LIME_RenderScene refuses to draw anything whose mesh
 * name begins EVENT, so on their own they are invisible markers; what they
 * carry is a POSITION. Each is visible on exactly one frame of the visibility
 * stream (frame 2), holds exactly one key, and its palette entry puts it at
 * x=-10 with y from 39 to 191 and z from -122 to -1489 -- seven puffs at
 * different heights and depths through the graveyard.
 *
 * What gets drawn there ships as its own file group: GYMIST1.meshset holds a
 * single mesh, ALPHA_mist, 19 vertices and 8 triangles, textured
 * ALPHA_GYMIST1; GYMIST1.scene animates it over 2,001 frames. The mesh name
 * begins ALPHA, so it takes the blend-with-depth-writes-off path the engine
 * selects by name.
 *
 * There is no glFog anywhere in the armv7 slice -- the binary imports no fog
 * entry point at all -- and _SceneTint is (1,1,1). This is the atmosphere.
 */
/* How far above the floor the flattened shadow sits. Enough to clear the
 * ground plane's depth, small enough not to read as floating. */
/* **The fighter and the stage are NOT drawn at the same scale.**
 *
 * The engine scales each with its own global, and both are literals in __DATA:
 *
 *      _SceneScale  0x0014dfd8  = 0.013313805684447289   RenderLevelBG
 *      _PlayerSize  0x00150cc4  = 0.01015624962747097    RenderLevelPlayers
 *
 * so a player vertex ends up 0.762836 of the size a stage vertex of the same
 * numeric value does. Drawing both at 1.0 -- which this demo did -- makes the
 * fighter 1.311x too big for the arena he is standing in, and every gravestone,
 * tree and tomb correspondingly too small.
 *
 * _SceneScale also settles something that had looked like a contradiction.
 * LIMEDS_Set3dMode builds the projection with far = 400.0, and Graveyard's
 * geometry reaches 28,629 units; scaled, that is 28,629 x 0.0133138 = 381,
 * which fits inside the 400 with about 5% to spare. The stage was never
 * oversized: it is authored large and scaled down once, at the top of
 * RenderLevelBG, and the far plane is cut to fit it. */
#define PLAYER_TO_SCENE 0.762836f

#define SHADOW_LIFT 0.5f

#define MAX_MIST 32

typedef struct {
    LimeMeshSet ms;
    LimeScene   sc;
    GLuint      tex;
    int         loaded;
    float       xform[MAX_MIST][16];    /* one per instance, from `.events` */
    int         count;
} MistFx;

static MistFx g_mist;

/* How fast the mist's own 2,001-frame scene advances. A chosen tempo: the
 * engine's rate comes from next_anirate, which is not decompiled. */
static float g_mist_hz = 30.0f;

static void mist_load(const char *res_dir)
{
    char path[1024];
    LimeEvents ev;
    int32_t i;
    char stem[128];
    size_t n;

    /* **The instances come from the `.events` file, not from the markers.**
     *
     * The stage's EVENT_gymist* scene nodes give the seven positions, and they
     * agree with this file to the last digit -- which is what makes either one
     * trustworthy. But `.events` carries more than a position: each track holds
     * a 3x3 and a translation in 12.12 fixed point, and the 3x3 is NOT the
     * identity. The Y scales run 0.93, 0.69, 0.64, 0.55, 0.36 and two tracks
     * carry X and Y both negative, which is a 180 degree rotation about Z and
     * not a mirror -- the determinant stays positive.
     *
     * That is the difference between one uniform sheet of fog and what the
     * game actually shows: seven bands of different thickness, two of them
     * mirrored so they drift the other way. Placing the instances by
     * translation alone -- which this demo did first -- stacks seven identical
     * bands on top of each other and looks like a grey wash. */
    snprintf(path, sizeof(path), "%s/%s.events", res_dir, g_stage_name);
    if (!lime_events_load(path, &ev)) return;

    for (i = 0; i < ev.count && g_mist.count < MAX_MIST; i++) {
        if (!ev.tracks[i].name[0]) continue;
        lime_event_matrix(&ev.tracks[i], g_mist.xform[g_mist.count]);
        g_mist.count++;
    }
    if (g_mist.count == 0) { lime_events_free(&ev); return; }

    /* The track name is the effect's file group, upper-cased. */
    n = strlen(ev.tracks[0].name);
    if (n >= sizeof(stem)) n = sizeof(stem) - 1;
    for (i = 0; i < (int32_t)n; i++) {
        char c = ev.tracks[0].name[i];
        stem[i] = (c >= 'a' && c <= 'z') ? (char)(c - 'a' + 'A') : c;
    }
    stem[n] = '\0';
    lime_events_free(&ev);

    snprintf(path, sizeof(path), "%s/%s.meshset", res_dir, stem);
    if (!lime_meshset_load(path, &g_mist.ms)) { g_mist.count = 0; return; }
    snprintf(path, sizeof(path), "%s/%s.scene", res_dir, stem);
    if (!lime_scene_load(path, &g_mist.sc, stage_find_mesh, &g_mist.ms)) {
        lime_meshset_free(&g_mist.ms);
        g_mist.count = 0;
        return;
    }
    g_mist.tex = upload(res_dir, g_mist.ms.meshes[0].texture);
    g_mist.loaded = 1;
    printf("  effect: %s x%d instances, %d frames, texture %s\n",
           stem, g_mist.count, g_mist.sc.num_frames,
           g_mist.tex ? g_mist.ms.meshes[0].texture : "MISSING");
}

/* Drawn after the stage's own translucent pass, with the same state the ALPHA
 * name rule selects: blended, depth writes off. */
static void mist_draw(double now)
{
    int i;
    int32_t n;
    int frame;

    if (!g_mist.loaded) return;

    frame = (int)(now * (double)g_mist_hz);

    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisable(GL_CULL_FACE);        /* effect quads are two-sided */

    if (g_mist.tex) {
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, g_mist.tex);
    } else {
        glDisable(GL_TEXTURE_2D);
    }

    for (n = 0; n < g_mist.sc.num_nodes; n++) {
        const LimeSceneKey *key = lime_scene_key(&g_mist.sc, (int)n, frame);
        const LimeMesh *m;
        float mat[16];

        if (!key || key->mesh_index == 0xFF ||
            key->mesh_index >= g_mist.ms.num_meshes) continue;
        if (key->palette_index >= g_mist.sc.palette_size) continue;
        m = &g_mist.ms.meshes[key->mesh_index];
        if (m->vert_count <= 0) continue;

        lime_qst_matrix(&g_mist.sc.palette[key->palette_index], mat);

        /* **Effects obey the same naming convention as the stage.**
         *
         * GYMIST1's mesh is ALPHA_mist and PIT_BLADES' is ALPHA_blade, so both
         * take the blend-with-depth-writes-off path. TORCHFIRE2's is Plane007
         * -- no prefix -- so the engine draws it OPAQUE, and its texture
         * PARTICLE1 is fully opaque to match. Forcing blending on every effect
         * mesh, which this function used to do, is wrong for exactly that case
         * and quietly stops the torches writing depth. */
        if (key->alpha < SCENE_OPAQUE_ALPHA) {
            /* the deferred list: additive, depth writes off */
            glDisable(GL_ALPHA_TEST);
            glEnable(GL_BLEND);
            glBlendFunc(GL_SRC_ALPHA, GL_ONE);
            glDepthMask(GL_FALSE);
        } else if (is_alpha_material(m->name)) {
            glDisable(GL_ALPHA_TEST);
            glEnable(GL_BLEND);
            glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
            glDepthMask(GL_FALSE);
        } else if (is_atst(m->name)) {
            glDisable(GL_BLEND);
            glAlphaFunc(GL_GREATER, 0.9f);
            glEnable(GL_ALPHA_TEST);
            glDepthMask(GL_TRUE);
        } else {
            glDisable(GL_ALPHA_TEST);
            glDisable(GL_BLEND);
            glDepthMask(GL_TRUE);
        }
        glColor4f(1.0f, 1.0f, 1.0f, key->alpha);

        for (i = 0; i < g_mist.count; i++) {
            glPushMatrix();
            glMultMatrixf(g_mist.xform[i]);   /* the instance, from `.events` */
            glMultMatrixf(mat);               /* its own animated QST */
            stage_draw_mesh(m);
            glPopMatrix();
        }
    }

    glDepthMask(GL_TRUE);
    glDisable(GL_BLEND);
    glDisable(GL_ALPHA_TEST);
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

            g_vb[o * 3 + 0] = g_pos[v * 3 + 0] * PLAYER_TO_SCENE;
            g_vb[o * 3 + 1] = g_pos[v * 3 + 1] * PLAYER_TO_SCENE;
            g_vb[o * 3 + 2] = g_pos[v * 3 + 2] * PLAYER_TO_SCENE;

            g_tb[o * 2 + 0] = b->uv[t * 6 + c * 2 + 0];
            g_tb[o * 2 + 1] = b->uv[t * 6 + c * 2 + 1];

            g_cb[o * 3 + 0] = g_cb[o * 3 + 1] = g_cb[o * 3 + 2] = g_lit[v];
        }
    }
}

static void character_draw(int as_shadow, float ground_y)
{
    /* Interpolated: the per-vertex greys are the whole lighting model. */
    glShadeModel(GL_SMOOTH);

    glEnableClientState(GL_VERTEX_ARRAY);

    if (as_shadow) {
        /* The character squashed onto the ground plane and drawn flat black.
         * This IS what the engine does -- see the file header and
         * RenderAnimatedCharacter -- except that the original draws it opaque
         * with glColor4f(0,0,0,1) and no blending, where this blends at 0.45.
         * The height rule also differs; both are noted in the header. */
        glDisable(GL_TEXTURE_2D);
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        glDisableClientState(GL_COLOR_ARRAY);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        glDepthMask(GL_FALSE);
        glColor4f(0.0f, 0.0f, 0.0f, 0.45f);

        /* **It has to land ABOVE the floor, not on the fighter's feet.**
         *
         * This used to be handed lo[1] -- the lowest vertex of the skinned
         * character, which is -3.9 -- and Graveyard's cobbles are a plane at
         * exactly y = 0.0. So the shadow was flattened 3.9 units UNDER the
         * ground and the depth test threw every pixel of it away: the code ran
         * every frame and drew nothing at all.
         *
         * A shadow on a floor is a coplanar surface, so it needs to be lifted
         * clear of it by something. A small constant is enough here because the
         * floor is flat and axis-aligned; a stage with sloped ground would want
         * glPolygonOffset instead. */
        glPushMatrix();
        glTranslatef(0.0f, ground_y + SHADOW_LIFT, 0.0f);
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
        else if (!strcmp(argv[i], "--only") && i + 1 < argc)
            g_only = argv[++i];
        else if (!strcmp(argv[i], "--no-cull")) g_no_cull = 1;
        else if (!strcmp(argv[i], "--mist-hz") && i + 1 < argc)
            g_mist_hz = (float)atof(argv[++i]);
        else if (!strcmp(argv[i], "--no-mist")) g_mist_hz = -1.0f;
        else if (!strcmp(argv[i], "--cam-eye") && i + 1 < argc)
            g_cam_eye = (float)atof(argv[++i]);
        else if (!strcmp(argv[i], "--cam-pitch") && i + 1 < argc)
            g_cam_pitch = (float)atof(argv[++i]);
        else if (!strcmp(argv[i], "--cam-zoom") && i + 1 < argc)
            g_cam_zoom = (float)atof(argv[++i]);
        else if (!strcmp(argv[i], "--cam-dist") && i + 1 < argc)
            g_cam_dist = (float)atof(argv[++i]);
        else if (argv[i][0] != '-') {
            if (!res)      res = argv[i];
            else if (npos == 0) { chr = argv[i]; npos = 1; }
            else if (npos == 1) { stg = argv[i]; npos = 2; }
        }
    }

    if (!res) {
        printf("usage: %s <res dir> [character] [stage]\n"
               "  --from N --to M     animation frame range\n"
               "  --shot out.ppm      render one frame and exit\n"
               "  --at T              the moment in the clip to capture\n"
               "  --cam-dist N        pull the gameplay camera back (1.0 = retail)\n"
               "  --orbit             circle the fighter instead\n"
               "  --scene-frame N     which frame of the scene stream to show\n"
               "  --stage-scale N     override scene->scale\n"
               "  --list              report what every scene node resolved to\n",
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
    printf("  character: %.1f tall, %.1f wide, feet at y=%.1f\n",
           hi[1] - lo[1], hi[0] - lo[0], lo[1]);

    glEnable(GL_DEPTH_TEST);
    glDisable(GL_CULL_FACE);
    /* GL_FLAT, not GL's default GL_SMOOTH. docs/ENCARGO.md records this as a
     * real difference: leaving the default gives softer shading everywhere
     * than the original produces. */
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
            perspective(GAME_FOV_DEGREES, (float)w / (float)h,
                        radius * 0.2f, zfar);
        }

        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        if (g_orbit) {
            /* Inspection: circle the fighter. Not what the game does. */
            ang = (float)(now * 12.0);
            glTranslatef(0.0f, -radius * 0.30f, -radius * 3.6f);
            glRotatef(6.0f, 1.0f, 0.0f, 0.0f);
            glRotatef(ang, 0.0f, 1.0f, 0.0f);
            glTranslatef(-centre[0], -centre[1], -centre[2]);
        } else {
            /*
             * **The gameplay camera.**
             *
             * A 2D fighter's camera is LEVEL -- no pitch. Tilting it down is
             * what makes a render look like a model viewer instead of a match,
             * because the ground stops being a floor you stand on and becomes
             * a surface you look at.
             *
             * The two numbers are framed against the shipped game rather than
             * chosen: in a retail screenshot the fighter's feet sit about 15%
             * up from the bottom edge and the head reaches about 78%, so the
             * body spans roughly 62% of the frame height. With a 45 degree
             * vertical field of view the frame is 2*d*tan(22.5) = 0.8284*d
             * tall, so 62% of it needs d = height/0.62/0.8284 = 1.95*height,
             * and putting the eye at 0.55*height above the feet lands the feet
             * at that 15%.
             *
             * Both scale off the fighter's own size, so a taller character
             * (Kabal, Sheeva) frames the same way rather than filling more of
             * the screen.
             */
            float height = hi[1] - lo[1];
            float zoom   = CAM_ZOOMED_IN +
                           g_cam_zoom * (CAM_ZOOMED_OUT - CAM_ZOOMED_IN);
            float dist   = height * zoom * g_cam_dist;
            float eye_y  = lo[1] + g_cam_eye * height;

            glTranslatef(0.0f, 0.0f, -dist);
            glRotatef(g_cam_pitch, 1.0f, 0.0f, 0.0f);
            glTranslatef(-centre[0], -eye_y, -centre[2]);
        }
        (void)ang;

        stage_draw(g_stage_frame);
        mist_draw(now);
        character_draw(1, 0.0f);        /* the shadow, on the stage floor */
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
    if (g_mist.loaded) { lime_scene_free(&g_mist.sc); lime_meshset_free(&g_mist.ms); }
    if (g_stage.has_scene) lime_scene_free(&g_stage.sc);
    if (g_stage.loaded) lime_meshset_free(&g_stage.ms);
    free(g_pos); free(g_lit); free(g_vb); free(g_tb); free(g_cb);
    return 0;
}
