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

    if (check) {
        printf("CHECK %s %d %ld %ld %c
", argv[1], ms.num_meshes, tris, verts,
               ms.num_meshes ? ms.meshes[0].variant : '?');
        lime_meshset_free(&ms);
        return 0;
    }

    if (!plat_open("UMK3 - vertical slice", 900, 700)) {
        printf("could not open a window\n");
        lime_meshset_free(&ms);
        return 1;
    }

    float centre[3], radius;
    frame_bounds(&ms, only, centre, &radius);
    const float dist = radius * 3.2f;

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
            /* no texture yet -- shade by index so the pieces are separable */
            float t = ms.num_meshes > 1 ? (float)i / (float)ms.num_meshes : 0.0f;
            glColor3f(0.55f + 0.45f * t, 0.62f, 0.95f - 0.45f * t);
            draw_mesh(&ms.meshes[i]);
        }

        plat_swap();
    }

    plat_close();
    lime_meshset_free(&ms);
    return 0;
}
