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
extern float MusicVol[];                /* 0x000ff830 -- an ARRAY, same correction:
                                         * `add r1,pc` puts the array address in r1
                                         * and the volume is `[r1 + idx*4]`. */
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


extern int   Settings[10];              /* 0x00100e34 */
extern float MusicVol[];                /* 0x000ff830 -- an ARRAY, same correction:
                                         * `add r1,pc` puts the array address in r1
                                         * and the volume is `[r1 + idx*4]`. */
extern long  *PLAYER1MODEL;             /* pointer slot -> 0x0014e1b4 */
extern long  *PLAYER2MODEL;             /* pointer slot */

typedef struct Mk3Obj_t Mk3Obj_t;

void ArcadePosTo3dPos(Mk3Obj_t *obj, float *out, const signed char *who);
void CalcShakeOffset(long magnitude);
long get_tsound(long id);
void limePlaySound(long id, float vol, float pan, long flags);
void limeSetVibrate(void);


/* ------------------------------------------------------------- RunGameEvents
 *
 * armv7 0x000730c4, 484 bytes.  **Complete.**
 *
 * Runs the sixteen-slot event pool once a frame. A slot with `active == 0` or a
 * negative type is skipped; a type above 12 is skipped unless it is exactly 13.
 *
 * ### Types 0..12: blood, and which colour depends on the MODEL
 *
 * The position comes from `ArcadePosTo3dPos(obj, &event[0x0c], NULL)` and the
 * direction from `obj->flags & 0x10` -- **+1 or -1**, the same flag bit that
 * chooses the sign of the X offset in that conversion.
 *
 * The colour is chosen from the fighter's model id, read through
 * `PLAYER1MODEL` or `PLAYER2MODEL` depending on a signed byte at `obj + 0xd`:
 *
 *      model 7, 8 or 14   ->  DoBlackBlood
 *      model 11 or 19     ->  DoGreenBlood
 *      anything else      ->  DoBlood
 *
 * Those five ids are the robots and the reptilian characters, and they are
 * hardcoded here rather than carried in the player definition. The `7` and `8`
 * arrive as a range test (`(unsigned)(model - 7) <= 1`), which is the compiler
 * folding two comparisons, not a range in the data.
 *
 * All three are called with `z + 1.5f` -- the spray starts above the hit.
 *
 * **`Settings[0]` gates the blood entirely.** With it clear the event still
 * ages and still expires; nothing is drawn. So a port must not skip the
 * decrement along with the drawing.
 *
 * The hit sound is `get_tsound(0x22)` at `MusicVol[Settings[3]] / 100.0f`, and
 * only when `Settings[3]` is non-zero -- the same volume-index-into-a-float-
 * table that `PlayFatalityVoice` uses.
 *
 * ### Type 7 nudges the position first
 *
 *      x -= 0.765625f
 *      z -= 1.59375f
 *
 * then falls into the ordinary blood path. Two odd literals, both exact in
 * binary (49/64 and 51/32), so they were typed as decimals that happen to be
 * representable rather than tuned by ear.
 *
 * ### Type 13 is the screen shake
 *
 * A three-frame oscillator:
 *
 *      if (++event[0x2c] == 3) {
 *          event[0x2c] = 0;
 *          event[0x28]--;              <- shakes remaining
 *          event[0x24] = -event[0x24]; <- flip the offset
 *      }
 *      if (shakes remaining == 0) { CalcShakeOffset(0); event->active = 0; }
 *      else { CalcShakeOffset(event[0x24]); if (Settings[1]) limeSetVibrate(); }
 *
 * **The magnitude is negated, not recomputed**, so the shake alternates around
 * zero at exactly one third of the frame rate and ends by calling
 * `CalcShakeOffset(0)` -- it always leaves the camera centred rather than
 * wherever the last flip put it.
 *
 * `Settings[1]` is the vibration toggle, and it is checked per shake frame
 * rather than once.
 *
 * ### Expiry
 *
 * Every non-shake type decrements `event[0x24]` and frees the slot when it goes
 * **below** zero -- so a lifetime of 0 still runs one more frame.
 */
void RunGameEvents(void)
{
    GAMEEVENT *e = GameEvents;
    long *w;

    for (;;) {
        w = (long *)e;

        if (w[0] == 0)
            goto next;

        if (w[1] < 0)
            goto next;

        if (w[1] > 12) {
            if (w[1] != 13)
                goto next;

            /* the screen shake */
            w[0x2c / 4]++;
            if (w[0x2c / 4] == 3) {
                w[0x2c / 4] = 0;
                w[0x28 / 4]--;
                w[0x24 / 4] = -w[0x24 / 4];
            }

            if (w[0x28 / 4] == 0) {
                CalcShakeOffset(0);
                w[0] = 0;               /* always ends centred */
            } else {
                CalcShakeOffset(w[0x24 / 4]);
                if (Settings[1] != 0)
                    limeSetVibrate();
            }
            goto next;
        }

        {
            Mk3Obj_t *obj = (Mk3Obj_t *)(uintptr_t)(unsigned long)w[2];
            float *pos = (float *)&w[0x0c / 4];
            long dir = (((const unsigned short *)obj)[5] & 0x10) ? 1 : -1;
            long model;

            ArcadePosTo3dPos(obj, pos, 0);

            if (w[1] == 7) {
                pos[0] -= 0.765625f;    /* 49/64, exact */
                pos[2] -= 1.59375f;     /* 51/32, exact */
            }

            if (Settings[0] == 0)
                goto expire;            /* the event still ages */

            model = (((const signed char *)obj)[0xd] == 0)
                    ? *PLAYER1MODEL : *PLAYER2MODEL;

            if (model == 14 || (unsigned long)(model - 7) <= 1)
                DoBlackBlood(pos[0], pos[1], pos[2] + 1.5f, dir);
            else if (model == 19 || model == 11)
                DoGreenBlood(pos[0], pos[1], pos[2] + 1.5f, dir);
            else
                DoBlood(pos[0], pos[1], pos[2] + 1.5f, dir);

            if (Settings[3] != 0) {
                long s = get_tsound(0x22);
                if (s != -1)
                    limePlaySound(s, MusicVol[Settings[3]] / 100.0f, 1.0f, 0);
            }
        }

    expire:
        w[0x24 / 4]--;
        if (w[0x24 / 4] < 0)
            w[0] = 0;                   /* below zero, not at it */

    next:
        if (e == &GameEvents[GAME_EVENT_SLOTS - 1])
            return;
        e++;
    }
}
