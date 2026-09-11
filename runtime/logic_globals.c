/*
 * logic_globals.c -- storage for the fight engine's six globals.
 *
 * `decomp/gamecode/logic` reaches all of its state through pointer slots, and
 * every one of those slots holds the address of a __DATA,__common symbol. This
 * file provides that storage for a native build.
 *
 * **Every size here is measured, not chosen.** The gap between consecutive
 * symbols in the binary's own table gives each array's extent, and each one
 * divides exactly by a stride the compiler spelled out in shifts somewhere:
 *
 *      _GrObj         0x0038c698   2280 = 30 x  76
 *      _MKEventQueue  0x0038cf80     84 = 4 + 10 x 8
 *      _Playback      0x0038cfd4     32 = 2 x 16
 *      _Plyr          0x0038cff4   3240 = 30 x 108
 *      _Pp            0x0038dc9c   4200 = 30 x 140
 *      _RoundParam    0x0038ed04     68
 *      _TList         0x0038ed48      4
 *      _TList_Free    0x0038ed4c      4
 *      _mo            0x0038ed5c    480 = 30 x 16
 *      _mytc          0x0038ef3c   8040 = 30 x 268
 *      _H             0x0038c674     36 = 9 x 4
 *      _blood         0x0038ed50      8 = 2 x 4
 *
 * Thirty of everything: a thread, a fighter, a proc, a GrObj and a display
 * record with the same index are one entity seen five ways, and `mk3_init`'s
 * wiring loop links the first four together.
 *
 * ## The structs are 32-bit
 *
 * The arrays are declared as raw bytes rather than as arrays of the structs,
 * for the same reason the decompiled files index them with `n * PLYR_STRIDE`:
 * on a 64-bit host a pointer member is eight bytes and `sizeof(MK3OBJ)` is 120,
 * not 108. `tests/test_struct_layout.c` checks that the structs still describe
 * the target correctly; this file sidesteps the question by allocating bytes.
 *
 * A real port must either build 32-bit or widen the strides deliberately and
 * change them in one place. Allocating bytes here makes that one place obvious.
 */

#include <stdint.h>

#define MK3_SLOTS  30

/* The five parallel arrays. */
char     _mk3_grobj[MK3_SLOTS * 76];
char     _mk3_plyr [MK3_SLOTS * 108];
char     _mk3_pp   [MK3_SLOTS * 140];
char     _mk3_mytc [MK3_SLOTS * 268];
char     _mk3_mo   [MK3_SLOTS * 16];

/* And the singletons. */
char     _mk3_eventqueue[84];
char     _mk3_playback[32];
char     _mk3_roundparam[68];
char     _mk3_h[36];
long     _mk3_blood[2];

/* The names the decompiled files use. `Plyr`, `Pp`, `GrObj`, `mo` and
 * `Playback` are spelled `char *` there because that is how twenty files index
 * them; `mytc` is an array of the struct because mk3.c indexes it as one. */
char *Plyr     = _mk3_plyr;
char *Pp       = _mk3_pp;
char *GrObj    = _mk3_grobj;
char *mo       = _mk3_mo;
char *Playback = _mk3_playback;
char *H        = _mk3_h;

void *MKEventQueue = _mk3_eventqueue;
long *RoundParam   = (long *)(void *)_mk3_roundparam;
long *blood        = _mk3_blood;

void *TList      = 0;
void *TList_Free = 0;
