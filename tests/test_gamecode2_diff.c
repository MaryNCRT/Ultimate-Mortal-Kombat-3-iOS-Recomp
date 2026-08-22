/*
 * test_gamecode2_diff.c — six more small gamecode functions against the oracle.
 *
 * Each one has a specific way it could be written wrong that still reads
 * correctly, and the cases are chosen against those rather than at random.
 *
 *   JadeStomachShaker   an INCLUSIVE unsigned range, 0x23..0x29. `< 6` instead
 *                       of `<= 6` loses one value out of seven; signed instead
 *                       of unsigned lets everything below 0x23 through. Both
 *                       ends and both neighbours are driven.
 *
 *   InitParticles       clears ONE word per 0x30-byte record. A memset over the
 *                       pool agrees on that word everywhere and destroys the
 *                       other eleven, so the test poisons the pool first and
 *                       checks what SURVIVED.
 *
 *   resetKodeSelector   six words with a HOLE at 0x0c..0x18. Same shape: the
 *                       gap is poisoned and must still be poisoned afterwards.
 *
 *   DumpAltCostume      the clear is inside the guard, so a second call is a
 *                       no-op rather than a double free. Driven twice.
 *
 *   get_csound          two levels, two scales, and the arguments are not
 *                       interchangeable. The table is built so that swapping
 *                       them returns a different value rather than the same.
 *
 *   Reset_Stats         0x98 bytes, and the bytes on either side must not move.
 */

#include "arm_runtime.h"
#include "gamecode2.h"                  /* oracle: tools/armrecomp */

#include <stdio.h>
#include <string.h>

#define RAM_SIZE   (32u << 20)
#define STACK_TOP  0x00FF0000u

/* guest addresses of the globals, from the PC-relative loads */
#define G_PARTICLES     0x001f44d4u
#define G_CSOUNDTAB     0x0017b278u
#define G_KODESELECTOR  0x000ff8f8u
#define G_STATS         0x00183c84u

/* the test's own arena, clear of the slice */
#define G_PLAYER        0x00900000u
#define G_TEXTURE       0x00910000u
#define G_INNER         0x00920000u

#define PARTICLE_STRIDE 0x30u
#define PARTICLE_COUNT  512u
#define POISON          0xA5A5A5A5u

static int  g_fail  = 0;
static long g_cases = 0;

static void check(const char *what, int ok)
{
    g_cases++;
    if (!ok) { printf("  DIVERGE %s\n", what); g_fail++; }
}

/* ------------------------------------------------- what the clean C needs */

typedef struct PARTICLE {
    uint8_t  _pad00[8];
    uint32_t field08;
    uint8_t  _pad0c[0x24];
} PARTICLE;
PARTICLE Particles[PARTICLE_COUNT];

typedef struct CSOUNDENTRY { uint32_t field00, field04; } CSOUNDENTRY;
CSOUNDENTRY *ochar_sound_tables[8];

int  KodeSelector[10];
char Stats[0x98];

typedef struct TEXTURE TEXTURE;
typedef struct PLAYER_P { uint8_t _pad000[0x530]; TEXTURE *altCostume; } PLAYER_P;

typedef struct PLAYER {
    uint32_t field00;
    uint8_t  _pad04[0x10];
    uint32_t field14;
} PLAYER;

void     InitParticles(void);
uint32_t get_csound(long index, long character);
void     resetKodeSelector(void);
void     Reset_Stats(void);
void     DumpAltCostume(PLAYER_P *p);
int      JadeStomachShaker(PLAYER *p);

/* GameCode.c and FrontEnd.c hold more than the two functions this test drives,
 * and linking a translation unit means resolving everything in it. None of
 * these is touched here; they exist so the link succeeds. The alternative --
 * splitting each function into its own file -- would let the test dictate the
 * source layout, and the layout should match the original's. */
int LockCamera;
int AxeTrailDisallowed;
int RenderSettings[2];
float FE_WidthScale;
float FE_HeightScale;
typedef struct TEXTURETOLOAD { const char *name; TEXTURE **dest; } TEXTURETOLOAD;
TEXTURETOLOAD BloodTexturesToLoad[1];
void LoadSomeTextures(TEXTURETOLOAD *l) { (void)l; }
void FreeSomeTextures(TEXTURETOLOAD *l) { (void)l; }
typedef struct GAMESTATE { uint8_t _pad000[0x44e]; int16_t field44e; } GAMESTATE;
static GAMESTATE g_state;
GAMESTATE *G = &g_state;

static int g_clean_deletes;
static const void *g_clean_deleted;
void limeDeleteTexture(TEXTURE *t) { g_clean_deletes++; g_clean_deleted = t; }

/* ------------------------------------------------- what the oracle calls */

static int      g_oracle_deletes;
static uint32_t g_oracle_deleted;
void func_000673cc_limeDeleteTexture(arm_ctx *ctx)
{ g_oracle_deletes++; g_oracle_deleted = ctx->r[0]; }

/* ---------------------------------------------------------------- helpers */

static void call0(void (*fn)(arm_ctx *))
{
    arm_ctx c; memset(&c, 0, sizeof(c)); c.r[SP] = STACK_TOP; fn(&c);
}

static uint32_t call1(void (*fn)(arm_ctx *), uint32_t a0)
{
    arm_ctx c; memset(&c, 0, sizeof(c)); c.r[SP] = STACK_TOP; c.r[0] = a0;
    fn(&c); return c.r[0];
}

static uint32_t call2(void (*fn)(arm_ctx *), uint32_t a0, uint32_t a1)
{
    arm_ctx c; memset(&c, 0, sizeof(c)); c.r[SP] = STACK_TOP;
    c.r[0] = a0; c.r[1] = a1; fn(&c); return c.r[0];
}

int main(int argc, char **argv)
{
    const char *slice = (argc > 1) ? argv[1] : "work/UMK3.armv7";
    unsigned i;
    uint32_t v;

    setvbuf(stdout, NULL, _IONBF, 0);
    arm_mem_init(RAM_SIZE);
    if (arm_load_image(slice) != 0) {
        printf("no se pudo cargar %s\n", slice);
        return 2;
    }

    printf("=== six more gamecode functions vs the recompiled original ===\n");
    printf("each case is aimed at how that function could be wrong and still\n");
    printf("read correctly -- see the header.\n\n");

    /* ---------------------------------------------- JadeStomachShaker ---- */
    {
        static const uint32_t F0[] = { 0u, 1u, 0x0Fu, 0x10u, 0x11u, 0xFFFFu };
        static const uint32_t F14[] = { 0u, 0x22u, 0x23u, 0x24u, 0x28u,
                                        0x29u, 0x2Au, 0xFFu, 0xFFFFFFFFu };
        size_t a, b;
        PLAYER pl;

        for (a = 0; a < sizeof(F0)/sizeof(F0[0]); a++)
            for (b = 0; b < sizeof(F14)/sizeof(F14[0]); b++) {
                int want, got_c, got_o;

                memset(&pl, 0, sizeof(pl));
                pl.field00 = F0[a]; pl.field14 = F14[b];
                got_c = JadeStomachShaker(&pl);

                for (i = 0; i < 0x20u; i += 4u) MEM_ST32(G_PLAYER + i, 0u);
                MEM_ST32(G_PLAYER + 0x00u, F0[a]);
                MEM_ST32(G_PLAYER + 0x14u, F14[b]);
                got_o = (int)call1(func_0001c64c_Z17JadeStomachShakerP6PLAYER, G_PLAYER);

                want = (F0[a] == 0x10u && (F14[b] - 0x23u) <= 6u) ? 1 : 0;

                check("JadeStomachShaker: clean and oracle agree", got_c == got_o);
                check("JadeStomachShaker: and it is the inclusive unsigned range",
                      got_c == want);
            }
    }

    /* -------------------------------------------------- InitParticles ---- */
    {
        uint32_t base = G_PARTICLES, a;
        int      survived = 1, cleared = 1;

        for (a = 0; a < PARTICLE_COUNT * PARTICLE_STRIDE; a += 4u)
            MEM_ST32(base + a, POISON);

        call0(func_0005ab54_InitParticles);

        for (i = 0; i < PARTICLE_COUNT; i++) {
            uint32_t rec = base + PARTICLE_STRIDE * i;
            if (MEM_LD32(rec + 8u) != 0u) cleared = 0;
            for (a = 0; a < PARTICLE_STRIDE; a += 4u)
                if (a != 8u && MEM_LD32(rec + a) != POISON) survived = 0;
        }
        check("InitParticles cleared +8 in every one of 512 records", cleared);
        check("InitParticles left the other eleven words alone", survived);

        /* the clean side, same two questions */
        memset(Particles, 0xA5, sizeof(Particles));
        InitParticles();
        cleared = survived = 1;
        for (i = 0; i < PARTICLE_COUNT; i++) {
            const uint8_t *rec = (const uint8_t *)&Particles[i];
            if (Particles[i].field08 != 0u) cleared = 0;
            for (a = 0; a < PARTICLE_STRIDE; a++)
                if ((a < 8u || a >= 12u) && rec[a] != 0xA5u) survived = 0;
        }
        check("clean InitParticles cleared +8 everywhere", cleared);
        check("clean InitParticles left the rest alone", survived);
    }

    /* ---------------------------------------------- resetKodeSelector ---- */
    {
        int ok = 1;
        for (i = 0; i < 0x28u; i += 4u) MEM_ST32(G_KODESELECTOR + i, POISON);
        call0(func_00002f04_Z17resetKodeSelectorv);

        for (i = 0; i < 10u; i++) {
            uint32_t off = 4u * i;
            uint32_t got = MEM_LD32(G_KODESELECTOR + off);
            int      should_clear = (off <= 8u) || (off >= 0x1Cu);
            if (should_clear ? (got != 0u) : (got != POISON)) ok = 0;
        }
        check("resetKodeSelector cleared six words and preserved the hole", ok);

        for (i = 0; i < 10u; i++) KodeSelector[i] = (int)POISON;
        resetKodeSelector();
        ok = 1;
        for (i = 0; i < 10u; i++) {
            int should_clear = (i <= 2u) || (i >= 7u);
            if (should_clear ? (KodeSelector[i] != 0) : (KodeSelector[i] != (int)POISON))
                ok = 0;
        }
        check("clean resetKodeSelector matches, hole and all", ok);
    }

    /* ---------------------------------------------------- Reset_Stats ---- */
    {
        int inside = 1, outside = 1;
        for (i = 0; i < 0x120u; i += 4u) MEM_ST32(G_STATS - 0x20u + i, POISON);
        call0(func_00013120_Reset_Stats);

        for (i = 0; i < 0x98u; i += 4u)
            if (MEM_LD32(G_STATS + i) != 0u) inside = 0;
        for (i = 0; i < 0x20u; i += 4u)
            if (MEM_LD32(G_STATS - 0x20u + i) != POISON) outside = 0;
        check("Reset_Stats zeroed 0x98 bytes", inside);
        check("Reset_Stats did not run past either end", outside);

        memset(Stats, 0xA5, sizeof(Stats));
        Reset_Stats();
        inside = 1;
        for (i = 0; i < 0x98u; i++) if (Stats[i] != 0) inside = 0;
        check("clean Reset_Stats zeroed 0x98 bytes", inside);
    }

    /* ------------------------------------------------- DumpAltCostume ---- */
    {
        PLAYER_P pl;

        /* with a costume: one delete, then the pointer clears */
        memset(&pl, 0, sizeof(pl));
        pl.altCostume = (TEXTURE *)&pl;         /* any non-NULL */
        g_clean_deletes = 0; g_clean_deleted = NULL;
        DumpAltCostume(&pl);
        check("clean DumpAltCostume deleted once", g_clean_deletes == 1);
        check("clean DumpAltCostume passed the costume", g_clean_deleted == (void *)&pl);
        check("clean DumpAltCostume cleared the pointer", pl.altCostume == NULL);

        /* and a second call must do nothing at all */
        DumpAltCostume(&pl);
        check("clean DumpAltCostume is a no-op the second time", g_clean_deletes == 1);

        for (i = 0; i < 0x540u; i += 4u) MEM_ST32(G_PLAYER + i, 0u);
        MEM_ST32(G_PLAYER + 0x530u, G_TEXTURE);
        g_oracle_deletes = 0; g_oracle_deleted = 0u;
        call1(func_0005bef0_Z14DumpAltCostumeP6PLAYER, G_PLAYER);
        check("oracle DumpAltCostume deleted once", g_oracle_deletes == 1);
        check("oracle DumpAltCostume passed the costume", g_oracle_deleted == G_TEXTURE);
        check("oracle DumpAltCostume cleared the pointer",
              MEM_LD32(G_PLAYER + 0x530u) == 0u);

        call1(func_0005bef0_Z14DumpAltCostumeP6PLAYER, G_PLAYER);
        check("oracle DumpAltCostume is a no-op the second time", g_oracle_deletes == 1);
    }

    /* ------------------------------------------------------ get_csound ---- */
    {
        /* Four characters, four entries each, every field04 distinct -- so
         * swapping the two arguments returns a DIFFERENT number rather than
         * accidentally the same one. */
        static CSOUNDENTRY inner[4][4];
        long ch, ix;

        for (ch = 0; ch < 4; ch++) {
            uint32_t gi = G_INNER + 0x100u * (uint32_t)ch;
            ochar_sound_tables[ch] = inner[ch];
            MEM_ST32(G_CSOUNDTAB + 4u * (uint32_t)ch, gi);
            for (ix = 0; ix < 4; ix++) {
                uint32_t a0 = 0x1000u + 0x10u * (uint32_t)ch + (uint32_t)ix;
                uint32_t a4 = 0x2000u + 0x10u * (uint32_t)ch + (uint32_t)ix;
                inner[ch][ix].field00 = a0;
                inner[ch][ix].field04 = a4;
                MEM_ST32(gi + 8u * (uint32_t)ix + 0u, a0);
                MEM_ST32(gi + 8u * (uint32_t)ix + 4u, a4);
            }
        }

        for (ch = 0; ch < 4; ch++)
            for (ix = 0; ix < 4; ix++) {
                uint32_t c = get_csound(ix, ch);
                uint32_t o = call2(func_000a7ec0_get_csound,
                                   (uint32_t)ix, (uint32_t)ch);
                check("get_csound: clean and oracle agree", c == o);
                check("get_csound: second argument selects the table",
                      c == 0x2000u + 0x10u * (uint32_t)ch + (uint32_t)ix);
            }

        /* and the arguments really are not interchangeable */
        v = call2(func_000a7ec0_get_csound, 1u, 2u);
        check("get_csound(1,2) differs from get_csound(2,1)",
              v != call2(func_000a7ec0_get_csound, 2u, 1u));
    }

    printf("\nchecks: %ld    divergences: %d\n", g_cases, g_fail);
    printf("%s\n", g_fail ? "RESULT: FAIL"
                          : "RESULT: the clean gamecode functions match the original");

    arm_mem_free();
    return g_fail ? 1 : 0;
}
