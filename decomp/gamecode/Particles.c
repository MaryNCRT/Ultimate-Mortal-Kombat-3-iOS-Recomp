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
    float    field00;            /* 0x00  a size, four steps of PSize/4 */
    float    field04;            /* 0x04  set together with field08, same value */
    float    field08;            /* 0x08  the free marker InitParticles clears */
    int32_t  field0c;            /* 0x0c  the type AddParticles was called with */
    float    field10;            /* 0x10  x, passed straight through */
    float    field14;            /* 0x14  y + blood_zoff */
    float    field18;            /* 0x18  z + blood_yoff */
    uint8_t  _pad1c[4];          /* 0x1c  not touched by AddParticles */
    float    field20;            /* 0x20  cleared on emit */
    float    vx;                 /* 0x24 */
    float    vy;                 /* 0x28  zero for every type except blood */
    float    vz;                 /* 0x2c */
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


/* ------------------------------------------------------------- AddParticles
 *
 * armv7 0x0005ab6c, 1,156 bytes.  **Complete.**
 *
 * Takes the first free slot in the 512-entry pool and fills it in. Four
 * different sets of initial velocities depending on the type, and they are
 * different enough that a port cannot collapse them.
 *
 * ### Finding a slot
 *
 * `field08` is the free marker -- it is the one word `InitParticles` clears,
 * and this function scans for the first slot whose `field08` is **exactly
 * 0.0f**. The scan runs indices 0 to 511 and **gives up silently** if all are
 * busy: no counter, no log, the particle is simply not emitted. With
 * `DoBlood` calling this eighty times a burst that matters, and it is the
 * behaviour to reproduce rather than fix.
 *
 * `type == 1` returns before the scan even starts. Nothing in the decompiled
 * code passes 1.
 *
 * ### What every type gets
 *
 *      field0c = type
 *      field10 = x                       passed straight through
 *      field14 = y + blood_zoff
 *      field18 = z + blood_yoff
 *      field20 = 0
 *      field04 = field08 = speed * 1.8f
 *
 * so the y and z the caller passes are **offsets from two globals**, not world
 * coordinates. `blood_zoff` lands on the y field and `blood_yoff` on the z --
 * that crossing is in the original and is what the names have to live with.
 *
 * Types 2, 4, 6 and 8 then overwrite `field04`/`field08` with a life instead:
 *
 *      max(0, (int)(speed - (limeRand() & 0xf)))
 *
 * clamped at zero with `bic r0, r0, r0, asr #31`, so a slow enough particle is
 * born already dead. Those four also set a size:
 *
 *      field00 = ((limeRand() & 3) + 1) * PSize * 0.25f
 *
 * four discrete sizes, a quarter of `PSize` apart.
 *
 * ### The four velocity sets
 *
 * All four draw three times from `PI_limeRand` -- the particle system's own
 * generator, not `limeRand` -- and mask to five bits.
 *
 * **Blood (2, 4, 6)** is the only one with a real Y velocity, and the only one
 * that scales by the `PScale` triple:
 *
 *      vx = (r/31.0 - 0.5)      * PScale[0]
 *      vy = (r/-31.0 * 0.5)     * PScale[1]
 *      vz = (r/31.0  * 0.5)     * PScale[2]
 *
 * **Type 0** aims the particle sideways from the fighter, and is the only place
 * the sixth argument is used at all:
 *
 *      vx = (r/32.0 - 0.5) * blood_xvs + (float)arg * blood_lrscale
 *      vx += blood_minxvel   if vx >= 0, otherwise vx -= blood_minxvel
 *      vx *= 0.01
 *      vy *= 0.0
 *      vz *= 0.1
 *
 * so `arg` is a **left/right bias** and `blood_minxvel` a floor that pushes the
 * particle away from the centre whichever side it started.
 *
 * **Smoke (8)** and **everything else** take the same three draws and differ
 * only in the final scale: `0.1 / 0.0 / 0.01` for smoke and `0.2 / 0.0 / 0.1`
 * for the default.
 *
 * ### The Y velocity is multiplied by zero
 *
 * Types 0, 8 and the default all end with `vy = vy * 0.0f` -- a literal zero in
 * the pool, not a store of zero, so the compiler was given `vy *= <something>`
 * with something folded to 0.0. The draw that produced it is still made and
 * still advances the generator, which is why removing it would change every
 * particle after it. **Only blood rises or falls**; everything else moves in
 * the XZ plane.
 */

extern float blood_zoff;                /* 0x0016f754 */
extern float blood_yoff;                /* 0x0016f758 */
extern float blood_lrscale;             /* 0x0016f75c */
extern float blood_xvs;                 /* 0x0016f760 */
extern float blood_minxvel;             /* 0x0016f750 */
extern float PScale[3];                 /* 0x0016f768 */
extern float PSize;                     /* 0x0016f774 */

/* The three draws every velocity set starts from. `d` is the divisor the
 * original uses -- 32.0 for everything except blood, which uses 31.0. */
static void PI_RandomVelocities(PARTICLE *p, double d)
{
    p->vx = (float)((double)(PI_limeRand() & 0x1f) / d - 0.5);
    p->vy = (float)((double)(PI_limeRand() & 0x1f) / d - 0.5);
    p->vz = (float)((double)(PI_limeRand() & 0x1f) / d);
}

/* The life and size types 2, 4, 6 and 8 share. Born dead if the draw exceeds
 * the speed. */
static void SetLifeAndSize(PARTICLE *p, float speed)
{
    long life = (long)(speed - (float)(limeRand() & 0xf));

    if (life < 0)
        life = 0;                       /* bic r0, r0, r0, asr #31 */

    p->field08 = (float)life;
    p->field04 = (float)life;

    p->field00 = (float)((limeRand() & 3) + 1) * PSize * 0.25f;
}

void AddParticles(long type, float x, float y, float z, float speed, long arg)
{
    PARTICLE *p;
    long      i;

    if (type == 1)
        return;

    /* the first slot whose free marker is exactly zero, or nothing at all */
    for (i = 0; ; i++) {
        if (Particles[i].field08 == 0.0f)
            break;
        if (i == PARTICLE_COUNT - 1)
            return;
    }
    p = &Particles[i];

    p->field0c = type;
    p->field10 = x;
    p->field08 = speed * 1.8f;
    p->field04 = speed * 1.8f;
    p->field14 = y + blood_zoff;
    p->field20 = 0.0f;
    p->field18 = z + blood_yoff;

    if (type == 8) {
        /* smoke */
        SetLifeAndSize(p, speed);
        PI_RandomVelocities(p, 32.0);
        p->vx = (float)((double)p->vx * 0.1);
        p->vy = p->vy * 0.0f;
        p->vz = (float)((double)p->vz * 0.01);
        return;
    }

    if (type == 4 || type == 2 || type == 6) {
        /* blood -- the only type with a Y velocity */
        SetLifeAndSize(p, speed);

        p->vx = (float)((double)(PI_limeRand() & 0x1f) / 31.0 - 0.5);
        p->vx = p->vx * PScale[0];
        p->vy = (float)((double)(PI_limeRand() & 0x1f) / -31.0 * 0.5);
        p->vy = p->vy * PScale[1];
        p->vz = (float)((double)(PI_limeRand() & 0x1f) / 31.0 * 0.5);
        p->vz = p->vz * PScale[2];
        return;
    }

    if (type == 0) {
        /* the sideways spray, and the only user of `arg` */
        PI_RandomVelocities(p, 32.0);

        p->vx = p->vx * blood_xvs + (float)arg * blood_lrscale;
        if (p->vx < 0.0f)
            p->vx = p->vx - blood_minxvel;
        else
            p->vx = p->vx + blood_minxvel;

        p->vx = p->vx * 0.01f;
        p->vy = p->vy * 0.0f;
        p->vz = p->vz * 0.1f;
        return;
    }

    /* everything else */
    PI_RandomVelocities(p, 32.0);
    p->vx = (float)((double)p->vx * 0.2);
    p->vy = p->vy * 0.0f;
    p->vz = (float)((double)p->vz * 0.1);
}
