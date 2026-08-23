/*
 * sound.c — src/gamecode/sound.cpp
 *
 * Eight functions in the original. Verified against the oracle by
 * tests/test_gamecode2_diff.c.
 */

#include <stdint.h>

/* A table of pointers to per-character sound tables. `get_csound` indexes the
 * outer one by four and the inner by eight, so the inner entries are pairs and
 * the field wanted is the second half of each. Neither is named further: one
 * function reading a stride is not a layout. */
typedef struct CSOUNDENTRY {
    uint32_t field00;            /* 0x00 */
    uint32_t field04;            /* 0x04  what get_csound returns */
} CSOUNDENTRY;

extern CSOUNDENTRY *ochar_sound_tables[];    /* 0x0017b278 */

uint32_t get_csound(long index, long character);


/* --------------------------------------------------------------- get_csound
 *
 * armv7 0x000a7ec0, 20 bytes.
 *
 *      lsls r0, r0, #3              ; index * 8
 *      ldr.w r3, [r3, r1, lsl #2]   ; ochar_sound_tables[character]
 *      adds r0, r0, r3
 *      ldr  r0, [r0, #4]            ; entry[index].field04
 *
 * Two levels, two different scales, and the arguments are not interchangeable:
 * the SECOND selects the table and the FIRST indexes into it. Swapping them
 * compiles, runs, and returns a plausible number from the wrong character.
 */
uint32_t get_csound(long index, long character)
{
    return ochar_sound_tables[character][index].field04;
}


extern long triple_sndtab[][2];         /* 0x001790b8, stride 8 */
int printf(const char *fmt, ...);


/* ---------------------------------------------------------------- get_tsound
 *
 * armv7 0x000a8538, 32 bytes.  **Complete.**
 *
 *      printf("Tsound 0x%x %d\n", id, id)
 *      r0 = triple_sndtab[id][1]
 *
 * **The printf is not debug scaffolding left in by accident -- it ships.** It
 * runs on every call, in the retail build, and prints the same value twice.
 * That is worth transcribing rather than dropping: a port that removes it is
 * fine, but a port that removes it WITHOUT noticing has quietly changed how
 * expensive this function is, and it is called from the sound path.
 *
 * The table entry is read at +4, so each row is two words and the first is
 * something this function never looks at.
 */
long get_tsound(long id)
{
    printf("Tsound 0x%x %d\n", (unsigned)id, (int)id);
    return triple_sndtab[id][1];
}


extern long  rsnd_choices[];            /* 0x0017b370, one count per id */
extern long *rsnd_table[];              /* 0x0017b330, one row array per id */


/* ---------------------------------------------------------------- get_rsound
 *
 * armv7 0x000a7ed4, 52 bytes.  **Complete.**
 *
 *      if (seed < 0) seed = -seed      <- `it lt; rsblt`
 *      seed %= rsnd_choices[id]
 *      row = rsnd_table[id]
 *      return row[seed * 2 + 1]
 *
 * A random-sound picker with the randomness supplied by the caller. The
 * negation matters: `__modsi3` on a negative dividend gives a negative
 * remainder in C, which would index backwards, so the sign is taken off first
 * rather than the result being fixed up afterwards.
 *
 * The row stride is 8 and the value read is at +4, the same shape get_tsound
 * uses on `_triple_sndtab`.
 */
long get_rsound(long id, long seed)
{
    if (seed < 0)
        seed = -seed;
    seed %= rsnd_choices[id];
    return rsnd_table[id][seed * 2 + 1];
}


extern long  group_choices[];           /* 0x0017b2e0 */
extern long *group_table[];             /* 0x0017b308 */


/* ---------------------------------------------------------------- get_gsound
 *
 * armv7 0x000a7e84, 48 bytes.  **Complete.**
 *
 *      if (seed < 0) seed = -seed
 *      n   = group_choices[group]
 *      idx = n * variant + (seed % n)
 *      return group_table[group][idx * 2 + 1]
 *
 * The same shape as get_rsound with one more dimension: `variant` selects a
 * BLOCK of `n` sounds and the seed picks within it, so the table is a flat
 * array indexed as if it were two-dimensional. `mla r1, r4, r6, r0` is that
 * whole index in one instruction.
 *
 * The negation before the modulus is the same guard get_rsound has, and for the
 * same reason: a negative remainder would index backwards.
 */
long get_gsound(long group, long variant, long seed)
{
    long n;

    if (seed < 0)
        seed = -seed;
    n = group_choices[group];
    return group_table[group][(n * variant + (seed % n)) * 2 + 1];
}
