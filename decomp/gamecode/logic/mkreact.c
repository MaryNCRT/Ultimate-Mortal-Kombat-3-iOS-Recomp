/*
 * mkreact.c — src/gamecode/logic/mkreact.c (reaction sequences)
 *
 * Reactions are the things that happen TO a fighter: being knocked down,
 * getting up, staggering. They are written as coroutines on the switch-stack
 * machinery that `other.c` describes — each one runs a little, records where to
 * resume, and returns to the scheduler.
 *
 * Hand-written from the disassembly of the armv7 slice and verified against the
 * oracle: tests/test_gup2_diff.c.
 */

#include "mk3logic.h"

#define MK3_CHAR_SHAO_KAHN  0x19

void group_sound(MK3OBJ *obj);
void am_i_short(MK3OBJ *obj);
void shake_a11(MK3OBJ *obj);
void pose_a9_manual(MK3OBJ *obj);
void *FindThreadProc(uint32_t pid);
void away_x_vel(MK3OBJ *obj);
void match_ani_points_ob_ob(uint32_t a, uint32_t b);

/* gup2 was read before other.c existed, and it worked the thread struct out
 * on its own: a frame array at the head, the index at 0xa4, a word at 0xfc
 * that mirrors the return, and the object at 0x108. That is MK3THREAD field
 * for field, arrived at twice from two functions in two files without either
 * reading knowing about the other. Its local `PROC` and `SWITCHFRAME` are
 * dropped here in favour of the shared ones; the agreement is the point and
 * is recorded rather than quietly tidied away.
 *
 * Its local MK3OBJ named 0x1c, 0x40, 0x44, 0x48 and 0x5c, and the shared one
 * names all five. Only the spelling changes -- 0x44 is `a10` there. */

/* The reaction threads gup2 suspends into. Three of these are reached through
 * pointer slots in __DATA rather than directly — see the note on gup2. */
/* Declared as arrays so the NAME is the address, without claiming anything
 * about what is stored there. `extern void *x` would say these are variables
 * holding pointers; they are code and a table. */
extern char t_check_stay_down[];
extern char t_check_winner_status[];
extern char t_local_reaction_exit[];
extern char t_d_getup[];
long t_getup_stay_ducked(MK3THREAD *thread);
long t_joy_getup_abort(MK3THREAD *thread);

/* A data table, not a resume target. */
extern char getup_speeds[];

/* Decompiled elsewhere; this file owns the sequencing, not the steps. */
void back_to_normal(MK3OBJ *obj);
long  am_i_joy(MK3OBJ *obj);
long is_stick_down(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
long next_anirate(MK3OBJ *obj);
long joystick_in_a0(MK3OBJ *obj);

long gup2(MK3THREAD *thread);


/* ------------------------------------------------------------------ gup2
 *
 * armv7 0x00044254, 368 bytes.  `_gup2` -- src/gamecode/logic/mkreact.c
 *
 * **A coroutine, not a function.** This is the get-up sequence, and it is
 * resumable: it runs a little, records where to continue, and returns. The
 * switch stack at the head of PROC is how it remembers.
 *
 *      ldr.w r2, [r0, #0xa4]        ; the stack pointer
 *      ldr.w r5, [r0, #0x108]       ; the object
 *      adds  r3, r2, #1
 *      ldr.w r0, [r0, r3, lsl #3]   ; stack[sp + 1].code
 *
 * Entries are EIGHT bytes at `proc + index * 8` -- a code and a resume
 * address -- and the stack pointer lives at `+0xa4`, which is index 20.5. So
 * the array is twenty frames at the head of PROC with the pointer just past
 * it. The same machinery `other.c` describes.
 *
 * ## The five entry codes
 *
 * `stack[sp + 1].code` selects where to resume. Anything else returns -3:
 *
 *      0        first entry
 *      0x14d9   after t_check_stay_down
 *      0x14da   after t_check_winner_status
 *      0x14fc   after the animation step
 *      0x14ff   after t_local_reaction_exit
 *
 * ## Every resume target resolves to a named thread function
 *
 * They are reached two different ways and both had to be followed:
 *
 *      ldr r2, [pc, #N] ; add r2, pc            -> the function, Thumb bit set
 *      ldr r3, [pc, #N] ; add r3, pc ; ldr r1, [r3]   -> a POINTER SLOT
 *
 * The second kind is why three of them first looked like offsets into a UTF-16
 * string blob: the PC-relative arithmetic lands on a slot in __DATA and the
 * function address is what the slot HOLDS.
 *
 *      0x000f37a8 -> _t_check_winner_status
 *      0x000f3708 -> _t_local_reaction_exit
 *      0x000f37a4 -> _t_d_getup
 *      direct     -> _t_check_stay_down, _t_getup_stay_ducked, _t_joy_getup_abort
 *
 * `_getup_speeds` is not a resume target -- it is a data table assigned to the
 * object at `+0x48` on first entry.
 *
 * ## The shared epilogue
 *
 * Three paths jump into 0x442a2 and two into 0x442e0, which are the same two
 * lines: write a resume address into one frame, then zero the code of the frame
 * above it. That zero is what makes the NEXT call take the first-entry branch,
 * so it is the sequence terminating itself rather than housekeeping.
 *
 * ## Return values
 *
 *      -3   the code in the frame is none of the five
 *       0   suspended, resume address recorded
 *       1   the animation wants another frame        (also stored at proc+0xfc)
 *       2   the sequence is finished                 (also stored at proc+0xfc)
 *
 * ## What is NOT established
 *
 * The object offsets. `+0x40` is a pointer that is dereferenced for a word,
 * `+0x44` receives a copy of it and is later compared against 0x17, `+0x1c`
 * takes an animation rate, `+0x5c` is what `is_stick_down` sets, `+0x48` takes
 * the speed table. Every one of those is a single sighting in a single
 * function, which is a hypothesis and not a field. They are named by offset.
 *
 * Verified by tests/test_gup2_diff.c: the call sequence, the frames written,
 * the stack pointer, and the return value, over every entry code and both
 * branches of each gate. The six thread functions and the seven callees are
 * stubbed identically on both sides -- their addresses are compared by
 * identity, since a host build cannot hold the binary's own code pointers.
 */
long gup2(MK3THREAD *thread)
{
    uint32_t sp   = thread->frame;              /* +0xa4 */
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;     /* +0x108 */
    uint32_t code = *mk3_frame(thread, sp + 1);
    uint32_t next;

    switch (code) {
    default:
        return -3;                              /* mvn r0, #2 */

    /* ---------------------------------------------------- first entry */
    case 0:
        obj->field48 = (uint32_t)(uintptr_t)getup_speeds;
        obj->a10 = obj->field40;

        *mk3_frame(thread, sp + 1) = 0x14d9u;
        thread->frame = sp + 1;
        mk3_frame(thread, sp + 1)[1] = (uint32_t)(uintptr_t)t_check_stay_down;
        *mk3_frame(thread, sp + 2) = 0u;
        return 0;

    /* ------------------------------------- resumed after check_stay_down */
    case 0x14d9u:
        *mk3_frame(thread, sp + 1) = 0x14dau;
        thread->frame = sp + 1;
        mk3_frame(thread, sp + 1)[1] = (uint32_t)(uintptr_t)t_check_winner_status;
        *mk3_frame(thread, sp + 2) = 0u;
        return 0;

    /* ---------------------------------- resumed after local_reaction_exit
     *
     * Joins the epilogue above at 0x442a2, but with r2 still holding the
     * stack pointer from ENTRY rather than the incremented one -- so this
     * path writes into frame `sp` and does not advance. Reading the shared
     * tail without tracking which value of r2 reached it would put the resume
     * address one frame too high. */
    case 0x14ffu:
        mk3_frame(thread, sp)[1] = (uint32_t)(uintptr_t)t_local_reaction_exit;
        *mk3_frame(thread, sp + 1) = 0u;
        return 0;

    /* ------------------------------------ resumed after check_winner_status */
    case 0x14dau:
        back_to_normal(obj);
        if (am_i_joy(obj) == 0) {
            mk3_frame(thread, sp)[1] = (uint32_t)(uintptr_t)t_d_getup;
            *mk3_frame(thread, sp + 1) = 0u;
            return 0;
        }
        goto joystick_path;

    /* ------------------------------------------ resumed mid-animation */
    case 0x14fcu:
        next_anirate(obj);
        goto after_anirate;
    }

joystick_path:
    is_stick_down(obj);
    if (obj->field5c != 0) {
        mk3_frame(thread, sp)[1] = (uint32_t)(uintptr_t)t_getup_stay_ducked;
        *mk3_frame(thread, sp + 1) = 0u;
        return 0;
    }

    get_char_ani(obj);
    obj->field1c = 4;
    init_anirate(obj);
    next_anirate(obj);

after_anirate:
    /* 0x40 holds the animation cursor; the shared struct types it as a
     * word, so the dereference is spelled out. */
    next = *(const uint32_t *)(uintptr_t)obj->field40;
    obj->field1c = next;

    if (next == 0u) {
        /* the animation is done */
        *mk3_frame(thread, sp + 1) = 0x14ffu;
        thread->fieldfc            = 2;
        return 2;
    }

    if ((uintptr_t)obj->a10 != 0x17u) {
        is_stick_down(obj);
        if (obj->field5c != 0) {
            mk3_frame(thread, sp)[1] = (uint32_t)(uintptr_t)t_joy_getup_abort;
            *mk3_frame(thread, sp + 1) = 0u;
            return 0;
        }
        joystick_in_a0(obj);
    }

    *mk3_frame(thread, sp + 1) = 0x14fcu;
    thread->fieldfc            = 1;
    return 1;
}


/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_avoid_corner_trap(struct MK3THREAD *thread);
long t_avoid_corner_trap_b(struct MK3THREAD *thread);
long t_b_hard(struct MK3THREAD *thread);
long t_block2(struct MK3THREAD *thread);
long t_block_shake_n_exit(struct MK3THREAD *thread);
long t_r_boss_hit1(struct MK3THREAD *thread);
long t_r_kano_swipe(struct MK3THREAD *thread);
long t_r_last_noogy(struct MK3THREAD *thread);
long t_r_lia_zap(struct MK3THREAD *thread);
long t_r_rocket(struct MK3THREAD *thread);
long t_r_sw_zap(struct MK3THREAD *thread);
long t_spear0(struct MK3THREAD *thread);
long t_stumble_back_vel(struct MK3THREAD *thread);
long t_zap_stumble(struct MK3THREAD *thread);

/* t_r_smoke_spear -- armv7 0x000411c4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1f
 *      frame[frame].handler = t_spear0
 *      frame[frame+1].w0 = 0
 */

long t_r_smoke_spear(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1f;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_spear0);
}

/* t_r_scorpion_spear -- armv7 0x00041200, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x11
 *      frame[frame].handler = t_spear0
 *      frame[frame+1].w0 = 0
 */

long t_r_scorpion_spear(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x11;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_spear0);
}

/* t_r_sk_punch -- armv7 0x000413dc, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_boss_hit1
 *      frame[frame+1].w0 = 0
 */

long t_r_sk_punch(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_boss_hit1);
}

/* t_r_angle_kick -- armv7 0x0004154c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_last_noogy
 *      frame[frame+1].w0 = 0
 */

long t_r_angle_kick(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_last_noogy);
}

/* t_r_axe_horz -- armv7 0x00041590, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_kano_swipe
 *      frame[frame+1].w0 = 0
 */

long t_r_axe_horz(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_kano_swipe);
}

/* t_cc_block_avoid_corner -- armv7 0x00041644, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x1
 *      frame[frame].handler = t_avoid_corner_trap_b
 *      frame[frame+1].w0 = 0
 */

long t_cc_block_avoid_corner(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x1;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_avoid_corner_trap_b);
}

/* t_cc_ken_masters -- armv7 0x00041680, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x1
 *      frame[frame].handler = t_avoid_corner_trap
 *      frame[frame+1].w0 = 0
 */

long t_cc_ken_masters(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x1;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_avoid_corner_trap);
}

/* t_cc_block_upcut -- armv7 0x000416bc, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0   (the register the guard proved)
 *      frame[frame].handler = t_avoid_corner_trap
 *      frame[frame+1].w0 = 0
 */

long t_cc_block_upcut(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_avoid_corner_trap);
}

/* t_r_skull -- armv7 0x00041800, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_skull(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_ermac_zap -- armv7 0x00041834, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_ermac_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_swat_bomb -- armv7 0x00041868, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_rocket
 *      frame[frame+1].w0 = 0
 */

long t_r_swat_bomb(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_rocket);
}

/* t_r_ind_zap -- armv7 0x0004189c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_lia_zap
 *      frame[frame+1].w0 = 0
 */

long t_r_ind_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_lia_zap);
}

/* t_r_lia_zap -- armv7 0x000418d0, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_sw_zap
 *      frame[frame+1].w0 = 0
 */

long t_r_lia_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_sw_zap);
}

/* t_stumble_back -- armv7 0x00041a78, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x30000
 *      frame[frame].handler = t_stumble_back_vel
 *      frame[frame+1].w0 = 0
 */

long t_stumble_back(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x30000;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stumble_back_vel);
}

/* t_b_scream -- armv7 0x00041b0c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_b_hard
 *      frame[frame+1].w0 = 0
 */

long t_b_scream(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_b_hard);
}

/* t_b_hard_silent -- armv7 0x00041b40, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field38 = 0   (the register the guard proved)
 *      frame[frame].handler = t_block2
 *      frame[frame+1].w0 = 0
 */

long t_b_hard_silent(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field38 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_block2);
}

/* t_weak3 -- armv7 0x00041dc4, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x2
 *      obj->a10 = 0x3
 *      frame[frame].handler = t_block_shake_n_exit
 *      frame[frame+1].w0 = 0
 */

long t_weak3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x2;
    obj->a10 = 0x3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}

/* t_getup_reaction_exit -- armv7 0x00041f8c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0x21
 *      frame[frame].handler = gup2
 *      frame[frame+1].w0 = 0
 */

long t_getup_reaction_exit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0x21;

    return mk3_push_handler(thread, (MK3THREADFUNC)gup2);
}

/* t_sweepup_local_reaction_exit -- armv7 0x00041fc8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0x22
 *      frame[frame].handler = gup2
 *      frame[frame+1].w0 = 0
 */

long t_sweepup_local_reaction_exit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0x22;

    return mk3_push_handler(thread, (MK3THREADFUNC)gup2);
}


/* ---------------------------------------------------------------- inc_p_hit
 *
 * armv7 0x00041ab4, twelve bytes.  **Complete.**
 *
 *      n = obj->field00->p_hit + 1
 *      obj->field1c = n
 *      obj->field00->p_hit = n
 *
 * The hit counter `back_to_normal_px` reads to decide whether a combo
 * happened, and `t_gravity_ani` clears on landing. Both stores come from one
 * register, so the caller sees the new value in 0x1c without a second load.
 */
void inc_p_hit(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;
    uint32_t n = proc->p_hit + 1;

    obj->field1c = n;
    proc->p_hit = n;
}


/* -------------------------------------------------------------- inc_p_block
 *
 * armv7 0x00041580, sixteen bytes.  **Complete.**
 *
 *      obj->field00->field4c += 1
 *      obj->field1c = obj->field00->field4c
 *
 * `inc_p_hit`'s twin for blocks, at 0x4c of the PROC -- one of the six words
 * `back_to_normal_px` clears when a fighter goes back to normal. So a block
 * count and a hit count sit side by side and are reset together.
 *
 * Unlike its twin this one RE-READS the field for the copy rather than reusing
 * the register, which is four bytes more and the same answer.
 */
void inc_p_block(MK3OBJ *obj)
{
    uint32_t *n = (uint32_t *)((char *)obj->field00 + 0x4c);

    *n = *n + 1;
    obj->field1c = *(const uint32_t *)((char *)obj->field00 + 0x4c);
}


/* -------------------------------------------------------- if_shao_then_pass
 *
 * armv7 0x00041354, sixteen bytes.  **Complete**, and it names a character.
 *
 *      c = obj->field08->field24
 *      obj->field1c = c
 *      if (c == 0x19) obj->field34 = 0
 *
 * **Character 0x19 is Shao Kahn.** The function's name says so and its body
 * tests that one number -- the same way `t_back_to_shang_form` established
 * 0xc for Shang Tsung. Read off the symbol table rather than guessed from the
 * roster, which is the only way this project will name a character.
 *
 * 0x19 is also one of the three ids `is_finish_him_allowed` refuses, so the
 * two readings agree: the character with no finisher is the boss.
 *
 * The zero is formed as `c - 0x19`, which is zero exactly because the branch
 * that reaches it tested for equality. One register, no constant.
 */
void if_shao_then_pass(MK3OBJ *obj)
{
    uint32_t c = obj->field08->field24;

    obj->field1c = c;
    if (c == MK3_CHAR_SHAO_KAHN)
        obj->field34 = 0;               /* formed as c - 0x19 */
}


/* -------------------------------------------------------- rsnd_react_voice
 *
 * armv7 0x000420e4, sixteen bytes.  **Complete.**
 *
 *      obj->field1c = 6
 *      group_sound(obj)
 *
 * Group six is the reaction voice. `t_do_jump_up` uses group 1 the same way,
 * so 0x1c is which group and `group_sound` picks from it.
 */
void rsnd_react_voice(MK3OBJ *obj)
{
    obj->field1c = 6;
    group_sound(obj);
}


/* -------------------------------------------------------- tall_or_short_ani
 *
 * armv7 0x00044820, twenty bytes.  **Complete.**
 *
 *      am_i_short(obj)
 *      if (obj->field5c != 0) obj->field40 = obj->field30
 *
 * Two animations for one reaction, chosen by height: a short character takes
 * the one parked in 0x30 and everybody else keeps whatever 0x40 already held.
 * So the caller sets both and this picks, which is why the tall case has no
 * store at all.
 */
void tall_or_short_ani(MK3OBJ *obj)
{
    am_i_short(obj);
    if (obj->field5c != 0)
        obj->field40 = obj->field30;
}


/* --------------------------------------------------- at_least_ground_level
 *
 * armv7 0x000410e0, twenty-four bytes.  **Complete.**
 *
 *      y = (int16_t)obj->field08->field12
 *      obj->field1c = y
 *      g = obj->field00->field40
 *      obj->field20 = g
 *      if (g < y) obj->field08->field12 = g
 *
 * The clamp `t_flight_call` ends on, on its own: if the ground is above y the
 * fighter has sunk through the floor and is put back on it. `strh` under `lt`,
 * so it only ever moves upward and never off the floor.
 *
 * Both numbers are left behind, in 0x1c and 0x20, whether or not the clamp
 * fired -- so a caller can see how far under he was.
 */
void at_least_ground_level(MK3OBJ *obj)
{
    int32_t y = (int32_t)(int16_t)MK3_FIELD12(obj->field08);
    int32_t g = (int32_t)obj->field00->field40;

    obj->field1c = (uint32_t)y;
    obj->field20 = (uint32_t)g;

    if (g < y)
        MK3_SET_FIELD12(obj->field08, (uint32_t)g);
}


/* ------------------------------------------------------------ is_he_flipped
 *
 * armv7 0x000410f8, twenty-four bytes.  **Complete.**
 *
 *      f = him->field28
 *      obj->field2c = f
 *      obj->field5c = ((f >> 4) ^ 1) & 1
 *
 * Bit 4 of 0x28 is the facing `am_i_facing_him_px` gave a direction to: set
 * means facing left. So "flipped" is its complement, and this answers 1 when
 * he faces right.
 *
 * The whole flag word is left in 0x2c on the way past, which is how a caller
 * gets at the other bits without a second load.
 */
void is_he_flipped(MK3OBJ *obj)
{
    uint32_t f = ((MK3OBJ *)(uintptr_t)obj->field00->him)->field28;

    obj->field2c = f;
    obj->field5c = ((f >> 4) ^ 1u) & 1u;
}


/* ----------------------------------------------------------- move_slave_too
 *
 * armv7 0x0004761c, twenty-four bytes.  **Complete.**
 *
 *      s = obj->field00->slave
 *      obj->field1c = s
 *      if (s != 0) match_ani_points_ob_ob(obj->field08, s)
 *
 * Whatever just moved the fighter, the slave follows. The PROC's 0x68 is the
 * slave object `slave_ani` drives and the opcode-11 arm of the animation
 * interpreter creates; a zero there means there is none and the call is
 * skipped.
 */
void move_slave_too(MK3OBJ *obj)
{
    uint32_t s = obj->field00->slave;

    obj->field1c = s;
    if (s != 0)
        match_ani_points_ob_ob((uint32_t)(uintptr_t)obj->field08, s);
}


/* --------------------------------------------------------------- combo_setup
 *
 * armv7 0x000424e0, twenty-eight bytes.  **Complete.**
 *
 *      obj->field1c = 2
 *      group_sound(obj)
 *      obj->field48 = 0x60006
 *      shake_a11(obj)
 *
 * **The shake's two amplitudes are one word.** 0x60006 is 6 in each half, and
 * `t_shake2` splits exactly that slot -- the low half into the animation at
 * 0x40 and the high half into the A10 -- which `t_shake3` then uses as the
 * horizontal and vertical displacement. One `mov.w` and the screen shakes six
 * each way.
 *
 * Sound group 2 first, so the noise starts on the same tick as the shake.
 */
void combo_setup(MK3OBJ *obj)
{
    obj->field1c = 2;
    group_sound(obj);

    obj->field48 = 0x60006;             /* six each way, packed */
    shake_a11(obj);
}


/* -------------------------------------------------- pose_stumble_frame_1
 *
 * armv7 0x00047ad8, twenty-eight bytes.  **Complete.**
 *
 *      obj->field40 = 0x20
 *      pose_a9_manual(obj)
 *      obj->field1c = 2
 *      group_sound(obj)
 *
 * Animation 0x20 posed by hand rather than run, then the same sound group 2
 * `combo_setup` uses. The pose comes first, so the frame is on screen before
 * the noise.
 */
void pose_stumble_frame_1(MK3OBJ *obj)
{
    obj->field40 = 0x20;
    pose_a9_manual(obj);

    obj->field1c = 2;
    group_sound(obj);
}


/* -------------------------------------------------------------- shake_n_sound
 *
 * armv7 0x000424fc, twenty-eight bytes.  **Complete.**
 *
 *      obj->field48 = 0x60006
 *      shake_a11(obj)
 *      rsnd_func(obj, 0xd)
 *
 * `combo_setup` without the group sound and with a single effect instead: the
 * same 0x60006 -- six each way, packed as two halves of one word -- and then
 * sound 0xd directly rather than through a group.
 */
void shake_n_sound(MK3OBJ *obj)
{
    obj->field48 = 0x60006;             /* six each way, packed */
    shake_a11(obj);
    rsnd_func(obj, 0xd);
}


/* ---------------------------------------------------------- get_his_floor_ice
 *
 * armv7 0x000495cc, thirty-two bytes.  **Complete.**
 *
 *      i = obj->field00->field00->field00->field08
 *      obj->field1c = i + 0x707
 *      obj->field1c = FindThreadProc(i + 0x707)
 *
 * **A pid is a base plus the fighter's index.** `FindThreadProc` walks the
 * thread list comparing 0x104, and what it is given here is 0x707 plus the
 * opponent's index -- so a thread of this kind is registered under a
 * predictable number and found by arithmetic rather than by being remembered.
 *
 * The pid is left in 0x1c and then overwritten by the answer, so a caller sees
 * the proc and not the number it was found by.
 */
void get_his_floor_ice(MK3OBJ *obj)
{
    uint32_t pid = obj->field00->field00->field00->field08 + 0x707;

    obj->field1c = pid;
    obj->field1c = (uint32_t)(uintptr_t)FindThreadProc(pid);
}


/* ------------------------------------------------------------- get_my_hitq
 *
 * armv7 0x00041ac0, thirty-two bytes.  **Complete.**
 *
 *      obj->field1c = G + 0x390 + obj->field00->field08 * 12
 *
 * A per-fighter array in G with a stride of TWELVE -- a sixth layout in that
 * struct, after the 0x158 blocks, the four-byte bar pairs, the three clock
 * halfwords, the four queues at 0xc0 and the four tables at 0x3a8.
 *
 * `uhq_entry` says what twelve bytes are for: six halfwords. The stride is the
 * size, so each fighter's queue is its own array rather than a window on a
 * longer one.
 *
 * The multiply is `i*16 - i*4`, which is the compiler's way of reaching twelve
 * without a multiply instruction.
 */
void get_my_hitq(MK3OBJ *obj)
{
    uint32_t i = obj->field00->field08;

    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x390 + i * 12);
}


/* --------------------------------------------------------------- uhq_entry
 *
 * armv7 0x00041ae0, forty-four bytes.  **Complete.**
 *
 *      obj->field38 = obj->field00->field48
 *      get_my_hitq(obj)
 *      q = (uint16_t *)obj->field1c
 *      q[5] = q[4];  q[4] = q[3];  q[3] = q[2]
 *      q[2] = q[1];  q[1] = q[0]
 *      q[0] = (uint16_t)obj->field38
 *
 * The hit queue's push, written out: five moves down and one write at the
 * front, unrolled rather than looped. Six halfwords, oldest at the end, and
 * the sixth falls off.
 *
 * What goes in is the PROC's 0x48. `back_to_normal_px` clears that slot along
 * with the hit and block counters, so it is part of the same bookkeeping -- a
 * record of what has been landing, one entry per hit.
 *
 * The moves run high to low, which is the only order that does not overwrite
 * an entry before it has been copied.
 */
void uhq_entry(MK3OBJ *obj)
{
    uint16_t *q;

    obj->field38 = *(const uint32_t *)((char *)obj->field00 + 0x48);

    get_my_hitq(obj);
    q = (uint16_t *)(uintptr_t)obj->field1c;

    q[5] = q[4];                        /* high to low, or it eats itself */
    q[4] = q[3];
    q[3] = q[2];
    q[2] = q[1];
    q[1] = q[0];
    q[0] = (uint16_t)obj->field38;
}


/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_wait_forever(struct MK3THREAD *thread);

/* t_r_dummy -- armv7 0x00041110, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_r_dummy(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ------------------------------------------------------ get_block_ani_offset
 *
 * armv7 0x00044834, forty-eight bytes.  **Complete.**
 *
 *      obj->field40 = 0xc
 *      obj->field30 = 6
 *      c = obj->field08->field24
 *      obj->field1c = c
 *      if (c == 0xb) {
 *          a = obj->field08->field2c
 *          obj->field1c = a
 *          if ((uint32_t)(a - 0x1e3) <= 2) obj->field40 = 6
 *      }
 *      tall_or_short_ani(obj)
 *
 * Which animation a block uses. Everyone gets 0xc, with 6 parked in 0x30 as
 * the short-character alternative -- `tall_or_short_ani` is what chooses
 * between them, and it runs on every path.
 *
 * **One character is different.** When the character is 0xb and its current
 * animation is one of three consecutive numbers -- 0x1e3, 0x1e4, 0x1e5 --
 * the tall animation becomes 6 as well, so both branches of the height test
 * lead to the same frame.
 *
 * The range is tested as `(a - 0x1e3) <= 2` UNSIGNED, which rejects anything
 * below 0x1e3 by wrapping. One comparison for three values, and a signed test
 * would have needed two.
 *
 * The two constants are loaded once and 6 stays in its register across the
 * whole function, which is why the second store to 0x40 has no `movs` in
 * front of it.
 */
void get_block_ani_offset(MK3OBJ *obj)
{
    uint32_t c;

    obj->field40 = 0xc;
    obj->field30 = 6;                   /* the short-character alternative */

    c = obj->field08->field24;
    obj->field1c = c;

    if (c == 0xb) {
        uint32_t a = obj->field08->field2c;

        obj->field1c = a;
        if ((uint32_t)(a - 0x1e3) <= 2)         /* 0x1e3, 0x1e4 or 0x1e5 */
            obj->field40 = 6;
    }

    tall_or_short_ani(obj);
}


/* --------------------------------------------------------- repell_one_of_us
 *
 * armv7 0x000432b8, sixty-four bytes.  **Complete.**
 *
 *      am_i_close_to_edge(obj)
 *      if (obj->field5c == 0) { away_x_vel(obj); return; }
 *      if (obj->field38 != 0) {
 *          s1 = obj->field1c; s2 = obj->field20
 *          takeover_him(obj)
 *          obj->field1c = s1; obj->field20 = s2
 *      }
 *      obj->field1c = obj->field20
 *      call_for_him(obj, away_x_vel)
 *
 * Two fighters cannot occupy the same ground, and one of them has to give.
 * Away from the edge, this one moves itself. Against it, HE moves instead --
 * `call_for_him` runs `away_x_vel` on the other fighter, which is the same
 * routine pointed the other way.
 *
 * The name says "one of us" and the body says which: whoever is not cornered.
 *
 * `takeover_him` runs first when 0x38 is set, with 0x1c and 0x20 saved and put
 * back around it -- the borrow-and-restore this directory does everywhere, here
 * protecting two slots the callee is known to use.
 *
 * `away_x_vel` arrives through a pointer slot even though the other branch
 * calls it directly four instructions earlier. One function, one routine, two
 * ways of naming it -- because a direct call is a `bl` and a pointer handed to
 * `call_for_him` has to be an address.
 */
void am_i_close_to_edge(MK3OBJ *obj);
void takeover_him(MK3OBJ *obj);
void call_for_him(MK3OBJ *obj, void (*what)(MK3OBJ *));

void repell_one_of_us(MK3OBJ *obj)
{
    am_i_close_to_edge(obj);

    if (obj->field5c == 0) {            /* room to move: move myself */
        away_x_vel(obj);
        return;
    }

    if (obj->field38 != 0) {
        uint32_t s1 = obj->field1c;
        uint32_t s2 = obj->field20;

        takeover_him(obj);
        obj->field1c = s1;
        obj->field20 = s2;
    }

    obj->field1c = obj->field20;
    call_for_him(obj, away_x_vel);      /* cornered: he moves */
}


/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_ccp3(struct MK3THREAD *thread);

/* t_cc_hi_punch -- armv7 0x000415c4, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field30 = 0x6
 *      obj->field34 = 0x4
 *      frame[frame].handler = t_ccp3
 *      frame[frame+1].w0 = 0
 */

long t_cc_hi_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field30 = 0x6;
    obj->field34 = 0x4;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_ccp3);
}

/* t_cc_lo_punch -- armv7 0x00041604, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field30 = 0x5
 *      obj->field34 = 0x3
 *      frame[frame].handler = t_ccp3
 *      frame[frame+1].w0 = 0
 */

long t_cc_lo_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field30 = 0x5;
    obj->field34 = 0x3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_ccp3);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_airborn_hit_no_sound(struct MK3THREAD *thread);
long t_b_combo(struct MK3THREAD *thread);
long t_b_weak_silent(struct MK3THREAD *thread);
long t_combo43(struct MK3THREAD *thread);
long t_fall_on_my_back(struct MK3THREAD *thread);
long t_joy_down(struct MK3THREAD *thread);
long t_joy_getup_entry(struct MK3THREAD *thread);
long t_ken_masters_xfer(struct MK3THREAD *thread);
long t_r_freeze(struct MK3THREAD *thread);
long t_rek3(struct MK3THREAD *thread);
long t_rup3(struct MK3THREAD *thread);
long am_i_airborn(MK3OBJ *obj);
long create_blood_proc(MK3OBJ *obj);
void create_fx(MK3OBJ *obj);
long do_next_a9_frame(MK3OBJ *obj);
void find_ani_last_frame(MK3OBJ *obj);
void get_his_action(MK3OBJ *obj);
void his_ochar_sound(MK3OBJ *obj);
void ochar_sound_c(MK3OBJ *obj, uint32_t arg);
void set_half_damage(MK3OBJ *obj);

/* t_r_lk_zap -- armv7 0x00042190, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      group_sound(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_lk_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    group_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_pit_abort -- armv7 0x000421d4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      group_sound(obj)
 *      frame[frame].handler = t_rup3
 *      frame[frame+1].w0 = 0
 */

long t_pit_abort(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    group_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_rup3);
}

/* t_b_knee_elbow -- armv7 0x00042310, 72 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x40004
 *      shake_a11(obj)
 *      frame[frame].handler = t_b_combo
 *      frame[frame+1].w0 = 0
 */

long t_b_knee_elbow(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x40004;
    shake_a11(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_b_combo);
}

/* t_r_rocket -- armv7 0x00042400, 72 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x60006
 *      shake_a11(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_rocket(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x60006;
    shake_a11(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_b_weak -- armv7 0x00042778, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x6)
 *      frame[frame].handler = t_b_weak_silent
 *      frame[frame+1].w0 = 0
 */

long t_b_weak(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x6);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_b_weak_silent);
}

/* t_b_hard_ken_masters -- armv7 0x000427bc, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x5)
 *      obj->field38 = t_cc_block_avoid_corner
 *      frame[frame].handler = t_block2
 *      frame[frame+1].w0 = 0
 */

long t_b_hard_ken_masters(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x5);
    obj->field38 = (uint32_t)(uintptr_t)t_cc_block_avoid_corner;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_block2);
}

/* t_b_hard -- armv7 0x0004280c, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x5)
 *      frame[frame].handler = t_b_hard_silent
 *      frame[frame+1].w0 = 0
 */

long t_b_hard(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x5);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_b_hard_silent);
}

/* t_generic_airborn_hit -- armv7 0x00042850, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x8)
 *      rsnd_react_voice(obj)
 *      frame[frame].handler = t_airborn_hit_no_sound
 *      frame[frame+1].w0 = 0
 */

long t_generic_airborn_hit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x8);
    rsnd_react_voice(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_airborn_hit_no_sound);
}

/* t_r_elbow_knee -- armv7 0x00042ed4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x8)
 *      frame[frame].handler = t_rek3
 *      frame[frame+1].w0 = 0
 */

long t_r_elbow_knee(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x8);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_rek3);
}

/* t_separate_us -- armv7 0x00043250, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      am_i_close_to_edge(obj)
 *      obj->field1c = 0x30000
 *      obj->field38 = t_ken_masters_xfer
 *      takeover_him(obj)
 *      frame[frame].handler = t_stumble_back_vel
 *      frame[frame+1].w0 = 0
 */

long t_separate_us(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    am_i_close_to_edge(obj);
    obj->field1c = 0x30000;
    obj->field38 = (uint32_t)(uintptr_t)t_ken_masters_xfer;
    takeover_him(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stumble_back_vel);
}

/* t_block3 -- armv7 0x00043698, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x40004
 *      shake_a11(obj)
 *      obj->field1c = 0x20000
 *      away_x_vel(obj)
 *      obj->field48 = 0x2
 *      obj->a10 = 0x3
 *      frame[frame].handler = t_block_shake_n_exit
 *      frame[frame+1].w0 = 0
 */

long t_block3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x40004;
    shake_a11(obj);
    obj->field1c = 0x20000;
    away_x_vel(obj);
    obj->field48 = 0x2;
    obj->a10 = 0x3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}

/* t_joy_getup_abort -- armv7 0x000443c4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      player_normpal(obj)
 *      frame[frame].handler = t_joy_down
 *      frame[frame+1].w0 = 0
 */

long t_joy_getup_abort(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    player_normpal(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_joy_down);
}

/* t_getup_stay_ducked -- armv7 0x00044408, 84 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      back_to_normal(obj)
 *      obj->field40 = 0x4
 *      find_ani_last_frame(obj)
 *      do_next_a9_frame(obj)
 *      frame[frame].handler = t_joy_getup_entry
 *      frame[frame+1].w0 = 0
 */

long t_getup_stay_ducked(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    back_to_normal(obj);
    obj->field40 = 0x4;
    find_ani_last_frame(obj);
    do_next_a9_frame(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_joy_getup_entry);
}

/* t_r_boss_hit1 -- armv7 0x00045230, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x4
 *      create_blood_proc(obj)
 *      obj->field1c = 0x1
 *      create_blood_proc(obj)
 *      frame[frame].handler = t_combo43
 *      frame[frame+1].w0 = 0
 */

long t_r_boss_hit1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x4;
    create_blood_proc(obj);
    obj->field1c = 0x1;
    create_blood_proc(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_combo43);
}

/* t_r_bike_kicked_done -- armv7 0x000461ac, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      am_i_airborn(obj)
 *      obj->field1c = 0   (the register the guard proved)
 *      obj->field24 = 0x6000
 *      obj->field20 = 0   (the register the guard proved)
 *      obj->field28 = 0x5
 *      frame[frame].handler = t_fall_on_my_back
 *      frame[frame+1].w0 = 0
 */

long t_r_bike_kicked_done(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    am_i_airborn(obj);
    obj->field1c = 0;   /* the guard proved this register */
    obj->field24 = 0x6000;
    obj->field20 = 0;   /* the guard proved this register */
    obj->field28 = 0x5;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_fall_on_my_back);
}

/* t_r_decoy_freeze -- armv7 0x00046208, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x3
 *      create_fx(obj)
 *      obj->field1c = 0x5
 *      his_ochar_sound(obj)
 *      frame[frame].handler = t_r_freeze
 *      frame[frame+1].w0 = 0
 */

long t_r_decoy_freeze(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x3;
    create_fx(obj);
    obj->field1c = 0x5;
    his_ochar_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_freeze);
}

/* t_r_sonya_zap -- armv7 0x00046258, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1
 *      his_ochar_sound(obj)
 *      frame[frame].handler = t_r_ermac_zap
 *      frame[frame+1].w0 = 0
 */

long t_r_sonya_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1;
    his_ochar_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_ermac_zap);
}

/* t_r_sg_zap -- armv7 0x0004629c, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      his_ochar_sound(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_sg_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    his_ochar_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_kano_zap -- armv7 0x000462e0, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      his_ochar_sound(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_kano_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    his_ochar_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_mileena_zap -- armv7 0x00046710, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x9
 *      ochar_sound_c(obj, 0x11)
 *      set_half_damage(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_mileena_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x9;
    ochar_sound_c(obj, 0x11);
    set_half_damage(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_combo4 -- armv7 0x00046808, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      set_half_damage(obj)
 *      frame[frame].handler = t_combo43
 *      frame[frame+1].w0 = 0
 */

long t_r_combo4(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    set_half_damage(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_combo43);
}





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


