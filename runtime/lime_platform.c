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
#include <malloc.h>

#include "arm_runtime.h"

void *limeMalloc(const char *tag, size_t bytes);
void  limeFree(void *p);
long  lime_heap_check(const char *where);
#include "../decomp/lime/lime.h"


/* The engine passes paths relative to the bundle ("FLOOR.meshset",
 * "STATICLIGHTING/FLOOR.lighting"), so they are resolved against a root the
 * caller sets. Kept separate from arm_runtime's copy on purpose: a test can
 * point the two at different trees to prove neither is reading the other's. */
static char g_lime_asset_root[512] = "";

/* The bundle's own files -- Info.plist among them -- sit beside res/, so the
 * root has to be readable, not just usable through resolve(). */
const char *lime_platform_asset_root(void)
{
    return g_lime_asset_root;
}

void lime_platform_set_asset_root(const char *path)
{
    snprintf(g_lime_asset_root, sizeof(g_lime_asset_root), "%s", path);
}

/* An iOS bundle is one flat directory: the game asks for "mkunicode.txt" and
 * the bundle finds it wherever it sits. The extracted tree keeps most assets
 * under res/ and a few -- mkunicode.txt, Info.plist -- beside it, so a path
 * that is not under res/ is tried against the bundle before giving up. */
static void resolve(const char *rel, char *out, size_t n)
{
    FILE *probe;

    if (g_lime_asset_root[0] == '\0') {
        snprintf(out, n, "%s", rel);
        return;
    }

    snprintf(out, n, "%s/%s", g_lime_asset_root, rel);
    probe = fopen(out, "rb");
    if (probe) {
        fclose(probe);
        return;
    }
    snprintf(out, n, "%s/../%s", g_lime_asset_root, rel);
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

    if (getenv("LIME_HEAP_CHECK"))
        lime_heap_check(path);
    if (getenv("LIME_TRACE_FILES"))
        fprintf(stderr, "[load] %s ...", path);
    resolve(path, full, sizeof(full));
    f = fopen(full, "rb");
    if (getenv("LIME_TRACE_FILES"))
        fprintf(stderr, " %s\n", f ? "open" : "MISSING");
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
    /* Through limeMalloc, not calloc: the engine frees this with limeFree, and
     * an allocation and its release have to come from the same allocator. They
     * did not, and it went unnoticed while limeFree was a bare free() -- the
     * guarded allocator read a header that had never been written and walked
     * off the end of memory on the first frame list it loaded. */
    p = limeMalloc("loadfile", (size_t)n + 1);
    if (p)
        memset(p, 0, (size_t)n + 1);
    if (p && fread(p, 1, (size_t)n, f) != (size_t)n) {
        limeFree(p);
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
/* Guard bytes after every block, and a header carrying the tag, so an overrun
 * can be attributed instead of merely detected. Windows reports heap damage at
 * the next allocation, by which point the culprit is gone; this reports it
 * with the name the engine gave the allocation.
 *
 * The cost is 48 bytes and a memcmp per block. That is nothing next to an
 * afternoon spent bisecting a SIGTRAP inside ntdll. */
#define LIME_GUARD_BYTES 16
static const unsigned char LIME_CANARY[LIME_GUARD_BYTES] = {
    0xA5, 0x5A, 0xC3, 0x3C, 0xA5, 0x5A, 0xC3, 0x3C,
    0xA5, 0x5A, 0xC3, 0x3C, 0xA5, 0x5A, 0xC3, 0x3C,
};

typedef struct lime_block {
    struct lime_block *next, *prev;
    const char        *tag;
    size_t             bytes;
} lime_block;

static lime_block *g_blocks;
static long        g_live, g_overruns;

static int block_intact(const lime_block *b)
{
    const unsigned char *tail = (const unsigned char *)(b + 1) + b->bytes;
    return memcmp(tail, LIME_CANARY, LIME_GUARD_BYTES) == 0;
}

/* With LIME_HEAP_CHECK set, every allocation validates every live block first.
 * That turns "the heap is damaged" into "the heap was damaged before this
 * call", and the call is on the stack -- which is the whole difference between
 * a report and a lead. Quadratic, and irrelevant at these counts. */
static int heap_paranoid(void)
{
    static int on = -1;
    if (on < 0)
        on = getenv("LIME_HEAP_CHECK") != NULL;
    return on;
}

long lime_heap_check(const char *where);

void *limeMalloc(const char *tag, size_t bytes)
{
    lime_block *b;

    if (heap_paranoid())
        lime_heap_check(tag);

    b = malloc(sizeof(*b) + bytes + LIME_GUARD_BYTES);

    if (b == NULL)
        return NULL;

    b->tag   = tag ? tag : "(untagged)";
    b->bytes = bytes;
    memcpy((unsigned char *)(b + 1) + bytes, LIME_CANARY, LIME_GUARD_BYTES);

    b->prev = NULL;
    b->next = g_blocks;
    if (g_blocks)
        g_blocks->prev = b;
    g_blocks = b;
    g_live++;

    return b + 1;
}

void limeFree(void *p)
{
    lime_block *b;

    if (p == NULL)
        return;                         /* free(NULL) is defined; so is this */

    b = (lime_block *)p - 1;
    if (!block_intact(b)) {
        fprintf(stderr, "lime_heap: OVERRUN past \"%s\" (%lu bytes)\n",
                b->tag, (unsigned long)b->bytes);
        g_overruns++;
    }

    if (b->prev) b->prev->next = b->next; else g_blocks = b->next;
    if (b->next) b->next->prev = b->prev;
    g_live--;

    free(b);
}

/* Walk every live allocation. Returns the number that are damaged and names
 * each one, so a caller can check between loader steps and find out not just
 * that memory was corrupted but by which allocation. */
long lime_heap_check(const char *where)
{
    const lime_block *b;
    long bad = 0;

    /* The CRT's own heap, not just ours. A wild pointer can land in a block
     * malloc handed to fopen or sprintf, which no guard of ours protects, and
     * _heapchk is the only thing that sees those. */
    if (_heapchk() != _HEAPOK) {
        fprintf(stderr, "lime_heap: %s: the CRT heap is damaged\n",
                where ? where : "check");
        bad++;
    }

    for (b = g_blocks; b; b = b->next) {
        if (!block_intact(b)) {
            fprintf(stderr, "lime_heap: %s: \"%s\" (%lu bytes) is overrun\n",
                    where ? where : "check", b->tag,
                    (unsigned long)b->bytes);
            bad++;
        }
    }
    return bad;
}

long lime_heap_live(void)     { return g_live; }
long lime_heap_overruns(void) { return g_overruns; }


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
void glScalef(float x, float y, float z)          { (void)x; (void)y; (void)z; }


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


/* ------------------------------------------------------------- sprites
 *
 * limeDrawSprite is a real symbol in the binary but it lives in the iOS layer,
 * not in lime/common, so it belongs here rather than in decomp/.
 *
 * It records its last call instead of discarding it. A font test has no
 * renderer to inspect, but it can assert on the UV rectangle and the page a
 * glyph was drawn from -- which is exactly the part of limeDrawFONT worth
 * checking, and the part that would otherwise need eyes on a screen.
 */
static struct {
    const TEXTURE *page;
    float x, y, w, h;
    float u, v, du, dv;
    long  count;
} g_last_sprite;

/* Ten arguments; the tenth is the colour every caller in gamecode passes and
 * this signature used to drop. Nothing draws here, so it is not read -- but the
 * shape has to match or every argument after the fourth is misplaced. */
void limeDrawSprite(TEXTURE *page, float x, float y, float w, float h,
                    float u, float v, float du, float dv,
                    const float *colour)
{
    (void)colour;
    g_last_sprite.page = page;
    g_last_sprite.x = x;   g_last_sprite.y = y;
    g_last_sprite.w = w;   g_last_sprite.h = h;
    g_last_sprite.u = u;   g_last_sprite.v = v;
    g_last_sprite.du = du; g_last_sprite.dv = dv;
    g_last_sprite.count++;
}

long lime_platform_sprite_count(void) { return g_last_sprite.count; }

void lime_platform_last_sprite(float *out8)
{
    out8[0] = g_last_sprite.x;  out8[1] = g_last_sprite.y;
    out8[2] = g_last_sprite.w;  out8[3] = g_last_sprite.h;
    out8[4] = g_last_sprite.u;  out8[5] = g_last_sprite.v;
    out8[6] = g_last_sprite.du; out8[7] = g_last_sprite.dv;
}

/* The rotated, top-left-anchored sprite limeDrawFONTAtAngle draws through.
 * Shares the recorder above so a test can inspect either path. */
void limeDrawRotSpriteFromTopLeft(TEXTURE *page, float x, float y,
                                  float w, float h, float u, float v,
                                  float du, float dv, float angle,
                                  const float *colour)
{
    (void)angle;
    limeDrawSprite(page, x, y, w, h, u, v, du, dv, colour);
}


/* ------------------------------------------------ the rest of the GL surface
 *
 * The draw calls the mesh renderers use. All no-ops except glDrawElements,
 * which counts: a test with no renderer can still assert that a mesh was drawn
 * once rather than never or twice, and that is most of what the render path
 * gets wrong.
 */
static long g_draw_calls;
static long g_draw_indices;

long lime_platform_draw_calls(void)   { return g_draw_calls; }
long lime_platform_draw_indices(void) { return g_draw_indices; }

void glDrawElements(unsigned mode, int count, unsigned type, const void *idx)
{
    (void)mode; (void)type; (void)idx;
    g_draw_calls++;
    g_draw_indices += count;
}

void glEnable(unsigned cap)                       { (void)cap; }
void glDisable(unsigned cap)                      { (void)cap; }
void glEnableClientState(unsigned a)              { (void)a; }
void glDisableClientState(unsigned a)             { (void)a; }
void glClientActiveTexture(unsigned u)            { (void)u; }
void glActiveTexture(unsigned u)                  { (void)u; }
void glBindTexture(unsigned t, unsigned n)        { (void)t; (void)n; }
void glTexEnvf(unsigned t, unsigned p, float v)   { (void)t; (void)p; (void)v; }
void glVertexPointer(int s, unsigned t, int st, const void *p)   { (void)s; (void)t; (void)st; (void)p; }
void glTexCoordPointer(int s, unsigned t, int st, const void *p) { (void)s; (void)t; (void)st; (void)p; }
void glColorPointer(int s, unsigned t, int st, const void *p)    { (void)s; (void)t; (void)st; (void)p; }
void glColor4f(float r, float g, float b, float a){ (void)r; (void)g; (void)b; (void)a; }
void glDepthMask(int flag)                        { (void)flag; }
void glShadeModel(unsigned mode)                  { (void)mode; }
void glCullFace(unsigned mode)                    { (void)mode; }
