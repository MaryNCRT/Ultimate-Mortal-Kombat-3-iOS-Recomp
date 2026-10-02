/*
 * lime_menu.c — the rest of the engine's platform API, for the front end.
 *
 * `lime_platform.c` covers what the differential tests need: files, memory,
 * textures, blend state, and a `limeDrawSprite` that records rather than draws.
 * The front end needs more than that — it is 291 functions of menus that expect
 * a screen size, a touch position, a frame-rate scale, a 2D mode, a fill, and a
 * sound layer. This file is the rest of that boundary, and it is what takes
 * `decomp/gamecode` from "compiles" to "links".
 *
 * ## What is real here and what is not
 *
 * **Real:** the state the front end reads back and branches on. Screen size,
 * `limeFPSScaleFactor`, the touch globals, the matrix stack, the language, and
 * the save file. Every one of those changes what the decompiled code *does*, so
 * a stub that lies about them would produce a menu that behaves differently
 * from the original for reasons nobody could trace.
 *
 * **Sound is real** since 2026-10-02: sounds and tunes go to platform.h's
 * mixer, with the semantics read off the binary (see the sound section).
 * `limePlaySound` still counts, so a test can assert a click was requested
 * without a device to hear it.
 *
 * **Not real:** vibration, the modal dialogs and the loading spinner -- their
 * only effect is on the glass or the hand, and nothing reads them back.
 *
 * The line between the two is not "is it easy" -- it is **does the game read it
 * back**. `limeGetStringWidth` is in `decomp/lime/limeFont.c` because the front
 * end lays out text against the answer; nothing ever asks how a note sounded,
 * so sound needs no more than to be heard.
 *
 * ## limeFPSScaleFactor is 1.0 and that is a decision
 *
 * Every timer in the front end divides by it -- `0.01f / limeFPSScaleFactor` a
 * frame -- so it sets what a "frame" means. Holding it at 1.0 makes one call to
 * the task function one 60Hz frame, which is what the transcriptions were read
 * against. A host that runs faster should scale it rather than run the menus
 * faster, and `lime_menu_set_fps_scale` is how.
 */

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../decomp/lime/lime.h"
#include "platform/platform.h"
#include "wav.h"


/* ------------------------------------------------------------------ screen */

/* The retail surface. The transcriptions were read against 480x320 and every
 * mixed-scale site in the front end is invisible at exactly this size, so it is
 * the honest default: anything else exercises bugs the original never hit.
 * See issue #22. */
int   limeScreenWidth  = 480;
int   limeScreenHeight = 320;
int  *limeScreenWidthP  = &limeScreenWidth;
int  *limeScreenHeightP = &limeScreenHeight;

int   limeDeviceSideways         = 1;
int   limeDeferredDeviceSideways = 1;

void lime_menu_set_screen(int w, int h)
{
    limeScreenWidth  = w;
    limeScreenHeight = h;
}


/* -------------------------------------------------------------------- time */

float  limeFPS             = 60.0f;
float  limeFPSScaleFactor  = 1.0f;
float *limeFPSScaleFactorP = &limeFPSScaleFactor;
long   limeRenderedPolyCount;

void lime_menu_set_fps_scale(float f)
{
    /* Zero would divide by zero in every front-end timer at once, which reads
     * as "the menus froze" rather than as a bad argument. */
    limeFPSScaleFactor = (f > 0.0f) ? f : 1.0f;
}


/* ------------------------------------------------------------------- touch */

/* The front end tests these two ways round, and both spellings are load-bearing:
 * most screens read `limeLastTouchScreenX[0] == -1` for "a release happened
 * this frame" and take the position from `limeTouchScreenX`, while
 * FE_Task_Multiplayer_Versus_Screen does the exact opposite. Four floats, so a
 * host can drive either convention. -1 in both means "nothing". */
float limeTouchScreenX[4]     = { -1.0f, -1.0f, -1.0f, -1.0f };
float limeTouchScreenY[4]     = { -1.0f, -1.0f, -1.0f, -1.0f };
float limeLastTouchScreenX[4] = { -1.0f, -1.0f, -1.0f, -1.0f };
float limeLastTouchScreenY[4] = { -1.0f, -1.0f, -1.0f, -1.0f };

int limePressed;

void lime_menu_touch(float x, float y, int down)
{
    if (down) {
        limeTouchScreenX[0] = x;
        limeTouchScreenY[0] = y;
        limeLastTouchScreenX[0] = -1.0f;
        limeLastTouchScreenY[0] = -1.0f;
        limePressed = 1;
    } else {
        /* A release publishes the position through the Last pair and clears the
         * live one. That is the shape every hit test in the front end reads. */
        limeLastTouchScreenX[0] = limeTouchScreenX[0];
        limeLastTouchScreenY[0] = limeTouchScreenY[0];
        limeTouchScreenX[0] = -1.0f;
        limeTouchScreenY[0] = -1.0f;
        limePressed = 0;
    }
}

void lime_menu_touch_idle(void)
{
    limeTouchScreenX[0] = -1.0f;
    limeTouchScreenY[0] = -1.0f;
    limeLastTouchScreenX[0] = -1.0f;
    limeLastTouchScreenY[0] = -1.0f;
    limePressed = 0;
}


/* ------------------------------------------------------------ frame + mode */

static int g_in_2d;
static int g_depth_test = 1;
static int g_colour_mask = 1;
static long g_fills;

void limeBegin(void)  { limeRenderedPolyCount = 0; }
void limeFinish(void) { }

#ifndef UMK3_REAL_GL   /* headless; see runtime/draw_gl.c for the windowed half */
void limeSet2DDrawing(void)     { g_in_2d = 1; }
void limeEnableDepthTest(void)  { g_depth_test = 1; }
void limeDisableDepthTest(void) { g_depth_test = 0; }
void limeClearDepthBuffer(void) { }
void limeSetColourMask(int on)  { g_colour_mask = on; }

#endif  /* !UMK3_REAL_GL */
int  lime_menu_in_2d(void)      { return g_in_2d; }
int  lime_menu_depth_test(void) { return g_depth_test; }
long lime_menu_fill_count(void) { return g_fills; }

/* Counted, not drawn -- same contract as limeDrawSprite next door. The front
 * end fills rectangles for the button-editor's forbidden bands and for the
 * treasure screen's portrait box, and a test can assert the count without a
 * window. */
#ifndef UMK3_REAL_GL   /* headless; see runtime/draw_gl.c for the windowed half */
void limeFillRect(float x, float y, float w, float h,
                  float r, float g, float b, float a)
{
    (void)x; (void)y; (void)w; (void)h;
    (void)r; (void)g; (void)b; (void)a;
    g_fills++;
}
#endif  /* !UMK3_REAL_GL */

/* The three billboard entries the fight HUD uses. The front end reaches none of
 * them; they are here so the module links whole rather than in pieces. */
void limeDrawFaceMeSprite(TEXTURE *t, float *pos, float size, float *col)
{ (void)t; (void)pos; (void)size; (void)col; }

void limeDrawFaceMeSpriteWH(TEXTURE *t, float *pos, float w, float h, float *col)
{ (void)t; (void)pos; (void)w; (void)h; (void)col; }

void limeDrawFaceUpSprite(TEXTURE *t, float *pos, float size, float *col)
{ (void)t; (void)pos; (void)size; (void)col; }


/* ---------------------------------------------------------------- matrices */

/* The current model matrix, as the engine's own calls leave it. Identity is the
 * right start: the front end reads it back through limeGetCurrentModelMatrix to
 * place 3D characters against 2D menu coordinates, and a garbage matrix there
 * puts fighters off-screen in a way that looks like a decompilation error. */
static float g_model[16] = {
    1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 1, 0,
    0, 0, 0, 1,
};

void limeGetCurrentModelMatrix(float *out)
{
    memcpy(out, g_model, sizeof g_model);
}


/* `lime_platform.c` covers the six GL entries the engine's mesh path needs;
 * this is the seventh, which only the front end reaches -- DrawTower3D spins
 * the vortex with it and drawCharacterSelection turns the fighters. A no-op for
 * the same reason as its neighbours: this boundary tracks state, it does not
 * render, and a port that draws replaces the whole of it at once. */
#ifndef UMK3_REAL_GL   /* headless; see runtime/draw_gl.c for the windowed half */
void glRotatef(float angle, float x, float y, float z)
{
    (void)angle; (void)x; (void)y; (void)z;
}
#endif  /* !UMK3_REAL_GL */


/* ------------------------------------------------------------------- sound
 *
 * The iOS layer is Finch (one-shot `Sound` objects) and `GBMusicTrack` (one
 * streamed tune). What each entry point does was read off the binary --
 * `python tools/cd.py limeLoadSound limePlaySound limePlayTune ...` -- and is
 * kept here, down to the quirks:
 *
 *   limeInitSound      calls limeInitAudio, which clears the 512-entry
 *                      sound table (0x171c38)
 *   limeLoadSound      the first EMPTY slot gets [Sound initWithFile:
 *                      "res/audio/<name>.wav"] and its index is returned --
 *                      from 0, -1 only when all 512 are taken. A file that
 *                      fails to load leaves the slot empty and still returns
 *                      the index, so the next load reuses it.
 *   limePlaySound      id == -1 does nothing; otherwise `play`, then
 *                      `setGain:` with the second argument. The third and
 *                      fourth arguments are never read.
 *   limePlayTune       "res/audio/<name>", repeat if `loop`, gain vol / 100.
 *   limeSetTuneVol     gain vol / 100.
 *   limeStopTune       close and release the tune.
 *
 * The mixer under it is platform.h's: silent, not broken, without a device.
 */

void lime_platform_resolve(const char *rel, char *out, size_t n);
void limeLog(const char *fmt, ...);

#define LIME_SOUNDS 512

typedef struct {
    unsigned char *pcm;          /* NULL: the slot is empty */
    int            frames;
    int            rate;
} lime_sound;

static lime_sound g_sound[LIME_SOUNDS];
static long       g_sounds_played;

long lime_menu_sounds_played(void) { return g_sounds_played; }

/* [[Finch alloc] init], then the table cleared -- 0x200 words */
void limeInitAudio(void)
{
    int i;

    plat_audio_open(16000);             /* 496 of the 497 files are 16 kHz */
    for (i = 0; i < LIME_SOUNDS; i++) {
        free(g_sound[i].pcm);
        g_sound[i].pcm = NULL;
    }
}

void limeInitSound(void)
{
    limeInitAudio();                    /* all it does on device */
}

long limeLoadSound(const char *name)
{
    char rel[160], full[1200];
    long i;

    for (i = 0; i < LIME_SOUNDS; i++)
        if (!g_sound[i].pcm)
            break;
    if (i == LIME_SOUNDS)
        return -1;

    snprintf(rel, sizeof rel, "res/audio/%s.wav", name);
    lime_platform_resolve(rel, full, sizeof full);
    if (!wav_load_u8(full, &g_sound[i].pcm, &g_sound[i].frames, &g_sound[i].rate))
        g_sound[i].pcm = NULL;          /* as on device: the index, an empty slot */
    return i;
}

void limeDeleteSound(long h)
{
    if (h < 0 || h >= LIME_SOUNDS)
        return;
    free(g_sound[h].pcm);
    g_sound[h].pcm = NULL;
}

void limePlaySound(long h, float v, float p, long f)
{
    (void)p; (void)f;                   /* not read by the original either */
    if (h == -1)
        return;
    g_sounds_played++;
    if (h < 0 || h >= LIME_SOUNDS || !g_sound[h].pcm)
        return;
    plat_audio_play_at(g_sound[h].pcm, g_sound[h].frames, g_sound[h].rate, v);
}

/* limePlayTune keeps the path, the loop flag and the volume (lasttunevol,
 * lasttuneloop) for limeRestartPlayTune -- and sets the volume to -1 for a
 * tune that does not repeat, which is what makes the restart skip it. */
static char g_tune_path[1400];
static long g_tune_vol = -1, g_tune_loop;

void limePlayTune(const char *name, long vol, long loop)
{
    char rel[300];

    snprintf(rel, sizeof rel, "res/audio/%s", name);
    lime_platform_resolve(rel, g_tune_path, sizeof g_tune_path);
    g_tune_loop = loop;
    g_tune_vol  = loop ? vol : -1;    plat_music_volume((float)vol / 100.0f);
    plat_music_play(g_tune_path, loop != 0);
}

/* What the app delegate calls on returning to the foreground: the last
 * repeating tune again, from the start, at the last volume. */
void limeRestartPlayTune(void)
{
    if (g_tune_vol == -1)
        return;
    plat_music_volume((float)g_tune_vol / 100.0f);
    plat_music_play(g_tune_path, g_tune_loop != 0);
}

void limeStopTune(void)               { plat_music_stop(); }
void limeSetTuneVol(long v)
{
    g_tune_vol = v;                     /* lasttunevol, as limeSetTuneVol stores it */
    plat_music_volume((float)v / 100.0f);
}
/* AudioSessionGetProperty('othr') on device -- "is another app's audio
 * playing?" -- as 1 or 0. ResetSettingsData turns the game's music OFF when it
 * says yes. This was `void`, so the caller read whatever was in the return
 * register, nearly always non-zero, and a first run started with music off.
 * No other app owns the speakers here: 0. */
int limeCheckForUserMusic(void)       { return 0; }


/* ------------------------------------------------------------------ system */

/* The language decides three different CJK carve-outs in the front end alone
 * (FE_Task_Bios at 0.95, FE_Task_About_About at 0.8, FE_Task_About_Help scaling
 * both up), so it is read back and it matters. */
static char g_language[8] = "EN";

/* Fills the caller's buffer; it does not return one. GameCode.c calls it as
 * `limeGetLanguage(Language, 10)` and then builds "LANGUAGE_TEXT_%s" from what
 * it wrote -- declared as returning a pointer, `Language` stayed empty and the
 * key came out as "LANGUAGE_TEXT_", which Info.plist has no entry for. */
void limeGetLanguage(char *dst, int len)
{
    if (dst == NULL || len <= 0)
        return;
    snprintf(dst, (size_t)len, "%s", g_language);
}

void lime_menu_set_language(const char *code)
{
    strncpy(g_language, code ? code : "EN", sizeof g_language - 1);
    g_language[sizeof g_language - 1] = 0;
}

/* Info.plist, read once and searched per key.
 *
 * The file is the XML plist form: pairs of
 *
 *     <key>LANGUAGE_TEXT_EN</key>
 *     <string>english_text.dat</string>
 *
 * so a match is "find the key's text, then take the next <string>". Reading it
 * rather than hardcoding the answers keeps the language mapping the bundle's
 * business, which is what the game expects -- it asks for LANGUAGE_TEXT_%s and
 * the %s comes from the device's locale.
 */
const char *lime_platform_asset_root(void);

static char *g_plist;

static void plist_load(void)
{
    static int tried;
    char path[1100];
    const char *root;
    FILE *f;
    long n;

    if (tried)
        return;
    tried = 1;

    /* The bundle is the parent of res/. */
    root = lime_platform_asset_root();
    if (root == NULL || *root == 0)
        return;
    snprintf(path, sizeof(path), "%s/../Info.plist", root);

    f = fopen(path, "rb");
    if (f == NULL)
        return;
    fseek(f, 0, SEEK_END);
    n = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (n > 0 && n < (long)(4 * 1024 * 1024)) {
        g_plist = (char *)malloc((size_t)n + 1);
        if (g_plist && fread(g_plist, 1, (size_t)n, f) == (size_t)n)
            g_plist[n] = 0;
        else {
            free(g_plist);
            g_plist = NULL;
        }
    }
    fclose(f);
}

const char *limeGetPropertyString(const char *key)
{
    static char value[256];
    char needle[128];
    const char *at, *s, *e;

    if (key == NULL || *key == 0)
        return "";

    plist_load();
    if (g_plist) {
        snprintf(needle, sizeof(needle), "<key>%s</key>", key);
        at = strstr(g_plist, needle);
        if (at) {
            s = strstr(at + strlen(needle), "<string>");
            if (s) {
                s += 8;
                e = strstr(s, "</string>");
                if (e && (size_t)(e - s) < sizeof(value)) {
                    memcpy(value, s, (size_t)(e - s));
                    value[e - s] = 0;
                    return value;
                }
            }
        }
    }

    /* FE_Task_About_About prints this into "Version: %s". The binary this was
     * read from is 1.2.59, and it is the one answer worth keeping when the
     * plist is not where the assets are. */
    if (strcmp(key, "CFBundleVersion") == 0)
        return "1.2.59";
    return "";
}

long limeRand(void) { return rand(); }

void limeMemoryReport(const char *tag) { (void)tag; }

/* ------------------------------------------------------------- save files
 *
 * Read off the binary (`python tools/cd.py limeLoadSaveFile limeWriteFile`):
 *
 *   limeLoadSaveFile(name)   NSData dataWithContentsOfFile:
 *                            "<home>/Documents/<name>"; nil -> log "*** Load
 *                            failed: %s" and return NULL; else malloc(length),
 *                            getBytes:, log "*** Loaded %s, of size %d bytes"
 *                            and return the copy (the caller limeFree()s it).
 *   limeWriteFile(name, data, size)
 *                            dataWithBytes:length: then writeToFile:atomically:
 *                            YES; returns that BOOL. No caller reads it.
 *
 * One argument to the loader, not two: all the call sites pass only the name.
 * NULL is the "no save yet" path the game handles -- Reset_SaveData runs and
 * the tower starts empty.
 *
 * `Documents/` becomes UMK3_SAVE_DIR if set, else %APPDATA%/UMK3 on Windows
 * and $XDG_DATA_HOME/umk3 (~/.local/share/umk3) elsewhere. The directory is
 * made on the first write.
 */
#ifdef _WIN32
#include <direct.h>
#define lime_mkdir(p) _mkdir(p)
#else
#include <sys/stat.h>
#define lime_mkdir(p) mkdir((p), 0755)
#endif

void *limeMalloc(const char *tag, size_t bytes);

/* limeLog is EMPTY in the shipped binary (push the varargs, pop, return), so
 * nothing above was ever printed on device. UMK3_LOG=1 prints it here. */
void limeLog(const char *fmt, ...)
{
    va_list ap;
    const char *on = getenv("UMK3_LOG");

    if (!on || !*on)
        return;
    va_start(ap, fmt);
    vprintf(fmt, ap);
    va_end(ap);
}

static void save_dir(char *out, size_t n)
{
    const char *e = getenv("UMK3_SAVE_DIR");

    if (e && *e) {
        snprintf(out, n, "%s", e);
        return;
    }
#ifdef _WIN32
    e = getenv("APPDATA");
    snprintf(out, n, "%s/UMK3", (e && *e) ? e : ".");
#else
    e = getenv("XDG_DATA_HOME");
    if (e && *e)
        snprintf(out, n, "%s/umk3", e);
    else {
        e = getenv("HOME");
        snprintf(out, n, "%s/.local/share/umk3", (e && *e) ? e : ".");
    }
#endif
}

/* Make the save directory and its parents; existing ones are fine. */
static void make_dirs(char *path)
{
    char *p;

    for (p = path + 1; *p; p++) {
        if (*p == '/' || *p == '\\') {
            char c = *p;
            if (p[-1] == ':')           /* "C:/" is the drive, not a directory */
                continue;
            *p = 0;
            lime_mkdir(path);
            *p = c;
        }
    }
    lime_mkdir(path);
}

void *limeLoadSaveFile(const char *name)
{
    char dir[600], path[800];
    FILE *f;
    long n;
    void *buf;

    save_dir(dir, sizeof dir);
    snprintf(path, sizeof path, "%s/%s", dir, name);

    f = fopen(path, "rb");
    if (f == NULL) {
        limeLog("*** Load failed: %s\n", name);
        return NULL;
    }
    fseek(f, 0, SEEK_END);
    n = ftell(f);
    fseek(f, 0, SEEK_SET);
    buf = limeMalloc("savefile", n > 0 ? (size_t)n : 1);
    if (buf == NULL || (n > 0 && fread(buf, 1, (size_t)n, f) != (size_t)n)) {
        fclose(f);
        limeFree(buf);
        limeLog("*** Load failed: %s\n", name);
        return NULL;
    }
    fclose(f);
    limeLog("*** Loaded %s, of size %d bytes\n", name, (int)n);
    return buf;
}

long limeWriteFile(const char *name, const void *data, long size)
{
    char dir[600], path[800], tmp[820];
    FILE *f;
    int ok;

    save_dir(dir, sizeof dir);
    make_dirs(dir);
    snprintf(path, sizeof path, "%s/%s", dir, name);
    snprintf(tmp, sizeof tmp, "%s.tmp", path);

    /* atomically:YES -- a crash mid-write leaves the old file, not half of
     * the new one */
    f = fopen(tmp, "wb");
    if (f == NULL)
        return 0;
    ok = size <= 0 || fwrite(data, 1, (size_t)size, f) == (size_t)size;
    ok = (fclose(f) == 0) && ok;
    if (!ok) {
        remove(tmp);
        return 0;
    }
    remove(path);                       /* rename() does not replace on Windows */
    if (rename(tmp, path) != 0) {
        remove(tmp);
        return 0;
    }
    return 1;
}


/* --------------------------------------------------------- iOS-only chrome */

/* Modals, the spinner, vibration and the App Store link. All of them were UIKit
 * on the device and none has a host equivalent worth inventing. The two modals
 * answer "no", which is the branch that does not navigate anywhere. */
long limeModalAreYouSure(const char *msg)  { (void)msg; return 0; }
long limeModalNoInternet(const char *msg)  { (void)msg; return 0; }
void limeStartLoadingAnim(void)            { }
void limeStopLoadingAnim(void)             { }
void limeSetVibrate(long on)               { (void)on; }
void limeLoadURLInternal(const char *url)  { (void)url; }
void limeInit(void)                        { }
