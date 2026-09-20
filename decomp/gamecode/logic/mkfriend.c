/*
 * mkfriend.c -- gamecode/logic/mkfriend.c, decompiled.
 *
 * The Friendships: each character's own non-lethal finishing move, plus the
 * shared machinery that drives one to completion (the pause, the popup, the
 * closing fade) and hands control back to the ordinary post-round flow.
 *
 * Every function here is read one at a time from `tools/dumpfn.py`'s
 * disassembly, verified against `TOOLS/armrecomp/recomp.py`'s recompiled
 * oracle through `tools/landfn.sh`, and not counted as landed until that
 * passes.
 */

#include "mk3logic.h"

void ochar_sound(MK3OBJ *obj);


/* --------------------------------------------------------------------- camp_fire_sound
 *
 * armv7 0x000a5d8c, 16 bytes.  **Complete.**
 *
 * A one-line wrapper: sound index 10, played through `ochar_sound`. Small
 * enough that the name is the whole specification.
 */
void camp_fire_sound(MK3OBJ *obj)
{
    obj->field1c = 0xa;
    ochar_sound(obj);
}


/* --------------------------------------------------------------------- other_ochar_sound
 *
 * armv7 0x000a5efc, 24 bytes.  **Complete.**
 *
 * `ochar_sound` reads its sound index off `obj`, not off the part -- so to
 * play a sound as though it came from the PART instead, this swaps
 * `field08->field24` for `obj->field20`, calls it, and puts the part's own
 * value back. A callee-saved swap around one call, the same shape
 * `t_kissani`/`create_fx_for_him` use for a different field pair.
 */
void other_ochar_sound(MK3OBJ *obj)
{
    uint32_t saved = obj->field08->field24;

    obj->field08->field24 = obj->field20;
    ochar_sound(obj);
    obj->field08->field24 = saved;
}
