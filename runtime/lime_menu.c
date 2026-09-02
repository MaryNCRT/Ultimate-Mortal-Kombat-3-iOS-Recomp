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
 * **Not real:** anything whose only effect is on the glass or the speaker.
 * Sound, tunes, vibration, the modal dialogs and the loading spinner do
 * nothing. They are recorded where recording is cheap, so a test can assert a
 * click was requested without a device to hear it.
 *
 * The line between the two is not "is it easy" -- it is **does the game read it
 * back**. `limeGetStringWidth` is in `decomp/lime/limeFont.c` because the front
 * end lays out text against the answer; `limePlaySound` is a counter because
 * nothing ever asks how the note sounded.
 *
 * ## limeFPSScaleFactor is 1.0 and that is a decision
 *
 * Every timer in the front end divides by it -- `0.01f / limeFPSScaleFactor` a
 * frame -- so it sets what a "frame" means. Holding it at 1.0 makes one call to
 * the task function one 60Hz frame, which is what the transcriptions were read
 * against. A host that runs faster should scale it rather than run the menus
 * faster, and `lime_menu_set_fps_scale` is how.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../decomp/lime/lime.h"


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

void limeSet2DDrawing(void)     { g_in_2d = 1; }
void limeEnableDepthTest(void)  { g_depth_test = 1; }
void limeDisableDepthTest(void) { g_depth_test = 0; }
void limeClearDepthBuffer(void) { }
void limeSetColourMask(int on)  { g_colour_mask = on; }

int  lime_menu_in_2d(void)      { return g_in_2d; }
int  lime_menu_depth_test(void) { return g_depth_test; }
long lime_menu_fill_count(void) { return g_fills; }

/* Counted, not drawn -- same contract as limeDrawSprite next door. The front
 * end fills rectangles for the button-editor's forbidden bands and for the
 * treasure screen's portrait box, and a test can assert the count without a
 * window. */
void limeFillRect(float x, float y, float w, float h,
                  float r, float g, float b, float a)
{
    (void)x; (void)y; (void)w; (void)h;
    (void)r; (void)g; (void)b; (void)a;
    g_fills++;
}

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
void glRotatef(float angle, float x, float y, float z)
{
    (void)angle; (void)x; (void)y; (void)z;
}


/* ------------------------------------------------------------------- sound */

static long g_sounds_played;
static long g_next_sound_handle = 1;

long lime_menu_sounds_played(void) { return g_sounds_played; }

void limeInitSound(void) { }

long limeLoadSound(const char *name)
{
    (void)name;
    /* A distinct non-zero handle per load. Zero would read as "failed" and the
     * front end skips the click on a zero handle, which would quietly hide a
     * real loading bug later. */
    return g_next_sound_handle++;
}

void limeDeleteSound(long h)                 { (void)h; }
void limePlaySound(long h, float v, float p, long f)
{ (void)h; (void)v; (void)p; (void)f; g_sounds_played++; }

void limePlayTune(const char *name, long vol, long loop)
{ (void)name; (void)vol; (void)loop; }
void limeStopTune(void)               { }
void limeSetTuneVol(long v)           { (void)v; }
void limeCheckForUserMusic(void)      { }


/* ------------------------------------------------------------------ system */

/* The language decides three different CJK carve-outs in the front end alone
 * (FE_Task_Bios at 0.95, FE_Task_About_About at 0.8, FE_Task_About_Help scaling
 * both up), so it is read back and it matters. */
static char g_language[8] = "EN";

const char *limeGetLanguage(void) { return g_language; }

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

/* The save file. Returning NULL is the "no save yet" path the game already
 * handles -- Reset_SaveData runs and the tower starts empty -- so this is a
 * real answer rather than a stub that pretends. */
/* One argument, not two. All sixteen call sites in the decomp pass only the
 * name; the size parameter was added here on the assumption that a loader
 * reports a length, and the caller then supplied whatever happened to be in
 * that register -- which this function wrote a zero through. */
void *limeLoadSaveFile(const char *name)
{
    (void)name;
    return NULL;                        /* no save file: the first-run path */
}

long limeWriteFile(const char *name, const void *data, long size)
{
    (void)name; (void)data;
    return size;
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
