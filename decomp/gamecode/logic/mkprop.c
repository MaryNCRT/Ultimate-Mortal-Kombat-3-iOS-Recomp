/*
 * mkprop.c -- gamecode/logic/mkprop.c, decompiled.
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

long t_zoom_blocked(struct MK3THREAD *thread);
long tl_do_slide(struct MK3THREAD *thread);

/* t_scorpion_tele_blocked -- armv7 0x0003c014, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_zoom_blocked
 *      frame[frame+1].w0 = 0
 */

long t_scorpion_tele_blocked(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zoom_blocked);
}

/* tl_do_ninja_slide -- armv7 0x0003c048, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = tl_do_slide
 *      frame[frame+1].w0 = 0
 */

long tl_do_ninja_slide(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_do_slide);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long am_i_airborn(MK3OBJ *obj);
void set_inviso(MK3OBJ *obj);

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

long t_square3(MK3THREAD *thread);
void away_x_vel(MK3OBJ *obj);
void pose_a9_manual(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);

/* t_liz_fly_hit -- armv7 0x0003f280, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          stop_me_player(obj)
 *          obj->field40 = 0x20018
 *          pose_a9_manual(obj)
 *          park(token 0x6f5, duration 0xa)
 *      token == 0x6f5:
 *          obj->field1c = 0x20000
 *          away_x_vel(obj)
 *          frame[frame].handler = t_square3
 *      otherwise:  return -3
 */
long t_liz_fly_hit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        stop_me_player(obj);
        obj->field40 = 0x20018;
        pose_a9_manual(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x6f5;
        thread->fieldfc = 0xa;
        return 0xa;
    }

    if (token != 0x6f5)
        return -3;

    obj->field1c = 0x20000;
    away_x_vel(obj);
    return mk3_push_handler(thread, (MK3THREADFUNC)t_square3);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_flight(MK3THREAD *thread);
long t_jump_up_land_jsrp(MK3THREAD *thread);

/* t_air_grab_cancel -- armv7 0x0003d76c, 152 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0x19
 *          pose_a9_manual(obj)
 *          obj->field1c = 0xd
 *          obj->field20 = 0xd
 *          obj->field24 = 0x8000
 *          obj->field28 = 0xfff
 *          token := 0x83f, then descend into t_flight
 *      token == 0x83f:
 *          frame[frame].handler = t_jump_up_land_jsrp
 *      otherwise:  return -3
 */
long t_air_grab_cancel(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x19;
        pose_a9_manual(obj);
        obj->field1c = 0xd;
        obj->field20 = 0xd;
        obj->field24 = 0x8000;
        obj->field28 = 0xfff;
        *mk3_frame(thread, thread->frame + 1) = 0x83f;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x83f)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_jump_up_land_jsrp);
}
