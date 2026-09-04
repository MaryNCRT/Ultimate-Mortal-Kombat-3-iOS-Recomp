/*
 * mkanimal.c -- gamecode/logic/mkanimal.c, decompiled.
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

long t_r_bat_bite(struct MK3THREAD *thread);

/* t_r_kitana_decap -- armv7 0x000a0c84, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_bat_bite
 *      frame[frame+1].w0 = 0
 */

long t_r_kitana_decap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_bat_bite);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_shake_ob_up(struct MK3THREAD *thread);
long t_wait_forever(struct MK3THREAD *thread);

/* t_head_pop_off -- armv7 0x000a0cb8, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_head_pop_off(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_spider_shake_jsrp -- armv7 0x000a0cec, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x6
 *      obj->field20 = 0x3
 *      obj->field24 = 0x10
 *      frame[frame].handler = t_shake_ob_up
 *      frame[frame+1].w0 = 0
 */

long t_spider_shake_jsrp(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x6;
    obj->field20 = 0x3;
    obj->field24 = 0x10;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_shake_ob_up);
}

/* --------------------------------------------------------------------
 * Straight-line leaves, read by tools/leaffn.py: stores, calls and
 * a return, with every instruction accounted for. It refuses
 * anything that branches, any return value it cannot prove, and any
 * value read from a field the function also writes -- that is a
 * saved value being put back, not a re-read.
 * -------------------------------------------------------------------- */

void send_code_a3(MK3OBJ *obj);

/* animality_tune -- armv7 0x000a0fe8, 16 bytes.  **Complete.**
 *
 *      obj->field28 = 0x3a
 *      send_code_a3(obj)
 */
void animality_tune(MK3OBJ *obj)
{
    obj->field28 = 0x3a;
    send_code_a3(obj);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_victory_animation(struct MK3THREAD *thread);
void death_blow_complete(MK3OBJ *obj);
void set_inviso(MK3OBJ *obj);
void shake_a11(MK3OBJ *obj);
void tsound_func(MK3OBJ *obj, uint32_t arg);

/* t_eaten_by_snake -- armv7 0x000a2f60, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      tsound_func(obj, 0x24)
 *      tsound_func(obj, 0x25)
 *      obj->field48 = 0xa000a
 *      shake_a11(obj)
 *      set_inviso(obj)
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_eaten_by_snake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    tsound_func(obj, 0x24);
    tsound_func(obj, 0x25);
    obj->field48 = 0xa000a;
    shake_a11(obj);
    set_inviso(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_animality_complete -- armv7 0x000a3050, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      death_blow_complete(obj)
 *      player_normpal(obj)
 *      frame[frame].handler = t_victory_animation
 *      frame[frame+1].w0 = 0
 */

long t_animality_complete(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    death_blow_complete(obj);
    player_normpal(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_victory_animation);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_backwards_ani(MK3THREAD *thread);

/* t_spider_shake -- armv7 0x000a0d30, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x713, then descend into t_spider_shake_jsrp
 *      token == 0x713:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_spider_shake(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x713;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_spider_shake_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x713)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_unmorph_and_exit -- armv7 0x000a0d98, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x5
 *          token := 0x836, then descend into t_backwards_ani
 *      token == 0x836:
 *          frame[frame].handler = t_animality_complete
 *      otherwise:  return -3
 */
long t_unmorph_and_exit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x5;
        *mk3_frame(thread, thread->frame + 1) = 0x836;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_backwards_ani;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x836)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_animality_complete);
}

/* tl_null_animal -- armv7 0x000a0e18, 76 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x8c3, duration 0x40)
 *      token == 0x8c3:
 *          frame[frame].handler = t_animality_complete
 *      otherwise:  return -3
 */
long tl_null_animal(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x8c3;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token != 0x8c3)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_animality_complete);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_flight(MK3THREAD *thread);
long t_land_on_my_back(MK3THREAD *thread);
long t_white_flash(MK3THREAD *thread);
long create_blood_proc(MK3OBJ *obj);
void create_fx(MK3OBJ *obj);
void death_scream(MK3OBJ *obj);

/* t_dino_bucked -- armv7 0x000a2b50, 184 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x1
 *          create_blood_proc(obj)
 *          obj->field48 = 0x60006
 *          shake_a11(obj)
 *          death_scream(obj)
 *          rsnd_func(obj, 0x3)
 *          obj->field1c = 0x30000
 *          obj->field20 = 0xffeb0000
 *          obj->field24 = 0x5000
 *          obj->field28 = 0x4
 *          obj->field40 = 0x1e
 *          token := 0x52f, then descend into t_flight
 *      token == 0x52f:
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_dino_bucked(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x1;
        create_blood_proc(obj);
        obj->field48 = 0x60006;
        shake_a11(obj);
        death_scream(obj);
        rsnd_func(obj, 0x3);
        obj->field1c = 0x30000;
        obj->field20 = 0xffeb0000;
        obj->field24 = 0x5000;
        obj->field28 = 0x4;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0x52f;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x52f)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* t_r_egg -- armv7 0x000a2fc0, 144 bytes.  **Complete.**
 *
 *      token == 0:
 *          death_scream(obj)
 *          set_inviso(obj)
 *          obj->field1c = 0x18
 *          create_fx(obj)
 *          token := 0x295, then descend into t_white_flash
 *      token == 0x295:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_r_egg(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        death_scream(obj);
        set_inviso(obj);
        obj->field1c = 0x18;
        create_fx(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x295;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_white_flash;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x295)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}
