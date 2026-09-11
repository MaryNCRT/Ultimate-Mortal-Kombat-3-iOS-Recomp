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
 * **Which of the four is up, down, left and right is NOT yet established** and
 * is not guessed here. `mask_joystick` below shows they are then filtered by
 * `proc->field34`, so a state can forbid individual directions.
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
void stuff_buttons(MK3OBJ *obj, const void *table)
{
    obj->field60 = (uint32_t)(uintptr_t)table;
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
    stuff_buttons(obj, &bt_stance);
}

void disable_all_buttons(MK3OBJ *obj)
{
    stuff_buttons(obj, &bt_null);
}

void disable_his_buttons(MK3OBJ *obj)
{
    stuff_buttons(obj->field00->field00, &bt_null);
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
