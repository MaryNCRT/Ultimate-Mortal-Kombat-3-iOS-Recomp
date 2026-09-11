/*
 * fight_select.c -- the debug selector: pick a stage and a character, live.
 *
 * ## Why this is our own UI and not an entry in the game's menu
 *
 * The obvious thing to ask for is a DEBUG item inside the front end's PLAY
 * screen, and that is the one thing this project must not do. `decomp/` is a
 * transcription of the binary: every function in it is supposed to be what the
 * original does, so that a reader can check it against the disassembly.
 * Adding a menu entry means editing decompiled code to do something the
 * original never did, and from then on nobody can tell which lines are the
 * game and which are ours.
 *
 * So the selector lives here, in `runtime/`, where hand-written code belongs,
 * and it looks nothing like the game's menu on purpose. The real front end
 * still runs -- `umk3-test --menu` boots it, unmodified.
 *
 * ## The font
 *
 * Five by seven, uppercase and digits, as bit rows. The game's own font is a
 * texture in `res/` and drawing through it would mean the selector could not
 * appear before assets load, or when a stage fails to load, which is exactly
 * when a debug tool is most wanted. A hundred lines of bitmap has no such
 * failure mode.
 */

#include <stdio.h>
#include <string.h>

#include "platform/platform.h"
#include "platform/gl.h"
#include "fight_select.h"

/* ---------------------------------------------------------------- the font
 *
 * One byte per column, five columns, low bit at the top. Only the characters a
 * file stem can contain.
 */
typedef struct { char c; unsigned char col[5]; } glyph;

static const glyph FONT[] = {
    {'A',{0x7e,0x11,0x11,0x11,0x7e}}, {'B',{0x7f,0x49,0x49,0x49,0x36}},
    {'C',{0x3e,0x41,0x41,0x41,0x22}}, {'D',{0x7f,0x41,0x41,0x22,0x1c}},
    {'E',{0x7f,0x49,0x49,0x49,0x41}}, {'F',{0x7f,0x09,0x09,0x09,0x01}},
    {'G',{0x3e,0x41,0x49,0x49,0x7a}}, {'H',{0x7f,0x08,0x08,0x08,0x7f}},
    {'I',{0x00,0x41,0x7f,0x41,0x00}}, {'J',{0x20,0x40,0x41,0x3f,0x01}},
    {'K',{0x7f,0x08,0x14,0x22,0x41}}, {'L',{0x7f,0x40,0x40,0x40,0x40}},
    {'M',{0x7f,0x02,0x0c,0x02,0x7f}}, {'N',{0x7f,0x04,0x08,0x10,0x7f}},
    {'O',{0x3e,0x41,0x41,0x41,0x3e}}, {'P',{0x7f,0x09,0x09,0x09,0x06}},
    {'Q',{0x3e,0x41,0x51,0x21,0x5e}}, {'R',{0x7f,0x09,0x19,0x29,0x46}},
    {'S',{0x46,0x49,0x49,0x49,0x31}}, {'T',{0x01,0x01,0x7f,0x01,0x01}},
    {'U',{0x3f,0x40,0x40,0x40,0x3f}}, {'V',{0x1f,0x20,0x40,0x20,0x1f}},
    {'W',{0x3f,0x40,0x38,0x40,0x3f}}, {'X',{0x63,0x14,0x08,0x14,0x63}},
    {'Y',{0x07,0x08,0x70,0x08,0x07}}, {'Z',{0x61,0x51,0x49,0x45,0x43}},
    {'0',{0x3e,0x51,0x49,0x45,0x3e}}, {'1',{0x00,0x42,0x7f,0x40,0x00}},
    {'2',{0x42,0x61,0x51,0x49,0x46}}, {'3',{0x21,0x41,0x45,0x4b,0x31}},
    {'4',{0x18,0x14,0x12,0x7f,0x10}}, {'5',{0x27,0x45,0x45,0x45,0x39}},
    {'6',{0x3c,0x4a,0x49,0x49,0x30}}, {'7',{0x01,0x71,0x09,0x05,0x03}},
    {'8',{0x36,0x49,0x49,0x49,0x36}}, {'9',{0x06,0x49,0x49,0x29,0x1e}},
    {'_',{0x40,0x40,0x40,0x40,0x40}}, {'-',{0x08,0x08,0x08,0x08,0x08}},
    {':',{0x00,0x36,0x36,0x00,0x00}}, {'.',{0x00,0x60,0x60,0x00,0x00}},
    {'/',{0x20,0x10,0x08,0x04,0x02}}, {'<',{0x08,0x14,0x22,0x41,0x00}},
    {'>',{0x00,0x41,0x22,0x14,0x08}}, {'[',{0x00,0x7f,0x41,0x41,0x00}},
    {']',{0x00,0x41,0x41,0x7f,0x00}}, {'+',{0x08,0x08,0x3e,0x08,0x08}},
    {' ',{0x00,0x00,0x00,0x00,0x00}},
};

static const unsigned char *glyph_for(char c)
{
    size_t i;
    if (c >= 'a' && c <= 'z')
        c = (char)(c - 'a' + 'A');
    for (i = 0; i < sizeof FONT / sizeof FONT[0]; i++)
        if (FONT[i].c == c)
            return FONT[i].col;
    return FONT[sizeof FONT / sizeof FONT[0] - 1].col;    /* blank */
}

static void box(float x, float y, float w, float h,
                float r, float g, float b, float a)
{
    glColor4f(r, g, b, a);
    glBegin(GL_QUADS);
    glVertex2f(x, y); glVertex2f(x + w, y);
    glVertex2f(x + w, y + h); glVertex2f(x, y + h);
    glEnd();
}

void fs_text(float x, float y, float px, const char *s,
             float r, float g, float b)
{
    glColor3f(r, g, b);
    glBegin(GL_QUADS);
    for (; *s; s++) {
        const unsigned char *col = glyph_for(*s);
        int c, row;
        for (c = 0; c < 5; c++)
            for (row = 0; row < 7; row++)
                if (col[c] & (1 << row)) {
                    float px0 = x + (float)c * px;
                    float py0 = y + (float)row * px;
                    glVertex2f(px0, py0);
                    glVertex2f(px0 + px, py0);
                    glVertex2f(px0 + px, py0 + px);
                    glVertex2f(px0, py0 + px);
                }
        x += px * 6.0f;
    }
    glEnd();
}

float fs_text_width(float px, const char *s)
{
    return (float)strlen(s) * px * 6.0f;
}


/* ------------------------------------------------------------- the catalogue
 *
 * The file stems, as they are in `res/`. Listed rather than scanned because a
 * directory scan would also offer the stems that are not fighters or not
 * fight stages -- DUMMY, the ending scenes, WHIRLWIND -- and a debug tool that
 * offers things which cannot work is worse than one with a short list.
 *
 * The `res/` directory is the authority: `ls *.skinanim` and
 * `ls *_LEVEL_SCENE.scene` produced these.
 */
static const char *const STAGES[] = {
    "GRAVEYARD_LEVEL_SCENE", "BALCONY_LEVEL_SCENE", "BELLTOWER_LEVEL_SCENE",
    "BRIDGE_LEVEL_SCENE", "CAVE_LEVEL_SCENE", "JADESDESERT_LEVEL_SCENE",
    "LAIR_LEVEL_SCENE", "NOOBSDORFEN_LEVEL_SCENE", "PIT_LEVEL_SCENE",
    "ROOFTOP_LEVEL_SCENE", "SCISLACBUSOREZ_LEVEL_SCENE",
};

/* The stage music, by the same index. `res/audio` holds one mp3 per stage and
 * the names do not match the scene stems, so the pairing is by ear and by
 * name -- Graveyard to GraveYard, the Pit to Pit -- and the ones with no
 * obvious partner get the graveyard's. Marked as a guess where it is one. */
static const char *const MUSIC[] = {
    "GraveYard", "Church", "Church", "Bridge", "SoulChamber", "Street",
    "SoulChamber", "NoobDorfen", "Pit", "Roof", "Subway",
};

static const char *const CHARS[] = {
    "SCORPION_STANDARD", "SUBZERO_STANDARD", "OLDSUBZERO_STANDARD",
    "REPTILE_STANDARD", "ERMAC_STANDARD", "SMOKE_STANDARD",
    "OLDSMOKE_STANDARD", "NOOBSAIBOT_STANDARD", "JADE_STANDARD",
    "KITANA_STANDARD", "MILEENA_STANDARD", "SONYA_STANDARD",
    "JAX_STANDARD", "KANO_STANDARD", "LIUKANG_STANDARD",
    "KUNGLAO_STANDARD", "NIGHTWOLF_STANDARD", "STRYKER_STANDARD",
    "SINDEL_STANDARD", "SHEEVA_STANDARD", "KABAL_STANDARD",
    "CYRAX_STANDARD", "SEKTOR_STANDARD", "ROBO1_STANDARD",
    "ROBO2_STANDARD", "SHANGTSUNG_STANDARD", "MOTARO_STANDARD",
    "SHAOKAHN_STANDARD",
};

#define NSTAGE ((int)(sizeof STAGES / sizeof STAGES[0]))
#define NCHAR  ((int)(sizeof CHARS  / sizeof CHARS[0]))

const char *fs_stage(int i)  { return STAGES[((i % NSTAGE) + NSTAGE) % NSTAGE]; }
const char *fs_music(int i)  { return MUSIC [((i % NSTAGE) + NSTAGE) % NSTAGE]; }
const char *fs_char(int i)   { return CHARS [((i % NCHAR)  + NCHAR)  % NCHAR];  }
int         fs_stage_count(void) { return NSTAGE; }
int         fs_char_count(void)  { return NCHAR;  }


/* ------------------------------------------------------------------ the panel
 *
 * Drawn in its own orthographic pass over whatever the scene last rendered, so
 * the stage behind it is the one being chosen.
 */
void fs_draw(int w, int h, int row, int stage, int p1, int p2, const char *note)
{
    const float S = (h > 800) ? 3.0f : 2.0f;      /* pixels per font pixel */
    const float LH = S * 12.0f;
    char line[160];
    float x = 40.0f, y = 50.0f;

    (void)row; (void)p1; (void)p2;

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

    box(20.0f, 24.0f, (float)w - 40.0f, LH * 7.0f + 40.0f,
        0.02f, 0.02f, 0.04f, 0.86f);

    fs_text(x, y, S, "UMK3 DEBUG - STAGE SELECT", 1.0f, 0.85f, 0.2f);
    y += LH * 1.6f;

    _snprintf(line, sizeof line, "> %2d/%2d  %s",
              stage + 1, NSTAGE, fs_stage(stage));
    line[sizeof line - 1] = 0;
    fs_text(x, y, S, line, 1.0f, 1.0f, 0.4f);
    y += LH;

    _snprintf(line, sizeof line, "   MUSIC  %s", fs_music(stage));
    line[sizeof line - 1] = 0;
    fs_text(x, y, S, line, 0.62f, 0.62f, 0.62f);
    y += LH;

    /* One character for now, by request. The roster is still in this file and
     * every one of its twenty-eight stems was checked against res/ -- adding
     * the rows back is a display change, not a data one. */
    fs_text(x, y, S, "   FIGHTER SCORPION_STANDARD", 0.62f, 0.62f, 0.62f);
    y += LH * 1.4f;

    fs_text(x, y, S, "LEFT/RIGHT CHANGE STAGE   ENTER LOAD IT",
            0.55f, 0.75f, 0.95f);
    y += LH;
    fs_text(x, y, S, "F1 CLOSE   F5 RESET ROUND   ESC QUIT",
            0.55f, 0.75f, 0.95f);

    if (note && *note) {
        y += LH;
        fs_text(x, y, S, note, 1.0f, 0.45f, 0.35f);
    }

    glMatrixMode(GL_PROJECTION);
    glPopMatrix();
    glMatrixMode(GL_MODELVIEW);
    glPopMatrix();
    glDisable(GL_BLEND);
    glEnable(GL_DEPTH_TEST);
}
