/*
 * mkcanned.c -- gamecode/logic/mkcanned.c, decompiled.
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

long t_plwins(struct MK3THREAD *thread);
long t_vic7(struct MK3THREAD *thread);

/* t_player_2_wins -- armv7 0x0007cea0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field24 = 0x1
 *      frame[frame].handler = t_plwins
 *      frame[frame+1].w0 = 0
 */

long t_player_2_wins(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field24 = 0x1;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_plwins);
}

/* t_kano_victory -- armv7 0x0007cfa0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->a10 = 0x4
 *      frame[frame].handler = t_vic7
 *      frame[frame+1].w0 = 0
 */

long t_kano_victory(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->a10 = 0x4;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_vic7);
}

/* t_generic_victory -- armv7 0x0007cfdc, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->a10 = 0x5
 *      frame[frame].handler = t_vic7
 *      frame[frame+1].w0 = 0
 */

long t_generic_victory(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->a10 = 0x5;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_vic7);
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


/* t_player_1_wins -- armv7 0x0007cedc, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field24 = 0   (the register the guard proved)
 *      frame[frame].handler = t_plwins
 *      frame[frame+1].w0 = 0
 */

long t_player_1_wins(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field24 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_plwins);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_vicjump(struct MK3THREAD *thread);
void am_i_shang(MK3OBJ *obj);
void clear_inviso(MK3OBJ *obj);
void init_special(MK3OBJ *obj);

/* t_victory_animation -- armv7 0x0007d3a4, 116 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      clear_inviso(obj)
 *      init_special(obj)
 *      am_i_shang(obj)
 *      frame[frame].handler = t_vicjump
 *      frame[frame+1].w0 = 0
 */

long t_victory_animation(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    clear_inviso(obj);
    init_special(obj);
    am_i_shang(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_vicjump);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_dizzy_wake(MK3THREAD *thread);
long t_mframew(MK3THREAD *thread);
long t_wait_forever(MK3THREAD *thread);
void get_char_ani(MK3OBJ *obj);

/* t_dizzy_sleep -- armv7 0x0007ce58, 72 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x154, duration 0x1)
 *      token == 0x154:
 *          frame[frame].handler = t_dizzy_wake
 *      otherwise:  return -3
 */
long t_dizzy_sleep(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x154;
        thread->fieldfc = 0x1;
        return 0x1;
    }

    if (token != 0x154)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_dizzy_wake);
}

/* t_vic7 -- armv7 0x0007d418, 136 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0xd
 *          get_char_ani(obj)
 *          obj->field1c = obj->a10
 *          token := 0x276, then descend into t_mframew
 *      token == 0x276:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_vic7(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0xd;
        get_char_ani(obj);
        obj->field1c = obj->a10;
        *mk3_frame(thread, thread->frame + 1) = 0x276;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x276)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}
