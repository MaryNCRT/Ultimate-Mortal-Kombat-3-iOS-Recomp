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
 *
 * Keyboard, player 1, during a fight (runtime/platform's defaults):
 *   W A S D or the arrows   the joystick
 *   U  high punch   I  low punch   O  block
 *   J  high kick    K  low kick    L  run
 * Each key held is a synthetic touch on the real control -- the dial or the
 * on-screen button -- so it goes through ReadControls and CheckLeftDial
 * exactly as a finger does, and the button lights as if pressed.
 *
 * Debug, to skip the menus:
 *   umk3-game --fight <p1> <p2> [stage]     (or UMK3_FIGHT="p1,p2,stage")
 * goes straight from the main menu into a fight. A fighter is a name from
 * CharacterNames ("kitana", "kunglao", "sub-zero") or its number 0..25; the
 * stage is a Level_Info row, 0..15 (default 0). It sets what the select
 * screen would -- PLAYER1MODEL, PLAYER2MODEL, Character1/2, LevelSelect --
 * and hands the front end to Task_FEDestroy the way the tower does.
 *
 * A game started by double-click (stdout not redirected) writes everything it
 * prints -- task changes, loading steps, a crash's addresses -- to
 * logs/umk3-<date>-<time>.log beside the exe, one file per session. A log is
 * deleted once the error it shows has been found and fixed.
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
extern long PLAYER1MODEL, PLAYER2MODEL, Character1, Character2, LevelSelect,
            Character2Override;
extern const char *CharacterNames[26];

extern float limeTouchScreenX[10], limeTouchScreenY[10];
extern long  ButtonsPos[];              /* 6 x { x, y, ?, ?, button index } */
extern long  JoystickStatePosX, JoystickStatePosY;

/* Keyboard -> player 1, as touches. Slot 9 is the dial and slots 3..8 the
 * six buttons; the mouse takes the first free slot, from 0 up. */
static void keyboard_touches(void)
{
    static const int keys[6][2] = {     /* button index 0..5, two keys each */
        { PK_HP, PK_P2_HP }, { PK_LP, PK_P2_LP }, { PK_BL, PK_P2_BL },
        { PK_HK, PK_P2_HK }, { PK_LK, PK_P2_LK }, { PK_RUN, PK_P2_RUN },
    };
    static int owned[10];
    int dx, dy, b, i;

    dx = (plat_key(PK_RIGHT) || plat_key(PK_P2_RIGHT))
       - (plat_key(PK_LEFT) || plat_key(PK_P2_LEFT));
    dy = (plat_key(PK_DOWN) || plat_key(PK_P2_DOWN))
       - (plat_key(PK_UP) || plat_key(PK_P2_UP));
    if (CurrentTask != 6)
        dx = dy = 0;
    if (dx || dy) {
        /* between JINNERDIAL (22.85) and the outer ring (80) */
        float len = (dx && dy) ? 0.7071f : 1.0f;
        limeTouchScreenX[9] = (float)JoystickStatePosX + dx * len * 45.0f;
        limeTouchScreenY[9] = (float)JoystickStatePosY + dy * len * 45.0f;
        owned[9] = 1;
    } else if (owned[9]) {
        limeTouchScreenX[9] = limeTouchScreenY[9] = -1.0f;
        owned[9] = 0;
    }

    for (b = 0; b < 6; b++) {
        int slot = 3 + b, down = 0;

        if (CurrentTask == 6 && (plat_key(keys[b][0]) || plat_key(keys[b][1])))
            for (i = 0; i < 6; i++)
                if (ButtonsPos[i * 5 + 4] == b) {
                    limeTouchScreenX[slot] = (float)ButtonsPos[i * 5];
                    limeTouchScreenY[slot] = (float)ButtonsPos[i * 5 + 1];
                    down = 1;
                }
        if (down)
            owned[slot] = 1;
        else if (owned[slot]) {
            limeTouchScreenX[slot] = limeTouchScreenY[slot] = -1.0f;
            owned[slot] = 0;
        }
    }
}

/* --fight: -1 until parsed. */
static long g_fight_p1 = -1, g_fight_p2 = -1, g_fight_stage = 0;

/* A fighter by number or by name, ignoring case, spaces and hyphens. */
static long fighter_id(const char *s)
{
    long i;
    char *end;

    i = strtol(s, &end, 10);
    if (*s && *end == 0)
        return (i >= 0 && i < 26) ? i : -1;
    for (i = 0; i < 26; i++) {
        const char *a = CharacterNames[i], *b = s;
        for (;;) {
            while (*a == ' ' || *a == '-') a++;
            while (*b == ' ' || *b == '-' || *b == '_') b++;
            if (!*a || !*b || (*a | 0x20) != (*b | 0x20))
                break;
            a++, b++;
        }
        if (!*a && !*b)
            return i;
    }
    return -1;
}

static void parse_fight(const char *p1, const char *p2, const char *stage)
{
    g_fight_p1 = fighter_id(p1);
    g_fight_p2 = fighter_id(p2);
    g_fight_stage = stage ? atol(stage) : 0;
    if (g_fight_p1 < 0 || g_fight_p2 < 0 || g_fight_stage < 0
        || g_fight_stage > 15) {
        fprintf(stderr, "--fight: unknown fighter or stage (%s %s %s)\n",
                p1, p2, stage ? stage : "0");
        g_fight_p1 = g_fight_p2 = -1;
    }
}

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
#include <io.h>

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

/* stdout and stderr into logs/umk3-<date>-<time>.log beside the exe, unless
 * they already go to a file or pipe (a scripted run's `> x.log`). Returns
 * whether it did, so task changes are logged in every session. */
static int open_session_log(void)
{
    static char path[MAX_PATH + 64];
    DWORD type = GetFileType(GetStdHandle(STD_OUTPUT_HANDLE));
    DWORD len;
    char *slash;
    SYSTEMTIME t;

    if (type == FILE_TYPE_DISK || type == FILE_TYPE_PIPE)
        return 0;
    len = GetModuleFileNameA(NULL, path, MAX_PATH);
    slash = (len > 0 && len < MAX_PATH) ? strrchr(path, '\\') : NULL;
    if (!slash)
        return 0;
    strcpy(slash + 1, "logs");
    CreateDirectoryA(path, NULL);
    GetLocalTime(&t);
    sprintf(slash + 1, "logs\\umk3-%04d%02d%02d-%02d%02d%02d.log",
            t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond);
    if (!freopen(path, "w", stdout))
        return 0;
    setvbuf(stdout, NULL, _IONBF, 0);
    if (_dup2(_fileno(stdout), _fileno(stderr)) == 0)
        setvbuf(stderr, NULL, _IONBF, 0);
    printf("session log %04d-%02d-%02d %02d:%02d:%02d\n",
           t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond);
    return 1;
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

void umk3_relocate_level_info(void);   /* build/level_info.c */

/* umk3.ini beside the exe, written by the launcher (tools/launcher):
 *
 *     width=1440
 *     height=960
 *     fullscreen=0
 *     language=ES
 *
 * The window size is the 3D resolution: the game draws straight into it.
 * Missing file or keys keep the defaults. */
static int  g_cfg_w = VIRT_W * SCALE, g_cfg_h = VIRT_H * SCALE, g_cfg_full;
static char g_cfg_lang[8];

static void read_config(const char *dir)
{
    char path[1100], line[128];
    FILE *f;

    snprintf(path, sizeof path, "%s%s", dir, "umk3.ini");
    f = fopen(path, "r");
    if (!f)
        return;
    while (fgets(line, sizeof line, f)) {
        char *v = strchr(line, '='), *e;
        if (!v)
            continue;
        *v++ = 0;
        for (e = v + strlen(v); e > v && (unsigned char)e[-1] <= 32; )
            *--e = 0;
        if (strcmp(line, "width") == 0 && atoi(v) >= VIRT_W)
            g_cfg_w = atoi(v);
        else if (strcmp(line, "height") == 0 && atoi(v) >= VIRT_H)
            g_cfg_h = atoi(v);
        else if (strcmp(line, "fullscreen") == 0)
            g_cfg_full = atoi(v) != 0;
        else if (strcmp(line, "language") == 0)
            snprintf(g_cfg_lang, sizeof g_cfg_lang, "%s", v);
    }
    fclose(f);
}

/* The largest 3:2 rectangle centred in the window: the game is drawn for a
 * 480x320 screen, so a fullscreen 16:9 monitor gets bars, not a stretch. */
static void fit_view(int ww, int wh, int *vx, int *vy, int *vw, int *vh)
{
    if ((long)ww * VIRT_H > (long)wh * VIRT_W) {
        *vh = wh;
        *vw = (int)((long)wh * VIRT_W / VIRT_H);
    } else {
        *vw = ww;
        *vh = (int)((long)ww * VIRT_H / VIRT_W);
    }
    *vx = (ww - *vw) / 2;
    *vy = (wh - *vh) / 2;
}

int main(int argc, char **argv)
{
    const char *root = (argc > 1 && argv[1][0] != '-') ? argv[1] : "res";
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
    if (argc <= 1 || argv[1][0] == '-') {
        DWORD len = GetModuleFileNameA(NULL, exe_res, MAX_PATH);
        char *slash = (len > 0 && len < MAX_PATH) ? strrchr(exe_res, '\\') : NULL;
        if (slash) {
            slash[1] = 0;
            read_config(exe_res);
            strcpy(slash + 1, "res");
            root = exe_res;
        }
    }
    if (g_cfg_lang[0] && !getenv("UMK3_LANG")) {
        static char env[24];
        snprintf(env, sizeof env, "UMK3_LANG=%s", g_cfg_lang);
        _putenv(env);
    }
    /* The game reads only this folder. Say what to do instead of opening a
     * black window when it is missing or was set up without Info.plist. */
    {
        char probe[MAX_PATH + 32];
        FILE *f;
        _snprintf(probe, sizeof probe, "%s\\Info.plist", root);
        probe[sizeof probe - 1] = 0;
        f = fopen(probe, "rb");
        if (!f) {
            MessageBoxA(NULL,
                "No se encontro la carpeta res completa junto a umk3-game.exe.\n\n"
                "Abre UMK3-Launcher.exe, elige tu UMK3 .ipa y pulsa Compilar.\n\n"
                "The res folder beside umk3-game.exe is missing or incomplete.\n"
                "Open UMK3-Launcher.exe, choose your UMK3 .ipa and press Compilar.",
                "Ultimate Mortal Kombat 3", MB_OK | MB_ICONERROR);
            return 1;
        }
        fclose(f);
    }
    SetUnhandledExceptionFilter(on_crash);
    if (open_session_log())
        log_tasks = 1;
#endif
    parse_taps(getenv("UMK3_TAPS"));
    {
        int i;
        for (i = 1; i < argc; i++)
            if (strcmp(argv[i], "--fight") == 0 && i + 2 < argc) {
                parse_fight(argv[i + 1], argv[i + 2],
                            i + 3 < argc ? argv[i + 3] : NULL);
                break;
            }
        if (g_fight_p1 < 0 && getenv("UMK3_FIGHT")) {
            char buf[128], *a, *b, *c;
            snprintf(buf, sizeof buf, "%s", getenv("UMK3_FIGHT"));
            a = buf;
            b = strchr(a, ',');
            if (b) {
                *b++ = 0;
                c = strchr(b, ',');
                if (c)
                    *c++ = 0;
                parse_fight(a, b, c);
            }
        }
    }

    if (!plat_open("Ultimate Mortal Kombat 3", g_cfg_w, g_cfg_h)) {
        fprintf(stderr, "could not open a window\n");
        return 1;
    }
    if (g_cfg_full)
        plat_fullscreen();
    lime_platform_set_asset_root(root);
    lime_gl_set_screen(VIRT_W, VIRT_H);

    start_app();
    /* Before GameCodeInit: the front end and the fight engine have to share
     * one G, H, MKEventQueue and RoundParam -- the storage the fight's tables
     * point into -- before anything is written through them. */
    fight_runtime_init();
    /* Level_Info's scene and layer names are iOS addresses until this runs
     * (tools/level_info.py); GameInit_LoadABit reads them at steps 27-29. */
    umk3_relocate_level_info();
    GameCodeInit();

    last = plat_time();
    while (plat_poll()) {
        int mx, my, down, ww, wh, vx, vy, vw, vh;

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
        fit_view(ww, wh, &vx, &vy, &vw, &vh);

        /* The mouse as one finger, on its edges; see runtime/menu_main.c. */
        /* A scripted run is the script's alone: a click on the window
         * would be a second finger nobody asked for. */
        down = plat_mouse(&mx, &my) && g_ntaps == 0;
        {
            static float prev_tx = -1.0f, prev_ty = -1.0f;
            float tx = (float)(mx - vx) * VIRT_W / (vw ? vw : 1);
            float ty = (float)(my - vy) * VIRT_H / (vh ? vh : 1);

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
            glViewport(vx, vy, vw, vh);
            glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
            lime_menu_advance_clock(1.0 / 60.0);
            keyboard_touches();
            GameCodeMain();

            /* --fight: once the main menu is up, do what the select screen
             * and the tower would, and leave the front end. */
            {
                static long in_fe;
                in_fe = (CurrentTask == 3) ? in_fe + 1 : 0;
                if (g_fight_p1 >= 0 && in_fe < 30)
                    goto no_fight_yet;  /* the front end's first frames */
            }
            if (g_fight_p1 >= 0 && CurrentTask == 3) {
                PLAYER1MODEL = Character1 = g_fight_p1;
                PLAYER2MODEL = Character2 = Character2Override = g_fight_p2;
                LevelSelect = g_fight_stage;
                printf("--fight: %s vs %s, stage %ld\n",
                       CharacterNames[g_fight_p1], CharacterNames[g_fight_p2],
                       g_fight_stage);
                CurrentTask = 4;                /* Task_FEDestroy */
                g_fight_p1 = -1;
            }
        no_fight_yet:

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
