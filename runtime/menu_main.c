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
 * where it was at the end of the last tick. The mouse button is delivered as
 * the touch events EAGLView receives (lime_touch_began/moved/ended, in
 * lime_menu.c) and limeFinish copies the live pair into the last one, exactly
 * as on the device -- so a press, a hold and a release each have their own
 * shape, and a button that clicks on release sees the release.
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
int   menu_play_splash(void);
void  limeBegin(void);
void  limeFinish(void);

void  lime_menu_advance_clock(double seconds);
void  lime_touch_began(float x, float y);
void  lime_touch_moved(float x, float y, float prev_x, float prev_y);
void  lime_touch_ended(float x, float y, float prev_x, float prev_y);
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

void lime_app_resign_active(void);
void lime_app_become_active(void);

int main(int argc, char **argv)
{
    int focused = 1;
    const char *root = (argc > 1) ? argv[1] : ".";
    const char *shot = getenv("UMK3_SHOT");
    const char *screen = getenv("UMK3_SCREEN");
    int   shot_at = shot ? atoi(shot) : 0;
    int   frames = 0;
    long  step;
    int   was_down = 0;
    double t0;
    double last, acc = 0.0;

    setvbuf(stdout, NULL, _IONBF, 0);

    if (!plat_open("Ultimate Mortal Kombat 3", VIRT_W * SCALE, VIRT_H * SCALE)) {
        fprintf(stderr, "could not open a window\n");
        return 1;
    }
    lime_platform_set_asset_root(root);
    lime_gl_set_screen(VIRT_W, VIRT_H);

    printf("showing publisher logos\n");
    if (!menu_play_splash()) {
        plat_close();
        return 0;
    }
    printf("publisher logos complete\n");


    printf("loading...\n");
    Task_LoadGeneralData();
    for (step = 0; step < 200; step++)
        if (FEInit_LoadABit(step))
            break;
    printf("loaded at step %ld\n", step);

    /* UMK3_SCREEN=<n> starts on front-end task n instead of the main menu --
     * written straight into FE_CurrentTask, as tests/test_menu_screens.c does,
     * so a shot can show a screen that would otherwise need clicks to reach. */
    if (screen)
        FE_CurrentTask = atoi(screen);

    t0 = plat_time();
    last = t0;
    while (plat_poll()) {
        int mx, my, down;
        int ww, wh;

        /* The window's focus is the app's foreground: losing it is
         * applicationWillResignActive, and the loop stops ticking the way
         * [glView stopAnimation] stops the display link; regaining it is
         * applicationDidBecomeActive. See runtime/lime_app.c. */
        {
            int f = shot_at ? 1 : plat_focused();   /* a shot runs unattended */
            if (f != focused) {
                focused = f;
                if (f) {
                    lime_app_become_active();
                    last = plat_time();     /* the time away is not owed */
                    acc = 0.0;
                } else {
                    lime_app_resign_active();
                }
            }
            if (!f) {
                plat_swap();
                continue;
            }
        }

        /* Is a tick due? `Task_FEMain` both advances the menu and draws it,
         * so a pass with no tick has nothing to put on the screen. Clearing
         * and swapping anyway is a black frame between good ones -- which on
         * a display faster than 60 Hz is most of them. */
        acc += plat_time() - last;
        last = plat_time();
        if (acc > 0.25)                 /* a stall is not repaid all at once */
            acc = 0.25;
        if (acc < 1.0 / 60.0)
            continue;

        plat_size(&ww, &wh);

        /* The window is a scaled copy of the 480x320 the game believes in, so
         * a click has to come back the same way. The button is one finger,
         * delivered as EAGLView's touch events on its edges -- began, moved,
         * ended -- and limeFinish rolls the slots into their Last copies at the
         * end of each tick. That is what makes a press, a hold and a release
         * look different to the front end. */
        down = plat_mouse(&mx, &my);
        {
            static float prev_tx = -1.0f, prev_ty = -1.0f;
            float tx = (float)mx * VIRT_W / (ww ? ww : 1);
            float ty = (float)my * VIRT_H / (wh ? wh : 1);

            if (down && !was_down)
                lime_touch_began(tx, ty);
            else if (down && (tx != prev_tx || ty != prev_ty))
                lime_touch_moved(tx, ty, prev_tx, prev_ty);
            else if (!down && was_down)
                lime_touch_ended(prev_tx, prev_ty, prev_tx, prev_ty);
            if (down) {
                prev_tx = tx;
                prev_ty = ty;
            }
        }
        was_down = down;

        /* **A fixed 60 Hz tick, not one tick per displayed frame.**
         *
         * The animations are counted in ticks, not seconds: `AnimateBG`
         * advances the background with `BGSceneFrame[i] += 1.0f`, and the
         * binary really does add a hardcoded one -- `vmov.f32 s12, #1.0` then
         * `vadd.f32` -- with no frame-rate scaling anywhere near it. So the
         * background runs at exactly the rate this loop calls it.
         *
         * The original called it sixty times a second. `lime.m` holds one
         * `1.0/60.0` double, in limeBegin's literal pool, and the binary has
         * `setAnimationInterval:` to pass it to. Ticking once per swap instead
         * runs at whatever the display does: right at 60 Hz, and nearly two
         * and a half times too fast on a 144 Hz monitor.
         *
         * The cap keeps a stall from being repaid all at once.
         *
         * A shot needs the ticks to have happened, so it counts them rather
         * than swaps. */
        while (acc >= 1.0 / 60.0) {
            /* GameCodeMain's order: limeBegin, the task, limeFinish. limeBegin
             * is what writes limeSidewaysMat, which LIMEDS_Set3dMode multiplies
             * into every 3D projection -- skip it and the matrix stays zero and
             * the main menu's vortex is never drawn. */
            /* -[EAGLView drawView], 0x00061668, is one tick: glViewport,
             * glClearColor(0, 0, 0, 1), glClear(0x4100) -- colour and depth
             * -- then GameCodeMain. The clear belongs to the tick, not to the
             * swap. Two ticks drawn over one clear leave the first one's depth
             * behind, and the tower's bricks, drawn at the same depth again,
             * fail GL_LESS and vanish behind the background fill. */
            glViewport(0, 0, ww, wh);
            glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
            lime_menu_advance_clock(1.0 / 60.0);
            limeBegin();
            Task_FEMain();
            limeFinish();
            acc -= 1.0 / 60.0;
            frames++;
        }
        plat_audio_update();            /* the clicks and the menu tune */

        /* UMK3_SHOT=<n> ticks n times, saves the buffer and quits. Before the
         * swap: after it the back buffer is no longer what was just drawn. The
         * first ticks are not representative -- textures upload on demand and
         * the menus fade in -- so a shot is worth taking a little later. */
        if (shot_at > 0 && frames >= shot_at) {
            save_shot(ww, wh);
            break;
        }

        if (!plat_swap())
            break;

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
