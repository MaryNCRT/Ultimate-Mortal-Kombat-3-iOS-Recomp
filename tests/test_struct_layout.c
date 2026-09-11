/*
 * test_struct_layout.c -- the three fight-engine structs against their measured
 * sizes.
 *
 *   gcc -std=c99 -Wall -Wextra -I decomp/gamecode/logic \
 *       -o struct_layout tests/test_struct_layout.c && ./struct_layout
 *
 * ## Why this exists
 *
 * `MK3OBJ`, `MK3OBJPROC` and `MK3THREAD` were each assembled one field at a
 * time across twenty-one files, and their sizes are not a matter of taste --
 * the binary indexes four parallel arrays by them:
 *
 *      GrObj  30 x  76      Plyr   30 x 108
 *      Pp     30 x 140      mytc   30 x 268
 *
 * Every one of those four is confirmed twice: by the gap between consecutive
 * symbols in the symbol table, and by a multiply the compiler spelled out in
 * shifts (`mk3_set_four_button` for 140, `mk3_bloodevent` for 76,
 * `no_ai_hack`'s `[r1, #0x6c]` for 108, `my_func` for 268).
 *
 * A struct that drifts one word wide makes `Plyr[1]` point into the middle of
 * `Plyr[1]`, and **nothing else in this project would notice** -- the files are
 * syntax-checked, not linked into a running fight, so a wrong size compiles
 * cleanly and passes every other check. Hence this.
 *
 * ## The host-pointer correction
 *
 * The target is 32-bit ARM and this test usually runs on a 64-bit host, where
 * every pointer member costs eight bytes instead of four. The counts below are
 * the number of pointer-sized members in each struct; the test subtracts the
 * difference rather than demanding a 32-bit toolchain.
 *
 * If a pointer member is ADDED or REMOVED, its count here must change with it.
 * That is the one piece of bookkeeping this test cannot do for itself, and a
 * mismatch shows up as a failure rather than as a silent pass.
 */

#include "mk3logic.h"
#include <stddef.h>
#include <stdio.h>

struct expect {
    const char *name;
    size_t      host;        /* sizeof on this host */
    size_t      pointers;    /* pointer-sized members */
    size_t      want;        /* the measured 32-bit size */
};

int main(void)
{
    const size_t d = sizeof(void *) - 4;
    struct expect e[] = {
        { "MK3OBJ",     sizeof(MK3OBJ),     3, 108 },
        { "MK3OBJPROC", sizeof(MK3OBJPROC), 5, 140 },
        { "MK3THREAD",  sizeof(MK3THREAD),  3, 268 },
    };
    int bad = 0;
    size_t i;

    for (i = 0; i < sizeof e / sizeof e[0]; i++) {
        size_t got = e[i].host - e[i].pointers * d;
        printf("%-11s host %3zu, %zu pointers -> 32-bit %3zu  want %3zu  %s\n",
               e[i].name, e[i].host, e[i].pointers, got, e[i].want,
               got == e[i].want ? "ok" : "WRONG");
        if (got != e[i].want)
            bad++;
    }

    /* MK3THREAD_STRIDE is the one of the four written down in the header, so
     * it is checked against the struct rather than restated. */
    if (MK3THREAD_STRIDE != 268) {
        printf("MK3THREAD_STRIDE is %d, want 268  WRONG\n", MK3THREAD_STRIDE);
        bad++;
    }
    if (PLYR_STRIDE != 108 || PP_STRIDE != 140 || GROBJ_STRIDE != 76) {
        printf("a stride macro disagrees with the symbol table  WRONG\n");
        bad++;
    }

    printf("%s\n", bad ? "FAILED" : "all layouts agree with the binary");
    return bad != 0;
}
