/*
 * lime_platform.c — the host side of the engine's platform API.
 *
 * The decompiled engine in decomp/lime/ calls twelve symbols it does not own:
 * six GL ES 1.1 entry points and six lime file/memory/texture calls. On the
 * device those came from iOS and from EA's own allocator. Here they come from
 * the host, and this file is the whole of that boundary.
 *
 * ## Why this is not the same as the stubs in arm_runtime.c
 *
 * `arm_runtime.c` already implements `limeLoadFile` and `limeFileSize`, but as
 * `stub_*(arm_ctx *)` operating on **guest** memory: they allocate inside the
 * emulated address space and return a guest address. That is exactly right for
 * the recompiled oracle, which runs in that address space.
 *
 * The clean decompiled C runs natively and needs **host** pointers. So the two
 * cannot share an implementation, and forwarding one to the other would mean
 * translating addresses on every call. They read the same files from the same
 * asset root and are otherwise independent, which is the point: the differential
 * tests compare two genuinely separate implementations rather than one calling
 * the other.
 *
 * ## The GL entries are no-ops
 *
 * Every function here that touches GL does nothing. That is deliberate and it
 * is enough for the differential tests, which compare loaders and maths --
 * nothing that draws. A port that renders must replace these; they are not a
 * rendering layer and are not trying to be.
 *
 * The matrix stack is the one place where "does nothing" could hide a bug, so
 * pushes and pops are counted and `lime_platform_matrix_depth()` exposes the
 * balance. LIME_PopMatrix takes a count rather than popping one, and a test
 * that leaves the stack unbalanced is worth catching even when no pixels exist.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "arm_runtime.h"
#include "../decomp/lime/lime.h"


/* The engine passes paths relative to the bundle ("FLOOR.meshset",
 * "STATICLIGHTING/FLOOR.lighting"), so they are resolved against a root the
 * caller sets. Kept separate from arm_runtime's copy on purpose: a test can
 * point the two at different trees to prove neither is reading the other's. */
static char g_lime_asset_root[512] = "";

void lime_platform_set_asset_root(const char *path)
{
    snprintf(g_lime_asset_root, sizeof(g_lime_asset_root), "%s", path);
}

static void resolve(const char *rel, char *out, size_t n)
{
    if (g_lime_asset_root[0] == '\0')
        snprintf(out, n, "%s", rel);
    else
        snprintf(out, n, "%s/%s", g_lime_asset_root, rel);
}


/* ------------------------------------------------------------------ files */

size_t limeFileSize(const char *path)
{
    char full[1100];
    FILE *f;
    long n;

    resolve(path, full, sizeof(full));
    f = fopen(full, "rb");
    if (!f)
        return 0;                       /* absent reads as zero, as on device */

    fseek(f, 0, SEEK_END);
    n = ftell(f);
    fclose(f);
    return (n > 0) ? (size_t)n : 0;
}

/* Returns a buffer the caller owns and must limeFree(). NULL on any failure --
 * the engine checks for it everywhere, and LIME_LoadEvents in particular treats
 * an empty file and an absent one identically, so this does too. */
void *limeLoadFile(const char *path)
{
    char full[1100];
    FILE *f;
    long n;
    void *p;

    resolve(path, full, sizeof(full));
    f = fopen(full, "rb");
    if (!f)
        return NULL;

    fseek(f, 0, SEEK_END);
    n = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (n <= 0) {
        fclose(f);
        return NULL;
    }

    /* **One byte more than the file, zeroed.**
     *
     * This is not defensive padding, it reproduces a guarantee the original
     * depends on without stating. On the device the buffer comes from an
     * allocator carving up memory that starts zeroed, so the byte just past a
     * loaded file is reliably NUL -- and the engine's text parsers lean on it.
     * GetNextLine scans for NUL, CR or LF with no length bound at all, so a
     * file whose last line has no trailing newline runs straight off the end.
     *
     * res/nolight.txt is exactly such a file. Handing it a bare malloc buffer
     * made IsTextureFullBright read into uninitialised memory and the whole
     * differential test segfaulted on its first meshset.
     *
     * The extra byte is not visible to callers: limeFileSize still reports the
     * real length, and the engine never looks past it deliberately. */
    p = calloc((size_t)n + 1, 1);
    if (p && fread(p, 1, (size_t)n, f) != (size_t)n) {
        free(p);
        p = NULL;
    }
    fclose(f);
    return p;
}


/* ----------------------------------------------------------------- memory
 *
 * The original takes a tag as its first argument -- "meshsethandle", "skin",
 * "bones", "font" -- which fed EA's own pool accounting. Nothing here uses it,
 * but it is kept in the signature because it is in the binary and because it is
 * genuinely useful: the tags name what every allocation in the engine is for.
 */
void *limeMalloc(const char *tag, size_t bytes)
{
    (void)tag;
    return malloc(bytes);
}

void limeFree(void *p)
{
    free(p);                            /* free(NULL) is defined; so is this */
}


/* --------------------------------------------------------------- textures
 *
 * Headless: the loaders are exercised, the GL objects are not. A non-NULL
 * handle is returned so that null-checks in the engine take the path they take
 * on device -- returning NULL here would silently steer every caller down its
 * failure branch and make a passing test meaningless.
 */
static int g_texture_sentinel;

TEXTURE *limeLoadTexture(const char *path, int a, int b)
{
    (void)path; (void)a; (void)b;
    return (TEXTURE *)&g_texture_sentinel;
}

void limeDeleteTexture(TEXTURE *tex)
{
    (void)tex;
}


/* --------------------------------------------------------- the GL surface
 *
 * No-ops, with the matrix stack depth tracked so an unbalanced push/pop is
 * still visible without a renderer.
 */
static int g_matrix_depth;

int lime_platform_matrix_depth(void)
{
    return g_matrix_depth;
}

void glPushMatrix(void)   { g_matrix_depth++; }
void glPopMatrix(void)    { if (g_matrix_depth > 0) g_matrix_depth--; }
void glLoadIdentity(void) { }

void glMatrixMode(unsigned mode)                  { (void)mode; }
void glTranslatef(float x, float y, float z)      { (void)x; (void)y; (void)z; }
void glMultMatrixf(const float *m)                { (void)m; }


/* ------------------------------------------------------------ blend state
 *
 * Real symbols in the binary (_limeEnableAlphaBlending_Additive and friends),
 * but they are GL state and therefore ours to provide rather than to
 * decompile -- they live in the iOS layer, not in lime/common.
 *
 * The mode is recorded rather than ignored. Which one is active is the
 * difference between a transparent list that may go unsorted and one that may
 * not, so a test can assert on it even with no renderer behind it.
 */
static int g_blend_mode;    /* 0 none, 1 additive, 2 basic */

int lime_platform_blend_mode(void)          { return g_blend_mode; }

void limeEnableAlphaBlending_Additive(void) { g_blend_mode = 1; }
void limeEnableAlphaBlending_Basic(void)    { g_blend_mode = 2; }
void limeDisableAlphaBlending(void)         { g_blend_mode = 0; }

static int g_depth_writes = 1;

int lime_platform_depth_writes(void)        { return g_depth_writes; }

void limeEnableDepthWrites(void)            { g_depth_writes = 1; }
void limeDisableDepthWrites(void)           { g_depth_writes = 0; }
