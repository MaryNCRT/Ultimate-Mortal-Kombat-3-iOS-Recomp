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
long find_ani_part2(MK3OBJ *obj);
long find_part2(MK3OBJ *obj);
long get_char_ani(MK3OBJ *obj);
long stop_me_player(MK3OBJ *obj);

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




