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
