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
#include "lime/light.h"

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

/* Per-vertex colour, from the engine's own lighting model.
 *
 * The engine lights per vertex on the CPU and hands GL a colour -- it never
 * enables GL lighting, because ES 1.1 fixed function is all it has. We do the
 * same thing, which is why this is a colour array and not a light setup.
 *
 * A .meshset stores no normals, so they are averaged from the faces here. The
 * real engine gets them from .skin for characters and from .lighting for the
 * prelit ones; neither applies to a static mesh viewer. */
static unsigned char **g_col;

static void build_lighting(const LimeMeshSet *ms)
{
    lime_light_init();
    g_col = (unsigned char **)calloc((size_t)ms->num_meshes, sizeof(void *));
    if (!g_col) return;

    for (int32_t i = 0; i < ms->num_meshes; i++) {
        const LimeMesh *m = &ms->meshes[i];
        int32_t n = m->vert_count;
        if (n <= 0) continue;

        float *nrm = (float *)calloc((size_t)n * 3, sizeof(float));
        unsigned char *col = (unsigned char *)malloc((size_t)n * 3);
        if (!nrm || !col) { free(nrm); free(col); continue; }

        int32_t ntri = m->indices ? m->num_faces : n / 3;
        for (int32_t t = 0; t < ntri; t++) {
            int32_t a, b, c;
            if (m->indices) {
                a = m->indices[t*3]; b = m->indices[t*3+1]; c = m->indices[t*3+2];
            } else {
                a = t*3; b = t*3+1; c = t*3+2;
            }
            if (a >= n || b >= n || c >= n) continue;
            float e1[3] = { m->verts[b].x - m->verts[a].x,
                            m->verts[b].y - m->verts[a].y,
                            m->verts[b].z - m->verts[a].z };
            float e2[3] = { m->verts[c].x - m->verts[a].x,
                            m->verts[c].y - m->verts[a].y,
                            m->verts[c].z - m->verts[a].z };
            float fn[3] = { e1[1]*e2[2] - e1[2]*e2[1],
                            e1[2]*e2[0] - e1[0]*e2[2],
                            e1[0]*e2[1] - e1[1]*e2[0] };
            const int32_t idx[3] = { a, b, c };
            for (int k = 0; k < 3; k++)
                for (int ax = 0; ax < 3; ax++)
                    nrm[idx[k]*3 + ax] += fn[ax];
        }

        for (int32_t v = 0; v < n; v++) {
            float x = nrm[v*3], y = nrm[v*3+1], z = nrm[v*3+2];
            float len = sqrtf(x*x + y*y + z*z);
            float l;
            if (len < 1e-12f) {
                l = 0.5f;                      /* degenerate -- no normal */
            } else {
                l = lime_light_vert(x/len, y/len, z/len);
            }
            unsigned char g = (unsigned char)(l * 255.0f + 0.5f);
            col[v*3] = col[v*3+1] = col[v*3+2] = g;   /* monochrome, as the engine */
        }
        free(nrm);
        g_col[i] = col;
    }
}

static void upload_textures(const LimeMeshSet *ms, const char *res_dir)
{
    g_tex = (GLuint *)calloc((size_t)ms->num_meshes, sizeof(GLuint));
    if (!g_tex) return;

    int ok = 0;
    for (int32_t i = 0; i < ms->num_meshes; i++) {
        LimeImage img;
        if (!lime_texture_load(res_dir, ms->meshes[i].texture, &img)) continue;

        /* The rows go up exactly as decoded. An earlier version flipped them
         * here on the theory that PVR row 0 is the top while GL's V=0 is the
         * bottom -- but the game's UVs are authored for this data as it
         * stands, and flipping broke textures that were already correct. */
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

static void draw_mesh(const LimeMesh *m, const unsigned char *col)
{
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);

    glVertexPointer(3, GL_FLOAT, sizeof(LimeVertex), &m->verts[0].x);
    glTexCoordPointer(2, GL_FLOAT, sizeof(LimeVertex), &m->verts[0].u);

    if (col) {
        glEnableClientState(GL_COLOR_ARRAY);
        glColorPointer(3, GL_UNSIGNED_BYTE, 0, col);
    }

    if (m->indices) {
        glDrawElements(GL_TRIANGLES, m->num_faces * 3,
                       GL_UNSIGNED_SHORT, m->indices);
    } else {
        glDrawArrays(GL_TRIANGLES, 0, m->vert_count);
    }

    if (col) glDisableClientState(GL_COLOR_ARRAY);
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
    build_lighting(&ms);

    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
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

        /* The geometry is Z-up: a character body measures roughly 0.75 wide,
         * 0.20 deep and 1.00 tall along X, Y and Z respectively. That is the
         * 3ds Max convention the art was authored in, and it survived export.
         * GL is Y-up, so without this the fighters lie on their backs.
         *
         * Stages are a separate question -- GRAVEYARD_LEVEL is widest in X and
         * is a backdrop plane, not a body -- so this is applied to everything
         * and judged by eye rather than assumed per file. */
        glRotatef(-90.0f, 1.0f, 0.0f, 0.0f);

        glTranslatef(-centre[0], -centre[1], -centre[2]);

        for (int32_t i = 0; i < ms.num_meshes; i++) {
            if (only >= 0 && i != only) continue;
            /* NOTEXTURE is the engine's own placeholder, not a failure: these
             * are effect meshes -- sparks, booms -- that the game draws with a
             * material rather than a map. Tinting them by index made them look
             * broken; plain grey is honest. */
            bool textured = (g_tex && g_tex[i]);
            if (textured) {
                glEnable(GL_TEXTURE_2D);
                glBindTexture(GL_TEXTURE_2D, g_tex[i]);
            } else {
                glDisable(GL_TEXTURE_2D);
            }
            glColor3f(1.0f, 1.0f, 1.0f);
            draw_mesh(&ms.meshes[i], g_col ? g_col[i] : NULL);
        }

        plat_swap();
    }

    plat_close();
    free(g_tex);
    if (g_col) { for (int32_t i = 0; i < ms.num_meshes; i++) free(g_col[i]); }
    free(g_col);
    lime_meshset_free(&ms);
    return 0;
}
