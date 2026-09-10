/*
 * mkfatal.c -- gamecode/logic/mkfatal.c, decompiled.
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

/* 0x001664d4, and the symbol table puts it in __DATA,__data -- NOT a routine.
 * An earlier pass declared it `long a_sb_skeleton_burn(MK3THREAD *)` because the
 * only thing reaching it was `obj->field40 = <address>`, which is exactly what a
 * handler store looks like. It is a word list, the same shape as the twenty
 * `a_<animal>` lists in mkanimal.c, and `t_robo_skeleton_burn` below proves it by
 * entering it at +8 -- an offset that would be meaningless on a function. */
extern uint32_t a_sb_skeleton_burn[];

long t_skburn3(struct MK3THREAD *thread);

/* t_sb_skeleton_burn -- armv7 0x0003322c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = a_sb_skeleton_burn
 *      frame[frame].handler = t_skburn3
 *      frame[frame+1].w0 = 0
 */

long t_sb_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = (uint32_t)(uintptr_t)a_sb_skeleton_burn;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_skburn3);
}


/* The callees these reach, declared from what the call sites
 * pass. One written later with a different signature will
 * conflict here, which is what the check is for. */
long do_next_a9_frame(MK3OBJ *obj);

/* rip_ani -- armv7 0x00036e94, 12 bytes.  **Complete.**
 *
 * A tail call to `do_next_a9_frame` with the arguments untouched, so whatever the
 * caller put in r1 goes with them. */
long rip_ani(MK3OBJ *obj)
{
    return do_next_a9_frame(obj);
}




/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_victory_animation(struct MK3THREAD *thread);

/* t_null_fatality -- armv7 0x00032f40, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_victory_animation
 *      frame[frame+1].w0 = 0
 */

long t_null_fatality(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_victory_animation);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_wait_forever(struct MK3THREAD *thread);
void away_x_vel(MK3OBJ *obj);
void back_to_normal(MK3OBJ *obj);
void center_around_me(MK3OBJ *obj);
void create_fx(MK3OBJ *obj);
void death_scream(MK3OBJ *obj);
void get_char_ani2(MK3OBJ *obj);
void pose_a9_manual(MK3OBJ *obj);
void set_inviso(MK3OBJ *obj);
long create_blood_proc(MK3OBJ *obj);
void face_opponent_px(MK3OBJ *obj, MK3OBJ *target);
void group_sound(MK3OBJ *obj);
void call_for_him(MK3OBJ *obj, void (*fn)(MK3OBJ *));
void takeover_him(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void ochar_sound(MK3OBJ *obj);
void match_me_with_him(MK3OBJ *obj);
void flip_multi(MK3OBJ *obj);
void multi_adjust_xy(MK3OBJ *obj);
void create_fx_xy(MK3OBJ *obj, uint32_t x, uint32_t y);
void send_code_a3(MK3OBJ *obj);
void ground_player(MK3OBJ *obj);
void init_special(MK3OBJ *obj);
void frame_a9(MK3OBJ *obj);
long t_local_reaction_exit(MK3THREAD *thread);
long t_animate_a0_frames(MK3THREAD *thread);
long t_shake_ob_up(MK3THREAD *thread);

/* t_scorp_skeleton_burn -- armv7 0x0003424c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      center_around_me(obj)
 *      frame[frame].handler = t_sb_skeleton_burn
 *      frame[frame+1].w0 = 0
 */

long t_scorp_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    center_around_me(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sb_skeleton_burn);
}

/* t_r_vomit -- armv7 0x0003511c, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      set_inviso(obj)
 *      obj->a10 = 0x5
 *      obj->field1c = 0x14
 *      create_fx(obj)
 *      death_scream(obj)
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_r_vomit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    set_inviso(obj);
    obj->a10 = 0x5;
    obj->field1c = 0x14;
    create_fx(obj);
    death_scream(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_about_2b_ripped -- armv7 0x0003a9cc, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      face_opponent(obj)
 *      back_to_normal(obj)
 *      obj->field40 = 0x25
 *      pose_a9_manual(obj)
 *      do_next_a9_frame(obj)
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_about_2b_ripped(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    face_opponent(obj);
    back_to_normal(obj);
    obj->field40 = 0x25;
    pose_a9_manual(obj);
    do_next_a9_frame(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */


/* ---------------------------------------------- the five smallest in the file
 *
 * Read one at a time from the disassembly. Each is complete: every
 * instruction is accounted for.
 */

/* death_scream -- armv7 0x00034fc4, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 9
 *      group_sound(obj)
 *
 * Sound 9 through the group router, which is how everything in this directory
 * asks for a noise: the id goes in 0x1c and the call takes it from there.
 * It ends `bl group_sound; pop {r7, pc}` -- a call and a return, so whatever
 * r0 holds afterwards belongs to the callee and this gives nothing back.
 */
void death_scream(MK3OBJ *obj)
{
    obj->field1c = 9;
    group_sound(obj);
}


/* his_death_scream -- armv7 0x00034cf0, 20 bytes.  **Complete.**
 *
 *      call_for_him(obj, death_scream)
 *
 * The same scream, run on the OTHER fighter. `call_for_him` is this
 * directory's way of doing something to the opponent without holding a
 * pointer to him: hand it a routine and it supplies the other object.
 *
 * `death_scream` arrives as a pc-relative literal with the Thumb bit set
 * (0x00034fc5 for a function at 0x00034fc4), which is how every function
 * pointer in this binary is spelled.
 */
void his_death_scream(MK3OBJ *obj)
{
    call_for_him(obj, death_scream);
}


/* make_him_invisible -- armv7 0x00034cdc, 20 bytes.  **Complete.**
 *
 *      call_for_him(obj, set_inviso)
 *
 * Same shape, different routine -- but the pointer is fetched DIFFERENTLY.
 * `his_death_scream` gets its target as a pc-relative address computed in
 * place; this one loads a pointer slot at 0x000f36c8 and dereferences it:
 *
 *      ldr r1, [pc, #8]
 *      add r1, pc          ; -> 0x000f36c8
 *      ldr r1, [r1]        ; -> 0x00054f71, _set_inviso
 *
 * The extra load is the difference between a function in this translation
 * unit and one in another. `set_inviso` lives in other.c.
 */
void make_him_invisible(MK3OBJ *obj)
{
    call_for_him(obj, set_inviso);
}


/* make_him_face_me -- armv7 0x000336d8, 16 bytes.  **Complete.**
 *
 *      face_opponent_px(obj, obj->field00->field00)
 *
 * Two loads to reach the other fighter -- through the PROC and out its first
 * field -- and the pair handed to the turn routine.
 *
 * The name is exact, and it takes reading `flip_multi_px` to see why:
 * that function does not read r0 at all. It flips `target->field08->field28`,
 * so the SECOND argument is the one that turns. `face_opponent(obj)` passes
 * obj twice and turns itself; this passes him, and turns him.
 */
void make_him_face_me(MK3OBJ *obj)
{
    face_opponent_px(obj, obj->field00->field00);
}


/* pounded_blood -- armv7 0x0003aa28, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 1
 *      create_blood_proc(obj)
 *
 * `death_scream` with a different routine and a different constant: one goes
 * in 0x1c and the call reads it. Blood type 1.
 */
void pounded_blood(MK3OBJ *obj)
{
    obj->field1c = 1;
    create_blood_proc(obj);
}


/* sans_repell_for_good -- armv7 0x00033450, 24 bytes.  **Complete.**
 *
 *      obj->field1c = 0x500
 *      *(uint16_t *)(G + 0x456) = 0x500
 *
 * The `sans_repell` pair in other.c writes its constant to **0x38** and to
 * the same halfword in the global state. This one writes **0x1c**. Same
 * global, same halfword, different field on the object -- recorded rather
 * than smoothed over, because nothing here says which of the two slots the
 * repel test actually reads.
 *
 * 0x500 fits a halfword exactly, so nothing is lost on the narrow store.
 */
void sans_repell_for_good(MK3OBJ *obj)
{
    obj->field1c = 0x500;
    *(uint16_t *)(G_BYTES + 0x456) = 0x500;
}


/* wfe_him -- armv7 0x0003361c, 24 bytes.  **Complete.**
 *
 *      obj->field38 = t_wait_forever
 *      takeover_him(obj)
 *
 * "wfe" is wait-forever, and the name is literal: it parks the OTHER fighter.
 *
 * 0x38 is where `fastxfer_thread` reads a thread entry point from, so writing
 * a function there and calling `takeover_him` is how one object hands the
 * other a routine to run. During a fatality the victim has nothing left to
 * do, and this is what stops him doing it.
 *
 * The pointer comes through a slot at 0x000f3724 holding 0x00054e49 -- the
 * odd address is `t_wait_forever` at 0x00054e48 with the Thumb bit set.
 */
void wfe_him(MK3OBJ *obj)
{
    obj->field38 = (uint32_t)(uintptr_t)t_wait_forever;
    takeover_him(obj);
}


/* borrow_char_ani -- armv7 0x00035210, 28 bytes.  **Complete.**
 *
 *      proc = obj->field08
 *      obj->field20 = proc->field24        ; save
 *      proc->field24 = obj->field1c        ; lend
 *      get_char_ani(obj)
 *      obj->field08->field24 = obj->field20 ; give back
 *
 * The borrow-and-restore this directory does everywhere, and here the name
 * says so outright. `get_char_ani` reads the character out of +0x24; this puts
 * a different one there for the length of one call and puts the real one back,
 * so a fatality can look up somebody else's animation.
 *
 * The lending happens on **0x08, the other object**, not on the PROC -- the
 * same field `get_block_ani_offset` reads the character and the current
 * animation through. 0x20 is the scratch slot, and 0x08 is re-loaded after the
 * call rather than kept, because the compiler assumed the callee could have
 * moved it.
 */
void borrow_char_ani(MK3OBJ *obj)
{
    MK3OBJ *other = obj->field08;

    obj->field20 = other->field24;
    other->field24 = obj->field1c;

    get_char_ani(obj);

    obj->field08->field24 = obj->field20;
}


/* hele_sound -- armv7 0x00034044, 28 bytes.  **Complete.**
 *
 *      obj->field1c = 0x1d; ochar_sound(obj)
 *      obj->field1c = 0x1e; ochar_sound(obj)
 *
 * Two sounds, back to back, 0x1d then 0x1e. The object is kept in r4 across
 * the first call and put back in r0 for the second, which is the whole reason
 * this function pushes a register at all.
 *
 * **The pair is the house idiom for a noise, and this is the only one with a name.**
 * `t_nado_sounds` later in this file plays 6 and 7 the same way, and mkanimal.c plays
 * 0x24 and 0x25 through `tsound_func` in three separate routines. So a sound effect here
 * is routinely two samples fired with nothing between them; do not read the second call
 * as a different event.
 */
void hele_sound(MK3OBJ *obj)
{
    obj->field1c = 0x1d;
    ochar_sound(obj);

    obj->field1c = 0x1e;
    ochar_sound(obj);
}


/* scared_pose -- armv7 0x00035d84, 28 bytes.  **Complete.**
 *
 *      obj->field40 = 0x48
 *      pose_a9_manual(obj)
 *      face_opponent(obj)
 *      death_scream(obj)
 *
 * Animation 0x48, posed by hand, turned to face the winner, and a scream.
 * The three calls in that order are the whole reaction.
 */
void scared_pose(MK3OBJ *obj)
{
    obj->field40 = 0x48;
    pose_a9_manual(obj);
    face_opponent(obj);
    death_scream(obj);
}


/* fatal_offset -- armv7 0x00035650, 32 bytes.  **Complete.**
 *
 *      s1 = obj->field1c; s2 = obj->field20
 *      match_me_with_him(obj)
 *      flip_multi(obj)
 *      obj->field1c = s1; obj->field20 = s2
 *      multi_adjust_xy(obj)
 *
 * Borrow and restore again, this time around TWO calls. `match_me_with_him`
 * and `flip_multi` both use 0x1c and 0x20 as working space, so the caller's
 * values are put back before `multi_adjust_xy` reads them.
 *
 * Which is what the name is about: the offset survives the positioning.
 */
void fatal_offset(MK3OBJ *obj)
{
    uint32_t s1 = obj->field1c;
    uint32_t s2 = obj->field20;

    match_me_with_him(obj);
    flip_multi(obj);

    obj->field1c = s1;
    obj->field20 = s2;

    multi_adjust_xy(obj);
}


/* lifts3 -- armv7 0x00033138, 36 bytes.  **Complete.**
 *
 *      d = obj->field24
 *      a = (MK3OBJ *)obj->field1c
 *      obj->field20 = (int16_t)a[+0x0e] + d ; a[+0x0e] = that, narrowed
 *      b = obj->field00->him
 *      obj->field1c = b
 *      obj->field20 = (int16_t)b[+0x0e] + d ; b[+0x0e] = that, narrowed
 *
 * **It moves both fighters by the same delta.** One object arrives in 0x1c
 * and the other is the opponent through PROC+0x04, and each has the same
 * amount added to the halfword at +0x0e.
 *
 * +0x0e is the HIGH half of 0x0c, which this file's struct calls a horizontal
 * position -- so by the offsets this shifts them sideways, and by the name it
 * lifts them. Both readings are written down because nothing here settles it:
 * the store is `strh`, so only the integer part of a 16.16 coordinate moves,
 * whichever axis 0x0c turns out to be.
 *
 * The addition is done at full width and narrowed on the way out, so a delta
 * that overflows sixteen bits wraps in the object rather than saturating.
 */
void lifts3(MK3OBJ *obj)
{
    long d = (long)obj->field24;
    MK3OBJ *a = (MK3OBJ *)(uintptr_t)obj->field1c;
    MK3OBJ *b;

    obj->field20 = (uint32_t)(*(int16_t *)((char *)a + 0x0e) + d);
    *(int16_t *)((char *)a + 0x0e) = (int16_t)obj->field20;

    b = (MK3OBJ *)(uintptr_t)obj->field00->him;
    obj->field1c = (uint32_t)(uintptr_t)b;

    obj->field20 = (uint32_t)(*(int16_t *)((char *)b + 0x0e) + d);
    *(int16_t *)((char *)b + 0x0e) = (int16_t)obj->field20;
}


/* skeleton_explode -- armv7 0x00035670, 36 bytes.  **Complete.**
 *
 *      set_inviso(obj)
 *      obj->field1c = 0x80
 *      obj->field20 = 0
 *      multi_adjust_xy(obj)
 *      obj->field1c = 0x18
 *      create_fx(obj)
 *
 * The body disappears, is nudged 0x80 along one axis and none along the
 * other, and effect 0x18 is spawned where it was.
 *
 * The zero is DERIVED, not loaded: `movs r3, #0x80` then `subs r3, #0x80`,
 * one instruction instead of a second constant. The same trick a few
 * functions away produces 0x15 from 0xffffffb8 by adding 0x5d, which wraps.
 */
void skeleton_explode(MK3OBJ *obj)
{
    set_inviso(obj);

    obj->field1c = 0x80;
    obj->field20 = 0;                   /* movs #0x80 then subs #0x80 */
    multi_adjust_xy(obj);

    obj->field1c = 0x18;
    create_fx(obj);
}


/* skinny_spawn -- armv7 0x00039768, 40 bytes.  **Complete.**
 *
 *      other = obj->field08
 *      p     = obj->field48
 *      x = (int16_t)other[+0x0e] + (int16_t)(p)          ; low half, signed
 *      y = (int16_t)other[+0x12] + (int32_t)p >> 16      ; high half, signed
 *      obj->field1c = 0x19
 *      create_fx_xy(obj, x, y)
 *
 * **0x48 is a packed pair of signed 16-bit offsets**, and this is what proves
 * it. The low half is sign-extended with `lsl #16` then `asr #16` -- the long
 * way round, because Thumb has no sign-extend-halfword-from-register here --
 * and the high half with a bare `asr #16`. One goes on each coordinate.
 *
 * That settles a value written elsewhere in this directory: `combo_setup`
 * stores 0x60006 into 0x48 and its note called it "six each way, packed".
 * Six each way is exactly what this reads.
 *
 * +0x0e and +0x12 are the high halves of 0x0c and 0x10, so the effect is
 * placed at the other object's integer position plus the offset.
 */
void skinny_spawn(MK3OBJ *obj)
{
    MK3OBJ *other = obj->field08;
    uint32_t p = obj->field48;
    long x = *(int16_t *)((char *)other + 0x0e) + (long)(int16_t)p;
    long y = *(int16_t *)((char *)other + 0x12) + ((long)(int32_t)p >> 16);

    obj->field1c = 0x19;
    create_fx_xy(obj, x, y);
}


/* death_blow_complete -- armv7 0x000336e8, 56 bytes.  **Complete.**
 *
 *      v = (int16_t)*(G + 0x450)
 *      obj->field20 = v
 *      obj->field1c = 0xffffffff
 *      *(int16_t *)(G + 0x450) = -1        ; consumed
 *      if (v == 4) return
 *      obj->field28 = 0x3b
 *      if (v != 3) obj->field28 = 0x37
 *      send_code_a3(obj)
 *
 * **A pending value in the global state, read once and cleared.** `G + 0x450`
 * holds which death blow is waiting; this takes it, writes -1 back so it
 * cannot be taken twice, and turns it into a code.
 *
 * Three outcomes from one halfword: 4 does nothing at all, 3 sends 0x3b, and
 * anything else sends 0x37. The store of 0x3b happens before the test for 3,
 * so it is written and then overwritten on the common path -- the compiler
 * hoisting a store rather than duplicating a branch.
 *
 * The slot is six bytes below `G + 0x456`, which the `sans_repell` family
 * writes. Two unrelated things in adjacent halfwords of the same structure.
 */
void death_blow_complete(MK3OBJ *obj)
{
    int16_t v = *(int16_t *)(G_BYTES + 0x450);

    obj->field20 = (uint32_t)(long)v;
    obj->field1c = 0xffffffffu;
    *(int16_t *)(G_BYTES + 0x450) = -1;         /* taken; not again */

    if (v == 4)
        return;

    obj->field28 = 0x3b;
    if (v != 3)
        obj->field28 = 0x37;

    send_code_a3(obj);
}


/* single_obj_thudd_1 -- armv7 0x0003ab30, 64 bytes.  **Complete.**
 *
 *      obj->field40 = 0x47
 *      get_char_ani(obj)                   ; 0x40 becomes a pointer
 *      a = *(uint32_t *)obj->field40       ; the animation's first word
 *      obj->field40 = a
 *      obj->field08->field2c = a & 0x3fff
 *      match_me_with_him(obj)
 *      ground_player(obj)
 *      obj->field20 = 0
 *      obj->field1c = 0xd
 *      multi_adjust_xy(obj)
 *      flip_multi(obj)
 *
 * **The animation number is fourteen bits.** The first word of an animation
 * is masked with 0x3fff before it becomes the other object's current
 * animation, so the top eighteen bits of that word are something else --
 * flags this file does not use. Worth knowing before anything compares a
 * raw first word against an animation id.
 *
 * 0x40 is a number on the way in and a pointer on the way out: `get_char_ani`
 * looks up 0x47 for this character and leaves the address there. The same
 * slot then takes the word it points at.
 */
void single_obj_thudd_1(MK3OBJ *obj)
{
    uint32_t a;

    obj->field40 = 0x47;
    get_char_ani(obj);                      /* 0x40: number in, pointer out */

    a = *(uint32_t *)(uintptr_t)obj->field40;
    obj->field40 = a;
    obj->field08->field2c = a & 0x3fff;     /* fourteen bits of animation */

    match_me_with_him(obj);
    ground_player(obj);

    obj->field20 = 0;
    obj->field1c = 0xd;
    multi_adjust_xy(obj);
    flip_multi(obj);
}


/* t_post_sliced_up -- armv7 0x000330f4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      other = ((MK3OBJ *)thread->proc)->field08
 *      other->field2c = other->field24 + 0x1ad6
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 *
 * **Animation by character number.** 0x24 is the character and 0x2c is the
 * animation, and this adds a base to one to get the other -- so the
 * post-slice animations sit consecutively from 0x1ad6, one per character,
 * and the id doubles as the index.
 *
 * The constant arrives in two instructions, `add.w #0x1ac0` then `adds #0x16`,
 * because 0x1ad6 is not one Thumb immediate.
 *
 * Then the thread parks forever. Being sliced up is not a state anything
 * recovers from, so the handler that runs next is the one that never
 * finishes -- reached here through the pointer slot at 0x000f3724, the same
 * one `wfe_him` uses.
 */
long t_post_sliced_up(MK3THREAD *thread)
{
    MK3OBJ *other;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    other = ((MK3OBJ *)thread->proc)->field08;
    other->field2c = other->field24 + 0x1ad6;   /* one per character */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ============================================ t_do_fatality_1, t_do_fatality_2
 *
 * armv7 0x000334b4 and 0x00033468, 76 bytes each.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj = thread->proc
 *      init_special(obj)
 *      h = ochar_fatalitiesN[obj->field08->field24]
 *      obj->field1c = h
 *      frame[frame].handler = h
 *      frame[frame+1].w0 = 0
 *
 * One function written twice, differing only in which table it indexes:
 * `_ochar_fatalities1` at 0x00166e68 and `_ochar_fatalities2` at 0x00166ed0.
 *
 * **The tables are 26 entries of four bytes.** 0x00166ed0 - 0x00166e68 is
 * 0x68, which is 104, which is 26 pointers -- so the second table begins
 * exactly where the first ends, and the roster is 26 characters. The index is
 * 0x24 on the other object, the same field `get_block_ani_offset` tests
 * against 0xb and `t_post_sliced_up` turns into an animation number.
 *
 * See docs/FATALITY-TABLES.md for both tables read out. They are the clearest
 * character-id list in the binary, because every entry is a named symbol.
 *
 * The chosen handler is written to 0x1c as well as installed. Nothing here
 * reads it back, but the fatality routines run with it there.
 */
extern MK3THREADFUNC ochar_fatalities1[26];    /* 0x00166e68 */
extern MK3THREADFUNC ochar_fatalities2[26];    /* 0x00166ed0 */

long t_do_fatality_1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);

    h = ochar_fatalities1[obj->field08->field24];
    obj->field1c = (uint32_t)(uintptr_t)h;

    return mk3_push_handler(thread, h);
}

long t_do_fatality_2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);

    h = ochar_fatalities2[obj->field08->field24];
    obj->field1c = (uint32_t)(uintptr_t)h;

    return mk3_push_handler(thread, h);
}


/* t_pumped -- armv7 0x00033018, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj   = thread->proc
 *      other = obj->field08
 *      other->field2c = ((uint32_t *)obj->field48)[other->field24]
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 *
 * The animation comes out of a **table the caller left in 0x48**, indexed by
 * the character -- so whoever installed this handler chose which table, and
 * this only does the lookup.
 *
 * **0x48 is a pointer here and a packed pair of offsets in `skinny_spawn`.**
 * Both readings are certain from their own instructions -- one indexes with
 * `lsl #2`, the other sign-extends two halves -- so the slot is scratch space
 * whose meaning belongs to whoever wrote it, like 0x38 already turned out to
 * be. Nothing on the object says which is in there.
 */
long t_pumped(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3OBJ *other;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    other = obj->field08;
    other->field2c = ((const uint32_t *)(uintptr_t)obj->field48)[other->field24];

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}


/* t_double_flame_ani -- armv7 0x0003b748, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame_a9(obj)
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 *
 * **The opposite of the push shape.** Everything else in this directory
 * INCREMENTS the frame index to call down a level; this one DECREMENTS it to
 * return up. One animation frame is advanced, and then the thread goes back
 * to whoever called it.
 *
 * The install is what happens when there is nowhere to go back to. `frame` is
 * signed here -- the test is `cmp #0` then `ble`, not `cbz` -- so a negative
 * index takes the same path as zero.
 */
long t_double_flame_ani(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    frame_a9((MK3OBJ *)thread->proc);

    if ((long)thread->frame > 0) {      /* cmp #0 / ble: signed */
        thread->frame -= 1;             /* back up a level */
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* t_normal_spin_intro -- armv7 0x00034958, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 2
 *      get_char_ani2(obj)
 *      obj->field1c = 0x10020
 *      frame[frame].handler = t_animate_a0_frames
 *      frame[frame+1].w0 = 0
 *
 * 0x10020 is `ldr r3, [pc, #0x24]` with **no `add r3, pc` after it** -- so it
 * is the literal itself and not an address. Every other pc-relative load in
 * this file is followed by that add, which is what turns an offset into an
 * address; missing the difference makes a constant into a pointer.
 *
 * The value reads as two packed halves, 1 and 0x20, which is a shape 0x1c
 * takes elsewhere in this directory. Nothing here says which half is which.
 */
long t_normal_spin_intro(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 2;
    get_char_ani2(obj);
    obj->field1c = 0x10020;             /* a literal, not an address */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_animate_a0_frames);
}


/* t_initial_skeleton_shake -- armv7 0x0003891c, 84 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x8000
 *      away_x_vel(obj)
 *      obj->field1c = 3
 *      obj->field20 = 3
 *      obj->field24 = 6
 *      frame[frame].handler = t_shake_ob_up
 *      frame[frame+1].w0 = 0
 *
 * A push away, then three numbers for the shake: 3, 3 and 6. The 6 is
 * `adds r3, r3, r3` on the 3 already in the register -- doubled rather than
 * loaded, the one-instruction saving this file makes everywhere.
 *
 * 0x8000 in 0x1c is the distance `away_x_vel` reads as its argument; the
 * three that follow belong to `t_shake_ob_up`.
 */
long t_initial_skeleton_shake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x8000;
    away_x_vel(obj);

    obj->field1c = 3;
    obj->field20 = 3;
    obj->field24 = 6;                   /* adds r3, r3, r3 */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_shake_ob_up);
}

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

long t_mframew(MK3THREAD *thread);
long t_r_jax_stomp(MK3THREAD *thread);
void tsound_func(MK3OBJ *obj, uint32_t arg);

/* t_light_animator -- armv7 0x0003315c, 116 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x6
 *          token := 0x154a, then descend into t_mframew
 *      token == 0x154a:
 *          park(token 0x154b, duration 0x16462)   and never wakes
 *      otherwise:  return -3
 */
long t_light_animator(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x6;
        *mk3_frame(thread, thread->frame + 1) = 0x154a;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x154a)
        return -3;

    *mk3_frame(thread, thread->frame + 1) = 0x154b;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}

/* t_crush_blood -- armv7 0x000331d0, 92 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x1
 *          park(token 0x15a1, duration 0x4)
 *      token == 0x15a1:
 *          obj->field1c = 0x1
 *          park(token 0x15a4, duration 0x16462)   and never wakes
 *      otherwise:  return -3
 */
long t_crush_blood(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x1;
        *mk3_frame(thread, thread->frame + 1) = 0x15a1;
        thread->fieldfc = 0x4;
        return 0x4;
    }

    if (token != 0x15a1)
        return -3;

    obj->field1c = 0x1;
    *mk3_frame(thread, thread->frame + 1) = 0x15a4;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}

/* t_make_db_tone -- armv7 0x00033c30, 88 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x1c04, duration 0x2)
 *      token == 0x1c04:
 *          obj->field28 = 0x36
 *          send_code_a3(obj)
 *          park(token 0x1c08, duration 0x16462)   and never wakes
 *      otherwise:  return -3
 */
long t_make_db_tone(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1c04;
        thread->fieldfc = 0x2;
        return 0x2;
    }

    if (token != 0x1c04)
        return -3;

    obj->field28 = 0x36;
    send_code_a3(obj);
    *mk3_frame(thread, thread->frame + 1) = 0x1c08;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}

/* t_r_mk_game_crush -- armv7 0x000350b8, 100 bytes.  **Complete.**
 *
 *      token == 0:
 *          center_around_me(obj)
 *          park(token 0xa1f, duration 0x14)
 *      token == 0xa1f:
 *          death_scream(obj)
 *          frame[frame].handler = t_r_jax_stomp
 *      otherwise:  return -3
 */
long t_r_mk_game_crush(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        center_around_me(obj);
        *mk3_frame(thread, thread->frame + 1) = 0xa1f;
        thread->fieldfc = 0x14;
        return 0x14;
    }

    if (token != 0xa1f)
        return -3;

    death_scream(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_r_jax_stomp);
}

/* t_flesh_rip_sound -- armv7 0x00036368, 96 bytes.  **Complete.**
 *
 *      token == 0:
 *          tsound_func(obj, 0x70)
 *          park(token 0x12d1, duration 0x40)
 *      token == 0x12d1:
 *          tsound_func(obj, 0x70)
 *          park(token 0x12d3, duration 0x16462)   and never wakes
 *      otherwise:  return -3
 */
long t_flesh_rip_sound(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        tsound_func(obj, 0x70);
        *mk3_frame(thread, thread->frame + 1) = 0x12d1;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token != 0x12d1)
        return -3;

    tsound_func(obj, 0x70);
    *mk3_frame(thread, thread->frame + 1) = 0x12d3;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_collapse_on_ground(MK3THREAD *thread);
void clear_inviso(MK3OBJ *obj);
void find_ani_part2(MK3OBJ *obj);
void find_part2(MK3OBJ *obj);

/* t_death_shake -- armv7 0x0003326c, 136 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x3
 *          obj->field20 = 0x3
 *          obj->field24 = 0x4
 *          token := 0x1769, then descend into t_shake_ob_up
 *      token == 0x1769:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_death_shake(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x3;
        obj->field20 = 0x3;
        obj->field24 = 0x4;
        *mk3_frame(thread, thread->frame + 1) = 0x1769;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1769)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_r_jax_stomp -- armv7 0x00035174, 156 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0x4
 *          get_char_ani(obj)
 *          obj->field1c = 0x3
 *          token := 0x10ab, then descend into t_mframew
 *      token == 0x10ab:
 *          set_inviso(obj)
 *          obj->field1c = 0x21
 *          create_fx(obj)
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_r_jax_stomp(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x4;
        get_char_ani(obj);
        obj->field1c = 0x3;
        *mk3_frame(thread, thread->frame + 1) = 0x10ab;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x10ab)
        return -3;

    set_inviso(obj);
    obj->field1c = 0x21;
    create_fx(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_crush_stuggle -- armv7 0x00035bac, 148 bytes.  **Complete.**
 *
 *      token == 0:
 *          face_opponent(obj)
 *          death_scream(obj)
 *          obj->field40 = 0x20
 *          find_ani_part2(obj)
 *          obj->field1c = 0x4
 *          token := 0x159a, then descend into t_mframew
 *      token == 0x159a:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_crush_stuggle(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        face_opponent(obj);
        death_scream(obj);
        obj->field40 = 0x20;
        find_ani_part2(obj);
        obj->field1c = 0x4;
        *mk3_frame(thread, thread->frame + 1) = 0x159a;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x159a)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_r_scared_of_scorp -- armv7 0x00035da0, 140 bytes.  **Complete.**
 *
 *      token == 0:
 *          scared_pose(obj)
 *          obj->field1c = 0x40000
 *          obj->field20 = 0x3
 *          obj->field24 = 0xc
 *          token := 0x407, then descend into t_shake_ob_up
 *      token == 0x407:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_r_scared_of_scorp(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        scared_pose(obj);
        obj->field1c = 0x40000;
        obj->field20 = 0x3;
        obj->field24 = 0xc;
        *mk3_frame(thread, thread->frame + 1) = 0x407;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x407)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_r_scared_of_skunk -- armv7 0x00035e2c, 140 bytes.  **Complete.**
 *
 *      token == 0:
 *          scared_pose(obj)
 *          obj->field1c = 0x40000
 *          obj->field20 = 0x3
 *          obj->field24 = 0xc
 *          token := 0x3fe, then descend into t_shake_ob_up
 *      token == 0x3fe:
 *          frame[frame].handler = t_collapse_on_ground
 *      otherwise:  return -3
 */
long t_r_scared_of_skunk(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        scared_pose(obj);
        obj->field1c = 0x40000;
        obj->field20 = 0x3;
        obj->field24 = 0xc;
        *mk3_frame(thread, thread->frame + 1) = 0x3fe;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x3fe)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_collapse_on_ground);
}

/* t_frozen_half_ani -- armv7 0x0003791c, 164 bytes.  **Complete.**
 *
 *      token == 0:
 *          flip_multi(obj)
 *          find_part2(obj)
 *          find_part2(obj)
 *          obj->field1c = 0x2
 *          token := 0x1462, then descend into t_mframew
 *      token == 0x1462:
 *          token := 0x1463, then descend into t_wait_forever
 *      otherwise:  return -3
 */
long t_frozen_half_ani(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        flip_multi(obj);
        find_part2(obj);
        find_part2(obj);
        obj->field1c = 0x2;
        *mk3_frame(thread, thread->frame + 1) = 0x1462;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1462)
        return -3;

    *mk3_frame(thread, thread->frame + 1) = 0x1463;
    thread->frame = thread->frame + 1;      /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_wait_forever;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* t_kang_reform -- armv7 0x0003a7dc, 148 bytes.  **Complete.**
 *
 *      token == 0:
 *          clear_inviso(obj)
 *          obj->field40 = 0x6
 *          get_char_ani2(obj)
 *          obj->field1c = 0x4
 *          token := 0xa7a, then descend into t_mframew
 *      token == 0xa7a:
 *          death_blow_complete(obj)
 *          frame[frame].handler = t_null_fatality
 *      otherwise:  return -3
 */
long t_kang_reform(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        clear_inviso(obj);
        obj->field40 = 0x6;
        get_char_ani2(obj);
        obj->field1c = 0x4;
        *mk3_frame(thread, thread->frame + 1) = 0xa7a;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xa7a)
        return -3;

    death_blow_complete(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_null_fatality);
}


/* ------------------------------------------------------------------ t_robo_skeleton_burn
 *
 * armv7 0x00035b58, 84 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      face_opponent(obj)
 *      center_around_me(obj)
 *      obj->field40 = &a_sb_skeleton_burn[2]
 *      frame[frame].handler = t_skburn3
 *
 * **The same three lines as `t_sb_skeleton_burn` at the top of this file, entering the list
 * two words in.** `add r3, #8` after the pc-relative load, and then the address goes into
 * 0x40 -- so the robot's burn plays the same sequence as Sub-Zero's from the third frame
 * rather than the first.
 *
 * **That +8 is what proves `a_sb_skeleton_burn` is data.** An offset into a function address
 * would be meaningless; an offset into a word list the cursor walks is the obvious way to
 * skip its first two entries. The declaration at the top of this file has been corrected
 * accordingly.
 *
 * `face_opponent` and `center_around_me` before the install are the two calls
 * `t_sb_skeleton_burn` does without, so the robot is also turned and centred first.
 */
void face_opponent(MK3OBJ *obj);

long t_robo_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    face_opponent(obj);
    center_around_me(obj);

    obj->field40 = (uint32_t)(uintptr_t)&a_sb_skeleton_burn[2];

    return mk3_push_handler(thread, (MK3THREADFUNC)t_skburn3);
}

/* ----------------------------------------------------------------------- t_crush_sleep_5
 *
 * armv7 0x000333f4, 92 bytes.  **Complete.**
 *
 *      token == 0:       token := 0x19ea, park 4
 *      token == 0x19ea:  pop a level, or t_local_reaction_exit at the bottom
 *      otherwise:        return -3
 *
 * **A four-frame wait and nothing else.** It never touches `thread->proc` -- there is no
 * `ldr [r0, #0x108]` in the body -- so it is a pure delay inserted into a chain, and the
 * name says which chain.
 *
 * It is also the leanest routine in the file: no prologue, no frame pointer, `bx lr` from
 * every path, because it makes no calls. Worth recognising the shape -- a park-and-pop with
 * no object access compiles to about ninety bytes and is always this.
 */
long t_crush_sleep_5(MK3THREAD *thread)
{
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        *mk3_frame(thread, frame + 1) = 0x19ea;
        thread->fieldfc = 4;
        return 4;
    }

    if (token != 0x19ea)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* -------------------------------------------------------------------- t_lk_skeleton_burn
 *
 * armv7 0x0003428c, 92 bytes.  **Complete.**
 *
 *      token == 0:      center_around_me(obj)
 *                       token := 0xa51, park 0xa
 *
 *      token == 0xa51:  frame[frame].handler = t_sb_skeleton_burn
 *
 *      otherwise:       return -3
 *
 * **Liu Kang's burn is Sub-Zero's, ten frames later.** Centre the fighter, wait, then install
 * `t_sb_skeleton_burn` -- which sets 0x40 to the start of the list and descends into
 * `t_skburn3`. So three routines in this file share one burn sequence and differ only in
 * their approach:
 *
 *      t_sb_skeleton_burn      the list from word 0, no preamble
 *      t_robo_skeleton_burn    the list from word 2, turned and centred
 *      t_lk_skeleton_burn      centred, ten frames, then t_sb_skeleton_burn
 *
 * The third one reaching the first through an install rather than repeating its two lines is
 * the clearest evidence that this is deliberate sharing and not three copies.
 */
long t_sb_skeleton_burn(MK3THREAD *thread);

long t_lk_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        center_around_me(obj);

        *mk3_frame(thread, frame + 1) = 0xa51;
        thread->fieldfc = 0xa;
        return 0xa;
    }

    if (token != 0xa51)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_sb_skeleton_burn);
}


/* ------------------------------------------------------------------------- t_grow_victum
 *
 * armv7 0x0003504c, 108 bytes.  **Complete.**
 *
 *      token == 0:       part->field2c = part->field24 + 0x1b00 + 0x12
 *                        token := 0x100c, park 0x46
 *
 *      token == 0x100c:  death_scream(obj)
 *                        frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **The animation is a base plus the character number**, 0x1b12 + `part->field24`, and the two
 * halves arrive as two instructions -- `add.w r3, r3, #0x1b00` then `adds r3, #0x12` -- because
 * 0x1b12 will not fit in one Thumb immediate. Written as the sum for that reason.
 *
 * That is the same interface as mkanimal.c's `cutup_body_init(obj, delta)`, which adds its
 * argument to the same field to pick a body-pieces set. So **"base plus character number" is
 * how this engine indexes per-character animation blocks**, and the base is the only thing a
 * caller supplies. Third site for it after `cutup_body_init`'s two callers.
 *
 * Seventy frames of growing, then the scream, then the thread parks forever -- so nothing here
 * shrinks the victim back. Whatever ends the fatality does it from outside.
 *
 * `r0` holds the object on entry and is overwritten with the part inside the first state only,
 * which is why the second state can call `death_scream` with no reload.
 */
long t_wait_forever(MK3THREAD *thread);

long t_grow_victum(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field08->field2c =
            obj->field08->field24 + 0x1b00 + 0x12;

        *mk3_frame(thread, frame + 1) = 0x100c;
        thread->fieldfc = 0x46;
        return 0x46;
    }

    if (token != 0x100c)
        return -3;

    death_scream(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* ------------------------------------------------------------------------- t_nado_sounds
 *
 * armv7 0x00034060, 108 bytes.  **Complete.**
 *
 *      token == 0:      obj->field1c = 6; ochar_sound(obj)
 *                       obj->field1c = 7; ochar_sound(obj)
 *                       token := 0xeb8, park 0x40
 *
 *      token == 0xeb8:  frame[frame].handler = t_nado_sounds
 *
 *      otherwise:       return -3
 *
 * **The reinstall-self loop, and this one never stops.** The second state installs THIS routine
 * over itself, which zeroes the token and therefore restarts at state 0 -- so sounds 6 and 7
 * play together, sixty-four frames pass, and they play again, for as long as the thread lives.
 *
 * Fourth site for that idiom, after mkstat.c's `t_shake_suspended` and `t_noogy_suspended` and
 * mkanimal.c's `t_animate_till_a11`. **The warning is the same every time: this is not "resume
 * at 0xeb8".** An install writes the handler and clears the token slot above it, so the next
 * tick enters at state 0. Reading it as a resume gives a routine that plays nothing.
 *
 * The two sounds are a pair with nothing between them, the same shape as `tsound_func(0x24)`
 * and `tsound_func(0x25)` in mkanimal.c -- one noise made of two samples. This is the
 * `ochar_sound` version, which takes its index in 0x1c rather than in a register.
 */
long t_nado_sounds(MK3THREAD *thread);

long t_nado_sounds(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field1c = 6;
        ochar_sound(obj);

        obj->field1c = 7;
        ochar_sound(obj);

        *mk3_frame(thread, frame + 1) = 0xeb8;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token != 0xeb8)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_nado_sounds);
}


/* ------------------------------------------------------------------------- t_orb_sleep_1
 *
 * armv7 0x00037174, 108 bytes.  **Complete.**
 *
 *      token == 0:       next_anirate(obj)
 *                        token := 0x163c, park 1
 *
 *      token == 0x163c:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:        return -3
 *
 * **One animation step and unwind.** The whole routine is a single call and the standard pop,
 * so it exists to give a parent one frame of animation at a known point rather than to do
 * anything of its own.
 *
 * Compare `t_crush_sleep_5` earlier in this batch, which is the same shape without the call and
 * with a four-frame park. The two together are the minimum useful thread handler in this engine:
 * do one thing, park, pop.
 */
long next_anirate(MK3OBJ *obj);

long t_orb_sleep_1(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        next_anirate(obj);

        *mk3_frame(thread, frame + 1) = 0x163c;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x163c)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------------- t_appearing_spikes
 *
 * armv7 0x00035ae8, 112 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x00030003; shake_a11(obj)
 *      obj->field1c = 7; ochar_sound(obj)
 *      part->field2c = 0x1b30
 *      obj->field1c = ~0x9f              (-0xa0)
 *      obj->field20 = -0xa0 + 0xf0 = 0x50
 *      multi_adjust_xy(obj)
 *      frame[frame].handler = t_wait_forever
 *
 * **One state, five effects, then park forever.** The spikes shake the screen, make a noise, set
 * an animation and move themselves, and then the thread has nothing left to do.
 *
 * **The animation is a bare constant, 0x1b30, where `t_grow_victum` computes 0x1b12 plus the
 * character number.** Both are in the same 0x1b00 block, so that block holds both per-character
 * runs and shared props -- and which it is depends on the routine, not the range. Do not assume
 * an animation number in this block needs indexing.
 *
 * The two `multi_adjust_xy` offsets come from one literal, `mvn r3, #0x9f` then `adds r3, #0xf0`,
 * giving -0xa0 and 0x50. Written as the arithmetic because the shared literal is the thing worth
 * seeing; the values alone would hide it. Same idiom as every `t_shake_ob_up` caller in
 * mkanimal.c.
 *
 * The shake pair is 0x00030003, doubled -- so the spikes shake evenly and softly, three against
 * the 0xa/0xa the large animals use.
 */
void shake_a11(MK3OBJ *obj);

long t_appearing_spikes(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x00030003;
    shake_a11(obj);

    obj->field1c = 7;
    ochar_sound(obj);

    obj->field08->field2c = 0x1b30;

    obj->field1c = (uint32_t)~0x9fu;
    obj->field20 = (uint32_t)(~0x9fu + 0xf0u);
    multi_adjust_xy(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ---------------------------------------------------------------------- t_down_the_staff
 *
 * armv7 0x00032ed0, 112 bytes.  **Complete.**
 *
 *      token == 0:      obj->field1c  = (int32_t)part->field1c >> 1
 *                       part->field1c = obj->field1c
 *                       token := 0x75d, park 1
 *
 *      token == 0x75d:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **It halves a velocity and writes the result to both the object and the part.** One frame,
 * then unwind -- so a parent that wants the slide down the staff to decay calls this repeatedly
 * rather than looping here.
 *
 * **The shift is `asrs`, arithmetic, so the value is SIGNED.** Transcribed as
 * `(int32_t)... >> 1` for that reason: an unsigned `>> 1` differs for every negative velocity,
 * which is exactly the case that matters when something is sliding the other way. A `lsrs`
 * would have been the unsigned halving and the binary does not use one.
 *
 * The same number lands in two places, `obj->field1c` and `part->field1c`, the way
 * `tl_kitana_bunny` and `tl_sektor_bat` in mkanimal.c write one velocity to an object and its
 * part together. So the object holds the working copy and the part holds the one the renderer
 * reads.
 */
long t_down_the_staff(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field1c = (uint32_t)((int32_t)obj->field08->field1c >> 1);
        obj->field08->field1c = obj->field1c;

        *mk3_frame(thread, frame + 1) = 0x75d;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x75d)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* -------------------------------------------------------------------- t_kludge_flame_ani
 *
 * armv7 0x0003b798, 116 bytes.  **Complete.**
 *
 *      token == 0:      obj->field20 = obj->field1c
 *                       multi_adjust_xy(obj)
 *                       frame_a9(obj)
 *                       token := 0x4b8, park 4
 *
 *      token == 0x4b8:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **It copies 0x1c into 0x20 so that `multi_adjust_xy` gets the same number on both axes**, and
 * the caller therefore supplies one offset instead of two. That is what the name is about: every
 * other caller of `multi_adjust_xy` in the tree sets the two fields independently, usually from
 * one literal with an `adds` or a `subs`, and this one deliberately does not.
 *
 * Which also means the caller cannot move the flame horizontally without moving it vertically by
 * the same amount. A diagonal-only helper is a strange interface, and the routine is named for
 * being one.
 *
 * After the shift it advances a frame and gives the level back, so like `t_orb_sleep_1` it is a
 * one-shot a parent drives rather than a loop.
 */
long t_kludge_flame_ani(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field20 = obj->field1c;
        multi_adjust_xy(obj);
        frame_a9(obj);

        *mk3_frame(thread, frame + 1) = 0x4b8;
        thread->fieldfc = 4;
        return 4;
    }

    if (token != 0x4b8)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ----------------------------------------------------------------- t_nails_blood_spawner
 *
 * armv7 0x0003aabc, 116 bytes.  **Complete.**
 *
 *      token == 0:      obj->a10 = 0xa
 *                       -- falls into the 0x40e tail --
 *
 *      token == 0x40e:  obj->field1c = 5; create_blood_proc(obj)
 *                       obj->field1c = 5; create_blood_proc(obj)
 *                       if (--obj->a10 == 0) { token := 0x416, park 0x16462 }
 *                       -- falls into the 0x40e tail --
 *
 *      the 0x40e tail:  token := 0x40e, park 2
 *
 *      otherwise:       return -3
 *
 * **Two blood effects a frame apart, ten times over, then the thread parks forever.** Twenty
 * spawns in twenty frames and no way back -- whatever cleans the fatality up does it from
 * outside.
 *
 * **Token 0x416 is not in the dispatch and the park is 0x16462.** Fourth site for that
 * terminator, after mkstat.c's `t_jade_flash_proc` and mkanimal.c's `t_crunch_sounds` and
 * `t_egg_proc`. The pattern is settled: a state that has nothing left to do parks for a
 * duration that never elapses, under a token the dispatch would refuse. Reaching it would
 * return -3 and it cannot be reached.
 *
 * **5 is stored into 0x1c twice, once before each call, out of the same register.** That is
 * `create_blood_proc` clobbering 0x1c -- the same reload mkanimal.c's `t_r_rabbit` needs around
 * its single call. Neither store is dead.
 */
long t_nails_blood_spawner(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->a10 = 0xa;

    } else if (token == 0x40e) {
        obj->field1c = 5;
        create_blood_proc(obj);
        obj->field1c = 5;
        create_blood_proc(obj);

        obj->a10 = obj->a10 - 1;
        if (obj->a10 == 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x416;
            thread->fieldfc = 0x16462;
            return 0x16462;
        }

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x40e;
    thread->fieldfc = 2;
    return 2;
}

/* ------------------------------------------------------------------------------ t_skburn3
 *
 * armv7 0x00034fd4, 120 bytes.  **Complete.**
 *
 *      token == 0:       death_scream(obj)
 *                        NewThread(obj, t_skel_fire_proc)
 *                        token := 0x1711, park 0x12
 *
 *      token == 0x1711:  set_inviso(obj)
 *                        frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **The end of the three burns, and the fire is a separate thread.** All three burn entry points
 * in this file -- `t_sb_skeleton_burn`, `t_robo_skeleton_burn` and `t_lk_skeleton_burn` -- reach
 * this routine, and it screams, starts `t_skel_fire_proc` on its own thread, waits eighteen
 * frames and makes the fighter invisible.
 *
 * So the visible fire outlives the routine that lit it: `set_inviso` removes the body while the
 * spawned thread keeps burning. Same division of labour as mkanimal.c's `t_r_rabbit` starting
 * `t_crunch_sounds`, and mkanimal.c's `tl_mileena_skunk` starting `t_odor_proc` -- **when an
 * effect has to outlast the state that caused it, this engine spawns a thread rather than
 * lengthening the state.**
 *
 * `obj->field40` is never read here, which is what makes the +8 in `t_robo_skeleton_burn`
 * interesting: the cursor that routine sets up must be consumed by `t_skel_fire_proc` or by the
 * animation machinery, not by this. Worth checking when `t_skel_fire_proc` is written.
 */
MK3THREAD *NewThread(void *owner, MK3THREADFUNC func);
long t_skel_fire_proc(MK3THREAD *thread);        /* 0x00036094 */

long t_skburn3(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        death_scream(obj);

        NewThread(obj, (MK3THREADFUNC)t_skel_fire_proc);

        *mk3_frame(thread, frame + 1) = 0x1711;
        thread->fieldfc = 0x12;
        return 0x12;
    }

    if (token != 0x1711)
        return -3;

    set_inviso(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}



/* -------------------------------------------------------------------------- t_hele_sleep
 *
 * armv7 0x000371e0, 128 bytes.  **Complete.**
 *
 *      token == 0:      token := 0xefa, park 1
 *
 *      token == 0xefa:  if (--obj->a10 == 0) {
 *                           obj->a10 = 0x20
 *                           hele_sound(obj)
 *                       }
 *                       next_anirate(obj)
 *                       pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **It pops every time, so the counter is what carries across calls.** The routine animates one
 * frame and gives the level straight back; `obj->a10` is not reset on entry, so a parent that
 * descends into this each frame gets the helicopter sound once every thirty-two frames and an
 * animation step on all of them.
 *
 * That is a different shape from the loops elsewhere in the tree: instead of holding the level
 * and re-arming its own token, this hands control back and relies on the OBJECT to remember. The
 * state machine is in the field, not in the frame.
 *
 * `obj->a10 = 0x20` is compiled as `adds r3, #0x20` on a register the branch has just proved to
 * be zero -- the same trick mkanimal.c's `tl_reptile_monkey` uses. Transcribed as the value,
 * because the arithmetic carries nothing the value does not.
 */
long t_hele_sleep(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        *mk3_frame(thread, frame + 1) = 0xefa;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0xefa)
        return -3;

    obj->a10 = obj->a10 - 1;
    if (obj->a10 == 0) {
        obj->a10 = 0x20;
        hele_sound(obj);
    }

    next_anirate(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* -------------------------------------------------------------------- t_slide_behind_hair
 *
 * armv7 0x00038c04, 128 bytes.  **Complete.**
 *
 *      token == 0:       set_noedge(obj)
 *                        obj->field1c = 0x40000; away_x_vel(obj)
 *                        token := 0x124d, park 1
 *
 *      token == 0x124d:  get_x_dist(obj)
 *                        if (obj->field28 <= 0x97) { token := 0x124d, park 1 }
 *                        stop_me_player(obj)
 *                        frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **A DEPARTURE test, where every distance loop measured so far has been an arrival.**
 * mkanimal.c has five ways of asking "have I arrived?"; this asks the opposite, re-arming while
 * the gap is 0x97 or less and stopping once it is larger. Same instruction shape --
 * `get_x_dist` then a branch on 0x28 -- and the comparison the other way round.
 *
 * So the loop is: remove the edge limit, push away at 0x40000, and keep going until the fighter
 * is more than 0x97 clear. The `set_noedge` in state 0 is what makes that possible; without it
 * the arena would stop the slide before the test could pass.
 *
 * Then `stop_me_player` and park forever -- no unwind, so whatever follows the fatality replaces
 * this handler from outside.
 */
void set_noedge(MK3OBJ *obj);
long get_x_dist(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);

long t_slide_behind_hair(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        set_noedge(obj);

        obj->field1c = 0x40000;
        away_x_vel(obj);

        *mk3_frame(thread, frame + 1) = 0x124d;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x124d)
        return -3;

    get_x_dist(obj);

    if ((long)obj->field28 <= 0x97) {
        *mk3_frame(thread, thread->frame + 1) = 0x124d;
        thread->fieldfc = 1;
        return 1;
    }

    stop_me_player(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ------------------------------------------------------------------------- t_r_jade_stab
 *
 * armv7 0x0003aa38, 132 bytes.  **Complete.**
 *
 *      token == 0:      rsnd_func(obj, 3)
 *                       death_scream(obj)
 *                       obj->a10 = 6
 *                       -- falls into the 0x7d7 tail --
 *
 *      token == 0x7d7:  if (--obj->a10 <= 0) frame[frame].handler = t_wait_forever
 *                       -- falls into the 0x7d7 tail --
 *
 *      the 0x7d7 tail:  obj->field1c = 5; create_blood_proc(obj)
 *                       token := 0x7d7, park 4
 *
 *      otherwise:       return -3
 *
 * **Sound, scream, then six blood spawns four frames apart, then park forever.** The victim's
 * side of a Jade stab, and the shape is the same counted spawn loop as
 * `t_nails_blood_spawner` earlier in this batch -- ten pairs two frames apart there, six singles
 * four frames apart here.
 *
 * The two differ in how they finish: `t_nails_blood_spawner` parks on 0x16462 under a token the
 * dispatch would refuse, and this installs `t_wait_forever`. **Both mean "this thread is done",
 * and the file uses them interchangeably** -- so neither is the canonical way to stop, and a
 * reader should not draw a distinction between them.
 *
 * The counter is set once in state 0 and the loop entry is shared, so 0x7d7 is written from two
 * places and 4 is the park in both.
 */
void rsnd_func(MK3OBJ *unused, uint32_t which);

long t_r_jade_stab(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        rsnd_func(obj, 3);
        death_scream(obj);

        obj->a10 = 6;

    } else if (token == 0x7d7) {
        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0)
            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    } else {
        return -3;
    }

    obj->field1c = 5;
    create_blood_proc(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x7d7;
    thread->fieldfc = 4;
    return 4;
}

/* ------------------------------------------------------------------------- t_animate_a11
 *
 * armv7 0x00033064, 144 bytes.  **Complete.**
 *
 *      token == 0:       obj->field40 = obj->field48
 *                        token := 0xfc4, descend into t_mframew
 *
 *      token == 0xfc4:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:        return -3
 *
 * **The close cousin of mkanimal.c's `t_kitty_spin`, and the difference is the whole point.**
 * Both move the cursor from 0x48 to 0x40, which is where the animation routines read it:
 *
 *      t_kitty_spin     also sets obj->field1c = 3, then INSTALLS t_mframew
 *      t_animate_a11    leaves 0x1c alone, then DESCENDS into t_mframew and pops
 *
 * So `t_kitty_spin` replaces itself and fixes the frame count at three, while this one keeps its
 * level, takes whatever count the caller left in 0x1c, and hands control back when the animation
 * finishes. A parent that needs to do something afterwards has to use this one.
 *
 * Reading the two together is what settles that **0x48 is where a caller parks an animation
 * cursor for a helper to pick up** -- two files, two routines, one convention. In mkanimal.c 0x48
 * is also a shake magnitude pair and a function pointer; the state decides, and here the state is
 * "about to animate".
 *
 * The routine makes no calls -- no prologue, `bx lr` from every path -- which is why it can keep
 * the object in `ip` throughout.
 */
long t_animate_a11(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field40 = obj->field48;

        *mk3_frame(thread, frame + 1) = 0xfc4;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xfc4)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------------------- t_st_spiked
 *
 * armv7 0x0003ab70, 144 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x28; create_fx(obj)
 *      obj->field48 = 0x00060006; shake_a11(obj)
 *      death_scream(obj)
 *      rsnd_func(obj, 3)
 *      ground_player(obj)
 *      obj->field40 = 0x1e; find_ani_part2(obj)
 *      find_last_frame(obj)
 *      do_next_a9_frame(obj)
 *      obj->field1c = 0
 *      obj->field20 = ~9                 (-0xa)
 *      multi_adjust_xy(obj)
 *      frame[frame].handler = t_wait_forever
 *
 * **Nine calls in one state, then park forever.** The victim lands on the spikes: effect 0x28,
 * a doubled 6/6 shake, the scream, sound 3, and then the body is grounded, posed at animation
 * 0x1e, wound to that animation's LAST frame, advanced one more, and nudged up by 0xa.
 *
 * **`find_last_frame` is the interesting call.** `find_ani_part2` sets the animation up and this
 * winds it to the end, so the corpse is drawn in its final pose rather than playing through --
 * which is why a routine that never animates again still calls `do_next_a9_frame` once.
 *
 * `obj->field1c = 0` comes out of the token register, which the dispatch has already proved to be
 * zero, so the store looks like `str r6, [r4, #0x1c]` rather than a `movs` and a store. Written as
 * 0 because that is what it is.
 *
 * The shift is vertical only -- 0 across and -0xa up -- one of the few `multi_adjust_xy` calls in
 * the tree that does not build both offsets from one literal.
 */
void find_last_frame(MK3OBJ *obj);

long t_st_spiked(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x28;
    create_fx(obj);

    obj->field48 = 0x00060006;
    shake_a11(obj);

    death_scream(obj);
    rsnd_func(obj, 3);
    ground_player(obj);

    obj->field40 = 0x1e;
    find_ani_part2(obj);
    find_last_frame(obj);
    do_next_a9_frame(obj);

    obj->field1c = 0;
    obj->field20 = (uint32_t)~9u;
    multi_adjust_xy(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* ---------------------------------------------------------------------- t_init_death_blow
 *
 * armv7 0x00033c88, 152 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      kind = (uint16_t)obj->field20
 *      *(short *)(G + 0x450) = kind
 *      *(short *)(G + 0x458) = kind
 *      init_special(obj)
 *      NewThread(obj, t_make_db_tone)
 *      obj->field1c = (int16_t)*(short *)(G + 0x450)
 *      if (obj->field1c != 2) MKEvent_Add(3, 0xe, 0, 0)
 *      pop a level, or t_local_reaction_exit at the bottom
 *
 * **This is the routine every finisher goes through, and it is where the kind number ends up.**
 * mkanimal.c's `t_animality_start_pause` writes 3 into `obj->field20` and descends here;
 * mkstat.c's `t_baby_start_pause` writes 5 and descends here. Both were transcribed with the note
 * that 0x20 must be a kind selector. It is, and this is the proof: the halfword is copied
 * straight out of 0x20 into **two** global slots, `G + 0x450` and `G + 0x458`, and everything
 * downstream reads the globals.
 *
 * Two slots for one value, written back to back with no branch between them, so they are not
 * per-player -- or if they are, this routine sets both players the same and something else
 * separates them later. Recorded as observed.
 *
 * **`kind == 2` is special and gets no event.** The routine reads the global back with `ldrsh` --
 * signed -- compares against 2, and skips `MKEvent_Add(3, 0xe, 0, 0)` when it matches. So one
 * finisher kind is silent to whatever consumes event 3/0xe, and 3 (animality) and 5 (babality)
 * both fire it. What kind 2 is has not been established; the two known values bracket it.
 *
 * The tone is a separate thread, `t_make_db_tone` -- the fourth site in the tree for spawning a
 * thread so an effect can outlast the state that started it, after `t_skburn3`'s fire and
 * mkanimal.c's crunches and odour.
 *
 * Note it POPS rather than parking: the death blow is set up in one tick and the caller resumes
 * immediately, which is why `t_animality_start_pause` has its own thirty-frame wait afterwards.
 */
void MKEvent_Add(long a, long b, long c, long d);
long t_make_db_tone(MK3THREAD *thread);          /* 0x00033c30 */

long t_init_death_blow(MK3THREAD *thread)
{
    MK3OBJ   *obj = (MK3OBJ *)thread->proc;
    uint16_t  kind;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    kind = (uint16_t)obj->field20;
    *(uint16_t *)(G_BYTES + 0x450) = kind;
    *(uint16_t *)(G_BYTES + 0x458) = kind;

    init_special(obj);

    NewThread(obj, (MK3THREADFUNC)t_make_db_tone);

    obj->field1c = (uint32_t)(int32_t)*(int16_t *)(G_BYTES + 0x450);
    if (obj->field1c != 2)
        MKEvent_Add(3, 0xe, 0, 0);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------------- t_bone_vomit_proc
 *
 * armv7 0x0003a050, 152 bytes.  **Complete.**
 *
 *      token == 0:       obj->a10 = 8
 *                        -- falls into the 0x3bd tail --
 *
 *      token == 0x3bd:   rsnd_func(obj, 3)
 *                        token := 0x3bf, park 3
 *
 *      token == 0x3bf:   rsnd_func(obj, 3)
 *                        if (--obj->a10 <= 0) { token := 0x3c4, park 0x16462 }
 *                        -- falls into the 0x3bd tail --
 *
 *      the 0x3bd tail:   obj->field1c = 0x31; create_fx(obj)
 *                        token := 0x3bd, park 3
 *
 *      otherwise:        return -3
 *
 * **A three-state ring: effect, sound, sound, round again -- eight times.** Each leg is three
 * frames, so the whole thing runs seventy-two frames and spawns effect 0x31 eight times with
 * sound 3 twice per spawn.
 *
 * Sound 3 fires from two different states with nothing else between them, which is the same
 * two-samples-per-noise habit `hele_sound` wraps in a routine -- except here it is the SAME sample
 * twice, three frames apart, rather than two different ones together. So the pair idiom is about
 * rhythm and not only about layering.
 *
 * **Token 0x3c4 is not in the dispatch and the park is 0x16462.** Fifth site for that terminator
 * in the tree, and the third in this file after `t_nails_blood_spawner` and `t_egg_proc` over in
 * mkanimal.c. It is settled beyond doubt now.
 */
long t_bone_vomit_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x3bd) {
        rsnd_func(obj, 3);

        *mk3_frame(thread, frame + 1) = 0x3bf;
        thread->fieldfc = 3;
        return 3;
    }

    if (token == 0) {
        obj->a10 = 8;

    } else if (token == 0x3bf) {
        rsnd_func(obj, 3);

        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x3c4;
            thread->fieldfc = 0x16462;
            return 0x16462;
        }

    } else {
        return -3;
    }

    obj->field1c = 0x31;
    create_fx(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x3bd;
    thread->fieldfc = 3;
    return 3;
}

/* --------------------------------------------------------------------- t_jade_shake_loop
 *
 * armv7 0x0003b43c, 152 bytes.  **Complete.**
 *
 *      token == 0:       me_in_front(obj)
 *                        proc->field1c = obj->field20
 *                        -- falls into the tail --
 *
 *      token == 0x7e6:   obj->field1c = proc->field20 - 1
 *                        if (obj->field1c <= 0)
 *                            pop a level, or t_local_reaction_exit at the bottom
 *                        -- falls into the tail --
 *
 *      the tail:         proc->field20 = obj->field1c
 *                        double_next_a9(obj)
 *                        obj->field1c = proc->field1c
 *                        token := 0x7e6, park obj->field1c
 *
 *      otherwise:        return -3
 *
 * **The park length is decided by the animation, not by the routine.** After `double_next_a9` the
 * tail reads `proc->field1c` -- the animation rate -- into 0x1c and parks for exactly that many
 * frames. So each pass of the shake waits as long as the current frame is meant to last, and the
 * loop stays in step with the animation instead of guessing at a constant.
 *
 * That is the first data-driven park measured in the tree. Every other loop so far parks for a
 * literal (1, 3, 4, 0x10, 0x20 ...) or for `obj->field1c` set from a literal a line earlier; this
 * one takes the number from the engine.
 *
 * **The counter lives in `proc->field20` and the working value in `obj->field1c`**, and the two
 * are shuffled between each pass: read the proc's count, decrement into the object, write it back.
 * State 0 seeds the proc's 0x1c from `obj->field20` and leaves `obj->field1c` as the caller set
 * it, so the caller supplies both the rate and the first count.
 *
 * `me_in_front` runs once, at entry, which is the only thing state 0 does beyond the seeding.
 */
void me_in_front(MK3OBJ *obj);
long double_next_a9(MK3OBJ *obj);

long t_jade_shake_loop(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        me_in_front(obj);

        obj->field00->field1c = obj->field20;

    } else if (token == 0x7e6) {
        obj->field1c = obj->field00->field20 - 1;

        if ((long)obj->field1c <= 0) {
            if ((long)frame > 0) {
                thread->frame = frame - 1;
                return 0;
            }
            return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
        }

    } else {
        return -3;
    }

    obj->field00->field20 = obj->field1c;
    double_next_a9(obj);
    obj->field1c = obj->field00->field1c;

    *mk3_frame(thread, thread->frame + 1) = 0x7e6;
    thread->fieldfc = obj->field1c;
    return (long)obj->field1c;
}


/* --------------------------------------------------------------------------- t_open_wide
 *
 * armv7 0x00035cec, 152 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      player_normpal(obj)
 *      face_opponent(obj)
 *      obj->field1c   = ochar_reached[part->field24]
 *      part->field2c  = part->field24 + 0x1bc0 + 0x24
 *      death_scream(obj)
 *      match_me_with_him(obj)
 *      flip_multi(obj)
 *      obj->field20 = 0
 *      obj->field1c = -ochar_wide_adjusts[part->field24]
 *      multi_adjust_xy(obj)
 *      frame[frame].handler = t_wait_forever
 *
 * **Two per-character tables, both named, and both new to the tree.** `ochar_reached` at
 * 0x001667c0 and `ochar_wide_adjusts` at 0x00166b54, each indexed by `part->field24` with
 * `ldr.w r3, [rN, r1, lsl #2]` -- so both are arrays of words, one entry per fighter.
 *
 * `ochar_wide_adjusts` is **negated before use** (`rsb r3, r3, #0`), and the result goes into 0x1c
 * with 0 in 0x20, so the table holds a positive horizontal distance and the fighter is shifted
 * backwards by it. That is the "wide" in the name: how far apart the two have to stand.
 *
 * **0x1c is written twice and the first value is consumed by one of the three calls between
 * them.** `ochar_reached[char]` goes in, then `death_scream`, `match_me_with_him` and `flip_multi`
 * run, then 0x1c is overwritten with the negated adjust. So the first store is NOT dead -- one of
 * those three reads it -- but which one is not settled by this routine. Recorded rather than
 * guessed.
 *
 * The animation is base plus character again, 0x1be4 + `part->field24`, arriving as
 * `add.w #0x1bc0` then `adds #0x24` because the constant will not fit one Thumb immediate. Fourth
 * site for that idiom after `t_grow_victum` here and `cutup_body_init`'s callers in mkanimal.c.
 */
extern uint32_t ochar_reached[];                 /* 0x001667c0 */
extern uint32_t ochar_wide_adjusts[];            /* 0x00166b54 */
void player_normpal(MK3OBJ *obj);

long t_open_wide(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    player_normpal(obj);
    face_opponent(obj);

    obj->field1c = ochar_reached[obj->field08->field24];
    obj->field08->field2c = obj->field08->field24 + 0x1bc0 + 0x24;

    death_scream(obj);
    match_me_with_him(obj);
    flip_multi(obj);

    obj->field20 = 0;
    obj->field1c =
        (uint32_t)(-(int32_t)ochar_wide_adjusts[obj->field08->field24]);
    multi_adjust_xy(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* --------------------------------------------------------------------- t_nail_spawn_proc
 *
 * armv7 0x00039fb4, 156 bytes.  **Complete.**
 *
 *      token == 0:       part->field2c = 0x1dd
 *                        obj->field1c = 0x2a
 *                        obj->field20 = 0x2a - 0x30 = -6
 *                        multi_adjust_xy(obj)
 *                        obj->a10 = 0x28
 *                        -- falls into the 0x448 tail --
 *
 *      token == 0x448:   token := 0x44a, park 1
 *
 *      token == 0x44a:   rsnd_func(obj, 6)
 *                        if (--obj->a10 == 0)
 *                            frame[frame].handler = t_wait_forever
 *                        -- falls into the 0x448 tail --
 *
 *      the 0x448 tail:   token := 0x448, park 1
 *
 *      otherwise:        return -3
 *
 * **Forty nails, two frames apart, then park forever.** The two states exist only to make the
 * period two frames rather than one: 0x448 waits and does nothing, 0x44a makes the noise and
 * counts. A single state with a park of 2 would have done the same thing, and the routine does not
 * do that.
 *
 * The animation is a bare constant, 0x1dd, with no character index -- the same distinction
 * `t_appearing_spikes` draws against `t_grow_victum`. So props get constants and fighters get
 * base-plus-character, and the block an animation lives in does not tell you which.
 *
 * One literal feeds both offsets again: `movs r3, #0x2a` then `subs r3, #0x30`, giving 0x2a across
 * and -6 up.
 */
long t_nail_spawn_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x448) {
        *mk3_frame(thread, frame + 1) = 0x44a;
        thread->fieldfc = 1;
        return 1;
    }

    if (token == 0) {
        obj->field08->field2c = 0x1dd;

        obj->field1c = 0x2a;
        obj->field20 = (uint32_t)(0x2a - 0x30);
        multi_adjust_xy(obj);

        obj->a10 = 0x28;

    } else if (token == 0x44a) {
        rsnd_func(obj, 6);

        obj->a10 = obj->a10 - 1;
        if (obj->a10 == 0)
            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x448;
    thread->fieldfc = 1;
    return 1;
}


/* -------------------------------------------------------------------------- t_green_shit
 *
 * armv7 0x00032f74, 164 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c = 5
 *                        token := 0xaa3, descend into t_mframew
 *
 *      token == 0xaa3:   obj->field1c   = 0xffffd000
 *                        part->field1c  = 0xffffd000
 *                        token := 0xaa7, park 0x40
 *
 *      token == 0xaa7:   token := 0xaa9, park 0x16462
 *
 *      otherwise:        return -3
 *
 * **Five frames of animation, an upward velocity, sixty-four frames, done.** 0xffffd000 is
 * -0x3000 -- negative, so up -- and it goes into the object and the part together, the same
 * two-places-one-value pattern `t_down_the_staff` uses for its halved velocity.
 *
 * **Token 0xaa9 is not in the dispatch and the park is 0x16462.** Sixth site for that terminator.
 *
 * The routine keeps the object in `ip` and the first token in `lr` for its whole length, and
 * pushes only `lr` -- so it makes no calls of its own beyond the descent. `t_mframew` does all the
 * work of the first state.
 */
long t_green_shit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xaa3) {
        obj->field1c          = 0xffffd000u;
        obj->field08->field1c = 0xffffd000u;

        *mk3_frame(thread, frame + 1) = 0xaa7;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token == 0xaa7) {
        *mk3_frame(thread, frame + 1) = 0xaa9;
        thread->fieldfc = 0x16462;
        return 0x16462;
    }

    if (token != 0)
        return -3;

    obj->field1c = 5;

    *mk3_frame(thread, thread->frame + 1) = 0xaa3;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* ---------------------------------------------------------------------- t_smoke_dropping
 *
 * armv7 0x00033634, 164 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c  = 0x20000
 *                        part->field1c = 0x20000
 *                        token := 0x8f3, park 1
 *
 *      token == 0x8f3:   obj->field1c  = part->field1c + 0x2000
 *                        part->field1c = obj->field1c
 *                        obj->field1c = *(long *)(G + 0xac)
 *                        obj->field20 = (int16_t)part->y12 - obj->field1c
 *                        if (obj->field20 < 0) obj->field20 = -obj->field20
 *                        if (obj->field20 > 0x80) { token := 0x8f3, park 1 }
 *                        obj->field38 = t_eat_this_shit
 *                        takeover_him(obj)
 *                        token := 0x901, park 0x16462
 *
 *      otherwise:        return -3
 *
 * **Gravity written out by hand: the velocity grows by 0x2000 every frame and the loop ends when
 * the part is within 0x80 of the floor.** The starting velocity is 0x20000, each pass reads the
 * part's 0x1c, adds 0x2000, and writes it back to both the object and the part -- so the object
 * carries the working copy and the part is what the renderer moves by.
 *
 * **The distance test is the absolute value done in two instructions**, `itt lt` with `rsblt`, the
 * same shape mkanimal.c's `tl_scorpion_pengo` uses to measure the gap to the opponent. Second site
 * for that idiom, and the first that measures against the FLOOR rather than another fighter --
 * `G + 0xac` again, read as a word here.
 *
 * That makes six routines in the tree reading `G + 0xac`. The five in mkanimal.c place a body ON
 * the floor; this one asks how far above it something still is. Same global, different question.
 *
 * When it lands, the victim gets `t_eat_this_shit` through 0x38 and `takeover_him`, and this thread
 * parks on 0x16462 under token 0x901 -- not in the dispatch. Seventh site for that terminator, and
 * the same reason as `t_egg_proc` in mkanimal.c: after the handover there is nothing left to do.
 */
long t_eat_this_shit(MK3THREAD *thread);         /* 0x00039d0c */

long t_smoke_dropping(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field1c          = 0x20000;
        obj->field08->field1c = 0x20000;

        *mk3_frame(thread, frame + 1) = 0x8f3;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x8f3)
        return -3;

    obj->field1c          = obj->field08->field1c + 0x2000;
    obj->field08->field1c = obj->field1c;

    obj->field1c = *(uint32_t *)(G_BYTES + 0xac);
    obj->field20 = (uint32_t)((int32_t)(int16_t)MK3_FIELD12(obj->field08)
                              - (int32_t)obj->field1c);
    if ((long)obj->field20 < 0)
        obj->field20 = (uint32_t)(-(long)obj->field20);

    if ((long)obj->field20 > 0x80) {
        *mk3_frame(thread, thread->frame + 1) = 0x8f3;
        thread->fieldfc = 1;
        return 1;
    }

    obj->field38 = (uint32_t)(uintptr_t)t_eat_this_shit;
    takeover_him(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x901;
    thread->fieldfc = 0x16462;
    return 0x16462;
}
