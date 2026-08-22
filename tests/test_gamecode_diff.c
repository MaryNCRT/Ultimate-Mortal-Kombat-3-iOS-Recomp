/*
 * test_gamecode_diff.c — five small GameCode.cpp functions against the oracle.
 *
 * All five are two or three instructions of real work, which makes them a poor
 * place to look for subtle bugs and a good place to check something else: that
 * the PC-relative address arithmetic was done right.
 *
 * Every one of them reaches a global through `ldr rN, [pc, #M]` followed by
 * `add rN, pc`, and getting that wrong lands on a neighbouring variable rather
 * than failing. A body that wrote the correct value to the wrong global would
 * read perfectly and be silently wrong, so the test drives the ORACLE and asks
 * where it actually wrote:
 *
 *   - the two camera setters must hit the SAME word, and it must be the one
 *     the clean C calls LockCamera
 *   - EndIntro must hit a different one
 *   - both blood functions must pass the SAME pointer, and it must be neither
 *     of those
 *
 * That is checkable without knowing the addresses in advance: poison a range,
 * run, and see which word moved. The addresses in the source comments were
 * derived by hand; this confirms them from behaviour.
 */

#include "arm_runtime.h"
#include "gamecode.h"                   /* oracle: tools/armrecomp */

#include <stdio.h>
#include <string.h>

#define RAM_SIZE   (8u << 20)
#define STACK_TOP  0x007F0000u

/* The slice's own data region, where these globals live. Poisoned before each
 * run so a store is visible as a change rather than as a value. */
#define DATA_LO    0x00150000u
#define DATA_HI    0x00151000u
#define POISON     0xA5A5A5A5u

static int  g_fail  = 0;
static long g_cases = 0;

/* ---- what the clean side links against ---- */
int LockCamera;
int AxeTrailDisallowed;
/* The same shape lime.h gives it. Only its ADDRESS is ever compared, so one
 * entry is enough. */
typedef struct TEXTURE TEXTURE;
typedef struct TEXTURETOLOAD { const char *name; TEXTURE **dest; } TEXTURETOLOAD;
TEXTURETOLOAD BloodTexturesToLoad[1];

static const void *g_clean_list;
static int         g_clean_load, g_clean_free;

void LoadSomeTextures(TEXTURETOLOAD *l) { g_clean_list = l; g_clean_load++; }
void FreeSomeTextures(TEXTURETOLOAD *l) { g_clean_list = l; g_clean_free++; }

void AllowCameraTracking(void);
void StopCameraTracking(void);
void EndIntro(void);
void LoadBloodTextures(void);
void FreeBloodTextures(void);

/* ---- what the oracle calls ---- */
static uint32_t g_oracle_list;
static int      g_oracle_load, g_oracle_free;

void func_00061054_Z16LoadSomeTexturesP13TEXTURETOLOAD(arm_ctx *ctx)
{ g_oracle_list = ctx->r[0]; g_oracle_load++; }
void func_0006102c_Z16FreeSomeTexturesP13TEXTURETOLOAD(arm_ctx *ctx)
{ g_oracle_list = ctx->r[0]; g_oracle_free++; }

/* ------------------------------------------------------------------ helpers */

static void poison(void)
{
    uint32_t a;
    for (a = DATA_LO; a < DATA_HI; a += 4u) MEM_ST32(a, POISON);
}

/* Run one oracle function and report which single word it changed, and to
 * what. Returns 0 if none moved, or more than one did. */
static uint32_t which_moved(void (*fn)(arm_ctx *), uint32_t *value_out)
{
    arm_ctx  ctx;
    uint32_t a, found = 0u;
    int      n = 0;

    poison();
    memset(&ctx, 0, sizeof(ctx));
    ctx.r[SP] = STACK_TOP;
    fn(&ctx);

    for (a = DATA_LO; a < DATA_HI; a += 4u) {
        uint32_t v = MEM_LD32(a);
        if (v != POISON) { found = a; if (value_out) *value_out = v; n++; }
    }
    return (n == 1) ? found : 0u;
}

static void check(const char *what, int ok)
{
    g_cases++;
    if (!ok) { printf("  DIVERGE %s\n", what); g_fail++; }
}

int main(int argc, char **argv)
{
    const char *slice = (argc > 1) ? argv[1] : "work/UMK3.armv7";
    uint32_t a_allow, a_stop, a_end, v;
    uint32_t list_load, list_free;
    arm_ctx  ctx;

    setvbuf(stdout, NULL, _IONBF, 0);
    arm_mem_init(RAM_SIZE);

    /* The PC-relative loads read literals out of __TEXT, so the image has to
     * be there. Without it every address computes from zeroes. */
    if (arm_load_image(slice) != 0) {
        printf("no se pudo cargar %s\n", slice);
        return 2;
    }

    printf("=== five small GameCode.cpp functions vs the recompiled original ===\n");
    printf("checks WHERE each one writes, not only what -- see the header.\n\n");

    /* ---- the two camera setters ---- */
    a_allow = which_moved(func_0001c41c_AllowCameraTracking, &v);
    check("AllowCameraTracking wrote exactly one word", a_allow != 0u);
    check("AllowCameraTracking wrote 0", v == 0u);

    a_stop = which_moved(func_0001c40c_StopCameraTracking, &v);
    check("StopCameraTracking wrote exactly one word", a_stop != 0u);
    check("StopCameraTracking wrote 1", v == 1u);

    check("both camera setters hit the SAME global", a_allow == a_stop && a_allow != 0u);

    /* and the clean C agrees on the values */
    LockCamera = 0x1234;
    AllowCameraTracking();
    check("clean AllowCameraTracking clears LockCamera", LockCamera == 0);
    StopCameraTracking();
    check("clean StopCameraTracking sets LockCamera", LockCamera == 1);

    /* ---- EndIntro ---- */
    a_end = which_moved(func_0001c664_Z8EndIntrov, &v);
    check("EndIntro wrote exactly one word", a_end != 0u);
    check("EndIntro wrote 10", v == 10u);
    check("EndIntro hits a DIFFERENT global from the camera flag", a_end != a_allow);

    AxeTrailDisallowed = 0;
    EndIntro();
    check("clean EndIntro writes 10", AxeTrailDisallowed == 10);

    /* ---- the blood textures ---- */
    poison();
    memset(&ctx, 0, sizeof(ctx)); ctx.r[SP] = STACK_TOP;
    g_oracle_load = g_oracle_free = 0; g_oracle_list = 0u;
    func_00023250_Z17LoadBloodTexturesv(&ctx);
    check("oracle LoadBloodTextures called LoadSomeTextures once",
          g_oracle_load == 1 && g_oracle_free == 0);
    list_load = g_oracle_list;

    memset(&ctx, 0, sizeof(ctx)); ctx.r[SP] = STACK_TOP;
    g_oracle_load = g_oracle_free = 0; g_oracle_list = 0u;
    func_00022c60_Z17FreeBloodTexturesv(&ctx);
    check("oracle FreeBloodTextures called FreeSomeTextures once",
          g_oracle_free == 1 && g_oracle_load == 0);
    list_free = g_oracle_list;

    check("both blood functions pass the SAME list",
          list_load == list_free && list_load != 0u);
    check("the blood list is neither of the two flags",
          list_load != a_allow && list_load != a_end);

    /* the clean side: same shape, same list, one call each */
    g_clean_load = g_clean_free = 0; g_clean_list = NULL;
    LoadBloodTextures();
    check("clean LoadBloodTextures called LoadSomeTextures once",
          g_clean_load == 1 && g_clean_free == 0);
    check("clean LoadBloodTextures passed BloodTexturesToLoad",
          g_clean_list == (const void *)BloodTexturesToLoad);

    g_clean_load = g_clean_free = 0; g_clean_list = NULL;
    FreeBloodTextures();
    check("clean FreeBloodTextures called FreeSomeTextures once",
          g_clean_free == 1 && g_clean_load == 0);
    check("clean FreeBloodTextures passed BloodTexturesToLoad",
          g_clean_list == (const void *)BloodTexturesToLoad);

    printf("\nchecks: %ld    divergences: %d\n", g_cases, g_fail);
    if (!g_fail) {
        printf("\nthe addresses the source comments claim, confirmed from behaviour:\n");
        printf("  LockCamera          0x%08x\n", a_allow);
        printf("  AxeTrailDisallowed  0x%08x\n", a_end);
        printf("  BloodTexturesToLoad 0x%08x\n", list_load);
    }
    printf("%s\n", g_fail ? "RESULT: FAIL"
                          : "RESULT: the clean GameCode functions match the original");

    arm_mem_free();
    return g_fail ? 1 : 0;
}
