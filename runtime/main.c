/*
 * The vertical slice: a native window drawing UMK3 geometry through the
 * engine's own maths.
 *
 * It is deliberately small. The point is not to render well; it is to prove
 * that the decompiled code compiles, links and produces correct output outside
 * Python -- and to give every function decompiled after this one a place to be
 * tested in situ rather than in a harness.
 *
 * The draw path uses the same GL entry points RenderMesh.cpp does:
 * glEnableClientState, glVertexPointer, glTexCoordPointer, glDrawElements,
 * glMatrixMode, glLoadMatrixf.
 *
 *   umk3 <file.meshset> [mesh-index]
 */
#include "platform/platform.h"
#include "lime/meshset.h"
#include "lime/limemath.h"
#include "lime/pvr.h"

#include <windows.h>
#include <GL/gl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

static void frame_bounds(const LimeMeshSet *ms, int only,
                         float *centre, float *radius)
{
    float lo[3] = {  1e30f,  1e30f,  1e30f };
    float hi[3] = { -1e30f, -1e30f, -1e30f };
    for (int32_t i = 0; i < ms->num_meshes; i++) {
        if (only >= 0 && i != only) continue;
        const LimeMesh *m = &ms->meshes[i];
        for (int32_t v = 0; v < m->vert_count; v++) {
            const float p[3] = { m->verts[v].x, m->verts[v].y, m->verts[v].z };
            for (int k = 0; k < 3; k++) {
                if (p[k] < lo[k]) lo[k] = p[k];
                if (p[k] > hi[k]) hi[k] = p[k];
            }
        }
    }
    float r = 0.0f;
    for (int k = 0; k < 3; k++) {
        centre[k] = (lo[k] + hi[k]) * 0.5f;
        float half = (hi[k] - lo[k]) * 0.5f;
        if (half > r) r = half;
    }
    *radius = (r > 1e-6f) ? r : 1.0f;
}

/* One GL texture per mesh, decoded from PVRTC on the CPU because no desktop
 * GPU can sample it. 0 means the mesh draws untextured. */
static GLuint *g_tex;

static void upload_textures(const LimeMeshSet *ms, const char *res_dir)
{
    g_tex = (GLuint *)calloc((size_t)ms->num_meshes, sizeof(GLuint));
    if (!g_tex) return;

    int ok = 0;
    for (int32_t i = 0; i < ms->num_meshes; i++) {
        LimeImage img;
        if (!lime_texture_load(res_dir, ms->meshes[i].texture, &img)) continue;

        glGenTextures(1, &g_tex[i]);
        glBindTexture(GL_TEXTURE_2D, g_tex[i]);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, img.width, img.height, 0,
                     GL_RGBA, GL_UNSIGNED_BYTE, img.rgba);
        lime_image_free(&img);
        ok++;
    }
    printf("  textures: %d of %d meshes decoded\n", ok, ms->num_meshes);
}

static void draw_mesh(const LimeMesh *m)
{
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);

    glVertexPointer(3, GL_FLOAT, sizeof(LimeVertex), &m->verts[0].x);
    glTexCoordPointer(2, GL_FLOAT, sizeof(LimeVertex), &m->verts[0].u);

    if (m->indices) {
        glDrawElements(GL_TRIANGLES, m->num_faces * 3,
                       GL_UNSIGNED_SHORT, m->indices);
    } else {
        glDrawArrays(GL_TRIANGLES, 0, m->vert_count);
    }

    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisableClientState(GL_VERTEX_ARRAY);
}

int main(int argc, char **argv)
{
    if (argc < 2) {
        printf("usage: %s <file.meshset> [mesh-index]\n", argv[0]);
        return 1;
    }
    int only = (argc > 2) ? atoi(argv[2]) : -1;

    /* Headless: parse and report, open nothing. This is what cross-checks the
     * C loader against tools/meshset.py over the whole corpus. */
    bool check = false;
    for (int i = 1; i < argc; i++)
        if (strcmp(argv[i], "--check") == 0) { check = true; only = -1; }

    LimeMeshSet ms;
    if (!lime_meshset_load(argv[1], &ms)) {
        printf("could not parse %s\n", argv[1]);
        return 1;
    }

    long tris = 0, verts = 0;
    for (int32_t i = 0; i < ms.num_meshes; i++) {
        tris  += ms.meshes[i].num_faces;
        verts += ms.meshes[i].vert_count;
    }
    printf("%s\n  %d meshes, %ld triangles, %ld vertices, variant %c\n",
           argv[1], ms.num_meshes, tris, verts,
           ms.num_meshes ? ms.meshes[0].variant : '?');
    if (ms.num_meshes) printf("  first: '%s' tex='%s'\n",
                              ms.meshes[0].name, ms.meshes[0].texture);

    /* --tex <NAME>: decode one texture and write a PPM, so the C decoder can
     * be diffed against tools/pvrtc.py rather than eyeballed. */
    for (int i = 1; i + 1 < argc; i++) {
        if (strcmp(argv[i], "--tex") != 0) continue;
        char res[512];
        snprintf(res, sizeof(res), "%s", argv[1]);
        for (char *q = res + strlen(res); q > res; q--)
            if (*q == '/' || *q == '\\') { *q = 0; break; }
        LimeImage img;
        if (!lime_texture_load(res, argv[i + 1], &img)) {
            printf("TEXFAIL %s\n", argv[i + 1]);
            lime_meshset_free(&ms);
            return 1;
        }
        char out[512];
        snprintf(out, sizeof(out), "%s.ppm", argv[i + 1]);
        FILE *fp = fopen(out, "wb");
        if (fp) {
            fprintf(fp, "P6\n%d %d\n255\n", img.width, img.height);
            for (long k = 0; k < (long)img.width * img.height; k++)
                fwrite(img.rgba + k * 4, 1, 3, fp);
            fclose(fp);
        }
        printf("TEX %s %d %d -> %s\n", argv[i + 1], img.width, img.height, out);
        lime_image_free(&img);
        lime_meshset_free(&ms);
        return 0;
    }

    if (check) {
        printf("CHECK %s %d %ld %ld %c\n", argv[1], ms.num_meshes, tris, verts,
               ms.num_meshes ? ms.meshes[0].variant : '?');
        lime_meshset_free(&ms);
        return 0;
    }

    /* textures live beside the .meshset */
    char res_dir[512];
    snprintf(res_dir, sizeof(res_dir), "%s", argv[1]);
    for (char *q = res_dir + strlen(res_dir); q > res_dir; q--) {
        if (*q == '/' || *q == '\\') { *q = 0; break; }
    }

    if (!plat_open("UMK3 - vertical slice", 900, 700)) {
        printf("could not open a window\n");
        lime_meshset_free(&ms);
        return 1;
    }

    float centre[3], radius;
    frame_bounds(&ms, only, centre, &radius);
    const float dist = radius * 3.2f;

    upload_textures(&ms, res_dir);

    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    glClearColor(0.09f, 0.09f, 0.11f, 1.0f);

    printf("  window open -- Esc to quit\n");

    while (plat_poll()) {
        int w, h;
        plat_size(&w, &h);
        if (w < 1 || h < 1) { plat_swap(); continue; }

        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        /* Projection: the engine's own, transposed for GL. `aspect` divides
         * the X term only -- change that line and you have widescreen. */
        float proj[16], gl[16];
        lime_perspective(proj, 50.0f * 3.14159265f / 180.0f,
                         (float)w / (float)h, radius * 0.05f,
                         dist + radius * 4.0f);
        lime_to_gl(proj, gl);
        glMatrixMode(GL_PROJECTION);
        glLoadMatrixf(gl);

        /* Model-view: the engine's RotMatrixY, then pull the camera back. */
        float rot[16];
        lime_rot_y(rot, (float)plat_time() * 0.6f);
        lime_to_gl(rot, gl);
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        glTranslatef(0.0f, 0.0f, -dist);
        glMultMatrixf(gl);
        glTranslatef(-centre[0], -centre[1], -centre[2]);

        for (int32_t i = 0; i < ms.num_meshes; i++) {
            if (only >= 0 && i != only) continue;
            if (g_tex && g_tex[i]) {
                glEnable(GL_TEXTURE_2D);
                glBindTexture(GL_TEXTURE_2D, g_tex[i]);
                glColor3f(1.0f, 1.0f, 1.0f);
            } else {
                glDisable(GL_TEXTURE_2D);
                float t = ms.num_meshes > 1
                        ? (float)i / (float)ms.num_meshes : 0.0f;
                glColor3f(0.55f + 0.45f * t, 0.62f, 0.95f - 0.45f * t);
            }
            draw_mesh(&ms.meshes[i]);
        }

        plat_swap();
    }

    plat_close();
    free(g_tex);
    lime_meshset_free(&ms);
    return 0;
}
