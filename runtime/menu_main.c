/*
 * menu_main.c -- the decompiled front end, in a window.
 *
 *   gcc -std=c99 -O2 -DUMK3_REAL_GL -I runtime -I decomp/lime \
 *       -o umk3-menu runtime/menu_main.c runtime/draw_gl.c \
 *       runtime/platform/win32_gl.c decomp/gamecode/*.c decomp/lime/*.c \
 *       runtime/gamecode_globals.c runtime/gamecode_stubs.c \
 *       runtime/lime_menu.c runtime/lime_platform.c runtime/lime/*.c \
 *       -lopengl32 -lgdi32 -lm
 *   ./umk3-menu <path to the extracted UMK3.app/res>
 *
 * The same boot as `tests/test_menu_boot.c` -- general data, the front-end
 * loader, then `Task_FEMain` every frame -- with `runtime/draw_gl.c` in place
 * of the counters, and the mouse standing in for a finger.
 *
 * ## The touch model
 *
 * The front end reads two pairs of globals. `limeTouchScreenX/Y[0]` is where a
 * finger IS, with -1 meaning nothing is down. `limeLastTouchScreenX/Y[0]` is
 * where it WAS: a screen tests `limeLastTouchScreenX[0] != -1` together with a
 * released touch to recognise a tap, which is why a button clicks on release
 * and not on press. So a mouse button held sets the live pair, and letting go
 * leaves the last pair set for exactly one frame.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform/platform.h"
#include "platform/gl.h"

/* The virtual screen the game draws into, and the window it is stretched to.
 * 480x320 is the iPhone's landscape resolution and it is what limeScreenWidth
 * reports; the window is a whole multiple of it so the sheets stay sharp. */
#define VIRT_W 480
#define VIRT_H 320
#define SCALE    2

void  lime_platform_set_asset_root(const char *path);
void  lime_gl_set_screen(int w, int h);
long  lime_platform_sprite_count(void);
long  lime_gl_fill_count(void);

void  Task_LoadGeneralData(void);
int   FEInit_LoadABit(long step);
void  Task_FEMain(void);

extern float limeTouchScreenX[], limeTouchScreenY[];
extern float limeLastTouchScreenX[], limeLastTouchScreenY[];
extern int   FE_CurrentTask;

/* win32_gl.c owns the window; the pointer state comes from it. */
int  plat_mouse(int *x, int *y);        /* returns 1 while a button is down */


/* Reads the front buffer back and writes a binary PPM: no encoder, no
 * dependency, and tools/ppm2png.py already converts it. */
static void save_shot(int w, int h)
{
    unsigned char *px = (unsigned char *)malloc((size_t)w * h * 3);
    FILE *f;
    int y;

    if (px == NULL)
        return;
    glPixelStorei(GL_PACK_ALIGNMENT, 1);
    glReadPixels(0, 0, w, h, GL_RGB, GL_UNSIGNED_BYTE, px);

    f = fopen("umk3-menu.ppm", "wb");
    if (f) {
        fprintf(f, "P6\n%d %d\n255\n", w, h);
        /* GL reads bottom-up; a PPM is top-down. */
        for (y = h - 1; y >= 0; y--)
            fwrite(px + (size_t)y * w * 3, 1, (size_t)w * 3, f);
        fclose(f);
        printf("wrote umk3-menu.ppm (%dx%d)\n", w, h);
    }
    free(px);
}

int main(int argc, char **argv)
{
    const char *root = (argc > 1) ? argv[1] : ".";
    const char *shot = getenv("UMK3_SHOT");
    int   shot_at = shot ? atoi(shot) : 0;
    int   frames = 0;
    long  step;
    int   was_down = 0;
    double t0;

    setvbuf(stdout, NULL, _IONBF, 0);

    if (!plat_open("Ultimate Mortal Kombat 3", VIRT_W * SCALE, VIRT_H * SCALE)) {
        fprintf(stderr, "could not open a window\n");
        return 1;
    }
    lime_platform_set_asset_root(root);
    lime_gl_set_screen(VIRT_W, VIRT_H);

    /* Nothing is touching the screen. Both pairs, because a screen that reads
     * the last pair before anything has happened would see whatever was in
     * memory. */
    limeTouchScreenX[0] = limeTouchScreenY[0] = -1.0f;
    limeLastTouchScreenX[0] = limeLastTouchScreenY[0] = -1.0f;

    printf("loading...\n");
    Task_LoadGeneralData();
    for (step = 0; step < 200; step++)
        if (FEInit_LoadABit(step))
            break;
    printf("loaded at step %ld\n", step);

    t0 = plat_time();
    while (plat_poll()) {
        int mx, my, down;
        int ww, wh;

        plat_size(&ww, &wh);
        glViewport(0, 0, ww, wh);
        glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        /* The window is a scaled copy of the 480x320 the game believes in, so
         * a click has to come back the same way. */
        down = plat_mouse(&mx, &my);
        if (down) {
            limeTouchScreenX[0] = (float)mx * VIRT_W / (ww ? ww : 1);
            limeTouchScreenY[0] = (float)my * VIRT_H / (wh ? wh : 1);
            limeLastTouchScreenX[0] = limeTouchScreenX[0];
            limeLastTouchScreenY[0] = limeTouchScreenY[0];
        } else if (was_down) {
            /* The release frame: the live pair goes to -1 and the last pair
             * stays, which is the pattern the button code recognises. */
            limeTouchScreenX[0] = limeTouchScreenY[0] = -1.0f;
        } else {
            limeTouchScreenX[0] = limeTouchScreenY[0] = -1.0f;
            limeLastTouchScreenX[0] = limeLastTouchScreenY[0] = -1.0f;
        }
        was_down = down;

        Task_FEMain();

        if (!plat_swap())
            break;

        /* UMK3_SHOT=<n> renders n frames, saves the buffer and quits. The
         * first frames are not representative -- textures upload on demand and
         * the menus fade in -- so a shot is worth taking a little later. */
        if (shot_at > 0 && ++frames >= shot_at) {
            save_shot(ww, wh);
            break;
        }

        if (plat_time() - t0 > 1.0) {
            printf("screen %d  sprites %ld  fills %ld\n",
                   FE_CurrentTask, lime_platform_sprite_count(),
                   lime_gl_fill_count());
            t0 = plat_time();
        }
    }

    plat_close();
    return 0;
}
