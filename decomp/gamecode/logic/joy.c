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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_joy_duck_block_loop);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_joy_getup_entry);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}
