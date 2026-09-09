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
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x844;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token != 0x844)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_combo_2_late);
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
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x847;
        thread->fieldfc = 0x5;
        return 0x5;
    }

    if (token != 0x847)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_combo_exit);
}


/* a9_combo_ani -- armv7 0x00032d40, 44 bytes.  **Complete.**
 *
 *      r = obj->field40
 *      obj->field54 = r & 0xff
 *      n = (int32_t)(uint16_t)r >> 8
 *      obj->field40 = n
 *      if (n & 0x80) { obj->field40 = n & ~0x80; find_ani2_part_a14(obj) }
 *      else find_ani_part_a14(obj)
 *
 * **0x40 arrives packed and leaves unpacked.** The low byte is a rate and goes
 * to 0x54; bits 8 to 15 are an animation number and go back into 0x40. Bit 7 of
 * that number is not part of it -- it selects the second animation routine and
 * is stripped before the call, so a number with it set means "the other
 * lookup".
 *
 * The unpacked number is stored before the bit is tested, so on the second
 * path 0x40 is written twice. */
void find_ani_part_a14(MK3OBJ *obj);
void find_ani2_part_a14(MK3OBJ *obj);

void a9_combo_ani(MK3OBJ *obj)
{
    uint32_t packed = obj->field40;
    int32_t  n;

    obj->field54 = packed & 0xffu;
    n = (int32_t)(uint32_t)(uint16_t)packed >> 8;
    obj->field40 = (uint32_t)n;

    if ((n & 0x80) != 0) {
        obj->field40 = (uint32_t)(n & ~0x80);
        find_ani2_part_a14(obj);
    } else {
        find_ani_part_a14(obj);
    }
}

/* clear_combo_butn -- armv7 0x0003269c, 60 bytes.  **Complete.**
 *
 *      obj->field24 = 0
 *      base = G + 0x3d0 + obj->field00->field08 * 2
 *      *(uint16_t *)(base + 0x00) = 0
 *      *(uint16_t *)(base + 0x04) = 0
 *      *(uint16_t *)(base + 0x08) = 0
 *      *(uint16_t *)(base + 0x0c) = 0
 *      *(uint16_t *)(base + 0x10) = 0
 *      *(uint16_t *)(base + 0x14) = 0
 *      obj->field20 = base + 0x14
 *
 * **Six halfwords, four bytes apart, offset by two per player.** The stride is
 * a word but the writes are halfwords, and the base is shifted by the strength
 * index times two -- so player zero clears the low half of six consecutive
 * words and player one the high half. The same per-player packing the button
 * masks use, applied to storage instead of to constants.
 *
 * Every store reads obj->field24 back rather than reusing the zero register,
 * which is why the zero is written to 0x24 first. A leaf: no frame at all.
 *
 * 0x20 is left pointing at the LAST of the six, not past it. */
void clear_combo_butn(MK3OBJ *obj)
{
    char *base;

    obj->field24 = 0;
    base = G_BYTES + 0x3d0 + obj->field00->field08 * 2;

    *(uint16_t *)(base + 0x00) = (uint16_t)obj->field24;
    *(uint16_t *)(base + 0x04) = (uint16_t)obj->field24;
    *(uint16_t *)(base + 0x08) = (uint16_t)obj->field24;
    *(uint16_t *)(base + 0x0c) = (uint16_t)obj->field24;
    *(uint16_t *)(base + 0x10) = (uint16_t)obj->field24;
    *(uint16_t *)(base + 0x14) = (uint16_t)obj->field24;

    obj->field20 = (uint32_t)(uintptr_t)(base + 0x14);
}

/* t_comb8 -- armv7 0x00032918, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      ComboNum += 1
 *      frame[frame].handler = t_comb2
 *      frame[frame+1].w0 = 0
 *
 * The only thing it does besides installing is bump a global counter, read and
 * written straight through its own address. */
extern long ComboNum;                      /* 0x00165690 */
long t_comb2(MK3THREAD *thread);

long t_comb8(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    ComboNum += 1;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_comb2);
}

/* t_combo_exit -- armv7 0x00032d6c, 72 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = *(uint32_t *)((char *)obj->field48 + 0xc)
 *      a9_combo_ani(obj)
 *      frame[frame].handler = t_comb9
 *      frame[frame+1].w0 = 0
 *
 * **0x48 is a pointer here and its 0xc holds the packed word a9_combo_ani
 * unpacks.** So the combo's exit animation is not a constant in the routine: it
 * comes out of whatever structure 0x48 points at, four fields in, and is taken
 * apart into a rate and a number by the routine above. */
long t_comb9(MK3THREAD *thread);

long t_combo_exit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = *(uint32_t *)((char *)(void *)(uintptr_t)obj->field48
                                 + 0xc);
    a9_combo_ani(obj);
    return mk3_push_handler(thread, (MK3THREADFUNC)t_comb9);
}
