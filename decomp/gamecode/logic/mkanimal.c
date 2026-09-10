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

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
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

    return mk3_install(thread, (MK3THREADFUNC)t_animality_complete);
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
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x8c3;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token != 0x8c3)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_animality_complete);
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

    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
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

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ------------------------------------------------------------ kill_and_stop_scrolling
 *
 * armv7 0x000a0fbc, 20 bytes.  **Complete.**
 *
 *      MKEvent_Add(1, 2, 0, obj->field00->field08)
 *
 * One event and nothing else. The fourth argument is the proc's 0x08 -- the
 * strength index, the player number -- so the event says which player it is about;
 * the first three are constants.
 */
void MKEvent_Add(long a, long b, long c, long d);

void kill_and_stop_scrolling(MK3OBJ *obj)
{
    MKEvent_Add(1, 2, 0, (long)obj->field00->field08);
}

/* --------------------------------------------------------------------- face_him_at_me
 *
 * armv7 0x000a0fd0, 24 bytes.  **Complete.**
 *
 *      obj->field1c = (uint32_t)face_opponent
 *      call_a0_for_him(obj)
 *
 * The A0 mechanism with nothing around it: put `face_opponent` in 0x1c and let
 * `call_a0_for_him` run it on the OTHER fighter. Same routine and same pointer slot
 * 0x000f3758 that tl_do_shake and tl_do_leg_throw hand across in mkstat.c, here as a
 * named one-line helper.
 */
void face_opponent(MK3OBJ *obj);                 /* pointer slot 0x000f3758 */
void call_a0_for_him(MK3OBJ *obj);

void face_him_at_me(MK3OBJ *obj)
{
    obj->field1c = (uint32_t)(uintptr_t)face_opponent;
    call_a0_for_him(obj);
}

/* -------------------------------------------------------------------- cutup_body_init
 *
 * armv7 0x000a1d2c, 24 bytes.  **Complete.**
 *
 *      death_scream(obj)
 *      obj->field08->field2c = obj->field08->field24 + delta
 *
 * **Two arguments.** The second arrives in r1 and is added to the part's 0x24 to
 * produce its 0x2c, so the caller supplies an offset from the character number --
 * 0x24 is the field every per-character table in this module indexes by. Only two of
 * the routines in these files take a second argument at all, and this is one.
 */
void death_scream(MK3OBJ *obj);

void cutup_body_init(MK3OBJ *obj, uint32_t delta)
{
    MK3OBJ *part;

    death_scream(obj);

    part = obj->field08;
    part->field2c = part->field24 + delta;
}

/* ----------------------------------------------------------------------- set_vel_flip
 *
 * armv7 0x000a3c28, 28 bytes.  **Complete.**
 *
 *      obj->field2c = obj->field08->field28
 *      if (obj->field2c & 0x10) obj->field1c = -obj->field1c
 *      set_x_vel_player(obj)
 *
 * **Bit 4 of the part's 0x28 mirrors the velocity.** 0x1c holds the speed the caller
 * wants; if that bit is set the sign is flipped before `set_x_vel_player` reads it, so
 * one caller can ask for "forwards" and get the right direction either way.
 *
 * The whole conditional is one `ittt ne` block -- three instructions predicated on the
 * `tst`, so there is no branch and 0x1c is left alone when the bit is clear.
 */
void set_x_vel_player(MK3OBJ *obj);

void set_vel_flip(MK3OBJ *obj)
{
    obj->field2c = obj->field08->field28;

    if ((obj->field2c & 0x10u) != 0)
        obj->field1c = (uint32_t)(-(int32_t)obj->field1c);

    set_x_vel_player(obj);
}


/* ------------------------------------------------------------------ create_fx_for_him
 *
 * armv7 0x000a115c, 32 bytes.  **Complete.**
 *
 *      saved_proc = obj->field00
 *      saved_part = obj->field08
 *      obj->field08 = saved_proc->him
 *      obj->field00 = saved_proc->field00->field00
 *      create_fx(obj)
 *      obj->field00 = saved_proc
 *      obj->field08 = saved_part
 *
 * **The swap-call-restore idiom on two fields at once.** `create_fx` works on
 * whatever obj->field00 and obj->field08 point at, so to make the effect happen at the
 * OTHER fighter this routine writes that fighter's proc and part into its own object,
 * calls, and puts both back. mkslam.c's `stick_him_with_me` does the same with one
 * field; this is the two-field version.
 *
 * The new proc comes through two hops -- `proc->field00->field00`, this proc's
 * opponent object and then that object's own proc -- while the part comes from
 * `proc->him` directly. So the two pointers are reached by different routes and the
 * routine does not assume they agree.
 */
void create_fx(MK3OBJ *obj);

void create_fx_for_him(MK3OBJ *obj)
{
    MK3OBJPROC *saved_proc = obj->field00;
    MK3OBJ     *saved_part = obj->field08;

    obj->field08 = (MK3OBJ *)(void *)(uintptr_t)saved_proc->him;
    obj->field00 = saved_proc->field00->field00;

    create_fx(obj);

    obj->field00 = saved_proc;
    obj->field08 = saved_part;
}

/* ---------------------------------------------------------------------- pengo_animate
 *
 * armv7 0x000a2c08, 32 bytes.  **Complete.**
 *
 *      next_anirate(obj)
 *      obj->field1c = obj->field00->field20
 *      if (obj->field1c == 1) rsnd_func(obj, 6)
 *
 * A sound on one exact frame. The proc's 0x20 is the animation counter, and sound 6
 * fires only on the pass where it reads 1 -- not above and not below -- so the noise
 * lands once per animation rather than once per frame.
 *
 * `next_lao_anirate` in mkstat.c is the same shape with its own counter in 0x44 and a
 * reload; this one has no counter of its own and rides the proc's.
 */
long next_anirate(MK3OBJ *obj);

void pengo_animate(MK3OBJ *obj)
{
    next_anirate(obj);

    obj->field1c = obj->field00->field20;
    if (obj->field1c == 1)
        rsnd_func(obj, 6);
}

/* --------------------------------------------------------------------------- ground_ob
 *
 * armv7 0x000a0f90, 44 bytes.  **Complete.**
 *
 *      obj->field1c = *(uint32_t *)(G + 0xac)
 *      obj->field20 = GetFrameHeight(target->field2c)
 *      obj->field1c = obj->field1c - obj->field20 - 9
 *      *(uint16_t *)((char *)target + 0x12) = obj->field1c
 *
 * **Two arguments, and it stands the second one on the floor.** The floor is the word
 * at G + 0xac, the height comes from `GetFrameHeight` on the target's 0x2c, and the
 * nine is a fixed inset. So the y written into the target's 0x12 is floor minus height
 * minus nine.
 *
 * This is the second routine in the module to read G + 0xac: mkstat.c's
 * `t_turn_into_a_baby` does the same placement but takes its height from
 * `mk3_getbbox` instead of `GetFrameHeight`, and uses no inset. Two ways to measure
 * the same thing, in two files.
 */
int GetFrameHeight(uint32_t ani);

void ground_ob(MK3OBJ *obj, MK3OBJ *target)
{
    obj->field1c = *(uint32_t *)(G_BYTES + 0xac);
    obj->field20 = (uint32_t)GetFrameHeight(target->field2c);
    obj->field1c = obj->field1c - obj->field20 - 9;

    MK3_SET_FIELD12(target, obj->field1c);
}

/* ----------------------------------------------------------------------------- q_bat_1
 *
 * armv7 0x000a359c, 32 bytes.  **Complete.**
 *
 *      get_x_dist(obj)
 *      if (obj->field28 > 0xff) q_yes(obj); else q_no(obj)
 *
 * A distance predicate in the q_ family: it answers in 0x5c through `q_yes` / `q_no`
 * like every other one, and the question is "is the opponent more than 255 away".
 */
long get_x_dist(MK3OBJ *obj);
void distance_off_ground(MK3OBJ *obj);
void q_yes(MK3OBJ *obj);
void q_no(MK3OBJ *obj);

void q_bat_1(MK3OBJ *obj)
{
    get_x_dist(obj);

    if ((long)obj->field28 > 0xff)
        q_yes(obj);
    else
        q_no(obj);
}

/* ----------------------------------------------------------------------------- q_bat_2
 *
 * armv7 0x000a35bc, 32 bytes.  **Complete.**
 *
 *      get_x_dist(obj)
 *      if (obj->field28 <= 0x20) q_yes(obj); else q_no(obj)
 *
 * The near test to q_bat_1's far one -- thirty-two or closer.
 */
void q_bat_2(MK3OBJ *obj)
{
    get_x_dist(obj);

    if ((long)obj->field28 <= 0x20)
        q_yes(obj);
    else
        q_no(obj);
}

/* ----------------------------------------------------------------------------- q_bat_3
 *
 * armv7 0x000a35dc, 32 bytes.  **Complete.**
 *
 * **The same routine as q_bat_1, instruction for instruction.** The two differ only in
 * their pc-relative displacements -- three bytes, at offsets 8, 0x14 and 0x1c, being
 * the `bgt` and the two `bl` encodings shifted by the 0x40 between them. Same call,
 * same field, same threshold of 0xff, same answer.
 *
 * Checked by comparing the two byte ranges rather than assumed from reading them: the
 * ranges are NOT identical, and it would have been wrong to say so. What is identical
 * is the behaviour.
 */
void q_bat_3(MK3OBJ *obj)
{
    get_x_dist(obj);

    if ((long)obj->field28 > 0xff)
        q_yes(obj);
    else
        q_no(obj);
}

/* ----------------------------------------------------------------------------- q_bat_4
 *
 * armv7 0x000a35fc, 32 bytes.  **Complete.**
 *
 *      distance_off_ground(obj)
 *      if (obj->field1c <= 3) q_yes(obj); else q_no(obj)
 *
 * **The odd one of the four**: a different call, a different field and a vertical
 * question. `distance_off_ground` answers in 0x1c where `get_x_dist` answers in 0x28,
 * so the three horizontal predicates and this one do not share a slot -- which is why
 * they cannot be collapsed into one parameterised helper.
 */
void q_bat_4(MK3OBJ *obj)
{
    distance_off_ground(obj);

    if ((long)obj->field1c <= 3)
        q_yes(obj);
    else
        q_no(obj);
}


/* ------------------------------------------------------------------------ t_kitty_spin
 *
 * armv7 0x000a0c44, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = obj->field48
 *      obj->field1c = 3
 *      frame[frame].handler = t_mframew
 *
 * Two stores and an install. 0x48 is where the caller left the animation and 0x40 is
 * where the animation routines read it from, so the whole routine is a move between
 * the two plus a three-frame wait.
 */
long t_mframew(MK3THREAD *thread);

long t_kitty_spin(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = obj->field48;
    obj->field1c = 3;

    return mk3_install(thread, (MK3THREADFUNC)t_mframew);
}

/* ------------------------------------------------------------------------ t_odor_proc
 *
 * armv7 0x000a0bd4, 112 bytes.  **Complete.**
 *
 *      token == 0:      obj->field08->field2c = 0x11c0
 *                       obj->field48 = 0x3c
 *                       token := 0x216, park 2
 *
 *      token == 0x216:  if (--obj->field48 != 0) token := 0x216, park 2
 *                       frame[frame].handler = t_wait_forever
 *
 *      otherwise:       return -3
 *
 * Sixty passes, two frames apart -- a hundred and twenty frames of smell -- and then
 * t_wait_forever. The animation for it goes into the part's 0x2c as a single constant,
 * 0x11c0, with no table lookup, so the odour looks the same whoever produced it.
 */
long t_wait_forever(MK3THREAD *thread);

long t_odor_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field08->field2c = 0x11c0;
        obj->field48 = 0x3c;

    } else if (token == 0x216) {
        obj->field48 = obj->field48 - 1;
        if (obj->field48 == 0)
            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x216;
    thread->fieldfc = 2;
    return 2;
}

/* --------------------------------------------------------------------- t_crunch_sounds
 *
 * armv7 0x000a10e8, 116 bytes.  **Complete.**
 *
 *      token == 0:      obj->a10 = 6
 *      the pair:        tsound_func(obj, 0x24)
 *                       tsound_func(obj, 0x25)
 *                       token := 0x3d2, park 0x10
 *
 *      token == 0x3d2:  if (--obj->a10 > 0) -- back to the pair --
 *                       token := 0x3d6, park 0x16462
 *
 *      otherwise:       return -3
 *
 * **Two sounds together, six times, sixteen frames apart.** 0x24 and 0x25 are always
 * played as a pair with nothing between them, so they are one noise made of two
 * samples rather than two events.
 *
 * **Token 0x3d6 is not in the dispatch.** Reaching it would return -3, and it is safe
 * for the same reason it is safe in mkstat.c's `t_jade_flash_proc`: the park is
 * 0x16462, the never-wake duration, so the state is a terminator and never runs. That
 * is the second site for this pattern, which makes it an idiom rather than an oversight.
 */
long t_crunch_sounds(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 6;

    } else if (token == 0x3d2) {
        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x3d6;
            thread->fieldfc = 0x16462;
            return 0x16462;
        }

    } else {
        return -3;
    }

    tsound_func(obj, 0x24);
    tsound_func(obj, 0x25);

    *mk3_frame(thread, thread->frame + 1) = 0x3d2;
    thread->fieldfc = 0x10;
    return 0x10;
}


/* --------------------------------------------------------------------- t_r_ermac_upcut
 *
 * armv7 0x000a2a68, 116 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x00080008; shake_a11(obj)
 *      rsnd_func(obj, 0xa)
 *      obj->field1c = 1; create_blood_proc(obj)
 *      cutup_body_init(obj, 0x1af4)
 *      obj->field1c = 0x10000
 *      obj->field20 = 0x10000 - 0x90000 = -0x80000
 *      frame[frame].handler = t_head_pop_off
 *
 * The victim's side of an Ermac uppercut animality: shake, sound, blood, and then the
 * body is cut up and the head sent off through `t_head_pop_off`, which is written
 * earlier in this file.
 *
 * **This is the caller that shows what `cutup_body_init`'s second argument is for.**
 * 0x1af4 is added to the part's character number to give its 0x2c, so the offset picks
 * a body-pieces animation set and the character number picks the entry within it.
 *
 * 0x48 is the shake magnitude again, 0x00080008 -- a doubled pair, like most of them.
 */
void shake_a11(MK3OBJ *obj);
long create_blood_proc(MK3OBJ *obj);
void cutup_body_init(MK3OBJ *obj, uint32_t delta);
long t_head_pop_off(MK3THREAD *thread);

long t_r_ermac_upcut(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x00080008;
    shake_a11(obj);
    rsnd_func(obj, 0xa);

    obj->field1c = 1;
    create_blood_proc(obj);

    cutup_body_init(obj, 0x1af4);

    obj->field1c = 0x10000;
    obj->field20 = (uint32_t)(0x10000 - 0x90000);

    return mk3_install(thread, (MK3THREADFUNC)t_head_pop_off);
}

/* ------------------------------------------------------------------ t_next_anirate_a10
 *
 * armv7 0x000a1220, 128 bytes.  **Complete.**
 *
 *      token == 0:      token := 0x819, park 1
 *
 *      token == 0x819:  next_anirate(obj)
 *                       if (--obj->a10 > 0) token := 0x819, park 1
 *                       pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **A generic "step the animation rate for 0x44 frames" helper**, with the count
 * supplied by the caller in 0x44 and nothing else of its own. State 0 does no work at
 * all -- it exists only to get the thread onto the one-frame cadence.
 *
 * The two paths that write the token share one store site, entered with the frame
 * index either loaded at entry or reloaded after the decrement, which is why the
 * `ldrgt` sits inside the `it gt` block rather than after the branch.
 */
long t_local_reaction_exit(MK3THREAD *thread);

long t_next_anirate_a10(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x819) {
        next_anirate(obj);

        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0) {
            if ((long)thread->frame > 0) {
                thread->frame = thread->frame - 1;
                return 0;
            }
            return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
        }

    } else if (token != 0) {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x819;
    thread->fieldfc = 1;
    return 1;
}


/* ------------------------------------------------------------------ t_animate_till_a11
 *
 * armv7 0x000a12a0, 148 bytes.  **Complete.**
 *
 *      token == 0:      token := 0x572, park 1
 *
 *      token == 0x572:  next_anirate(obj)
 *                       ((void (*)(MK3OBJ *))obj->field48)(obj)
 *                       if (obj->field5c != 0)
 *                           pop a level, or t_local_reaction_exit
 *                       frame[frame].handler = t_animate_till_a11
 *
 *      otherwise:       return -3
 *
 * **0x48 holds a PREDICATE and this routine calls it through the register.**
 * `ldr r3, [r5, #0x48]; blx r3` -- so the caller puts a function there, and every frame
 * this steps the animation rate, calls it, and looks at 0x5c. A set answer ends the
 * loop; a clear one goes round again.
 *
 * **That is what the four `q_bat_*` routines are for.** They take an object, ask a
 * distance question, and answer in 0x5c through `q_yes` / `q_no` -- exactly the shape
 * this expects. So an animality animates until whichever predicate the caller chose
 * says yes, and the predicate is a parameter rather than a branch.
 *
 * The loop reinstalls ITSELF, which restarts it at state 0 and its one-frame park --
 * the same shape mkstat.c's `t_shake_suspended` and `t_noogy_suspended` use, and the
 * same warning applies: this is not "resume at 0x572".
 *
 * 0x48 is a counter in most of this module, a ring pointer in `t_combo_air_pause`, and
 * a function pointer here. The state decides, not the field.
 */
long t_animate_till_a11(MK3THREAD *thread);

long t_animate_till_a11(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x572;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x572)
        return -3;

    next_anirate(obj);

    ((void (*)(MK3OBJ *))(void *)(uintptr_t)obj->field48)(obj);

    if (obj->field5c != 0) {
        if ((long)thread->frame > 0) {
            thread->frame = thread->frame - 1;
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    return mk3_install(thread, (MK3THREADFUNC)t_animate_till_a11);
}

/* ------------------------------------------------------------- t_animate_till_a11_stop
 *
 * armv7 0x000a14f0, 136 bytes.  **Complete.**
 *
 *      token == 0:      token := 0x57b, descend into t_animate_till_a11
 *
 *      token == 0x57b:  stop_me_player(obj)
 *                       pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * The wrapper: run the loop above and stop the fighter when it ends. Nothing else --
 * so a caller that wants the animation to leave the fighter moving installs
 * `t_animate_till_a11` and one that wants it halted installs this.
 */
void stop_me_player(MK3OBJ *obj);

long t_animate_till_a11_stop(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x57b;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_till_a11;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x57b)
        return -3;

    stop_me_player(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ---------------------------------------------------------------------- t_do_animality
 *
 * armv7 0x000a0f0c, 132 bytes.  **Complete.**
 *
 *      token == 0:      token := 0x8fb, descend into t_animality_start_pause
 *
 *      token == 0x8fb:  init_special(obj)
 *                       h = ochar_animalities[obj->field08->field24]
 *                       obj->field1c = h
 *                       frame[frame].handler = h
 *
 *      otherwise:       return -3
 *
 * **The entry point for every animality in this file, and the table is the whole
 * routine.** `ochar_animalities` is words indexed by the character number, and whatever
 * it names is installed directly -- so the twenty-odd `tl_*` routines in this module are
 * reached from here and nowhere else.
 *
 * **This is the handler DoASpecial reaches through pointer slot 0x000f31ac.** So the
 * path from a player's input to a character's animality is: DoASpecial's finisher
 * dispatch picks `t_do_animality`, that pauses, then indexes this table. Three tables in
 * three files, each indexed by the character, and this is the last of them.
 *
 * The same shape as `t_do_body_slam` and `t_do_air_slam` in mkslam.c -- one lookup and
 * one install -- except those two return early on a zero entry and this one does not
 * check, so every character must have an entry.
 */
extern uint32_t ochar_animalities[];             /* 0x0017758c */
void init_special(MK3OBJ *obj);
long t_animality_start_pause(MK3THREAD *thread);

long t_do_animality(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);
    uint32_t h;

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x8fb;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animality_start_pause;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x8fb)
        return -3;

    init_special(obj);

    h = ochar_animalities[obj->field08->field24];
    obj->field1c = h;

    mk3_frame(thread, thread->frame)[1] = h;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* ---------------------------------------------------------------------- t_animal_morph
 *
 * armv7 0x000a0ff8, 240 bytes.  **Complete.**
 *
 *      token == 0:      token := 0x840, park 0x20
 *
 *      token == 0x840:  do_next_a9_frame(obj)
 *                       token := 0x848, park 0x10
 *
 *      token == 0x848:  tsound_func(obj, 0x27)
 *                       obj->field1c = 5
 *                       token := 0x84c, descend into t_mframew
 *
 *      token == 0x84c:  obj->field1c = obj->a10
 *                       token := 0x84f, park obj->field1c
 *
 *      token == 0x84f:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * The transformation itself: thirty-two frames, one hand-advanced frame, sixteen more,
 * the morph sound and a five-frame wait, and then **a final wait the caller chooses** --
 * 0x44 is read into 0x1c and used as the park, so each animal can hold its new shape for
 * a different length before the thread unwinds.
 *
 * State 0 does no work at all beyond setting the token, which is the same
 * get-onto-the-cadence pattern `t_next_anirate_a10` opens with.
 */
long do_next_a9_frame(MK3OBJ *obj);

long t_animal_morph(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x840;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (token == 0x840) {
        do_next_a9_frame(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x848;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token == 0x848) {
        tsound_func(obj, 0x27);
        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x84c;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x84c) {
        obj->field1c = obj->a10;
        *mk3_frame(thread, thread->frame + 1) = 0x84f;
        thread->fieldfc = obj->field1c;
        return (long)obj->field1c;
    }

    if (token != 0x84f)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* -------------------------------------------------------------- t_animality_start_pause
 *
 * armv7 0x000a0e64, 168 bytes.  **Complete.**
 *
 *      token == 0:      obj->field20 = 3
 *                       token := 0x8ec, descend into t_init_death_blow
 *
 *      token == 0x8ec:  token := 0x8ed, park 0x1e
 *
 *      token == 0x8ed:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **The twin of mkstat.c's `t_baby_start_pause`, and reading the two together says what
 * 0x20 is for.** Both write a small constant into 0x20 and then descend into the same
 * `t_init_death_blow` off pointer slot 0x000f3194: this one writes 3, the babality one
 * writes 5. So **the death-blow routine is shared by every finisher kind and 0x20 is the
 * kind selector** -- the routine is not per-fatality, the number is.
 *
 * After the death blow this waits thirty frames and unwinds. `t_do_animality` descends
 * into this and then indexes `ochar_animalities`, so the wait is what separates the
 * killing blow from the animal appearing.
 *
 * The babality version poses animation zero by hand in its middle state where this one
 * only waits, which is the whole difference between the two beyond the constant.
 */
long t_init_death_blow(MK3THREAD *thread);        /* pointer slot 0x000f3194 */

long t_animality_start_pause(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x8ec) {
        *mk3_frame(thread, frame + 1) = 0x8ed;
        thread->fieldfc = 0x1e;
        return 0x1e;
    }

    if (token == 0x8ed) {
        if ((long)frame > 0) {
            thread->frame = frame - 1;
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (token != 0)
        return -3;

    obj->field20 = 3;

    *mk3_frame(thread, thread->frame + 1) = 0x8ec;
    thread->frame = thread->frame + 1;              /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_init_death_blow;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* --------------------------------------------------------------- t_cute_animality_start
 *
 * armv7 0x000a117c, 164 bytes.  **Complete.**
 *
 *      token == 0:      face_opponent(obj)
 *                       animality_tune(obj)
 *                       token := 0x3c0, park 0x20
 *
 *      token == 0x3c0:  tsound_func(obj, 0x8c)
 *                       obj->a10 = obj->field3c
 *                       obj->field1c = 0x1e
 *                       create_fx(obj)
 *                       token := 0x3c5, park 8
 *
 *      token == 0x3c5:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **The other opening**, used by the animalities that appear in a puff rather than by
 * morphing: turn to face the opponent, start the animality music, wait thirty-two
 * frames, then a sound, effect 0x1e, and eight more frames.
 *
 * `obj->a10 = obj->field3c` is copied immediately before `create_fx`, so 0x44 is an
 * argument to the effect and 0x3c is where the caller left it. `create_fx_for_him`
 * earlier in this file shows the other half of that interface -- 0x00 and 0x08 select
 * whose effect it is, 0x1c its kind, 0x44 its parameter.
 *
 * This does NOT go through `t_init_death_blow` the way `t_animality_start_pause` does, so
 * the two openings are alternatives and not stages: one kills first, this one does not.
 */
long t_cute_animality_start(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x3c0) {
        tsound_func(obj, 0x8c);

        obj->a10 = obj->field3c;
        obj->field1c = 0x1e;
        create_fx(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x3c5;
        thread->fieldfc = 8;
        return 8;
    }

    if (token == 0x3c5) {
        if ((long)frame > 0) {
            thread->frame = frame - 1;
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (token != 0)
        return -3;

    face_opponent(obj);
    animality_tune(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x3c0;
    thread->fieldfc = 0x20;
    return 0x20;
}

/* ------------------------------------------------------------------------ t_r_bat_bite
 *
 * armv7 0x000a2adc, 116 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x00060008; shake_a11(obj)
 *      rsnd_func(obj, 3)
 *      obj->field1c = 1; create_blood_proc(obj)
 *      cutup_body_init(obj, 0x1ab8)
 *      obj->field1c = 0x10000
 *      obj->field20 = 0x10000 - 0x30000 = -0x20000
 *      frame[frame].handler = t_head_pop_off
 *
 * **The same five steps as `t_r_ermac_upcut`, with every constant changed.** Reading the
 * pair gives the whole parameter set of a decapitation:
 *
 *      routine            shake        sound   cutup delta   x vel     y vel
 *      t_r_ermac_upcut    0x00080008   0xa     0x1af4        0x10000   -0x80000
 *      t_r_bat_bite       0x00060008   3       0x1ab8        0x10000   -0x20000
 *
 * So the two differ in how hard the screen shakes, which noise is made, which set of
 * body pieces is used, and how high the head goes -- and in nothing else. The bat throws
 * the head a quarter as high as the uppercut does, which is what you would expect from a
 * bite rather than a punch.
 *
 * **0x48 here is an asymmetric pair, 6 and 8.** That is a third asymmetric site for the
 * shake halfwords, after mkstat.c's 0x00030008 and 0x0009000e, so the two halves are
 * definitely independent and this is not a doubled constant.
 */
long t_r_bat_bite(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x00060008;
    shake_a11(obj);
    rsnd_func(obj, 3);

    obj->field1c = 1;
    create_blood_proc(obj);

    cutup_body_init(obj, 0x1ab8);

    obj->field1c = 0x10000;
    obj->field20 = (uint32_t)(0x10000 - 0x30000);

    return mk3_install(thread, (MK3THREADFUNC)t_head_pop_off);
}

/* ---------------------------------------------------------------------- t_stung_a_bunch
 *
 * armv7 0x000a1cac, 128 bytes.  **Complete.**
 *
 *      token == 0:      token := 0x662, park 8
 *
 *      token == 0x662:  death_scream(obj)
 *                       -- falls through --
 *
 *      token == 0x666:  obj->field40 = 0x0003001c
 *                       token := 0x666, descend into t_animate_a9
 *
 *      otherwise:       return -3
 *
 * **A loop with no exit.** The 0x666 state sets the token back to 0x666 before descending,
 * so when the child animation finishes and pops, this state runs again, sets 0x40 again,
 * and descends again -- forever, until something outside the thread replaces the handler.
 * Which is the correct behaviour for a scorpion animality: the stinging does not stop, the
 * round ending is what stops it.
 *
 * **0x662 falls through into 0x666 rather than branching to its own tail**, so the scream
 * happens once and the animation from then on is identical. One `beq` to 0xa1cde and the
 * next instruction after the call is the 0x666 entry at 0xa1ce4.
 *
 * 0x40 is the packed halfword pair again -- animation 0x1c at rate 3 -- handed to
 * `t_animate_a9` off pointer slot 0x000f36d0. Seventh site for that pair, and the first
 * one in this module.
 */
long t_animate_a9(MK3THREAD *thread);           /* pointer slot 0x000f36d0 */

long t_stung_a_bunch(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        *mk3_frame(thread, frame + 1) = 0x662;
        thread->fieldfc = 8;
        return 8;
    }

    if (token == 0x662) {
        death_scream(obj);

    } else if (token != 0x666) {
        return -3;
    }

    obj->field40 = 0x0003001c;

    *mk3_frame(thread, thread->frame + 1) = 0x666;
    thread->frame = thread->frame + 1;              /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_animate_a9;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* ----------------------------------------------------------------------- t_bit_in_half
 *
 * armv7 0x000a29e0, 136 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x00060006; shake_a11(obj)
 *      death_scream(obj)
 *      rsnd_func(obj, 3)
 *      obj->field1c = 8; create_blood_proc(obj)
 *      p = &lao_ani_data[0x142c + obj->field08->field24 * 4]
 *      obj->field1c = p
 *      obj->field40 = p
 *      do_next_a9_frame(obj)
 *      frame[frame].handler = t_wait_forever
 *
 * **The third decapitation-shaped reaction, and the one that does not use
 * `cutup_body_init`.** Instead of handing the body to the pieces machinery it computes an
 * ADDRESS -- 0x142c into `lao_ani_data`, indexed by the character number -- and puts it in
 * both 0x1c and 0x40, then advances one frame by hand and waits forever.
 *
 * 0x142c is an offset INSIDE `lao_ani_data` (the symbol runs from 0x00155200 to the next
 * one, `lia_ani_data`, at 0x001567a0), so the table this indexes has no symbol of its own.
 * The computed address is 0x0015662c + char*4.
 *
 * **That confirms the pointer reading of 0x40**: `do_next_a9_frame` dereferences it twice
 * and steps it by four, so what goes in is the address of a per-character word list, not
 * an animation number. Same field, and `t_stung_a_bunch` two functions up puts a packed
 * halfword pair in it -- the caller and the callee agree, the field does not care.
 *
 * The shake pair is 0x00060006, doubled, where `t_r_bat_bite` uses 0x00060008. So the bite
 * that cuts a fighter in half shakes less than the bite that takes the head off.
 */
extern uint8_t lao_ani_data[];                   /* 0x00155200, pointer slot 0x000f3460 */

long t_bit_in_half(MK3THREAD *thread)
{
    MK3OBJ   *obj = (MK3OBJ *)thread->proc;
    uint32_t  p;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x00060006;
    shake_a11(obj);
    death_scream(obj);
    rsnd_func(obj, 3);

    obj->field1c = 8;
    create_blood_proc(obj);

    p = (uint32_t)(uintptr_t)&lao_ani_data[0x142c + obj->field08->field24 * 4];
    obj->field1c = p;
    obj->field40 = p;
    do_next_a9_frame(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* --------------------------------------------------------------------- t_eaten_by_shark
 *
 * armv7 0x000a1d44, 152 bytes.  **Complete.**
 *
 *      token == 0:      death_scream(obj)
 *                       obj->field1c = 0x20; create_fx(obj)
 *                       token := 0x453, park 2
 *
 *      token == 0x453:  obj->field1c = 0x20; create_fx(obj)
 *                       token := 0x456, park 2
 *
 *      token == 0x456:  obj->field1c = 0x20; create_fx(obj)
 *                       frame[frame].handler = t_eaten_by_snake
 *
 *      otherwise:       return -3
 *
 * **Effect 0x20 three times, two frames apart, and then it becomes a different routine.**
 * The three states are identical except for what they do next, so the bites are one
 * repeated event rather than three different ones -- but they are written out three times
 * with three tokens instead of counting, because the third one has to install rather than
 * park.
 *
 * **The install target is `t_eaten_by_snake`**, taken as a direct pc-relative address
 * rather than through a pointer slot. So the shark reaction runs the snake reaction's tail
 * -- the swallowing is shared and only the three bites are the shark's. That is worth
 * knowing before writing `t_eaten_by_snake`: it has to work as both an entry point and a
 * continuation.
 *
 * Only state 0 screams. The two later effects are silent.
 */
long t_eaten_by_snake(MK3THREAD *thread);        /* 0x000a2f60 */

long t_eaten_by_shark(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x453) {
        obj->field1c = 0x20;
        create_fx(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x456;
        thread->fieldfc = 2;
        return 2;
    }

    if (token == 0x456) {
        obj->field1c = 0x20;
        create_fx(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_eaten_by_snake);
    }

    if (token != 0)
        return -3;

    death_scream(obj);

    obj->field1c = 0x20;
    create_fx(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x453;
    thread->fieldfc = 2;
    return 2;
}

/* ------------------------------------------------------------------------- t_egg_proc
 *
 * armv7 0x000a1440, 176 bytes.  **Complete.**
 *
 *      token == 0:      obj->field08->field2c = 0xb08
 *                       obj->field40 = a_egg
 *                       obj->field1c = 5
 *                       token := 0x2a8, descend into t_mframew
 *
 *      token == 0x2a8:  token := 0x2aa, park 0x20
 *
 *      token == 0x2aa:  obj->field38 = t_r_egg
 *                       takeover_him(obj)
 *                       token := 0x2ad, park 0x16462
 *
 *      otherwise:       return -3
 *
 * **The egg's own thread.** It sets the part's animation to 0xb08, points 0x40 at the
 * named word list `a_egg` (0x00177558 -- one of the few of these tables with a symbol of
 * its own), waits five frames' worth through `t_mframew`, waits thirty-two more, and then
 * hands `t_r_egg` to the other fighter through 0x38 and `takeover_him`.
 *
 * So the egg does not hatch by running code of its own: it makes the VICTIM's thread run
 * `t_r_egg`, which is written earlier in this file, and then parks itself forever.
 *
 * **Token 0x2ad is not in the dispatch and the park is 0x16462.** Third site for that
 * pattern, after mkstat.c's `t_jade_flash_proc` and `t_crunch_sounds` in this file -- and
 * the first one where the reason is plainly visible: after the handover this thread has
 * nothing left to do, and parking forever is cheaper than unwinding.
 */
extern uint32_t a_egg[];                         /* 0x00177558 */
void takeover_him(MK3OBJ *obj);

long t_egg_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x2a8) {
        *mk3_frame(thread, frame + 1) = 0x2aa;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (token == 0x2aa) {
        obj->field38 = (uint32_t)(uintptr_t)t_r_egg;
        takeover_him(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x2ad;
        thread->fieldfc = 0x16462;
        return 0x16462;
    }

    if (token != 0)
        return -3;

    obj->field08->field2c = 0xb08;
    obj->field40 = (uint32_t)(uintptr_t)a_egg;
    obj->field1c = 5;

    *mk3_frame(thread, thread->frame + 1) = 0x2a8;
    thread->frame = thread->frame + 1;              /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* ----------------------------------------------------------------------- t_hit_by_bull
 *
 * armv7 0x000a3284, 208 bytes.  **Complete.**
 *
 *      token == 0:      obj->field1c = 1; create_blood_proc(obj)
 *                       obj->field48 = 0x00060006; shake_a11(obj)
 *                       death_scream(obj)
 *                       rsnd_func(obj, 3)
 *                       set_noedge(obj)
 *                       obj->field1c = 0x130000; away_x_vel(obj)
 *                       obj->field08->field18 = obj->field1c
 *                       obj->field1c = 0xd
 *                       obj->field20 = 0xfff80000
 *                       obj->field24 = 0xfff80000 + 0x86000 = 0x00006000
 *                       obj->field28 = 4
 *                       obj->field40 = 0x1e
 *                       token := 0x632, descend into t_flight
 *
 *      token == 0x632:  frame[frame].handler = t_land_on_my_back
 *
 *      otherwise:       return -3
 *
 * **The twin of `t_dino_bucked` earlier in this file**, and reading the two together
 * separates the fixed part of a knock-into-the-air from the per-animal part:
 *
 *      routine           x vel      0x20 (y vel)   0x24 (fall)   0x28   0x40
 *      t_dino_bucked     0x30000    0xffeb0000     0x5000        4      0x1e
 *      t_hit_by_bull     0xd        0xfff80000     0x6000        4      0x1e
 *
 * The blood, the shake pair, the scream and sound 3 are identical; the bounce kind and the
 * animation are identical; only the three velocities differ. So `t_flight` takes five
 * numbers and everything else is shared.
 *
 * **The 0x24 store wraps 32 bits and that is not a transcription slip.** The literal is
 * 0xfff80000, the instruction is `add.w r3, r3, #0x86000`, and the sum 0x100006000 is
 * truncated by the register to 0x00006000. Writing it out as an addition keeps the binary's
 * arithmetic; writing 0x6000 directly would hide that 0x20 and 0x24 are computed from one
 * literal and not two.
 *
 * The bull is also the only one of the pair to call `set_noedge` and `away_x_vel`, and to
 * copy the resulting x velocity into the part's 0x18 -- so the victim is pushed away from
 * the bull rather than in a fixed direction, and the screen is allowed to let them leave.
 */
void set_noedge(MK3OBJ *obj);
void away_x_vel(MK3OBJ *obj);

long t_hit_by_bull(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 1;
        create_blood_proc(obj);

        obj->field48 = 0x00060006;
        shake_a11(obj);
        death_scream(obj);
        rsnd_func(obj, 3);
        set_noedge(obj);

        obj->field1c = 0x130000;
        away_x_vel(obj);
        obj->field08->field18 = obj->field1c;

        obj->field1c = 0xd;
        obj->field20 = 0xfff80000u;
        obj->field24 = 0xfff80000u + 0x86000u;      /* wraps to 0x00006000 */
        obj->field28 = 4;
        obj->field40 = 0x1e;

        *mk3_frame(thread, thread->frame + 1) = 0x632;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x632)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* -------------------------------------------------------------------------- t_r_rabbit
 *
 * armv7 0x000a3c44, 220 bytes.  **Complete.**
 *
 *      token == 0:      obj->field40 = 0x20; find_ani_part2(obj)
 *                       obj->field1c = 4; init_anirate(obj)
 *                       set_noedge(obj)
 *                       death_scream(obj)
 *                       face_opponent(obj)
 *                       obj->field1c = 0x30000; away_x_vel(obj)
 *                       NewThread(obj, t_crunch_sounds)
 *                       obj->a10 = 0x140
 *                       obj->field1c = 1
 *                       -- falls through to the tail --
 *
 *      token == 0x3eb:  next_anirate(obj)
 *                       obj->field1c = obj->field00->field28 - 1
 *                       if (obj->field1c == 0) {
 *                           obj->field1c = 5; create_blood_proc(obj)
 *                           obj->field1c = 5
 *                       }
 *                       if (--obj->a10 <= 0) {
 *                           stop_me_player(obj)
 *                           frame[frame].handler = t_wait_forever
 *                       }
 *                       -- falls through to the tail --
 *
 *      the tail:        obj->field00->field28 = obj->field1c
 *                       token := 0x3eb, park 1
 *
 *      otherwise:       return -3
 *
 * **Two counters that work differently, and one shared store.** `obj->a10` counts 0x140 --
 * three hundred and twenty frames -- straight down, and ends the routine. `proc->field28`
 * counts down too, but the tail RELOADS it from 0x1c every frame, so what 0x1c holds is
 * the reload value: state 0 leaves 1 there, so the first pass of 0x3eb sees zero and draws
 * blood, and each blood then sets 0x1c to 5, so blood comes every fifth frame after that.
 * A repeating interval built out of one countdown and one store, with no second field.
 *
 * **This is a second reading of `proc->field28`.** The header describes it as who the shake
 * is about, on the authority of the two shake routines that write `him` or the object's
 * 0x08 there. Here it is a frame counter. Nothing in this routine settles which reading is
 * the field's real purpose, so both stand; what is certain is that this one writes and
 * reads it as a number of frames.
 *
 * `create_blood_proc` clobbers 0x1c, which is why 5 is stored twice around the call -- once
 * as the effect's own argument and once to survive it. Not dead code.
 *
 * **The crunching is a separate thread.** `NewThread(obj, t_crunch_sounds)` starts the
 * routine written earlier in this file, so the six pairs of crunches run on their own
 * cadence while this loop draws blood on its own. Two independent timelines rather than one
 * interleaved state machine -- and it explains why `t_crunch_sounds` needed a never-wake
 * terminator instead of a way to unwind.
 */
void find_ani_part2(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
MK3THREAD *NewThread(void *owner, MK3THREADFUNC func);

long t_r_rabbit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x20;
        find_ani_part2(obj);

        obj->field1c = 4;
        init_anirate(obj);
        set_noedge(obj);
        death_scream(obj);
        face_opponent(obj);

        obj->field1c = 0x30000;
        away_x_vel(obj);

        NewThread(obj, (MK3THREADFUNC)t_crunch_sounds);

        obj->a10 = 0x140;
        obj->field1c = 1;

    } else if (token == 0x3eb) {
        next_anirate(obj);

        obj->field1c = obj->field00->field28 - 1;
        if (obj->field1c == 0) {
            obj->field1c = 5;
            create_blood_proc(obj);
            obj->field1c = 5;
        }

        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0) {
            stop_me_player(obj);
            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
        }

    } else {
        return -3;
    }

    obj->field00->field28 = obj->field1c;

    *mk3_frame(thread, thread->frame + 1) = 0x3eb;
    thread->fieldfc = 1;
    return 1;
}

/* ------------------------------------------------------------------ t_stung_by_scorpion
 *
 * armv7 0x000a361c, 292 bytes.  **Complete.**
 *
 *      token == 0:      face_opponent(obj)
 *                       obj->field1c = 0x40000; away_x_vel(obj)
 *                       rsnd_func(obj, 3)
 *                       obj->field1c = 2; group_sound(obj)
 *                       obj->field40 = 0x00050020
 *                       token := 0x4fa, descend into t_animate_a9
 *
 *      token == 0x4fa:  stop_me_player(obj)
 *                       death_scream(obj)
 *                       obj->field40 = 0x48; pose_a9_manual(obj)
 *                       player_swpal(obj, 3)
 *                       obj->field1c = 3
 *                       obj->field20 = 3
 *                       obj->field24 = 3 + 0x11 = 0x14
 *                       token := 0x508, descend into t_shake_ob_up
 *
 *      token == 0x508:  set_inviso(obj)
 *                       obj->field1c = 0x15; create_fx(obj)
 *                       frame[frame].handler = t_wait_forever
 *
 *      otherwise:       return -3
 *
 * **The victim dissolves rather than coming apart**, which is why nothing in here touches
 * the blood or the body-pieces machinery. Three stages: knocked away with an animation,
 * then poisoned -- posed by hand into animation 0x48 with palette 3 -- and shaken in place,
 * and finally made invisible with effect 0x15 left where the body was.
 *
 * `player_swpal(obj, 3)` is the poison colour. It is the same call `t_r_egg` uses, so
 * swapping the palette is how this module shows a state change on a fighter it is not
 * animating.
 *
 * **`t_shake_ob_up` takes three numbers**, 0x1c, 0x20 and 0x24, and the third is computed
 * from the second with `adds r3, #0x11` rather than loaded -- so 3 and 0x14 come from one
 * literal. The same one-literal-two-fields shape as `t_hit_by_bull`'s flight constants.
 *
 * 0x40 is the packed halfword pair again -- animation 0x20 at rate 5 -- eighth site for
 * that reading, and the second in this file after `t_stung_a_bunch`.
 */
void group_sound(MK3OBJ *obj);
void pose_a9_manual(MK3OBJ *obj);
void player_swpal(MK3OBJ *obj, uint32_t frozen);
long t_shake_ob_up(MK3THREAD *thread);           /* pointer slot 0x000f36f8 */

long t_stung_by_scorpion(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x4fa) {
        stop_me_player(obj);
        death_scream(obj);

        obj->field40 = 0x48;
        pose_a9_manual(obj);
        player_swpal(obj, 3);

        obj->field1c = 3;
        obj->field20 = 3;
        obj->field24 = 3 + 0x11;

        *mk3_frame(thread, thread->frame + 1) = 0x508;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x508) {
        set_inviso(obj);

        obj->field1c = 0x15;
        create_fx(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    face_opponent(obj);

    obj->field1c = 0x40000;
    away_x_vel(obj);
    rsnd_func(obj, 3);

    obj->field1c = 2;
    group_sound(obj);

    obj->field40 = 0x00050020;

    *mk3_frame(thread, thread->frame + 1) = 0x4fa;
    thread->frame = thread->frame + 1;              /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_animate_a9;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* ----------------------------------------------------------------- t_r_scared_of_monkey
 *
 * armv7 0x000a3fe8, 304 bytes.  **Complete.**
 *
 *      token == 0:      center_around_me(obj)
 *                       death_scream(obj)
 *                       face_opponent(obj)
 *                       obj->field40 = 0x48; pose_a9_manual(obj)
 *                       obj->field1c = 3
 *                       obj->field20 = 3
 *                       obj->field24 = 3 + 5 = 8
 *                       token := 0x318, descend into t_shake_ob_up
 *
 *      token == 0x318:  token := 0x319, park 0x14
 *
 *      token == 0x319:  flip_multi(obj)
 *                       kill_and_stop_scrolling(obj)
 *                       sans_repell_for_good(obj)
 *                       no_edge_both_players()
 *                       obj->field1c = 0x80000; away_x_vel(obj)
 *                       obj->field40 = 0x46; get_char_ani(obj)
 *                       obj->field1c = 3; init_anirate(obj)
 *                       obj->a10 = 0x50
 *                       -- falls through to the tail --
 *
 *      token == 0x329:  next_anirate(obj)
 *                       if (--obj->a10 <= 0) {
 *                           stop_me_player(obj)
 *                           frame[frame].handler = t_wait_forever
 *                       }
 *                       -- falls through to the tail --
 *
 *      the tail:        token := 0x329, park 1
 *
 *      otherwise:       return -3
 *
 * **The fighter runs away.** Posed into animation 0x48 and shaken, a twenty-frame pause,
 * and then the whole arena is unlocked at once -- the camera stops following, the two
 * fighters stop repelling each other, and both have their edge limits removed -- before the
 * fighter is thrown away from the monkey at 0x80000 and animates for eighty frames.
 *
 * **`no_edge_both_players` takes no argument.** other.c defines it as `(void)`, reading
 * both fighters out of the global; the `mov r0, r4` before the call is a setup the callee
 * ignores. Transcribing it as a one-argument call would invent an interface.
 *
 * **The same `t_shake_ob_up` call as `t_stung_by_scorpion`, with one number changed**:
 * both write 3 into 0x1c and 0x20, and the third field comes from the same register with
 * `adds r3, #5` here and `adds r3, #0x11` there. So 0x24 is the only thing that varies
 * between the two shakes, 8 against 0x14, and one literal still feeds two fields.
 *
 * Animation 0x48 is posed by hand in both routines as well -- the same frightened pose is
 * shared by the monkey and the scorpion, and only what follows it differs.
 */
void center_around_me(MK3OBJ *obj);
void flip_multi(MK3OBJ *obj);
void sans_repell_for_good(MK3OBJ *obj);
void no_edge_both_players(void);
void get_char_ani(MK3OBJ *obj);

long t_r_scared_of_monkey(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x318) {
        *mk3_frame(thread, frame + 1) = 0x319;
        thread->fieldfc = 0x14;
        return 0x14;
    }

    if (token == 0x319) {
        flip_multi(obj);
        kill_and_stop_scrolling(obj);
        sans_repell_for_good(obj);
        no_edge_both_players();

        obj->field1c = 0x80000;
        away_x_vel(obj);

        obj->field40 = 0x46;
        get_char_ani(obj);

        obj->field1c = 3;
        init_anirate(obj);

        obj->a10 = 0x50;

    } else if (token == 0x329) {
        next_anirate(obj);

        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0) {
            stop_me_player(obj);
            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
        }

    } else if (token == 0) {
        center_around_me(obj);
        death_scream(obj);
        face_opponent(obj);

        obj->field40 = 0x48;
        pose_a9_manual(obj);

        obj->field1c = 3;
        obj->field20 = 3;
        obj->field24 = 3 + 5;

        *mk3_frame(thread, thread->frame + 1) = 0x318;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x329;
    thread->fieldfc = 1;
    return 1;
}
