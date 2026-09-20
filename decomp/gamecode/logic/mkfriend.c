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


/* --------------------------------------------------------------------- t_friendship_complete
 *
 * armv7 0x000a5990, 76 bytes.  **Complete.**
 *
 * State 0 only: `death_blow_complete` and `player_normpal` -- the same
 * pair a fatality's own close-out calls -- then installs `t_wait_forever`
 * on the current level. The friendship ends the same way a fatality does:
 * clean up, restore the palette, and park.
 */
void death_blow_complete(MK3OBJ *obj);
void player_normpal(MK3OBJ *obj);
long t_wait_forever(struct MK3THREAD *thread);

long t_friendship_complete(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    death_blow_complete(obj);
    player_normpal(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* --------------------------------------------------------------------- t_hat_proc
 *
 * armv7 0x000a662c, 108 bytes.  **Complete.**
 *
 * State 0 only. Tags the GrObj's own `field2c` (`0x1b39`), repositions
 * (`multi_adjust_xy` at `field1c=0x60`/`field20=0x10`), throws
 * (`field08->field1c = field1c = 0xfffc0000 + 0xe0000 = 0xa0000`,
 * `set_proj_vel`), and installs `t_wait_forever` -- a thrown hat left to
 * fly off and never come back, the same parking convention
 * `t_friendship_complete` uses to end the whole move.
 */
void multi_adjust_xy(MK3OBJ *obj);
void set_proj_vel(MK3OBJ *obj);

long t_hat_proc(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field08->field2c = 0x1b39;

    obj->field1c = 0x60;
    obj->field20 = 0x60 - 0x50;
    multi_adjust_xy(obj);

    obj->field08->field1c = 0xfffc0000;
    obj->field1c           = 0xfffc0000 + 0xe0000;
    set_proj_vel(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* --------------------------------------------------------------------- t_end_friend_proc
 *
 * armv7 0x000a5808, 80 bytes.  **Complete.**
 *
 * The free arms token `0x240` and sleeps `0x80` (128) ticks. `0x240` calls
 * `death_blow_complete` and parks token `0x242` under `0x16462` -- the
 * "park and never wake again" sentinel `mk3.c` documents at length: it is
 * checked against the RETURN VALUE, not read as a duration, so a handler
 * that returns it is finished for good regardless of what it wrote to
 * `fieldfc`.
 */
long t_end_friend_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x240;
        thread->fieldfc = 0x80;
        return 0x80;
    }

    if (slot != 0x240)
        return -3;

    death_blow_complete(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x242;
    thread->fieldfc = 0x16462;
    return 0x16462;
}


/* --------------------------------------------------------------------- t_friend_ender
 *
 * armv7 0x000a58b0, 80 bytes.  **Complete.**
 *
 * `t_end_friend_proc`'s own twin, byte for byte the same shape with
 * different tokens: arms `0x130` and sleeps 128 ticks, then
 * `death_blow_complete` and parks `0x132` under the same `0x16462`
 * termination sentinel.
 */
long t_friend_ender(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x130;
        thread->fieldfc = 0x80;
        return 0x80;
    }

    if (slot != 0x130)
        return -3;

    death_blow_complete(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x132;
    thread->fieldfc = 0x16462;
    return 0x16462;
}


/* --------------------------------------------------------------------- t_pop_up_my_toy
 *
 * armv7 0x000a7174, 124 bytes.  **Complete.**
 *
 * State 0 only. Spawns a `t_popup` thread (`NewThreadProc`, return value
 * used), hands the new object's part `field2c` this object's own
 * `field30`, plays sound `0x92` through `tsound_func`, shakes
 * (`field48=0x60006`), sets `field38 = t_r_scared_of_monkey` -- a
 * reaction handler, not a hit callback -- and `takeover_him`s the
 * opponent with it before installing `t_wait_forever`. The toy pops up
 * and the opponent's own reaction gets hijacked to react to it.
 */
long t_popup(struct MK3THREAD *thread);
void *NewThreadProc(void *owner, MK3THREADFUNC func);
void tsound_func(MK3OBJ *obj, uint32_t arg);
void shake_a11(MK3OBJ *obj);
void takeover_him(MK3OBJ *obj);
long t_r_scared_of_monkey(struct MK3THREAD *thread);

long t_pop_up_my_toy(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3OBJ *toy;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    toy = (MK3OBJ *)NewThreadProc(obj, (MK3THREADFUNC)t_popup);
    toy->field08->field2c = obj->field30;

    tsound_func(obj, 0x92);

    obj->field48 = 0x60006;
    shake_a11(obj);

    obj->field38 = (uint32_t)(uintptr_t)t_r_scared_of_monkey;
    takeover_him(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}
