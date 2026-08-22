/*
 * test_isp2_diff.c — clean isp2 against the oracle.
 *
 * The first differential test in `gamecode`, and the shape it uses is the one
 * the rest of that module will need.
 *
 * ## The problem gamecode has that lime/common did not
 *
 * `isp2` is six calls and two stores. Almost everything it does is *call
 * something else*, and those five callees are not decompiled. Pulling them in
 * with `--with-deps` would make the test pass or fail on their behaviour rather
 * than on this function's, and the clean side has no implementation of them at
 * all.
 *
 * So the oracle is generated WITHOUT dependencies. The five callees come out as
 * plain externs, and this file defines them -- once for the register-file side
 * and once for the native side, both recording into the same log. What gets
 * compared is then exactly what `isp2` itself decides: **which functions it
 * calls, in what order, with what argument, and what it writes.**
 *
 * That generalises. Most of `gamecode` is sequencing, and a sequencer can be
 * verified long before the things it sequences are.
 *
 * ## What the sweep is chosen against
 *
 *  - **Flag words that already have bit 4 set.** The OR is idempotent, so a
 *    body that assigned instead of OR-ing would agree on those and only those.
 *    Half the cases start with the bit clear and half with it set.
 *  - **Every other bit set around it**, because `orr r3, r3, #0x10` must leave
 *    them alone -- a mask applied the wrong way round would clear them.
 *  - **A field2c that is already non-zero and different from the flags**, so a
 *    body that forgot the store would be caught rather than agreeing by luck.
 */

#include "arm_runtime.h"
#include "isp2.h"                       /* oracle: tools/armrecomp */

#include <stdio.h>
#include <string.h>

#define RAM_SIZE   (8u << 20)
#define STACK_TOP  0x007F0000u

/* Above the loaded slice, which is 0x23D0B0 bytes plus data and bss. A test
 * arena inside it silently overwrites the engine's own globals. */
#define G_OBJ      0x00700000u
#define G_PROC     0x00701000u

#define OBJ_FIELD00   0x00u
#define OBJ_FIELD2C   0x2Cu
#define PROC_FIELD10  0x10u

/* ---------------------------------------------------------------- the log */

#define MAX_CALLS 16

typedef struct { const char *fn; uint32_t arg0; } callrec;

static callrec g_clean[MAX_CALLS];
static callrec g_oracle[MAX_CALLS];
static int     g_nclean, g_noracle;
static int     g_to_oracle;             /* which log the stubs write into */

static void note(const char *fn, uint32_t arg0)
{
    callrec *log = g_to_oracle ? g_oracle : g_clean;
    int     *n   = g_to_oracle ? &g_noracle : &g_nclean;
    if (*n < MAX_CALLS) { log[*n].fn = fn; log[*n].arg0 = arg0; (*n)++; }
}

/* ---- the native side: the clean C calls these ---- */

struct MK3OBJ;
void face_opponent(struct MK3OBJ *o)       { note("face_opponent", (uint32_t)(o != NULL)); }
void set_no_block(struct MK3OBJ *o)        { note("set_no_block", (uint32_t)(o != NULL)); }
void me_in_front(struct MK3OBJ *o)         { note("me_in_front", (uint32_t)(o != NULL)); }
void player_normpal(struct MK3OBJ *o)      { note("player_normpal", (uint32_t)(o != NULL)); }
void disable_all_buttons(struct MK3OBJ *o) { note("disable_all_buttons", (uint32_t)(o != NULL)); }

/* ---- the register-file side: the oracle calls these ----
 *
 * The argument is recorded as "is it the object we passed" rather than as a
 * raw value, because one side sees a host pointer and the other a guest
 * address. Recording the raw word on one side and a pointer on the other would
 * manufacture a divergence on every call -- a mistake this project already made
 * once in tests/gl_trace.c. */
static uint32_t g_expect_obj;

void func_00055388_face_opponent(arm_ctx *ctx)
{ note("face_opponent", ctx->r[0] == g_expect_obj); }
void func_00054f20_set_no_block(arm_ctx *ctx)
{ note("set_no_block", ctx->r[0] == g_expect_obj); }
void func_0002ec24_me_in_front(arm_ctx *ctx)
{ note("me_in_front", ctx->r[0] == g_expect_obj); }
void func_00057488_player_normpal(arm_ctx *ctx)
{ note("player_normpal", ctx->r[0] == g_expect_obj); }
void func_0002ec68_disable_all_buttons(arm_ctx *ctx)
{ note("disable_all_buttons", ctx->r[0] == g_expect_obj); }

/* ------------------------------------------------------------- the clean C */

/* Mirrors decomp/gamecode/logic/other.c. Declared here rather than pulling in
 * a gamecode header, because there is not one yet. */
typedef struct MK3OBJPROC { uint8_t _pad00[0x10]; uint32_t field10; } MK3OBJPROC;
typedef struct MK3OBJ { MK3OBJPROC *field00; uint8_t _pad04[0x28]; uint32_t field2c; } MK3OBJ;
void isp2(MK3OBJ *obj);

/* other.c also holds SwitchQueue, which reaches the game state through the
 * global `G`. isp2 never touches it, but linking the translation unit means
 * resolving it. A stand-in is enough and says so. */
typedef struct GAMESTATE GAMESTATE;
GAMESTATE *G = NULL;

/* ------------------------------------------------------------------ driver */

static int  g_fail  = 0;
static long g_cases = 0;

static void run(uint32_t flags0, uint32_t f2c0)
{
    MK3OBJ     obj;
    MK3OBJPROC proc;
    arm_ctx    ctx;
    char       lbl[64];
    int        i;

    snprintf(lbl, sizeof(lbl), "flags=0x%08x f2c=0x%08x", flags0, f2c0);

    g_nclean = g_noracle = 0;

    /* native */
    memset(&obj, 0, sizeof(obj));
    memset(&proc, 0, sizeof(proc));
    obj.field00  = &proc;
    obj.field2c  = f2c0;
    proc.field10 = flags0;

    g_to_oracle = 0;
    isp2(&obj);

    /* register file */
    MEM_ST32(G_OBJ  + OBJ_FIELD00,  G_PROC);
    MEM_ST32(G_OBJ  + OBJ_FIELD2C,  f2c0);
    MEM_ST32(G_PROC + PROC_FIELD10, flags0);

    memset(&ctx, 0, sizeof(ctx));
    ctx.r[SP] = STACK_TOP;
    ctx.r[0]  = G_OBJ;
    g_expect_obj = G_OBJ;

    g_to_oracle = 1;
    func_00058798_isp2(&ctx);

    g_cases++;

    /* the call stream */
    if (g_nclean != g_noracle) {
        printf("  DIVERGE %s: %d calls clean vs %d oracle\n",
               lbl, g_nclean, g_noracle);
        g_fail++;
    } else {
        for (i = 0; i < g_nclean; i++) {
            if (strcmp(g_clean[i].fn, g_oracle[i].fn) != 0) {
                printf("  DIVERGE %s call %d: clean=%s  oracle=%s\n",
                       lbl, i, g_clean[i].fn, g_oracle[i].fn);
                g_fail++;
                break;
            }
            if (g_clean[i].arg0 != g_oracle[i].arg0) {
                printf("  DIVERGE %s call %d %s: argument is not the object on "
                       "one side\n", lbl, i, g_clean[i].fn);
                g_fail++;
            }
        }
    }

    /* the two stores */
    if (obj.field2c != MEM_LD32(G_OBJ + OBJ_FIELD2C)) {
        printf("  DIVERGE %s field2c: clean=0x%08x  oracle=0x%08x\n",
               lbl, obj.field2c, MEM_LD32(G_OBJ + OBJ_FIELD2C));
        g_fail++;
    }
    if (proc.field10 != MEM_LD32(G_PROC + PROC_FIELD10)) {
        printf("  DIVERGE %s field10: clean=0x%08x  oracle=0x%08x\n",
               lbl, proc.field10, MEM_LD32(G_PROC + PROC_FIELD10));
        g_fail++;
    }

    /* and that the bit actually went in, which agreement alone would not show */
    if ((proc.field10 & 0x10u) == 0u) {
        printf("  DIVERGE %s: bit 4 not set after isp2\n", lbl);
        g_fail++;
    }
    if ((flags0 & ~0x10u) != (proc.field10 & ~0x10u)) {
        printf("  DIVERGE %s: isp2 disturbed a bit other than 4\n", lbl);
        g_fail++;
    }
}

int main(void)
{
    uint32_t seed = 0xA5A50001u;
    int i;

    setvbuf(stdout, NULL, _IONBF, 0);
    arm_mem_init(RAM_SIZE);

    printf("=== clean isp2 vs the recompiled original ===\n");
    printf("compares the call sequence and the two stores. The five callees\n");
    printf("are stubbed identically on both sides -- see the header.\n\n");

    /* the boundaries first */
    run(0x00000000u, 0x00000000u);
    run(0x00000010u, 0x00000000u);      /* bit already set: the OR is idempotent */
    run(0xFFFFFFFFu, 0xDEADBEEFu);
    run(0xFFFFFFEFu, 0x00000001u);      /* every bit but 4 */
    run(0x00000010u, 0x00000010u);

    /* then a spread, half of them with bit 4 already in */
    for (i = 0; i < 200; i++) {
        seed = seed * 1664525u + 1013904223u;
        run((i & 1) ? (seed | 0x10u) : (seed & ~0x10u), seed ^ 0x5A5A5A5Au);
    }

    printf("\ncases compared: %ld    divergences: %d\n", g_cases, g_fail);
    printf("%s\n", g_fail ? "RESULT: FAIL"
                          : "RESULT: the clean isp2 matches the original");

    arm_mem_free();
    return g_fail ? 1 : 0;
}
