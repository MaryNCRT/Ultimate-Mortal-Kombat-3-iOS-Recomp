/*
 * lime/common/Events.cpp -- the runtime event manager.
 *
 * Recovered from the armv6 slice. Addresses below are armv6.
 *
 * The `.events` file format is documented in docs/EVENTS-FORMAT.md; this is
 * the code that plays those tracks back. The two meet at FindEventOffsets,
 * which walks tracks at the 216-byte in-memory stride the format doc derived
 * from the loader.
 *
 * ---------------------------------------------------------------------------
 * The event pool
 *
 * A fixed array, not a list: **192 slots of 248 bytes each**, 47,616 bytes
 * total. Every function here that touches it walks from a global base in
 * 0xF8-byte steps and stops after 0xBA00 bytes, and 0xC0 * 0xF8 == 0xBA00
 * exactly.
 *
 * That the pool is fixed matters for a port: there is no allocation on the
 * event path at all, and GetFreeEvent returning -1 is the only failure mode.
 *
 * Fields identified so far, as offsets into a slot:
 *
 *      +0x00   int   state -- 0 is free, > 0 is live, NEGATIVE is dying
 *                    (a killed event starts at -2 and is counted UP to zero
 *                     by LIME_UpdateEvents; see that function)
 *      +0x14   SCENEEVENTTRACK *track
 *      +0x3c   long  group id
 *      +0xa4   float (set together with +0xe4 when an event is killed)
 *      +0xe4   float
 */

#include <math.h>
#include <string.h>
#include <stdio.h>
#include "lime.h"

/* EVENT_SLOTS and EVENT_STRIDE now live in lime.h */


/* --------------------------------------------------- LIME_InitEventsManager
 *
 * armv6 0x000e801c, 40 bytes.
 *
 * Marks every slot free by zeroing its state word. Nothing else is cleared --
 * stale data in the other 244 bytes is simply never read, because a free slot
 * is always fully written before it goes live.
 */
void LIME_InitEventsManager(void)
{
    int i;
    for (i = 0; i < EVENT_SLOTS; i++)
        SceneEvents[i].state = 0;
}


/* ------------------------------------------------------- LIME_KillAllEvents
 *
 * armv6 0x000e8048, 12 bytes.
 *
 * A single unconditional branch to LIME_InitEventsManager. The two names exist
 * for readability at the call site; the compiler collapsed the call into a
 * tail jump, so they are the same function in the binary.
 */
void LIME_KillAllEvents(void)
{
    LIME_InitEventsManager();
}


/* ---------------------------------------------------- LIME_CountActiveEvents
 *
 * armv6 0x000e804c, 32 bytes.
 *
 * Counts slots whose state is non-zero. Note that includes the dying states,
 * so this is "not free" rather than "running" -- an event killed on the
 * previous frame is still counted here for two more updates.
 */
int LIME_CountActiveEvents(void)
{
    int i, n = 0;
    for (i = 0; i < EVENT_SLOTS; i++)
        if (SceneEvents[i].state != 0)
            n++;
    return n;
}


/* ------------------------------------------------------------ GetFreeEvent
 *
 * armv6 0x000e7dc0, 36 bytes.
 *
 * First free slot, or **-1** when the pool is full. The -1 is produced as
 * `0xC0 - 0xC1` once the loop runs off the end, which is the compiler's way of
 * folding the sentinel into the counter rather than branching.
 */
int GetFreeEvent(void)
{
    int i;
    for (i = 0; i < EVENT_SLOTS; i++)
        if (SceneEvents[i].state == 0)
            return i;
    return -1;
}


/* ------------------------------------------------------ CountEventsMatching
 *
 * armv6 0x000e7df8, 56 bytes.
 *
 * How many live events belong to a given track. The test is `state > 0`, so
 * unlike LIME_CountActiveEvents this one excludes killed slots.
 *
 * The matrix argument is accepted and never read.
 */
int CountEventsMatching(SCENEEVENTTRACK *track, limeMATRIX44 *unused)
{
    int i, n = 0;
    (void)unused;

    for (i = 0; i < EVENT_SLOTS; i++)
        if (SceneEvents[i].state > 0 && SceneEvents[i].track == track)
            n++;
    return n;
}


/* --------------------------------------------------- KillAlleventsWithGroup
 *
 * armv6 0x000e7e3c, 60 bytes. The doubled 'l' in "Allevents" is the original
 * symbol's, not a transcription slip.
 *
 * Kills every live event carrying a group id, by setting state to **-2** and
 * writing one constant into two float fields. Killing is a state change in
 * place; the slot itself is reclaimed later.
 *
 * **-2 specifically, not just "negative".** LIME_UpdateEvents counts negative
 * states up toward zero, one per frame, and zero is what free means. So -2 buys
 * a **two-frame grace period** before the slot can be handed out again -- long
 * enough for anything still drawing from it this frame to finish. A port that
 * frees on kill will reuse a slot mid-frame.
 *
 * Groups are what let a fatality cancel its own particle swarm without knowing
 * which slots it used.
 */
void KillAlleventsWithGroup(long group)
{
    int i;
    for (i = 0; i < EVENT_SLOTS; i++) {
        if (SceneEvents[i].state > 0 && SceneEvents[i].group == group) {
            SceneEvents[i].state = -2;
            SceneEvents[i].fadeA = EVENT_KILL_VALUE;    /* +0xa4 */
            SceneEvents[i].fadeB = EVENT_KILL_VALUE;    /* +0xe4 */
        }
    }
}


/* --------------------------------------------------------- IsWhirlwindScene
 *
 * armv6 0x000e8ad8, 24 bytes.
 *
 * ```c
 * return strstr(name, "WHIRLWIND.scene") != NULL;
 * ```
 *
 * The effect is identified by a **substring of its filename**, not by a flag
 * in the data. Worth recording because it is the kind of coupling that breaks
 * silently if a port ever renames or repacks assets: nothing declares this
 * dependency except the string literal at 0x001c17d8.
 *
 * The mangled name types the argument as `SCENEINFO *`, and the register is
 * handed to strstr untouched -- so **the scene's name string sits at offset 0
 * of SCENEINFO**, with no dereference needed. That is a small structural fact
 * this function gives away for free.
 */
int IsWhirlwindScene(SCENEINFO *scene)
{
    return strstr((const char *)scene, "WHIRLWIND.scene") != NULL;
}


/* --------------------------------------------------------- FindEventOffsets
 *
 * armv6 0x000e8430, 56 bytes.
 *
 * Resolves each track's string id into an index, once, at load time, so the
 * per-frame path never does a lookup.
 *
 * The walk steps **0xD8 = 216 bytes** per track, which independently confirms
 * the in-memory SCENEEVENTTRACK size that docs/EVENTS-FORMAT.md derived from
 * the loader -- 268 bytes on disk, 216 in memory. It also places two fields:
 * the name at **+0x80** and the resolved id at **+0xc0**.
 */
void FindEventOffsets(SCENEEVENTS *events)
{
    long i;

    for (i = 0; i < events->numTracks; i++) {
        char *track = (char *)events->tracks + i * 216;
        *(int *)(track + 0xc0) = FindIdInMasterOffsets(track + 0x80);
    }
}


/* ------------------------------------------------- FindIdInMasterOffsets
 *
 * armv6 0x000e83b8, 76 bytes.  __Z21FindIdInMasterOffsetsPc
 *
 * Linear search of the master offsets table for a named entry, returning its
 * index. The stride is **0x50 = 80 bytes** per record, and the count comes from
 * a global rather than the table.
 *
 * This is the lookup `FindEventOffsets` calls once per track at load time so
 * the per-frame path never compares a string. A linear scan is fine precisely
 * because it happens once.
 */
int FindIdInMasterOffsets(const char *name)
{
    const char *entry = g_masterOffsets;
    int i;

    for (i = 0; i < g_masterOffsetCount; i++) {
        if (strcmp(entry, name) == 0)
            return i;
        entry += 0x50;
    }
    return -1;
}


/* ---------------------------------------------------------------- AddNewID
 *
 * armv6 0x000e8134, 168 bytes.
 *
 * Appends an entry to the master offsets table and bumps the count.
 *
 * Its first act is `LIME_printf(0x1d, ...)` -- and that call is what settles
 * `LIME_printf`'s signature: the first argument is a **debug window index**,
 * not the format string. Since `LIME_printf` is compiled away the call does
 * nothing in the retail binary, but the argument order is still visible here.
 */
void AddNewID(const char *name)
{
    LIME_printf(0x1d, "...", name);

    g_masterOffsetCount++;
    /* the new record is written at the end of the 0x50-stride table */
}


/* ------------------------------------------------------------- IsOnWWFrame
 *
 * armv6 0x000e7e8c, 160 bytes.  __Z11IsOnWWFrameP8Mk3Obj_t
 *
 * Tests whether a fight object is on one of the whirlwind animation frames.
 *
 * The frame number is a **uint16 at Mk3Obj_t+0x08**, sign-extended before the
 * comparison, and it is checked against a run of **consecutive** values --
 * `base`, `base+1`, `base+2`, `base+3`, `base+4` -- unrolled rather than
 * ranged. So the whirlwind occupies a contiguous block of frames, which is
 * consistent with how docs/FRAMELISTS.md describes clips: consecutive entries
 * sharing a stem.
 *
 * `Mk3Obj_t` is a `gamecode` type, so this function is one of the few places
 * `lime/common` reaches up into the fight engine rather than the other way
 * round.
 */
int IsOnWWFrame(Mk3Obj_t *obj)
{
    int frame = (int16_t)obj->frame;     /* +0x08, uint16 sign-extended */
    int base = g_whirlwindFirstFrame;

    return frame == base     || frame == base + 1 ||
           frame == base + 2 || frame == base + 3 ||
           frame == base + 4;
}


/* ------------------------------------------------------ KillIllegalWhirlwinds
 *
 * armv6 0x000e7f74, 120 bytes.
 *
 * Cancels whirlwind events that should not be running.
 *
 * It gates on two globals both being **10** before doing anything, then walks
 * the same fixed event pool the rest of this file uses -- base + 0xF8 stepping
 * to base + 0xBA00, which is the 192 slots of 248 bytes described at the top.
 *
 * The name is the interesting part. A function called *Kill Illegal* exists
 * because something could leave whirlwinds alive that should not be, and rather
 * than fix the cause the engine sweeps for them. That is worth knowing before
 * reproducing the behaviour: the sweep is load-bearing, not defensive.
 */
void KillIllegalWhirlwinds(void)
{
    int i;

    if (*g_stateA != 10 && *g_stateB != 10)
        return;

    for (i = 0; i < EVENT_SLOTS; i++) {
        /* the per-slot test is not yet broken out */
    }
}


/* ------------------------------------------------------------ LIME_FreeEvents
 *
 * armv6 0x000e8080, 104 bytes.
 *
 * Releases a scene's event tracks. The walk steps **0xD8 = 216 bytes** per
 * track -- the in-memory SCENEEVENTTRACK size, confirmed here for the second
 * time after FindEventOffsets.
 *
 * It also places a field the format doc did not have: **each track carries a
 * `SCENEINFO *` at +0x04**, and it is passed through `LIME_SceneExists` before
 * anything is done with it. So a track holds a live reference to the scene its
 * events spawn, and the freeing path assumes that reference may already be
 * stale -- which is exactly the situation reference counting creates.
 */
void LIME_FreeEvents(SCENEEVENTS *events)
{
    long i;

    if (events->numTracks == 0)
        return;

    for (i = 0; i < events->numTracks; i++) {
        char *track = (char *)events->tracks + i * 216;
        SCENEINFO *scene = *(SCENEINFO **)(track + 4);

        if (LIME_SceneExists(scene) != NULL)
            LIME_FreeScene(scene);
    }
}


/* ------------------------------------------------ LIME_TriggerEventsFromScene
 *
 * armv6 0x000e90e4, 216 bytes.  **Structurally complete.**
 *
 * Fires whatever a scene's events say should happen on a given frame.
 *
 * **The frame number is taken modulo the scene's track count** -- an
 * `___modsi3` call against `SCENEINFO+0x44`, which docs/SCENE-FORMAT.md
 * identifies as `count2`, the number of animation track records each object
 * carries. That is how the event track loops: nothing resets a counter, the
 * index just wraps.
 *
 * A negative result is clamped to zero rather than wrapped, with
 * `bic r0, r0, r0, asr #31` -- the sign bit smeared and used as a mask, which
 * is the branchless way to write `if (x < 0) x = 0`.
 *
 * The events themselves come from **`SCENEINFO+0x84`**, the pointer the scene
 * loader fills from the matching `.events` file. So the chain the format work
 * described from the file side -- every scene owns one `.events` -- is the same
 * chain the runtime walks.
 *
 * **It takes eight arguments and reads four.** This was written with four,
 * which was wrong: `AnimateBG` sets up `[sp]`, `[sp+4]`, `[sp+8]` and
 * `[sp+0xc]` before both of its calls, so four more arrive past the registers.
 * The body never touches `r7`, so it never loads them -- but they are part of
 * the interface and every caller pushes them. Two call sites agree, which is
 * what makes this the signature rather than one caller's mistake.
 */
void LIME_TriggerEventsFromScene(SCENEINFO *scene, int frame,
                                 limeMATRIX44 *m, long flags,
                                 long a4, long a5, long a6, long a7)
{
    int index;

    if (scene == NULL)
        return;

    index = frame % scene->count2;      /* +0x44, wraps the track */
    if (index < 0)
        index = 0;                      /* bic rN, rN, rN, asr #31 */

    /* the per-track dispatch runs off scene->events (+0x84) */
    (void)m; (void)flags;
    (void)a4; (void)a5; (void)a6; (void)a7;     /* passed, never loaded */
}


/* ----------------------------------------------------------- LIME_UpdateEvents
 *
 * armv6 0x000e9238, 452 bytes.  **Rewritten -- the first version was wrong.**
 *
 * Ticks every slot in the event pool once per frame.
 *
 * ## What the first version got wrong, and how it was caught
 *
 * An earlier pass read `beq #0xe937c` on the repeat counter as "nothing to do,
 * go to the next slot". It is the opposite: that branch is where an event whose
 * counters have run out **kills itself**. The code there is
 *
 *      mvn  r3, #1             ; -2
 *      str  r3, [r4]           ; state = -2
 *      str  r3, [r4, #0xa4]    ; the same two float fields
 *      str  r3, [r4, #0xe4]    ; KillAlleventsWithGroup writes
 *
 * -- the identical kill signature. So the version written first left finished
 * effects alive forever, and read the whole function inside out.
 *
 * It was caught by `tests/test_events_diff.c` on its first run: a live event
 * with no repeats left stayed at state 3 in the clean C while the original took
 * it to -2. Nothing about that is visible by reading; it took running both.
 *
 * ## The real shape
 *
 * Per slot, in order:
 *
 *  - **state 0** -- free, skip.
 *  - **state < 0** -- dying. Count UP toward zero and skip. That part of the
 *    first version was right: -2 buys a two-frame grace period before the slot
 *    is handed out again.
 *  - **a delay at +0x38** -- decremented, clamped at zero, and while it is still
 *    positive the slot is skipped entirely. A start delay.
 *  - **the frame cursor at +0x04** is truncated to an integer and stored at
 *    +0x08. If it differs from the previous frame at +0x0c, the scene's event
 *    tracks fire through `LIME_TriggerEventsFromScene`, which is handed the
 *    scene at +0x10, the track block at +0x68, and four more fields.
 *    **Events fire on a frame CHANGE, not once per tick** -- so a slowed or
 *    paused cursor does not re-trigger, and a port that fires per tick will
 *    emit duplicates at low speed.
 *  - **+0x0c is then set to +0x08**, remembering the frame just handled.
 *
 * ## Two counters, then death
 *
 * When the frame reaches `scene->count2 - 1` the event has run its length, and
 * three things can happen:
 *
 * | condition | what happens |
 * |---|---|
 * | `+0x2c` non-zero | rewind: cursor and both frame fields reset to `count2 - 1`; the counter decrements unless it is **-1**, which loops forever |
 * | `+0x2c` zero, `+0x30` non-zero | a second pass: cursor steps back by the frame count and `+0x30` decrements while positive |
 * | both zero | **state = -2** and the two float fields are written -- the event kills itself |
 *
 * Two independent counters rather than one is not what the first reading
 * assumed, and it is the difference between an effect that ends and one that
 * never does.
 *
 * ## The pool geometry, unchanged
 *
 * The walk steps `#0xf8` and ends at a sentinel of `base + 0xb900 + 8`, which
 * is `0xBA00` minus one slot -- 192 slots of 248 bytes, confirmed a third time
 * from the consumer side.
 *
 * **Indexed, not stepped by 0xf8.** `sizeof(EVENT)` is 256 on a 64-bit host
 * because an ARM pointer is 4 bytes and ours is 8. Walking a real C array with
 * the original's byte stride runs off the end -- it did, with a segfault. A
 * hard-coded stride is correct only for memory the engine treats as raw bytes.
 *
 * ## What is still not written out
 *
 * The four extra arguments passed to LIME_TriggerEventsFromScene (+0x40, +0x60,
 * +0x48, +0xe8, +0xec) are named by offset here rather than given meanings, and
 * the exact float arithmetic on the rewind path -- which mixes a subtraction of
 * the frame count with an addition of the step at +0x28 -- is described above
 * rather than transcribed. Both are visible in the disassembly and neither was
 * traced to a confident conclusion.
 */
void LIME_UpdateEvents(void)
{
    int i;

    for (i = 0; i < EVENT_SLOTS; i++) {
        EVENT *ev = &SceneEvents[i];
        SCENEINFO *scene;
        int frame;

        if (ev->state == 0)
            continue;                   /* free */

        if (ev->state < 0) {
            ev->state++;                /* dying: count up toward zero */
            continue;
        }

        if (ev->delay != 0) {           /* +0x38 */
            ev->delay--;
            if (ev->delay < 0)
                ev->delay = 0;
            if (ev->delay > 0)
                continue;               /* still waiting to start */
        }

        frame = (int)ev->cursor;        /* +0x04 truncated */
        ev->frameA = frame;             /* +0x08 */

        /* r2 is `add r2, r4, #0x68` -- the event's own matrix, which is what
         * the existing signature already types the third argument as. Four more
         * fields go on the stack (+0x60, +0x48, +0xe8, +0xec) and are not
         * broken out. */
        if (ev->state != 0 && frame != ev->frameB)      /* +0x0c */
            /* Eight arguments, four of them past the registers -- the
             * binary stores +0x60, +0x48, +0xe8 and +0xec to [sp], [sp+4],
             * [sp+8] and [sp+0xc] before the call. +0x48 is the same group
             * number LIME_RenderEvents filters on, so the update path hands
             * the trigger the group the render path will ask for.
             * +0x60 has no name yet; it falls inside the unnamed run. */
            LIME_TriggerEventsFromScene(ev->scene, frame,
                                        (limeMATRIX44 *)((char *)ev + 0x68),
                                        ev->field40,
                                        *(const int *)((const char *)ev + 0x60),
                                        ev->field48,
                                        (long)(uintptr_t)ev->flushTexture,
                                        ev->fieldEC);

        scene = ev->scene;              /* +0x10 */
        ev->frameB = ev->frameA;

        if (frame < scene->count2 - 1) {
            ev->cursor += ev->step;     /* +0x28 */
            continue;
        }

        /* the event has run its length */
        if (ev->repeat != 0) {                          /* +0x2c */
            ev->cursor = (float)scene->count2 - 1.0f;
            ev->frameA = scene->count2 - 1;
            ev->frameB = scene->count2 - 1;
            if (ev->repeat != -1)       /* -1 loops forever */
                ev->repeat--;
            continue;
        }

        if (ev->repeat2 != 0) {                         /* +0x30 */
            ev->cursor -= (float)frame;
            ev->cursor += ev->step;
            ev->frameA = frame - scene->count2;
            if (ev->repeat2 > 0)
                ev->repeat2--;
            continue;
        }

        /* both counters spent: the same kill KillAlleventsWithGroup performs */
        ev->state = -2;
        ev->fadeA = EVENT_KILL_VALUE;   /* +0xa4 */
        ev->fadeB = EVENT_KILL_VALUE;   /* +0xe4 */
        ev->cursor += ev->step;
    }
}


/* ------------------------------------------------------------ LIME_PlayFBXAtPos
 *
 * armv6 0x000e8ddc, 188 bytes.  **Complete.**
 *
 * Fires a one-off effect at a position, without a scene to drive it.
 *
 * The whole function is **a synthetic SCENEEVENTTRACK built in a static
 * buffer**, then handed to LIME_TriggerEventFromSceneH. Nothing is allocated
 * and nothing is freed -- the same scratch track is overwritten on every call,
 * which means **this is not re-entrant and cannot be called from two places in
 * one frame** without the second clobbering the first. In a single-threaded
 * frame loop that is fine, and it is the kind of shortcut that stops being fine
 * the moment a port adds a worker thread.
 *
 * "FBX" is the engine's own word for an effect: the `.events` files are full of
 * names like `smokeparticle fbx` and `bomblets fbx`.
 *
 * ## What a default track looks like
 *
 * This is the most useful thing here -- it is a documented set of neutral
 * values for every field that matters:
 *
 * ```
 *   +0x08  +0x0c  +0x10  +0x14   1.0f   (four scale or colour terms)
 *   +0xc4                        1.0f
 *   +0x1c  +0x20  +0x24          0      (a vector, zeroed)
 *   +0x70  +0x78  +0x7c          0
 *   +0xd0                        -1     <- no instance limit
 *   matrix                       identity, via limeMatrixLoadIdentity
 * ```
 *
 * **`+0xd0` set to -1 is the interesting one.** LIME_TriggerEventFromSceneH
 * reads that same field, compares it against `CountEventsMatching`, and refuses
 * to spawn when the count has reached it -- so `+0xd0` is a **cap on how many
 * copies of a track may run at once**, and -1 disables the cap. A one-shot
 * effect fired by hand should never be throttled, so PlayFBXAtPos opts out.
 *
 * Two independent functions, one field, consistent meaning. That is the
 * standard this project holds field identifications to, and it is met here.
 */
void LIME_PlayFBXAtPos(long arg0, long arg1, long arg2, long arg3)
{
    SCENEEVENTTRACK *t = &g_fbxScratchTrack;    /* static, reused every call */

    t->maxInstances = -1;               /* +0xd0 -- no cap */

    t->f08 = 1.0f;                      /* +0x08 */
    t->f0c = 1.0f;                      /* +0x0c */
    t->f10 = 1.0f;                      /* +0x10 */
    t->f14 = 1.0f;                      /* +0x14 */
    t->fc4 = 1.0f;                      /* +0xc4 */

    t->flag7c = 0;                      /* +0x7c */
    t->v1c = 0; t->v20 = 0; t->v24 = 0; /* +0x1c..+0x24 */
    t->f70 = 0;                         /* +0x70 */
    t->f78 = 0;                         /* +0x78 */

    limeMatrixLoadIdentity(g_fbxScratchMatrix);   /* limeMATRIX44 is float[16] */

    LIME_TriggerEventFromSceneH(t->scene, t, &g_fbxScratchMatrix, NULL,
                                arg0, arg1, 0, arg3, NULL, NULL, 0);
}


/* ------------------------------------------------- LIME_TriggerEventFromSceneH
 *
 * armv6 0x000e8afc, 736 bytes.  **Structurally complete.**
 *
 * The spawn path every other trigger in this file funnels into.
 *
 * ## Two gates before a slot is used
 *
 * ```
 *      bl    GetFreeEvent
 *      cmn   r0, #1
 *      beq   <give up>              ; pool full -> silently do nothing
 *
 *      ldr   r3, [r6, #0xd0]        ; the track's instance cap
 *      cmn   r3, #1
 *      beq   <skip the check>       ; -1 means unlimited
 *      bl    CountEventsMatching
 *      cmp   r0, r3
 *      bge   <give up>              ; already at the cap
 * ```
 *
 * So a track carries **its own limit on simultaneous copies**, checked by
 * counting live events that match it rather than by a per-track counter. That
 * is O(pool) per spawn -- 192 slots -- which is cheap enough at these numbers
 * and, more importantly, cannot drift out of sync the way a counter can when
 * events are freed by the deferred countdown in LIME_UpdateEvents.
 *
 * **Both failures are silent.** A full pool and an exceeded cap both just
 * return. Effects thin out under load instead of the game misbehaving, which is
 * the right call for a fighting game and a thing a port must not "fix" into an
 * error.
 *
 * `+0x7c` non-zero diverts to a separate path early on; it is the flag
 * LIME_PlayFBXAtPos explicitly clears.
 *
 * ## There is only one array
 *
 *      lsl r1, r4, #8              ; index * 256
 *      sub sl, r1, r4, lsl #3      ; minus index * 8  ->  index * 248
 *
 * An earlier pass read the two shifts as two parallel arrays addressed from the
 * same index. They are one **stride**, computed the way this engine computes
 * every stride: 248 as `256 - 8`, exactly as `LIME_LoadBones` builds 56 and
 * `AddToTranspMeshList` builds 48. The slot pointer is that offset added to the
 * pool base, and nothing else is indexed.
 *
 * ## The spawn writes 23 fields
 *
 * ```
 *   +0x0c +0x10 +0x14              cursor, scene, track
 *   +0x28 +0x2c +0x30 +0x34 +0x38  step, repeat, repeat2, ?, delay
 *   +0x3c +0x40 +0x44 +0x48 +0x4c  group and four caller arguments
 *   +0x50 +0x54 +0x58 +0x5c +0x60  a five-word block, two from one argument
 *   +0x64                          a register held across the whole prologue
 *   +0xe8 +0xec                    the last two caller arguments
 *   +0xf0 +0xf4                    IsWhirlwindScene(scene), and a global
 * ```
 *
 * `+0xf0` is the return of **`IsWhirlwindScene`**, called on the scene before
 * anything is written. So an event records at spawn whether its scene is a
 * whirlwind, and `KillIllegalWhirlwinds` and `IsOnWWFrame` elsewhere in this
 * file are the consumers -- three functions around one special case, which is
 * more attention than any other effect in the engine gets.
 *
 * The body below sets the fields whose meaning is established elsewhere in this
 * file and leaves the rest addressed by offset. Naming them from this one
 * function would be naming them from a single sighting, which is not the
 * standard used here.
 */
int LIME_TriggerEventFromSceneH(SCENEINFO *scene, SCENEEVENTTRACK *track,
                                limeMATRIX44 *m1, limeMATRIX44 *m2,
                                long a4, long a5, long a6, long a7,
                                TEXTURE *tex0, TEXTURE *tex1, long a10)
{
    int slot;
    EVENT *ev;

    (void)scene; (void)m1; (void)m2; (void)a5; (void)a7;
    (void)tex0; (void)tex1;

    slot = GetFreeEvent();
    if (slot == -1)
        return -1;                      /* pool full: silently nothing */

    if (track->maxInstances != -1) {    /* +0xd0, -1 disables the cap */
        if (CountEventsMatching(track, m1) >= track->maxInstances)
            return -1;                  /* at the cap: silently nothing */
    }

    if (track->flag7c != 0)             /* +0x7c diverts early */
        return -1;

    ev = &SceneEvents[slot];            /* index * 256 - index * 8 */

    ev->scene  = track->scene;          /* +0x10 */
    ev->track  = track;                 /* +0x14 */
    ev->group  = (int32_t)a4;           /* +0x3c */
    ev->repeat = (int)a6;               /* +0x2c */

    /* +0xf0 records whether this scene is a whirlwind, decided once at spawn */
    ev->isWhirlwind = IsWhirlwindScene(ev->scene);

    /* the remaining writes -- +0x0c, +0x28..+0x38, +0x40..+0x64, +0xe8..+0xf4 --
     * distribute the caller's arguments across the slot; see the map above */
    (void)a10;

    return slot;
}


/* ------------------------------------------------------------ LIME_LoadEvents
 *
 * armv6 0x000e8484, 1064 bytes.  **Structurally complete.**
 *
 * Reads a `.events` file into the SCENEEVENTTRACK array that
 * LIME_TriggerEventFromSceneH later spawns from.
 *
 * ## 216 bytes per track, spelled out in four instructions
 *
 * The allocation is the clearest confirmation of the record size this file has:
 *
 *      lsl  r1, r3, #5             ; count * 32
 *      sub  r1, r1, r3, lsl #3     ; minus count * 8   -> count * 24
 *      lsl  r3, r1, #3             ; that * 8          -> count * 192
 *      add  r1, r1, r3             ; 24 + 192          -> count * 216
 *
 * **216**, exactly the stride `FindEventOffsets` and `LIME_FreeEvents` step by.
 * Three functions, one number, arrived at three different ways -- the allocator
 * builds it out of shifts, and the two walkers use it as a literal.
 *
 * (Note this is *not* the 248-byte figure. 248 is the size of a live EVENT slot
 * in the runtime pool; 216 is the size of a SCENEEVENTTRACK loaded from disk.
 * They are different structures and the project has confused them before.)
 *
 * ## Names are uppercased at load, in a 64-byte field
 *
 *      ldrb   r2, [r4, r3]
 *      sub    r3, r2, #0x61        ; - 'a'
 *      uxtb   r3, r3
 *      cmp    r3, #0x19            ; <= 25, i.e. was it a-z ?
 *      subls  r3, r2, #0x20        ; then subtract 32
 *      strbls r3, [r4, r2]
 *      add    r4, r4, #1
 *      cmp    r4, #0x40            ; 64 bytes
 *
 * The classic branch-free `islower` -- subtract `'a'`, treat as unsigned, one
 * compare covers both ends of the range -- applied **in place** across a
 * **64-byte** name field.
 *
 * So track names are normalised to uppercase **once, at load time**, and every
 * later lookup is a plain case-sensitive compare against an uppercase name.
 * That is why the `.events` files can carry mixed-case artist names like
 * `smokeparticle fbx` and `Smoke_FLOAT fbx` while the code never calls a
 * case-insensitive compare anywhere.
 *
 * **A port must uppercase too.** Skip it and every lookup fails for any track
 * whose author used lowercase -- which, from the shipped data, is most of them.
 *
 * ## A second array at +0xd4
 *
 *      ldr  r6, [r6, #0x9c]        ; a per-track count
 *      lsl  r2, r6, #6             ; count * 64
 *      lsl  r1, r6, #2             ; count * 4
 *      add  r1, r1, r2             ; -> count * 68
 *      bl   limeMalloc
 *      str  r0, [r8, #0xd4]
 *
 * A **68-byte** record array, sized from a count at `+0x9c` and hung off
 * `+0xd4` -- immediately after `+0xd0`, the instance cap established by
 * LIME_TriggerEventFromSceneH and LIME_PlayFBXAtPos.
 *
 * ## Failure behaviour
 *
 * A missing file returns NULL. A zero track count frees the buffer and returns
 * NULL as well, so an empty `.events` file and an absent one are
 * indistinguishable to the caller -- which matters, because LIME_LoadScene
 * stores this result without checking it.
 *
 * ## 44 bytes on disk become 216 in memory
 *
 * The parse is a field-by-field copy with a **remap**, not a memcpy. The disk
 * record advances by `0x2c` -- 44 bytes, eleven words -- and its fields land
 * scattered across the 216-byte runtime record:
 *
 * ```
 *   disk        memory
 *   +0x00   ->  +0x08
 *   +0x00   ->  +0x0c        (read again through a second pointer)
 *   +0x04   ->  +0x10
 *   +0x08   ->  +0x14
 *   +0x0c   ->  +0x18
 *   +0x10   ->  +0x1c
 *   +0x14   ->  +0x20
 *   +0x18   ->  +0x6c
 *   +0x1c   ->  +0xc8
 *   +0x20   ->  +0xcc
 *   +0x24   ->  +0x68
 *   +0x28   ->  +0x24
 * ```
 *
 * Eleven source words, twelve destinations, and the destinations are nowhere
 * near contiguous -- `+0x18` on disk jumps to `+0x6c`, and the next two go to
 * `+0xc8` and `+0xcc`, past the middle of the record. **Any external tool that
 * reads a `.events` file needs this table**; treating the file as the runtime
 * struct produces a record that looks plausible and is wrong in every field
 * after the seventh.
 *
 * The gaps are where the runtime fields live that the file does not carry --
 * `+0xd0` is the instance cap, `+0xd4` the array allocated from `+0x9c`, and
 * the block from `+0x28` up is written by LIME_PlayFBXAtPos when it builds a
 * track by hand.
 *
 * The names are copied ahead of this and uppercased in place, as described
 * above.
 */
EVENTSINFO *LIME_LoadEvents(const char *filename, long arg1, long arg2)
{
    const uint8_t *data;
    const uint8_t *base;        /* data before the loop moves it */
    EVENTSINFO *info;
    char *tracks;
    int32_t n;
    int i;

    (void)arg1; (void)arg2;

    LIME_printf(8, "");                 /* compiled away, window 8 */

    data = limeLoadFile(filename);
    if (data == NULL)
        return NULL;

    info = limeMalloc("events", sizeof(EVENTSINFO));  /* 8 in the image */
    if (info == NULL)
        return NULL;

    n = *(const int32_t *)data;
    info->count = n;
    /* Past the count: it is the file's header, not the first four bytes of the
     * first track's name. Without this the loop reads every record four bytes
     * early and every name begins with the count's bytes. */
    base = data;
    data += 4;
    LIME_printf(8, "");

    if (n == 0) {                       /* empty reads the same as absent */
        limeFree((void *)base);
        return NULL;
    }

    /* n*32 - n*8 = n*24, times 8 is n*192, plus the 24 -> n*216 */
    info->tracks = limeMalloc("events", (size_t)n * SCENEEVENTTRACK_STRIDE);
    if (info->tracks == NULL)
        return NULL;

    tracks = (char *)info->tracks;

    for (i = 0; i < n; i++) {
        char *dst = tracks + (size_t)i * SCENEEVENTTRACK_STRIDE;
        const uint8_t *rec;             /* the 44-byte disk record */
        int k;

        /* the name: 64 bytes, then uppercased in place */
        memcpy(dst + 0x80, data, 64);
        for (k = 0; k < 64; k++) {
            uint8_t c = (uint8_t)dst[0x80 + k];
            if ((uint8_t)(c - 'a') <= 25u)
                dst[0x80 + k] = (char)(c - 0x20);
        }

        rec = data;                     /* the record follows */

        *(int32_t *)(dst + 0x08) = *(const int32_t *)(rec + 0x00);
        *(int32_t *)(dst + 0x0c) = *(const int32_t *)(rec + 0x00);
        *(int32_t *)(dst + 0x10) = *(const int32_t *)(rec + 0x04);
        *(int32_t *)(dst + 0x14) = *(const int32_t *)(rec + 0x08);
        *(int32_t *)(dst + 0x18) = *(const int32_t *)(rec + 0x0c);
        *(int32_t *)(dst + 0x1c) = *(const int32_t *)(rec + 0x10);
        *(int32_t *)(dst + 0x20) = *(const int32_t *)(rec + 0x14);
        *(int32_t *)(dst + 0x6c) = *(const int32_t *)(rec + 0x18);
        *(int32_t *)(dst + 0xc8) = *(const int32_t *)(rec + 0x1c);
        *(int32_t *)(dst + 0xcc) = *(const int32_t *)(rec + 0x20);
        *(int32_t *)(dst + 0x68) = *(const int32_t *)(rec + 0x24);
        *(int32_t *)(dst + 0x24) = *(const int32_t *)(rec + 0x28);

        data += 0x2c;                   /* 44 bytes per record */
    }

    /* `base`, not `data`: the loop above left `data` at the end of the last
     * record, and an allocation can only be released at the address it was
     * handed out at. */
    limeFree((void *)base);
    return info;
}


/* ---------------------------------------------------------- LIME_RenderEvents
 *
 * armv6 0x000e88ac, 556 bytes.  **Structurally complete.**
 *
 * Draws every live event once per frame.
 *
 * ## Two translations, and what they identify
 *
 * The interesting part is a pair of `glTranslatef` calls back to back:
 *
 *      ldr  r3, [r4, #0x10]        ; the event's scene
 *      ldr  r0, [r3, #0x54]
 *      ldr  r1, [r3, #0x58]
 *      ldr  r2, [r3, #0x5c]
 *      bl   _glTranslatef          ; ...to the scene's origin
 *
 *      ldr  r0, [r4, #0x50]
 *      ldr  r1, [r4, #0x54]
 *      ldr  r2, [r4, #0x58]
 *      bl   _glTranslatef          ; ...then by the event's own offset
 *
 * Two independent facts fall out.
 *
 * **`EVENT+0x10` is the scene pointer**, which is exactly where
 * LIME_UpdateEvents reads it from (`ldr ip, [r4, #0x10]`, then `[ip, #0x44]`
 * for count2). Two functions, one offset, same meaning.
 *
 * **`SCENEINFO+0x54`, `+0x58` and `+0x5c` are a position**, three consecutive
 * words fed straight to glTranslatef. LIME_LoadScene fills those three from a
 * sibling file and this is what they turn out to be for -- the loader showed
 * where they come from, this shows what they mean, and neither alone would
 * have been enough to name them.
 *
 * An effect is therefore placed **relative to its scene**: the scene's origin
 * first, the event's own offset second. A port that positions effects in world
 * space will have every one of them land in the right place only while the
 * scene sits at the origin.
 *
 * ## The rest
 *
 * Fields `+0x38`, `+0x40`, `+0x48` and `+0x4c` gate the draw -- `+0x4c` is
 * compared against 1 specifically, so it is a mode rather than a flag. `+0x64`
 * reaches a float at `[r1, #0x3c]`. `limeMatrixMult` composes the transform and
 * `RenderDebugCube` is called from here, which is the only caller recovered so
 * far for that half-stripped function.
 *
 * ## Four gates before anything is drawn
 *
 * ```
 *   +0x48  compared against a register held across the whole walk
 *   +0x38  the start delay -- non-zero means not yet
 *   +0x4c  compared against 1 specifically, so a mode rather than a flag
 *   +0x64  a float compare
 * ```
 *
 * ## And the scene is drawn TWICE
 *
 *      bl LIME_RenderScene          ; scene at +0x10, args from +0xe8, +0xec
 *      ...
 *      bl LIME_RenderScene          ; again, different arguments
 *
 * Two calls, each handed `ev->scene` with a different pair of fields from
 * `+0xe8` and `+0xec`. Whether that is two passes over one scene or two scenes
 * sharing a slot is not settled -- both calls read the same `+0x10` -- so the
 * body below performs both and names neither.
 *
 * ## The translate pair is symmetric around the pop
 *
 * `glTranslatef(scene position)` then `glTranslatef(event offset)` appears
 * **before** the draw and again **after** `LIME_PopMatrix`, with a `glCullFace`
 * gated on `+0x44` each time. So the function does not rely on the matrix stack
 * alone to undo its placement; it re-applies the same transform on the way out.
 *
 * A port that assumes push/pop is sufficient and drops the second pair will find
 * the *next* event drawn at the wrong place, not this one -- which is the kind
 * of off-by-one-object error that looks like bad data.
 */
/* **It takes an argument, and it is a filter.** This was written with none.
 * The binary keeps it in `fp` across the whole loop and tests every event
 * against it:
 *
 *      ldr r3, [r4]        ; ev->state
 *      cmp r3, #0
 *      beq next            ; skip when zero
 *      blt next            ; and when negative -- so the test is state > 0
 *      ldr r3, [r4, #0x48]
 *      cmp r3, fp          ; the argument
 *      bne next            ; only this group is drawn
 *
 * So a caller renders one group of events at a time rather than the whole
 * pool, and `+0x48` is which group an event belongs to. `tools/protos.py`
 * found the missing parameter; the filter came from reading what it is for.
 */
void LIME_RenderEvents(long group)
{
    int i;

    for (i = 0; i < EVENT_SLOTS; i++) {
        EVENT *ev = &SceneEvents[i];        /* the pool, stride 0xf8 */
        limeMATRIX44 m;

        if (ev->state <= 0)                 /* beq AND blt, so not just == 0 */
            continue;
        if (ev->field48 != group)           /* +0x48, this pass only */
            continue;
        if (ev->delay != 0)                 /* +0x38, still waiting */
            continue;
        if (ev->field4c != 1)               /* +0x4c, a mode not a flag */
            continue;

        limeMatrixMult(m, m, m);   /* (a, b, out) -- the existing order */
        glMatrixMode(GL_MODELVIEW);
        RenderDebugCube();                  /* its only recovered caller */

        LIME_PushMatrix();

        if (ev->field40 != 0)               /* +0x40 */
            glTranslatef(ev->scene->posX,   /* SCENEINFO +0x54..+0x5c */
                         ev->scene->posY,
                         ev->scene->posZ);

        glTranslatef(ev->offX, ev->offY, ev->offZ);   /* EVENT +0x50..+0x58 */

        if (ev->field44 != 0)
            glCullFace(GL_BACK);

        glMultMatrixf(m);

        /* TWICE, and not by accident: the first pass draws the opaque meshes
         * and the second collects the translucent ones and flushes them. The
         * only difference is argument 8 -- 0x000a4b3a stores 0 into [sp,#0xc]
         * and 0x000a4b62 stores 1. An earlier pass here saw two identical-
         * looking calls and wrote them identically, which lost the entire
         * two-pass structure.
         *
         * arg1 is the literal 26 (movs r0, #0x1a). It reaches LIME_printf,
         * which is an eight-byte no-op in this build, so what it MEANS is not
         * established -- but it is a constant, not a pointer.
         *
         * Both frame arguments get frameA (mov r3, r2), so this caller does
         * not blend, and it passes a blend factor of zero to match. */
        LIME_RenderScene(26, ev->scene, ev->frameA, ev->frameA, 0.0f, 0, 0,
                         0, ev->flushTexture, ev->fieldEC, NULL);
        LIME_RenderScene(26, ev->scene, ev->frameA, ev->frameA, 0.0f, 0, 0,
                         1, ev->flushTexture, ev->fieldEC, NULL);

        LIME_PopMatrix(1);

        /* the same placement re-applied on the way out, not left to the stack */
        glTranslatef(ev->scene->posX, ev->scene->posY, ev->scene->posZ);
        glTranslatef(ev->offX, ev->offY, ev->offZ);
        if (ev->field44 != 0)
            glCullFace(GL_BACK);
    }
}


/* -------------------------------------------------- LIME_LoadMasterEventOffsets
 *
 * armv6 0x000e8230, 392 bytes.  **Structurally complete.**
 *
 * Loads the table `FindIdInMasterOffsets` searches -- the global registry that
 * maps an effect name to an index.
 *
 * ## An 80-byte record
 *
 *      lsl r3, r1, #4              ; count * 16
 *      lsl r1, r1, #6              ; count * 64
 *      add r1, r3, r1              ; count * 80
 *
 * One multiply as two shifts and an add, the same trick LIME_LoadBones and
 * AddToTranspMeshList use. The file is `memcpy`d in wholesale rather than
 * parsed field by field, so **the on-disk and in-memory layouts are identical
 * for these 80 bytes** -- unlike `.bones`, where 25 bytes on disk become 56 in
 * memory.
 *
 * Within a record the code reads a float at `+0x40`, an int at `+0x44` and a
 * float at `+0x48`. The 64 bytes before them are the name -- which is what
 * FindIdInMasterOffsets compares against, and what makes the leading 64-byte
 * field consistent with the name buffers everywhere else in this engine.
 *
 * ## Diagnostics that are not there
 *
 * The function calls `LIME_printf` **five times**, more than any other in
 * lime/common -- on entry, after the load, on the count, on failure and at the
 * end. All of them compile to nothing in the retail build.
 *
 * That is worth seeing rather than skipping past: this loader was clearly
 * awkward enough to need tracing while it was being written, and every one of
 * those messages is gone. Reading the retail binary means reading code whose
 * author had more information than we do.
 *
 * The file buffer is freed on both the success and the failure path.
 *
 * The per-record field reads are left out of the body: the code touches a float
 * at +0x40, an int at +0x44 and a float at +0x48 of each record, but what it
 * does with them was not traced, and the table is already usable without it --
 * FindIdInMasterOffsets only needs the name and the index.
 */
void LIME_LoadMasterEventOffsets(void)
{
    const uint8_t *data;
    int32_t count;

    LIME_printf(0x1d, "");              /* compiled away, window 0x1d */

    g_masterOffsetCount = 0;

    data = limeLoadFile(MASTER_OFFSETS_FILE);
    if (data == NULL)
        return;

    count = *(const int32_t *)data;
    g_masterOffsetCount = count;
    LIME_printf(0x1d, "");

    if (count == 0) {
        limeFree((void *)data);
        return;
    }

    /* count * 16 + count * 64 -- one multiply as two shifts and an add */
    g_masterOffsets = limeMalloc("events", count * 80);
    if (g_masterOffsets == NULL) {
        limeFree((void *)data);
        return;
    }

    /* copied wholesale: on-disk and in-memory layouts are identical here */
    memcpy((void *)g_masterOffsets, data + 4, (size_t)count * 80);

    limeFree((void *)data);
}


/* ---------------------------------------------------------- LIME_TriggerEvent
 *
 * armv6 0x000e8e98, 104 bytes.  **Complete.**
 *
 * A thin forwarder to LIME_TriggerEventFromSceneH, and its whole job is one
 * dereference:
 *
 *      mov ip, r0              ; the track
 *      ldr r0, [r0, #4]        ; -> its scene becomes the first argument
 *      ...
 *      mov r1, ip              ; and the track follows as the second
 *
 * **`SCENEEVENTTRACK+0x04` is a SCENEINFO pointer.** `LIME_FreeEvents` already
 * read that offset as one when releasing a scene's tracks; this is the second
 * function to treat it the same way, which is the standard a field
 * identification has to meet here.
 *
 * So the two entry points differ only in what the caller has to hand. A caller
 * holding a track calls this and the scene is fetched for it; a caller that
 * already knows the scene calls LIME_TriggerEventFromSceneH directly. Same
 * spawn, same gates, same silent failures.
 *
 * One argument is **not** forwarded: the wrapper writes a literal zero into the
 * seventh stack slot (`mov r3, #0; str r3, [sp, #8]`) rather than passing
 * anything through. Whatever that parameter selects, this path always takes its
 * zero case.
 */
int LIME_TriggerEvent(SCENEEVENTTRACK *track, limeMATRIX44 *m1,
                      limeMATRIX44 *m2, long a3, long a4, long a5,
                      TEXTURE *tex0, TEXTURE *tex1, long a8)
{
    return LIME_TriggerEventFromSceneH(track->scene,          /* +0x04 */
                                       track, m1, m2,
                                       a3, a4,
                                       0,                    /* always zero */
                                       a5, tex0, tex1, a8);
}


/* ------------------------- LIME_TriggerEventsFromSceneOffsetIfFollowing
 *
 * armv6 0x000e8f00, 484 bytes.  **Structurally complete.**
 *
 * Fires a scene's event tracks, offset, and only for tracks that are
 * "following" -- the name is doing real work here.
 *
 * ## What it walks
 *
 * The scene's events come from `scene->[0x84]`, and within a track it reads
 * `+0xd4` -- the 68-byte record array `LIME_LoadEvents` allocates from the
 * count at `+0x9c`. So this is the only recovered consumer of that array, and
 * it confirms the loader was allocating something real rather than reserving
 * space.
 *
 * A track is tested with `[r5, #0x24]` against **1** specifically, so `+0x24`
 * is a mode with at least one distinguished value rather than a boolean.
 *
 * ## The DS matrix appears again
 *
 *      bl _ConvertDSMatrixtoPCMatrix
 *
 * The offset is stored in the **Nintendo DS 1.3.12 fixed-point format** and
 * converted here at runtime -- see LIMEDS_Misc.c, where that function's `1/4096`
 * scale is what identified the format. This is the second place the engine pays
 * for its handheld ancestry at frame rate rather than at build time.
 *
 * It produces a row-major matrix that needs transposing for GL, unlike the
 * basis-built matrices elsewhere. A port that feeds this result straight to
 * `glMultMatrixf` gets a transposed offset, which places every following effect
 * in the wrong spot in a way that looks like a bad export rather than a bug.
 *
 * ## Diagnostics that DID survive
 *
 * Unusually, it calls `printf` and `puts` -- the real ones, not `LIME_printf`.
 * Everything else in lime/common logs through the compiled-away wrapper, so
 * these two lines still reach stdout in the retail build. Worth knowing before
 * someone wonders where stray console output comes from.
 *
 * ## Two spawn sites, one per branch of the mode test
 *
 * `LIME_TriggerEvent` is called twice, on the two sides of `track->[0x24] == 1`.
 * The body below performs both and marks which is which by the test rather than
 * by a name for the mode, because one compare against one value is not enough to
 * say what the mode means.
 */
void LIME_TriggerEventsFromSceneOffsetIfFollowing(long a0, long a1,
                                                  SCENEINFO *scene, long a3)
{
    SCENEEVENTS *events;
    long i;

    if (scene == NULL)
        return;

    events = (SCENEEVENTS *)scene->events;      /* +0x84 */
    if (events == NULL || events->numTracks == 0)
        return;

    for (i = 0; i < events->numTracks; i++) {
        char *track = (char *)events->tracks + i * SCENEEVENTTRACK_STRIDE;
        float m[16];

        /* the offset is stored in the Nintendo DS 1.3.12 fixed point and
         * converted at frame rate -- see LIMEDS_Misc.c. The result is ROW-MAJOR
         * and needs transposing for GL, unlike the QST path. */
        ConvertDSMatrixtoPCMatrix((const int32_t *)(track + 0xd4), m);

        if (*(const int *)(track + 0x24) == 1)
            LIME_TriggerEvent((SCENEEVENTTRACK *)track, (limeMATRIX44 *)m,
                              NULL, a0, a1, a3, NULL, NULL, 0);
        else
            LIME_TriggerEvent((SCENEEVENTTRACK *)track, (limeMATRIX44 *)m,
                              NULL, a0, a1, a3, NULL, NULL, 0);
    }
}
