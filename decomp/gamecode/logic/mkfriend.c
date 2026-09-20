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


/* --------------------------------------------------------------------- t_mframew_3, _4, _5
 *
 * armv7 0x000a5584/0xa5614/0xa56a0, 144/140/144 bytes.  **Complete.**
 *
 * Three copies of the same shape, differing only in the animation-rate
 * constant they pose (3, 4, 5) and their own dispatch tokens. The free
 * poses `field1c = N` and pushes `t_mframew` under a token; that token's
 * own re-entry is the ordinary tail this whole file's dispatchers share
 * with `mkzap.c`'s: pop a level, or install `t_local_reaction_exit` at
 * the bottom.
 */
long t_local_reaction_exit(struct MK3THREAD *thread);
long t_mframew(struct MK3THREAD *thread);

long t_mframew_3(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        obj->field1c = 3;

        *mk3_frame(thread, thread->frame + 1) = 0x7ca;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x7ca)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;   /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

long t_mframew_4(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0x7d0;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x7d0)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;   /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

long t_mframew_5(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x7d7;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x7d7)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;   /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------------- t_f_kano
 *
 * armv7 0x000a5418, 124 bytes.  **Complete.**
 *
 * Kano's own friendship: no stack frame at all (leaf-shaped, like every
 * other `t_f_*` character entry in this file), so `thread` stays in `r0`
 * throughout rather than being saved. The free points `field40` at the
 * animation stream `a_kano_friend` and pushes `t_mframew_5` under `0x1e0`;
 * `0x1e0` installs `t_friendship_complete` directly.
 */
extern uint8_t a_kano_friend[];             /* 0x001778e8 */

long t_f_kano(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        obj->field40 = (uint32_t)(uintptr_t)a_kano_friend;

        *mk3_frame(thread, thread->frame + 1) = 0x1e0;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew_5;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x1e0)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_friendship_complete);
}


/* --------------------------------------------------------------------- t_f_scorpion
 *
 * armv7 0x000a539c, 124 bytes.  **Complete.**
 *
 * Scorpion's own friendship. The free just pushes `t_jax_n_box_start`
 * under token `0xf1` -- no `field40` setup here, unlike Kano; whatever
 * animation stream this move plays is `t_jax_n_box_start`'s own job to
 * set. `0xf1` tags `field30 = 0x9a0`, points `field40` at
 * `a_skull_in_da_box`, and installs `t_pop_up_my_toy` -- the shared
 * "spawn a toy and hijack the opponent's reaction" routine this
 * friendship reuses rather than duplicates.
 */
extern uint8_t a_skull_in_da_box[];         /* 0x00177834 */
long t_jax_n_box_start(struct MK3THREAD *thread);   /* not yet decompiled */
long t_pop_up_my_toy(MK3THREAD *thread);

long t_f_scorpion(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xf1;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_jax_n_box_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0xf1)
        return -3;

    obj->field30 = 0x9a0;
    obj->field40 = (uint32_t)(uintptr_t)a_skull_in_da_box;

    return mk3_install(thread, (MK3THREADFUNC)t_pop_up_my_toy);
}


/* --------------------------------------------------------------------- t_jax_n_box_start
 *
 * armv7 0x000a6d6c, 112 bytes.  **Complete.**
 *
 * `t_f_scorpion`'s own push target -- Jax's crank-box friendship. The
 * free calls `center_around_me`, points `field40` at the animation
 * stream `a_crank_box`, steps a frame, and waits 16 ticks under `0xea`.
 * `0xea` just poses `field1c=6` and installs `t_mframew` on the current
 * level.
 */
void center_around_me(MK3OBJ *obj);
long do_next_a9_frame(MK3OBJ *obj);
long t_mframew(struct MK3THREAD *thread);
extern uint8_t a_crank_box[];               /* 0x00177864 */

long t_jax_n_box_start(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        center_around_me(obj);
        obj->field40 = (uint32_t)(uintptr_t)a_crank_box;

        do_next_a9_frame(obj);

        *mk3_frame(thread, thread->frame + 1) = 0xea;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (slot != 0xea)
        return -3;

    obj->field1c = 6;

    return mk3_install(thread, (MK3THREADFUNC)t_mframew);
}


/* --------------------------------------------------------------------- t_swat_friend_proc
 *
 * armv7 0x000a57b4, 84 bytes.  **Complete.**
 *
 * The same `t_end_friend_proc` shape: arms `0x34f` and sleeps `0xa0`
 * (160) ticks, then `death_blow_complete` and parks `0x351` under the
 * `0x16462` termination sentinel.
 */
long t_swat_friend_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x34f;
        thread->fieldfc = 0xa0;
        return 0xa0;
    }

    if (slot != 0x34f)
        return -3;

    death_blow_complete(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x351;
    thread->fieldfc = 0x16462;
    return 0x16462;
}


/* --------------------------------------------------------------------- t_f_null_friendship
 *
 * armv7 0x000a5858, 88 bytes.  **Complete.**
 *
 * The character with no real friendship animation: arms `0x155` and
 * sleeps `0x80` (128) ticks, then `death_blow_complete` and installs
 * `t_friendship_complete` directly -- no wait state of its own, since
 * there was never anything to animate.
 */
long t_f_null_friendship(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x155;
        thread->fieldfc = 0x80;
        return 0x80;
    }

    if (slot != 0x155)
        return -3;

    death_blow_complete(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_friendship_complete);
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


/* --------------------------------------------------------------------- t_do_friendship
 *
 * armv7 0x000a5730, 132 bytes.  **Complete.**
 *
 * The dispatcher every `t_f_*` character entry in this file is reached
 * from: the free pushes `t_friendship_start_pause` under `0x805`; `0x805`
 * calls `init_special`, reads the fighter's own character id
 * (`field08->field24`), looks it up in `ochar_friendships` -- a
 * four-byte-stride table of function pointers, one per character -- and
 * installs whatever it finds. `obj->field1c` gets the same handler value
 * too, alongside the install; nothing downstream reads `field1c` for it,
 * so it looks like the field this file's other routines pack a table
 * pointer into (`field40`) done here with the wrong offset, or a leftover
 * from an earlier draft of the lookup. Transcribed as found.
 */
void init_special(MK3OBJ *obj);
long t_friendship_start_pause(struct MK3THREAD *thread);
extern MK3THREADFUNC ochar_friendships[];   /* 0x00177f24 */

long t_do_friendship(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x805;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_friendship_start_pause;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x805)
        return -3;

    init_special(obj);

    {
        MK3THREADFUNC handler = ochar_friendships[obj->field08->field24];
        obj->field1c = (uint32_t)(uintptr_t)handler;
        return mk3_install(thread, handler);
    }
}


/* --------------------------------------------------------------------- t_f_reptile
 *
 * armv7 0x000a70ec, 136 bytes.  **Complete.**
 *
 * The free clears invisibility and pushes `t_jax_n_box_start` under
 * `0xfa` -- Reptile's friendship reuses Jax's crank-box thread outright,
 * the same way `t_f_scorpion` does. `0xfa` tags `field30=0x1433`, points
 * `field40` at `a_snake_in_da_box`, and installs `t_pop_up_my_toy`.
 */
void clear_inviso(MK3OBJ *obj);
extern uint8_t a_snake_in_da_box[];         /* 0x001778a4 */

long t_f_reptile(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        clear_inviso(obj);

        *mk3_frame(thread, thread->frame + 1) = 0xfa;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_jax_n_box_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0xfa)
        return -3;

    obj->field30 = 0x1433;
    obj->field40 = (uint32_t)(uintptr_t)a_snake_in_da_box;

    return mk3_install(thread, (MK3THREADFUNC)t_pop_up_my_toy);
}


/* --------------------------------------------------------------------- t_f_kabal
 *
 * armv7 0x000a5b04, 140 bytes.  **Complete.**
 *
 * The free spawns a SEPARATE `t_end_friend_proc` thread (`NewThread`,
 * return value discarded -- unlike `t_pop_up_my_toy`'s own spawn, this
 * one isn't kept), points `field40` at `a_tusk_friend`, and pushes
 * `t_mframew_5` under `0x4f2`, whose own re-entry installs
 * `t_friendship_complete` directly.
 */
MK3THREAD *NewThread(void *owner, MK3THREADFUNC func);
extern uint8_t a_tusk_friend[];             /* 0x00177d2c */

long t_f_kabal(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        NewThread(obj, (MK3THREADFUNC)t_end_friend_proc);
        obj->field40 = (uint32_t)(uintptr_t)a_tusk_friend;

        *mk3_frame(thread, thread->frame + 1) = 0x4f2;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew_5;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x4f2)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_friendship_complete);
}


/* --------------------------------------------------------------------- t_f_cyrax
 *
 * armv7 0x000a5b90, 140 bytes.  **Complete.**
 *
 * `t_f_kabal`'s own twin, the same shape with different constants:
 * spawns a separate `t_end_friend_proc` thread, points `field40` at
 * `a_robo2_friend`, and pushes `t_mframew_5` under `0x427`, whose
 * re-entry also installs `t_friendship_complete` directly.
 */
extern uint8_t a_robo2_friend[];            /* 0x00177ca0 */

long t_f_cyrax(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        NewThread(obj, (MK3THREADFUNC)t_end_friend_proc);
        obj->field40 = (uint32_t)(uintptr_t)a_robo2_friend;

        *mk3_frame(thread, thread->frame + 1) = 0x427;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew_5;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x427)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_friendship_complete);
}


/* --------------------------------------------------------------------- t_f_sz
 *
 * armv7 0x000a5e78, 132 bytes.  **Complete.**
 *
 * The free poses `field1c=0`, points `field40` at `a_sz_friend`, plays
 * `ochar_sound`, and pushes `t_mframew_5` under `0x2d3`, whose re-entry
 * installs `t_friendship_complete` directly.
 */
extern uint8_t a_sz_friend[];                /* 0x00177a7c */

long t_f_sz(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        obj->field1c = 0;
        obj->field40 = (uint32_t)(uintptr_t)a_sz_friend;
        ochar_sound(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x2d3;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew_5;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x2d3)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_friendship_complete);
}


/* --------------------------------------------------------------------- t_football_proc
 *
 * armv7 0x000a68f8, 132 bytes.  **Complete.**
 *
 * The free reads the GrObj's own flip bit (`field08->field28 & 0x10`,
 * saved whole into `field2c`) and throws `0xa0000`, or `0xfff60000` when
 * flipped, into `field08->field18`; either way `field1c`/`field08->field1c`
 * both then get the same `0xfff60000`, `field40` points at `a_football`,
 * and `find_part2`/`init_anirate` (`field1c=2`) run before a one-tick
 * wait under `0x3b5`. `0x3b5` is a bare `next_anirate` self-loop -- no
 * further field setup, just keep animating while the kick plays out.
 */
extern uint8_t a_football[];                /* 0x00177ba4 */
void find_part2(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
long next_anirate(MK3OBJ *obj);

long t_football_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        obj->field1c = 0xa0000;

        obj->field2c = obj->field08->field28;
        if (obj->field2c & 0x10)
            obj->field1c = 0xfff60000;

        obj->field08->field18 = obj->field1c;

        obj->field1c           = 0xfff60000;
        obj->field08->field1c  = 0xfff60000;
        obj->field40            = (uint32_t)(uintptr_t)a_football;
        find_part2(obj);

        obj->field1c = 2;
        init_anirate(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x3b5;
        thread->fieldfc = 1;
        return 1;
    }

    if (slot != 0x3b5)
        return -3;

    next_anirate(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x3b5;
    thread->fieldfc = 1;
    return 1;
}


/* --------------------------------------------------------------------- t_f_jax
 *
 * armv7 0x000a6734, 152 bytes.  **Complete.**
 *
 * The free spawns a separate `t_end_friend_proc` thread, points
 * `field40` at `a_jax_friend`, steps a frame, and waits 32 ticks under
 * `0x23a`. `0x23a` pushes `t_mframew_3` under `0x23b`, whose re-entry
 * installs `t_friendship_complete` directly.
 */
extern uint8_t a_jax_friend[];               /* 0x00177a0c */
long t_mframew_3(struct MK3THREAD *thread);

long t_f_jax(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        NewThread(obj, (MK3THREADFUNC)t_end_friend_proc);
        obj->field40 = (uint32_t)(uintptr_t)a_jax_friend;

        do_next_a9_frame(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x23a;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (slot == 0x23a) {
        *mk3_frame(thread, thread->frame + 1) = 0x23b;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew_3;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x23b)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_friendship_complete);
}


/* --------------------------------------------------------------------- t_f_sektor
 *
 * armv7 0x000a6698, 156 bytes.  **Complete.**
 *
 * The same shape as `t_f_jax`: the free spawns a separate `t_dinger_proc`
 * thread, points `field40` at `a_robo1_friend`, steps a frame, and waits
 * 80 ticks under `0x410`. `0x410` pushes `t_mframew_5` under `0x411`,
 * whose re-entry installs `t_friendship_complete` directly.
 */
extern uint8_t a_robo1_friend[];             /* 0x00177c88 */
long t_dinger_proc(struct MK3THREAD *thread);   /* not yet decompiled */

long t_f_sektor(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        NewThread(obj, (MK3THREADFUNC)t_dinger_proc);
        obj->field40 = (uint32_t)(uintptr_t)a_robo1_friend;

        do_next_a9_frame(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x410;
        thread->fieldfc = 0x50;
        return 0x50;
    }

    if (slot == 0x410) {
        *mk3_frame(thread, thread->frame + 1) = 0x411;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew_5;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0x411)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_friendship_complete);
}


/* --------------------------------------------------------------------- t_lao_dog_sounds
 *
 * armv7 0x000a65b0, 124 bytes.  **Complete.**
 *
 * The free just arms `0x446` and sleeps 8 ticks. `0x446` seeds `a10 = 5`
 * and falls into the SAME "play, re-arm" body `0x44b`'s own "still
 * counting" path reaches -- one physical block taken two ways: play
 * sound `0x8a` (`tsound_func`) and wait 16 ticks under `0x44b` again.
 * `0x44b` counts `a10` down each visit; once it hits zero it stops
 * making noise and parks `0x44f` under the `0x16462` termination
 * sentinel instead.
 */
void tsound_func(MK3OBJ *obj, uint32_t arg);

long t_lao_dog_sounds(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0x446) {
        obj->a10 = 5;
        goto bark;
    }

    if (slot == 0x44b) {
        obj->a10 = obj->a10 - 1;
        if (obj->a10 == 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x44f;
            thread->fieldfc = 0x16462;
            return 0x16462;
        }

    bark:
        tsound_func(obj, 0x8a);

        *mk3_frame(thread, thread->frame + 1) = 0x44b;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (slot != 0)
        return -3;

    *mk3_frame(thread, thread->frame + 1) = 0x446;
    thread->fieldfc = 8;
    return 8;
}


/* --------------------------------------------------------------------- t_f_indian
 *
 * armv7 0x000a5f14, 180 bytes.  **Complete.**
 *
 * The free points `field40` at `a_ind_friend`, poses (`field20=0xc`,
 * `field1c=4`), plays `other_ochar_sound` (the part-voiced sound this
 * file's own helper wraps), and pushes `t_mframew_5` under `0x280`.
 * `0x280` just re-arms `0x281` and sleeps 32 ticks -- no field setup of
 * its own. `0x281` spawns a SEPARATE `t_arcade` thread (`NewThread`,
 * return value discarded) and installs `t_wait_forever`: the friendship
 * hands off to `t_arcade` entirely and parks.
 */
void other_ochar_sound(MK3OBJ *obj);
long t_arcade(struct MK3THREAD *thread);   /* not yet decompiled */
extern uint8_t a_ind_friend[];              /* 0x00177a44 */

long t_f_indian(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0x280) {
        *mk3_frame(thread, thread->frame + 1) = 0x281;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (slot == 0x281) {
        NewThread(obj, (MK3THREADFUNC)t_arcade);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (slot != 0)
        return -3;

    obj->field40 = (uint32_t)(uintptr_t)a_ind_friend;

    obj->field20 = 0xc;
    obj->field1c = 0xc - 8;
    other_ochar_sound(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x280;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_mframew_5;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_f_sonya
 *
 * armv7 0x000a5c1c, 152 bytes.  **Complete.**
 *
 * The free seeds `a10 = 1` and spawns `t_sonya_flower_proc` in a genuine
 * loop counting `a10` down -- one iteration as written, since it starts
 * at 1, but a real loop and not an unrolled call -- then waits 48 ticks
 * under `0x21c`. `0x21c` finishes the same way `t_friendship_complete`
 * does (`death_blow_complete`, `player_normpal`) but pushes
 * `t_victory_animation` instead of installing `t_wait_forever` directly;
 * nothing here handles a resume under the token that push plants
 * (`0x220`), so `t_victory_animation` is expected to end the thread on
 * its own rather than ever pop back.
 */
long t_victory_animation(struct MK3THREAD *thread);
long t_sonya_flower_proc(struct MK3THREAD *thread);   /* not yet decompiled */

long t_f_sonya(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0) {
        obj->a10 = 1;

        do {
            NewThread(obj, (MK3THREADFUNC)t_sonya_flower_proc);
            obj->a10 = obj->a10 - 1;
        } while ((int32_t)obj->a10 > 0);

        *mk3_frame(thread, thread->frame + 1) = 0x21c;
        thread->fieldfc = 0x30;
        return 0x30;
    }

    if (slot != 0x21c)
        return -3;

    death_blow_complete(obj);
    player_normpal(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x220;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_victory_animation;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_popup
 *
 * armv7 0x000a5900, 144 bytes.  **Complete.**
 *
 * `t_pop_up_my_toy`'s own `NewThreadProc` target -- the popup object's
 * own thread, separate from the fighter's. The free poses `field1c=4`
 * and pushes `t_mframew` under `0xbe`; `0xbe` waits 48 ticks under
 * `0xbf`; `0xbf` calls `death_blow_complete` and installs
 * `t_wait_forever`.
 */
long t_popup(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0xbe) {
        *mk3_frame(thread, thread->frame + 1) = 0xbf;
        thread->fieldfc = 0x30;
        return 0x30;
    }

    if (slot == 0xbf) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (slot != 0)
        return -3;

    obj->field1c = 4;

    *mk3_frame(thread, thread->frame + 1) = 0xbe;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}
