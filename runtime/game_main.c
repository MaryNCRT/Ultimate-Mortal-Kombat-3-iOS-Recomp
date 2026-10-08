/*
 * game_main.c -- the whole game, booted the way the device boots it.
 *
 *   umk3-game.exe <path to UMK3.app/res>
 *
 * runtime/menu_main.c drives the front end by hand: it calls the loader and
 * then Task_FEMain, and nothing past the menu can happen. This one runs the
 * game's own frame instead, so the menu, the loading screen and the fight
 * follow each other the way the binary sequences them. The order is read off
 * the binary:
 *
 *   -[UMK3AppDelegate startAppWithOptions:application:]   0x00064ae8
 *       limeGetLanguage(Language, 10)
 *       sprintf(buf, "TOS_URL_%s", Language)
 *       if (!limeGetPropertyString(buf)) Language = "EN"
 *       Load_SettingsData(); EASDK_Init(); ...
 *
 *   -[EAGLView createFramebuffer]                          0x0006190c
 *       GameCodeInit()     -- limeInit, the event manager, the debug window
 *
 *   -[EAGLView drawView], once per display-link tick       0x00061668
 *       glViewport; glClearColor(0, 0, 0, 1); glClear(colour | depth)
 *       GameCodeMain()     -- limeBegin, TaskFunctionList[CurrentTask](),
 *                             limeFinish, heartbeatUpdate
 *
 * CurrentTask starts at 0, Task_LoadSplashScreen, as it does in __common.
 *
 * The fight logic stores addresses in 32-bit words, so this program is built
 * for i686, with its data tables generated from the user's binary by
 * tools/logic_tables.py and verified by tools/check_logic_tables.py (see the
 * umk3-game target in CMakeLists.txt).
 *
 * Environment, for testing:
 *   UMK3_SHOT=<n>     tick n times, write umk3-game.ppm, quit
 *   UMK3_TAPS=<list>  scripted taps, "tick:x,y;tick:x,y;..." in game
 *                     coordinates (480x320), each a press held for 3 ticks;
 *                     the mouse is ignored while a script runs
 *   UMK3_LOG_TASKS=1  print every change of CurrentTask and FE_CurrentTask
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform/platform.h"
#include "platform/gl.h"

#define VIRT_W 480
#define VIRT_H 320
#define SCALE    2

void  lime_platform_set_asset_root(const char *path);
void  lime_gl_set_screen(int w, int h);

void  limeGetLanguage(char *dst, int len);
const char *limeGetPropertyString(const char *key);
void  Load_SettingsData(void);
void  GameCodeInit(void);
void  fight_runtime_init(void);
void  GameCodeMain(void);

void  lime_menu_advance_clock(double seconds);
void  lime_touch_began(float x, float y);
void  lime_touch_moved(float x, float y, float prev_x, float prev_y);
void  lime_touch_ended(float x, float y, float prev_x, float prev_y);
void  lime_app_resign_active(void);
void  lime_app_become_active(void);

extern char Language[10];
extern int  CurrentTask;
extern int  FE_CurrentTask;

static void save_shot(int w, int h)
{
    unsigned char *px = (unsigned char *)malloc((size_t)w * h * 3);
    FILE *f;
    int y;

    if (px == NULL)
        return;
    glPixelStorei(GL_PACK_ALIGNMENT, 1);
    glReadPixels(0, 0, w, h, GL_RGB, GL_UNSIGNED_BYTE, px);
    f = fopen("umk3-game.ppm", "wb");
    if (f) {
        fprintf(f, "P6\n%d %d\n255\n", w, h);
        for (y = h - 1; y >= 0; y--)
            fwrite(px + (size_t)y * w * 3, 1, (size_t)w * 3, f);
        fclose(f);
        printf("wrote umk3-game.ppm (%dx%d)\n", w, h);
    }
    free(px);
}

/* -[UMK3AppDelegate startAppWithOptions:application:], the part that is the
 * game's: the language, with English when the bundle has no terms-of-service
 * URL for it, and the settings. The rest is UIKit and the EA SDK. */
static void start_app(void)
{
    char key[30];

    limeGetLanguage(Language, 10);
    snprintf(key, sizeof key, "TOS_URL_%s", Language);
    if (limeGetPropertyString(key) == NULL)
        memcpy(Language, "EN", 3);
    Load_SettingsData();
}

#ifdef _WIN32
/* A crash prints where it happened, as offsets into the executable, so that
 *   i686-w64-mingw32-addr2line -f -e umk3-game.exe 0x<image base + offset>
 * names the function. Bringing up a fight engine of two thousand functions
 * crashes in places no log line was planned for; this is the log line. */
#include <windows.h>

static LONG WINAPI on_crash(EXCEPTION_POINTERS *ep)
{
    HMODULE self = GetModuleHandleA(NULL);

    fprintf(stderr, "\ncrash: exception 0x%08lx at %p (image base %p)\n",
            (unsigned long)ep->ExceptionRecord->ExceptionCode,
            ep->ExceptionRecord->ExceptionAddress, (void *)self);
#if defined(_M_IX86) || defined(__i386__)
    {
        /* Walk the frame-pointer chain from the faulting context. */
        unsigned long *fp = (unsigned long *)ep->ContextRecord->Ebp;
        int i;
        fprintf(stderr, "  at  %p\n", (void *)ep->ContextRecord->Eip);
        for (i = 0; i < 24 && fp && !IsBadReadPtr(fp, 8); i++) {
            fprintf(stderr, "  ret %p\n", (void *)fp[1]);
            fp = (unsigned long *)fp[0];
        }
    }
#endif
    fflush(stderr);
    return EXCEPTION_EXECUTE_HANDLER;
}
#endif

/* UMK3_TAPS: "120:240,160;300:100,40" taps (240,160) at tick 120, and so on. */
typedef struct { long tick; float x, y; } TAP;
static TAP  g_taps[64];
static int  g_ntaps;

static void parse_taps(const char *s)
{
    while (s && *s && g_ntaps < 64) {
        TAP t;
        if (sscanf(s, "%ld:%f,%f", &t.tick, &t.x, &t.y) != 3)
            break;
        g_taps[g_ntaps++] = t;
        s = strchr(s, ';');
        if (s)
            s++;
    }
}

int main(int argc, char **argv)
{
    const char *root = (argc > 1) ? argv[1] : "res";
    const char *shot = getenv("UMK3_SHOT");
    int    shot_at = shot ? atoi(shot) : 0;
    int    log_tasks = getenv("UMK3_LOG_TASKS") != NULL;
    long   ticks = 0;
    int    focused = 1, was_down = 0, last_task = -1, last_fe = -1;
    double last, acc = 0.0;

    setvbuf(stdout, NULL, _IONBF, 0);
#ifdef _WIN32
    /* No argument: `res` beside the exe, wherever it was started from, so a
     * double-click in the game folder just works. */
    static char exe_res[MAX_PATH + 8];
    if (argc <= 1) {
        DWORD len = GetModuleFileNameA(NULL, exe_res, MAX_PATH);
        char *slash = (len > 0 && len < MAX_PATH) ? strrchr(exe_res, '\\') : NULL;
        if (slash) {
            strcpy(slash + 1, "res");
            root = exe_res;
        }
    }
    SetUnhandledExceptionFilter(on_crash);
#endif
    parse_taps(getenv("UMK3_TAPS"));

    if (!plat_open("Ultimate Mortal Kombat 3", VIRT_W * SCALE, VIRT_H * SCALE)) {
        fprintf(stderr, "could not open a window\n");
        return 1;
    }
    lime_platform_set_asset_root(root);
    lime_gl_set_screen(VIRT_W, VIRT_H);

    start_app();
    /* Before GameCodeInit: the front end and the fight engine have to share
     * one G, H, MKEventQueue and RoundParam -- the storage the fight's tables
     * point into -- before anything is written through them. */
    fight_runtime_init();
    GameCodeInit();

    last = plat_time();
    while (plat_poll()) {
        int mx, my, down, ww, wh;

        /* The window's focus is the app's foreground; see runtime/lime_app.c. */
        {
            int f = shot_at ? 1 : plat_focused();
            if (f != focused) {
                focused = f;
                if (f) {
                    lime_app_become_active();
                    last = plat_time();
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

        acc += plat_time() - last;
        last = plat_time();
        if (acc > 0.25)
            acc = 0.25;
        if (acc < 1.0 / 60.0)
            continue;

        plat_size(&ww, &wh);

        /* The mouse as one finger, on its edges; see runtime/menu_main.c. */
        /* A scripted run is the script's alone: a click on the window
         * would be a second finger nobody asked for. */
        down = plat_mouse(&mx, &my) && g_ntaps == 0;
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

        while (acc >= 1.0 / 60.0) {
            int i;

            /* Scripted taps: press on the tick, release three later. */
            for (i = 0; i < g_ntaps; i++) {
                if (g_taps[i].tick == ticks)
                    lime_touch_began(g_taps[i].x, g_taps[i].y);
                if (g_taps[i].tick + 3 == ticks)
                    lime_touch_ended(g_taps[i].x, g_taps[i].y,
                                     g_taps[i].x, g_taps[i].y);
            }

            /* -[EAGLView drawView]: one tick is one clear and one frame. */
            glViewport(0, 0, ww, wh);
            glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
            lime_menu_advance_clock(1.0 / 60.0);
            GameCodeMain();

            if (log_tasks && (CurrentTask != last_task
                              || FE_CurrentTask != last_fe)) {
                printf("tick %ld: task %d, front-end task %d\n",
                       ticks, CurrentTask, FE_CurrentTask);
                last_task = CurrentTask;
                last_fe = FE_CurrentTask;
            }
            acc -= 1.0 / 60.0;
            ticks++;
        }
        plat_audio_update();

        if (shot_at > 0 && ticks >= shot_at) {
            save_shot(ww, wh);
            break;
        }
        if (!plat_swap())
            break;
    }

    plat_close();
    return 0;
}
