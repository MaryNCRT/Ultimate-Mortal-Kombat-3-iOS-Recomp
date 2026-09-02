/*
 * other.c — src/gamecode/logic/other.c (process scheduler)
 *
 * The fight engine runs on cooperative "threads": each player object owns a
 * PROC, and state changes are queued rather than applied directly. This file
 * is the queueing side of that machinery.
 *
 * Hand-written from the disassembly of the armv7 slice and verified against
 * the oracle: tests/test_switchqueue_diff.c.
 *
 * The entry points into this system, all confirmed present in the binary:
 *
 *   _StartThreadAt    0x00056cac
 *   _KillSThread      0x00056cbc
 *   _KillProc         0x00056d14
 *   _SwitchQueue      0x00055ed4   <- implemented here
 *   _DoSwitchJump     0x00055efc   <- dispatches through function pointers
 *   _QueueAndJump     0x000572b8
 *   _UnstackSwitches  0x000573e8
 *   _clear_queues     0x00058974
 *
 * Note _DoSwitchJump reaches its target through a table of function pointers,
 * so the static recompiler cannot follow it. It has to be decompiled by hand
 * and checked by observation against the game running in touchHLE.
 */

#include <stddef.h>   /* NULL */
#include <stdint.h>


/* ------------------------------------------------------------------------
 * The player object, as far as isp2 establishes it.
 *
 * Two offsets only. Everything else about this struct is unmapped and stays
 * that way -- a placeholder array would imply a size nobody has measured.
 * ------------------------------------------------------------------------ */
/* The cooperative thread. Its fields are the ones StartThreadAt writes and
 * t_self_terminate reads; the eight-byte array they index sits at the thread's
 * own address and overlaps them, which is why `frame` is never small. */
typedef void (*MK3THREADFUNC)(void);

/* The thread, as its writers and readers establish it. Only the offsets that
 * appear in this file are named. */
typedef struct MK3THREAD {
    uint8_t       _pad00[4];
    MK3THREADFUNC func;          /* 0x04  what StartThreadAt puts there */
    uint32_t      field08;       /* 0x08  cleared with it */
    uint8_t       _pad0c[0x98];
    uint32_t      frame;         /* 0xa4  the index into the frame array */
    uint8_t       _pad_a8[0x50];
    uint32_t      fieldf8;       /* 0xf8  fastxfer_thread clears it too */
    uint32_t      fieldfc;       /* 0xfc  cleared on start, set on terminate */
    uint8_t       _pad100[4];
    uint32_t      pid;           /* 0x104 NewThreadProcPid sets it */
    void         *proc;          /* 0x108 FindThreadProc and NewThreadProc
                                  *       return it */
} MK3THREAD;


void  KillSThread(MK3THREAD *thread);
void  StartThreadAt(MK3THREAD *thread, MK3THREADFUNC func);
void *GetThreadFunc(MK3THREAD *thread);

typedef struct MK3OBJPROC {
    /* 0x00  the other fighter's object.
     *
     * Six functions reach `obj->field00->field00` and every one of them is
     * named for the opponent -- ground_him, is_he_airborn, is_he_facing_me,
     * center_around_him, get_his_action, do_his_next_a9_frame -- so the
     * composite is what it looks like.
     *
     * The field is still called field00 and not `him`, because `him` is
     * already taken by 0x04 below, on the authority of a function name that
     * says so just as plainly. One of the two readings is incomplete and
     * nothing here settles which. */
    struct MK3OBJ *field00;
    uint32_t him;                /* 0x04  the opponent, per f_set_a10_to_him */
    uint32_t field08;            /* 0x08  the strength index, and what
                                  *       lights_on_hit passes on */
    uint8_t  _pad0c[4];
    uint32_t field10;            /* 0x10  isp2 ORs bit 4 into this */
    uint8_t  _pad14a[4];
    uint32_t field18;            /* 0x18  the action get_his_action reads and
                                  *       init_special_act writes */
    uint8_t  _pad1c[0x24];
    uint16_t field40;            /* 0x40  ground_player copies it out */
    uint8_t  _pad42[2];
    uint32_t p_hit;              /* 0x44  per zero_my_p_hit */
    uint8_t  _pad48[0x0c];
    uint32_t field54;            /* 0x54  add_combo_damage accumulates here */
    uint8_t  _pad58[0x0c];
    uint32_t field64;            /* 0x64  the slave's object; delete_slave
                                  *       hands it to KillProc */
    uint32_t slave;              /* 0x68  per f_set_a10_to_slave */
    uint8_t  _pad6c[0x10];
    uint16_t field7c;            /* 0x7c  the four-button gate, signed */
} MK3OBJPROC;

/* The high half of the word at 0x0c, which several routines read on its own
 * and one of them sign-extends. Little-endian: 0x0e is the top two bytes. */
#define MK3_FIELD0E(o)   ((uint16_t)((o)->field0c >> 16))

typedef struct MK3OBJ {
    MK3OBJPROC *field00;         /* 0x00  ldr r2, [r4] */
    /* 0x04  the object's thread. KillProc and StartProcAt both take it out of
     * here and hand it to KillSThread / StartThreadAt, which is what makes the
     * pair the object-level spelling of the thread-level calls. */
    MK3THREAD  *thread;          /* 0x04 */
    struct MK3OBJ *field08;      /* 0x08  another object: player_swpal writes
                                  *       through it and ani2 passes it on */
    uint32_t    field0c;         /* 0x0c  a horizontal position; is_he_right
                                  *       compares two of them */
    uint8_t     _pad10[2];
    uint16_t    field12;         /* 0x12  a signed halfword offset; see
                                  *       highest_mpart_ob and lowest_mpart_ob */
    uint8_t     _pad14[4];
    uint32_t    field18;         /* 0x18  the A8 pair, cleared together */
    uint32_t    field1c;         /* 0x1c  and the high bound */
    uint32_t    field20;         /* 0x20  and the low one */
    uint32_t    field24;         /* 0x24  borrowed by borrow_ochar_sound and
                                  *       used as a table index */
    uint32_t    field28;         /* 0x28  bit 4 toggled by the flip_multi trio */
    uint32_t    field2c;         /* 0x2c  receives the same OR-ed value */
    uint32_t    field30;         /* 0x30  the flag word the clearers mask */
    uint32_t    field34;         /* 0x34  the ring buffer's base */
    uint32_t    field38;         /* 0x38  the base highest_mpart_ob adds to,
                                  *       and the ring buffer's head */
    uint8_t     _pad3c[4];
    uint32_t    field40;         /* 0x40  and the one lowest_mpart_ob adds to */
    /* 0x44  what used to be the A10 register: the argument slot the arcade
     * loaded before a call. Three of the routines below do nothing but fill
     * it. */
    uint32_t    a10;             /* 0x44 */
    uint32_t    field48;         /* 0x48  shake_a11 passes it as an event */
    uint8_t     _pad4c[8];
    uint32_t    field54;         /* 0x54  where a computed word is parked */
    uint8_t     _pad58[4];
    uint32_t    field5c;         /* 0x5c  am_i_joy's isolated bit */
} MK3OBJ;

/* ------------------------------------------------------------------------
 * `G`, the global game state.
 *
 * One letter, as it was on the TMS34010. Three routines here reach it through
 * the pointer slot at 0x000f357c, and the word that slot holds is 0x0038c1fc,
 * which the symbol table gives as `_G` in `__DATA,__common`.
 *
 * It is a `char` array and not a struct. Two offsets are established so far --
 * the strengths at 0x368 and a halfword at 0x456 -- and three accesses is not
 * a layout. Fields go in when there are enough of them to be a shape.
 * ------------------------------------------------------------------------ */

/* Called by isp2 and decompiled elsewhere. Declared, not defined: this file
 * owns the sequencing and not the steps. */
void face_opponent(MK3OBJ *obj);
void set_no_block(MK3OBJ *obj);
void me_in_front(MK3OBJ *obj);
void player_normpal(MK3OBJ *obj);
void disable_all_buttons(MK3OBJ *obj);

/*
 * The ring buffer.
 *
 * `head` is a pointer, not an index — the original advances it with a
 * post-indexed store and wraps by comparing against the end of the array.
 * Twenty slots: the wrap check is against `q + 0x54`, the writes start at
 * `q + 4`, and each entry is four bytes.
 */
#define SWITCH_QUEUE_SLOTS  20

typedef struct SWITCHQUEUE {
    uint32_t *head;                        /* +0x00 */
    uint32_t  slots[SWITCH_QUEUE_SLOTS];   /* +0x04 .. +0x53 */
} SWITCHQUEUE;

/*
 * The global game-state pointer.
 *
 * The original is NOT a function call. It loads a pointer from
 * `__DATA,__nl_symbol_ptr` at 0x000f357c, dereferences it, and reads a
 * uint16 at +0xa8:
 *
 *     ldr    r2, [pc, #0x20]     ; literal -> 0x0009d6a0
 *     add    r2, pc              ; -> 0x000f357c
 *     ldr    r2, [r2]            ; -> _G  (0x0038c1fc)
 *     ldrh.w r2, [r2, #0xa8]
 *
 * The symbol at the end of that chain is `_G`, the game's global state
 * struct. An earlier version of this file declared
 * `extern uint16_t proc_switch_counter(void)` and called it, which is
 * behaviourally equivalent under the differential test but structurally
 * wrong: there is no such function in the binary and no such name in its
 * symbol table. The name came from notes derived from a source we do not
 * use. What the binary does is read a field, so that is what this says.
 *
 * The field's purpose — a scheduling generation counter — is inferred from
 * how the value is used, and stays inferred until something confirms it.
 */
typedef struct GAMESTATE GAMESTATE;
extern GAMESTATE *G;                       /* 0x0038c1fc */

/* The second global, beside G and reached the same way -- through the pointer
 * slot at 0x000f349c, whose word is 0x0038c674 and whose symbol is `_H`. Four
 * words of it are cleared at the end of a match; nothing else here touches it,
 * so it is a byte array for the same reason G is. */
extern char *H;                            /* 0x0038c674 */

/* Declared further down as `GAMESTATE *G`, which is how GameCode.c spells it
 * too. The three accesses here are by byte offset because two reads and a
 * write are not a layout; where GAMESTATE grows fields, they replace these. */
#define G_BYTES  ((char *)G)

#define G_SWITCH_COUNTER(g)  (*(const uint16_t *)((const char *)(g) + 0xa8))

/*
 * Push a value onto a process's switch queue.
 *
 * Each entry packs two 16-bit halves:
 *   low  16 bits — a counter read from the global state struct at +0xa8
 *   high 16 bits — the caller's value
 *
 * so a consumer can tell which scheduling generation an entry belongs to.
 *
 * The wrap is deliberately checked *after* the store, which means the last
 * slot is written and then `head` resets. Reordering it would drop an entry.
 */
void SwitchQueue(uint16_t value, SWITCHQUEUE *q)
{
    uint32_t packed = (uint32_t)G_SWITCH_COUNTER(G)
                    | ((uint32_t)value << 16);

    *q->head = packed;
    q->head++;

    if (q->head >= &q->slots[SWITCH_QUEUE_SLOTS]) {
        q->head = &q->slots[0];
    }
}


/* ------------------------------------------------------------------ isp2
 *
 * armv7 0x00058798, 48 bytes.  `_isp2`
 *
 * The first function decompiled out of `gamecode`, and it is mostly a
 * sequencer: five calls in order, then two stores, then a sixth call.
 *
 *      face_opponent(obj)
 *      set_no_block(obj)
 *      me_in_front(obj)
 *      player_normpal(obj)
 *      flags = obj->field00->field10 | 0x10
 *      obj->field2c = flags
 *      obj->field00->field10 = flags
 *      disable_all_buttons(obj)
 *
 * ## What the two stores are, and what they are not
 *
 *      ldr r2, [r4]           ; obj->field00 -- a POINTER
 *      ldr r3, [r2, #0x10]
 *      orr r3, r3, #0x10
 *      str r3, [r4, #0x2c]    ; into the OBJECT
 *      str r3, [r2, #0x10]    ; and back into whatever field00 points at
 *
 * The same value lands in two places, which is worth noticing rather than
 * tidying: `obj->field2c` is not a copy that drifts, it is set from the
 * combined value at the moment the bit goes in.
 *
 * ## Names not given
 *
 * `field00` is a pointer to something carrying a flags word at `+0x10`. The
 * header of this file says each player object owns a PROC, and a process
 * pointer at offset zero would fit — but "would fit" is not the standard this
 * project holds itself to, and one function reading an offset is a hypothesis.
 * So both fields are named by offset and the bit is left as `0x10`.
 *
 * Nor is the function's own name interpreted. `isp2` sits beside `gup2` in the
 * two-player code and it is tempting to read it as something about player two;
 * nothing here supports that, and the five calls it makes are all
 * player-agnostic.
 *
 * Verified against the oracle by tests/test_isp2_diff.c: the call ORDER and the
 * two stores, over a sweep of starting flag values.
 */
void isp2(MK3OBJ *obj)
{
    uint32_t flags;

    face_opponent(obj);
    set_no_block(obj);
    me_in_front(obj);
    player_normpal(obj);

    flags = obj->field00->field10 | 0x10u;
    obj->field2c = flags;
    obj->field00->field10 = flags;

    disable_all_buttons(obj);
}


/* ------------------------------------------------------------------------
 * The A10 loaders.
 *
 * armv7 0x00057594 and 0x0005759c, four bytes each.  **Complete.**
 *
 *      ldr r3, [r0]        ; the object's PROC
 *      ldr r3, [r3, #4]    ; or #0x68
 *      str r3, [r0, #0x44]
 *
 * Two instructions and a store, and the only difference between them is which
 * field of the PROC is read. The names say what those fields are -- `him` and
 * `slave` -- and that is the whole of what is established: 0x04 of a PROC is
 * the opponent and 0x68 is the slave object.
 * ------------------------------------------------------------------------ */
void f_set_a10_to_him(MK3OBJ *obj)
{
    obj->a10 = obj->field00->him;
}

void f_set_a10_to_slave(MK3OBJ *obj)
{
    obj->a10 = obj->field00->slave;
}


/* ---------------------------------------------------------------- player_swpal
 *
 * armv7 0x00057480, six bytes.  **Complete.**
 *
 *      ldr r3, [r0, #8]
 *      str r1, [r3, #0x44]
 *
 * Writes the caller's second argument into the OTHER object's A10 slot -- not
 * its own. "swpal" is swap palette, and the value goes where an argument goes,
 * so this sets up the call rather than performing it.
 *
 * The argument is a flag and not a palette. Its only two callers are
 * `player_normpal`, which passes 0, and `player_froze_pal`, which passes 1.
 */
void player_swpal(MK3OBJ *obj, uint32_t frozen)
{
    obj->field08->a10 = frozen;
}


/* -------------------------------------------------------------------- stop_a8
 *
 * armv7 0x00055a60, six bytes.  **Complete.**
 *
 * Clears 0x18 and 0x1c together. The name gives them as the A8 pair; what the
 * pair MEANS is not in these three instructions and is not guessed at here.
 */
void stop_a8(MK3OBJ *obj)
{
    obj->field18 = 0;
    obj->field1c = 0;
}


/* ------------------------------------------------------------- zero_my_p_hit
 *
 * armv7 0x00054ec8, six bytes.  **Complete.**
 *
 *      ldr r0, [r0]        ; note r0 is REASSIGNED
 *      str r3, [r0, #0x44]
 *
 * The store goes through the PROC, so this clears the PROC's 0x44 and not the
 * object's. Same offset, different struct -- worth stating, because the three
 * routines above write the object's.
 */
void zero_my_p_hit(MK3OBJ *obj)
{
    obj->field00->p_hit = 0;
}


/* --------------------------------------------- GetThreadFunc and GetProcFunc
 *
 * armv7 0x000575dc and 0x000575cc, ten and sixteen bytes.  **Complete.**
 *
 *      ldr.w r3, [r0, #0xa4]   ; GetProcFunc first does r0 = obj->thread
 *      lsls  r3, r3, #3        ; times eight
 *      adds  r3, r3, r0
 *      ldr   r0, [r3, #4]
 *
 * An array of eight-byte entries laid out at the THREAD's own address, indexed
 * by 0xa4, with the function in the second word. The pair is what says whose
 * array it is: GetProcFunc loads `obj->thread` and then does exactly this on
 * it, so the index and the array belong to the thread and GetThreadFunc's
 * argument is one.
 *
 * The array overlaps the thread's own leading fields -- entry 0 is its first
 * eight bytes -- so the index is never small. `t_self_terminate` reads entry
 * `index + 1`, which is the frame above the running one.
 */
void *GetThreadFunc(MK3THREAD *thread)
{
    const uint32_t *entry =
        (const uint32_t *)((const char *)thread + thread->frame * 8);
    return (void *)(uintptr_t)entry[1];
}

void *GetProcFunc(MK3OBJ *obj)
{
    return GetThreadFunc(obj->thread);
}


/* -------------------------------------------------- KillProc and StartProcAt
 *
 * armv7 0x00056d14 and 0x00056cd0, twelve bytes each.  **Complete.**
 *
 * The object-level spelling of the two thread calls. Each takes the thread out
 * of the object and forwards it.
 *
 *      ldr r0, [r0, #4]
 *      bl  StartThreadAt
 *
 * r1 is not touched, so StartProcAt's SECOND argument reaches StartThreadAt
 * unchanged -- it is the function to start at, and it flows through. Written
 * with one parameter this would start every thread at whatever the register
 * happened to hold.
 */
void KillProc(MK3OBJ *obj)
{
    KillSThread(obj->thread);
}

void StartProcAt(MK3OBJ *obj, MK3THREADFUNC func)
{
    StartThreadAt(obj->thread, func);
}


/* ------------------------------------------------------- the object wrappers
 *
 * armv7 0x00055070, 0x000551f0, 0x00058508 and 0x00059750, ten bytes each.
 * **Complete.**
 *
 * Four of the same shape:
 *
 *      mov r1, r0          ; or: ldr r1, [r0, #8]
 *      bl  <the real one>
 *
 * r0 is not touched, so the callee receives the object twice -- as the subject
 * and as the target. The suffixed names are the ones that take the target
 * explicitly and these are the convenience spellings that supply it, which is
 * why `am_i_airborn` and `aborn4` are not the same function.
 *
 * `ani2` is the exception: it passes the object at 0x08 rather than itself, so
 * `ani2_ob` acts on the other one.
 */
long aborn4(MK3OBJ *obj, MK3OBJ *target);
long am_i_facing_him_px(MK3OBJ *obj, MK3OBJ *target);
void ani2_ob(MK3OBJ *obj, MK3OBJ *target);
void back_to_normal_px(MK3OBJ *obj, MK3OBJ *target);

long am_i_airborn(MK3OBJ *obj)
{
    return aborn4(obj, obj);
}

long am_i_facing_him(MK3OBJ *obj)
{
    return am_i_facing_him_px(obj, obj);
}

void ani2(MK3OBJ *obj)
{
    ani2_ob(obj, obj->field08);
}

void back_to_normal(MK3OBJ *obj)
{
    back_to_normal_px(obj, obj);
}


/* ------------------------------------------------------------- the flip_multi trio
 *
 * armv7 0x00055358, 0x00055364 and 0x00055394.  **Complete.**
 *
 *      _ob:  obj->field28  ^= 0x10
 *      _px:  target->field08->field28 ^= 0x10
 *      bare: flip_multi_px(obj, obj)
 *
 * The same bit 4 at 0x28 in all three, reached through a different number of
 * pointers. `isp2` above ORs bit 4 into 0x10 of the PROC; this is a different
 * field of a different struct and the shared bit number is a coincidence worth
 * naming as one.
 */
void flip_multi_ob(MK3OBJ *obj)
{
    obj->field28 ^= 0x10u;
}

void flip_multi_px(MK3OBJ *obj, MK3OBJ *target)
{
    (void)obj;                          /* r0 is not read */
    target->field08->field28 ^= 0x10u;
}

void flip_multi(MK3OBJ *obj)
{
    flip_multi_px(obj, obj);
}


/* -------------------------------------------------------------- face_opponent
 *
 * armv7 0x00055388, ten bytes.  **Complete.**
 *
 * Declared at the top of this file because `isp2` calls it; here is the body.
 * It is the wrapper, and `face_opponent_px` does the work.
 */
void face_opponent_px(MK3OBJ *obj, MK3OBJ *target);

void face_opponent(MK3OBJ *obj)
{
    face_opponent_px(obj, obj);
}


/* --------------------------------------------------------- gmo_proc_insobja8
 *
 * armv7 0x00059c54, eight bytes.  **Complete.**
 *
 * A tail call to `getobjectinsert` with the arguments untouched -- not even a
 * register move. The wrapper exists for the name.
 */
void *getobjectinsert(MK3OBJ *obj);

void *gmo_proc_insobja8(MK3OBJ *obj)
{
    return getobjectinsert(obj);
}


/* ------------------------------------------------------------- ground_player
 *
 * armv7 0x0005533c, ten bytes.  **Complete.**
 *
 *      ldr   r3, [r0, #8]
 *      ldr   r0, [r0]
 *      ldrh  r0, [r0, #0x40]
 *      strh  r0, [r3, #0x12]
 *
 * Copies a halfword from the PROC's 0x40 to the other object's 0x12. Both are
 * 16-bit; the load is unsigned and the store keeps the low half, so no sign
 * question arises here -- though `highest_mpart_ob` below reads the same 0x12
 * as SIGNED, which is worth knowing before anyone widens it.
 */
void ground_player(MK3OBJ *obj)
{
    obj->field08->field12 = (uint16_t)obj->field00->field40;
}


/* ------------------------------------------- highest_mpart_ob, lowest_mpart_ob
 *
 * armv7 0x0005579c and 0x00055820, ten bytes each.  **Complete.**
 *
 *      highest:  out->field1c = src->field38 + (int16_t)src->field12
 *      lowest:   out->field20 = src->field40 + (int16_t)src->field12
 *
 * `ldrsh`, so 0x12 is signed here. Two bounds, one offset added to both, and
 * the results land in adjacent words -- which is what a pair of bounds looks
 * like. Which axis is not established.
 */
void highest_mpart_ob(MK3OBJ *out, MK3OBJ *src)
{
    out->field1c = (uint32_t)(src->field38 + (int32_t)(int16_t)src->field12);
}

void lowest_mpart_ob(MK3OBJ *out, MK3OBJ *src)
{
    out->field20 = (uint32_t)(src->field40 + (int32_t)(int16_t)src->field12);
}


/* --------------------------------------------------- isa5 and joystick_in_a0
 *
 * armv7 0x00055dc4 and 0x00055d94, ten bytes each.  **Complete.**
 *
 * Two more of the wrapper shape.
 */
long isa5_px(MK3OBJ *obj, MK3OBJ *target);
long joystick_in_a0_px(MK3OBJ *obj, MK3OBJ *target);

long isa5(MK3OBJ *obj)
{
    return isa5_px(obj, obj);
}

long joystick_in_a0(MK3OBJ *obj)
{
    return joystick_in_a0_px(obj, obj);
}


/* ----------------------------------------------- player_normpal, player_froze_pal
 *
 * armv7 0x00057488 and 0x000575a4, ten bytes each.  **Complete.**
 *
 * The two callers that name player_swpal's second argument. `player_normpal`
 * is also declared at the top of this file, because `isp2` calls it.
 */
void player_normpal(MK3OBJ *obj)
{
    player_swpal(obj, 0);
}

void player_froze_pal(MK3OBJ *obj)
{
    player_swpal(obj, 1);
}


/* --------------------------------------- strike_check_a0, strike_check_a0_test
 *
 * armv7 0x000594c8 and 0x000595d8, ten bytes each.  **Complete.**
 *
 * The same pair shape: one core, called with 0 and with 1, and the `_test`
 * name on the 1. So the core's second argument asks it to report rather than
 * to act.
 */
long strike_check_a0_core(MK3OBJ *obj, long test_only);

long strike_check_a0(MK3OBJ *obj)
{
    return strike_check_a0_core(obj, 0);
}

long strike_check_a0_test(MK3OBJ *obj)
{
    return strike_check_a0_core(obj, 1);
}


/* ========================================================================
 * The thread machinery.
 *
 * The fight engine is cooperative: each object owns a thread, a thread owns a
 * stack of eight-byte frames, and nothing is pre-empted. These four are the
 * whole of the start-and-stop side of it.
 * ======================================================================== */



/* ------------------------------------------------------------- StartThreadAt
 *
 * armv7 0x00056cac, sixteen bytes.  **Complete.**
 *
 * Four stores and no call: the frame index back to zero, the function, and two
 * words cleared. Starting a thread is entirely a matter of writing to it -- the
 * scheduler picks it up on its own next pass.
 */
void StartThreadAt(MK3THREAD *thread, MK3THREADFUNC func)
{
    thread->frame = 0;
    thread->func = func;
    thread->field08 = 0;
    thread->fieldfc = 0;
}


/* -------------------------------------------------------------- KillSThread
 *
 * armv7 0x00056cbc, twenty bytes.  **Complete.**
 *
 * It does not kill anything. It starts the thread at `t_self_terminate`, which
 * ends it on its own next turn -- the only way to stop a thread in a scheduler
 * that never interrupts one.
 */
void t_self_terminate(void);

void KillSThread(MK3THREAD *thread)
{
    StartThreadAt(thread, t_self_terminate);
}


/* --------------------------------------------------------- t_self_terminate
 *
 * armv7 0x00056c84, forty bytes.  **Complete.**
 *
 *      r2 = thread->frame + 1
 *      if (*(thread + r2 * 8) != 0) return -3
 *      *(thread + r2 * 8) = 0x12ff
 *      thread->fieldfc = 0x00016462
 *      return 0x00016462
 *
 * The frame ABOVE the running one. A non-zero entry there means something is
 * still stacked on this thread and the terminate refuses with -3; otherwise it
 * writes a marker into that slot and reports the same literal it stored.
 *
 * That refusal is the cooperative contract in one branch: a thread cannot be
 * taken down while a frame sits above it, so `KillSThread` is a request and not
 * an order.
 *
 * The two constants are left as constants. 0x12ff is a marker and 0x00016462
 * is both the stored value and the return; neither is an address in any
 * section, and nothing else in this file reads either back.
 *
 * Spelled with the thread as an argument although the original takes it in r0
 * as a thread function would receive its own thread -- it is installed as one
 * by KillSThread.
 */
long t_self_terminate_px(MK3THREAD *thread)
{
    uint32_t *above = (uint32_t *)((char *)thread + (thread->frame + 1) * 8);

    if (*above != 0)
        return -3;

    *above = 0x12ff;
    thread->fieldfc = 0x00016462u;
    return 0x00016462;
}


/* ------------------------------------------- FindThreadProc and NewThreadProc
 *
 * armv7 0x00057664 and 0x00058b54, sixteen bytes each.  **Complete.**
 *
 *      bl   FindThread          ; or NewThread
 *      cbz  r0, out
 *      ldr  r0, [r0, #0x108]
 *
 * Each calls the thread-level function with its arguments untouched and turns
 * the thread into the proc at 0x108, passing a null through. The arguments are
 * not named here: neither wrapper reads them.
 */
MK3THREAD *FindThread(void);
MK3THREAD *NewThread(void);

void *FindThreadProc(void)
{
    MK3THREAD *t = FindThread();
    return t ? t->proc : NULL;
}

void *NewThreadProc(void)
{
    MK3THREAD *t = NewThread();
    return t ? t->proc : NULL;
}


/* ========================================================================
 * The flag clearers.
 *
 * Three of one shape, and the shape is worth naming once:
 *
 *      r2 = obj->field08          ; the other object
 *      r3 = r2->field30           ; its flag word
 *      r3 &= ~BIT
 *      obj->field54 = r3          ; a copy on the subject
 *      r2->field30  = r3
 *
 * The copy into 0x54 is not a return value -- none of the three returns
 * anything. It is the same habit `isp2` shows with 0x2c and `am_i_joy` with
 * 0x2c and 0x5c: the arcade kept the word it had just computed in a slot on
 * the object, because on the TMS34010 that is where a register spilled to.
 * ======================================================================== */

void clear_inviso(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 & ~0x20u;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void clear_nocol(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 & ~0x100u;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void clear_noedge(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 & ~0x400u;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}


/* ------------------------------------------------------------------ am_i_joy
 *
 * armv7 0x00054ce0, sixteen bytes.  **Complete.**
 *
 * Bit 0 of the PROC's flag word, kept in two places on the way out: the whole
 * word into 0x2c and the isolated bit into 0x5c, and the bit is also returned.
 * `isp2` writes the same 0x2c, so that slot is where this file parks a flag
 * word it has just read.
 *
 * The name says the bit distinguishes a joystick from something else; which
 * else -- an AI, a replay, a network peer -- is not in these six instructions.
 */
long am_i_joy(MK3OBJ *obj)
{
    uint32_t flags = obj->field00->field10;

    obj->field2c = flags;
    obj->field5c = flags & 1u;
    return (long)(flags & 1u);
}


/* ---------------------------------------------------------- add_combo_damage
 *
 * armv7 0x00057494, sixteen bytes.  **Complete.**
 *
 *      r3 = obj->field00         ; the PROC
 *      r3 = r3->field00          ; an object
 *      r2 = r3->field00          ; and ITS proc
 *      r2->field54 += obj->field54
 *
 * Three loads, so the total lands on a PROC and not on an object -- 0x54
 * exists on both. The subject's 0x54 is added into that one's. 0x54 is the same slot the
 * flag clearers above write, which is worth stating and not resolving: two
 * routines using one offset for different things is exactly what a spill slot
 * looks like.
 */
void add_combo_damage(MK3OBJ *obj)
{
    MK3OBJPROC *target = obj->field00->field00->field00;

    target->field54 += obj->field54;
}


/* ------------------------------------------------------------- adjust_xy_a5
 *
 * armv7 0x000570bc, sixteen bytes.  **Complete.**
 *
 * Reads three fields and hands them to the worker in order.
 */
void multi_adjust_xy_ob(MK3OBJ *obj, uint32_t a, uint32_t b, uint32_t c);

void adjust_xy_a5(MK3OBJ *obj)
{
    multi_adjust_xy_ob(obj, obj->field30, obj->field1c, obj->field20);
}


/* -------------------------------------------------------- center_around_him
 *
 * armv7 0x00057b84, sixteen bytes.  **Complete.**
 *
 * Two dereferences and then the "me" version, so "him" is `obj->field00->
 * field00`. The same double step `add_combo_damage` takes.
 */
void center_around_me(MK3OBJ *obj);

void center_around_him(MK3OBJ *obj)
{
    center_around_me(obj->field00->field00);
}


/* -------------------------------------------------------------- center_obj_x
 *
 * armv7 0x00058458, sixteen bytes.  **Complete.**
 *
 * Writes 199 into 0x1c and then centres. 0x1c is the high bound
 * `highest_mpart_ob` computes into, so this is setting the bound before the
 * call rather than passing it -- the A-register habit again.
 */
void center_about_x(MK3OBJ *obj);

void center_obj_x(MK3OBJ *obj)
{
    obj->field1c = 0xc7;                /* 199 */
    center_about_x(obj);
}


/* --------------------------------------- take3, takeover_him, takeover_him_sr
 *
 * armv7 0x00058930, 0x00058954 and 0x00058948.  **Complete.**
 *
 * `take3` stops the opponent, disables his buttons and transfers control. The
 * two takeover names are BYTE-FOR-BYTE identical wrappers around it -- same
 * three instructions, no argument set up, twelve bytes each at two addresses.
 * The compiler did not merge them and neither does this: two names that the
 * game calls separately are two functions, whatever they contain.
 */
void stop_him(MK3OBJ *obj);
void disable_his_buttons(MK3OBJ *obj);
void xfer_otherguy(MK3OBJ *obj);

void take3(MK3OBJ *obj)
{
    stop_him(obj);
    disable_his_buttons(obj);
    xfer_otherguy(obj);
}

void takeover_him(MK3OBJ *obj)
{
    take3(obj);
}

void takeover_him_sr(MK3OBJ *obj)
{
    take3(obj);
}


/* ------------------------------------------------- two more flag clearers
 *
 * armv7 0x00054f00 and 0x00054f60, sixteen bytes each.  **Complete.**
 *
 * The same five instructions as the three above, masking bit 3 and bit 4 out
 * of the other object's 0x30. With these the family reads:
 *
 *      0x008  noflip        0x020  inviso
 *      0x010  shadow        0x100  nocol        0x400  noedge
 */
void clear_noflip(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 & ~0x8u;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void clear_shadow_bit(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 & ~0x10u;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}


/* --------------------------------- do_next_a9_frame, do_his_next_a9_frame
 *
 * armv7 0x00059e24 and 0x00059e14, sixteen bytes each.  **Complete.**
 *
 *      mine: pxob(obj, obj,               obj->field08)
 *      his:  pxob(obj, proc->field00,     proc->field04)
 *
 * The two differ only in which pair they hand over, and the "his" one takes
 * both out of the PROC -- the opponent object and the field beside it. Whether
 * those two are the same pairing as (obj, obj->field08) is not established
 * here; they occupy the same argument positions and that is all.
 */
void do_next_a9_frame_pxob(MK3OBJ *obj, MK3OBJ *a, MK3OBJ *b);

void do_next_a9_frame(MK3OBJ *obj)
{
    do_next_a9_frame_pxob(obj, obj, obj->field08);
}

void do_his_next_a9_frame(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;

    do_next_a9_frame_pxob(obj, proc->field00, (MK3OBJ *)(uintptr_t)proc->him);
}


/* ------------------------------------------------------------- find_part2
 *
 * armv7 0x00055450, sixteen bytes.  **Complete.**
 *
 *      r2 = obj->field40
 *      do { r3 = *r2++; obj->field1c = r3; } while (r3);
 *      obj->field40 = r2
 *
 * The only loop in this batch, and a short one: walk a word list to its zero
 * and leave the cursor past it. "Part 2" is what follows the first
 * NUL-terminated run, and the cursor at 0x40 is how the caller gets there.
 *
 * `field1c` is written every time round and ends up holding the terminator, so
 * it is the spill slot rather than a result -- the same 0x1c `highest_mpart_ob`
 * uses for a bound, which is what a spill slot looks like.
 */
void find_part2(MK3OBJ *obj)
{
    const uint32_t *p = (const uint32_t *)(uintptr_t)obj->field40;
    uint32_t word;

    do {
        word = *p++;
        obj->field1c = word;
    } while (word != 0);

    obj->field40 = (uint32_t)(uintptr_t)p;
}


/* ---------------------------------------------------------- get_his_action
 *
 * armv7 0x00054e38, sixteen bytes.  **Complete.**
 *
 *      obj->field1c = proc->field00                 ; the opponent object
 *      obj->field20 = proc->field00->field00->field18
 *
 * Two spills: the opponent, and something at 0x18 of the opponent's own PROC.
 * The name calls that second one his action.
 */
void get_his_action(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;

    obj->field1c = (uint32_t)(uintptr_t)proc->field00;
    obj->field20 = proc->field00->field00->field18;
}


/* -------------------------------------------------------------- ground_him
 *
 * armv7 0x00055348, sixteen bytes.  **Complete.**
 */
void ground_him(MK3OBJ *obj)
{
    ground_player(obj->field00->field00);
}


/* -------------------------------------------------------- init_special_act
 *
 * armv7 0x000587e0, sixteen bytes.  **Complete.**
 *
 *      proc->field18 = obj->field20
 *      init_special(obj)
 *
 * Moves 0x20 into the PROC's 0x18 and then initialises. 0x18 of a PROC is what
 * `get_his_action` reads as an action, so this is setting the action before
 * the call -- the argument-in-a-field habit again, and the reason so many of
 * these are two instructions and a branch.
 */
void init_special(MK3OBJ *obj);

void init_special_act(MK3OBJ *obj)
{
    obj->field00->field18 = obj->field20;
    init_special(obj);
}


/* --------------------------------------------- is_he_airborn, is_he_facing_me
 *
 * armv7 0x00055060 and 0x000551fc, sixteen bytes each.  **Complete.**
 *
 * The "him" spellings of the two questions written last batch. `is_he_airborn`
 * keeps the subject and passes the opponent as the target; `is_he_facing_me`
 * asks the opponent the "am I" question, which is the same question from the
 * other side and is why it needs no second argument.
 */
long is_he_airborn(MK3OBJ *obj)
{
    return aborn4(obj, obj->field00->field00);
}

long is_he_facing_me(MK3OBJ *obj)
{
    return am_i_facing_him(obj->field00->field00);
}


/* ----------------------------------------------------------- is_stick_down
 *
 * armv7 0x00055e1c, sixteen bytes.  **Complete.**
 *
 *      obj->field38 = 2
 *      return isa5(obj)
 *
 * A direction written into 0x38 and then the general test. 2 is down, by the
 * name; the rest of the family will fill in the other three and say whether
 * this is a bit mask or an enumeration.
 */
long is_stick_down(MK3OBJ *obj)
{
    obj->field38 = 2;
    return isa5(obj);
}


/* ========================================================================
 * The object flags at 0x30.
 *
 * Ten routines, five clearing and five setting, all of the same five
 * instructions through `obj->field08`. The bits they name:
 *
 *      0x0001  noscroll        0x0080  ignore_y        0x0800  half_damage
 *      0x0004  no_block        0x0100  nocol           0x1000  quarter_damage
 *      0x0008  noflip          0x0400  noedge
 *      0x0010  shadow
 *      0x0020  inviso
 *
 * 0x0002, 0x0040 and 0x0200 have no routine in this file. They are left out
 * rather than filled in from their neighbours.
 * ======================================================================== */

#define MK3F_NOSCROLL        0x0001u
#define MK3F_NO_BLOCK        0x0004u
#define MK3F_NOFLIP          0x0008u
#define MK3F_SHADOW          0x0010u
#define MK3F_INVISO          0x0020u
#define MK3F_IGNORE_Y        0x0080u
#define MK3F_NOCOL           0x0100u
#define MK3F_NOEDGE          0x0400u
#define MK3F_HALF_DAMAGE     0x0800u
#define MK3F_QUARTER_DAMAGE  0x1000u

void set_noscroll(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 | MK3F_NOSCROLL;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void set_no_block(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 | MK3F_NO_BLOCK;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void set_noflip(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 | MK3F_NOFLIP;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void set_ignore_y(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 | MK3F_IGNORE_Y;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void set_nocol(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 | MK3F_NOCOL;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void set_noedge(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 | MK3F_NOEDGE;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void set_half_damage(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 | MK3F_HALF_DAMAGE;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}

void set_quarter_damage(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field30 | MK3F_QUARTER_DAMAGE;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}


/* ========================================================================
 * The stick.
 *
 * Each writes a constant into 0x38 and asks `isa5`. The four constants are
 * 1, 2, 4 and 8 -- a bit mask, not a direction number, which one of them
 * alone could not have shown. A diagonal is therefore expressible, and
 * whether the game ever asks for one is a question for `isa5`.
 * ======================================================================== */

#define MK3_STICK_UP     1u
#define MK3_STICK_DOWN   2u
#define MK3_STICK_LEFT   4u
#define MK3_STICK_RIGHT  8u

long is_stick_up(MK3OBJ *obj)
{
    obj->field38 = MK3_STICK_UP;
    return isa5(obj);
}

long is_stick_left(MK3OBJ *obj)
{
    obj->field38 = MK3_STICK_LEFT;
    return isa5(obj);
}

long is_stick_right(MK3OBJ *obj)
{
    obj->field38 = MK3_STICK_RIGHT;
    return isa5(obj);
}


/* ------------------------------------------------------- lineup_a0_onto_a1
 *
 * armv7 0x00057214, sixteen bytes.  **Complete.**
 *
 *      match_ani_points_ob_ob(obj->field20, obj->field1c)
 *
 * Both arguments come out of spill slots and the object itself is not passed,
 * so by the time this is called the two things to line up are already sitting
 * in 0x1c and 0x20. The A-register names in the symbol say the same: a0 and a1
 * were where the arcade put them.
 */
void match_ani_points_ob_ob(uint32_t a, uint32_t b);

void lineup_a0_onto_a1(MK3OBJ *obj)
{
    match_ani_points_ob_ob(obj->field20, obj->field1c);
}


/* --------------------------------------------------------------- mk_random
 *
 * armv7 0x000586cc, sixteen bytes.  **Complete.**
 *
 * Calls the generator and parks the result in 0x1c. It returns nothing: the
 * caller reads the slot, which is why so much of this file writes 0x1c before
 * a call and reads it after.
 */
uint32_t random32(void);

void mk_random(MK3OBJ *obj)
{
    obj->field1c = random32();
}


/* -------------------------------------------------------- multi_adjust_xy
 *
 * armv7 0x000570ac, sixteen bytes.  **Complete.**
 *
 * The same worker `adjust_xy_a5` calls, with `obj->field08` in the second
 * position where that one passes `obj->field30`. Two different things in one
 * argument slot, so the parameter is written as a word rather than typed.
 */
void multi_adjust_xy(MK3OBJ *obj)
{
    multi_adjust_xy_ob(obj, (uint32_t)(uintptr_t)obj->field08,
                       obj->field1c, obj->field20);
}


/* ------------------------------------------------------------ strike_check
 *
 * armv7 0x000594a0, sixteen bytes.  **Complete.**
 *
 * The third argument is a literal zero and the second comes out of 0x1c.
 */
long strike_check_ptr(MK3OBJ *obj, uint32_t what, long flag);

long strike_check(MK3OBJ *obj)
{
    return strike_check_ptr(obj, obj->field1c, 0);
}


/* --------------------------------------------------- Endurance_ClearStruct
 *
 * armv7 0x00058300, twenty bytes.  **Complete.**
 *
 *      rsb r0, r0, r1      ; r0 = to - from
 *      subs r2, r2, r0     ; size -= that
 *      memset(to, 0, size)
 *
 * The `blx` target is 0x000ddbb4, which is not in the function table because
 * it is an import thunk; the symbol table has `_memset` as UNDF, which is what
 * identifies it.
 *
 * The arithmetic is a total size with a leading run taken off it, so this
 * clears the tail of a struct from a field onwards rather than the whole of
 * it. The three parameters are named for that reading and it is a reading:
 * only the subtraction is certain.
 */
void *memset(void *dst, int c, size_t n);

void Endurance_ClearStruct(char *base, char *from, size_t total)
{
    memset(from, 0, total - (size_t)(from - base));
}


/* ------------------------------------------- adjust_him_x and adjust_him_xy
 *
 * armv7 0x0005706c and 0x00057080, twenty bytes each.  **Complete.**
 *
 * The same worker as `multi_adjust_xy`, with the opponent from the PROC's 0x04
 * in the second position. The pair differ in the last argument only: the `_x`
 * one passes a literal zero where `_xy` passes 0x20, so the fourth parameter
 * is the Y and leaving it zero is what makes the first horizontal.
 */
void adjust_him_x(MK3OBJ *obj)
{
    multi_adjust_xy_ob(obj, obj->field00->him, obj->field1c, 0);
}

void adjust_him_xy(MK3OBJ *obj)
{
    multi_adjust_xy_ob(obj, obj->field00->him, obj->field1c, obj->field20);
}


/* -------------------------------------------------------- air_init_special
 *
 * armv7 0x0005891c, twenty bytes.  **Complete.**
 */
void stop_me_player(MK3OBJ *obj);

void air_init_special(MK3OBJ *obj)
{
    stop_me_player(obj);
    isp2(obj);
}


/* ------------------------------------------------------------- allow_moves
 *
 * armv7 0x000597e4, twenty bytes.  **Complete.**
 *
 * The other end of `isp2`, which disables the buttons and forces the state:
 * this enables them again and returns the fighter to normal.
 */
void enable_all_buttons(MK3OBJ *obj);

void allow_moves(MK3OBJ *obj)
{
    enable_all_buttons(obj);
    back_to_normal(obj);
}


/* --------------------------------------------------------------- create_fx
 *
 * armv7 0x00058d70, twenty bytes.  **Complete.**
 *
 *      r1 = (MK3_FIELD0E(other) << 16) | other->field12
 *
 * Two halfwords packed into one word and passed as a single parameter -- the
 * high half from 0x0e and the low from 0x12. 0x12 is the same field
 * `highest_mpart_ob` reads as a signed offset; being the low half of a packed
 * pair here is a use of it and not a contradiction.
 */
void create_fx_param(MK3OBJ *obj, uint32_t packed);

void create_fx(MK3OBJ *obj)
{
    MK3OBJ *other = obj->field08;

    create_fx_param(obj, ((uint32_t)MK3_FIELD0E(other) << 16) | other->field12);
}


/* ------------------------------------------------------------ dec_my_p_hit
 *
 * armv7 0x00054dec, twenty bytes.  **Complete.**
 *
 *      obj->field1c = obj            ; the object pointer itself
 *      proc->p_hit -= 1
 *      obj->field20 = proc->p_hit    ; re-read after the store
 *
 * Two spills of different kinds through one habit. 0x1c takes a pointer here
 * and a count in `find_part2` and a bound in `highest_mpart_ob`, which is why
 * it is a word and not a type.
 *
 * The re-read is in the original: it loads the PROC again rather than reusing
 * the value it just stored. Kept, because a transcription that tidies a
 * redundant load is one that will tidy a necessary one later.
 */
void dec_my_p_hit(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;

    obj->field1c = (uint32_t)(uintptr_t)obj;
    proc->p_hit = proc->p_hit - 1;
    obj->field20 = obj->field00->p_hit;
}


/* ================================================================= the pairs
 *
 * Four of one shape: fetch the character's animation, then do the thing.
 * `get_char_ani` and `get_char_ani2` leave what they find in a spill slot, so
 * the second call takes no argument beyond the object.
 * ========================================================================= */

void get_char_ani(MK3OBJ *obj);
void get_char_ani2(MK3OBJ *obj);
void find_last_frame(MK3OBJ *obj);

void do_first_a9_frame(MK3OBJ *obj)
{
    get_char_ani(obj);
    do_next_a9_frame(obj);
}

void find_ani_last_frame(MK3OBJ *obj)
{
    get_char_ani(obj);
    find_last_frame(obj);
}

void find_ani_part2(MK3OBJ *obj)
{
    get_char_ani(obj);
    find_part2(obj);
}

void find_ani2_part2(MK3OBJ *obj)
{
    get_char_ani2(obj);
    find_part2(obj);
}


/* -------------------------------------------------------- find_last_frame
 *
 * armv7 0x00055428, twenty bytes.  **Complete.**
 *
 *      cursor = obj->field40
 *      do { obj->field40 = cursor + 4;
 *           obj->field1c = cursor[1]; } while (cursor[1] && (cursor += 4));
 *      obj->field40 = cursor
 *
 * It looks one entry AHEAD and stops on the last non-zero, which is the
 * difference from `find_part2` next door: that one steps past the terminator,
 * this one stops before it. The cursor is left on the last frame and the
 * terminator is never consumed.
 */
void find_last_frame(MK3OBJ *obj)
{
    const uint32_t *cursor = (const uint32_t *)(uintptr_t)obj->field40;

    for (;;) {
        obj->field40 = (uint32_t)(uintptr_t)(cursor + 1);
        obj->field1c = cursor[1];
        if (cursor[1] == 0)
            break;
        cursor++;
    }
    obj->field40 = (uint32_t)(uintptr_t)cursor;
}


/* ---------------------------------------- get_his_dog and his_group_sound
 *
 * armv7 0x00057828 and 0x00057148, twenty bytes each.  **Complete.**
 *
 * Both are `call_for_him` with a function pointer and nothing else --
 * `distance_off_ground` and `group_sound`. The trampoline swaps the object's
 * 0x00 and 0x08 for the opponent's and calls through, so this is the file's
 * third way of not writing a routine twice.
 */
void call_for_him(MK3OBJ *obj, void (*fn)(MK3OBJ *));
void distance_off_ground(MK3OBJ *obj);
void group_sound(MK3OBJ *obj);

void get_his_dog(MK3OBJ *obj)
{
    call_for_him(obj, distance_off_ground);
}

void his_group_sound(MK3OBJ *obj)
{
    call_for_him(obj, group_sound);
}


/* ------------------------------------------------------------- get_my_dfe
 *
 * armv7 0x00054dc0, twenty bytes.  **Complete.**
 *
 * Sign-extends the other object's 0x0e into 0x28 and calls the worker. 0x0e is
 * the halfword `create_fx` packs into the high half of its parameter; read
 * here as SIGNED, which `create_fx` does not settle either way.
 */
void gdfe4(MK3OBJ *obj);

void get_my_dfe(MK3OBJ *obj)
{
    obj->field28 = (uint32_t)(int32_t)(int16_t)MK3_FIELD0E(obj->field08);
    gdfe4(obj);
}


/* -------------------------------------------- get_strength, get_my_strength
 *
 * armv7 0x0005509c and 0x000550b0, twenty bytes each.  **Complete.**
 *
 *      get_strength(i) = (*table)[i] read at +0x368
 *
 * The pointer slot at 0x000f357c is `G` -- see its declaration above -- so the
 * strengths begin 0x368 into the global state. `get_my_strength` supplies the
 * index from the PROC's 0x08 and parks the answer in 0x1c.
 */
uint32_t get_strength(uint32_t index)
{
    return *(const uint32_t *)(G_BYTES + index * 4 + 0x368);
}

void get_my_strength(MK3OBJ *obj)
{
    obj->field1c = get_strength(obj->field00->field08);
}


/* -------------------------------------------------- gso_dmawnz_insobja8
 *
 * armv7 0x00059c60, twenty bytes.  **Complete.**
 *
 * Fetches the insert object and, if there is one, copies 0x30 across into its
 * other object's 0x2c. The null check is the whole of the error handling.
 */
void gso_dmawnz_insobja8(MK3OBJ *obj)
{
    MK3OBJ *ins = (MK3OBJ *)getobjectinsert(obj);

    if (ins != NULL)
        ins->field08->field2c = obj->field30;
}


/* --------------------------------------- lights_on_hit and lights_on_slam
 *
 * armv7 0x00057a10 and 0x000579fc, twenty bytes each.  **Complete.**
 *
 *      MKEvent_Add(3, 0xb, 0x18, proc->field08)      ; hit
 *      MKEvent_Add(3, 0xb, 0x38, proc->field08)      ; slam
 *
 * One constant apart. Three of the four arguments are shared, so the third
 * chooses which lighting event and the first two are the event system's own
 * vocabulary rather than anything this file establishes.
 */
void MKEvent_Add(long a, long b, long c, uint32_t d);

void lights_on_hit(MK3OBJ *obj)
{
    MKEvent_Add(3, 0xb, 0x18, obj->field00->field08);
}

void lights_on_slam(MK3OBJ *obj)
{
    MKEvent_Add(3, 0xb, 0x38, obj->field00->field08);
}


/* --------------------------------------------------------------- init_1_q
 *
 * armv7 0x00058960, twenty bytes.  **Complete.**
 *
 *      memset(q, 0, 0x54)
 *      q->head = q + 4
 *
 * The constructor for the ring buffer this file's header describes: clear the
 * whole of it and point the head at the array, which starts one word in. The
 * header says the wrap check is against `q + 0x54`, and 0x54 is the size
 * cleared here -- the two agree, which is the only check available on a
 * function this small.
 */
void init_1_q(char *q)
{
    memset(q, 0, 0x54);
    *(uint32_t *)q = (uint32_t)(uintptr_t)(q + 4);
}


/* -------------------------------------- match_him_with_me, match_me_with_him
 *
 * armv7 0x000570cc and 0x000570f8, twenty bytes each.  **Complete.**
 *
 * The same worker with the two arguments the other way round. `_him_with_me`
 * passes (mine, his) and `_me_with_him` passes (his, mine), so the first
 * argument is the one that moves.
 */
void match_him_with_me(MK3OBJ *obj)
{
    match_ani_points_ob_ob((uint32_t)(uintptr_t)obj->field08,
                           obj->field00->him);
}

void match_me_with_him(MK3OBJ *obj)
{
    match_ani_points_ob_ob(obj->field00->him,
                           (uint32_t)(uintptr_t)obj->field08);
}


/* ------------------------------------------------------------------- mpyu
 *
 * armv7 0x00056150, twenty bytes.  **Complete.**
 *
 *      umull lo, hi, b, a
 *      if (lo_out) *lo_out = lo
 *      if (hi_out) *hi_out = hi
 *
 * A 64-bit unsigned multiply with both halves optional -- each pointer is
 * tested before it is written, so a caller that wants only the high word
 * passes null for the other. The name is the TMS34010 instruction it replaces.
 */
void mpyu(uint32_t a, uint32_t b, uint32_t *hi_out, uint32_t *lo_out)
{
    uint64_t product = (uint64_t)b * (uint64_t)a;

    if (lo_out != NULL)
        *lo_out = (uint32_t)product;
    if (hi_out != NULL)
        *hi_out = (uint32_t)(product >> 32);
}


/* -------------------------------------------------------------- rsnd_func
 *
 * armv7 0x00057dbc, twenty bytes.  **Complete.**
 *
 *      MKEvent_Add(2, 2, arg, 0)
 *
 * The caller's second argument becomes the event's third and everything else
 * is a literal. The object is not passed at all, so this is a sound request
 * that belongs to nobody.
 */
void rsnd_func(uint32_t unused, uint32_t which)
{
    (void)unused;
    MKEvent_Add(2, 2, (long)which, 0);
}


/* ------------------------------------------ sans_repell and sans_repell_3
 *
 * armv7 0x00054d64 and 0x00054d78, twenty bytes each.  **Complete.**
 *
 *      obj->field38 = N
 *      *(uint16_t *)(G + 0x456) = N        ; the same N
 *
 * 0x40 and 3. Each writes its constant to two places, one on the object and
 * one in the global state, and the object's 0x38 is the same slot the stick
 * routines write their direction mask into. Two unrelated things through one
 * offset, again.
 */
void sans_repell(MK3OBJ *obj)
{
    obj->field38 = 0x40;
    *(uint16_t *)(G_BYTES + 0x456) = 0x40;
}

void sans_repell_3(MK3OBJ *obj)
{
    obj->field38 = 3;
    *(uint16_t *)(G_BYTES + 0x456) = 3;
}


/* ================================================== four events, four shapes
 *
 * `MKEvent_Add(kind, a, b, c)` again. Each of these fills it from a different
 * place and everything else is a literal, so what they establish is which
 * argument carries what -- not what the event system does with it.
 * ======================================================================== */

void send_code_a3(MK3OBJ *obj)
{
    MKEvent_Add(2, 4, (long)obj->field28, 0);
}

void shake_a11(MK3OBJ *obj)
{
    MKEvent_Add(1, 0, (long)obj->field48, 0);
}

void tsound_func(uint32_t unused, uint32_t which)
{
    (void)unused;
    MKEvent_Add(2, 0, (long)which, 0);
}


/* ---------------------------------------------------------- set_his_noedge
 *
 * armv7 0x0005715c, twenty bytes.  **Complete.**
 *
 * `call_for_him` with `set_noedge`. The third caller of the trampoline, and
 * the first that passes a routine this file also defines -- which is what the
 * mechanism is for: one flag setter, reachable for either fighter.
 */
void set_his_noedge(MK3OBJ *obj)
{
    call_for_him(obj, set_noedge);
}


/* -------------------------------------------------------- walk_flip_reverse
 *
 * armv7 0x000552c8, twenty bytes.  **Complete.**
 *
 *      flags = obj->field08->field28
 *      obj->field2c = flags
 *      if (flags & 0x10) obj->field20 = -obj->field20
 *
 * Bit 4 of 0x28 is the bit `flip_multi` toggles, so that bit is a facing and
 * this negates the walk when it is set. Two functions written a batch apart
 * meeting on one bit is the first time this file has explained itself.
 *
 * The `ittt ne` block is three predicated instructions, which is a load, a
 * negate and a store -- an if with no else.
 */
void walk_flip_reverse(MK3OBJ *obj)
{
    uint32_t flags = obj->field08->field28;

    obj->field2c = flags;
    if (flags & 0x10u)
        obj->field20 = (uint32_t)(-(int32_t)obj->field20);
}


/* ------------------------------------------------------------ xfer_otherguy
 *
 * armv7 0x00055130, twenty bytes.  **Complete.**
 *
 * Parks the opponent in 0x1c and hands his THREAD to the fast transfer. The
 * PROC is loaded twice, once for each -- kept as written.
 */
void fastxfer_thread(MK3OBJ *obj, MK3THREAD *thread);

void xfer_otherguy(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;

    obj->field1c = (uint32_t)(uintptr_t)proc->field00;
    fastxfer_thread(obj, proc->field00->thread);
}


/* ---------------------------------------------------- ReallyKillProjectile
 *
 * armv7 0x0005764c, twenty-four bytes.  **Complete.**
 *
 *      t = FindThread(proc->field08 + 0x700)
 *      if (t) KillSThread(t)
 *
 * The 0x700 is added to the PROC's 0x08 before the search, so the projectile's
 * thread is found at a fixed distance from whatever that field addresses.
 * `KillSThread` is the restart-at-terminate call, so "really kill" is still a
 * request the thread has to honour on its next turn.
 */
MK3THREAD *FindThread_at(uint32_t key);

void ReallyKillProjectile(MK3OBJ *obj)
{
    MK3THREAD *t = FindThread_at(obj->field00->field08 + 0x700);

    if (t != NULL)
        KillSThread(t);
}


/* ------------------------------------------------------------ adjust_him_a0
 *
 * armv7 0x00057094, twenty-four bytes.  **Complete.**
 *
 *      obj->field20 = (int32_t)obj->field1c >> 16          ; arithmetic
 *      obj->field1c = (int16_t)obj->field1c                ; sign-extended
 *      adjust_him_xy(obj)
 *
 * A packed coordinate pair split into its two halves before the call, both
 * signed. `create_fx` packs a pair the same way and this is the other end of
 * it: one word travels, two numbers arrive.
 */
void adjust_him_a0(MK3OBJ *obj)
{
    uint32_t packed = obj->field1c;

    obj->field20 = (uint32_t)((int32_t)packed >> 16);
    obj->field1c = (uint32_t)(int32_t)(int16_t)packed;
    adjust_him_xy(obj);
}


/* -------------------------------------------------------------- air_dragon
 *
 * armv7 0x00057530, twenty-four bytes.  **Complete.**
 *
 * Two literals -- 40 and -40 -- into the spill slots and into the call, with
 * the PROC's slave as the object to move. The slots are written as well as
 * passed, which is the habit and not a second use.
 */
void air_dragon(MK3OBJ *obj)
{
    obj->field1c = 0x28;                        /* 40 */
    obj->field20 = (uint32_t)-40;
    multi_adjust_xy_ob(obj, obj->field00->slave, 0x28, (uint32_t)-40);
}


/* -------------------------------------------------------------- am_i_shang
 *
 * armv7 0x0005790c, twenty-four bytes.  **Complete.**
 *
 * Bit 9 of the PROC's flag word, and the second bit of it this file names --
 * `am_i_joy` reads bit 0. The whole word goes to 0x2c and the answer to 0x5c,
 * and unlike `am_i_joy` this one does not return it: the caller reads the slot.
 */
void am_i_shang(MK3OBJ *obj)
{
    uint32_t flags = obj->field00->field10;

    obj->field5c = 0;
    obj->field2c = flags;
    if (flags & 0x200u)
        obj->field5c = 1;
}


/* --------------------------------------------------------------- am_i_short
 *
 * armv7 0x00055808, twenty-four bytes.  **Complete.**
 *
 *      get_my_height(obj)
 *      obj->field5c = (obj->field20 <= 103)
 *
 * The height arrives in 0x20 and the comparison is `> 0x67` inverted, so 103
 * is the threshold and short is at-or-below it. The answer goes to 0x5c, the
 * same slot `am_i_joy` and `am_i_shang` use, and is not returned.
 */
void get_my_height(MK3OBJ *obj);

void am_i_short(MK3OBJ *obj)
{
    get_my_height(obj);
    obj->field5c = ((int32_t)obj->field20 > 0x67) ? 0u : 1u;
}


/* -------------------------------------------------------- boomerang_adjuster
 *
 * armv7 0x0005757c, twenty-four bytes.  **Complete.**
 *
 * Three slots filled and then the general adjuster: 72 and 32 as the pair, and
 * the PROC's slave as the object. The 32 is computed as `72 - 40` in one
 * instruction rather than loaded, which is the compiler and not the source.
 */
void boomerang_adjuster(MK3OBJ *obj)
{
    obj->field1c = 0x48;                        /* 72 */
    obj->field20 = 0x48 - 0x28;                 /* 32, as the code forms it */
    obj->field30 = obj->field00->slave;
    adjust_xy_a5(obj);
}


/* ------------------------------------------------------- borrow_ochar_sound
 *
 * armv7 0x00057c00, twenty-four bytes.  **Complete.**
 *
 *      saved = other->field24
 *      other->field24 = obj->field20
 *      ochar_sound(obj)
 *      other->field24 = saved
 *
 * The first function in this file that puts a slot back. Everything else that
 * sets up a call leaves the value where it landed, which is why "borrow" is in
 * the name -- it is the exception being marked.
 *
 * The object is re-read from 0x08 after the call rather than kept in a
 * register. Transcribed as written: whether `ochar_sound` can move it is not
 * established here, and assuming it cannot is how a port acquires a bug that
 * only shows on one character.
 */
void ochar_sound(MK3OBJ *obj);

void borrow_ochar_sound(MK3OBJ *obj)
{
    MK3OBJ  *other = obj->field08;
    uint32_t saved = other->field24;

    other->field24 = obj->field20;
    ochar_sound(obj);
    obj->field08->field24 = saved;
}


/* --------------------------------------------------------- center_around_me
 *
 * armv7 0x00057b6c, twenty-four bytes.  **Complete.**
 *
 *      MKEvent_Add(1, 1, (int16_t)MK3_FIELD0E(other), proc->field08)
 *
 * The same event kind as `shake_a11` with a different second argument. 0x0e is
 * read signed here and signed in `get_my_dfe`; `create_fx` takes it as the
 * high half of a packed word, which does not contradict either.
 */
void center_around_me(MK3OBJ *obj)
{
    MKEvent_Add(1, 1, (int32_t)(int16_t)MK3_FIELD0E(obj->field08),
                obj->field00->field08);
}


/* ------------------------------------------------------- decode_walk_table
 *
 * armv7 0x000552dc, twenty-four bytes.  **Complete.**
 *
 *      base  = obj->field1c
 *      entry = base + other->field24 * 8
 *      obj->field1c = entry[0]
 *      obj->field20 = entry[1] << 4
 *
 * A table of eight-byte entries whose base arrives in a slot and whose index
 * is the other object's 0x24 -- the same field `borrow_ochar_sound` lends. The
 * second word is scaled by sixteen on the way out, so it is a fixed-point
 * quantity and the first is not.
 */
void decode_walk_table(MK3OBJ *obj)
{
    const uint32_t *entry =
        (const uint32_t *)(uintptr_t)(obj->field1c + obj->field08->field24 * 8);

    obj->field1c = entry[0];
    obj->field20 = entry[1] << 4;
}


/* ----------------------------------------------------- distance_off_ground
 *
 * armv7 0x00055164, twenty-four bytes.  **Complete.**
 *
 *      ground = proc->field40
 *      obj->field1c = ground                       ; then overwritten
 *      obj->field24 = (int16_t)other->field12
 *      obj->field1c = ground - that
 *
 * 0x1c is written twice, the first time with a value nothing reads. Kept:
 * the store is in the instruction stream and a transcription that removes it
 * is asserting that nothing between the two can observe it, which nothing
 * here establishes.
 *
 * `ground_player` copies the same 0x40 into the same 0x12 that this subtracts,
 * so the two are a matched pair: one sets the height, the other measures it.
 */
void distance_off_ground(MK3OBJ *obj)
{
    uint32_t ground = obj->field00->field40;
    int32_t  height;

    obj->field1c = ground;
    height = (int32_t)(int16_t)obj->field08->field12;
    obj->field24 = (uint32_t)height;
    obj->field1c = (uint32_t)((int32_t)ground - height);
}


/* ------------------------------------------------------ end_of_match_chores
 *
 * armv7 0x00056ae4, twenty-four bytes.  **Complete.**
 *
 *      obj->field1c = 0
 *      H[0x00] = H[0x04] = H[0x10] = H[0x14] = 0
 *
 * Four words of the second global cleared, in two adjacent pairs with a gap
 * between them. The gap is 0x08 and 0x0c, which this leaves alone -- worth
 * noting, because clearing a struct usually means clearing all of it.
 */
void end_of_match_chores(MK3OBJ *obj)
{
    obj->field1c = 0;
    *(uint32_t *)(H + 0x00) = 0;
    *(uint32_t *)(H + 0x04) = 0;
    *(uint32_t *)(H + 0x10) = 0;
    *(uint32_t *)(H + 0x14) = 0;
}


/* ------------------------------------------------------- face_opponent_px
 *
 * armv7 0x00055370, twenty-four bytes.  **Complete.**
 *
 *      if (!am_i_facing_him_px(obj, target)) flip_multi_px(obj, target);
 *
 * The chain `isp2` opens, closed. Both halves were written a batch apart --
 * the question and the flip -- and this is the one that joins them.
 */
void face_opponent_px(MK3OBJ *obj, MK3OBJ *target)
{
    if (!am_i_facing_him_px(obj, target))
        flip_multi_px(obj, target);
}


/* -------------------------------------------------------- fastxfer_thread
 *
 * armv7 0x00055118, twenty-four bytes.  **Complete.**
 *
 * `StartThreadAt` with one more field cleared -- 0xf8 as well as 0xfc, 0xa4 and
 * 0x08 -- and the function taken out of the caller's 0x38 rather than passed.
 * So 0x38 holds a thread entry point here, a direction mask in the stick
 * routines and a constant in `sans_repell`: three unrelated things through one
 * offset, which is now the clearest evidence in this file that these slots are
 * spill space and not fields.
 */
void fastxfer_thread(MK3OBJ *obj, MK3THREAD *thread)
{
    thread->fieldfc = 0;
    thread->frame = 0;
    thread->fieldf8 = 0;
    thread->field08 = 0;
    thread->func = (MK3THREADFUNC)(uintptr_t)obj->field38;
}


/* ------------------------------- find_ani_part_a14, find_ani2_part_a14
 *
 * armv7 0x000554a8 and 0x000554c0, twenty-four bytes each.  **Complete.**
 *
 *      saved = obj->field54
 *      get_char_ani(obj)            ; or get_char_ani2
 *      obj->field54 = saved
 *      find_part_a14(obj)
 *
 * The second and third restores in this file. What they defend against is NOT
 * the fetch: `get_char_ani` is decompiled further down and it writes 0x40 and
 * nothing else. The note here previously said the opposite, inferred from the
 * restore before the fetch had been read, and that inference was wrong.
 *
 * So 0x54 is preserved across a call that does not touch it. Either the
 * original was written defensively or `find_part_a14` needs it unchanged from
 * before the fetch; nothing establishes which, and the save stays because it
 * is in the instruction stream.
 */
void find_part_a14(MK3OBJ *obj);

void find_ani_part_a14(MK3OBJ *obj)
{
    uint32_t saved = obj->field54;

    get_char_ani(obj);
    obj->field54 = saved;
    find_part_a14(obj);
}

void find_ani2_part_a14(MK3OBJ *obj)
{
    uint32_t saved = obj->field54;

    get_char_ani2(obj);
    obj->field54 = saved;
    find_part_a14(obj);
}


/* ------------------------------------------------------------- get_his_dfe
 *
 * armv7 0x00054dd4, twenty-four bytes.  **Complete.**
 *
 * The "him" spelling of `get_my_dfe`: the opponent into 0x1c, his 0x0e
 * sign-extended into 0x28, then the same worker. The PROC's 0x04 is loaded
 * twice, once for each.
 */
void get_his_dfe(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;

    obj->field1c = proc->him;
    obj->field28 = (uint32_t)(int32_t)(int16_t)
                   MK3_FIELD0E((const MK3OBJ *)(uintptr_t)proc->him);
    gdfe4(obj);
}


/* ---------------------------------------------------------- get_my_matchw
 *
 * armv7 0x000550e4, twenty-four bytes.  **Complete.**
 *
 *      obj->field1c = ((uint32_t *)H)[proc->field08]
 *
 * H indexed by the PROC's 0x08 -- the same number `get_strength` uses to index
 * G. So the two globals are addressed by one per-fighter index, and H is at
 * least an array of words.
 */
void get_my_matchw(MK3OBJ *obj)
{
    obj->field1c = ((const uint32_t *)H)[obj->field00->field08];
}


/* ------------------------------------------------------------ init_special
 *
 * armv7 0x000587c8, twenty-four bytes.  **Complete.**
 *
 * `air_init_special` without the grounding: this stops the player, grounds
 * him, then runs isp2, where the air version skips the middle step. The pair
 * is what makes the name of the other one mean something.
 */
void init_special(MK3OBJ *obj)
{
    stop_me_player(obj);
    ground_player(obj);
    isp2(obj);
}


/* --------------------------------------------- is_he_right and is_he_left
 *
 * armv7 0x0005517c and 0x00055194, twenty-four bytes each.  **Complete.**
 *
 *      right: (him->field0c > other->field0c)
 *      left:  r = 1 - is_he_right(obj);  if (r borrowed) r = 0
 *
 * A comparison of 0x0c on two objects, so 0x0c is a horizontal position.
 *
 * The left one is not a negation. `rsbs` sets the carry and `it lo` clamps
 * anything that borrowed to zero, so a return above 1 would come out as 0
 * rather than negative. On the two values `is_he_right` actually returns the
 * two spellings agree; the clamp is transcribed because it is there, not
 * because it is reachable.
 */
long is_he_right(MK3OBJ *obj)
{
    MK3OBJ *him = (MK3OBJ *)(uintptr_t)obj->field00->him;
    long    r = (him->field0c > obj->field08->field0c) ? 1 : 0;

    obj->field5c = (uint32_t)r;
    return r;
}

long is_he_left(MK3OBJ *obj)
{
    uint32_t r = 1u - (uint32_t)is_he_right(obj);

    if (r > 1u)                         /* the borrow the `it lo` tests */
        r = 0;
    obj->field5c = r;
    return (long)r;
}


/* ------------------------------------------------------------- is_he_short
 *
 * armv7 0x000557cc, twenty-four bytes.  **Complete.**
 *
 * The "him" spelling of `am_i_short`, with the same threshold of 103 and the
 * same slot for the answer.
 */
void get_his_height(MK3OBJ *obj);

void is_he_short(MK3OBJ *obj)
{
    get_his_height(obj);
    obj->field5c = ((int32_t)obj->field20 > 0x67) ? 0u : 1u;
}


/* ------------------------------------------------------------ ladderorder_a1
 *
 * armv7 0x00057674, twenty-four bytes.  **Complete.**
 *
 *      v = RoundParam[0x14]
 *      obj->field20 = v
 *      if (v > 3) obj->field20 = 1
 *
 * A clamp to 1, not to 3. Anything past the last order folds back to the
 * first, which is what the name asks for and what a saturating clamp would
 * not do.
 *
 * `_RoundParam` is the third global reached through a pointer slot in this
 * file, after G and H; the slot is 0x000f3534 and the word it holds is
 * 0x0038ed04.
 */
extern uint32_t *RoundParam;            /* 0x0038ed04 */

void ladderorder_a1(MK3OBJ *obj)
{
    uint32_t order = ((const uint32_t *)RoundParam)[0x14 / 4];

    obj->field20 = order;
    if ((int32_t)order > 3)
        obj->field20 = 1;
}


/* -------------------------------------------------------------- lower_dragon
 *
 * armv7 0x00057548, twenty-four bytes.  **Complete.**
 *
 * `air_dragon` with different numbers: 29 and 48 rather than 40 and -40, and
 * the same slave. Both fill the slots as well as passing the values, which is
 * the habit and not a second use.
 */
void lower_dragon(MK3OBJ *obj)
{
    obj->field1c = 0x1d;                        /* 29 */
    obj->field20 = 0x30;                        /* 48 */
    multi_adjust_xy_ob(obj, obj->field00->slave, 0x1d, 0x30);
}


/* ------------------------------------------------------- match_him_with_me_f
 *
 * armv7 0x000570e0, twenty-four bytes.  **Complete.**
 *
 * The match, then a flip. The `_f` is the flip, and the object flipped is the
 * opponent -- `proc->field00`, the same double step the "his" functions take.
 */
void match_him_with_me_f(MK3OBJ *obj)
{
    match_him_with_me(obj);
    flip_multi_px(obj, obj->field00->field00);
}


/* ------------------------------------------------------------ ochar_sound_c
 *
 * armv7 0x00057bb0, twenty-four bytes.  **Complete.**
 *
 *      MKEvent_Add(2, 3, (c << 8) + obj->field1c, 0)
 *
 * The caller's second argument goes in the high byte and the slot in the low,
 * so the two are packed into one event parameter. Adding rather than ORing is
 * what the code does; with a slot below 256 the two are the same and nothing
 * here bounds it.
 */
void ochar_sound_c(MK3OBJ *obj, uint32_t c)
{
    MKEvent_Add(2, 3, (long)((c << 8) + obj->field1c), 0);
}


/* --------------------------------------------------------- previous_q_entry
 *
 * armv7 0x00056138, twenty-four bytes.  **Complete.**
 *
 *      head = obj->field38
 *      back = head - 4
 *      if (back < obj->field34 + 4) back = head + 0x4c
 *      obj->field38 = back
 *      obj->field1c = *back
 *
 * The ring buffer this file's header describes, walked backwards. The wrap
 * adds 0x4c -- nineteen words -- which with the entry itself is the twenty
 * slots the header names. The two descriptions were written from opposite ends
 * of the same array and they agree, which is the only check either gets.
 *
 * The comparison is unsigned (`it lo`), so the guard is against the pointer
 * going below the base and not against a signed underflow.
 */
void previous_q_entry(MK3OBJ *obj)
{
    uint32_t head = obj->field38;
    uint32_t back = head - 4;

    if (back < obj->field34 + 4)
        back = head + 0x4c;

    obj->field38 = back;
    obj->field1c = *(const uint32_t *)(uintptr_t)back;
}


/* ------------------------------------------------------------ randu_minimum
 *
 * armv7 0x00058764, twenty-four bytes.  **Complete.**
 *
 *      randu(obj)
 *      obj->field1c = obj->field1c - 1 + obj->field20
 *
 * The generator leaves its number in 0x1c and this shifts it by a minimum held
 * in 0x20, less one. So 0x20 is the low bound and the range the generator
 * produced is inclusive at its top.
 */
void randu(MK3OBJ *obj);

void randu_minimum(MK3OBJ *obj)
{
    obj->field1c = obj->field1c - 1 + obj->field20;
}


/* ------------------------------------------------------------ restore_power
 *
 * armv7 0x00057810, twenty-four bytes.  **Complete.**
 *
 *      slot = obj->field30
 *      obj->field1c = *slot
 *      if (*slot != 0) return
 *      *slot = 5
 *      obj->field1c = 1
 *      *(obj->field34) = 1
 *
 * The first early return in this file: a non-zero value means there is nothing
 * to restore. The 5 and the 1 are formed as `+5` then `-4` from the zero just
 * tested, which is a register being reused rather than two constants.
 */
void restore_power(MK3OBJ *obj)
{
    uint32_t *slot = (uint32_t *)(uintptr_t)obj->field30;

    obj->field1c = *slot;
    if (*slot != 0)
        return;

    *slot = 5;
    obj->field1c = 1;
    *(uint32_t *)(uintptr_t)obj->field34 = 1;
}


/* --------------------------------------------------------------- set_inviso
 *
 * armv7 0x00054f70, twenty-four bytes.  **Complete.**
 *
 *      clear_shadow_bit(obj)
 *      flags = obj->field08->field30 | 0x20
 *      obj->field54 = flags
 *      obj->field08->field30 = flags
 *
 * Not the mirror of `clear_inviso`. Going invisible clears the shadow bit as
 * well, and coming back does not restore it -- the asymmetry is in the code
 * and is left there.
 */
void set_inviso(MK3OBJ *obj)
{
    uint32_t flags;

    clear_shadow_bit(obj);
    flags = obj->field08->field30 | MK3F_INVISO;
    obj->field54 = flags;
    obj->field08->field30 = flags;
}


/* ------------------------------------------------------------------ stop_him
 *
 * armv7 0x00055c20, twenty-four bytes.  **Complete.**
 *
 * `stop_me_player` applied to the opponent, with his 0x1c preserved across it.
 * The fourth restore in this file, and like the others it reloads the object
 * afterwards rather than keeping it in a register.
 */
void stop_him(MK3OBJ *obj)
{
    MK3OBJ  *him = obj->field00->field00;
    uint32_t saved = him->field1c;

    stop_me_player(him);
    obj->field00->field00->field1c = saved;
}


/* -------------------------------------------------------- strike_check_a0_core
 *
 * armv7 0x000594b0, twenty-four bytes.  **Complete.**
 *
 * Fetches the strike table into 0x1c and passes it on with the caller's flag
 * untouched. The two wrappers written earlier -- `strike_check_a0` and
 * `strike_check_a0_test` -- differ only in that flag, and this is where it
 * goes.
 */
void get_char_stk(MK3OBJ *obj);

long strike_check_a0_core(MK3OBJ *obj, long test_only)
{
    get_char_stk(obj);
    return strike_check_ptr(obj, obj->field1c, test_only);
}


/* ------------------------------------------------------------- sweep_sounds
 *
 * armv7 0x000580d0, twenty-four bytes.  **Complete.**
 *
 * A sound request with 15, then 0x1c cleared, then the group sound. The clear
 * sits between the two calls, so it is the second one's argument being set up
 * and not the first one's being torn down.
 */
void sweep_sounds(MK3OBJ *obj)
{
    rsnd_func((uint32_t)(uintptr_t)obj, 0xf);
    obj->field1c = 0;
    group_sound(obj);
}


/* --------------------------------------------- GetFrameWidth, GetFrameHeight
 *
 * armv7 0x0005841c and 0x00058468, twenty-eight bytes each.  **Complete.**
 *
 *      int a, b, c, d;
 *      mk3_getbbox(obj, &d, &c, &b, &a)
 *      return b;                       ; width
 *      return a;                       ; height
 *
 * The same call with four output pointers and a different one read back. Two
 * functions to get two numbers out of one bounding box, which is how the
 * arcade asked for them and is kept.
 *
 * The four locals are named by position because that is all the pair
 * establishes: which slot is which, not what the other two are.
 */
void mk3_getbbox(MK3OBJ *obj, int *p1, int *p2, int *p3, int *p4);

int GetFrameWidth(MK3OBJ *obj)
{
    int s04 = 0, s08 = 0, s0c = 0, s10 = 0;

    mk3_getbbox(obj, &s10, &s0c, &s08, &s04);
    return s08;
}

int GetFrameHeight(MK3OBJ *obj)
{
    int s04 = 0, s08 = 0, s0c = 0, s10 = 0;

    mk3_getbbox(obj, &s10, &s0c, &s08, &s04);
    return s04;
}


/* --------------------------------------------------------- NewThreadProcPid
 *
 * armv7 0x00058b38, twenty-eight bytes.  **Complete.**
 *
 * `NewThreadProc` with one more store: the caller's third argument goes into
 * the thread's 0x104 before the proc at 0x108 is returned. So 0x104 is the pid
 * and this is the only routine here that sets one.
 */
void *NewThreadProcPid(uint32_t a, uint32_t b, uint32_t pid)
{
    MK3THREAD *t = NewThread();

    (void)a; (void)b;
    if (t == NULL)
        return NULL;

    t->pid = pid;
    return t->proc;
}


/* ------------------------------------------------------------- call_for_him
 *
 * armv7 0x0005712c, twenty-eight bytes.  **Complete.**
 *
 *      save   obj->field00, obj->field08
 *      him  = obj->field00->field00
 *      obj->field00 = him->field00
 *      obj->field08 = him->field08
 *      fn(obj)
 *      restore
 *
 * The trampoline the wrappers use. The callee gets the same object with the
 * opponent's pair hung off it, which is why `set_his_noedge` is `set_noedge`
 * with nothing else -- one flag setter serves both fighters.
 *
 * The only function here that restores two slots, and the only one that calls
 * through a pointer.
 */
void call_for_him(MK3OBJ *obj, void (*fn)(MK3OBJ *))
{
    MK3OBJPROC *saved_proc  = obj->field00;
    MK3OBJ     *saved_other = obj->field08;
    MK3OBJ     *him         = saved_proc->field00;

    obj->field00 = him->field00;
    obj->field08 = him->field08;

    fn(obj);

    obj->field00 = saved_proc;
    obj->field08 = saved_other;
}


/* -------------------------------------------------- ReallyKillHisProjectile
 *
 * armv7 0x00057630, twenty-eight bytes.  **Complete.**
 *
 *      key = 0x700 - proc->field08 + 1
 *      t = FindThread(key); if (t) KillSThread(t)
 *
 * NOT the "him" spelling of `ReallyKillProjectile`, which adds 0x700 to the
 * same field. This reflects about it instead. Both arithmetics are
 * transcribed as they are; reading a symmetry into the pair would be reading.
 */
void ReallyKillHisProjectile(MK3OBJ *obj)
{
    MK3THREAD *t = FindThread_at(0x700 - obj->field00->field08 + 1);

    if (t != NULL)
        KillSThread(t);
}


/* -------------------------------------------------------------- away_x_vel
 *
 * armv7 0x00055ab0, twenty-eight bytes.  **Complete.**
 *
 *      if (is_he_right(obj)) obj->field1c = -obj->field1c
 *      set_x_vel_player(obj)
 *
 * Away from him: negate the velocity when he is to the right, then apply it.
 * `walk_flip_reverse` negates the same kind of quantity off a facing bit; this
 * one asks the question instead.
 */
void set_x_vel_player(MK3OBJ *obj);

void away_x_vel(MK3OBJ *obj)
{
    if (is_he_right(obj))
        obj->field1c = (uint32_t)(-(int32_t)obj->field1c);
    set_x_vel_player(obj);
}


/* -------------------------------------------------------- create_blood_proc
 *
 * armv7 0x0005877c, twenty-eight bytes.  **Complete.**
 *
 *      n = obj->field1c
 *      if (n <= 12) { mk3_bloodevent(proc->field08, n); n = obj->field1c; }
 *      return n
 *
 * The comparison is unsigned (`bhi`), so a large value skips the call rather
 * than wrapping into it. 0x1c is re-read after the event and returned, so the
 * event can change it -- which is why the reload is kept.
 */
long mk3_bloodevent(uint32_t a, uint32_t n);

long create_blood_proc(MK3OBJ *obj)
{
    uint32_t n = obj->field1c;

    if (n <= 12u) {
        mk3_bloodevent(obj->field00->field08, n);
        n = obj->field1c;
    }
    return (long)n;
}


/* ----------------------------------------------------------- dec_his_p_hit
 *
 * armv7 0x00054e00, twenty-eight bytes.  **Complete.**
 *
 * `dec_my_p_hit` one step further out: the opponent goes into 0x1c, HIS PROC's
 * 0x44 is decremented, and the new value comes back into 0x20 -- re-read
 * through all three pointers rather than kept, exactly as the "my" version
 * re-reads through one.
 */
void dec_his_p_hit(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;
    MK3OBJPROC *his  = proc->field00->field00;

    obj->field1c = (uint32_t)(uintptr_t)proc->field00;
    his->p_hit = his->p_hit - 1;
    obj->field20 = obj->field00->field00->field00->p_hit;
}


/* ------------------------------------------------------------- delete_slave
 *
 * armv7 0x00056d20, twenty-eight bytes.  **Complete.**
 *
 *      if (proc->field64) {
 *          KillProc(that)
 *          proc->field64 = 0
 *          proc->slave   = 0
 *      }
 *
 * Two fields cleared, with the PROC reloaded between them. 0x68 is the slave
 * `f_set_a10_to_slave` reads, so 0x64 holds whatever `KillProc` was given --
 * the slave's object, since KillProc takes one and reads its thread.
 */
void delete_slave(MK3OBJ *obj)
{
    MK3OBJ *slave = (MK3OBJ *)(uintptr_t)obj->field00->field64;

    if (slave == NULL)
        return;

    KillProc(slave);
    obj->field00->field64 = 0;
    obj->field00->slave = 0;
}


/* ------------------------------------------------------------- edge_pick_a0
 *
 * armv7 0x00057170, twenty-eight bytes.  **Complete.**
 *
 *      saved = obj->field1c
 *      get_my_dfe(obj)
 *      obj->field1c = saved
 *      if (obj->field34 <= obj->field30) obj->field1c = -saved
 *
 * A restore and then a conditional negate of the restored value, comparing two
 * slots the fetch filled. Signed (`itt le`), and the negate is of the SAVED
 * value rather than of whatever is in the slot -- which is the same thing
 * here, and is written the way the code writes it.
 */
void edge_pick_a0(MK3OBJ *obj)
{
    uint32_t saved = obj->field1c;

    get_my_dfe(obj);
    obj->field1c = saved;
    if ((int32_t)obj->field34 <= (int32_t)obj->field30)
        obj->field1c = (uint32_t)(-(int32_t)saved);
}


/* -------------------------------------------------------- four_button_switch
 *
 * armv7 0x00057274, twenty-eight bytes.  **Complete.**
 *
 *      if ((int16_t)proc->field7c == 0) return button;
 *      if (button == 1) return 0;
 *      if (button == 4) return 3;
 *      return button;
 *
 * The six-button layout folded onto four. Only two buttons move -- 1 becomes 0
 * and 4 becomes 3 -- and everything else passes through, including 0 and 5.
 * The gate at 0x7c is read as a SIGNED halfword and tested against zero, so it
 * is a mode flag and not a count.
 *
 * `mk3_set_four_button` in the front end is the other half of this switch; the
 * stub in runtime/gamecode_stubs.c is where it currently stops.
 */
long four_button_switch(MK3OBJ *obj, long button)
{
    if ((int16_t)obj->field00->field7c == 0)
        return button;
    if (button == 1)
        return 0;
    if (button == 4)
        return 3;
    return button;
}


/* ---------------------------------------------------------------- frame_a9
 *
 * armv7 0x0005a664, twenty-eight bytes.  **Complete.**
 *
 *      do_next_a9_frame(obj)
 *      r = 1 - *(uint32_t *)obj->field40
 *      if (r borrowed) r = 0
 *      obj->field5c = r
 *
 * The same clamped negation `is_he_left` uses, on the first word of whatever
 * 0x40 now points at. So this reports "the frame list is exhausted": one means
 * the word was zero.
 */
void frame_a9(MK3OBJ *obj)
{
    uint32_t r;

    do_next_a9_frame(obj);
    r = 1u - *(const uint32_t *)(uintptr_t)obj->field40;
    if (r > 1u)
        r = 0;
    obj->field5c = r;
}


/* ============================================ the character animation tables
 *
 * Two named tables of pointers, indexed by a character number and then by a
 * frame:
 *
 *      obj->field40 = character_anitabs1[other->field24][obj->field40]
 *
 * 0x40 is both the index in and the result out, which is what makes these
 * "fetch" routines rather than getters -- the slot is advanced in place.
 *
 * The first index is 0x24, the same field `decode_walk_table` uses as a table
 * index and `borrow_ochar_sound` lends: a character number.
 * ======================================================================== */

extern uint32_t *character_anitabs1[];  /* 0x0016ee34 */
extern uint32_t *character_anitabs2[];  /* 0x0016ee9c */

void get_char_ani(MK3OBJ *obj)
{
    obj->field40 = character_anitabs1[obj->field08->field24][obj->field40];
}

void get_char_ani2(MK3OBJ *obj)
{
    obj->field40 = character_anitabs2[obj->field08->field24][obj->field40];
}

void get_his_char_ani(MK3OBJ *obj)
{
    const MK3OBJ *him = (const MK3OBJ *)(uintptr_t)obj->field00->him;

    obj->field40 = character_anitabs1[him->field24][obj->field40];
}
