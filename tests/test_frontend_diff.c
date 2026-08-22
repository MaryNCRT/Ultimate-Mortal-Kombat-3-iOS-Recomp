/*
 * test_frontend_diff.c — the front end's three coordinate scalers.
 *
 * `FE_X`, `FE_W` and `FE_H` are one multiply each, so the interesting question
 * is not whether the arithmetic is right but **which global each one reads**.
 * X and W share `FE_WidthScale` and H has its own; a body that gave all three
 * the same scale, or gave each its own, would be indistinguishable from the
 * original at the shipped values because both scales hold 1.0f.
 *
 * So the test writes DIFFERENT values into the two scales before driving the
 * oracle. That is the whole point: at 1.0f every wrong version passes.
 *
 * ## Why this matters beyond three functions
 *
 * These are the widescreen hook for the menus. X and W moving together is not
 * a coincidence to preserve carelessly — stretching horizontally has to move a
 * thing and its width by the same factor or the layout tears. Pinning it now
 * means a later port cannot quietly get it wrong.
 *
 * Comparison is exact bit equality on the returned float. One multiply has
 * nothing to round differently.
 */

#include "arm_runtime.h"
#include "frontend.h"                   /* oracle: tools/armrecomp */

#include <stdio.h>
#include <string.h>

#define RAM_SIZE   (8u << 20)
#define STACK_TOP  0x007F0000u

/* Where the two scales live in the slice, derived from the PC-relative loads
 * and confirmed below by driving the oracle with distinct values. */
#define G_WIDTHSCALE   0x000ff9b8u
#define G_HEIGHTSCALE  0x000ff9bcu

float FE_WidthScale;
float FE_HeightScale;

float FE_X(float v);
float FE_W(float v);
float FE_H(float v);

static int  g_fail  = 0;
static long g_cases = 0;

static uint32_t f2u(float f) { uint32_t u; memcpy(&u, &f, 4); return u; }
static float    u2f(uint32_t u) { float f; memcpy(&f, &u, 4); return f; }

static void run(const char *what, float (*clean)(float),
                void (*oracle)(arm_ctx *), float v, float ws, float hs)
{
    arm_ctx ctx;
    float   c, o;
    char    lbl[96];

    FE_WidthScale  = ws;
    FE_HeightScale = hs;
    MEM_ST32(G_WIDTHSCALE,  f2u(ws));
    MEM_ST32(G_HEIGHTSCALE, f2u(hs));

    c = clean(v);

    memset(&ctx, 0, sizeof(ctx));
    ctx.r[SP] = STACK_TOP;
    ctx.r[0]  = f2u(v);                 /* soft-float: the float rides in r0 */
    oracle(&ctx);
    o = u2f(ctx.r[0]);                  /* and comes back the same way */

    g_cases++;
    if (f2u(c) != f2u(o)) {
        snprintf(lbl, sizeof(lbl), "%s(%g) ws=%g hs=%g", what, v, ws, hs);
        printf("  DIVERGE %s: clean=%.9g  oracle=%.9g\n", lbl, c, o);
        g_fail++;
    }
}

int main(int argc, char **argv)
{
    const char *slice = (argc > 1) ? argv[1] : "work/UMK3.armv7";
    static const float V[] = { 0.0f, 1.0f, -1.0f, 0.5f, 320.0f, 480.0f,
                               -7.25f, 1e-8f, 1e8f };
    size_t i;

    setvbuf(stdout, NULL, _IONBF, 0);
    arm_mem_init(RAM_SIZE);
    if (arm_load_image(slice) != 0) {
        printf("no se pudo cargar %s\n", slice);
        return 2;
    }

    printf("=== the front end's three coordinate scalers ===\n");
    printf("driven with the two scales set DIFFERENTLY, because at the\n");
    printf("shipped 1.0f every wrong version passes.\n\n");

    for (i = 0; i < sizeof(V) / sizeof(V[0]); i++) {
        /* distinct scales, so reading the wrong global is visible */
        run("FE_X", FE_X, func_00002e84_FE_X, V[i], 2.0f, 3.0f);
        run("FE_W", FE_W, func_00002ecc_FE_W, V[i], 2.0f, 3.0f);
        run("FE_H", FE_H, func_00002ee8_FE_H, V[i], 2.0f, 3.0f);

        /* and the other way round, so a body that swapped them fails here */
        run("FE_X", FE_X, func_00002e84_FE_X, V[i], 0.25f, 8.0f);
        run("FE_W", FE_W, func_00002ecc_FE_W, V[i], 0.25f, 8.0f);
        run("FE_H", FE_H, func_00002ee8_FE_H, V[i], 0.25f, 8.0f);

        /* the shipped state, for completeness */
        run("FE_X", FE_X, func_00002e84_FE_X, V[i], 1.0f, 1.0f);
        run("FE_W", FE_W, func_00002ecc_FE_W, V[i], 1.0f, 1.0f);
        run("FE_H", FE_H, func_00002ee8_FE_H, V[i], 1.0f, 1.0f);
    }

    /* And directly: X and W must agree with each other and differ from H when
     * the two scales differ. Asserting the RELATIONSHIP, not just agreement --
     * two implementations reading the same wrong global would still match. */
    {
        arm_ctx cx, cw, ch;
        MEM_ST32(G_WIDTHSCALE,  f2u(2.0f));
        MEM_ST32(G_HEIGHTSCALE, f2u(3.0f));
        memset(&cx, 0, sizeof(cx)); cx.r[SP] = STACK_TOP; cx.r[0] = f2u(10.0f);
        memset(&cw, 0, sizeof(cw)); cw.r[SP] = STACK_TOP; cw.r[0] = f2u(10.0f);
        memset(&ch, 0, sizeof(ch)); ch.r[SP] = STACK_TOP; ch.r[0] = f2u(10.0f);
        func_00002e84_FE_X(&cx);
        func_00002ecc_FE_W(&cw);
        func_00002ee8_FE_H(&ch);

        g_cases++;
        if (cx.r[0] != cw.r[0]) {
            printf("  DIVERGE FE_X and FE_W do not share a scale: %g vs %g\n",
                   u2f(cx.r[0]), u2f(cw.r[0]));
            g_fail++;
        }
        g_cases++;
        if (ch.r[0] == cx.r[0]) {
            printf("  DIVERGE FE_H uses the SAME scale as FE_X\n");
            g_fail++;
        }
        g_cases++;
        if (u2f(cx.r[0]) != 20.0f || u2f(ch.r[0]) != 30.0f) {
            printf("  DIVERGE the scales are not the ones this test wrote: "
                   "X=%g H=%g\n", u2f(cx.r[0]), u2f(ch.r[0]));
            g_fail++;
        }
    }

    printf("\ncases compared: %ld    divergences: %d\n", g_cases, g_fail);
    printf("%s\n", g_fail ? "RESULT: FAIL"
                          : "RESULT: the clean front-end scalers match the original");

    arm_mem_free();
    return g_fail ? 1 : 0;
}
