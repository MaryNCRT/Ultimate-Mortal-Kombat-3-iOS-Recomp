/*
 * Blood.c — src/gamecode/Blood.cpp
 *
 * Blood and the game-event pool that drives it. Hand-written from the
 * disassembly of the armv7 slice.
 */

#include <stdint.h>

/* `_GameEvents` — 0x00370e18.
 *
 * The size comes out of InitGameEvents itself rather than from a header: the
 * loop steps the byte cursor by 0x64 and stops at 0x640, which is sixteen
 * entries of a hundred bytes. Only the first word of each is cleared, so the
 * rest of an entry is left as it was and the first word is what marks a slot
 * free. What the other 96 bytes hold is not established here. */
#define GAME_EVENT_SLOTS   16
#define GAME_EVENT_STRIDE  0x64

typedef struct GAMEEVENT {
    int32_t active;                     /* 0x00  the only field this file touches */
    uint8_t rest[GAME_EVENT_STRIDE - 4];
} GAMEEVENT;

extern GAMEEVENT GameEvents[GAME_EVENT_SLOTS];      /* 0x00370e18 */


/* ------------------------------------------------------------ InitGameEvents
 *
 * armv7 0x00072f30, 32 bytes.  **Complete.**
 *
 *      str  r2, [r3]               <- slot 0, before the loop
 *      loop:
 *      str  r2, [r1, r3]           <- r1 = 0x64, 0xc8, ... base-relative
 *      adds r1, #0x64
 *      cmp  r1, #0x640
 *      bne  loop
 *
 * Slot zero is written outside the loop and the loop starts at 0x64, so all
 * sixteen are cleared exactly once. The compiler peeled the first iteration
 * because the cursor is used as the loop counter and starting it at zero would
 * have cost a separate compare.
 *
 * **It clears one word per entry, not the entry.** A port that memsets the
 * whole array is doing more than the original and would wipe fields the game
 * expects to survive an init.
 */
void InitGameEvents(void)
{
    int i;

    for (i = 0; i < GAME_EVENT_SLOTS; i++)
        GameEvents[i].active = 0;
}


void AddParticles(long type, float x, float y, float z, float speed, long arg);


/* ------------------------------------------------- DoBlood / Green / Black
 *
 * armv7 0x00073078, 0x0007302c and 0x00072fe0, 76 bytes each.  **Complete.**
 *
 * Three identical functions that differ in ONE constant: the particle type,
 * 2 for red, 4 for green and 6 for black. Everything else -- the 60.0f speed,
 * the pass-through of x, y, z and the caller's count, and the loop -- is the
 * same in all three, and the compiler emitted three copies rather than sharing
 * a body.
 *
 * **Each of them calls AddParticles EIGHTY times.** One call before the loop,
 * then the loop runs its counter from 1 up to 0x50 emitting one per pass, and
 * every call gets the same arguments. So `count` is not how many particles come
 * out; it is passed to each of eighty bursts.
 *
 * That is worth stating because it is the kind of thing a port "optimises" into
 * a single call with a multiplied count, and the two are not the same: whatever
 * AddParticles does with randomness happens eighty times here.
 */
static void DoBloodOfType(long type, float x, float y, float z, long count)
{
    long i;

    AddParticles(type, x, y, z, 60.0f, count);
    for (i = 1; i != 0x50; i++)
        AddParticles(type, x, y, z, 60.0f, count);
}

void DoBlood(float x, float y, float z, long count)
{
    DoBloodOfType(2, x, y, z, count);
}

void DoGreenBlood(float x, float y, float z, long count)
{
    DoBloodOfType(4, x, y, z, count);
}

void DoBlackBlood(float x, float y, float z, long count)
{
    DoBloodOfType(6, x, y, z, count);
}


/* ---------------------------------------------------------------- GetNewEvent
 *
 * armv7 0x00072eec, 68 bytes.  **Complete.**
 *
 * Finds the first free slot -- first word zero -- in the same sixteen-entry
 * pool InitGameEvents clears, and returns NULL when they are all taken. The
 * walk ends at base + 0x5dc, which is entry 15 at stride 0x64.
 *
 * On a hit it writes the type at +4, marks the slot live with 1 at +0, and
 * clears **+0x24 through +0x60** -- sixteen words -- leaving +8 through +0x20
 * untouched. So a reused slot inherits whatever those held.
 *
 * That asymmetry is transcribed as written. Clearing the whole entry would be
 * tidier and would erase fields the game may be relying on surviving.
 */
GAMEEVENT *GetNewEvent(long type)
{
    int i, k;

    for (i = 0; i < GAME_EVENT_SLOTS; i++) {
        long *e = (long *)&GameEvents[i];

        if (e[0] != 0)
            continue;

        e[1] = type;                    /* +0x04 */
        e[0] = 1;                       /* +0x00, live */
        for (k = 0x24; k <= 0x60; k += 4)
            e[k / 4] = 0;
        return &GameEvents[i];
    }
    return 0;
}


extern int Settings[10];                /* 0x00100e34 */


extern long *MercyMessage;              /* pointer slot -> 0x0014fb40 */
extern float *MusicVol;                 /* pointer slot -> 0x000ff830 */
long limeRand(void);
void limeStopTune(void);
void limePlayTune(const char *file, long vol, long arg);


/* --------------------------------------------------------- PlayFatalityVoice
 *
 * armv7 0x00072f58, 116 bytes.  **Complete.**
 *
 *      m = *MercyMessage
 *      if (m == 0 && Settings[2] == 0) return       <- nothing to do
 *      limeStopTune()
 *      if (limeRand() & 1) limePlayTune("Fatal1.mp3", vol, m)
 *      else                limePlayTune("Fatal2.mp3", vol, m)
 *
 *      vol = (long)MusicVol[Settings[2]]
 *
 * **The volume is a float TABLE indexed by the music setting**, converted to an
 * int with `vcvt.s32.f32` at the call. Settings[2] is the same slot
 * ResetSettingsData writes twice -- 3 by default, 0 when the phone already had
 * music playing -- so index 0 of MusicVol is the muted level and the guard
 * above means the voice is skipped entirely in that case unless a mercy message
 * is pending.
 *
 * The coin flip is `limeRand() & 1`, one bit, so the two clips are equally
 * likely. `_MercyMessage` is passed through to limePlayTune untouched.
 */
void PlayFatalityVoice(void)
{
    long mercy = *MercyMessage;
    long vol;

    if (mercy == 0 && Settings[2] == 0)
        return;

    limeStopTune();
    vol = (long)MusicVol[Settings[2]];

    if (limeRand() & 1)
        limePlayTune("Fatal1.mp3", vol, mercy);
    else
        limePlayTune("Fatal2.mp3", vol, mercy);
}
