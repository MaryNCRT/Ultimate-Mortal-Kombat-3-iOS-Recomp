/*
 * mkslam.c -- gamecode/logic/mkslam.c, decompiled.
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

long t_common_slam(struct MK3THREAD *thread);
long t_noob_slam(struct MK3THREAD *thread);

/* t_nj_smoke_slam -- armv7 0x00049c7c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_noob_slam
 *      frame[frame+1].w0 = 0
 */

long t_nj_smoke_slam(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_noob_slam);
}

/* t_thrown_by_lao -- armv7 0x00049e28, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->a10 = 0x20
 *      frame[frame].handler = t_common_slam
 *      frame[frame+1].w0 = 0
 */

long t_thrown_by_lao(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->a10 = 0x20;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_common_slam);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */


/* t_thrown_by_jax -- armv7 0x00049df0, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->a10 = 0   (the register the guard proved)
 *      frame[frame].handler = t_common_slam
 *      frame[frame+1].w0 = 0
 */

long t_thrown_by_jax(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->a10 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_common_slam);
}

/* --------------------------------------------------------------------
 * Straight-line leaves, read by tools/leaffn.py: stores, calls and
 * a return, with every instruction accounted for. It refuses
 * anything that branches, any return value it cannot prove, and any
 * value read from a field the function also writes -- that is a
 * saved value being put back, not a re-read.
 * -------------------------------------------------------------------- */

long do_next_a9_frame(MK3OBJ *obj);
void find_last_frame(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void group_sound(MK3OBJ *obj);

/* throw_voice -- armv7 0x00049fdc, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x4
 *      group_sound(obj)
 */
void throw_voice(MK3OBJ *obj)
{
    obj->field1c = 0x4;
    group_sound(obj);
}


/* grab_voice -- armv7 0x00049fec, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x3
 *      group_sound(obj)
 */
void grab_voice(MK3OBJ *obj)
{
    obj->field1c = 0x3;
    group_sound(obj);
}


/* last_knockdown_frame -- armv7 0x0004b6b8, 28 bytes.  **Complete.**
 *
 *      obj->field40 = 0x1e
 *      get_char_ani(obj)
 *      find_last_frame(obj)
 *      do_next_a9_frame(obj)
 */
void last_knockdown_frame(MK3OBJ *obj)
{
    obj->field40 = 0x1e;
    get_char_ani(obj);
    find_last_frame(obj);
    do_next_a9_frame(obj);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_njsl3(struct MK3THREAD *thread);
long body_slam_init(MK3OBJ *obj);

/* t_nj_slam -- armv7 0x0004a3ac, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      body_slam_init(obj)
 *      frame[frame].handler = t_njsl3
 *      frame[frame+1].w0 = 0
 */

long t_nj_slam(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    body_slam_init(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_njsl3);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_flight(MK3THREAD *thread);
long t_land_on_my_back(MK3THREAD *thread);
void damage_to_me(MK3OBJ *obj);

/* t_post_broken_back -- armv7 0x00049ebc, 152 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x38000
 *          obj->field20 = 0xfff80000
 *          obj->field24 = 0xa000
 *          obj->field28 = 0xfff
 *          token := 0x429, then descend into t_flight
 *      token == 0x429:
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_post_broken_back(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x38000;
        obj->field20 = 0xfff80000;
        obj->field24 = 0xa000;
        obj->field28 = 0xfff;
        *mk3_frame(thread, thread->frame + 1) = 0x429;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x429)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* t_thrown_by_sz -- armv7 0x0004b6d4, 156 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x60000
 *          obj->field20 = 0xfffa0000
 *          obj->field24 = 0xa000
 *          obj->field28 = 0xfff
 *          token := 0x413, then descend into t_flight
 *      token == 0x413:
 *          obj->a10 = 0x19
 *          damage_to_me(obj)
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_thrown_by_sz(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x60000;
        obj->field20 = 0xfffa0000;
        obj->field24 = 0xa000;
        obj->field28 = 0xfff;
        *mk3_frame(thread, thread->frame + 1) = 0x413;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x413)
        return -3;

    obj->a10 = 0x19;
    damage_to_me(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}


/* --------------------------------------------------------- read_lp_tick_state
 *
 * armv7 0x00049cb0, 32 bytes.  **Complete.**
 *
 *      obj->field1c =
 *          *(uint16_t *)(G + 0x3ac + obj->field00->field08 * 2)
 *
 * Two halfwords side by side, one per player, indexed by the strength index
 * doubled -- the same per-player packing the button masks and clear_combo_butn
 * use. A leaf: no frame, no calls, and 0x1c is written twice because the address
 * lands there first and the value replaces it.
 */
long read_lp_tick_state(MK3OBJ *obj)
{
    obj->field1c = *(uint16_t *)(G_BYTES + 0x3ac
                                + obj->field00->field08 * 2);
    return 0;
}

/* -------------------------------------------------- xfer_him_to_flipped_pause
 *
 * armv7 0x00049ffc, 44 bytes.  **Complete.**
 *
 *      saved = obj->field1c
 *      obj->field00->field18 = obj->field1c
 *      obj->field38 = t_flipped_pause
 *      takeover_him_sr(obj)
 *      obj->field1c = saved
 *      obj->field20 = (uint32_t)obj->field00->field00
 *      obj->field00->field00->field48 = saved
 *
 * **The handover puts a handler in 0x38 and lets takeover_him_sr install it on
 * the other fighter.** 0x1c is the action, copied into the proc's 0x18 before
 * the call and saved across it because the call disturbs it, and then written
 * into the OTHER object's 0x48 afterwards -- so both sides end up holding the
 * same number, one as an action and one as an argument.
 *
 * 0x20 is left holding the other object's address, which is the only place this
 * routine records who was taken over.
 */
long t_flipped_pause(MK3THREAD *thread);
void takeover_him_sr(MK3OBJ *obj);

void xfer_him_to_flipped_pause(MK3OBJ *obj)
{
    uint32_t saved = obj->field1c;

    obj->field00->field18 = obj->field1c;
    obj->field38 = (uint32_t)(uintptr_t)t_flipped_pause;
    takeover_him_sr(obj);

    obj->field1c = saved;
    obj->field20 = (uint32_t)(uintptr_t)obj->field00->field00;
    obj->field00->field00->field48 = saved;
}

/* ------------------------------------------------------------ t_do_body_slam
 *
 * armv7 0x00049f54, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = body_slam_jumps[obj->field08->field24]
 *      frame[frame+1].w0 = 0
 *
 * One table lookup and one install. The table is indexed by the character
 * number, so every fighter's body slam is named here and nowhere else -- this is
 * the entry point the rest of the file hangs off.
 */
extern uint32_t body_slam_jumps[];              /* 0x00167288 */

long t_do_body_slam(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    mk3_frame(thread, thread->frame)[1] =
        body_slam_jumps[obj->field08->field24];
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* ------------------------------------------------------------- t_do_air_slam
 *
 * armv7 0x00049f98, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = air_slam_jumps[obj->field08->field24]
 *      frame[frame+1].w0 = 0
 *
 * The same routine as t_do_body_slam against a second table. **This is the
 * handler DoASpecial reaches through pointer slot 0x000f31a8**, given to `which`
 * 4 for characters 2 and 8 and `which` 9 for character 8 -- so an air slam
 * request lands here and is turned into the character's own version.
 */
extern uint32_t air_slam_jumps[];               /* 0x001672f0 */

long t_do_air_slam(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    mk3_frame(thread, thread->frame)[1] =
        air_slam_jumps[obj->field08->field24];
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* -------------------------------------------------------------- air_slam_init
 *
 * armv7 0x0004a09c, 80 bytes.  **Complete.**
 *
 *      air_init_special(obj); lights_on_slam(obj)
 *      saved40 = obj->field40
 *      obj->field40 = obj->field48
 *      get_his_char_ani(obj)
 *      obj->a10 = obj->field00->him
 *      obj->field48 = obj->field40
 *      obj->field40 = saved40
 *      get_char_ani2(obj)
 *      obj->field1c = 0x504
 *      xfer_him_to_flipped_pause(obj)
 *      obj->field1c = 0x30
 *      *(uint16_t *)(G + 0x456) = 0x30
 *
 * **0x40 is the animation register and it is borrowed for one call.** 0x48 goes
 * into it, get_his_char_ani turns that into the opponent's animation IN 0x40,
 * the result is taken back out into 0x48, and 0x40 is restored -- so the routine
 * ends with the opponent's animation in 0x48 and its own untouched, and then
 * get_char_ani2 fills 0x40 for this fighter. Two animations resolved through one
 * field.
 *
 * The 0x30 written to G + 0x456 is the first of the three consecutive halfwords
 * at 0x456, 0x45a and 0x45c, and 0x1c is left holding the same 0x30. 0x504 is in
 * 0x1c only long enough for xfer_him_to_flipped_pause to copy it into the
 * opponent's action and 0x48.
 */
void air_init_special(MK3OBJ *obj);
void lights_on_slam(MK3OBJ *obj);
void get_his_char_ani(MK3OBJ *obj);
void get_char_ani2(MK3OBJ *obj);
void xfer_him_to_flipped_pause(MK3OBJ *obj);

long air_slam_init(MK3OBJ *obj)
{
    uint32_t saved40;

    air_init_special(obj);
    lights_on_slam(obj);

    saved40 = obj->field40;
    obj->field40 = obj->field48;
    get_his_char_ani(obj);

    obj->a10 = obj->field00->him;
    obj->field48 = obj->field40;
    obj->field40 = saved40;
    get_char_ani2(obj);

    obj->field1c = 0x504;
    xfer_him_to_flipped_pause(obj);

    obj->field1c = 0x30;
    *(uint16_t *)(G_BYTES + 0x456) = 0x30;
    return 0;
}

/* ------------------------------------------------------------ xfer_to_thrown
 *
 * armv7 0x0004a3ec, 20 bytes.  **Complete.**
 *
 *      takeover_him(obj)
 *      obj->field00->field00->field40 = obj->field48
 *
 * Hand the other fighter over, then put this object's 0x48 into that fighter's
 * 0x40 -- the animation register -- so what was chosen here becomes what plays
 * there. Two hops to reach it: the proc, then the proc's 0x00, which is the
 * other fighter's object.
 */
void takeover_him(MK3OBJ *obj);

void xfer_to_thrown(MK3OBJ *obj)
{
    takeover_him(obj);
    obj->field00->field00->field40 = obj->field48;
}

/* ------------------------------------------------------ t_air_slamed_by_robo2
 *
 * armv7 0x0004b87c, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      inc_p_hit(obj)
 *      obj->a10 = 0x19
 *      obj->field1c = obj->field00->field54 + 0x19
 *      obj->field00->field54 = obj->field1c
 *      frame[frame].handler = t_common_slam
 *      frame[frame+1].w0 = 0
 *
 * **0x19 is the damage and it is written in two places at once**: into 0x44 as
 * the argument for whatever reads it, and added to the proc's 0x54, which is
 * where add_combo_damage accumulates. Twenty-five points, then straight into the
 * shared slam body.
 */
void inc_p_hit(MK3OBJ *obj);

long t_air_slamed_by_robo2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    inc_p_hit(obj);
    obj->a10 = 0x19;
    obj->field1c = obj->field00->field54 + 0x19;
    obj->field00->field54 = obj->field1c;

    return mk3_install(thread, (MK3THREADFUNC)t_common_slam);
}

/* -------------------------------------------------------- ground_slammed_init
 *
 * armv7 0x0004b8cc, 48 bytes.  **Complete.**
 *
 *      saved = obj->a10
 *      ground_player(obj)
 *      obj->field40 = 0x1e
 *      find_ani_part2(obj); do_next_a9_frame(obj)
 *      obj->field1c = 2
 *      group_sound(obj); shake_n_sound(obj)
 *      obj->a10 = saved
 *
 * **0x44 is saved across the whole body and put back at the end**, so one of
 * the five calls uses it as its own argument slot and this routine will not let
 * that show. Nothing else here reads it.
 *
 * The middle three lines are the same three t_collapse_on_ground ends with --
 * animation 0x1e, find the part, advance a frame -- so a body hitting the floor
 * looks the same whether it was slammed or it fell. What differs is the tail:
 * that one nudges the corpse into place from a table, this one makes noise.
 */
void ground_player(MK3OBJ *obj);
void find_ani_part2(MK3OBJ *obj);
void shake_n_sound(MK3OBJ *obj);

long ground_slammed_init(MK3OBJ *obj)
{
    uint32_t saved = obj->a10;

    ground_player(obj);

    obj->field40 = 0x1e;
    find_ani_part2(obj);
    do_next_a9_frame(obj);

    obj->field1c = 2;
    group_sound(obj);
    shake_n_sound(obj);

    obj->a10 = saved;
    return 0;
}

/* --------------------------------------------------------- stick_him_with_me
 *
 * armv7 0x0004bc48, 36 bytes.  **Complete.**
 *
 *      part  = obj->field08
 *      other = (MK3OBJ *)obj->a10
 *      obj->field1c = other->field18 = part->field18
 *      other->field1c = part->field1c
 *      obj->field08 = other
 *      set_x_vel_player(obj)
 *      obj->field08 = part
 *
 * **The swap is the whole routine.** set_x_vel_player works on whatever
 * obj->field08 points at, so to apply it to the object named in 0x44 the
 * pointer is swapped, the call made, and the pointer put back. The two fields
 * copied first -- 0x18 and 0x1c, the action and the rate -- are what make the
 * two move together, which is what sticking one to the other means.
 *
 * 0x44 is read twice more after the first load rather than kept, so the
 * compiler did not assume the copies left it alone.
 */
void set_x_vel_player(MK3OBJ *obj);

long stick_him_with_me(MK3OBJ *obj)
{
    MK3OBJ *part  = obj->field08;
    MK3OBJ *other = (MK3OBJ *)(void *)(uintptr_t)obj->a10;

    obj->field1c   = part->field18;
    other->field18 = part->field18;

    other = (MK3OBJ *)(void *)(uintptr_t)obj->a10;
    other->field1c = obj->field08->field1c;

    obj->field08 = (MK3OBJ *)(void *)(uintptr_t)obj->a10;
    set_x_vel_player(obj);
    obj->field08 = part;
    return 0;
}


/* ------------------------------------------------------------ t_bb_fall_call
 *
 * armv7 0x00049e64, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      him = (MK3OBJ *)obj->field00->him
 *      obj->field1c = (uint32_t)him
 *      him->field1c = obj->field08->field1c
 *      if (thread->frame > 0) thread->frame -= 1
 *      else frame[frame].handler = t_local_reaction_exit
 *
 * **The rate is pushed across to the other fighter and then this level goes
 * away.** The part's 0x1c -- the animation rate -- is copied into the object
 * named by the proc's `him`, so the two fall at the same speed, and the routine
 * then pops itself off the frame stack rather than installing anything. The
 * empty-stack fallback is t_local_reaction_exit, the same one t_plwins and
 * t_finish_him use.
 *
 * 0x1c is left holding the other object's ADDRESS, which is a scratch value and
 * not a rate. That is the only record of who was written to.
 */
long t_local_reaction_exit(MK3THREAD *thread);   /* pointer slot 0x000f3708 */

long t_bb_fall_call(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3OBJ *him;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;
    obj->field1c = (uint32_t)(uintptr_t)him;
    him->field1c = obj->field08->field1c;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ------------------------------------------------------------- t_slam_damage
 *
 * armv7 0x0004b770, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      him = (MK3OBJ *)obj->field00->him
 *      obj->field1c = obj->a10 =
 *          (int16)ochar_slam_damage[him->field24]
 *      damage_to_me(obj)
 *      frame[frame].handler = t_land_on_my_back
 *
 * **The damage is indexed by the OTHER fighter's character, not this one's.**
 * The table is signed halfwords, reached with `ldrsh` and a one-bit shift, and
 * the index comes from `him->field24` -- so how much a slam hurts is decided by
 * who threw it. The number lands in 0x1c and in 0x44 before damage_to_me is
 * called, and the thread then goes to t_land_on_my_back.
 */
extern int16_t ochar_slam_damage[];              /* 0x00167238 */

long t_slam_damage(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3OBJ *him;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;
    obj->field1c = (uint32_t)(int32_t)ochar_slam_damage[him->field24];
    obj->a10     = obj->field1c;

    damage_to_me(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* --------------------------------------------------------------- t_noob_slam
 *
 * armv7 0x0004a34c, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      part  = obj->field08
 *      saved = part->field24
 *      obj->field1c = part->field24 = 0x12
 *      body_slam_init(obj)
 *      obj->field1c = obj->field08->field24 = saved
 *      frame[frame].handler = t_njsl3
 *
 * **Noob Saibot borrows another character's slam by lying about who he is.**
 * The part's character number is set to 0x12 -- Scorpion's number, on
 * DoASpecial's dispatch -- body_slam_init is run so every table it consults
 * answers for Scorpion, and the real number is then put back. Nothing else in
 * the routine does any work.
 *
 * The part pointer is reloaded after the call rather than kept, so the compiler
 * did not assume body_slam_init leaves obj->field08 alone. 0x1c takes a copy of
 * both numbers in turn and ends holding the real one.
 */
long t_njsl3(MK3THREAD *thread);

long t_noob_slam(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    MK3OBJ  *part;
    uint32_t saved;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    part  = obj->field08;
    saved = part->field24;

    obj->field1c   = 0x12;
    part->field24  = 0x12;
    body_slam_init(obj);

    obj->field1c = saved;
    obj->field08->field24 = saved;

    return mk3_install(thread, (MK3THREADFUNC)t_njsl3);
}

/* ------------------------------------------------------------ t_flipped_pause
 *
 * armv7 0x0004a028, 116 bytes.  **Complete.**
 *
 *      token == 0:      lights_on_slam(obj)
 *                       token := 0x57f, park 1
 *
 *      token == 0x57f:  obj->field1c =
 *                           obj->field00->field00->field00->field18
 *                       if (that == obj->field48) token := 0x57f, park 1
 *                       else {
 *                           ground_player(obj)
 *                           frame[frame].handler = t_local_reaction_exit
 *                       }
 *
 *      otherwise:       return -3
 *
 * **It waits for the other fighter to leave the action it was given.** Three
 * hops reach the number -- this proc, the other object, its proc, its 0x18 --
 * and it is compared against 0x48, which xfer_him_to_flipped_pause loaded with
 * the action it handed over. While the two still match the routine parks for one
 * frame and asks again; the moment they differ the fighter is grounded and the
 * level exits.
 *
 * So the pair is a handshake: one routine gives the opponent an action and
 * records it, and this one blocks until the opponent is done with it. The
 * one-frame park means the check runs every frame.
 */
long t_flipped_pause(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        lights_on_slam(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x57f;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x57f)
        return -3;

    obj->field1c = obj->field00->field00->field00->field18;
    if (obj->field1c == obj->field48) {
        *mk3_frame(thread, thread->frame + 1) = 0x57f;
        thread->fieldfc = 1;
        return 1;
    }

    ground_player(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ---------------------------------------------------------- t_grab_animation
 *
 * armv7 0x0004a0ec, 116 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      push obj->field1c
 *      obj->field40 = 0x23
 *      get_char_ani(obj)
 *      obj->field1c = pop
 *      frame[frame].handler = t_mframew
 *
 * **The duration has to survive the animation lookup, so it goes on the
 * thread's argument stack.** get_char_ani writes through 0x1c, and the caller's
 * value is what t_mframew must wait for, so it is pushed at 0xa8 through the
 * cursor at 0xf8 and popped straight back. One push, one pop, nothing in
 * between but the one call.
 *
 * Animation 0x23 is the grab, and the same number appears in
 * t_jax_multi_slam_pose as the part it looks up -- so the two agree on which
 * animation a grab is.
 */
long t_mframew(MK3THREAD *thread);

long t_grab_animation(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t cur;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    cur = thread->fieldf8;
    *mk3_arg(thread, cur) = obj->field1c;
    thread->fieldf8 = cur + 1;

    obj->field40 = 0x23;
    get_char_ani(obj);

    cur = thread->fieldf8 - 1;
    thread->fieldf8 = cur;
    obj->field1c = *mk3_arg(thread, cur);

    return mk3_install(thread, (MK3THREADFUNC)t_mframew);
}

/* ----------------------------------------------------- t_jax_multi_slam_pose
 *
 * armv7 0x0004bc6c, 136 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      n = obj->field30
 *      obj->field40 = 0x28
 *      get_his_char_ani(obj)
 *      obj->field48 = obj->field40
 *      obj->a10 = obj->field00->him
 *      obj->field40 = 0x23
 *      find_ani_part2(obj)
 *      obj->field2c = n * 4
 *      obj->field40 = obj->field40 + n * 4
 *      obj->field30 = n
 *      obj->field48 = obj->field48 + n * 16
 *      double_next_a9(obj)
 *      obj->field1c = 3
 *      frame[frame].handler = t_jax_slam_sleep
 *
 * **The repetition count scales two animation offsets, by four and by sixteen.**
 * 0x30 holds how many slams have happened; both lookups are done first and then
 * shifted along by the count, so the second and third slam of the sequence show
 * later frames of the same two animations rather than restarting them. That is
 * the whole of what makes a multi-slam look like a sequence.
 *
 * Two animations again through one register, as in air_slam_init: 0x28 through
 * get_his_char_ani into 0x48, then 0x23 through find_ani_part2 into 0x40.
 *
 * **The store back to 0x30 is dead** -- the value was never changed -- and
 * 0x2c gets `n * 4` as a by-product of computing the first offset. Transcribed
 * as written.
 */
long t_jax_slam_sleep(MK3THREAD *thread);
long double_next_a9(MK3OBJ *obj);

long t_jax_multi_slam_pose(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t n;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    n = obj->field30;

    obj->field40 = 0x28;
    get_his_char_ani(obj);
    obj->field48 = obj->field40;

    obj->a10 = obj->field00->him;

    obj->field40 = 0x23;
    find_ani_part2(obj);

    obj->field2c = n * 4;
    obj->field40 = obj->field40 + n * 4;
    obj->field30 = n;                       /* dead: n came from here */
    obj->field48 = obj->field48 + n * 16;

    double_next_a9(obj);
    obj->field1c = 3;

    return mk3_install(thread, (MK3THREADFUNC)t_jax_slam_sleep);
}
