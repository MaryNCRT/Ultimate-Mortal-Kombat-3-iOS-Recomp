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
