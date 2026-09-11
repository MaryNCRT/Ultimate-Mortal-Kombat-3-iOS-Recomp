/*
 * test_main.c -- the front end and the fight scene, in one program.
 *
 *   UMK3-Test.exe [path to UMK3.app/res]
 *
 * Boots the decompiled front end. **F2 at any point drops into the test
 * scene**, F3 comes back to the menu.
 *
 * ====================================================================
 * WHY THE MENU IS NOT MODIFIED
 * ====================================================================
 *
 * The obvious way to do this is to add a DEBUG entry to the front end's PLAY
 * screen. This program deliberately does not.
 *
 * `decomp/` is a transcription of the binary. Every function in it is meant to
 * be what the original does, so a reader can hold it against the disassembly
 * and check. The moment one of them grows a branch the original never had,
 * that guarantee is gone for the whole directory -- nobody can tell any more
 * which lines are the game and which are ours, and the next person to read
 * `Task_FEMain` has to know that we edited it.
 *
 * So the front end below runs **exactly** as it does in `umk3-menu`: the same
 * boot, the same fixed 60 Hz tick, the same mouse-as-finger. This file watches
 * it from outside and owns the mode. That is also how a finished port would
 * bridge the two -- `Task_GameInit` is the real front end's own door to the
 * fight, and when it is decompiled this shell is where it gets hooked up.
 *
 * ## Two things share one window
 *
 * The front end draws through `runtime/draw_gl.c` into a 480x320 virtual
 * screen; the fight draws a perspective 3D scene. They cannot both own the GL
 * state, so the switch resets what it has to and each side sets up its own
 * projection every frame anyway.
 *
 * The fight's assets are loaded ON DEMAND, the first time F2 is pressed --
 * Graveyard and Scorpion together are a noticeable pause, and paying it at
 * startup would make the menu slow to appear for a mode most runs never enter.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform/platform.h"
#include "platform/gl.h"
#include "fight_select.h"

/* The front end, from decomp/gamecode. */
void Task_LoadGeneralData(void);
int  FEInit_LoadABit(long step);
void Task_FEMain(void);

extern int   FE_CurrentTask;
extern float limeTouchScreenX[], limeTouchScreenY[];
extern float limeLastTouchScreenX[], limeLastTouchScreenY[];

void lime_platform_set_asset_root(const char *path);
void lime_gl_set_screen(int w, int h);

/* The fight scene, from runtime/fight_scene.c. */
int  fight_setup(const char *res, const char *chr, int stage_idx);
int  fight_frame(int w, int h);
void fight_shutdown(void);

/* `G` is `GAMESTATE *` in runtime/gamecode_globals.c and the fight indexes it
 * by byte offset. One block of storage, pointed at once. 0x478 is its size,
 * from mk3_init's `memset(G, 0, 0x478)`. */
extern void *G;
static char  g_gamestate[0x478];

#define VIRT_W 480
#define VIRT_H 320

enum { MODE_MENU, MODE_FIGHT };

static int mode = MODE_MENU;
static int fight_ready;

/* A one-line hint, drawn OVER the front end with our own font rather than
 * through the game's -- the front end's text is its own and stays that way. */
static void hint(int w, int h)
{
    const float S = 2.0f;

    glDisable(GL_DEPTH_TEST);
    glDisable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    glMatrixMode(GL_PROJECTION);
    glPushMatrix();
    glLoadIdentity();
    glOrtho(0, w, h, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();

    fs_text(10.0f, (float)h - 10.0f - S * 8.0f, S,
            "F2 TEST SCENE", 1.0f, 0.82f, 0.15f);

    glMatrixMode(GL_PROJECTION);
    glPopMatrix();
    glMatrixMode(GL_MODELVIEW);
    glPopMatrix();
    glDisable(GL_BLEND);
}

static void menu_frame(int w, int h, int *was_down)
{
    int mx, my, down;

    glViewport(0, 0, w, h);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    /* The window is a scaled copy of the 480x320 the game believes in, so a
     * click has to come back the same way. Unchanged from menu_main.c. */
    down = plat_mouse(&mx, &my);
    if (down) {
        limeTouchScreenX[0] = (float)mx * VIRT_W / (w ? w : 1);
        limeTouchScreenY[0] = (float)my * VIRT_H / (h ? h : 1);
        limeLastTouchScreenX[0] = limeTouchScreenX[0];
        limeLastTouchScreenY[0] = limeTouchScreenY[0];
    } else if (*was_down) {
        /* The release frame: the live pair goes to -1 and the last pair stays,
         * which is the pattern the button code recognises. */
        limeTouchScreenX[0] = limeTouchScreenY[0] = -1.0f;
    } else {
        limeTouchScreenX[0] = limeTouchScreenY[0] = -1.0f;
        limeLastTouchScreenX[0] = limeLastTouchScreenY[0] = -1.0f;
    }
    *was_down = down;
}

int main(int argc, char **argv)
{
    const char *res = NULL;
    const char *chr = "SCORPION_STANDARD";
    int    i, pos = 0, stage = 0;
    int    ww = 1280, wh = 720, was_down = 0, was_test = 0, was_menu_key = 0;
    long   step;
    double acc = 0.0, last;

    setvbuf(stdout, NULL, _IONBF, 0);

    for (i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--stage") && i + 1 < argc)
            stage = atoi(argv[++i]);
        else if (!strcmp(argv[i], "--fight"))
            mode = MODE_FIGHT;
        else if (argv[i][0] == '-')
            fprintf(stderr, "unknown flag %s, ignored\n", argv[i]);
        else if (pos == 0) { res = argv[i]; pos++; }
        else if (pos == 1) { chr = argv[i]; pos++; }
    }

    /* With no path given, look for a `res` folder beside the executable --
     * the packaged build's normal case. The probe is for a file deep inside
     * it, so a half-copied folder fails here with a clear message instead of
     * failing later with "no .bones". */
    if (res == NULL) {
        static char beside[1024];
        char *slash;
        FILE *probe;
        char  test[1200];

        _snprintf(beside, sizeof beside, "%s", argv[0]);
        beside[sizeof beside - 1] = 0;
        slash = strrchr(beside, '\\');
        if (!slash)
            slash = strrchr(beside, '/');
        if (slash) slash[1] = 0; else beside[0] = 0;
        strncat(beside, "res", sizeof beside - strlen(beside) - 1);

        _snprintf(test, sizeof test, "%s/framelists/scorpionframes.txt", beside);
        test[sizeof test - 1] = 0;
        probe = fopen(test, "rb");
        if (probe) { fclose(probe); res = beside; }
    }

    if (res == NULL) {
        printf("usage: %s [path to UMK3.app/res] [character]\n"
               "\n"
               "No path was given and there is no usable `res` folder next to\n"
               "this executable.\n"
               "\n"
               "This build ships NO GAME DATA. Copy the `res` folder out of\n"
               "your own extracted UMK3.app and put it beside this .exe, or\n"
               "pass its path on the command line.\n", argv[0]);
        return 2;
    }

    if (!plat_open("UMK3", ww, wh)) {
        fprintf(stderr, "could not open a window\n");
        return 1;
    }

    G = g_gamestate;
    lime_platform_set_asset_root(res);
    lime_gl_set_screen(VIRT_W, VIRT_H);

    printf("loading the front end from %s\n", res);
    Task_LoadGeneralData();
    for (step = 0; step < 200; step++)
        if (FEInit_LoadABit(step))
            break;
    printf("front end ready at step %ld\n", step);
    printf("\n  F2  the test scene      F3  back to the menu\n");
    printf("  In the scene: F1 stage selector, F5 reset, ESC quit\n\n");

    last = plat_time();

    while (plat_poll()) {
        int k;

        plat_size(&ww, &wh);
        if (wh <= 0) wh = 1;

        /* F2 enters the scene, loading its assets the first time. F3 leaves
         * it. Both edge-triggered: a held key is not a new press. */
        k = plat_key(PK_TEST);
        if (k && !was_test && mode == MODE_MENU) {
            if (!fight_ready) {
                printf("loading the test scene...\n");
                fight_ready = fight_setup(res, chr, stage);
                if (!fight_ready)
                    fprintf(stderr, "the test scene could not load; "
                                    "staying in the menu\n");
            }
            if (fight_ready) {
                mode = MODE_FIGHT;
                /* The front end leaves GL set up for 2D sprites. */
                glDisable(GL_BLEND);
                glEnable(GL_DEPTH_TEST);
            }
        }
        was_test = k;

        if (mode == MODE_FIGHT) {
            if (!fight_frame(ww, wh)) {
                mode = MODE_MENU;
                acc = 0.0;
                last = plat_time();
            }
        } else {
            /* A fixed 60 Hz tick, not one per displayed frame: the front end
             * counts its animations in ticks. `AnimateBG` adds a hardcoded 1.0
             * with no frame-rate scaling anywhere near it, so this loop's rate
             * IS the animation's rate. Unchanged from menu_main.c. */
            acc += plat_time() - last;
            last = plat_time();
            if (acc > 0.25)
                acc = 0.25;
            if (acc < 1.0 / 60.0) {
                if (!plat_swap())
                    break;
                continue;
            }

            menu_frame(ww, wh, &was_down);
            while (acc >= 1.0 / 60.0) {
                Task_FEMain();
                acc -= 1.0 / 60.0;
            }
            hint(ww, wh);
        }

        (void)was_menu_key;

        if (!plat_swap())
            break;
    }

    if (fight_ready)
        fight_shutdown();
    plat_close();
    return 0;
}
