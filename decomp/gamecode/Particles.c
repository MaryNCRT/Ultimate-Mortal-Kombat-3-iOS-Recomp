/*
 * Particles.c — src/gamecode/Particles.cpp
 *
 * Five functions in the original. This is the one that sets the pool up.
 * Verified against the oracle by tests/test_gamecode2_diff.c.
 */

#include <stdint.h>

/* The pool is 0x6000 bytes of 0x30-byte records -- 512 of them -- and this
 * function touches exactly one word in each. Only that word is named; nothing
 * here reads the other eleven. */
#define PARTICLE_STRIDE  0x30u
#define PARTICLE_POOL    0x6000u
#define PARTICLE_COUNT   (PARTICLE_POOL / PARTICLE_STRIDE)   /* 512 */

typedef struct PARTICLE {
    uint8_t  _pad00[8];
    uint32_t field08;            /* 0x08  the only thing InitParticles writes */
    uint8_t  _pad0c[0x24];
} PARTICLE;

extern PARTICLE Particles[PARTICLE_COUNT];   /* 0x001f44d4 */

void InitParticles(void);


/* ------------------------------------------------------------ InitParticles
 *
 * armv7 0x0005ab54, 24 bytes.
 *
 *      add.w r1, r3, #0x6000        ; the END, computed ONCE
 *  L:  movs  r2, #0
 *      str   r2, [r3, #8]
 *      adds  r3, #0x30
 *      cmp   r3, r1
 *      bne   L
 *
 * The bound is a byte span rather than a count, and the loop is entered at the
 * `movs` rather than at the `add` -- so `r1` is the fixed end of the pool and
 * not something recomputed from a moving cursor. Reading the branch target one
 * instruction earlier turns this into an infinite loop, which is the kind of
 * thing that reads fine and never terminates.
 *
 * It clears ONE word per record and leaves the other eleven alone. A memset
 * over the pool would be shorter, agree on everything this function is asked
 * about, and destroy whatever the rest of each record was carrying.
 */
void InitParticles(void)
{
    unsigned i;

    for (i = 0; i < PARTICLE_COUNT; i++)
        Particles[i].field08 = 0;
}


extern long PIrand_seed;                /* 0x0016f740 */


/* ---------------------------------------------------------------- PI_limeRand
 *
 * armv7 0x0005ab18, 52 bytes.  **Complete.**
 *
 *      seed = seed * 0x41c64e6d + 0x3039
 *      return (seed / 0x10000) % 0x8000
 *
 * **A textbook LCG with the textbook constants**: 1103515245 and 12345 are the
 * pair from the C standard's own example `rand()`, and the shift-and-mask tail
 * is `(seed / 65536) % 32768` written out by the compiler, sign handling and
 * all -- `bics r0, r0, r0, asr #32` is the branchless "clamp negatives to zero"
 * that the division needs.
 *
 * The particle system keeps its OWN seed, separate from `limeRand`. That is
 * worth preserving in a port: sharing one generator between particles and
 * gameplay makes the fight's randomness depend on how many sparks were drawn.
 */
long PI_limeRand(void)
{
    PIrand_seed = PIrand_seed * 1103515245L + 12345L;
    return (PIrand_seed / 0x10000) % 0x8000;
}


extern long  *GamePaused;               /* pointer slot */
extern long  *DoIntro;                  /* pointer slot */
extern void **GameObjects;              /* pointer slot */
extern float *Player1Pos;               /* pointer slot -> 0x00150564 */
extern float *Player2Pos;               /* pointer slot -> 0x00150570 */
extern char  *PlayersP;                 /* pointer slot -> _Players */
extern float  SmokeAdjust;              /* 0x0016f77c */
extern float  SmokeAdjust2;             /* 0x0016f780 */
extern float  SmokeAdjustZ;             /* 0x0016f778 */

long limeRand(void);
void AddParticles(long type, float x, float y, float z, float speed, long arg);


/* -------------------------------------------------------------- DoSmokesSmoke
 *
 * armv7 0x0005aff0, 624 bytes.  **Complete.**
 *
 * Emits Smoke's trail particles. Called with both fighters' ids and does the
 * same work twice, once per player.
 *
 * **The two characters that smoke are 22 and 14.** Both ids are hardcoded, and
 * they behave differently:
 *
 *      id == 22   the X offset is `SmokeAdjust`, or `SmokeAdjust2` when the
 *                 player's flag at +0x540 (player 1) / +0xb30 (player 2) is set
 *      id == 14   the X offset is 0.0
 *
 * So one of them is nudged sideways by a tunable and the other is not, and
 * which tunable depends on a per-player flag. `_SmokeAdjust2` is the same
 * global whose neighbourhood several format strings live in.
 *
 * Note +0xb30 is +0x540 plus 0x5f0 -- the player stride, confirmed again.
 *
 * ### The frame guard, and the intro exception
 *
 * Normally it reads a frame id out of `*GameObjects` -- **+0x08 for player one
 * and +0x18 for player two**, both `int16` -- and emits nothing when that id is
 * 20000 or 6830. 20000 is the same `ARCADE_POS_RAW` sentinel
 * `ArcadePosTo3dPos` special-cases; 6830 is not otherwise known here.
 *
 * **While `DoIntro` is set the guard is skipped entirely** and the position is
 * taken straight from `Player1Pos` / `Player2Pos`. So smoke keeps coming during
 * the intro regardless of what frame the fighter is on.
 *
 * ### The puff height is randomised in double precision
 *
 *      z = pos[2] + 1.4 + (limeRand() & 15) / 15.0 * -0.7
 *
 * -- so it lands somewhere in a 0.7-unit band, from `z + 1.4` down to
 * `z + 0.7`, in sixteen steps. The whole expression is `.f64`: the add, the
 * divide by 15 and the `vmla`, narrowed to float only at the call. Sixteen
 * discrete heights, not a continuous range.
 *
 * `AddParticles(8, x, y, z, 60.0f, -1)` -- type 8, the same 60.0f speed the
 * blood functions use, and -1 where they pass a count.
 */
void DoSmokesSmoke(long id1, long id2)
{
    if (*GamePaused != 0)
        return;

    /* ---- player one ---- */
    if (id1 == 0x16 || id1 == 0x0e) {
        const float *pos = 0;
        float xoff = 0.0f;

        if (id1 == 0x16) {
            xoff = SmokeAdjust;
            if (*(const long *)(PlayersP + 0x540) != 0)
                xoff = SmokeAdjust2;
        }

        if (*DoIntro != 0) {
            pos = Player1Pos;
        } else {
            const short *obj = (const short *)*GameObjects;
            if (obj != 0) {
                long fid = obj[4];              /* +0x08, int16 */
                if (fid != 20000 && fid != 6830)
                    pos = Player1Pos;
            }
        }

        if (pos != 0) {
            double z = (double)pos[2] + 1.4;
            long r = limeRand() & 0xf;

            AddParticles(8, pos[0] + xoff, pos[1] + SmokeAdjustZ,
                         (float)(z + ((double)r / 15.0) * -0.7),
                         60.0f, -1);
        }
    }

    /* ---- player two ---- */
    if (id2 == 0x16 || id2 == 0x0e) {
        const float *pos = 0;
        float xoff = 0.0f;

        if (id2 == 0x16) {
            xoff = SmokeAdjust;
            if (*(const long *)(PlayersP + 0xb30) != 0)   /* 0x540 + 0x5f0 */
                xoff = SmokeAdjust2;
        }

        if (*DoIntro != 0) {
            pos = Player2Pos;
        } else {
            const short *obj = (const short *)*GameObjects;
            if (obj != 0) {
                long fid = obj[0x18 / 2];       /* +0x18, int16 */
                if (fid != 20000 && fid != 6830)
                    pos = Player2Pos;
            }
        }

        if (pos != 0) {
            double z = (double)pos[2] + 1.4;
            long r = limeRand() & 0xf;

            AddParticles(8, pos[0] + xoff, pos[1] + SmokeAdjustZ,
                         (float)(z + ((double)r / 15.0) * -0.7),
                         60.0f, -1);
        }
    }
}
