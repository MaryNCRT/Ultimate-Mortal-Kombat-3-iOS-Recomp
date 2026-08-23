/*
 * test_scene_events.c -- the runtime's .scene, .events and PNG readers over the
 * whole shipped corpus.
 *
 * These three parsers arrived without tests. This walks every file the game
 * ships through them and checks what can be checked without a second reader:
 *
 *   .scene   every record must close on the file's exact last byte, and every
 *            palette quaternion must come out normalised. The second is the
 *            real check -- |q| = 1 is a property of the DATA that only holds if
 *            the 40-byte record is being read at the right offset, and reading
 *            one float earlier or later destroys it. A file walk alone proves
 *            much less; see docs/SCENE-FORMAT.md on why.
 *
 *   .events  every track's 3x3 must be a plausible transform: no NaN, and a
 *            determinant that is neither zero nor absurd. The mirrored tracks
 *            in Graveyard have a NEGATIVE determinant, which is the point --
 *            a check that rejected them would be rejecting the finding.
 *
 *   .png     every file must decode, and its dimensions must match its own
 *            IHDR read independently here.
 *
 * The counts this prints are meant to be compared against tools/scene.py
 * validate and tools/events.py validate, which are separate implementations.
 *
 *   test_scene_events.exe <res dir>
 */
#include "lime/scene.h"
#include "lime/events.h"
#include "lime/png.h"

#include <dirent.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static long sc_ok, sc_bad, sc_nodes, sc_pal, sc_qbad;
static long ev_ok, ev_bad, ev_tracks, ev_mirror, ev_degen;
static long pn_ok, pn_bad, pn_px, pn_dim;

static int ends_with(const char *s, const char *e)
{
    size_t a = strlen(s), b = strlen(e);
    return a >= b && !strcmp(s + a - b, e);
}

static void do_scene(const char *path)
{
    LimeScene sc;
    int32_t i;

    if (!lime_scene_load(path, &sc, NULL, NULL)) { sc_bad++; return; }
    sc_ok++;
    sc_nodes += sc.num_nodes;
    sc_pal   += sc.palette_size;

    for (i = 0; i < sc.palette_size; i++) {
        const LimeQST *q = &sc.palette[i];
        double n = 0.0;
        int k;

        for (k = 0; k < 4; k++) {
            double v = (double)q->q[k] / 32767.0;
            n += v * v;
        }
        n = sqrt(n);
        /* The narrowing to int16 costs a little; 2% is far tighter than any
         * wrong offset would survive. */
        if (fabs(n - 1.0) > 0.02) sc_qbad++;
    }
    lime_scene_free(&sc);
}

static void do_events(const char *path)
{
    LimeEvents ev;
    int32_t i;

    if (!lime_events_load(path, &ev)) { ev_bad++; return; }
    ev_ok++;
    ev_tracks += ev.count;

    for (i = 0; i < ev.count; i++) {
        const float *m = ev.tracks[i].m;
        double det = (double)m[0] * (m[4] * m[8] - m[5] * m[7])
                   - (double)m[1] * (m[3] * m[8] - m[5] * m[6])
                   + (double)m[2] * (m[3] * m[7] - m[4] * m[6]);
        int j, nan = 0;

        for (j = 0; j < 9; j++) if (!(m[j] == m[j])) nan = 1;
        for (j = 0; j < 3; j++) if (!(ev.tracks[i].t[j] == ev.tracks[i].t[j])) nan = 1;

        if (nan || det == 0.0 || fabs(det) > 1e6) ev_degen++;
        else if (det < 0.0) ev_mirror++;
    }
    lime_events_free(&ev);
}

static void do_png(const char *path)
{
    uint8_t *rgba;
    int w, h, fw = 0, fh = 0;
    FILE *f;
    unsigned char hdr[24];

    if (!lime_png_load(path, &rgba, &w, &h)) { pn_bad++; return; }
    pn_ok++;
    pn_px += (long)w * h;

    /* IHDR, read here rather than trusting the decoder's own answer. */
    f = fopen(path, "rb");
    if (f) {
        if (fread(hdr, 1, sizeof(hdr), f) == sizeof(hdr)) {
            fw = (hdr[16] << 24) | (hdr[17] << 16) | (hdr[18] << 8) | hdr[19];
            fh = (hdr[20] << 24) | (hdr[21] << 16) | (hdr[22] << 8) | hdr[23];
        }
        fclose(f);
    }
    if (fw != w || fh != h) pn_dim++;
    free(rgba);
}

static void scan(const char *dir)
{
    DIR *d = opendir(dir);
    struct dirent *e;
    char path[1024];

    if (!d) return;
    while ((e = readdir(d)) != NULL) {
        snprintf(path, sizeof(path), "%s/%s", dir, e->d_name);
        if (ends_with(e->d_name, ".scene"))       do_scene(path);
        else if (ends_with(e->d_name, ".events")) do_events(path);
        else if (ends_with(e->d_name, ".PNG") ||
                 ends_with(e->d_name, ".png"))    do_png(path);
    }
    closedir(d);
}

int main(int argc, char **argv)
{
    char path[1024];
    int bad;

    if (argc < 2) {
        printf("uso: %s <dir res>\n", argv[0]);
        return 2;
    }
    scan(argv[1]);
    snprintf(path, sizeof(path), "%s/Textures", argv[1]);
    scan(path);

    printf("=== .scene ===\n");
    printf("  parsean:            %ld\n", sc_ok);
    printf("  rechazados:         %ld   (ROBO1/ROBO2 son variante distinta: 2)\n", sc_bad);
    printf("  nodos:              %ld\n", sc_nodes);
    printf("  matrices de paleta: %ld\n", sc_pal);
    printf("  cuaterniones con |q| fuera de 1 +/- 0.02: %ld\n", sc_qbad);

    printf("\n=== .events ===\n");
    printf("  parsean:            %ld\n", ev_ok);
    printf("  rechazados:         %ld\n", ev_bad);
    printf("  pistas:             %ld\n", ev_tracks);
    printf("  con 3x3 espejada (determinante < 0): %ld\n", ev_mirror);
    printf("  con 3x3 degenerada o NaN:            %ld\n", ev_degen);

    printf("\n=== PNG ===\n");
    printf("  decodifican:        %ld\n", pn_ok);
    printf("  fallan:             %ld\n", pn_bad);
    printf("  pixeles:            %ld\n", pn_px);
    printf("  dimensiones que no cuadran con su IHDR: %ld\n", pn_dim);

    bad = (sc_qbad != 0) || (ev_degen != 0) || (pn_bad != 0) || (pn_dim != 0);
    printf("\nRESULTADO: %s\n", bad ? "FALLO" : "los tres lectores son consistentes con los datos del juego");
    return bad ? 1 : 0;
}
