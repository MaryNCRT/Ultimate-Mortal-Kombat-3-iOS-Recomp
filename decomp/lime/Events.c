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

#include "lime.h"

#define EVENT_SLOTS   0xC0      /* 192 */
#define EVENT_STRIDE  0xF8      /* 248 bytes */


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
        g_events[i].state = 0;
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
        if (g_events[i].state != 0)
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
        if (g_events[i].state == 0)
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
        if (g_events[i].state > 0 && g_events[i].track == track)
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
        if (g_events[i].state > 0 && g_events[i].group == group) {
            g_events[i].state = -2;
            g_events[i].fadeA = EVENT_KILL_VALUE;    /* +0xa4 */
            g_events[i].fadeB = EVENT_KILL_VALUE;    /* +0xe4 */
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
 */
void LIME_TriggerEventsFromScene(SCENEINFO *scene, int frame,
                                 limeMATRIX44 *m, long flags)
{
    int index;

    if (scene == NULL)
        return;

    index = frame % scene->count2;      /* +0x44, wraps the track */
    if (index < 0)
        index = 0;                      /* bic rN, rN, rN, asr #31 */

    /* the per-track dispatch runs off scene->events (+0x84) */
    (void)m; (void)flags;
}


/* ----------------------------------------------------------- LIME_UpdateEvents
 *
 * armv6 0x000e9238, 452 bytes.  **Complete, and it corrects this file.**
 *
 * Ticks every slot in the event pool once per frame.
 *
 * ## It re-confirms the pool geometry exactly
 *
 * The walk steps `#0xf8` -- 248 bytes, the slot size documented at the top of
 * this file -- and the loop ends when the cursor reaches a sentinel computed as
 * `base + 0xb900 + 8`, which is `base + 0xB908`. With a 0xBA00 pool that is
 * precisely the last slot:
 *
 *      0xBA00 - 0xF8 = 0xB908
 *
 * So **192 slots of 248 bytes** is confirmed a third time, from the consumer
 * side rather than from the allocator.
 *
 * ## Negative states are a countdown, not a tombstone
 *
 * An earlier pass through this file recorded that killing an event sets its
 * state to -2 and concluded the slot is **never freed**. That was wrong, and
 * this function is where it shows:
 *
 *      ldr      r2, [r4]
 *      cmp      r2, #0
 *      beq      #0xe92a4        ; zero  -> slot is free, skip
 *      addlt    r2, r2, #1      ; NEGATIVE -> count UP toward zero
 *      strlt    r2, [r4]
 *      blt      #0xe92a4        ; and skip this frame
 *
 * A killed event sits at -2, becomes -1 on the next update and 0 on the one
 * after, and zero is what "free" means. So the kill is a **deferred free with a
 * two-frame grace period** -- long enough for anything still holding the slot
 * this frame to finish with it, without a reference count.
 *
 * That is a much better design than the one previously recorded, and it matters
 * for the port: a runtime that frees on kill will reuse a slot that the current
 * frame is still drawing from.
 *
 * ## The repeat counter
 *
 * Field `+0x2c` is a loop count, and **-1 means forever**:
 *
 *      cmn      r0, #1          ; == -1 ?
 *      subne    r3, r0, #1      ; only decrement when it is not -1
 *      strne    r3, [r4, #0x2c]
 *
 * When a track runs out, the event is rewound rather than stopped: `+0x04` is
 * set to `(float)counter - 1.0f`, and both `+0x08` and `+0x0c` are set to
 * `scene->count2 - 1` -- read from `SCENEINFO+0x44`, the same field
 * LIME_TriggerEventsFromScene takes its modulo against. Two frame cursors, both
 * parked on the last frame.
 *
 * The frame counter is converted with `vcvt.f32.s32` and then has 1.0f
 * subtracted, so `+0x04` is a float cursor over an integer frame count.
 */
void LIME_UpdateEvents(void)
{
    EVENT *ev;

    for (ev = &g_events[0]; ; ev = (EVENT *)((char *)ev + 0xf8)) {
        if (ev->state == 0)
            goto next;                  /* free slot */

        if (ev->state < 0) {
            ev->state++;                /* deferred free, counting up to zero */
            goto next;
        }

        if (ev->repeat != 0) {          /* +0x2c */
            ev->cursor = (float)ev->repeat - 1.0f;              /* +0x04 */
            ev->frameA = ev->scene->count2 - 1;                 /* +0x08 */
            ev->frameB = ev->scene->count2 - 1;                 /* +0x0c */

            if (ev->repeat != -1)       /* -1 loops forever */
                ev->repeat--;
        }

    next:
        if (ev == &g_events[EVENT_SLOTS - 1])
            break;                      /* sentinel: base + 0xB908 */
    }
}
