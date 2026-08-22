/*
 * test_gup2_diff.c — clean gup2 against the oracle.
 *
 * `gup2` is a coroutine: it runs a little, writes a resume address into the
 * switch stack, and returns. So there are four things to compare and all four
 * matter — the call sequence, the frames written, the stack pointer, and the
 * return value.
 *
 * ## Comparing addresses that cannot be compared
 *
 * The resume targets are the binary's own code addresses. A native build has
 * no such addresses and never will. Recording the raw word on one side and a
 * host pointer on the other would manufacture a divergence on every frame — a
 * mistake this project already made once in tests/gl_trace.c.
 *
 * So each target is compared **by identity**: both sides are given the same
 * seven-symbol table, and what gets checked is *which* of them was written,
 * not what it numerically is. A body that pushed `t_d_getup` where the original
 * pushes `t_getup_stay_ducked` still fails; a body that pushes the right one
 * passes regardless of where it lives.
 *
 * ## What the cases are chosen against
 *
 *  - **Every entry code**, including two that are not any of the five, because
 *    the -3 default is a real branch and the easiest one to drop.
 *  - **Both sides of every gate**: `am_i_joy`, `is_stick_down` twice over,
 *    `field44 == 0x17`, and the animation word being zero.
 *  - **A non-zero stack pointer.** Three paths write into frame `sp` and two
 *    into `sp + 1`, and the difference comes from which register reached a
 *    shared epilogue. At sp = 0 a body that confused them would agree.
 *  - **Frames that already hold something**, so a path that fails to write is
 *    caught instead of agreeing with a zeroed arena.
 */

#include "arm_runtime.h"
#include "gup2.h"                       /* oracle: tools/armrecomp */

#include <stdio.h>
#include <string.h>

#define RAM_SIZE   (8u << 20)
#define STACK_TOP  0x007F0000u

/* Above the loaded slice (0x23D0B0 plus data and bss). An arena inside it
 * silently overwrites the engine's own globals. */
#define G_PROC     0x00700000u
#define G_OBJ      0x00710000u
#define G_ANIWORD  0x00720000u

#define P_SWITCHSP 0x00A4u
#define P_FIELDFC  0x00FCu
#define P_OBJ      0x0108u

#define O_FIELD1C  0x1Cu
#define O_FIELD40  0x40u
#define O_FIELD44  0x44u
#define O_FIELD48  0x48u
#define O_FIELD5C  0x5Cu

/* ------------------------------------------------- the symbols, both sides */

/* Seven external symbols the clean C references by name. Their addresses here
 * are arbitrary; only which one is used is ever compared. */
char t_check_stay_down[4], t_check_winner_status[4], t_local_reaction_exit[4];
char t_d_getup[4], t_getup_stay_ducked[4], t_joy_getup_abort[4];
char getup_speeds[4];

/* The same seven as the guest sees them. The oracle loads these from the
 * slice, so the test reads what it actually pushed and maps it back. */
#define SYM_COUNT 7
static const char *g_sym_name[SYM_COUNT] = {
    "t_check_stay_down", "t_check_winner_status", "t_local_reaction_exit",
    "t_d_getup", "t_getup_stay_ducked", "t_joy_getup_abort", "getup_speeds"
};
static void       *g_sym_host[SYM_COUNT];
static uint32_t    g_sym_guest[SYM_COUNT] = {
    /* resolved from the slice, with the Thumb bit as the binary stores it */
    0x00042005u,        /* _t_check_stay_down + 1   */
    0x0002ecd5u,        /* _t_check_winner_status   */
    0x00030061u,        /* _t_local_reaction_exit   */
    0x00071619u,        /* _t_d_getup               */
    0x00044409u,        /* _t_getup_stay_ducked + 1 */
    0x000443c5u,        /* _t_joy_getup_abort + 1   */
    0x001671a4u         /* _getup_speeds            */
};

static const char *name_of_host(void *p)
{
    int i;
    if (p == NULL) return "(null)";
    for (i = 0; i < SYM_COUNT; i++) if (p == g_sym_host[i]) return g_sym_name[i];
    return "(unknown)";
}

static const char *name_of_guest(uint32_t v)
{
    int i;
    if (v == 0u) return "(null)";
    for (i = 0; i < SYM_COUNT; i++) if (v == g_sym_guest[i]) return g_sym_name[i];
    return "(unknown)";
}

/* ---------------------------------------------------------------- the log */

#define MAX_CALLS 24
static const char *g_clean_call[MAX_CALLS], *g_oracle_call[MAX_CALLS];
static int g_nclean, g_noracle, g_to_oracle;

static void note(const char *fn)
{
    if (g_to_oracle) { if (g_noracle < MAX_CALLS) g_oracle_call[g_noracle++] = fn; }
    else             { if (g_nclean  < MAX_CALLS) g_clean_call[g_nclean++]  = fn; }
}

/* The two gates the callees drive. Set per case and applied by both sides, so
 * `is_stick_down` and the animation word behave identically. */
static int      g_stick_down;
static int      g_am_i_joy;
static uint32_t g_ani_word;

/* ---- native side ---- */
struct MK3OBJ;
void back_to_normal(struct MK3OBJ *o)  { (void)o; note("back_to_normal"); }
int  am_i_joy(struct MK3OBJ *o)        { (void)o; note("am_i_joy"); return g_am_i_joy; }
void get_char_ani(struct MK3OBJ *o)    { (void)o; note("get_char_ani"); }
void init_anirate(struct MK3OBJ *o)    { (void)o; note("init_anirate"); }
void next_anirate(struct MK3OBJ *o)    { (void)o; note("next_anirate"); }
void joystick_in_a0(struct MK3OBJ *o)  { (void)o; note("joystick_in_a0"); }

/* is_stick_down is the one callee with an observable effect: it sets +0x5c,
 * which gup2 then branches on. Both sides write the same value from the same
 * per-case setting, so the branch is driven rather than left to chance. */
void is_stick_down(struct MK3OBJ *o);

/* ---- register-file side ---- */
void func_00059750_back_to_normal(arm_ctx *ctx) { (void)ctx; note("back_to_normal"); }
void func_00054ce0_am_i_joy(arm_ctx *ctx)       { note("am_i_joy"); ctx->r[0] = (uint32_t)g_am_i_joy; }
void func_0005520c_get_char_ani(arm_ctx *ctx)   { (void)ctx; note("get_char_ani"); }
void func_000553a0_init_anirate(arm_ctx *ctx)   { (void)ctx; note("init_anirate"); }
void func_0005a680_next_anirate(arm_ctx *ctx)   { (void)ctx; note("next_anirate"); }
void func_00055d94_joystick_in_a0(arm_ctx *ctx) { (void)ctx; note("joystick_in_a0"); }
void func_00055e1c_is_stick_down(arm_ctx *ctx)
{
    note("is_stick_down");
    MEM_ST32(ctx->r[0] + O_FIELD5C, (uint32_t)g_stick_down);
}

/* ------------------------------------------------------------- the clean C */

typedef struct SWITCHFRAME { uint32_t code; void *resume; } SWITCHFRAME;

typedef struct MK3OBJ {
    uint8_t   _pad00[0x1c];
    int       field1c;
    uint8_t   _pad20[0x20];
    uint32_t *field40;
    void     *field44;
    void     *field48;
    uint8_t   _pad4c[0x10];
    int       field5c;
} MK3OBJ;

typedef struct PROC {
    SWITCHFRAME stack[20];
    uint8_t     _pad_a0[4];
    long        switchSP;
    uint8_t     _pad_a8[0x54];
    long        fieldfc;
    uint8_t     _pad_100[8];
    MK3OBJ     *obj;
} PROC;

long gup2(PROC *proc);

static MK3OBJ h_obj;

void is_stick_down(struct MK3OBJ *o)
{
    note("is_stick_down");
    ((MK3OBJ *)o)->field5c = g_stick_down;
}

/* ------------------------------------------------------------------ driver */

static int  g_fail  = 0;
static long g_cases = 0;

static uint32_t h_ani;

static void run(long sp, uint32_t code, int joy, int stick,
                uint32_t aniword, uint32_t f44)
{
    PROC     proc;
    arm_ctx  ctx;
    char     lbl[128];
    long     rc_clean, rc_oracle;
    int      i;
    uint32_t a;

    snprintf(lbl, sizeof(lbl),
             "sp=%ld code=0x%04x joy=%d stick=%d ani=%u f44=0x%x",
             sp, code, joy, stick, aniword, f44);

    g_am_i_joy   = joy;
    g_stick_down = stick;
    g_ani_word   = aniword;
    g_nclean = g_noracle = 0;

    /* ---- native ---- */
    memset(&proc, 0, sizeof(proc));
    memset(&h_obj, 0, sizeof(h_obj));
    h_ani = aniword;

    /* frames pre-filled with something recognisable, so a path that fails to
     * write is caught rather than agreeing with zeros */
    for (i = 0; i < 20; i++) { proc.stack[i].code = 0xEEEE0000u + (uint32_t)i;
                               proc.stack[i].resume = NULL; }
    proc.switchSP        = sp;
    proc.stack[sp + 1].code = code;
    proc.obj             = &h_obj;
    h_obj.field40        = &h_ani;
    h_obj.field44        = (void *)(uintptr_t)f44;
    h_obj.field5c        = 0;

    g_to_oracle = 0;
    rc_clean = gup2(&proc);

    /* ---- register file ---- */
    for (a = 0; a < 0x120u; a += 4u) MEM_ST32(G_PROC + a, 0u);
    for (a = 0; a < 0x80u;  a += 4u) MEM_ST32(G_OBJ + a, 0u);
    for (i = 0; i < 20; i++) {
        MEM_ST32(G_PROC + 8u * (uint32_t)i,      0xEEEE0000u + (uint32_t)i);
        MEM_ST32(G_PROC + 8u * (uint32_t)i + 4u, 0u);
    }
    MEM_ST32(G_PROC + P_SWITCHSP, (uint32_t)sp);
    MEM_ST32(G_PROC + 8u * (uint32_t)(sp + 1), code);
    MEM_ST32(G_PROC + P_OBJ, G_OBJ);
    MEM_ST32(G_OBJ + O_FIELD40, G_ANIWORD);
    MEM_ST32(G_OBJ + O_FIELD44, f44);
    MEM_ST32(G_OBJ + O_FIELD5C, 0u);
    MEM_ST32(G_ANIWORD, aniword);

    memset(&ctx, 0, sizeof(ctx));
    ctx.r[SP] = STACK_TOP;
    ctx.r[0]  = G_PROC;

    g_to_oracle = 1;
    func_00044254_gup2(&ctx);
    rc_oracle = (long)(int32_t)ctx.r[0];

    g_cases++;

    /* ---- the return value ---- */
    if (rc_clean != rc_oracle) {
        printf("  DIVERGE %s: returned %ld clean vs %ld oracle\n",
               lbl, rc_clean, rc_oracle);
        g_fail++;
    }

    /* ---- the call sequence ---- */
    if (g_nclean != g_noracle) {
        printf("  DIVERGE %s: %d calls clean vs %d oracle\n",
               lbl, g_nclean, g_noracle);
        g_fail++;
    } else {
        for (i = 0; i < g_nclean; i++) {
            if (strcmp(g_clean_call[i], g_oracle_call[i]) != 0) {
                printf("  DIVERGE %s call %d: clean=%s  oracle=%s\n",
                       lbl, i, g_clean_call[i], g_oracle_call[i]);
                g_fail++;
                break;
            }
        }
    }

    /* ---- the stack pointer ---- */
    if ((uint32_t)proc.switchSP != MEM_LD32(G_PROC + P_SWITCHSP)) {
        printf("  DIVERGE %s switchSP: clean=%ld  oracle=%u\n",
               lbl, proc.switchSP, MEM_LD32(G_PROC + P_SWITCHSP));
        g_fail++;
    }

    /* ---- every frame: the code exactly, the resume by identity ---- */
    for (i = 0; i < 20; i++) {
        uint32_t oc = MEM_LD32(G_PROC + 8u * (uint32_t)i);
        uint32_t orr = MEM_LD32(G_PROC + 8u * (uint32_t)i + 4u);
        const char *cn = name_of_host(proc.stack[i].resume);
        const char *on = name_of_guest(orr);

        if (proc.stack[i].code != oc) {
            printf("  DIVERGE %s frame %d code: clean=0x%08x  oracle=0x%08x\n",
                   lbl, i, proc.stack[i].code, oc);
            g_fail++;
        }
        if (strcmp(cn, on) != 0) {
            printf("  DIVERGE %s frame %d resume: clean=%s  oracle=%s\n",
                   lbl, i, cn, on);
            g_fail++;
        }
    }

    /* ---- fieldfc, and the object fields the paths touch ---- */
    if ((uint32_t)proc.fieldfc != MEM_LD32(G_PROC + P_FIELDFC)) {
        printf("  DIVERGE %s fieldfc: clean=%ld  oracle=%u\n",
               lbl, proc.fieldfc, MEM_LD32(G_PROC + P_FIELDFC));
        g_fail++;
    }
    if ((uint32_t)h_obj.field1c != MEM_LD32(G_OBJ + O_FIELD1C)) {
        printf("  DIVERGE %s obj+0x1c: clean=%d  oracle=%u\n",
               lbl, h_obj.field1c, MEM_LD32(G_OBJ + O_FIELD1C));
        g_fail++;
    }
    {
        const char *cn = name_of_host(h_obj.field48);
        const char *on = name_of_guest(MEM_LD32(G_OBJ + O_FIELD48));
        if (strcmp(cn, on) != 0) {
            printf("  DIVERGE %s obj+0x48: clean=%s  oracle=%s\n", lbl, cn, on);
            g_fail++;
        }
    }
}

int main(int argc, char **argv)
{
    const char *slice = (argc > 1) ? argv[1] : "work/UMK3.armv7";
    long sp;
    int  joy, stick, f17;
    uint32_t ani;

    setvbuf(stdout, NULL, _IONBF, 0);
    arm_mem_init(RAM_SIZE);

    /* **The slice has to be loaded.**
     *
     * Three of gup2's resume targets are not immediates -- they are POINTER
     * SLOTS in __DATA that the code dereferences at run time:
     *
     *      ldr r3, [pc, #N] ; add r3, pc ; ldr r1, [r3]
     *
     * Without the image in guest memory those slots read as zero and the
     * oracle pushes NULL, which looks exactly like the clean C inventing an
     * address it should not have. It is the other way round. */
    if (arm_load_image(slice) != 0) {
        printf("no se pudo cargar %s\n", slice);
        return 2;
    }

    g_sym_host[0] = t_check_stay_down;
    g_sym_host[1] = t_check_winner_status;
    g_sym_host[2] = t_local_reaction_exit;
    g_sym_host[3] = t_d_getup;
    g_sym_host[4] = t_getup_stay_ducked;
    g_sym_host[5] = t_joy_getup_abort;
    g_sym_host[6] = getup_speeds;

    printf("=== clean gup2 vs the recompiled original ===\n");
    printf("compares the return value, the call sequence, the switch stack,\n");
    printf("and the fields touched. Resume addresses are matched by IDENTITY\n");
    printf("against a shared symbol table -- see the header.\n\n");

    /* codes that are not any of the five: the -3 default */
    run(0, 0x0001u, 0, 0, 5u, 0u);
    run(3, 0xFFFFu, 0, 0, 5u, 0u);
    run(2, 0x14d8u, 0, 0, 5u, 0u);

    /* the five entry codes, over both stack pointers and every gate */
    for (sp = 0; sp <= 4; sp += 2)
        for (joy = 0; joy < 2; joy++)
            for (stick = 0; stick < 2; stick++)
                for (f17 = 0; f17 < 2; f17++)
                    for (ani = 0; ani < 2; ani++) {
                        uint32_t f44 = f17 ? 0x17u : 0x99u;
                        run(sp, 0x0000u, joy, stick, ani, f44);
                        run(sp, 0x14d9u, joy, stick, ani, f44);
                        run(sp, 0x14dau, joy, stick, ani, f44);
                        run(sp, 0x14fcu, joy, stick, ani, f44);
                        run(sp, 0x14ffu, joy, stick, ani, f44);
                    }

    printf("\ncases compared: %ld    divergences: %d\n", g_cases, g_fail);
    printf("%s\n", g_fail ? "RESULT: FAIL"
                          : "RESULT: the clean gup2 matches the original");

    arm_mem_free();
    return g_fail ? 1 : 0;
}
