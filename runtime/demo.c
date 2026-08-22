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
    int         loaded;
} StageGeom;

static StageGeom g_stage;

/* **A chosen number, not a recovered one.**
 *
 * Stage geometry is normalised: GRAVEYARD_LEVEL spans x[-0.6 0.7] y[0 1].
 * The skinned character comes out in bone units and stands about 106 tall. The
 * engine bridges the two with `scene->scale`, which `LIME_RenderScene` hands
 * to glScalef -- and that field is loaded from a sibling header that
 * LIME_LoadScene's decompiled body summarises rather than transcribes. Only 74
 * of 547 scenes ship a `.offsets`, and Graveyard is not one of them, so there
 * is nothing to read.
 *
 * So this is a number picked to make the arena look right next to a fighter,
 * and it is a placeholder for a field that exists and has not been recovered.
 * `--stage-scale N` overrides it. */
static float g_stage_scale = 170.0f;

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

    g_stage.loaded = 1;
    printf("  stage: %s, %d meshes\n", name, g_stage.ms.num_meshes);
    return 1;
}

static void stage_draw(void)
{
    int32_t i;

    if (!g_stage.loaded) return;

    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);

    glPushMatrix();
    glScalef(g_stage_scale, g_stage_scale, g_stage_scale);

    /* The sky and moon planes carry alpha in their textures -- Graveyard names
     * them Alpha_Moon and Alpha_Moon001 -- and drawing them opaque puts a white
     * card behind the whole stage.
     *
     * SRC_ALPHA / ONE_MINUS_SRC_ALPHA is not a guess: it is what
     * limeEnableAlphaBlending_Basic was MEASURED to do, by driving the
     * recompiled original and recording the GL call stream. See
     * docs/RENDERSCENE-SIGNATURE.md. The additive path uses SRC_ALPHA / ONE and
     * is a different thing. */
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    for (i = 0; i < g_stage.ms.num_meshes; i++) {
        const LimeMesh *m = &g_stage.ms.meshes[i];
        if (m->vert_count <= 0) continue;

        /* **The engine's own rule, and it is not cosmetic.** LIME_RenderScene
         * tests the first five letters of the MESH's name and branches past
         * the whole draw on EVENT -- see decomp/lime/RenderScene.c, verified
         * against the original over 29 cases. These are spawn points for
         * effects, not geometry, and drawing them fills the screen with white
         * NOTEXTURE polygons. Graveyard ships several. */
        if (m->name[0] == 'E' && m->name[1] == 'V' && m->name[2] == 'E' &&
            m->name[3] == 'N' && m->name[4] == 'T')
            continue;

        if (g_stage.tex[i]) {
            glEnable(GL_TEXTURE_2D);
            glBindTexture(GL_TEXTURE_2D, g_stage.tex[i]);
            glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
        } else {
            /* **220 of the 1,620 textures are PNG, and the loader only reads
             * PVRTC.** The big stage atlases are the PNG ones -- Graveyard's
             * is GRAVEYARD_COMPLETEMAP.PNG, 1024x1024 RGBA. Until there is a
             * PNG path these meshes have no texture, and leaving them at GL's
             * default white makes them the brightest thing on screen. Dark
             * grey says "missing" instead of shouting it. */
            glDisable(GL_TEXTURE_2D);
            glColor4f(0.16f, 0.16f, 0.18f, 1.0f);
        }

        glVertexPointer(3, GL_FLOAT, sizeof(LimeVertex), &m->verts[0].x);
        glTexCoordPointer(2, GL_FLOAT, sizeof(LimeVertex), &m->verts[0].u);

        if (m->indices)
            glDrawElements(GL_TRIANGLES, m->num_faces * 3,
                           GL_UNSIGNED_SHORT, m->indices);
        else
            glDrawArrays(GL_TRIANGLES, 0, m->vert_count);
    }

    glDisable(GL_BLEND);
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
        perspective(45.0f, (float)w / (float)h, radius * 0.05f, radius * 60.0f);

        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        ang = (float)(now * 12.0);
        glTranslatef(0.0f, -radius * 0.30f, -radius * 3.6f);
        glRotatef(6.0f, 1.0f, 0.0f, 0.0f);
        glRotatef(ang, 0.0f, 1.0f, 0.0f);
        glTranslatef(-centre[0], -centre[1], -centre[2]);

        stage_draw();
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
    if (g_stage.loaded) lime_meshset_free(&g_stage.ms);
    free(g_pos); free(g_lit); free(g_vb); free(g_tb); free(g_cb);
    return 0;
}
