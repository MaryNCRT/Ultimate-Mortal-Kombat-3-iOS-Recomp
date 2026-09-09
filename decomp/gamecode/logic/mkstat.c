/*
 * mkstat.c -- gamecode/logic/mkstat.c, decompiled.
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

long t_retract_strike_act(struct MK3THREAD *thread);

/* t_retract_strike -- armv7 0x0004cb48, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0   (the register the guard proved)
 *      frame[frame].handler = t_retract_strike_act
 *      frame[frame+1].w0 = 0
 */

long t_retract_strike(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_retract_strike_act);
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
 * Straight-line leaves, read by tools/leaffn.py: stores, calls and
 * a return, with every instruction accounted for. It refuses
 * anything that branches, any return value it cannot prove, and any
 * value read from a field the function also writes -- that is a
 * saved value being put back, not a re-read.
 * -------------------------------------------------------------------- */

long create_blood_proc(MK3OBJ *obj);

/* upcut_blood_me -- armv7 0x0004f05c, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x1
 *      create_blood_proc(obj)
 */
void upcut_blood_me(MK3OBJ *obj)
{
    obj->field1c = 0x1;
    create_blood_proc(obj);
}


/* jade_normpal -- armv7 0x0004fd00, 12 bytes.  **Complete.**
 *
 *      player_normpal(obj)
 */
void jade_normpal(MK3OBJ *obj)
{
    player_normpal(obj);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

void set_half_damage(struct MK3THREAD *thread);
long t_act_mframew(struct MK3THREAD *thread);
long t_axeup3(struct MK3THREAD *thread);
long t_local_reaction_exit(struct MK3THREAD *thread);
long t_victory_animation(struct MK3THREAD *thread);
void call_a0_for_him(MK3OBJ *obj);
void clear_inviso(MK3OBJ *obj);
void death_blow_complete(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);

/* t_do_block_hi -- armv7 0x0004cea0, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      stop_me_player(obj)
 *      obj->field40 = 0xc
 *      get_char_ani(obj)
 *      obj->field1c = 0x3
 *      obj->field20 = 0x700
 *      frame[frame].handler = t_act_mframew
 *      frame[frame+1].w0 = 0
 */

long t_do_block_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    stop_me_player(obj);
    obj->field40 = 0xc;
    get_char_ani(obj);
    obj->field1c = 0x3;
    obj->field20 = 0x700;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_act_mframew);
}

/* tl_stat_do_fast_axe_up -- armv7 0x0004d078, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = set_half_damage
 *      call_a0_for_him(obj)
 *      obj->field40 = 0x20002
 *      obj->field48 = 0x4
 *      frame[frame].handler = t_axeup3
 *      frame[frame+1].w0 = 0
 */

long tl_stat_do_fast_axe_up(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)set_half_damage;
    call_a0_for_him(obj);
    obj->field40 = 0x20002;
    obj->field48 = 0x4;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_axeup3);
}

/* t_do_un_inviso -- armv7 0x0004f684, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      clear_inviso(obj)
 *      frame[frame].handler = t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 */

long t_do_un_inviso(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    clear_inviso(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* tl_babality_complete -- armv7 0x0004fcb4, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      death_blow_complete(obj)
 *      player_normpal(obj)
 *      frame[frame].handler = t_victory_animation
 *      frame[frame+1].w0 = 0
 */

long tl_babality_complete(MK3THREAD *thread)
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

long t_jump_up_land_jsrp(MK3THREAD *thread);
long t_ret9(MK3THREAD *thread);

/* t_retract_strike_act -- armv7 0x0004cadc, 108 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x737, then descend into t_act_mframew
 *      token == 0x737:
 *          frame[frame].handler = t_ret9
 *      otherwise:  return -3
 */
long t_retract_strike_act(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x737;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_act_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x737)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_ret9);
}

/* t_jump_up_land_jump -- armv7 0x0004cd30, 112 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x9ad, then descend into t_jump_up_land_jsrp
 *      token == 0x9ad:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_jump_up_land_jump(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x9ad;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_jump_up_land_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x9ad)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_mframew(MK3THREAD *thread);
long tl_delete_proj_and_die(MK3THREAD *thread);
void get_char_ani2(MK3OBJ *obj);

/* t_scream_wave -- armv7 0x0004d8c0, 136 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0x1
 *          get_char_ani2(obj)
 *          obj->field1c = 0x5
 *          token := 0x643, then descend into t_mframew
 *      token == 0x643:
 *          frame[frame].handler = tl_delete_proj_and_die
 *      otherwise:  return -3
 */
long t_scream_wave(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x1;
        get_char_ani2(obj);
        obj->field1c = 0x5;
        *mk3_frame(thread, thread->frame + 1) = 0x643;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x643)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)tl_delete_proj_and_die);
}


/* --------------------------------------------------------------- update_block_fk
 *
 * armv7 0x0004d3d0, 28 bytes.  **Complete.**
 *
 *      obj->field1c = (uint32_t)(G + 0x420 + 4)
 *      update_tsl(obj)
 *
 * 0x1c carries an ADDRESS into update_tsl, not a number -- `G + 0x424`, built as
 * 0x420 then plus 4 because the compiler had 0x420 in hand. The same field-as-
 * argument convention `call_a0_for_him` uses, here with a data pointer instead of
 * a routine.
 */
void update_tsl(MK3OBJ *obj);

void update_block_fk(MK3OBJ *obj)
{
    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x420 + 4);
    update_tsl(obj);
}

/* ------------------------------------------------------------- update_l_block_fk
 *
 * armv7 0x0004d060, 24 bytes.  **Complete.**
 *
 *      if (obj->field18 != 0) {
 *          obj->field1c = (uint32_t)update_block_fk
 *          call_a0_for_him(obj)
 *      }
 *
 * **The A0 mechanism at its smallest**: the whole routine is "if this fighter is
 * doing something, run update_block_fk on the OTHER one". The routine handed
 * across is the one directly above, so the pair is a local and a remote spelling
 * of the same update.
 */
void update_block_fk(MK3OBJ *obj);

void update_l_block_fk(MK3OBJ *obj)
{
    if (obj->field18 != 0) {
        obj->field1c = (uint32_t)(uintptr_t)update_block_fk;
        call_a0_for_him(obj);
    }
}

/* -------------------------------------------------------------- next_lao_anirate
 *
 * armv7 0x0004d89c, 36 bytes.  **Complete.**
 *
 *      next_anirate(obj)
 *      if (--obj->a10 == 0) {
 *          obj->field1c = 6
 *          ochar_sound(obj)
 *          obj->a10 = 0x1e
 *      }
 *
 * **A sound every thirty frames, on top of the ordinary rate step.** 0x44 counts
 * down and is reloaded with 0x1e when it runs out, so sound 6 plays once per
 * thirty calls -- the spin's repeating whoosh. The 6 is built as `adds r3, #6` on
 * a register the branch has just proved to be zero, which is why nothing loads it.
 */
long next_anirate(MK3OBJ *obj);
void ochar_sound(MK3OBJ *obj);

void next_lao_anirate(MK3OBJ *obj)
{
    next_anirate(obj);

    obj->a10 = obj->a10 - 1;
    if (obj->a10 == 0) {
        obj->field1c = 6;
        ochar_sound(obj);
        obj->a10 = 0x1e;
    }
}

/* --------------------------------------------------------------- air_combo_setup
 *
 * armv7 0x0004d0d0, 68 bytes.  **Complete.**
 *
 *      obj->field1c = obj->field00->field28
 *      if (that == 0) {
 *          obj->field1c = (uint32_t)set_no_block
 *          call_a0_for_him(obj)
 *      }
 *      ground_player(obj); match_me_with_him(obj); flip_multi(obj)
 *      obj->field1c = ~0x3f = -0x40
 *      obj->field20 = -0x40 + 0x40 = 0
 *      multi_adjust_xy(obj)
 *
 * **Blocking is taken off the other fighter only when the proc's 0x28 is
 * clear**, through the A0 mechanism again -- `set_no_block` off pointer slot
 * 0x000f3184. A non-zero 0x28 means somebody already did it and the call is
 * skipped.
 *
 * The adjust pair is -0x40 and 0, built from one `mvn` and one `adds`, so the
 * fighter is moved sixty-four units along the first axis and none along the
 * second.
 */
void set_no_block(MK3OBJ *obj);                  /* pointer slot 0x000f3184 */
void match_me_with_him(MK3OBJ *obj);
void flip_multi(MK3OBJ *obj);
void ground_player(MK3OBJ *obj);
void multi_adjust_xy(MK3OBJ *obj);

void air_combo_setup(MK3OBJ *obj)
{
    obj->field1c = obj->field00->field28;
    if (obj->field1c == 0) {
        obj->field1c = (uint32_t)(uintptr_t)set_no_block;
        call_a0_for_him(obj);
    }

    ground_player(obj);
    match_me_with_him(obj);
    flip_multi(obj);

    obj->field1c = (uint32_t)~0x3fu;
    obj->field20 = (uint32_t)(~0x3fu + 0x40u);
    multi_adjust_xy(obj);
}


/* ------------------------------------------------------------- tl_stat_do_axe_up
 *
 * armv7 0x0004ca98, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0xa
 *      obj->field40 = 0x00030002
 *      frame[frame].handler = t_axeup3
 *      frame[frame+1].w0 = 0
 *
 * Two constants and an install. **0x40 arrives packed again** -- 0x00030002,
 * a fifth site for that shape after 0x0005000d, 0x00040021, 0x00040047 and
 * 0x00030021, and the first to feed a routine other than t_animate_a9. The high
 * half is 3 and the low half 2, both small, which fits the two-independent-halves
 * reading and still does not name either.
 */
long t_axeup3(MK3THREAD *thread);

long tl_stat_do_axe_up(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0xa;
    obj->field40 = 0x00030002;

    return mk3_install(thread, (MK3THREADFUNC)t_axeup3);
}

/* -------------------------------------------------------------- noogy_early_check
 *
 * armv7 0x0004e320, 72 bytes.  **Complete.**
 *
 *      if ((int16)obj->field00->field7c != 0)
 *          obj->field1c = (uint32_t)(G + 0x3a8)
 *      else
 *          obj->field1c = (uint32_t)(G + 0x3ac)
 *      get_tsl_px(obj, obj)
 *      if (obj->field20 > 7) {
 *          obj->field1c = 1
 *          obj->field00->field28 = 1
 *      }
 *
 * **Which of two per-player halfword sets is consulted depends on the
 * four-button gate.** proc+0x7c is that gate, read signed with `ldrsh` as it is
 * everywhere else; non-zero picks the set at G + 0x3a8 and zero the one at
 * G + 0x3ac. `read_lp_tick_state` reads the second of the two directly, and
 * `t_jax_slam_sleep` hands the first to the same `get_tsl_px`, so the four bytes
 * between them separate two button histories rather than two players.
 *
 * More than seven raises a flag in the proc's 0x28 -- the same field
 * air_combo_setup tests before taking blocking away -- so a long enough press is
 * what this routine is checking for and 0x28 is where it says so.
 */
void get_tsl_px(MK3OBJ *obj, MK3OBJ *ref);

void noogy_early_check(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c != 0)
        obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x3a8);
    else
        obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x3ac);

    get_tsl_px(obj, obj);

    if ((long)obj->field20 > 7) {
        obj->field1c = 1;
        obj->field00->field28 = 1;
    }
}

/* ------------------------------------------------------------------------ t_ret9
 *
 * armv7 0x0004d84c, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      back_to_normal(obj)
 *      if (thread->frame > 0) thread->frame -= 1
 *      else frame[frame].handler = t_local_reaction_exit
 *
 * One call and a pop -- the plain "put the fighter back and hand this level
 * back" routine, with the same empty-stack fallback the whole logic module uses.
 */
void back_to_normal(MK3OBJ *obj);

long t_ret9(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    back_to_normal(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------- t_do_stationary
 *
 * armv7 0x0004cda0, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      h = stat_jumps[obj->field1c]
 *      obj->field1c = h
 *      frame[frame].handler = h ? h : t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 *
 * **A jump table indexed by 0x1c, not by the character.** `t_do_body_slam` and
 * `t_do_air_slam` index their tables by `obj->field08->field24`; this one uses
 * whatever the caller left in 0x1c, so it is a dispatch on the requested move
 * rather than on who is performing it. A zero entry falls back to
 * t_local_reaction_exit, which is how the table encodes "no such move" without a
 * bound check.
 *
 * The fallback path writes the loaded zero into the token slot, so the same
 * register serves as both the missing handler and the zero the install needs.
 */
extern uint32_t stat_jumps[];                    /* 0x00167434 */

long t_do_stationary(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    h = stat_jumps[obj->field1c];
    obj->field1c = h;

    if (h != 0) {
        mk3_frame(thread, thread->frame)[1] = h;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ------------------------------------------------------------- t_stat_do_hi_kick
 *
 * armv7 0x0004e660, 108 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      init_special(obj)
 *      obj->field1c = 0
 *      *(uint32_t *)((char *)obj->field00 + 0x58) = 0
 *      rsnd_func(obj, 0xf)
 *      obj->field1c = 0; group_sound(obj)
 *      obj->field1c = 1
 *      obj->field48 = 0
 *      obj->field20 = 1 + 0x102 = 0x103
 *      obj->field40 = 0x103 - 0xf2 = 0x11
 *      frame[frame].handler = t_kick2
 *
 * **This and t_stat_do_lo_kick are the same routine with one added to three
 * numbers.** High kick: action 0x103, animation 0x11, proc+0x58 and 0x48 both
 * zero. Low kick: action 0x104, animation 0x12, both of those one. So the pair
 * encodes height as a single increment in three places at once, and 0x48 and the
 * proc's 0x58 carry it as a flag while 0x20 and 0x40 carry it as an index.
 *
 * proc+0x58 is inside a pad in this header, so it is written by offset.
 *
 * The 0xf handed to rsnd_func is the same in both, and 0x1c is zeroed twice --
 * once for the proc store and once for group_sound.
 */
void init_special(MK3OBJ *obj);
void group_sound(MK3OBJ *obj);
long t_kick2(MK3THREAD *thread);

long t_stat_do_hi_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);

    obj->field1c = 0;
    *(uint32_t *)((char *)obj->field00 + 0x58) = 0;
    rsnd_func(obj, 0xf);

    obj->field1c = 0;
    group_sound(obj);

    obj->field1c = 1;
    obj->field48 = 0;
    obj->field20 = 1 + 0x102;
    obj->field40 = (1 + 0x102) - 0xf2;

    return mk3_install(thread, (MK3THREADFUNC)t_kick2);
}

/* ------------------------------------------------------------- t_stat_do_lo_kick
 *
 * armv7 0x0004e6cc, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      init_special(obj)
 *      rsnd_func(obj, 0xf)
 *      obj->field1c = 0; group_sound(obj)
 *      obj->field40 = 0x12
 *      *(uint32_t *)((char *)obj->field00 + 0x58) = 0x12 - 0x11 = 1
 *      obj->field1c = 1
 *      obj->field48 = 1
 *      obj->field20 = 0x104
 *      frame[frame].handler = t_kick2
 *
 * t_stat_do_hi_kick with 1 where that has 0 and the next number where it has the
 * previous one. The order of the stores differs -- this one sets 0x40 first and
 * derives the flag from it, the other sets the flag first and derives 0x40 from
 * the action -- but the values that land are the pair described above.
 */
long t_stat_do_lo_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);
    rsnd_func(obj, 0xf);

    obj->field1c = 0;
    group_sound(obj);

    obj->field40 = 0x12;
    *(uint32_t *)((char *)obj->field00 + 0x58) = 0x12 - 0x11;
    obj->field1c = 1;
    obj->field48 = 1;
    obj->field20 = 0x104;

    return mk3_install(thread, (MK3THREADFUNC)t_kick2);
}


/* ----------------------------------------------------------- t_stat_do_duck_kickh
 *
 * armv7 0x0004e7a4, 112 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0; group_sound(obj)
 *      rsnd_func(obj, 0xe)
 *      init_special(obj)
 *      obj->field1c = 3
 *      obj->field20 = 0x106
 *      obj->field40 = 0x106 - 0xfd = 9
 *      obj->a10    = 9 - 4 = 5
 *      obj->field48 = 6
 *      *(uint32_t *)((char *)obj->field00 + 0x58) = 6
 *      frame[frame].handler = t_striker
 *
 * The crouching counterpart of t_stat_do_hi_kick, ending in t_striker rather
 * than t_kick2 -- so a duck kick is a strike and a standing kick is not, which is
 * the real difference between the two pairs.
 *
 * **This pair is NOT the clean increment the standing pair is.** High/low
 * standing differ by exactly one in four places; high/low ducking differ by one
 * in the action (0x106 against 0x107) and the animation (9 against 0xa), by three
 * in 0x44 (5 against 2) and by one the other way in 0x48 and proc+0x58 (6 against
 * 7). And the high variant has the LOWER action number. So the two pairs are not
 * built to one rule, and reading either one from the other would get three
 * numbers wrong.
 */
long t_striker(MK3THREAD *thread);               /* pointer slot 0x000f3880 */

long t_stat_do_duck_kickh(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;
    group_sound(obj);
    rsnd_func(obj, 0xe);
    init_special(obj);

    obj->field1c = 3;
    obj->field20 = 0x106;
    obj->field40 = 0x106 - 0xfd;
    obj->a10     = (0x106 - 0xfd) - 4;
    obj->field48 = 6;
    *(uint32_t *)((char *)obj->field00 + 0x58) = 6;

    return mk3_install(thread, (MK3THREADFUNC)t_striker);
}

/* ----------------------------------------------------------- t_stat_do_duck_kickl
 *
 * armv7 0x0004e734, 112 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0; group_sound(obj)
 *      rsnd_func(obj, 0xe)
 *      init_special(obj)
 *      obj->field20 = 0x107
 *      obj->field40 = 0x107 - 0xfd = 0xa
 *      obj->field1c = 2
 *      obj->a10     = 2
 *      obj->field48 = 2 + 5 = 7
 *      *(uint32_t *)((char *)obj->field00 + 0x58) = 7
 *      frame[frame].handler = t_striker
 *
 * The low duck kick. Here 0x1c and 0x44 take the same value, 2, and 0x48 is
 * derived from it as `+5`; the high variant derives 0x44 from the animation
 * instead and writes 0x48 as a plain literal. Same four fields, different
 * arithmetic, so only the results are meaningful.
 */
long t_stat_do_duck_kickl(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;
    group_sound(obj);
    rsnd_func(obj, 0xe);
    init_special(obj);

    obj->field20 = 0x107;
    obj->field40 = 0x107 - 0xfd;
    obj->field1c = 2;
    obj->a10     = 2;
    obj->field48 = 2 + 5;
    *(uint32_t *)((char *)obj->field00 + 0x58) = 2 + 5;

    return mk3_install(thread, (MK3THREADFUNC)t_striker);
}

/* ---------------------------------------------------------------- t_noog_lineup_1
 *
 * armv7 0x0004ea38, 108 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      match_him_with_me_f(obj)
 *      him = (MK3OBJ *)obj->field00->him
 *      obj->field1c = ochar_noogy_lineups[him->field24]
 *      adjust_him_a0(obj)
 *      if (thread->frame > 0) thread->frame -= 1
 *      else frame[frame].handler = t_local_reaction_exit
 *
 * **A per-character positional correction indexed by the OTHER fighter.** The
 * table is words, the index is `him->field24`, and the value goes to
 * adjust_him_a0 through 0x1c -- the same field-as-argument convention again, and
 * the same "indexed by who is on the receiving end" choice `t_slam_damage` makes
 * for its damage table.
 *
 * So lining a noogy up depends on how tall the victim is, not on who is giving
 * it.
 */
extern uint32_t ochar_noogy_lineups[];           /* 0x001673cc */
void match_him_with_me_f(MK3OBJ *obj);
void adjust_him_a0(MK3OBJ *obj);

long t_noog_lineup_1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3OBJ *him;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    match_him_with_me_f(obj);

    him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;
    obj->field1c = ochar_noogy_lineups[him->field24];
    adjust_him_a0(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------- t_do_jumpup_kick
 *
 * armv7 0x0004d54c, 116 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = obj->field00->field18 = 0x10b
 *      face_opponent(obj)
 *      obj->field1c = 0; group_sound(obj)
 *      rsnd_func(obj, 0xe)
 *      obj->field1c = 0xa
 *      *(uint32_t *)((char *)obj->field00 + 0x58) = 0xa
 *      obj->field20 = 0xa + 6  = 0x10
 *      obj->field24 = 0x10 - 0xd = 3
 *      obj->field40 = 3 + 0x14 = 0x17
 *      frame[frame].handler = t_jk6
 *
 * **A third pair, and this one shares a value the other two do not.** With
 * t_do_jumpup_punch below: action 0x10b against 0x10c, proc+0x58 0xa against 9,
 * 0x20 0x10 against 0xf, 0x40 0x17 against 0x18 -- **and 0x24 is 3 in both**,
 * reached by different arithmetic each time (0x10 minus 0xd here, 0xf minus 0xc
 * there). So the compiler chained from a different starting number in each and
 * both landed on 3 deliberately.
 *
 * The five constants come off one literal by `adds` and `subs`, as in the knee
 * and elbow; only the results mean anything.
 */
long t_jk6(MK3THREAD *thread);

long t_do_jumpup_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x10b;
    obj->field00->field18 = 0x10b;
    face_opponent(obj);

    obj->field1c = 0;
    group_sound(obj);
    rsnd_func(obj, 0xe);

    obj->field1c = 0xa;
    *(uint32_t *)((char *)obj->field00 + 0x58) = 0xa;
    obj->field20 = 0xa + 6;
    obj->field24 = (0xa + 6) - 0xd;
    obj->field40 = ((0xa + 6) - 0xd) + 0x14;

    return mk3_install(thread, (MK3THREADFUNC)t_jk6);
}

/* -------------------------------------------------------------- t_do_jumpup_punch
 *
 * armv7 0x0004d5c0, 116 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = obj->field00->field18 = 0x10c
 *      face_opponent(obj)
 *      obj->field1c = 0; group_sound(obj)
 *      rsnd_func(obj, 0xe)
 *      obj->field1c = 9
 *      *(uint32_t *)((char *)obj->field00 + 0x58) = 9
 *      obj->field20 = 9 + 6 = 0xf
 *      obj->field24 = 0xf - 0xc = 3
 *      obj->field40 = 3 + 0x15 = 0x18
 *      frame[frame].handler = t_jk6
 *
 * t_do_jumpup_kick with the four numbers above and the same 3 in 0x24. Both
 * install t_jk6, so the jumping punch and the jumping kick share their whole
 * continuation and differ only in what they set up.
 */
long t_do_jumpup_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x10c;
    obj->field00->field18 = 0x10c;
    face_opponent(obj);

    obj->field1c = 0;
    group_sound(obj);
    rsnd_func(obj, 0xe);

    obj->field1c = 9;
    *(uint32_t *)((char *)obj->field00 + 0x58) = 9;
    obj->field20 = 9 + 6;
    obj->field24 = (9 + 6) - 0xc;
    obj->field40 = ((9 + 6) - 0xc) + 0x15;

    return mk3_install(thread, (MK3THREADFUNC)t_jk6);
}


/* ------------------------------------------------------------- t_land_on_yer_feet
 *
 * armv7 0x0004cca4, 140 bytes.  **Complete.**
 *
 *      token == 0:      obj->field1c = 0
 *                       obj->field20 = 0
 *                       obj->field24 = 0x8000
 *                       obj->field28 = 0xfff
 *                       token := 0x9aa, descend into t_flight
 *
 *      token == 0x9aa:  frame[frame].handler = t_jump_up_land_jump
 *
 *      otherwise:       return -3
 *
 * **A seventh flight, and the first with BOTH components zero.** 0x24 is 0x8000
 * again -- seventh site, and here it is a plain literal rather than the end of a
 * chain, which is the clearest statement yet that 0x8000 is what a flight's 0x24
 * is meant to be. 0x28 is 0xfff, matching the drop-downs rather than the throws.
 *
 * With 0x1c and 0x20 both zero the fighter is given no horizontal or vertical
 * component at all, so the flight is whatever 0x24 and 0x28 alone produce -- which
 * is what landing on your feet after being thrown should look like.
 */
long t_jump_up_land_jump(MK3THREAD *thread);
long t_flight(MK3THREAD *thread);                /* pointer slot 0x000f3720 */

long t_land_on_yer_feet(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0;
        obj->field20 = 0;
        obj->field24 = 0x8000;
        obj->field28 = 0xfff;

        *mk3_frame(thread, thread->frame + 1) = 0x9aa;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x9aa)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_jump_up_land_jump);
}

/* -------------------------------------------------------------- tl_do_jade_flash
 *
 * armv7 0x0004ff28, 128 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      init_special(obj)
 *      p = NewThreadProcPid(obj, t_jade_flash_proc, 0x11f)
 *      obj->field1c = (uint32_t)(G + 0x410 + 0xc)
 *      *(uint32_t *)((char *)p + 0x44) = (uint32_t)obj
 *      update_tsl(obj)
 *      if (thread->frame > 0) thread->frame -= 1
 *      else frame[frame].handler = t_local_reaction_exit
 *
 * **It spawns a second thread and gives that thread a pointer back to this
 * object.** NewThreadProcPid returns the new proc and its 0x44 -- the argument
 * slot, as everywhere else -- receives this object, so t_jade_flash_proc runs
 * independently and knows whose flash it is. That is how an effect outlives the
 * state that started it.
 *
 * 0x1c then takes `G + 0x41c` for update_tsl, built as 0x410 plus 0xc, which is
 * the same address-in-0x1c convention update_block_fk uses with G + 0x424.
 *
 * The routine pops its own level immediately afterwards, so the flash is entirely
 * the spawned thread's business from here.
 */
void *NewThreadProcPid(void *owner, MK3THREADFUNC func, uint32_t pid);
long t_jade_flash_proc(MK3THREAD *thread);

long tl_do_jade_flash(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    void   *p;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);

    p = NewThreadProcPid(obj, (MK3THREADFUNC)t_jade_flash_proc, 0x11f);

    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x410 + 0xc);
    *(uint32_t *)((char *)p + 0x44) = (uint32_t)(uintptr_t)obj;

    update_tsl(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------------- t_shake_suspended
 *
 * armv7 0x0004de98, 140 bytes.  **Complete.**
 *
 *      token == 0:      obj->field38 = 4
 *                       *(uint16_t *)(G + 0x456) = 4
 *                       token := 0x581, park 2
 *
 *      token == 0x581:  get_his_action(obj)
 *                       frame[frame].handler =
 *                           (obj->field20 == 0x111) ? t_shake_suspended
 *                                                   : t_local_reaction_exit
 *
 *      otherwise:       return -3
 *
 * **A poll that reinstalls ITSELF, which restarts it at state 0.** The install
 * zeroes the token, so a match on 0x111 does not resume at 0x581 -- it re-enters
 * from the top, writing 4 into 0x38 and into G + 0x456 again and parking another
 * two frames. So the loop body is state 0 and state 0x581 is only the test.
 *
 * That is a different loop shape from every other one in the module, where a
 * state re-arms by writing its own token back. Reading `frame[frame].handler =
 * t_shake_suspended` as "carry on where we were" would get the repeated writes
 * wrong.
 *
 * get_his_action answers in 0x20, and 0x111 is the action being waited for -- so
 * the shake lasts exactly as long as the other fighter stays in it.
 */
void get_his_action(MK3OBJ *obj);
long t_shake_suspended(MK3THREAD *thread);

long t_shake_suspended(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field38 = 4;
        *(uint16_t *)(G_BYTES + 0x456) = 4;

        *mk3_frame(thread, thread->frame + 1) = 0x581;
        thread->fieldfc = 2;
        return 2;
    }

    if (token != 0x581)
        return -3;

    get_his_action(obj);

    if (obj->field20 == 0x111)
        return mk3_install(thread, (MK3THREADFUNC)t_shake_suspended);

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------- t_mid_air_pause
 *
 * armv7 0x0004ce08, 152 bytes.  **Complete.**
 *
 *      token == 0:      push obj->field1c
 *                       stop_me_player(obj)
 *                       obj->field1c = pop
 *                       token := 0x955, park obj->field1c
 *
 *      token == 0x955:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * The same save-across-one-call idiom as t_grab_animation: 0x1c goes onto the
 * thread's argument stack, `stop_me_player` runs, and the value comes straight
 * back to be used as the park duration. One push, one pop, one call between them.
 *
 * So the caller's 0x1c is how long the pause lasts, and the routine exists only to
 * stop the fighter without losing that number.
 */
long t_mid_air_pause(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);
    uint32_t cur;

    if (token == 0) {
        cur = thread->fieldf8;
        *mk3_arg(thread, cur) = obj->field1c;
        thread->fieldf8 = cur + 1;

        stop_me_player(obj);

        cur = thread->fieldf8 - 1;
        thread->fieldf8 = cur;
        obj->field1c = *mk3_arg(thread, cur);

        *mk3_frame(thread, thread->frame + 1) = 0x955;
        thread->fieldfc = obj->field1c;
        return (long)obj->field1c;
    }

    if (token != 0x955)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------------- t_noogy_suspended
 *
 * armv7 0x0004df24, 160 bytes.  **Complete.**
 *
 *      token == 0:      obj->field38 = 4
 *                       *(uint16_t *)(G + 0x456) = 4
 *                       token := 0x498, park 2
 *
 *      token == 0x498:  get_his_action(obj)
 *                       if (obj->field20 == 0x112) {
 *                           frame[frame].handler = t_noogy_suspended
 *                           frame[frame+1].w0 = obj->field20 - 0x112
 *                       } else
 *                           frame[frame].handler = t_local_reaction_exit
 *
 *      otherwise:       return -3
 *
 * **t_shake_suspended's twin, waiting on action 0x112 instead of 0x111.** Same
 * two states, same reinstall-itself loop that restarts at state 0, same 4 into
 * 0x38 and G + 0x456 on every pass.
 *
 * The zero for the token slot is computed as `obj->field20 - 0x112` -- from the
 * value the branch has just proved equal to 0x112 -- rather than loaded. The same
 * trick t_jax_slam uses with its dereferenced zero, and t_shake_suspended does
 * not: that one loads a plain zero. Two spellings of the same store in twinned
 * routines.
 */
long t_noogy_suspended(MK3THREAD *thread);

long t_noogy_suspended(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field38 = 4;
        *(uint16_t *)(G_BYTES + 0x456) = 4;

        *mk3_frame(thread, thread->frame + 1) = 0x498;
        thread->fieldfc = 2;
        return 2;
    }

    if (token != 0x498)
        return -3;

    get_his_action(obj);

    if (obj->field20 == 0x112) {
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_noogy_suspended;
        *mk3_frame(thread, thread->frame + 1) = obj->field20 - 0x112;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ------------------------------------------------------------ t_jade_flash_sleep
 *
 * armv7 0x0004fd0c, 136 bytes.  **Complete.**
 *
 *      token == 0:      token := 0xed, park 3
 *
 *      token == 0xed:   f = *(uint32_t *)((char *)obj->a10 + 0x10)
 *                       obj->field2c = f
 *                       if ((f & 4) != 0) {
 *                           jade_normpal(obj)
 *                           token := 0xf4, park 0x16462
 *                       } else {
 *                           pop a level, or t_local_reaction_exit
 *                       }
 *
 *      otherwise:       return -3
 *
 * **It watches a flag on the object named in 0x44, not on itself.** That is the
 * object tl_do_jade_flash writes into the spawned proc's 0x44, so this routine
 * reads bit 2 of its 0x10 and acts when whoever owns the flash sets it.
 *
 * **0x16462 is the park-and-never-wake duration**, already recorded in this
 * project's notes, so the 0xf4 state is a terminal park -- the routine restores
 * the palette and then sleeps for good rather than exiting. The alternative is the
 * ordinary pop, and which of the two happens is decided entirely by that one bit.
 *
 * The `ands` leaves the masked value in the register the else path returns, so
 * the zero the token slot receives is the failed test itself.
 */
void jade_normpal(MK3OBJ *obj);

long t_jade_flash_sleep(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);
    uint32_t f;

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xed;
        thread->fieldfc = 3;
        return 3;
    }

    if (token != 0xed)
        return -3;

    f = *(uint32_t *)((char *)(void *)(uintptr_t)obj->a10 + 0x10);
    obj->field2c = f;

    if ((f & 4u) != 0) {
        jade_normpal(obj);
        *mk3_frame(thread, thread->frame + 1) = 0xf4;
        thread->fieldfc = 0x16462;
        return 0x16462;
    }

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ---------------------------------------------------------------- t_do_unblock_hi
 *
 * armv7 0x0004d7a0, 172 bytes.  **Complete.**
 *
 *      token == 0:      obj->field20 = obj->field00->field18 = 0
 *                       obj->field40 = 0xc
 *                       find_ani_last_frame(obj)
 *                       obj->field40 = obj->field40 - 4
 *                       obj->a10     = obj->field40 - 4
 *                       do_next_a9_frame(obj)
 *                       token := 0x772, park 4
 *
 *      token == 0x772:  obj->field40 = obj->a10
 *                       do_next_a9_frame(obj)
 *                       token := 0x775, park 4
 *
 *      token == 0x775:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **Unblocking plays the block animation backwards, two frames of it.**
 * find_ani_last_frame leaves the last frame in 0x40; the routine steps back 4,
 * shows that, parks four frames, then steps back another 4 -- parked in 0x44
 * across the wait -- and shows that. So 0x44 is again the save slot and the two
 * `subs r3, #4` are two steps of one frame each, four bytes apart in whatever
 * table 0x40 indexes.
 *
 * The zero written into 0x20 and the proc's 0x18 is the token, still zero on
 * entry.
 */
void find_ani_last_frame(MK3OBJ *obj);
long do_next_a9_frame(MK3OBJ *obj);

long t_do_unblock_hi(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field20 = 0;
        obj->field00->field18 = 0;

        obj->field40 = 0xc;
        find_ani_last_frame(obj);
        obj->field40 = obj->field40 - 4;
        obj->a10     = obj->field40 - 4;
        do_next_a9_frame(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x772;
        thread->fieldfc = 4;
        return 4;
    }

    if (token == 0x772) {
        obj->field40 = obj->a10;
        do_next_a9_frame(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x775;
        thread->fieldfc = 4;
        return 4;
    }

    if (token != 0x775)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ---------------------------------------------------------------- tl_do_babality
 *
 * armv7 0x0004e994, 164 bytes.  **Complete.**
 *
 *      token == 0:      init_special(obj)
 *                       token := 0x1d0, descend into t_baby_start_pause
 *
 *      token == 0x1d0:  obj->field38 = t_turn_into_a_baby
 *                       takeover_him(obj)
 *                       token := 0x1d5, park 0x50
 *
 *      token == 0x1d5:  frame[frame].handler = tl_babality_complete
 *
 *      otherwise:       return -3
 *
 * **The victim does the work and the winner just waits eighty frames.** 0x38 is
 * loaded with t_turn_into_a_baby and takeover_him installs it on the other
 * fighter -- the same handover the slam family uses -- so the transformation runs
 * on the victim's thread while this one parks 0x50 and then finishes through
 * tl_babality_complete, which is already written above.
 *
 * Eighty frames is the longest single park in this file, which is about right for
 * a finisher animation.
 */
void takeover_him(MK3OBJ *obj);
long t_baby_start_pause(MK3THREAD *thread);
long t_turn_into_a_baby(MK3THREAD *thread);

long tl_do_babality(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        init_special(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x1d0;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_baby_start_pause;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1d0) {
        obj->field38 = (uint32_t)(uintptr_t)t_turn_into_a_baby;
        takeover_him(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x1d5;
        thread->fieldfc = 0x50;
        return 0x50;
    }

    if (token != 0x1d5)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)tl_babality_complete);
}


/* ------------------------------------------------------------------------ t_kick2
 *
 * armv7 0x0004c9e4, 180 bytes.  **Complete.**
 *
 *      token == 0:      obj->a10 = 6
 *                       token := 0x31a, descend into t_striker
 *
 *      token == 0x31a:  if (obj->field5c == 0) -- into the 0x31e body --
 *                       token := 0x31e, park 0xc
 *
 *      token == 0x31e:  obj->field20 = 0x60b
 *                       obj->field1c = 0x60b - 0x608 = 3
 *                       frame[frame].handler = t_retract_strike_act
 *
 *      otherwise:       return -3
 *
 * **The same three-state shape as t_do_knee and t_do_elbow in mkcombo.c**, and it
 * retracts through the very routine t_do_elbow uses. Set up, descend into
 * t_striker, and when t_striker answers in 0x5c: a hit waits twelve frames before
 * retracting, a miss retracts at once. So the strike-and-retract idiom is shared
 * across the two files and only the constants differ.
 *
 * All four of t_stat_do_hi_kick, t_stat_do_lo_kick, t_do_jumpup_kick and
 * t_do_jumpup_punch install this, which is why those four carry only setup.
 */
long t_striker(MK3THREAD *thread);
long t_retract_strike_act(MK3THREAD *thread);

long t_kick2(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 6;

        *mk3_frame(thread, thread->frame + 1) = 0x31a;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_striker;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x31a && obj->field5c != 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x31e;
        thread->fieldfc = 0xc;
        return 0xc;
    }

    if (token != 0x31a && token != 0x31e)
        return -3;

    obj->field20 = 0x60b;
    obj->field1c = 0x60b - 0x608;

    return mk3_install(thread, (MK3THREADFUNC)t_retract_strike_act);
}

/* ------------------------------------------------------------- t_baby_start_pause
 *
 * armv7 0x0004fd94, 172 bytes.  **Complete.**
 *
 *      token == 0:      obj->field20 = 5
 *                       token := 0x1c7, descend into t_init_death_blow
 *
 *      token == 0x1c7:  obj->field40 = 0
 *                       pose_a9_manual(obj)
 *                       token := 0x1ca, park 0x20
 *
 *      token == 0x1ca:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **A babality goes through the death-blow machinery first.** State 0 sets 0x20
 * to 5 and descends into t_init_death_blow off pointer slot 0x000f3194 -- the same
 * routine an ordinary finisher would use -- and only afterwards does the routine
 * pose animation zero by hand and wait thirty-two frames.
 *
 * `pose_a9_manual` with 0x40 zeroed is the same pair t_smoke_slam uses to
 * reposition, so animation zero posed manually is how a fighter is put into a
 * neutral frame.
 */
long t_init_death_blow(MK3THREAD *thread);        /* pointer slot 0x000f3194 */
void pose_a9_manual(MK3OBJ *obj);

long t_baby_start_pause(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field20 = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x1c7;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_init_death_blow;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1c7) {
        obj->field40 = 0;
        pose_a9_manual(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x1ca;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (token != 0x1ca)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}
