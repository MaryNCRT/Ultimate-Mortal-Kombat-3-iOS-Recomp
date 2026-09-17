/*
 * joy.c -- gamecode/logic/joy.c, decompiled.
 *
 * Part of the fight engine. *
 * This first pass was read by two programs rather than by eye, because most of
 * what is here is one function written many times.
 *
 * `tools/pushfn.py` executes a body symbolically -- every register tracked as
 * a constant, a pc-relative address, a load or nothing at all -- and accepts
 * it only when it accounted for EVERY instruction and the effects come out as
 * the frame-push shape: some stores into the object, then the handler and the
 * cleared slot above. One instruction it cannot model and the function is
 * refused rather than guessed at.
 *
 * `tools/microfn.py` matches whole bodies against fixed templates for the
 * smaller shapes -- a tail call, a constant into 0x5c, a table handed to a
 * search routine -- and refuses anything with an instruction out of place.
 *
 * Both refuse loudly. What they could not prove is not in this file; it is
 * read one function at a time.
 */

#include "mk3logic.h"

long t_joyd3(struct MK3THREAD *thread);

/* t_joy_getup_entry -- armv7 0x0002edfc, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_joyd3
 *      frame[frame+1].w0 = 0
 */

long t_joy_getup_entry(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_joyd3);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */






/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_act_mframew(struct MK3THREAD *thread);
long t_jdblk2(struct MK3THREAD *thread);
long t_jhp5(struct MK3THREAD *thread);
long t_jmp5(struct MK3THREAD *thread);
long t_unhip1(struct MK3THREAD *thread);
void find_ani_part2(MK3OBJ *obj);
void find_part2(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);

/* t_joy_duck_block -- armv7 0x0002f220, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      disable_all_buttons(obj)
 *      frame[frame].handler = t_jdblk2
 *      frame[frame+1].w0 = 0
 */

long t_joy_duck_block(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    disable_all_buttons(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_jdblk2);
}

/* t_joy_un_lo_punch1 -- armv7 0x0002f4a0, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0xf
 *      find_ani_part2(obj)
 *      frame[frame].handler = t_unhip1
 *      frame[frame+1].w0 = 0
 */

long t_joy_un_lo_punch1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0xf;
    find_ani_part2(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_unhip1);
}

/* t_joy_un_hi_punch1 -- armv7 0x0002f4e4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0xe
 *      find_ani_part2(obj)
 *      frame[frame].handler = t_unhip1
 *      frame[frame+1].w0 = 0
 */

long t_joy_un_hi_punch1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0xe;
    find_ani_part2(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_unhip1);
}

/* t_joy_punch_htm1 -- armv7 0x0002f590, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0xe
 *      find_ani_part2(obj)
 *      find_part2(obj)
 *      find_part2(obj)
 *      find_part2(obj)
 *      find_part2(obj)
 *      frame[frame].handler = t_jmp5
 *      frame[frame+1].w0 = 0
 */

long t_joy_punch_htm1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0xe;
    find_ani_part2(obj);
    find_part2(obj);
    find_part2(obj);
    find_part2(obj);
    find_part2(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_jmp5);
}

/* t_joy_punch_mth1 -- armv7 0x0002f658, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0xf
 *      find_ani_part2(obj)
 *      find_part2(obj)
 *      find_part2(obj)
 *      find_part2(obj)
 *      find_part2(obj)
 *      frame[frame].handler = t_jhp5
 *      frame[frame+1].w0 = 0
 */

long t_joy_punch_mth1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0xf;
    find_ani_part2(obj);
    find_part2(obj);
    find_part2(obj);
    find_part2(obj);
    find_part2(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_jhp5);
}

/* t_joy_un_lo_punch2 -- armv7 0x0002f6b8, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0xf
 *      find_ani_part2(obj)
 *      find_part2(obj)
 *      frame[frame].handler = t_unhip1
 *      frame[frame+1].w0 = 0
 */

long t_joy_un_lo_punch2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0xf;
    find_ani_part2(obj);
    find_part2(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_unhip1);
}

/* t_joy_un_hi_punch2 -- armv7 0x0002f78c, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0xe
 *      find_ani_part2(obj)
 *      find_part2(obj)
 *      frame[frame].handler = t_unhip1
 *      frame[frame+1].w0 = 0
 */

long t_joy_un_hi_punch2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0xe;
    find_ani_part2(obj);
    find_part2(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_unhip1);
}

/* t_do_duck_block -- armv7 0x00030550, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      stop_me_player(obj)
 *      face_opponent(obj)
 *      obj->field40 = 0x6
 *      get_char_ani(obj)
 *      obj->field1c = 0x3
 *      obj->field20 = 0x701
 *      frame[frame].handler = t_act_mframew
 *      frame[frame+1].w0 = 0
 */

long t_do_duck_block(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    stop_me_player(obj);
    face_opponent(obj);
    obj->field40 = 0x6;
    get_char_ani(obj);
    obj->field1c = 0x3;
    obj->field20 = 0x701;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_act_mframew);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

/* --------------------------------------------------------------------
 * Straight-line leaves, read by tools/leaffn.py: stores, calls and
 * a return, with every instruction accounted for. It refuses
 * anything that branches, any return value it cannot prove, and any
 * value read from a field the function also writes -- that is a
 * saved value being put back, not a re-read.
 * -------------------------------------------------------------------- */

void group_sound(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
void towards_x_vel(MK3OBJ *obj);

/* run_setup -- armv7 0x00030fbc, 48 bytes.  **Complete.**
 *
 *      obj->field40 = 0x46
 *      get_char_ani(obj)
 *      obj->field1c = 0x3
 *      init_anirate(obj)
 *      obj->field1c = 0x80000
 *      towards_x_vel(obj)
 *      obj->field1c = 0x7
 *      group_sound(obj)
 */
void run_setup(MK3OBJ *obj)
{
    obj->field40 = 0x46;
    get_char_ani(obj);
    obj->field1c = 0x3;
    init_anirate(obj);
    obj->field1c = 0x80000;
    towards_x_vel(obj);
    obj->field1c = 0x7;
    group_sound(obj);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_do_body_slam(MK3THREAD *thread);
long t_joy_duck_block_loop(MK3THREAD *thread);
long t_local_reaction_exit(MK3THREAD *thread);
long t_stat_do_sweep_kick(MK3THREAD *thread);

/* t_joy_sweep_kick -- armv7 0x0002f1b4, 108 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x22e, then descend into t_stat_do_sweep_kick
 *      token == 0x22e:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_joy_sweep_kick(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x22e;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_stat_do_sweep_kick;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x22e)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_jdblk2 -- armv7 0x0002f260, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x253, then descend into t_do_duck_block
 *      token == 0x253:
 *          frame[frame].handler = t_joy_duck_block_loop
 *      otherwise:  return -3
 */
long t_jdblk2(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x253;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_duck_block;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x253)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_joy_duck_block_loop);
}

/* t_joy_toss -- armv7 0x0002f410, 108 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x7b7, then descend into t_do_body_slam
 *      token == 0x7b7:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_joy_toss(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x7b7;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_body_slam;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x7b7)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_do_duck(MK3THREAD *thread);
long t_do_flip_kick(MK3THREAD *thread);
long t_do_jumpup_punch(MK3THREAD *thread);
long t_stat_do_uppercut(MK3THREAD *thread);

/* t_joy_down -- armv7 0x0002ed80, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          disable_all_buttons(obj)
 *          token := 0x159, then descend into t_do_duck
 *      token == 0x159:
 *          frame[frame].handler = t_joy_getup_entry
 *      otherwise:  return -3
 */
long t_joy_down(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        disable_all_buttons(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x159;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_duck;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x159)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_joy_getup_entry);
}

/* t_joy_flip_kick -- armv7 0x0002ef60, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          disable_all_buttons(obj)
 *          token := 0x1c9, then descend into t_do_flip_kick
 *      token == 0x1c9:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_joy_flip_kick(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        disable_all_buttons(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x1c9;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_flip_kick;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1c9)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_jumpup_punch -- armv7 0x0002f054, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          disable_all_buttons(obj)
 *          token := 0x1db, then descend into t_do_jumpup_punch
 *      token == 0x1db:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_jumpup_punch(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        disable_all_buttons(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x1db;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_jumpup_punch;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1db)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_joy_uppercut -- armv7 0x0002f2c8, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          disable_all_buttons(obj)
 *          token := 0x2a1, then descend into t_stat_do_uppercut
 *      token == 0x2a1:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_joy_uppercut(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        disable_all_buttons(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x2a1;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_stat_do_uppercut;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x2a1)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_do_backup(MK3THREAD *thread);
long t_mframew(MK3THREAD *thread);

/* t_unhip1 -- armv7 0x0002f704, 136 bytes.  **Complete.**
 *
 *      token == 0:
 *          find_part2(obj)
 *          find_part2(obj)
 *          obj->field1c = 0x2
 *          token := 0x7ac, then descend into t_mframew
 *      token == 0x7ac:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_unhip1(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        find_part2(obj);
        find_part2(obj);
        obj->field1c = 0x2;
        *mk3_frame(thread, thread->frame + 1) = 0x7ac;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x7ac)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_joy_back_up -- armv7 0x000305b0, 132 bytes.  **Complete.**
 *
 *      token == 0:
 *          disable_all_buttons(obj)
 *          face_opponent(obj)
 *          token := 0x179, then descend into t_do_backup
 *      token == 0x179:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_joy_back_up(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        disable_all_buttons(obj);
        face_opponent(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x179;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_backup;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x179)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ========================================================================
 * THE INPUT CONTRACT
 *
 * Everything a keyboard or a gamepad has to produce, and every bit of it is
 * measured rather than assumed. Three independent readings agree.
 *
 * ## One ten-bit word per player
 *
 * `mk3_update` takes `long joy[2]` and hands it to `TranslateJoybits`:
 *
 *      bit 0..3   the four directions
 *      bit 4      HP        high punch
 *      bit 5      LP        low punch
 *      bit 6      BL        block
 *      bit 7      HK        high kick
 *      bit 8      LK        low kick
 *      bit 9      RUN
 *      bit 10     a SPECIAL-MOVE REQUEST, not a button -- leave it clear
 *
 * ## How the six buttons were named
 *
 * Not guessed. Three measurements, and the last two pin the whole row:
 *
 *   1. **`bt_stance` names the moves in order.** It is a table of six words
 *      and its entries are `t_joy_hi_punch`, `t_joy_lo_punch`, `t_joy_block`,
 *      `t_joy_hi_kick`, `t_joy_lo_kick`, and nothing. So the table index runs
 *      HP, LP, BL, HK, LK, RUN.
 *
 *   2. **`check_block_bit` measures BLOCK**: it masks the translated word with
 *      0x20 for player 0 and 0x2000 for player 1. `TranslateJoybits` puts
 *      input bit 6 at exactly those two positions. **So BL is input bit 6, and
 *      it is table index 2.**
 *
 *   3. **`is_run_pressed` measures RUN**: 0x40000 and 0x400000, which
 *      `TranslateJoybits` fills from input bit 9. **So RUN is input bit 9, and
 *      it is table index 5.**
 *
 * Index 2 is input bit 6 and index 5 is input bit 9, so **index = input bit
 * minus four**, and the other four fall out: HP 4, LP 5, HK 7, LK 8. Two
 * independent constraints, both satisfied, no freedom left.
 *
 * ## Where the bits end up
 *
 * `TranslateJoybits` spreads them, and the layout looks arbitrary until the
 * names are on it:
 *
 *      HP  -> bit  4 (P1) / bit 12 (P2)      LP  -> bit 16 / bit 20
 *      BL  -> bit  5      / bit 13           LK  -> bit 17 / bit 21
 *      HK  -> bit  6      / bit 14           RUN -> bit 18 / bit 22
 *
 * The low trio is **HP, BL, HK** and the high trio is **LP, LK, RUN** -- the
 * high attacks with block, against the low attacks with run. That grouping is
 * why `buttons_in_a2` in moves.c can mask a player's whole button set with one
 * constant: 0x00070070 for player 0, 0x00707000 for player 1.
 *
 * ## The directions
 *
 * `joystick_in_a0_px` in other.c reads `G[player]` -- the per-player word
 * `mk3_update` stores at `G + 0x00` and `G + 0x04` -- and masks it with 0xf.
 * So **the four direction bits survive translation unmoved, at bits 0..3**,
 * and they are read from a different place than the buttons.
 *
 * **Bits 2 and 3 are the horizontal pair; bits 0 and 1 are the vertical one.**
 * Established by `Playback_Update` in playback.c: replaying a recorded motion
 * for a fighter facing the other way exchanges exactly bits 2 and 3 and
 * touches nothing else, and mirroring a motion swaps left and right while
 * leaving up and down alone.
 *
 * **Which of 2 and 3 is LEFT is still open**, and so is which of 0 and 1 is
 * UP -- swapping a pair is symmetric and says nothing about polarity. The
 * pairing is settled; the polarity is not, and is not guessed here.
 *
 * `mask_joystick` below shows they are then filtered by `proc->field34`, so a
 * state can forbid individual directions.
 *
 * ## What this means for the port
 *
 * There is no touch input anywhere in the fight engine and there never was.
 * The iOS build's touch layer sits above `UpdateArcadeCode`, filling `joy[2]`.
 * **Replacing it with a keyboard or a gamepad is a matter of filling two
 * ten-bit words**, and nothing below that line needs to change.
 * ======================================================================== */


/* ----------------------------------------------------------- stuff_buttons
 *
 * armv7 0x0002ec50, FOUR bytes.  **Complete.**
 *
 *      obj->field60 = table
 *
 * One store and a return, and it is the smallest function in the directory.
 *
 * **It also proves MK3OBJ reaches 0x60.** The struct as this project had it
 * ended at 0x5c; `Plyr`'s stride is 108, so there was room and nothing known to
 * be in it. 0x60 is the first field found in that space, and it is **the
 * fighter's current button table.**
 */
void stuff_buttons(MK3OBJ *obj, uint32_t table)
{
    obj->field60 = table;
}


/* ============================ enable_all_buttons, disable_all_buttons,
 *                              disable_his_buttons
 *
 * armv7 0x0002ec54, 0x0002ec68 and 0x0002ec7c; 20, 20 and 24 bytes.
 * **Complete.**
 *
 *      enable_all_buttons(obj)   stuff_buttons(obj,                  bt_stance)
 *      disable_all_buttons(obj)  stuff_buttons(obj,                  bt_null)
 *      disable_his_buttons(obj)  stuff_buttons(obj->field00->field00, bt_null)
 *
 * **"Enable all buttons" means "go back to the standing table".** Not a flag,
 * not a mask -- the standing move set IS the enabled state, and `bt_null` is a
 * table of ten zeroes that answers every button with nothing.
 *
 * So disabling input costs one pointer store and no branches anywhere else, and
 * a state that wants to take control away from the player just parks `bt_null`
 * in 0x60 until it is done. That is the whole mechanism.
 *
 * `disable_his_buttons` reaches the opponent through `obj->field00->field00`,
 * the two-hop that mk3logic.h documents as "him".
 */
extern const void *bt_null;        /* 0x00165584 */
extern const void *bt_angle_jump;  /* 0x001655ac */
extern const void *bt_duck;        /* 0x001655d4 */
extern const void *bt_stance;      /* 0x001655fc */
extern const void *bt_jump;        /* 0x00165624 */

void enable_all_buttons(MK3OBJ *obj)
{
    stuff_buttons(obj, (uint32_t)(uintptr_t)&bt_stance);
}

void disable_all_buttons(MK3OBJ *obj)
{
    stuff_buttons(obj, (uint32_t)(uintptr_t)&bt_null);
}

void disable_his_buttons(MK3OBJ *obj)
{
    stuff_buttons(obj->field00->field00, (uint32_t)(uintptr_t)&bt_null);
}


/* ------------------------------------------------- me_in_front, me_in_back
 *
 * armv7 0x0002ec24 and 0x0002ec38; 20 and 24 bytes.  **Complete.**
 *
 *      me_in_front(obj)   G[0x474] =  obj->field00->field08
 *      me_in_back(obj)    G[0x474] =  obj->field00->field08 ^ 1
 *
 * `G + 0x474` is what `mk3_who_in_front` returns and `RenderLevelPlayers`
 * reads, and `mk3_init` seeds it from one random bit. **So it holds a PLAYER
 * INDEX, 0 or 1, and these two are how a fighter claims or yields the front of
 * the draw order.**
 *
 * `field08` on the proc is the side index -- the same field `buttons_in_a2`
 * uses to choose a button mask and `mk3_update` uses to set a display flag --
 * so "me" is spelled as "my side" and "him" as that XOR 1.
 *
 * Two functions, one XOR apart. The pair shape this directory is full of.
 */
void me_in_front(MK3OBJ *obj)
{
    *(uint32_t *)(void *)(G_BYTES + 0x474) = obj->field00->field08;
}

void me_in_back(MK3OBJ *obj)
{
    *(uint32_t *)(void *)(G_BYTES + 0x474) = obj->field00->field08 ^ 1u;
}


/* ----------------------------------------------------------- inc_downcount
 *
 * armv7 0x0002ec94, 20 bytes.  **Complete.**
 *
 *      obj->field00->field14 += 1
 *      obj->field1c = obj->field00->field14
 *
 * A counter on the proc, bumped and then copied back into the object's
 * scratch word so the caller can read it without a second load. **The proc is
 * re-loaded between the two** (`ldr r2, [r0]` after the store), which is the
 * compiler refusing to keep a pointer live across a store through it -- not a
 * hint that anything changed.
 */
void inc_downcount(MK3OBJ *obj)
{
    obj->field00->field14 += 1;
    obj->field1c = obj->field00->field14;
}


/* ---------------------------------------------------------- check_block_bit
 *
 * armv7 0x0002eca8, 44 bytes.  **Complete.**
 *
 *      obj->field1c = G[0x1c]
 *      mask = obj->field00->field08 ? 0x2000 : 0x20
 *      obj->field1c = G[0x1c] & mask
 *      obj->field5c = (obj->field1c != 0)
 *
 * **One of the two measurements that name the buttons.** 0x20 and 0x2000 are
 * where `TranslateJoybits` puts input bit 6 for player 0 and player 1, so
 * **block is input bit 6** -- see the input contract above.
 *
 * The answer lands in `obj->field5c`, which mk3logic.h already calls "am_i_joy's
 * isolated bit": **0x5c is this file's boolean return slot**, and three
 * functions here write it.
 *
 * `field1c` is written twice, first with the whole word and then with the
 * masked one. A spill, not two meanings.
 */
void check_block_bit(MK3OBJ *obj)
{
    uint32_t now  = *(const uint32_t *)(const void *)(G_BYTES + 0x1c);
    uint32_t mask = obj->field00->field08 ? 0x2000u : 0x20u;

    obj->field1c = now;
    obj->field1c = now & mask;
    obj->field5c = (obj->field1c != 0);
}


/* ------------------------------------------------------------ mask_joystick
 *
 * armv7 0x000304b8, 24 bytes.  **Complete.**
 *
 *      joystick_in_a0(obj)                  ; fills obj->field1c with G[player] & 0xf
 *      obj->field20  = obj->field00->field34
 *      obj->field1c &= obj->field20
 *
 * **`proc->field34` is a per-state direction filter.** The four direction bits
 * arrive from `joystick_in_a0` and are ANDed with whatever the proc has parked
 * at 0x34, so a state that must not accept "back" clears that bit once and
 * every read after it is already filtered.
 *
 * A port that reads the raw stick and forgets this mask will let a fighter walk
 * out of animations it is not supposed to be able to leave.
 */
long joystick_in_a0(MK3OBJ *obj);

void mask_joystick(MK3OBJ *obj)
{
    joystick_in_a0(obj);
    obj->field20  = obj->field00->field34;
    obj->field1c &= obj->field20;
}


/* ------------------------------------------------------ get_x_dist, get_y_dist
 *
 * armv7 0x0002f3a0 and 0x0002f3c0; 32 and 36 bytes.  **Complete.**
 *
 *      get_x_dist(obj)   obj->field2c = (int16_t)obj->field08->0x0e
 *                        obj->field28 = |proc->him->0x0e - obj->field2c|
 *
 *      get_y_dist(obj)   obj->field2c = (int16_t)obj->field08->0x12
 *                        obj->a10     = proc->him
 *                        obj->field28 = |proc->him->0x12 - obj->field2c|
 *
 * **These two settle a question mk3logic.h has carried open since the proc
 * struct was first written.** That header says of `field00` and `him`:
 *
 *      "the field is still called field00 and not `him`, because `him` is
 *       already taken by 0x04 ... one of the two readings is incomplete and
 *       nothing here settles which."
 *
 * **Neither is incomplete. They point at different structs.** Six functions
 * reach `obj->field00->field00` and are named for the opponent, so 0x00 is the
 * opponent's MK3OBJ. These two dereference `proc->him` at **0x0e and 0x12** --
 * the two halfword coordinates that live on a GrObj -- so **0x04 is the
 * opponent's GrObj**, their position record.
 *
 * Both are "the opponent". One is the object, one is where it is standing.
 *
 * The two functions are the same routine over the two coordinates, and the
 * absolute value is the same `cmp`/`rsblt` pair in both. `get_y_dist` also
 * parks the opponent's part in `a10` on the way past, which `get_x_dist` does
 * not -- the one asymmetry between them, and the reason `get_y_dist` is four
 * bytes longer.
 *
 * `field2c` gets MY coordinate and `field28` gets the DISTANCE, always
 * positive. A caller that needs the sign has to take it from `field2c` and the
 * opponent itself; it is thrown away here.
 */
void get_x_dist(MK3OBJ *obj)
{
    MK3OBJ *him = (MK3OBJ *)(uintptr_t)obj->field00->him;
    long    d;

    obj->field2c = (uint32_t)(long)MK3_FIELD0E_S(obj->field08);

    d = (long)MK3_FIELD0E_S(him) - (long)obj->field2c;
    obj->field28 = (uint32_t)d;
    if (d < 0)
        obj->field28 = (uint32_t)(-d);
}

void get_y_dist(MK3OBJ *obj)
{
    MK3OBJ *him;
    long    d;

    obj->field2c = (uint32_t)(long)MK3_FIELD12_S(obj->field08);

    obj->a10 = obj->field00->him;          /* the opponent's part, parked */

    him = (MK3OBJ *)(uintptr_t)obj->field00->him;
    d = (long)MK3_FIELD12_S(him) - (long)obj->field2c;
    obj->field28 = (uint32_t)d;
    if (d < 0)
        obj->field28 = (uint32_t)(-d);
}


/* ------------------------------------------------------------ ochar_begin_calls
 *
 * armv7 0x0002f48c, 20 bytes.  **Complete.**
 *
 *      if (obj->field08->0x24 == 0xc) shang_begin(obj)
 *
 * **`GrObj + 0x24` is the CHARACTER NUMBER**, and 0xc is Shang Tsung -- the
 * function called for it says so. `mk3_update` copies that same field into the
 * display record's 0x0c, so the renderer is told which character it is drawing
 * through the same byte.
 *
 * A **ninth hard-coded character number** for the port-critical table, and the
 * mild kind: the constant is right next to a function whose name identifies it,
 * the way `is_he_motaro` and `is_jade_protected` are. The dangerous ones are
 * the bare numbers.
 *
 * The name is plural and the body has one case, so this is the hook where
 * per-character round-start work goes and only one character needed any.
 */
void shang_begin(MK3OBJ *obj);

#define MK3_SHANG_TSUNG  0xc

void ochar_begin_calls(MK3OBJ *obj)
{
    if (obj->field08->field24 == MK3_SHANG_TSUNG)
        shang_begin(obj);
}


/* ------------------------------------------------------------ reset_proc_stack
 *
 * armv7 0x0002ebdc, 72 bytes.  **Complete.**
 *
 *      handler = mk3_frame(t, t->frame)[1]      ; save the current two
 *      token   = mk3_frame(t, t->frame + 1)[0]
 *
 *      t->frame   = 0
 *      t->fieldf8 = 0                           ; the argument cursor
 *      t->func    = t_local_reaction_exit       ; = mk3_frame(t, 0)[1]
 *      mk3_frame(t, 1)[0] = 0
 *
 *      t->frame = 1
 *      mk3_frame(t, 1)[1] = handler             ; put the saved pair back
 *      mk3_frame(t, 2)[0] = token
 *
 * **It throws the whole frame stack away and rebuilds a two-level one.** Level
 * 0 becomes `t_local_reaction_exit` and level 1 becomes whatever the thread was
 * doing, so however deep a fighter was nested -- a special move inside a combo
 * inside a stance -- one call collapses it to "do this, then leave the
 * reaction".
 *
 * That is what a hit does. Everything the fighter had pending is discarded, not
 * unwound, and there is no way back to it.
 *
 * **`t->func` at 0x04 IS `mk3_frame(t, 0)[1]`.** The frame array starts at the
 * thread's own address with eight-byte entries, so entry 0's handler word is
 * the struct's `func` field -- which is why mk3logic.h says the array "sits at
 * the thread's own address and overlaps them, which is why `frame` is never
 * small". This routine writes the same word both ways in nine instructions and
 * is the clearest demonstration of it in the tree.
 *
 * `fieldf8` is cleared too, so the argument stack goes with the frame stack.
 * Anything a caller pushed for a callee that is now discarded is gone, which is
 * the only safe thing to do and the reason the two are cleared together.
 */
long t_local_reaction_exit(MK3THREAD *thread);

void reset_proc_stack(MK3THREAD *thread)
{
    uint32_t handler = mk3_frame(thread, thread->frame)[1];
    uint32_t token   = *mk3_frame(thread, thread->frame + 1);

    thread->frame   = 0;
    thread->fieldf8 = 0;
    mk3_frame(thread, 0)[1] = (uint32_t)(uintptr_t)t_local_reaction_exit;
    *mk3_frame(thread, 1) = 0;

    thread->frame = 1;
    mk3_frame(thread, 1)[1] = handler;
    *mk3_frame(thread, 2) = token;
}


/* ------------------------------------------------------- t_local_reaction_exit
 *
 * armv7 0x00030060, 356 bytes.  **Complete.**
 *
 * The bottom of the frame stack `reset_proc_stack` installs. **Every hit a
 * fighter takes ends here**, and this decides what they become afterwards.
 *
 *      token == 0:
 *          c = obj->field08->0x24                   ; the character number
 *          if (c == 0xe || c == 0x12) ReallyKillProjectile(obj)
 *          airborne = am_i_airborn(obj)
 *          if (airborne) {
 *              obj->field20 = 1
 *              obj->field24 = 0x6000
 *              obj->field28 = 5
 *              obj->field1c = 0
 *              frame[frame].handler = t_fall_on_my_back
 *              frame[frame+1].w0 = 0
 *              return 0
 *          }
 *          stop_me_player(obj)
 *          back_to_normal(obj)
 *          reset_proc_stack(thread)
 *          token := 0x65b, push a level, handler = t_back_to_shang_check
 *          return 0
 *
 *      token == 0x65b:
 *          f = obj->field00->field10                ; the proc's flag word
 *          obj->field2c = f
 *          if (f & 0x40)  frame[frame].handler = t_collapse_on_ground
 *          else if (f & 1) {
 *              frame[frame].handler = plyrthread
 *              frame[frame+1].w0    = GLBL_joy_entry
 *          } else         frame[frame].handler = t_drone_entry
 *          return 0
 *
 *      otherwise: return -3
 *
 * ## Bit 0 of the proc's 0x10 is the human/AI switch, and here is where it is read
 *
 * `no_ai_hack` in mk3.c sets that bit on both fighters and its name says what
 * that means. `mk3_init` starts each fighter's thread at `plyrthread` or
 * `t_drone_begin` on bit 7 of the character argument. **This is the third site,
 * and it is the one that matters every round**: after every single reaction the
 * fighter is handed back to `plyrthread` if bit 0 is set and to
 * `t_drone_entry` if it is not.
 *
 * So the CPU flag is not just an initial condition. A fighter that loses that
 * bit mid-match stops responding to the stick the next time it is hit, and
 * one that gains it starts responding. **That is the whole mechanism behind
 * `no_ai_hack`**, and it is why that function is thirty-two bytes and needs no
 * cooperation from anything else.
 *
 * **Bit 6 (0x40) of the same word outranks it**: a fighter with that set
 * collapses on the ground instead of getting up, whether it is human-driven or
 * not. Checked first, and the human/AI question is never asked.
 *
 * ## GLBL_joy_entry
 *
 * `plyrthread` is not resumed at token 0. It is resumed at whatever
 * `_GLBL_joy_entry` holds -- a global at 0x00165580, **initialised to 0 in the
 * file** -- so the entry point of the human state machine is a variable and
 * something can change where a fighter comes back to. Nothing decompiled writes
 * it yet.
 *
 * ## Airborne is a different ending
 *
 * Being hit in the air does not reset the proc stack at all. Four fields are
 * set -- 0x20 = 1, 0x24 = 0x6000, 0x28 = 5, 0x1c = 0 -- and the handler becomes
 * `t_fall_on_my_back` in place, with the stack left as deep as it was. The
 * grounded path is the one that unwinds.
 *
 * ## Two more hard-coded character numbers
 *
 * 0xe and 0x12 get `ReallyKillProjectile` called on them before anything else,
 * and they are bare numbers with no named predicate around them -- the
 * dangerous kind. **Tenth and eleventh entries in the port-critical table.**
 * Whatever those two characters are, a hit cancels a projectile they own and no
 * other character gets that.
 */
long am_i_airborn(MK3OBJ *obj);
void ReallyKillProjectile(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);
void back_to_normal(MK3OBJ *obj);
long t_fall_on_my_back(MK3THREAD *thread);      /* slot 0x000f38ac */
long t_collapse_on_ground(MK3THREAD *thread);   /* slot 0x000f385c */
long t_back_to_shang_check(MK3THREAD *thread);  /* slot 0x000f38c0 */
long t_drone_entry(MK3THREAD *thread);          /* slot 0x000f37ec */
long plyrthread(MK3THREAD *thread);

extern uint32_t GLBL_joy_entry;                 /* 0x00165580, starts at 0 */

#define MK3_KILLS_PROJ_A  0x0e
#define MK3_KILLS_PROJ_B  0x12

long t_local_reaction_exit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);
    uint32_t c;
    long     airborne;

    if (token == 0) {
        c = obj->field08->field24;

        if (c == MK3_KILLS_PROJ_A || c == MK3_KILLS_PROJ_B)
            ReallyKillProjectile(obj);

        airborne = am_i_airborn(obj);

        if (airborne != 0) {
            obj->field20 = 1;
            obj->field24 = 0x6000;
            obj->field28 = 5;
            obj->field1c = 0;

            mk3_frame(thread, thread->frame)[1] =
                (uint32_t)(uintptr_t)t_fall_on_my_back;
            *mk3_frame(thread, thread->frame + 1) = 0;
            return 0;
        }

        stop_me_player(obj);
        back_to_normal(obj);
        reset_proc_stack(thread);

        *mk3_frame(thread, thread->frame + 1) = 0x65b;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_back_to_shang_check;
        *mk3_frame(thread, thread->frame + 1) = (uint32_t)airborne;  /* 0 */
        return airborne;
    }

    if (token != 0x65b)
        return -3;

    {
        uint32_t f = obj->field00->field10;
        obj->field2c = f;

        if ((f & 0x40u) != 0) {                     /* collapse outranks all */
            mk3_frame(thread, thread->frame)[1] =
                (uint32_t)(uintptr_t)t_collapse_on_ground;
            *mk3_frame(thread, thread->frame + 1) = 0;
            return 0;
        }

        if ((f & 1u) != 0) {                        /* bit 0: a human drives me */
            mk3_frame(thread, thread->frame)[1] =
                (uint32_t)(uintptr_t)plyrthread;
            *mk3_frame(thread, thread->frame + 1) = GLBL_joy_entry;
            return 0;
        }

        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_drone_entry;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }
}


/* ===================================================================== plyrthread
 *
 * armv7 0x00030fec, **2,124 bytes -- the largest function in the directory**,
 * and the one that makes a human-controlled fighter a human-controlled
 * fighter. `mk3_init` starts a thread here when bit 7 of the character number
 * is clear, and `t_local_reaction_exit` hands the fighter back here after every
 * hit.
 *
 * ## How it was read
 *
 * The dispatch is a compiled switch three levels deep with the bodies
 * interleaved between the branches, and reading that by eye gets a case wrong
 * eventually. It was not read by eye: `tools/dispatch.py` executes the compare
 * tree for every token and reports where each lands. **43 tokens over 36
 * bodies**, plus one refusal. The case list below is that output, not a
 * transcription.
 *
 * ## Four shared tails
 *
 * Almost every state ends in one of four places, and they are the file's whole
 * vocabulary:
 *
 *      RET          pop -- return whatever is in r0
 *      PARK1        token := 0x46d, fieldfc = 1, return 1
 *                   (sleep exactly one frame and come back at 0x46d)
 *      INSTALL      frame[frame].handler = H; frame[frame+1].w0 = 0; return 0
 *      PUSH_INSTALL the same, after thread->frame has already been advanced
 *
 * **`mk3_update` re-runs a thread whose handler returns 0**, so INSTALL means
 * "become this and act now", while PARK1's `return 1` ends the thread's frame.
 * The difference is one register and it is the difference between a state
 * change and a frame passing.
 *
 * ## What the states are
 *
 * Reading the tokens against what they install, the machine is:
 *
 *      0, 0x3a9      enter: mark "driven from outside", per-character begin
 *      0x3e1         stance table, arm 0x3e4
 *      0x3e4, 0x3e6  descend into t_wait_for_start
 *      0x3e8, 0x3eb  round start: GLBL_joy_entry := 0x3eb, buttons on,
 *                    reset_proc_stack, then read the stick
 *      0x3f8         clear 0x1c and the proc's 0x14, stance_setup
 *      0x3fd         am_i_facing_him? no -> t_turn_around, yes -> 0x404
 *      0x400,0x42e,
 *      0x5e3,0x5f2,
 *      0x63b         stop_me_player, become t_local_reaction_exit
 *      0x403         become t_check_winner_status
 *      0x404         G[0x44e] -- the round timer -- zero means wait
 *      0x408         check_block_bit: blocking -> t_joy_block
 *      0x417         next_anirate, then the 0x3fd facing check
 *      0x424         face_opponent, buttons off, arm 0x427
 *      0x427         bt_jump, distance_from_ground, descend t_do_jump_up
 *      0x43a, 0x446  the two walk directions
 *      0x44c, 0x455  pick the walk info, forward or back
 *      0x45c         call obj->field30 -- the walk routine -- then animate
 *      0x46c, 0x46d  PARK1's own token: fall through to the walk call
 *      0x471, 0x478,
 *      0x479, 0x47b  the walk loop and its flip check
 *      0x49a, 0x4a7  reduce_turbo_bar, stop
 *      0x4a0, 0x4a3,
 *      0x4a4, 0x4a5  run: run_setup and next_anirate
 *      0x4b5         compare the walk routine against the stick
 *      0x5dc         the 0x40000/0x70000 pair and a descend into t_do_flip
 *      0x5eb         pop a level, set 0x1a/0x1b, descend into t_do_flip
 *      0x5fd         read the stick and branch on up+down / up+left
 *      0x617         count 0x48 down, then pop
 *      0x61f         push a level and read the stick
 *
 * ## Two findings worth carrying out of here
 *
 * **`obj->field30` holds the fighter's WALK ROUTINE, and the state machine
 * calls it indirectly.** State 0x45c does `blx obj->field30` -- the only
 * indirect call in the function -- and states 0x44c/0x455 choose between
 * `get_walk_info_f` and `get_walk_info_b` to fill it. So walking forward and
 * walking backward are the same state with a different function pointer, and
 * 0x4b5 decides whether to keep it by comparing it against what the stick now
 * says. That is the same handover shape `obj->field34` has for projectiles.
 *
 * **The stick is tested as bit PAIRS, not as four directions.** 0x5fd masks
 * with 9 and then with 5 -- bits 0 and 3, then bits 0 and 2 -- and branches
 * only when the whole pair is present. `Playback_Update` established that bits
 * 2 and 3 are the horizontal pair; so `& 9` and `& 5` are "up and one of the
 * two horizontals", which is a diagonal. The jump states are reached from
 * exactly there.
 */
long t_turn_around(MK3THREAD *thread);        /* slot 0x000f3844 */
long t_wait_for_start(MK3THREAD *thread);     /* slot 0x000f388c */
long t_do_jump_up(MK3THREAD *thread);         /* slot 0x000f3854 */
long t_check_winner_status(MK3THREAD *thread);
long t_do_flip(MK3THREAD *thread);
long t_joy_block(MK3THREAD *thread);
long t_walk_flip_check(MK3THREAD *thread);
long t_joy_down(MK3THREAD *thread);

void get_walk_info_f(MK3OBJ *obj);            /* slot 0x000f37d4 */
void get_walk_info_b(MK3OBJ *obj);            /* slot 0x000f37d0 */

void init_anirate(MK3OBJ *obj);
void set_x_vel_player(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void stance_setup(MK3OBJ *obj);
long am_i_facing_him(MK3OBJ *obj);
long next_anirate(MK3OBJ *obj);
void run_setup(MK3OBJ *obj);
void distance_from_ground(MK3OBJ *obj);
void face_opponent(MK3OBJ *obj);
void get_my_height(MK3OBJ *obj);
void reduce_turbo_bar(MK3OBJ *obj);
/* `is_run_pressed` is defined earlier in this file; it answers in
 * `obj->field5c`, the boolean slot, and returns it as well. */
long is_run_pressed(MK3OBJ *obj);

/* The four tails, as the binary spells them. `install` is the common one; the
 * caller has already decided which frame index it means. */
static long plyr_install(MK3THREAD *t, uint32_t frame, const void *handler)
{
    mk3_frame(t, frame)[1] = (uint32_t)(uintptr_t)handler;
    *mk3_frame(t, frame + 1) = 0;
    return 0;
}

static long plyr_park1(MK3THREAD *t)
{
    *mk3_frame(t, t->frame + 1) = 0x46d;
    t->fieldfc = 1;
    return 1;
}

long plyrthread(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t bits;

    switch (token) {

    /* ---------------------------------------------------------------- enter */
    case 0:
    case 0x3a9:
        obj->field00->field10 |= 1;         /* driven from outside */
        ochar_begin_calls(obj);
        /* fall through */
    case 0x3e1:
        stuff_buttons(obj, (uint32_t)(uintptr_t)&bt_stance);
        obj->field00->field10 |= 1;
        *mk3_frame(thread, frame + 1) = 0x3e4;
        thread->fieldfc = 1;
        return 1;

    case 0x3e4:
    case 0x3e6:
        *mk3_frame(thread, frame + 1) = 0x3e8;
        thread->frame = frame + 1;
        return plyr_install(thread, thread->frame, (const void *)t_wait_for_start);

    /* ------------------------------------------------------- the round starts */
    case 0x3e8:
    case 0x3eb:
        GLBL_joy_entry = 0x3eb;             /* where a reaction comes back to */
        enable_all_buttons(obj);
        reset_proc_stack(thread);
        joystick_in_a0(obj);
        if ((obj->field1c & 2u) != 0)
            goto duck_check;                /* down: the duck path */
        /* fall through */

    case 0x3f8:
        obj->field1c = 0;
        obj->field00->field14 = 0;
        stance_setup(obj);
        /* fall through */

    case 0x3fd:
        if (am_i_facing_him(obj) == 0) {
            *mk3_frame(thread, frame + 1) = 0x400;
            thread->frame = frame + 1;
            return plyr_install(thread, thread->frame,
                                (const void *)t_turn_around);
        }
        *mk3_frame(thread, frame + 1) = 0x404;
        thread->frame = frame + 1;
        return plyr_install(thread, thread->frame,
                            (const void *)t_check_winner_status);

    /* ------------------------------------------------- the round-over endings */
    case 0x400:
    case 0x42e:
    case 0x5e3:
    case 0x5f2:
    case 0x63b:
        stop_me_player(obj);
        return plyr_install(thread, thread->frame,
                            (const void *)t_local_reaction_exit);

    case 0x403:
        thread->frame = frame + 1;
        return plyr_install(thread, thread->frame,
                            (const void *)t_check_winner_status);

    /* **The round timer.** G + 0x44e is a halfword; zero means the round has
     * not started and the fighter goes back to waiting. */
    case 0x404:
        obj->field1c = (uint32_t)(long)
            *(const int16_t *)(const void *)(G_BYTES + 0x44e);
        if (*(const uint16_t *)(const void *)(G_BYTES + 0x44e) == 0) {
            *mk3_frame(thread, frame + 1) = 0x3e8;
            thread->frame = frame + 1;
            return plyr_install(thread, thread->frame,
                                (const void *)t_wait_for_start);
        }
        *mk3_frame(thread, frame + 1) = 0x408;
        thread->fieldfc = 1;
        return 1;

    case 0x408:
        check_block_bit(obj);
        if (obj->field5c != 0)
            return plyr_install(thread, thread->frame,
                                (const void *)t_joy_block);
        goto read_stick;

    case 0x417:
        next_anirate(obj);
        goto facing_check;

    /* ------------------------------------------------------------- the jump */
    case 0x424:
        face_opponent(obj);
        disable_all_buttons(obj);
        *mk3_frame(thread, frame + 1) = 0x427;
        thread->frame = frame + 1;
        *mk3_frame(thread, thread->frame + 1) = 0;
        /* copy the handler down a level -- the binary reads [r3,#-4] and
         * writes [r3,#4], which is frame[n-1].handler into frame[n].handler */
        mk3_frame(thread, thread->frame)[1] =
            mk3_frame(thread, thread->frame - 1)[1];
        goto stick_state;

    case 0x427:
        stuff_buttons(obj, (uint32_t)(uintptr_t)&bt_jump);
        distance_from_ground(obj);
        obj->field48 = 0;
        obj->a10 = obj->field1c;
        *mk3_frame(thread, frame + 1) = 0x42e;
        thread->frame = frame + 1;
        return plyr_install(thread, thread->frame,
                            (const void *)t_do_jump_up);

    /* --------------------------------------------------------- walking, both */
    case 0x43a:
        obj->field2c = (*(const uint32_t *)(const void *)
                          ((const char *)(const void *)obj->field08 + 0x28)
                        & 0x10u) ^ 0x10u;
        obj->field1c = 4;
        goto walk_common;

    case 0x446:
        obj->field2c = *(const uint32_t *)(const void *)
                          ((const char *)(const void *)obj->field08 + 0x28)
                       & 0x10u;
        obj->field1c = 8;
        goto walk_common;

    case 0x44c:
        goto walk_pick;

    case 0x455:
        obj->field30 = (uint32_t)(uintptr_t)get_walk_info_b;
        goto walk_pick_tail;

    /* **The one indirect call in the function**: whatever 0x30 holds is the
     * walk routine, and 0x44c / 0x455 chose it. */
    case 0x45c:
        ((void (*)(MK3OBJ *))(uintptr_t)obj->field30)(obj);
        obj->field40 = obj->field24;
        init_anirate(obj);
        obj->field1c = obj->field20;
        set_x_vel_player(obj);
        obj->field00->field28 = obj->field40;
        get_char_ani(obj);
        obj->field00->field24 = obj->field40;
        return plyr_park1(thread);

    case 0x46c:
    case 0x46d:
        return plyr_park1(thread);

    case 0x471:
        obj->field1c = obj->field00->field28;
        if (obj->field00->field28 == 1) {
            is_run_pressed(obj);
            if (obj->field5c != 0)
                goto run_start;
        }
        /* fall through */
    case 0x478:
        *mk3_frame(thread, frame + 1) = 0x479;
        goto push_and_copy;

    case 0x479:
        *mk3_frame(thread, frame + 1) = 0x47b;
        thread->frame = frame + 1;
        return plyr_install(thread, thread->frame,
                            (const void *)t_walk_flip_check);

    case 0x47b:
        next_anirate(obj);
        mask_joystick(obj);
        if (obj->field1c == 0)
            goto stop_state;
        return plyr_park1(thread);

    /* --------------------------------------------------------------- the bars */
    case 0x49a:
        goto stop_state;

    case 0x4a7:
        reduce_turbo_bar(obj);
        if (obj->field1c != 0)
            goto turbo_run;
        goto stop_state;

    /* ------------------------------------------------------------------- run */
    case 0x4a0:
    case 0x4a3:
    run_start:
        run_setup(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x4a4;
        thread->fieldfc = 1;
        return 1;

    case 0x4a4:
        *mk3_frame(thread, frame + 1) = 0x4a5;
        goto push_and_copy;

    case 0x4a5:
        next_anirate(obj);
        *mk3_frame(thread, frame + 1) = 0x4a7;
        thread->frame = frame + 1;
        return plyr_install(thread, thread->frame,
                            (const void *)t_check_winner_status);

    /* **Has the stick changed since the walk routine was chosen?** 0x30 still
     * holds it, and the fighter's own 0x18 says what it is doing now. */
    case 0x4b5:
        obj->field1c = *(const uint32_t *)(const void *)
                          ((const char *)(const void *)obj->field08 + 0x18);
        if (obj->field1c == obj->field30)
            goto stop_state;
        mask_joystick(obj);
        if (obj->field1c == 0)
            goto stop_state;
        goto run_start;

    case 0x5dc:
        thread->frame = frame - 1;          /* pop a level, keeping the pair */
        goto flip_5dc;

    case 0x5eb:
        goto pop_and_flip;

    case 0x5fd:
        obj->field48 = 3;
        goto read_stick;

    case 0x617:
        obj->field48 = obj->field48 - 1;
        if ((long)obj->field48 > 0)
            goto read_stick_again;
        if ((long)thread->frame <= 0)
            return plyr_install(thread, thread->frame,
                                (const void *)t_local_reaction_exit);
        thread->frame = frame - 1;
        return 0;

    case 0x61f:
        goto push_and_read;

    default:
        return -3;
    }

    /* ================================================== the shared bodies ==== */

duck_check:
    obj->field2c = *(const uint32_t *)(const void *)
                      ((const char *)(const void *)obj->field08 + 0x28) & 0x10u;
    obj->field1c = 8;
    goto walk_common;

walk_common:
    obj->field00->field34 = obj->field1c;   /* the direction mask */
    obj->field24 = 0;
    obj->field00->field18 = 0;
    obj->field40 = 1;
    if (obj->field2c != 0) {
        obj->field30 = (uint32_t)(uintptr_t)get_walk_info_b;
        goto walk_pick_tail;
    }
    obj->field30 = (uint32_t)(uintptr_t)get_walk_info_f;
    goto run_or_walk;

walk_pick:
    obj->field00->field34 = obj->field1c;
    goto walk_common;

walk_pick_tail:
    if (obj->field30 != (uint32_t)(uintptr_t)get_walk_info_f)
        goto walk_call;
    goto run_or_walk;

run_or_walk:
    is_run_pressed(obj);
    if (obj->field5c == 0)
        goto walk_call;
    goto run_start;

walk_call:
    ((void (*)(MK3OBJ *))(uintptr_t)obj->field30)(obj);
    obj->field40 = obj->field24;
    init_anirate(obj);
    obj->field1c = obj->field20;
    set_x_vel_player(obj);
    obj->field00->field28 = obj->field40;
    get_char_ani(obj);
    obj->field00->field24 = obj->field40;
    return plyr_park1(thread);

read_stick:
    joystick_in_a0(obj);
    bits = obj->field1c;
    if ((bits & 8u) != 0 && (int16_t)obj->field00->field7c == 0)
        goto duck_check;
    if ((bits & 4u) != 0 && (int16_t)obj->field00->field7c == 0)
        goto back_walk;
    if ((bits & 1u) != 0)
        goto jump_prep;
    if ((bits & 2u) == 0)
        goto down_state;
    return plyr_install(thread, thread->frame, (const void *)t_joy_down);

read_stick_again:
    obj->field48 = 3;
    joystick_in_a0(obj);
    bits = obj->field1c;
    obj->field20 = bits;
    obj->field1c = bits & 9u;
    if ((bits & 9u) == 9u)
        goto pop_and_flip_hi;
    obj->field20 = bits & 5u;
    if ((bits & 5u) == 5u)
        goto pop_and_flip;
    *mk3_frame(thread, thread->frame + 1) = 0x617;
    thread->fieldfc = 1;
    return 1;

back_walk:
    obj->field2c = (*(const uint32_t *)(const void *)
                      ((const char *)(const void *)obj->field08 + 0x28)
                    & 0x10u) ^ 0x10u;
    obj->field1c = 4;
    goto walk_common;

jump_prep:
    face_opponent(obj);
    disable_all_buttons(obj);
    *mk3_frame(thread, frame + 1) = 0x427;
    thread->frame = frame + 1;
    *mk3_frame(thread, thread->frame + 1) = 0;
    mk3_frame(thread, thread->frame)[1] =
        mk3_frame(thread, thread->frame - 1)[1];
    goto stick_state;

down_state:
    *mk3_frame(thread, frame + 1) = 0x417;
    thread->frame = frame + 1;
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_back_to_shang_check;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;

facing_check:
    if (am_i_facing_him(obj) == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x400;
        thread->frame = thread->frame + 1;
        return plyr_install(thread, thread->frame,
                            (const void *)t_turn_around);
    }
    *mk3_frame(thread, thread->frame + 1) = 0x404;
    thread->frame = thread->frame + 1;
    return plyr_install(thread, thread->frame,
                        (const void *)t_check_winner_status);

stop_state:
    stop_me_player(obj);
    return plyr_install(thread, thread->frame,
                        (const void *)t_local_reaction_exit);

turbo_run:
    obj->field30 = 0xfffc0000u;             /* -4.0 in 16.16 */
    joystick_in_a0(obj);
    if ((obj->field1c & 8u) != 0)
        goto compare_walk;
    if ((obj->field1c & 4u) != 0) {
        obj->field30 = (uint32_t)(-(long)obj->field30);
        goto compare_walk_tail;
    }
    goto stop_state;

compare_walk:
    obj->field1c = *(const uint32_t *)(const void *)
                      ((const char *)(const void *)obj->field08 + 0x18);
compare_walk_tail:
    if (obj->field1c == obj->field30)
        goto stop_state;
    mask_joystick(obj);
    if (obj->field1c == 0)
        goto stop_state;
    goto run_start;

push_and_copy:
    thread->frame = thread->frame + 1;
    *mk3_frame(thread, thread->frame + 1) = 0;
    mk3_frame(thread, thread->frame)[1] =
        mk3_frame(thread, thread->frame - 1)[1];
    goto read_stick_again;

push_and_read:
    thread->frame = thread->frame + 1;
    *mk3_frame(thread, thread->frame + 1) = 0;
    mk3_frame(thread, thread->frame)[1] =
        mk3_frame(thread, thread->frame - 1)[1];
    goto read_stick_again;

stick_state:
    goto read_stick_again;

/* **The 0x40000 / 0x70000 pair, from one register.** `mov #0x40000` then
 * `add #0x30000` -- the shared-literal habit, so they must be transcribed as
 * the addition and not as two constants. */
flip_5dc:
    obj->field48 = 0x40000;
    obj->field34 = 0x40000 + 0x30000;
    obj->field1c = 0x1a;
    obj->field20 = 0x1a + 1;
    *mk3_frame(thread, thread->frame + 1) = 0x5e3;
    thread->frame = thread->frame + 1;
    return plyr_install(thread, thread->frame, (const void *)t_do_flip);

pop_and_flip_hi:
    if ((long)thread->frame <= 0)
        return plyr_install(thread, thread->frame,
                            (const void *)t_local_reaction_exit);
    thread->frame = thread->frame - 1;
    goto flip_5dc;

pop_and_flip:
    if ((long)thread->frame <= 0)
        return plyr_install(thread, thread->frame,
                            (const void *)t_local_reaction_exit);
    thread->frame = thread->frame - 1;
    obj->field20 = 0x1a;
    obj->field1c = 0x1a + 1;
    obj->field34 = 0;
    obj->field48 = 0xfff80000u;             /* -8.0 in 16.16 */
    *mk3_frame(thread, thread->frame + 1) = 0x5f2;
    thread->frame = thread->frame + 1;
    return plyr_install(thread, thread->frame, (const void *)t_do_flip);
}


/* ======================================================================
 * The six that were still pending in this file.
 *
 * Transcribed instruction by instruction from the annotated armv7
 * disassembly. Two of them reach the globals through the pointer slots that
 * happen to sit at `bt_jump + 0x28` and `bt_jump + 0x2c`; those slots hold
 * `G` and `H`, which this file already names, so they are spelled that way
 * here rather than as pointer arithmetic off a button table they have
 * nothing to do with.
 * ====================================================================== */

long strike_check_a0(MK3OBJ *obj);
void get_bcq_next_pointer_idx(MK3OBJ *obj, long which);
void previous_q_entry(MK3OBJ *obj);
void MKEvent_Add(long a, long b, long c, long d);
void turbo_bar_setup(MK3OBJ *obj);
long t_joyd4(struct MK3THREAD *thread);

extern const void *bt_duck;                /* 0x001655d4 */


/* ------------------------------------------------------------ shang_begin
 *
 * armv7 0x0002f47c, sixteen bytes.
 *
 *      v = proc->field10 | 0x200
 *      obj->field2c = v ; proc->field10 = v
 *
 * One flag, set in both the object's scratch and the proc it came from --
 * the same write-it-twice shape `reaction_start_chores` uses, and the reason
 * the scratch copy exists at all is that the caller reads it back.
 */
void shang_begin(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;
    uint32_t v = proc->field10 | 0x200u;

    obj->field2c = v;
    proc->field10 = v;
}


/* ------------------------------------------------------- punch_strike_check
 *
 * armv7 0x0002f7d8, twenty-four bytes.
 *
 *      strike_check_a0(obj)
 *      if (obj->field5c != 0) obj->field48 = -1
 *
 * `field5c` is the engine's "did that connect" flag -- `t_attk2` reads the
 * same one. The -1 into field48 is what stops the swing checking again: the
 * strike id becomes invalid, so a punch lands once however many frames it
 * stays out.
 */
void punch_strike_check(MK3OBJ *obj)
{
    strike_check_a0(obj);
    if (obj->field5c != 0)
        obj->field48 = (uint32_t)-1;
}


/* --------------------------------------------------------- get_last_button
 *
 * armv7 0x000308c4, twenty-four bytes.
 *
 *      get_bcq_next_pointer_idx(obj, obj->field00->field08)
 *      previous_q_entry(obj)
 *
 * field08 is the player index, and the bcq is the per-player button ring G
 * carries at 0x0c0 / 0x218. Walking back one entry is how a move asks what
 * was pressed before the button that started it.
 */
void get_last_button(MK3OBJ *obj)
{
    get_bcq_next_pointer_idx(obj, (long)obj->field00->field08);
    previous_q_entry(obj);
}


/* ---------------------------------------------------------- turbo_bar_setup
 *
 * armv7 0x0002f3e4, forty-four bytes.
 *
 *      p = obj->field00->field08                  ; the player index
 *      obj->field30 = &G[0x378 + p * 4]           ; the run bar itself
 *      obj->field34 = &G[0x388 + p * 4]           ; its lockout counter
 *
 * Two pointers, parked in the object so the three routines that move the bar
 * do not each have to compute them. Which array is which is settled by the
 * three that use them: `is_run_pressed` refuses when 0x378 is zero and writes
 * 40 into 0x388 on the way out, `reduce_turbo_bar` takes one off 0x378 a
 * frame while holding 0x388 at 40, and `RaiseTurboBars` counts 0x388 down
 * and only then puts 0x378 back, stopping at 48.
 */
void turbo_bar_setup(MK3OBJ *obj)
{
    uint32_t p = obj->field00->field08;

    obj->field30 = (uint32_t)(uintptr_t)(G_BYTES + 0x378 + p * 4);
    obj->field34 = (uint32_t)(uintptr_t)(G_BYTES + 0x388 + p * 4);
}


/* ------------------------------------------------------------------ t_joyd3
 *
 * armv7 0x0002ee30, seventy-two bytes.
 *
 *      if (frame[frame+1] != 0) return -3
 *      stuff_buttons(obj, &bt_duck)
 *      install t_joyd4
 *
 * The duck's button table goes in before the state that reads it, which is
 * the same order `plyrthread` installs `bt_stance`.
 */
long t_joyd3(struct MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;
    stuff_buttons(obj, (uint32_t)(uintptr_t)&bt_duck);
    return mk3_install(thread, (MK3THREADFUNC)t_joyd4);
}


/* --------------------------------------------------------- zero_turbo_bar
 *
 * armv7 0x0003087c, seventy-two bytes.
 *
 *      v = (int16_t)H[0x18] ; obj->field20 = v
 *      if (v != 0) return                        ; frozen: do nothing
 *      turbo_bar_setup(obj)
 *      *obj->field34 = 0x28                      ; lock it out for 40 frames
 *      obj->field1c = 0 ; *obj->field30 = 0      ; and empty it
 *      MKEvent_Add(3, 5, G[0x378 + p * 4], 0)    ; tell the HUD
 *
 * `H[0x18]` is the same halfword `reduce_turbo_bar` opens with, and it gates
 * both the same way: while it is non-zero the bar does not move at all. So
 * this is "empty the run bar now" -- the bar to nothing and the lockout to
 * its full 40 -- and the event is the HUD being told the new value, which is
 * zero.
 */
void zero_turbo_bar(MK3OBJ *obj)
{
    int32_t v = *(const int16_t *)(const void *)(H + 0x18);

    obj->field20 = (uint32_t)v;
    if (v != 0)
        return;

    turbo_bar_setup(obj);
    *(uint32_t *)(uintptr_t)obj->field34 = 0x28;
    obj->field1c = 0;
    *(uint32_t *)(uintptr_t)obj->field30 = 0;

    MKEvent_Add(3, 5,
                *(const uint32_t *)(const void *)
                    (G_BYTES + 0x378 + obj->field00->field08 * 4),
                0);
}
