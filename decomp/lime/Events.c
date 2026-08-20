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
 *      +0x00   int   state -- 0 is free, > 0 is live, -2 is killed
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
 * Counts slots whose state is non-zero. Note that includes the killed state
 * (-2), so this is "not free" rather than "running".
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
 * writing one constant into two float fields. So killing is a state change in
 * place, never a free -- consistent with the pool being fixed.
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
