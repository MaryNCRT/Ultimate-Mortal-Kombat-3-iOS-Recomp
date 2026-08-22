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

#include <stdint.h>
#include <stddef.h>

/* ------------------------------------------------------------------------
 * The switch stack.
 *
 * `_gup2` indexes `proc + index * 8` and keeps its stack pointer at `+0xa4`,
 * which is index 20.5 — so the array is twenty frames at the head of PROC and
 * the pointer sits just past the end of it. Two functions would have to agree
 * on that before it is a fact rather than an arithmetic observation; for now
 * the layout is written the way gup2 uses it and nothing more is claimed.
 * ------------------------------------------------------------------------ */
#define SWITCH_STACK_FRAMES 20

typedef struct SWITCHFRAME {
    uint32_t code;               /* +0  which resume point, 0 = not started */
    void    *resume;             /* +4  the thread function to continue at */
} SWITCHFRAME;

/* Only the three fields gup2 touches are named. A placeholder array for the
 * rest would imply a total size nobody has measured. */
typedef struct PROC {
    SWITCHFRAME stack[SWITCH_STACK_FRAMES];  /* 0x00 */
    uint8_t     _pad_a0[4];                  /* 0xa0 */
    long        switchSP;                    /* 0xa4 */
    uint8_t     _pad_a8[0x54];               /* 0xa8 */
    long        fieldfc;                     /* 0xfc  1 or 2, mirrors the return */
    uint8_t     _pad_100[8];                 /* 0x100 */
    struct MK3OBJ *obj;                      /* 0x108 */
} PROC;

/* Every one of these is a single sighting in a single function. That is a
 * hypothesis, not a field, so they carry their offsets as names. */
typedef struct MK3OBJ {
    uint8_t   _pad00[0x1c];
    int       field1c;           /* 0x1c  an animation rate */
    uint8_t   _pad20[0x20];
    uint32_t *field40;           /* 0x40  dereferenced for one word */
    /* 0x44 takes a straight copy of the WORD at +0x40 (`ldr r3, [r5, #0x40];
     * str r3, [r5, #0x44]`) and is later compared against 0x17. A pointer
     * tested against 23 does not read as sensible, and nothing here explains
     * it -- so the copy is written as the machine performs it and the oddity
     * is left standing rather than resolved by choosing a nicer type. */
    void     *field44;           /* 0x44 */
    void     *field48;           /* 0x48  receives the speed table */
    uint8_t   _pad4c[0x10];
    int       field5c;           /* 0x5c  what is_stick_down sets */
} MK3OBJ;

/* The reaction threads gup2 suspends into. Three of these are reached through
 * pointer slots in __DATA rather than directly — see the note on gup2. */
/* Declared as arrays so the NAME is the address, without claiming anything
 * about what is stored there. `extern void *x` would say these are variables
 * holding pointers; they are code and a table. */
extern char t_check_stay_down[];
extern char t_check_winner_status[];
extern char t_local_reaction_exit[];
extern char t_d_getup[];
extern char t_getup_stay_ducked[];
extern char t_joy_getup_abort[];

/* A data table, not a resume target. */
extern char getup_speeds[];

/* Decompiled elsewhere; this file owns the sequencing, not the steps. */
void back_to_normal(MK3OBJ *obj);
int  am_i_joy(MK3OBJ *obj);
void is_stick_down(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
void next_anirate(MK3OBJ *obj);
void joystick_in_a0(MK3OBJ *obj);

long gup2(PROC *proc);


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
long gup2(PROC *proc)
{
    long     sp  = proc->switchSP;              /* +0xa4 */
    MK3OBJ  *obj = proc->obj;                   /* +0x108 */
    uint32_t code = proc->stack[sp + 1].code;
    uint32_t next;

    switch (code) {
    default:
        return -3;                              /* mvn r0, #2 */

    /* ---------------------------------------------------- first entry */
    case 0:
        obj->field48 = getup_speeds;
        obj->field44 = (void *)obj->field40;

        proc->stack[sp + 1].code   = 0x14d9u;
        proc->switchSP             = sp + 1;
        proc->stack[sp + 1].resume = t_check_stay_down;
        proc->stack[sp + 2].code   = 0u;
        return 0;

    /* ------------------------------------- resumed after check_stay_down */
    case 0x14d9u:
        proc->stack[sp + 1].code   = 0x14dau;
        proc->switchSP             = sp + 1;
        proc->stack[sp + 1].resume = t_check_winner_status;
        proc->stack[sp + 2].code   = 0u;
        return 0;

    /* ---------------------------------- resumed after local_reaction_exit
     *
     * Joins the epilogue above at 0x442a2, but with r2 still holding the
     * stack pointer from ENTRY rather than the incremented one -- so this
     * path writes into frame `sp` and does not advance. Reading the shared
     * tail without tracking which value of r2 reached it would put the resume
     * address one frame too high. */
    case 0x14ffu:
        proc->stack[sp].resume   = t_local_reaction_exit;
        proc->stack[sp + 1].code = 0u;
        return 0;

    /* ------------------------------------ resumed after check_winner_status */
    case 0x14dau:
        back_to_normal(obj);
        if (am_i_joy(obj) == 0) {
            proc->stack[sp].resume   = t_d_getup;
            proc->stack[sp + 1].code = 0u;
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
        proc->stack[sp].resume   = t_getup_stay_ducked;
        proc->stack[sp + 1].code = 0u;
        return 0;
    }

    get_char_ani(obj);
    obj->field1c = 4;
    init_anirate(obj);
    next_anirate(obj);

after_anirate:
    next = *obj->field40;
    obj->field1c = (int)next;

    if (next == 0u) {
        /* the animation is done */
        proc->stack[sp + 1].code = 0x14ffu;
        proc->fieldfc            = 2;
        return 2;
    }

    if ((uintptr_t)obj->field44 != 0x17u) {
        is_stick_down(obj);
        if (obj->field5c != 0) {
            proc->stack[sp].resume   = t_joy_getup_abort;
            proc->stack[sp + 1].code = 0u;
            return 0;
        }
        joystick_in_a0(obj);
    }

    proc->stack[sp + 1].code = 0x14fcu;
    proc->fieldfc            = 1;
    return 1;
}
