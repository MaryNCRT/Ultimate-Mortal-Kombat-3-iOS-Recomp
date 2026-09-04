/*
 * mkcombo.c -- gamecode/logic/mkcombo.c, decompiled.
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



/* t_comb9 -- armv7 0x00032a4c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x4
 *      frame[frame].handler = t_mframew
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f37cc rather than as a
 * link-time constant, so it lives in another translation unit. */
long t_mframew(struct MK3THREAD *thread);

long t_comb9(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x4;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_mframew);
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

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_combo_2_late(MK3THREAD *thread);
long t_combo_exit(MK3THREAD *thread);

/* t_combo_miss -- armv7 0x000329b4, 76 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x844, duration 0x10)
 *      token == 0x844:
 *          frame[frame].handler = t_combo_2_late
 *      otherwise:  return -3
 */
long t_combo_miss(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x844;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token != 0x844)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_combo_2_late);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

/* t_combo_2_late -- armv7 0x00032a00, 76 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x847, duration 0x5)
 *      token == 0x847:
 *          frame[frame].handler = t_combo_exit
 *      otherwise:  return -3
 */
long t_combo_2_late(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x847;
        thread->fieldfc = 0x5;
        return 0x5;
    }

    if (token != 0x847)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_combo_exit);
}
