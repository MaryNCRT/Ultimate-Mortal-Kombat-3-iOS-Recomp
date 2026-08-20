/*
 * The character path of the vertical slice: a fighter, skinned and animating,
 * drawn by the C port of the engine's own pipeline.
 *
 * Everything here is the native counterpart of tools/pose.py, which is the
 * reference implementation and what the numbers are checked against. The
 * formats are docs/SKIN-FORMAT.md; the arithmetic lives in runtime/lime/skin.c.
 *
 *   umk3 <NAME>.skin [--frame N | --idle] [--check]
 *
 * The three files of a character share a stem, so naming any one of them is
 * enough: NAME.bones, NAME.skinanim, NAME.skin.
 */
#include "character.h"

#include "platform/platform.h"
#include "platform/gl.h"
#include "lime/skin.h"
#include "lime/limemath.h"
#include "lime/light.h"
#include "lime/pvr.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Frames are played at the rate the game runs at. A .skinanim is every
 * animation the character has, end to end, so playing the stream straight
 * through is a parade of moves rather than one clip -- naming the clips is
 * tools/animate.py's job and is not ported yet. */
#define PLAY_FPS 30.0

bool character_stem(const char *path, char *stem, size_t n)
{
    static const char *ext[] = { ".skin", ".bones", ".skinanim" };
    const size_t len = strlen(path);
    for (size_t i = 0; i < sizeof(ext) / sizeof(ext[0]); i++) {
        const size_t e = strlen(ext[i]);
        if (len > e && strcmp(path + len - e, ext[i]) == 0) {
            if (len - e >= n) return false;
            memcpy(stem, path, len - e);
            stem[len - e] = '\0';
            return true;
        }
    }
    return false;
}

/* A character's texture is not named anywhere in these three files: the
 * .meshset carries mesh texture names and the skin does not. The convention
 * the shipped data follows is the stem's first component plus _DIFFUSE. */
static void diffuse_name(const char *stem, char *res_dir, size_t rn,
                         char *tex, size_t tn)
{
    snprintf(res_dir, rn, "%s", stem);
    char *slash = NULL;
    for (char *q = res_dir; *q; q++)
        if (*q == '/' || *q == '\\') slash = q;
    const char *base = stem;
    if (slash) { *slash = '\0'; base = stem + (slash - res_dir) + 1; }
    else res_dir[0] = '\0';

    char first[128];
    snprintf(first, sizeof(first), "%s", base);
    char *us = strchr(first, '_');
    if (us) *us = '\0';
    snprintf(tex, tn, "%s_DIFFUSE.???", first);
}

/* UVs are stored per triangle corner, but a shared vertex gets the same pair
 * in every triangle it appears in, so they collapse to per-vertex without
 * splitting anything. Verified across all 30 skin blocks in the game. */
static void collapse_uvs(const LimeSkin *skin, float *uv, uint16_t *tris)
{
    int32_t base = 0, tri = 0;
    for (int32_t bi = 0; bi < skin->num_blocks; bi++) {
        const LimeSkinBlock *b = &skin->blocks[bi];
        for (int32_t t = 0; t < b->num_tris; t++) {
            for (int k = 0; k < 3; k++) {
                const int32_t v = base + b->tris[t * 3 + k];
                uv[v * 2 + 0] = b->uv[t * 6 + k * 2 + 0];
                uv[v * 2 + 1] = b->uv[t * 6 + k * 2 + 1];
                tris[tri * 3 + k] = (uint16_t)v;
            }
            tri++;
        }
        base += b->num_verts;
    }
}

static void bounds(const float *pos, int32_t n, float *centre, float *radius,
                   float *lo, float *hi)
{
    for (int k = 0; k < 3; k++) { lo[k] = 1e30f; hi[k] = -1e30f; }
    for (int32_t v = 0; v < n; v++)
        for (int k = 0; k < 3; k++) {
            const float c = pos[v * 3 + k];
            if (c < lo[k]) lo[k] = c;
            if (c > hi[k]) hi[k] = c;
        }
    float r = 0.0f;
    for (int k = 0; k < 3; k++) {
        centre[k] = (lo[k] + hi[k]) * 0.5f;
        const float half = (hi[k] - lo[k]) * 0.5f;
        if (half > r) r = half;
    }
    *radius = (r > 1e-6f) ? r : 1.0f;
}

int character_main(const char *stem, int argc, char **argv)
{
    bool check = false, play = true, dump = false;
    int32_t want = -1;
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--check") == 0) check = true;
        else if (strcmp(argv[i], "--dump") == 0) { dump = true; check = true; }
        else if (strcmp(argv[i], "--idle") == 0) play = false;
        else if (strcmp(argv[i], "--frame") == 0 && i + 1 < argc) {
            want = (int32_t)atoi(argv[i + 1]);
            play = false;
        }
    }

    char path[512];
    LimeSkeleton skel;
    LimeSkinAnim anim;
    LimeSkin skin;

    snprintf(path, sizeof(path), "%s.bones", stem);
    if (!lime_bones_load(path, &skel)) {
        printf("could not parse %s\n", path);
        return 1;
    }
    snprintf(path, sizeof(path), "%s.skinanim", stem);
    if (!lime_skinanim_load(path, &anim)) {
        printf("could not parse %s\n", path);
        lime_bones_free(&skel);
        return 1;
    }
    snprintf(path, sizeof(path), "%s.skin", stem);
    if (!lime_skin_load(path, &skin)) {
        printf("could not parse %s\n", path);
        lime_bones_free(&skel);
        lime_skinanim_free(&anim);
        return 1;
    }

    printf("%s\n", stem);
    printf("  %d bones (root %d), %d frames of %d bytes over %d animated bones\n",
           skel.num_bones, skel.root, anim.num_frames, anim.frame_size,
           anim.num_bones);
    printf("  %d blocks, %d vertices, %d triangles\n",
           skin.num_blocks, skin.total_verts, skin.total_tris);

    const int32_t nv = skin.total_verts;
    const int32_t nt = skin.total_tris;
    float *pos = (float *)malloc((size_t)(nv ? nv : 1) * 3 * sizeof(float));
    float *uv = (float *)calloc((size_t)(nv ? nv : 1) * 2, sizeof(float));
    unsigned char *col = (unsigned char *)malloc((size_t)(nv ? nv : 1) * 3);
    uint16_t *tris = (uint16_t *)malloc((size_t)(nt ? nt : 1) * 3 * 2);
    float *quats = (float *)malloc((size_t)(anim.num_bones ? anim.num_bones : 1)
                                   * 4 * sizeof(float));
    LimeSkinMatrix *pal =
        (LimeSkinMatrix *)malloc((size_t)skel.num_bones * sizeof(*pal));
    int rc = 1;
    if (!pos || !uv || !col || !tris || !quats || !pal) goto done;

    collapse_uvs(&skin, uv, tris);
    lime_light_init();

    if (want < 0) {
        /* Frame 0 is not the stance -- see lime_skinanim_idle. */
        want = lime_skinanim_idle(&anim, &skel, 1);
        if (want < 0) want = 0;
        printf("  idle stance at frame %d\n", want);
    }
    if (want >= anim.num_frames) want = anim.num_frames - 1;

    {
        float root[3];
        lime_skinanim_frame(&anim, want, root, quats);
        lime_skin_palette(&skel, root, quats, anim.num_bones, pal);
        lime_skin_pose(&skin, pal, skel.num_bones, pos, col);
    }

    float centre[3], radius, lo[3], hi[3];
    bounds(pos, nv, centre, &radius, lo, hi);
    printf("  frame %d extents: x %.1f..%.1f  y %.1f..%.1f  z %.1f..%.1f\n",
           want, lo[0], hi[0], lo[1], hi[1], lo[2], hi[2]);

    if (dump) {
        /* every skinned position, for a line-by-line diff against pose.py */
        for (int32_t v = 0; v < nv; v++)
            printf("V %d %.4f %.4f %.4f\n", v,
                   pos[v*3], pos[v*3+1], pos[v*3+2]);
    }

    if (check) {
        /* the line tools/pose.py can be diffed against */
        printf("CHECK-SKIN %s %d %d %d %d %d %.4f %.4f %.4f\n", stem,
               skel.num_bones, anim.num_frames, anim.num_bones, nv, nt,
               pos[0], pos[1], pos[2]);
        rc = 0;
        goto done;
    }

    if (!plat_open("UMK3 - character", 700, 900)) {
        printf("could not open a window\n");
        goto done;
    }

    GLuint tex = 0;
    {
        char res_dir[512], tex_name[160];
        LimeImage img;
        diffuse_name(stem, res_dir, sizeof(res_dir), tex_name, sizeof(tex_name));
        if (lime_texture_load(res_dir, tex_name, &img)) {
            glGenTextures(1, &tex);
            glBindTexture(GL_TEXTURE_2D, tex);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, img.width, img.height, 0,
                         GL_RGBA, GL_UNSIGNED_BYTE, img.rgba);
            lime_image_free(&img);
            printf("  texture %s\n", tex_name);
        } else {
            printf("  no texture (%s) -- drawing lit grey\n", tex_name);
        }
    }

    glEnable(GL_DEPTH_TEST);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    glClearColor(0.09f, 0.09f, 0.11f, 1.0f);
    /* No back-face culling: the winding of a skinned triangle list has not
     * been established, and guessing it costs half the character. */

    printf("  window open -- Esc to quit\n");

    const float dist = radius * 3.2f;
    int32_t shown = -1;
    while (plat_poll()) {
        int w, h;
        plat_size(&w, &h);
        if (w < 1 || h < 1) { plat_swap(); continue; }

        int32_t frame = want;
        if (play && anim.num_frames > 0)
            frame = (int32_t)(plat_time() * PLAY_FPS) % anim.num_frames;
        if (frame != shown) {
            float root[3];
            lime_skinanim_frame(&anim, frame, root, quats);
            lime_skin_palette(&skel, root, quats, anim.num_bones, pal);
            lime_skin_pose(&skin, pal, skel.num_bones, pos, col);
            shown = frame;
        }

        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        float proj[16], gl[16];
        lime_perspective(proj, 50.0f * 3.14159265f / 180.0f,
                         (float)w / (float)h, radius * 0.05f,
                         dist + radius * 6.0f);
        lime_to_gl(proj, gl);
        glMatrixMode(GL_PROJECTION);
        glLoadMatrixf(gl);

        float rot[16];
        lime_rot_y(rot, (float)plat_time() * 0.4f);
        lime_to_gl(rot, gl);
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        glTranslatef(0.0f, 0.0f, -dist);
        glMultMatrixf(gl);
        /* skinned characters come out Y-up already: the rest pose lives in the
         * animation, not in the Z-up authored geometry a .meshset carries */
        glTranslatef(-centre[0], -centre[1], -centre[2]);

        if (tex) { glEnable(GL_TEXTURE_2D); glBindTexture(GL_TEXTURE_2D, tex); }
        else glDisable(GL_TEXTURE_2D);
        glColor3f(1.0f, 1.0f, 1.0f);

        glEnableClientState(GL_VERTEX_ARRAY);
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
        glEnableClientState(GL_COLOR_ARRAY);
        glVertexPointer(3, GL_FLOAT, 0, pos);
        glTexCoordPointer(2, GL_FLOAT, 0, uv);
        glColorPointer(3, GL_UNSIGNED_BYTE, 0, col);
        glDrawElements(GL_TRIANGLES, nt * 3, GL_UNSIGNED_SHORT, tris);
        glDisableClientState(GL_COLOR_ARRAY);
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        glDisableClientState(GL_VERTEX_ARRAY);

        plat_swap();
    }

    plat_close();
    rc = 0;

done:
    free(pos); free(uv); free(col); free(tris); free(quats); free(pal);
    lime_skin_free(&skin);
    lime_skinanim_free(&anim);
    lime_bones_free(&skel);
    return rc;
}
