/*
 * debug_menu.c -- the in-game debug menu (F2), a test aid, not part of the game.
 *
 * Only there when umk3.ini says debug_keys=1 (the launcher's "Debug mode"
 * box). F2 opens it over the game, which freezes underneath -- the frame it
 * was showing stays as a dimmed backdrop and GameCodeMain is not called while
 * the menu is up. Arrows or W/S move, left/right change a value, Enter picks,
 * F2 closes.
 *
 *     FIGHTER 1 / FIGHTER 2   any of CharacterNames' 26, the bosses included
 *     STAGE                   a Level_Info row, 0..15
 *     START FIGHT             from the menus or from inside a fight
 *     SCREEN                  any of the front end's 51 screens
 *     MAIN MENU
 *     WIN / LOSE ROUND, WIN MATCH (skips the fight), LOSE MATCH   only while
 *                             a round is in play (not in the intro, the
 *                             round summary, a finisher or the pause)
 *     ARCADE: MOTARO / SHAO KAHN  Arcade only: the next fight is that boss
 *     DIRECT KEYS             F3, F6..F12 on or off (on at start)
 *     INFO                    the task / screen line in the corner (also F3)
 *
 * Everything is drawn here, with a 5x7 font of its own, in the 480x320 space
 * the game uses; nothing comes from the game's assets, so the menu works on a
 * screen whose own textures are broken. What a pick DOES is game_main.c's
 * business: this file only hands back a request.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform/platform.h"
#include "platform/gl.h"
#include "debug_menu.h"

#ifndef GL_CLAMP
#define GL_CLAMP 0x2900
#endif

extern const char *CharacterNames[26];
extern const char *FETaskNames[DBG_SCREENS];
extern char Level_Info[];

#define N_FIGHTERS 26
#define N_STAGES   16
#define LEVEL_INFO_STRIDE 0xf4

/* ------------------------------------------------------------------ font */

/* 5x7, one byte per row, bit 4 the leftmost pixel; ' ' to '_'. */
static const unsigned char k_font[64][7] = {
    {0,0,0,0,0,0,0},                                    /* ' ' */
    {0x04,0x04,0x04,0x04,0x04,0x00,0x04},               /* ! */
    {0x0A,0x0A,0x00,0x00,0x00,0x00,0x00},               /* " */
    {0x0A,0x0A,0x1F,0x0A,0x1F,0x0A,0x0A},               /* # */
    {0x04,0x0F,0x14,0x0E,0x05,0x1E,0x04},               /* $ */
    {0x18,0x19,0x02,0x04,0x08,0x13,0x03},               /* % */
    {0x0C,0x12,0x14,0x08,0x15,0x12,0x0D},               /* & */
    {0x0C,0x04,0x08,0x00,0x00,0x00,0x00},               /* ' */
    {0x02,0x04,0x08,0x08,0x08,0x04,0x02},               /* ( */
    {0x08,0x04,0x02,0x02,0x02,0x04,0x08},               /* ) */
    {0x00,0x04,0x15,0x0E,0x15,0x04,0x00},               /* * */
    {0x00,0x04,0x04,0x1F,0x04,0x04,0x00},               /* + */
    {0x00,0x00,0x00,0x00,0x0C,0x04,0x08},               /* , */
    {0x00,0x00,0x00,0x1F,0x00,0x00,0x00},               /* - */
    {0x00,0x00,0x00,0x00,0x00,0x0C,0x0C},               /* . */
    {0x00,0x01,0x02,0x04,0x08,0x10,0x00},               /* / */
    {0x0E,0x11,0x13,0x15,0x19,0x11,0x0E},               /* 0 */
    {0x04,0x0C,0x04,0x04,0x04,0x04,0x0E},               /* 1 */
    {0x0E,0x11,0x01,0x02,0x04,0x08,0x1F},               /* 2 */
    {0x1F,0x02,0x04,0x02,0x01,0x11,0x0E},               /* 3 */
    {0x02,0x06,0x0A,0x12,0x1F,0x02,0x02},               /* 4 */
    {0x1F,0x10,0x1E,0x01,0x01,0x11,0x0E},               /* 5 */
    {0x06,0x08,0x10,0x1E,0x11,0x11,0x0E},               /* 6 */
    {0x1F,0x01,0x02,0x04,0x08,0x08,0x08},               /* 7 */
    {0x0E,0x11,0x11,0x0E,0x11,0x11,0x0E},               /* 8 */
    {0x0E,0x11,0x11,0x0F,0x01,0x02,0x0C},               /* 9 */
    {0x00,0x0C,0x0C,0x00,0x0C,0x0C,0x00},               /* : */
    {0x00,0x0C,0x0C,0x00,0x0C,0x04,0x08},               /* ; */
    {0x02,0x04,0x08,0x10,0x08,0x04,0x02},               /* < */
    {0x00,0x00,0x1F,0x00,0x1F,0x00,0x00},               /* = */
    {0x08,0x04,0x02,0x01,0x02,0x04,0x08},               /* > */
    {0x0E,0x11,0x01,0x02,0x04,0x00,0x04},               /* ? */
    {0x0E,0x11,0x17,0x15,0x17,0x10,0x0F},               /* @ */
    {0x0E,0x11,0x11,0x1F,0x11,0x11,0x11},               /* A */
    {0x1E,0x11,0x11,0x1E,0x11,0x11,0x1E},               /* B */
    {0x0E,0x11,0x10,0x10,0x10,0x11,0x0E},               /* C */
    {0x1C,0x12,0x11,0x11,0x11,0x12,0x1C},               /* D */
    {0x1F,0x10,0x10,0x1E,0x10,0x10,0x1F},               /* E */
    {0x1F,0x10,0x10,0x1E,0x10,0x10,0x10},               /* F */
    {0x0E,0x11,0x10,0x17,0x11,0x11,0x0F},               /* G */
    {0x11,0x11,0x11,0x1F,0x11,0x11,0x11},               /* H */
    {0x0E,0x04,0x04,0x04,0x04,0x04,0x0E},               /* I */
    {0x07,0x02,0x02,0x02,0x02,0x12,0x0C},               /* J */
    {0x11,0x12,0x14,0x18,0x14,0x12,0x11},               /* K */
    {0x10,0x10,0x10,0x10,0x10,0x10,0x1F},               /* L */
    {0x11,0x1B,0x15,0x15,0x11,0x11,0x11},               /* M */
    {0x11,0x11,0x19,0x15,0x13,0x11,0x11},               /* N */
    {0x0E,0x11,0x11,0x11,0x11,0x11,0x0E},               /* O */
    {0x1E,0x11,0x11,0x1E,0x10,0x10,0x10},               /* P */
    {0x0E,0x11,0x11,0x11,0x15,0x12,0x0D},               /* Q */
    {0x1E,0x11,0x11,0x1E,0x14,0x12,0x11},               /* R */
    {0x0F,0x10,0x10,0x0E,0x01,0x01,0x1E},               /* S */
    {0x1F,0x04,0x04,0x04,0x04,0x04,0x04},               /* T */
    {0x11,0x11,0x11,0x11,0x11,0x11,0x0E},               /* U */
    {0x11,0x11,0x11,0x11,0x11,0x0A,0x04},               /* V */
    {0x11,0x11,0x11,0x15,0x15,0x15,0x0A},               /* W */
    {0x11,0x11,0x0A,0x04,0x0A,0x11,0x11},               /* X */
    {0x11,0x11,0x11,0x0A,0x04,0x04,0x04},               /* Y */
    {0x1F,0x01,0x02,0x04,0x08,0x10,0x1F},               /* Z */
    {0x0E,0x08,0x08,0x08,0x08,0x08,0x0E},               /* [ */
    {0x00,0x10,0x08,0x04,0x02,0x01,0x00},               /* \ */
    {0x0E,0x02,0x02,0x02,0x02,0x02,0x0E},               /* ] */
    {0x04,0x0A,0x11,0x00,0x00,0x00,0x00},               /* ^ */
    {0x00,0x00,0x00,0x00,0x00,0x00,0x1F},               /* _ */
};

#define CH_W 6                          /* 5 pixels and a gap */
#define CH_H 9

static void rect(float x, float y, float w, float h)
{
    glVertex2f(x, y);
    glVertex2f(x + w, y);
    glVertex2f(x + w, y + h);
    glVertex2f(x, y + h);
}

/* One pixel of the font is `px` units of the 480x320 screen. Lower case is
 * drawn as upper case. Inside glBegin(GL_QUADS). */
static void text(float x, float y, float px, const char *s)
{
    for (; *s; s++, x += CH_W * px) {
        int c = (unsigned char)*s, row, col;
        if (c >= 'a' && c <= 'z')
            c -= 32;
        if (c < 32 || c > 95)
            c = '?';
        for (row = 0; row < 7; row++)
            for (col = 0; col < 5; col++)
                if (k_font[c - 32][row] & (0x10 >> col))
                    rect(x + col * px, y + row * px, px, px);
    }
}

/* -------------------------------------------------------------- GL state */

static const GLenum k_caps[] = {
    GL_TEXTURE_2D, GL_DEPTH_TEST, GL_CULL_FACE, GL_FOG, GL_ALPHA_TEST,
    GL_LIGHTING, GL_BLEND
};
#define N_CAPS (int)(sizeof k_caps / sizeof k_caps[0])

static struct {
    GLint caps[N_CAPS], src, dst, tex, mode;
    GLfloat colour[4];
} g_saved;

/* The game sets most of its state once and expects to find it again, so the
 * menu puts back everything it touches. */
static void begin_2d(void)
{
    int i;

    for (i = 0; i < N_CAPS; i++)
        glGetIntegerv(k_caps[i], &g_saved.caps[i]);
    glGetIntegerv(GL_BLEND_SRC, &g_saved.src);
    glGetIntegerv(GL_BLEND_DST, &g_saved.dst);
    glGetIntegerv(GL_TEXTURE_BINDING_2D, &g_saved.tex);
    glGetIntegerv(GL_MATRIX_MODE, &g_saved.mode);
    glGetFloatv(GL_CURRENT_COLOR, g_saved.colour);

    glMatrixMode(GL_PROJECTION);
    glPushMatrix();
    glLoadIdentity();
    glOrtho(0.0, 480.0, 320.0, 0.0, -1.0, 1.0);
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();
    for (i = 0; i < N_CAPS; i++)
        glDisable(k_caps[i]);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
}

static void end_2d(void)
{
    int i;

    glMatrixMode(GL_MODELVIEW);
    glPopMatrix();
    glMatrixMode(GL_PROJECTION);
    glPopMatrix();
    glMatrixMode((GLenum)g_saved.mode);
    for (i = 0; i < N_CAPS; i++)
        (g_saved.caps[i] ? glEnable : glDisable)(k_caps[i]);
    glBlendFunc((GLenum)g_saved.src, (GLenum)g_saved.dst);
    glBindTexture(GL_TEXTURE_2D, (GLuint)g_saved.tex);
    glColor4f(g_saved.colour[0], g_saved.colour[1], g_saved.colour[2],
              g_saved.colour[3]);
}

/* ------------------------------------------------------------- backdrop */

static GLuint g_shot;                   /* the frozen frame, or 0 */

/* The frame the game has just drawn, still in the back buffer. */
static void grab(int vx, int vy, int vw, int vh)
{
    unsigned char *px = malloc((size_t)vw * vh * 4);
    GLint old;

    if (!px)
        return;
    glGetIntegerv(GL_TEXTURE_BINDING_2D, &old);
    glPixelStorei(GL_PACK_ALIGNMENT, 1);
    glReadPixels(vx, vy, vw, vh, GL_RGBA, GL_UNSIGNED_BYTE, px);
    if (!g_shot)
        glGenTextures(1, &g_shot);
    glBindTexture(GL_TEXTURE_2D, g_shot);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, vw, vh, 0, GL_RGBA,
                 GL_UNSIGNED_BYTE, px);
    glBindTexture(GL_TEXTURE_2D, (GLuint)old);
    free(px);
}

/* ----------------------------------------------------------------- menu */

enum {
    ROW_P1, ROW_P2, ROW_STAGE, ROW_FIGHT, ROW_SCREEN, ROW_MAIN,
    ROW_WIN_ROUND, ROW_LOSE_ROUND, ROW_WIN_MATCH, ROW_LOSE_MATCH,
    ROW_MOTARO, ROW_SK,
    ROW_KEYS, ROW_INFO, ROW_CLOSE, N_ROWS
};

static int g_open, g_want_open, g_row;
static int g_p1 = 15, g_p2 = 25, g_stage, g_screen;   /* Kitana vs Shao Kahn */
static int g_info;
static int g_keys = 1;                 /* the direct keys F3, F6..F12 */
static int g_task;                      /* CurrentTask while open */

int dbg_menu_is_open(void) { return g_open; }
int dbg_info_on(void)      { return g_info; }
int dbg_keys_on(void)      { return g_keys; }
void dbg_info_toggle(void) { g_info = !g_info; }

void dbg_menu_toggle(void)
{
    if (g_open) {
        g_open = 0;
        printf("debug menu: closed\n");
    } else
        g_want_open = 1;                /* opened after the next frame */
}

void dbg_menu_after_frame(int vx, int vy, int vw, int vh, int task, int fe)
{
    if (!g_want_open)
        return;
    g_want_open = 0;
    grab(vx, vy, vw, vh);
    g_open = 1;
    g_task = task;
    if (fe >= 0 && fe < DBG_SCREENS)
        g_screen = fe;
    printf("debug menu: open (task %d, screen %d)\n", task, fe);
}

static const char *stage_name(int i)
{
    static char buf[40];
    const char *s = *(const char *const *)(Level_Info + i * LEVEL_INFO_STRIDE + 0x1c);
    char *u;

    snprintf(buf, sizeof buf, "%s", s ? s : "?");
    if ((u = strstr(buf, "_LEVEL")) != NULL || (u = strchr(buf, '.')) != NULL)
        *u = 0;
    return buf;
}

/* A fight or a screen picked while the game is still loading waits for the
 * main menu (game_main.c queues it), so only the fight keys ever grey out. */
static int row_enabled(int row)
{
    if (row >= ROW_WIN_ROUND && row <= ROW_LOSE_MATCH)
        return g_task == 6 && dbg_round_live();
    if (row == ROW_MOTARO || row == ROW_SK)
        return dbg_in_arcade();
    return 1;
}

static int wrap(int v, int n) { return (v % n + n) % n; }

/* Key edges, read here so the menu never reaches the fight's input. */
static int edge(int k, int *was)
{
    int down = plat_key(k), hit = down && !*was;
    *was = down;
    return hit;
}

int dbg_menu_tick(struct dbg_request *rq)
{
    static int was[9];
    int up, down, left, right, ok;

    up    = edge(PK_UP, &was[0])    | edge(PK_P2_UP, &was[1]);
    down  = edge(PK_DOWN, &was[2])  | edge(PK_P2_DOWN, &was[3]);
    left  = edge(PK_LEFT, &was[4])  | edge(PK_P2_LEFT, &was[5]);
    right = edge(PK_RIGHT, &was[6]) | edge(PK_P2_RIGHT, &was[7]);
    ok    = edge(PK_OK, &was[8]);

    memset(rq, 0, sizeof *rq);
    if (up || down) {
        int i;
        for (i = 0; i < N_ROWS; i++) {          /* skip the greyed rows */
            g_row = wrap(g_row + (up ? -1 : 1), N_ROWS);
            if (row_enabled(g_row))
                break;
        }
    }
    if (left || right) {
        int d = right ? 1 : -1;
        switch (g_row) {
        case ROW_P1:     g_p1 = wrap(g_p1 + d, N_FIGHTERS); break;
        case ROW_P2:     g_p2 = wrap(g_p2 + d, N_FIGHTERS); break;
        case ROW_STAGE:  g_stage = wrap(g_stage + d, N_STAGES); break;
        case ROW_SCREEN: g_screen = wrap(g_screen + d, DBG_SCREENS); break;
        case ROW_INFO:   g_info = !g_info; break;
        case ROW_KEYS:   g_keys = !g_keys; break;
        }
    }
    if (!ok || !row_enabled(g_row))
        return 0;

    switch (g_row) {
    case ROW_P1: case ROW_P2: case ROW_STAGE:
        g_row = ROW_FIGHT;                      /* Enter on a value: go on */
        return 0;
    case ROW_FIGHT:
        rq->what = DBG_FIGHT;
        rq->a = g_p1; rq->b = g_p2; rq->c = g_stage;
        break;
    case ROW_SCREEN:
        rq->what = DBG_SCREEN;
        rq->a = g_screen;
        break;
    case ROW_MAIN:
        rq->what = DBG_SCREEN;
        rq->a = 0;
        break;
    case ROW_WIN_ROUND: case ROW_LOSE_ROUND:
    case ROW_WIN_MATCH: case ROW_LOSE_MATCH:
        rq->what = DBG_FIGHT_KEY;               /* 0..3, as F9..F12 */
        rq->a = g_row - ROW_WIN_ROUND;
        break;
    case ROW_MOTARO: case ROW_SK:
        rq->what = DBG_BOSS;
        rq->a = g_row == ROW_MOTARO ? 24 : 25;
        break;
    case ROW_INFO:
        g_info = !g_info;
        return 0;
    case ROW_KEYS:
        g_keys = !g_keys;
        return 0;
    case ROW_CLOSE:
        break;
    }
    g_open = 0;
    return rq->what != DBG_NONE;
}

void dbg_menu_draw(void)
{
    static const char *const label[N_ROWS] = {
        "FIGHTER 1", "FIGHTER 2", "STAGE", "START FIGHT", "SCREEN",
        "MAIN MENU", "WIN ROUND", "LOSE ROUND", "WIN MATCH (SKIP FIGHT)",
        "LOSE MATCH", "ARCADE: NEXT IS MOTARO", "ARCADE: NEXT IS SHAO KAHN",
        "DIRECT KEYS", "INFO LINE (F3)", "CLOSE"
    };
    const float px = 1.0f, x0 = 96.0f, y0 = 34.0f, lh = 15.0f;
    char v[64];
    int i;

    begin_2d();
    if (g_shot) {
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, g_shot);
        glColor4f(0.45f, 0.45f, 0.45f, 1.0f);
        glBegin(GL_QUADS);                      /* glReadPixels is bottom-up */
        glTexCoord2f(0, 1); glVertex2f(0, 0);
        glTexCoord2f(1, 1); glVertex2f(480, 0);
        glTexCoord2f(1, 0); glVertex2f(480, 320);
        glTexCoord2f(0, 0); glVertex2f(0, 320);
        glEnd();
        glDisable(GL_TEXTURE_2D);
    }

    glBegin(GL_QUADS);
    glColor4f(0.0f, 0.0f, 0.0f, 0.75f);
    rect(x0 - 12, y0 - 26, 480 - 2 * (x0 - 12), N_ROWS * lh + 52);
    glColor4f(0.8f, 0.1f, 0.1f, 0.9f);
    rect(x0 - 8, y0 + g_row * lh - 4, 480 - 2 * (x0 - 8), lh - 1);

    glColor4f(1.0f, 0.85f, 0.2f, 1.0f);
    text(x0, y0 - 20, px, "UMK3 DEBUG MENU");
    for (i = 0; i < N_ROWS; i++) {
        float y = y0 + i * lh;
        int on = row_enabled(i);

        v[0] = 0;
        switch (i) {
        case ROW_P1: snprintf(v, sizeof v, "< %2d %s >", g_p1, CharacterNames[g_p1]); break;
        case ROW_P2: snprintf(v, sizeof v, "< %2d %s >", g_p2, CharacterNames[g_p2]); break;
        case ROW_STAGE: snprintf(v, sizeof v, "< %2d %s >", g_stage, stage_name(g_stage)); break;
        case ROW_SCREEN:
            snprintf(v, sizeof v, "< %2d %s >", g_screen, FETaskNames[g_screen] + 8);
            break;
        case ROW_KEYS:
            snprintf(v, sizeof v, "< %s >  F3 F6-F12", g_keys ? "ON" : "OFF");
            break;
        case ROW_INFO: snprintf(v, sizeof v, "< %s >", g_info ? "ON" : "OFF"); break;
        }
        if (on)
            glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
        else
            glColor4f(0.45f, 0.45f, 0.45f, 1.0f);
        text(x0, y, px, label[i]);
        if (v[0])
            text(x0 + 100, y, px, v);
    }
    glColor4f(0.7f, 0.7f, 0.7f, 1.0f);
    text(x0, y0 + N_ROWS * lh + 6, px, "ARROWS MOVE  </> CHANGE  ENTER PICK  F2 CLOSE");
    glEnd();
    end_2d();
}

/* ---------------------------------------------------------------- frame
 *
 * Port only, not part of the game: in fullscreen the 3:2 game leaves bars at
 * the sides of a wider screen; a picture of the player's choosing fills them
 * (umk3.ini marco=<file>, or marco.png beside the exe). It is drawn over the
 * whole window first and the game draws its 3:2 rectangle on top. "Cover"
 * scaling: the picture fills the window and is cropped, never stretched. */
#include "lime/png.h"

static GLuint g_frame_tex;
static int    g_frame_w, g_frame_h;

int dbg_frame_load(const char *path)
{
    uint8_t *px = NULL;
    int w = 0, h = 0;

    if (!path || !lime_png_load(path, &px, &w, &h))
        return 0;
    glGenTextures(1, &g_frame_tex);
    glBindTexture(GL_TEXTURE_2D, g_frame_tex);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA,
                 GL_UNSIGNED_BYTE, px);
    free(px);
    g_frame_w = w;
    g_frame_h = h;
    printf("frame picture: %s (%dx%d)\n", path, w, h);
    return 1;
}

/* The window is ww x wh pixels; the caller has set a full-window viewport. */
void dbg_frame_draw(int ww, int wh)
{
    float u0 = 0, v0 = 0, u1 = 1, v1 = 1;

    if (!g_frame_tex || ww <= 0 || wh <= 0)
        return;
    if ((float)g_frame_w / g_frame_h > (float)ww / wh) {
        float keep = ((float)ww / wh) / ((float)g_frame_w / g_frame_h);
        u0 = (1 - keep) / 2;
        u1 = u0 + keep;
    } else {
        float keep = ((float)g_frame_w / g_frame_h) / ((float)ww / wh);
        v0 = (1 - keep) / 2;
        v1 = v0 + keep;
    }
    begin_2d();
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, g_frame_tex);
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
    glBegin(GL_QUADS);                  /* the 480x320 ortho of begin_2d */
    glTexCoord2f(u0, v0); glVertex2f(0, 0);
    glTexCoord2f(u1, v0); glVertex2f(480, 0);
    glTexCoord2f(u1, v1); glVertex2f(480, 320);
    glTexCoord2f(u0, v1); glVertex2f(0, 320);
    glEnd();
    end_2d();
}

void dbg_info_draw(const char *line)
{
    begin_2d();
    glBegin(GL_QUADS);
    glColor4f(0.0f, 0.0f, 0.0f, 0.6f);
    rect(0, 0, (float)strlen(line) * CH_W + 4, CH_H + 2);
    glColor4f(0.4f, 1.0f, 0.4f, 1.0f);
    text(2, 2, 1.0f, line);
    glEnd();
    end_2d();
}
