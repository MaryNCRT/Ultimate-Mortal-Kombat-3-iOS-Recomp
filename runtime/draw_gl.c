/*
 * draw_gl.c -- the windowed half of the platform layer.
 *
 * `lime_platform.c` and `lime_menu.c` answer every draw call by counting it.
 * That is what lets `tests/test_menu_boot.c` exercise the front end with no
 * window, and it is the right default: it tests the transcription rather than
 * the renderer. This file is the other half. Build with `-DUMK3_REAL_GL` and
 * those blocks compile out, opengl32 supplies the `gl*` entry points, and the
 * lime draw calls land on the screen.
 *
 * ## What the front end asks for
 *
 * Two primitives and a mode:
 *
 *     limeSet2DDrawing()                     an orthographic 480x320, Y down
 *     limeDrawSprite(tex, x, y, w, h, u, v, du, dv, colour)
 *     limeFillRect(x, y, w, h, r, g, b, a)
 *
 * and text, which is not a third primitive: `limeDrawFONT` in
 * `decomp/lime/limeFont.c` walks the glyphs and draws each through
 * `limeDrawSprite`, so a sprite that works gives text for free.
 *
 * The UV pair after `u, v` is an EXTENT, not a second corner. `limeDrawFONT`
 * computes `du = glyphWidth / atlasWidth`, which is a width; and a negative
 * extent mirrors, which is how the front end flips a sprite without a second
 * texture.
 *
 * ## Coordinates
 *
 * The game draws in a 480x320 space with the origin at the top left -- the
 * iPhone's, in landscape. `limeScreenWidth` and `limeScreenHeight` say so, and
 * the front end scales its own layout against them through FE_X and FE_Y. So
 * the projection is that rectangle exactly, and the window stretches to it
 * through the viewport rather than the game knowing the window's size.
 *
 * ## Fixed-function GL, deliberately
 *
 * `glBegin`/`glEnd` and the fixed pipeline, because that is what the Windows
 * opengl32 exports without an extension loader and because the whole of this
 * file is quads. The 3D path -- the rotating character models on the select
 * screen -- goes through `glDrawElements` and the matrix stack, which come
 * from opengl32 unchanged.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform/gl.h"
#include "lime/png.h"
#include "lime/pvr.h"

#include "../decomp/lime/lime.h"

const char *lime_platform_asset_root(void);

/* Multitexture is GL 1.3 and Windows' opengl32 stops at 1.1, so these two are
 * ours rather than the driver's. Nothing here uses a second unit: the menus
 * draw one textured quad at a time. */
void glClientActiveTexture(unsigned u) { (void)u; }
void glActiveTexture(unsigned u)       { (void)u; }


/* ----------------------------------------------------------------- state */

static long g_sprites, g_fills;
static int  g_screen_w = 480, g_screen_h = 320;

/* `lime_platform_draw_calls` and `..._draw_indices` stay in lime_platform.c:
 * they count glDrawElements, and with a real GL that call is the driver's, so
 * there is nothing here to count it from. The sprite and fill counters are
 * ours because the calls that raise them are. */
long lime_platform_sprite_count(void) { return g_sprites; }
long lime_gl_fill_count(void)         { return g_fills; }

void lime_gl_set_screen(int w, int h)
{
    g_screen_w = w;
    g_screen_h = h;
}


/* --------------------------------------------------------------- textures
 *
 * The bundle stores a sheet as .PNG or as .PVR and the game asks for it by the
 * name in the data, extension included. Both decoders are already here, so the
 * loader tries the name as given and then the other extension -- which is what
 * the device's own loader did, since the exporter wrote a literal ".???" into
 * meshes and the real extension was supplied at load time.
 *
 * Every distinct path is loaded once and kept. The menus re-request the same
 * sheets every frame and a texture upload per frame would be visible.
 */
typedef struct TexEntry {
    struct TexEntry *next;
    char            *path;
    TEXTURE          tex;       /* `name` is the GL object; lime.h states it */
    int              w, h;
} TexEntry;

static TexEntry *g_textures;

static TexEntry *tex_find(const char *path)
{
    TexEntry *e;
    for (e = g_textures; e; e = e->next)
        if (strcmp(e->path, path) == 0)
            return e;
    return NULL;
}

static int try_one(const char *full, LimeImage *out)
{
    uint8_t *px = NULL;
    int w = 0, h = 0;

    if (lime_pvr_load(full, out))
        return 1;
    if (lime_png_load(full, &px, &w, &h)) {
        out->rgba = px;
        out->width = w;
        out->height = h;
        return 1;
    }
    return 0;
}

static int load_rgba(const char *path, LimeImage *out)
{
    /* Where the bundle keeps sheets, in the order that finds them soonest:
     * Textures/ holds 1,620 of them and res/ itself almost none. */
    static const char *const dirs[] = { "Textures/", "", "../" };
    /* The name as asked, then the same stem under each real extension. The
     * data says ".PNG" for files that are .pvr on disk -- the exporter wrote
     * one extension and the device supplied another. */
    static const char *const exts[] = { NULL, ".pvr", ".png", ".PVR", ".PNG" };

    const char *root = lime_platform_asset_root();
    char full[1200];
    char stem[256];
    const char *dot;
    size_t n;
    int d, e;

    dot = strrchr(path, '.');
    n = dot ? (size_t)(dot - path) : strlen(path);
    if (n >= sizeof(stem))
        return 0;
    memcpy(stem, path, n);
    stem[n] = 0;

    for (e = 0; e < (int)(sizeof(exts) / sizeof(exts[0])); e++) {
        for (d = 0; d < (int)(sizeof(dirs) / sizeof(dirs[0])); d++) {
            if (exts[e] == NULL)
                snprintf(full, sizeof(full), "%s/%s%s", root, dirs[d], path);
            else
                snprintf(full, sizeof(full), "%s/%s%s%s",
                         root, dirs[d], stem, exts[e]);
            if (try_one(full, out))
                return 1;
        }
    }
    return 0;
}

TEXTURE *limeLoadTexture(const char *path, int a, int b)
{
    TexEntry *e;
    LimeImage img;
    GLuint name = 0;

    (void)a; (void)b;
    if (path == NULL || *path == 0)
        return NULL;

    e = tex_find(path);
    if (e)
        return &e->tex;

    memset(&img, 0, sizeof(img));
    if (!load_rgba(path, &img)) {
        if (getenv("LIME_TRACE_TEX"))
            fprintf(stderr, "[tex] %s MISSING\n", path);
        return NULL;                    /* the failure branch the engine has */
    }
    if (getenv("LIME_TRACE_TEX"))
        fprintf(stderr, "[tex] %s %dx%d\n", path, img.width, img.height);

    glGenTextures(1, &name);
    glBindTexture(GL_TEXTURE_2D, name);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, img.width, img.height, 0,
                 GL_RGBA, GL_UNSIGNED_BYTE, img.rgba);
    free(img.rgba);

    e = (TexEntry *)calloc(1, sizeof(*e));
    if (e == NULL)
        return NULL;
    e->path = _strdup(path);
    e->tex.name = name;
    e->w = img.width;
    e->h = img.height;
    e->next = g_textures;
    g_textures = e;
    return &e->tex;
}

void limeDeleteTexture(TEXTURE *tex)
{
    /* Kept: the menus delete and reload the same sheets between screens, and
     * dropping the GL object each time would undo the cache above. The whole
     * set goes when the process does. */
    (void)tex;
}


/* ------------------------------------------------------------ blend state */

void limeEnableAlphaBlending_Additive(void)
{
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE);
}

void limeEnableAlphaBlending_Basic(void)
{
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
}

void limeDisableAlphaBlending(void)
{
    glDisable(GL_BLEND);
}


/* ------------------------------------------------------------------- 2D */

void limeSet2DDrawing(void)
{
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    /* Y increases downward: the origin is the top-left corner, which is where
     * the front end puts (0,0) -- FE_Y(24) is 24 pixels below the top. */
    glOrtho(0.0, (double)g_screen_w, (double)g_screen_h, 0.0, -1.0, 1.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glDisable(GL_DEPTH_TEST);
    glEnable(GL_TEXTURE_2D);

    /* **MODULATE, explicitly.** The front end colours its text by handing the
     * sprite call a row of `mmfontcol` and letting it multiply against a white
     * glyph -- that is how "More Games" comes out red while the other four are
     * white, and how a held entry turns yellow. Under GL_REPLACE the texture
     * wins, the vertex colour is discarded, and every string draws white,
     * which is exactly what this was doing.
     *
     * The spec's default is MODULATE, which is why this looked unnecessary. It
     * is not: nothing says what the last thing to touch the texture unit left
     * behind. The original does not rely on the default either -- Particles.c
     * sets it by hand, and so does runtime/main.c. This was the one draw path
     * that assumed. */
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

    limeEnableAlphaBlending_Basic();
}

void limeEnableDepthTest(void)  { glEnable(GL_DEPTH_TEST); }
void limeDisableDepthTest(void) { glDisable(GL_DEPTH_TEST); }
void limeClearDepthBuffer(void) { glClear(GL_DEPTH_BUFFER_BIT); }

void limeSetColourMask(int on)
{
    GLboolean f = on ? GL_TRUE : GL_FALSE;
    glColorMask(f, f, f, GL_TRUE);
}


/* --------------------------------------------------------------- sprites */

static void quad(TEXTURE *page, float x, float y, float w, float h,
                 float u, float v, float du, float dv,
                 const float *colour, float angle)
{
    const float r = colour ? colour[0] : 1.0f;
    const float g = colour ? colour[1] : 1.0f;
    const float b = colour ? colour[2] : 1.0f;
    const float a = colour ? colour[3] : 1.0f;

    if (page == NULL)
        return;

    glBindTexture(GL_TEXTURE_2D, (GLuint)page->name);
    glColor4f(r, g, b, a);

    if (angle != 0.0f) {
        glPushMatrix();
        glTranslatef(x, y, 0.0f);
        glRotatef(angle, 0.0f, 0.0f, 1.0f);
        glTranslatef(-x, -y, 0.0f);
    }

    /* `du`/`dv` are extents, and a negative one mirrors -- the front end flips
     * a sprite that way rather than carrying a second texture. Adding the
     * extent to the origin handles both signs without a branch. */
    glBegin(GL_QUADS);
        glTexCoord2f(u,      v);       glVertex2f(x,     y);
        glTexCoord2f(u + du, v);       glVertex2f(x + w, y);
        glTexCoord2f(u + du, v + dv);  glVertex2f(x + w, y + h);
        glTexCoord2f(u,      v + dv);  glVertex2f(x,     y + h);
    glEnd();

    if (angle != 0.0f)
        glPopMatrix();

    g_sprites++;
}

void limeDrawSprite(TEXTURE *page, float x, float y, float w, float h,
                    float u, float v, float du, float dv,
                    const float *colour)
{
    quad(page, x, y, w, h, u, v, du, dv, colour, 0.0f);
}

void limeDrawRotSpriteFromTopLeft(TEXTURE *page, float x, float y,
                                  float w, float h, float u, float v,
                                  float du, float dv, float angle,
                                  const float *colour)
{
    quad(page, x, y, w, h, u, v, du, dv, colour, angle);
}

void lime_platform_last_sprite(float *out8)
{
    /* The headless build records the last sprite so a test can inspect it.
     * Here the screen is the record. */
    memset(out8, 0, 8 * sizeof(float));
}

void limeFillRect(float x, float y, float w, float h,
                  float r, float g, float b, float a)
{
    glDisable(GL_TEXTURE_2D);
    glColor4f(r, g, b, a);
    glBegin(GL_QUADS);
        glVertex2f(x,     y);
        glVertex2f(x + w, y);
        glVertex2f(x + w, y + h);
        glVertex2f(x,     y + h);
    glEnd();
    glEnable(GL_TEXTURE_2D);
    g_fills++;
}


/* The character models on the select screen go through the array pointers and
 * `glDrawElements`, all of which opengl32 provides unchanged. Nothing to add
 * here. */
