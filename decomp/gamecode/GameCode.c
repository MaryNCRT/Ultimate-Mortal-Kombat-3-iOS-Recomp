/*
 * GameCode.c — src/gamecode/GameCode.cpp
 *
 * Top-level game state: camera, intro, and the texture sets that come and go
 * with it. Seventy-nine functions in the original; these are the small
 * self-contained ones, hand-written from the disassembly of the armv7 slice and
 * verified against the oracle by tests/test_gamecode_diff.c.
 */

#include <stdint.h>
#include <string.h>   /* memset, for clearSpriteListsAndEvents */

/* TEXTURETOLOAD is the engine's {name, destination} pair — see decomp/lime,
 * where LIME_SetSceneTextures walks the same shape. Declared rather than
 * included: gamecode has no header of its own yet and one file should not
 * invent the project's include graph. */
/* Completed from decomp/lime/lime.h, which settles the two fields gamecode
 * looks at. +0x40 is the GL texture name, and it is how the loading screen
 * asks "has this reached the GPU yet". */
typedef struct TEXTURE {
    uint8_t  _pad00[0x40];
    unsigned name;               /* 0x40  the GL texture name */
    uint8_t  _pad44[0x0c];
    int      field50;            /* 0x50 */
} TEXTURE;
typedef struct TEXTURETOLOAD {
    const char *name;            /* 0x00  NULL ends the list */
    TEXTURE   **dest;            /* 0x04  where the handle goes */
} TEXTURETOLOAD;

/* The engine's font object, laid out to match FONT in decomp/lime/lime.h.
 * GameCode.cpp reaches these by ADDRESS -- `add r0, pc` and straight into the
 * call, with no load in between -- so the C has to pass `&GameFont`, not
 * `GameFont`. An earlier `extern void *NameFont;` here dereferenced once too
 * many and would have drawn every debug line with the first word of the struct
 * as its font pointer. Only the fields gamecode touches are named; lime.h has
 * the rest. (`GameFontP` further down is a different thing: the pointer SLOT
 * other translation units use to find the same object.) */
typedef struct GAMEFONT {
    uint8_t   _pad00[0x0c];
    int       spacing;                  /* 0x0c */
    int       fallbackAdvance;          /* 0x10 */
    uint8_t   _pad14[4];
    int16_t   numGlyphs;                /* 0x18 */
    uint8_t   _pad1a[0x2e];
    uint8_t  *codes;                    /* 0x48  one byte per glyph */
    int16_t  *codesW;                   /* 0x4c  the same, widened */
} GAMEFONT;

void LoadSomeTextures(TEXTURETOLOAD *list);
void FreeSomeTextures(TEXTURETOLOAD *list);

/* Real globals, named in the symbol table and reached PC-relative. */
extern int LockCamera;                  /* 0x00150e8c */
extern int AxeTrailDisallowed;          /* 0x00150eac */
extern TEXTURETOLOAD BloodTexturesToLoad[];  /* 0x00150e1c */
extern int RenderSettings[2];           /* 0x001ab678, two words */

/* The game state. `getTransferableFlags` reaches it through a pointer slot at
 * 0x000f357c holding 0x0038c1fc, which is exactly where other.c independently
 * places `G`. Only the one field this file reads is named. */
typedef struct GAMESTATE {
    uint8_t _pad000[0x368];
    /* The two health BARS, and they are the health scaled by 1.66 -- see
     * ResetFightData, which writes 166/83/41 beside health 100/50/25 and
     * computes the survival one as `Health[0] * 166 / 100`. */
    long    healthBar1;                 /* 0x368 */
    long    healthBar2;                 /* 0x36c */
    uint8_t _pad370[0x44e - 0x370];
    int16_t field44e;                   /* 0x44e  ldrsh, normalised to 0 or 1 */
} GAMESTATE;
extern GAMESTATE *G;                    /* 0x0038c1fc */

/* Only the two fields JadeStomachShaker reads are named. */
typedef struct PLAYER {
    uint32_t field00;                   /* 0x00  must be 0x10 */
    uint8_t  _pad04[0x10];
    uint32_t field14;                   /* 0x14  must land in 0x23..0x29 */
} PLAYER;

extern char OpponentTowerList[];         /* 0x0014fcb4 */

int  limeWriteFile(const char *path, const void *data, long size, long flags);
void Write_Tower(void);

int  JadeStomachShaker(PLAYER *p);
void DeviceRenderSettings(void);
int  getTransferableFlags(void);

void AllowCameraTracking(void);
void StopCameraTracking(void);
void EndIntro(void);
void LoadBloodTextures(void);
void FreeBloodTextures(void);


/* ------------------------------------------------- camera tracking, the pair
 *
 * armv7 0x0001c41c and 0x0001c40c, 16 bytes each.
 *
 *      ldr r3, [pc, #8] ; movs r2, #N ; add r3, pc ; str r2, [r3] ; bx lr
 *
 * Both PC-relative computations land on **the same address**, 0x00150e8c,
 * which the symbol table calls `_LockCamera`. So this is one flag with two
 * named setters rather than two flags.
 *
 * The polarity reads backwards for a moment and is right: *allowing* tracking
 * clears the lock, *stopping* it sets the lock. The function names describe
 * the camera, the variable describes the constraint.
 */
void AllowCameraTracking(void)
{
    LockCamera = 0;
}

void StopCameraTracking(void)
{
    LockCamera = 1;
}


/* ------------------------------------------------------------------ EndIntro
 *
 * armv7 0x0001c664, 16 bytes.  `__Z8EndIntrov`
 *
 * The same shape, writing **10** to 0x00150eac — an exact symbol-table match
 * for `_AxeTrailDisallowed`.
 *
 * Ten is not a boolean, and a name ending in "Disallowed" taking the value ten
 * does not read as sensible. The address matches a named symbol exactly, so
 * this is not a nearest-neighbour guess; something else about the variable is
 * not what its name suggests. Written as the machine writes it, with the
 * oddity left standing rather than smoothed over by picking a nicer story.
 *
 * Whoever finds the reader of this variable will settle it in one step.
 */
void EndIntro(void)
{
    AxeTrailDisallowed = 10;
}


/* ------------------------------------------------------- the blood textures
 *
 * armv7 0x00023250 and 0x00022c60, 20 bytes each.
 *
 *      push {r7, lr} ; ldr r0, [pc, #8] ; add r0, pc ; bl ... ; pop {r7, pc}
 *
 * Both resolve to 0x00150e1c, `_BloodTexturesToLoad`, and hand it to the
 * engine's generic pair. The list itself is data in the slice; these two are
 * only the load and free sides of it, which is why they are twenty bytes each
 * and why they are worth having early: everything about blood rendering hangs
 * off a list this project can now name.
 */
void LoadBloodTextures(void)
{
    LoadSomeTextures(BloodTexturesToLoad);
}

void FreeBloodTextures(void)
{
    FreeSomeTextures(BloodTexturesToLoad);
}


/* -------------------------------------------------- DeviceRenderSettings
 *
 * armv7 0x0001b590, 16 bytes.  `__Z20DeviceRenderSettingsv`
 *
 *      ldr r3, [pc, #8] ; movs r2, #0 ; add r3, pc
 *      str r2, [r3] ; str r2, [r3, #4] ; bx lr
 *
 * Two consecutive words zeroed at 0x001ab678, `_RenderSettings`. Two words and
 * not one -- a body that cleared only the first would agree with the original
 * on every test that never read the second, which is why the test checks the
 * SPAN that moved rather than the value at one address.
 *
 * What the two words mean is not established here. Nothing in this function
 * reads them back and nothing else decompiled so far touches them.
 */
void DeviceRenderSettings(void)
{
    RenderSettings[0] = 0;
    RenderSettings[1] = 0;
}


/* -------------------------------------------------- getTransferableFlags
 *
 * armv7 0x0001c77c, 24 bytes.
 *
 *      ldr    r3, [pc, #0x10] ; add r3, pc ; ldr r3, [r3]
 *      ldrsh.w r0, [r3, #0x44e]
 *      subs   r0, #0 ; it ne ; movne r0, #1
 *      bx     lr
 *
 * The PC-relative computation lands on a POINTER SLOT at 0x000f357c, and what
 * the slot holds is 0x0038c1fc -- `_G`, the game state. That is the same
 * global `other.c` reaches for `SwitchQueue`, arrived at from a different
 * function by a different route, which is the standard this project asks for
 * before a name is treated as established.
 *
 * The field is a SIGNED halfword at +0x44e and the return is normalised to
 * 0 or 1, so the caller gets a boolean and the storage is not one. Both halves
 * matter: `ldrsh` sign-extends, and a value like 0xFFFF is non-zero either way
 * but reads as -1 rather than 65535 if anything ever compares it.
 *
 * Note the `it ne`. Instructions inside a Thumb IT block do not update the
 * flags, and recomp.py used to emit one that did -- see docs/RENDERMESH-DRAW.md.
 * This function is a small direct check that the fix holds.
 */
int getTransferableFlags(void)
{
    return (G->field44e != 0) ? 1 : 0;
}


/* --------------------------------------------------- JadeStomachShaker
 *
 * armv7 0x0001c64c, 24 bytes.  `__Z17JadeStomachShakerP6PLAYER`
 *
 *      ldr  r3, [r0]        ; cmp r3, #0x10 ; bne -> return 0
 *      ldr  r0, [r0, #0x14]
 *      subs r0, #0x23
 *      cmp  r0, #6
 *      ite  hi ; movhi r0, #0 ; movls r0, #1
 *
 * Two gates: the field at +0x00 must be exactly 0x10, and then +0x14 must fall
 * in **0x23..0x29 inclusive**.
 *
 * The range test is the subtract-and-compare-unsigned idiom, and the bound is
 * inclusive because the predicate is `ls` and not `lo`. Writing `< 6` instead
 * of `<= 6` loses the last value in the range -- one character state out of
 * seven, which is exactly the kind of thing that ships.
 *
 * Unsigned also matters: a value below 0x23 wraps to something enormous rather
 * than going negative, so the single comparison catches both ends. A signed
 * version would let everything under 0x23 through.
 *
 * Another `ite`, so another small check that the IT-block flag fix holds.
 */
int JadeStomachShaker(PLAYER *p)
{
    unsigned d;

    if (p->field00 != 0x10)
        return 0;

    d = (unsigned)p->field14 - 0x23u;
    return (d <= 6u) ? 1 : 0;
}


/* ---------------------------------------------------------------- Write_Tower
 *
 * armv7 0x00023818, 32 bytes.
 *
 *      ldr r1, [pc, #0x10] ; add r1, pc     ; -> _OpponentTowerList
 *      ldr r0, [pc, #0x14] ; add r0, pc     ; -> "towerdata"
 *      movs r2, #0xb0 ; movs r3, #0
 *      bl  _limeWriteFile
 *
 * Saves the tower ladder: 0xb0 bytes of `_OpponentTowerList` to a file called
 * "towerdata". The name is a string in the slice, not a constructed path, so
 * there is no directory involved -- whatever `limeWriteFile` prefixes is the
 * whole of the location policy.
 *
 * 0xb0 is 176 bytes. Nothing here says how many entries that is.
 */
void Write_Tower(void)
{
    limeWriteFile("towerdata", OpponentTowerList, 0xb0, 0);
}


extern TEXTURE *LoadingTexture;         /* 0x001abb94 */
void limeDeleteTexture(TEXTURE *tex);


/* ----------------------------------------------------------- GameCodeDestroy
 *
 * armv7 0x0001c778, 4 bytes: `bx lr`.
 *
 * Empty. The teardown counterpart to GameCodeInit, and the shipped game never
 * tears down -- iOS 3 apps were killed, not closed. Written out so the file's
 * count matches the binary rather than silently skipped.
 */
void GameCodeDestroy(void)
{
}


/* ---------------------------------------------------------- RemapKicksPunches
 *
 * armv7 0x0001b7a0, 4 bytes: `bx lr`.
 *
 * Empty, and it takes an argument it never reads. The name and the signature
 * are all that survive of a button-remapping hook; whatever it did lives in the
 * settings code now.
 *
 * **It returns its argument, and something depends on that.** `bx lr` leaves r0
 * exactly as it arrived, and `GetArcadeJoyBits` below tail-calls this and
 * returns immediately -- so the value that reaches its caller is the bits it
 * passed in. Declared as returning `long` for that reason: writing it `void`
 * compiles and hides the only thing this stub still does.
 */
long RemapKicksPunches(long arg)
{
    return arg;                         /* bx lr -- r0 is untouched */
}


/* -------------------------------------------------- DeleteLoadingScreenTexture
 *
 * armv7 0x0001c800, 36 bytes.  **Complete.**
 *
 *      ldr  r0, =_LoadingTexture
 *      ldr  r0, [r0]
 *      cbz  r0, skip
 *      bl   _limeDeleteTexture
 *   skip:
 *      ldr  r3, =_LoadingTexture
 *      movs r2, #0
 *      str  r2, [r3]
 *
 * The pointer is cleared on BOTH paths -- the store is past the cbz target, not
 * inside the branch. So calling this twice is safe, and calling it on a texture
 * that was never loaded is safe, which is what lets the loading screen be torn
 * down from more than one place.
 */
void DeleteLoadingScreenTexture(void)
{
    if (LoadingTexture != 0)
        limeDeleteTexture(LoadingTexture);
    LoadingTexture = 0;
}


extern float ShakeOffset[3];            /* 0x001f44bc */


/* ---------------------------------------------------------- CalcShakeOffset
 *
 * armv7 0x0001c620, 36 bytes.  **Complete.**
 *
 *      rsb.w r0, r0, #0            <- NEGATED first
 *      vcvt.f32.s32
 *      vdiv.f32 by 100.0
 *      str 0 -> [+0]
 *      str 0 -> [+4]
 *      str   -> [+8]
 *
 * The screen shake is **one axis only**: x and y are zeroed and the value goes
 * to z. And the input is negated before the divide, so a positive argument
 * pushes the offset negative.
 *
 * Both details are easy to lose. A port that writes all three components, or
 * that drops the `rsb`, produces a shake that looks plausible and is wrong in a
 * direction nobody notices until it is compared side by side.
 */
void CalcShakeOffset(long amount)
{
    ShakeOffset[0] = 0.0f;
    ShakeOffset[1] = 0.0f;
    ShakeOffset[2] = (float)(-amount) / 100.0f;
}


extern char mpSpriteList[0x140];        /* 0x001ab680 */
extern char mpEventQueue[0x1b0];        /* 0x001ab7c0 */


/* --------------------------------------------------- clearSpriteListsAndEvents
 *
 * armv7 0x00021ebc, 36 bytes.  **Complete.**
 *
 * Two memsets, and the sizes are literals: 0x140 and 0x1b0. Both buffers belong
 * to the multiplayer path -- they are the lists packSpriteList and
 * setNextSpritesAndEvents fill -- and this is called from Task_GameInit and
 * GameInit_LoadABit, so they are cleared on every load whether or not a
 * multiplayer session exists.
 */
void clearSpriteListsAndEvents(void)
{
    memset(mpSpriteList, 0, 0x140);
    memset(mpEventQueue, 0, 0x1b0);
}


extern float WorldScaleAdjust;          /* 0x0014df9c = 64.0 */
extern float CamOverridePos[3];         /* 0x001ab000 */
extern int   OverrideCamera;            /* 0x0010dea8 */


/* ------------------------------------------------------ setTransferableFlags
 *
 * armv7 0x0001c794, 36 bytes.  **Complete.**
 *
 * Masks the argument to one bit and stores it as a HALFWORD at `G + 0x44e`.
 * Both branches store the same masked value -- the compiler split them only
 * because it had the constant 1 in a register on one side -- so this is a plain
 * `G->field44e = flags & 1`.
 *
 * getTransferableFlags, already in this file, reads the same halfword and
 * normalises it to 0 or 1 on the way out -- so the pair round-trips, and the
 * mask here is what makes that true rather than the read doing the work.
 */
void setTransferableFlags(long flags)
{
    G->field44e = (int16_t)(flags & 1);
}


/* ----------------------------------------------- SetCameraOverridePosFrom2d
 *
 * armv7 0x0001c42c, 44 bytes.  **Complete, and it uses one of its three
 * arguments.**
 *
 *      stm.w sp, {r0, r1, r2}          <- three words spilled
 *      vldr  s14, [sp]                 <- only the FIRST is read
 *      vdiv.f32 s14, s14, _WorldScaleAdjust     ; 64.0
 *      vstr  s14, [_CamOverridePos]
 *      movs  r2, #1
 *      str   r2, [_OverrideCamera]
 *
 * The spill of r0, r1 and r2 into three consecutive words is what a struct
 * passed by value looks like under this ABI, so the parameter is almost
 * certainly a `limeVECTOR3` rather than three floats -- but only x is read, y
 * and z are spilled and abandoned, and `_CamOverridePos` keeps whatever its
 * other two components already held.
 *
 * That is transcribed rather than tidied. A port that helpfully writes all
 * three components is not doing what the original does, and the name says the
 * input is a 2d position, so dropping components may well be deliberate.
 *
 * The divisor is `_WorldScaleAdjust`, 64.0 -- a second world-scale constant
 * alongside `_SceneScale` and `_PlayerSize`. What relates them is not
 * established.
 */
void SetCameraOverridePosFrom2d(float x, float y, float z)
{
    (void)y;
    (void)z;                            /* spilled to the stack, never read */

    CamOverridePos[0] = x / WorldScaleAdjust;
    OverrideCamera = 1;
}


extern int CamTrackToPlayer;            /* 0x0014dfc4 */
extern int IsInFinishing;               /* 0x00150cbc */
extern int *RoundParam;                 /* pointer slot -> 0x0038ed04 */
void limeInit(void);
void LIME_InitEventsManager(void);
void LIME_InitDebugWindow(void);
void LIME_LoadMasterEventOffsets(void);


/* -------------------------------------------------------------- GameCodeInit
 *
 * armv7 0x0001c7c0, 56 bytes.  **Complete.**
 *
 * The whole of the game's startup, and it is short: three engine inits, three
 * globals, and the master event offsets last.
 *
 * **`_CamTrackToPlayer` starts at -1, not 0.** Zero is a valid player index, so
 * the sentinel for "track nobody" has to be something else, and a port that
 * zero-initialises this instead has the camera following player 0 from the
 * first frame.
 *
 * `RoundParam` is reached through a pointer slot and only two of its fields are
 * touched here: +0x34 set to 1 and +0x38 cleared. They are not named because
 * nothing in this function says what they are.
 */
void GameCodeInit(void)
{
    limeInit();
    LIME_InitEventsManager();
    LIME_InitDebugWindow();

    CamTrackToPlayer = -1;              /* mov.w r2, #-1 */
    IsInFinishing    = 0;

    RoundParam[0x38 / 4] = 0;
    RoundParam[0x34 / 4] = 1;

    LIME_LoadMasterEventOffsets();
}


extern int JaxGrowCounter;              /* 0x0010ded8 */
extern void **GameObjects;              /* 0x0014dfec */


/* -------------------------------------------------------- RunJaxGrowCounters
 *
 * armv7 0x0001c3cc, 56 bytes.  **Complete.**
 *
 * **Both tests are the same test, written two different ways by the compiler.**
 *
 *      ldrh  r3, [r2, #8]
 *      add.w r3, r3, #0xe800
 *      adds  r3, #0x84
 *      uxth  r3, r3
 *      cmp   r3, #1
 *      bls   grow
 *
 * Adding 0xe884 and truncating to sixteen bits maps 0x177c to 0 and 0x177d to
 * 1, so `<= 1` after that is exactly `x == 0x177c || x == 0x177d`. The second
 * test, on the signed halfword at +0x18, spells the same pair out as two
 * compares because the value is signed and the trick does not apply.
 *
 * So: the counter advances when EITHER of two fields holds one of two adjacent
 * ids. 0x177c is 6012 -- an animation or frame number for Jax's grow, which the
 * function name says and nothing here confirms.
 *
 * A port that reads the range check as a range has invented a rule the game
 * does not have.
 */
void RunJaxGrowCounters(void)
{
    const unsigned short *o = (const unsigned short *)GameObjects[0];

    if (o == 0)
        return;

    if (o[4] == 0x177c || o[4] == 0x177d) {         /* the halfword at +8 */
        JaxGrowCounter++;
        return;
    }
    {
        short s = ((const short *)o)[0x18 / 2];
        if (s == 0x177c || s == 0x177d)
            JaxGrowCounter++;
    }
}


extern int GameMode;                    /* 0x0014faa4 */
extern int Health[2];                   /* 0x0014fa64 */
int  isParentBasedOnSpeed(void);
void achievementsIncreaseMatchesWon(void);


/* ------------------------------------------------------------- updateMPWins
 *
 * armv7 0x000224d4, 48 bytes.  **Complete.**
 *
 *      if (GameMode != 1) return
 *      if (isParentBasedOnSpeed())  { if (Health[1]) return; }
 *      else                         { if (Health[0]) return; }
 *      achievementsIncreaseMatchesWon()
 *
 * **Each side watches the OTHER player's health, and which index that is
 * depends on the role.** The peer that `isParentBasedOnSpeed` calls the parent
 * reads Health[1]; the other reads Health[0]. Both then credit the same win.
 *
 * That asymmetry is the whole function. A port that picks one index for both
 * sides gives one player every multiplayer achievement and the other none, and
 * it would look correct in single-player testing because GameMode gates it.
 */
void updateMPWins(void)
{
    if (GameMode != 1)
        return;

    if (isParentBasedOnSpeed()) {
        if (Health[1] != 0)
            return;
    } else {
        if (Health[0] != 0)
            return;
    }
    achievementsIncreaseMatchesWon();
}


extern int    LoadedBGExtents;          /* 0x0015108c */
extern int    CurrentTask;              /* 0x00150590 */
extern void (*TaskFunctionList[])(void);/* 0x0017d940 */
void LoadBGExtents(void);
void limeBegin(void);
void limeFinish(void);
void limeStartLoadingAnim(void);
void limeStopLoadingAnim(void);
void heartbeatUpdate(void);
void glDisable(unsigned cap);


/* -------------------------------------------------------- LIME_KillAllLights
 *
 * armv7 0x00023c24, 88 bytes.  **Complete.**
 *
 * Ten glDisable calls and nothing else: GL_LIGHTING (0xb50), all eight lights
 * GL_LIGHT0..GL_LIGHT7 (0x4000..0x4007), and GL_COLOR_MATERIAL (0xb57).
 *
 * **All eight lights are disabled explicitly**, not in a loop, though the enum
 * values are consecutive and a loop would have been equivalent. Worth noting
 * for a GL ES 2 port: none of this exists there, and the whole function becomes
 * a no-op rather than something to translate.
 */
void LIME_KillAllLights(void)
{
    glDisable(0x0b50);                  /* GL_LIGHTING */
    glDisable(0x4000);                  /* GL_LIGHT0 */
    glDisable(0x4001);
    glDisable(0x4002);
    glDisable(0x4003);
    glDisable(0x4004);
    glDisable(0x4005);
    glDisable(0x4006);
    glDisable(0x4007);                  /* GL_LIGHT7 */
    glDisable(0x0b57);                  /* GL_COLOR_MATERIAL */
}


/* -------------------------------------------------------------- GameCodeMain
 *
 * armv7 0x000232bc, 88 bytes.  **Complete. This is the frame.**
 *
 *      if (!LoadedBGExtents) { LoadBGExtents(); LoadedBGExtents = 1; }
 *      limeBegin()
 *      if (CurrentTask == 8) limeStartLoadingAnim()
 *      else                  limeStopLoadingAnim()
 *      TaskFunctionList[CurrentTask]()
 *      limeFinish()
 *      heartbeatUpdate()
 *
 * The whole game is one indirect call through a task table, and **task 8 is the
 * loading screen** -- the only index that gets the spinner started rather than
 * stopped, and the stop runs on every other frame whether or not one is
 * showing.
 *
 * The lazy LoadBGExtents happens INSIDE the frame rather than at init, and the
 * flag is set after the call, so a LoadBGExtents that failed would retry every
 * frame.
 */
void GameCodeMain(void)
{
    if (LoadedBGExtents == 0) {
        LoadBGExtents();
        LoadedBGExtents = 1;
    }

    limeBegin();

    if (CurrentTask == 8)
        limeStartLoadingAnim();         /* task 8 is the loading screen */
    else
        limeStopLoadingAnim();

    TaskFunctionList[CurrentTask]();

    limeFinish();
    heartbeatUpdate();
}



extern int PLAYER1MODEL;                /* 0x0014e1b4 */
extern int LastDestiny;                 /* 0x0014e210 */


/* ------------------------------------------------------- SaveUnclaimedTreasure
 *
 * armv7 0x00023838, 78 bytes.  **Complete.**
 *
 * Three separate four-byte files rather than one record:
 *
 *      "unclaimedtreasure"              <- the argument
 *      "unclaimedtreasure_playedas"     <- _PLAYER1MODEL
 *      "unclaimedtreasure_lastdestiny"  <- _LastDestiny
 *
 * Each write spills its value to the same stack slot with a pre-indexed
 * `str r3, [r1, #-0x4]!` and hands limeWriteFile the address, so the four bytes
 * on disk are the raw int in the device's byte order.
 *
 * **Three files means three chances to be left half-written.** A port that
 * merges them into one record changes the recovery behaviour of a save that is
 * interrupted, which is exactly the kind of thing this data exists to survive.
 */
void SaveUnclaimedTreasure(long treasure)
{
    long v;

    v = treasure;
    limeWriteFile("unclaimedtreasure", &v, 4, 0);

    v = PLAYER1MODEL;
    limeWriteFile("unclaimedtreasure_playedas", &v, 4, 0);

    v = LastDestiny;
    limeWriteFile("unclaimedtreasure_lastdestiny", &v, 4, 0);
}


#define LEVEL_INFO_STRIDE  0xf4
#define LEVEL_INFO_SLOTS   16
#define TOWER_TIERS        4
#define TOWER_PER_TIER     11

extern char  Level_Info[];              /* 0x0014e8d4 */
extern int   TowerData[];               /* the table Load_Tower fills */
void  limeFree(void *p);
void *limeLoadFile(const char *name);
void *limeLoadSaveFile(const char *name);


/* ------------------------------------------------------------- LoadBGExtents
 *
 * armv7 0x00023264, 76 bytes.  **Complete.**
 *
 * Reads BGEXTENTS.BIN and scatters eight words per level into `_Level_Info`,
 * from file offsets +4..+0x20 to entry offsets 0x24, 0x28, 0x58, 0x5c, 0x2c,
 * 0x30, 0x60 and 0x64 -- **not in order**, so the file's layout and the
 * struct's are different and the mapping is the whole content of this function.
 *
 * **It independently confirms two numbers from GetNextLevel.** The entry stride
 * is 0xf4 -- 244, which GetNextLevel builds out of shifts -- and the walk stops
 * at Level_Info + 0xf40, which is 16 entries. Two functions in different files,
 * neither citing the other.
 *
 * The source cursor advances with a pre-indexed `ldr r2, [r3, #0x20]!`, so the
 * file record is 0x20 bytes and its first word is never read.
 *
 * A missing file is silent: `cbz r0` returns without touching Level_Info, so
 * whatever it already held stays.
 */
void LoadBGExtents(void)
{
    const long *src = (const long *)limeLoadFile("BGEXTENTS.BIN");
    int i;

    if (src == 0)
        return;                         /* silent: Level_Info keeps its values */

    for (i = 0; i < LEVEL_INFO_SLOTS; i++) {
        long *e = (long *)(Level_Info + (long)i * LEVEL_INFO_STRIDE);

        e[0x24 / 4] = src[1];
        e[0x28 / 4] = src[2];
        e[0x58 / 4] = src[3];
        e[0x5c / 4] = src[4];
        e[0x2c / 4] = src[5];
        e[0x30 / 4] = src[6];
        e[0x60 / 4] = src[7];
        e[0x64 / 4] = src[8];
        src += 0x20 / 4;                /* the record, first word unread */
    }
    limeFree((void *)src);
}


/* ----------------------------------------------------------------- Load_Tower
 *
 * armv7 0x00023314, 92 bytes.  **Complete.**
 *
 * Four tiers of eleven entries, read from "towerdata" and **clamped on the way
 * in**: anything below 0 or above 0x19 becomes 1, not 0 and not a rejection of
 * the file.
 *
 *      if (v < 0 || v > 25) v = 1
 *
 * So a corrupt save produces a playable tower rather than an empty one, and the
 * clamp is per entry -- one bad value does not discard the rest.
 *
 * The destination stride is 44 bytes per tier, built as `i*12 - i` shifted, and
 * the source advances 0x2c per tier, so the file and the table have the same
 * shape. A missing file leaves the table untouched.
 */
void Load_Tower(void)
{
    const long *src = (const long *)limeLoadSaveFile("towerdata");
    int tier, i;

    if (src == 0)
        return;

    for (tier = 0; tier < TOWER_TIERS; tier++) {
        for (i = 0; i < TOWER_PER_TIER; i++) {
            long v = src[i];

            if (v < 0 || v > 0x19)
                v = 1;                  /* clamped, not rejected */
            TowerData[tier * TOWER_PER_TIER + i] = (int)v;
        }
        src += 0x2c / 4;
    }
    limeFree((void *)src);
}


extern char Language[10];               /* 0x001ab980 */
int strcmp(const char *a, const char *b);


/* ------------------------------------------------------------ compareLanguages
 *
 * armv7 0x0002389c, 92 bytes.  **Complete.**
 *
 *      p = limeLoadSaveFile("previouslanguage")
 *      if (!p) {
 *          if (!write) return 1
 *          limeWriteFile("previouslanguage", Language, 10, 0)
 *          return 1
 *      }
 *      if (write) limeWriteFile("previouslanguage", Language, 10, 0)
 *      r = strcmp(p, Language)
 *      limeFree(p)
 *      return r != 0
 *
 * **No previous file means "changed", not "unknown".** Both no-file paths
 * return 1, so a first run behaves as if the language had just been switched --
 * which is what makes whatever depends on this rebuild its text on install.
 *
 * The write is 10 bytes, a literal, so the language code is a fixed-width field
 * and not a C string of whatever length. `strcmp` still reads it as one.
 *
 * The argument only controls whether the current language is SAVED; the
 * comparison happens either way.
 */
int compareLanguages(int write)
{
    char *prev = (char *)limeLoadSaveFile("previouslanguage");
    int r;

    if (prev == 0) {
        if (write)
            limeWriteFile("previouslanguage", Language, 10, 0);
        return 1;                       /* no file: treat as changed */
    }

    if (write)
        limeWriteFile("previouslanguage", Language, 10, 0);

    r = strcmp(prev, Language);
    limeFree(prev);
    return r != 0;
}


/* ---------------------------------------------------- CheckForUnclaimedTreasure
 *
 * armv7 0x0002337c, 104 bytes.  **Complete.**
 *
 *      p = load("unclaimedtreasure")
 *      if (!p) return 0
 *      v = *p
 *      if (v == 0) { free(p); return 0 }
 *      free(p)
 *      p = load("unclaimedtreasure_playedas")
 *      if (p) { PLAYER1MODEL = *p; free(p) }
 *      p = load("unclaimedtreasure_lastdestiny")
 *      if (p) { LastDestiny = *p; free(p) }
 *      return 1
 *
 * The reader for the three files SaveUnclaimedTreasure writes, and it treats
 * them as three independent facts rather than one record: **a missing companion
 * file is not a failure**, and the two branches that hit one write the loaded
 * pointer's own value into LastDestiny before returning -- which on the
 * not-found path is NULL, so LastDestiny becomes 0 and the function still
 * returns 1.
 *
 * That is transcribed as written. Storing a null pointer as a destiny index
 * looks like a bug and behaves as "destiny 0"; the alternative reading, that
 * the register happened to be zero and the store is deliberate, is the same
 * thing at runtime. Either way a port must not "fix" it into leaving
 * LastDestiny alone, because 0 is what the original leaves behind.
 *
 * A treasure value of zero is "nothing to claim" and returns 0 without reading
 * the other two files at all.
 */
int CheckForUnclaimedTreasure(void)
{
    long *p = (long *)limeLoadSaveFile("unclaimedtreasure");
    long treasure;

    if (p == 0)
        return 0;

    treasure = *p;
    if (treasure == 0) {
        limeFree(p);
        return 0;                       /* zero means nothing pending */
    }
    limeFree(p);

    p = (long *)limeLoadSaveFile("unclaimedtreasure_playedas");
    if (p) {
        PLAYER1MODEL = (int)*p;
        limeFree(p);
    } else {
        LastDestiny = 0;                /* the not-found path stores the NULL */
        return 1;
    }

    p = (long *)limeLoadSaveFile("unclaimedtreasure_lastdestiny");
    if (p) {
        LastDestiny = (int)*p;
        limeFree(p);
    } else {
        LastDestiny = 0;
    }
    return 1;
}


extern float Camera[3];                 /* 0x0014fa74 = (0.0, -600.0, 146.0) */
extern int   ClearedZBuffer;            /* 0x001f44c8 */
extern int  *LevelSelectPtr;            /* pointer slot -> 0x000ff7f8 */
void LIMEDS_Set3dMode(void);
void SetToUseCamera(const float *eye);
void RenderLevelBG(void);
void RenderLevelPlayers(void);
void LIME_RenderEvents(long pass);
void MaintainParticles(void);
void KillIllegalWhirlwinds(void);
void RenderExtras(void);
void limeClearDepthBuffer(void);


/* ------------------------------------------------------------- RenderGameView
 *
 * armv7 0x000260d4, 140 bytes.  **Complete. This is the frame's 3D half.**
 *
 *      LIMEDS_Set3dMode()
 *      eye = Camera + ShakeOffset            <- componentwise, all three
 *      SetToUseCamera(eye)
 *      RenderLevelBG()
 *      LIME_RenderEvents(0)                  <- pass 0
 *      ClearedZBuffer = 0
 *      RenderLevelPlayers()
 *      if (ClearedZBuffer && LevelSelect == 2) limeClearDepthBuffer()
 *      LIME_RenderEvents(1)                  <- pass 1
 *      MaintainParticles()
 *      KillIllegalWhirlwinds()
 *      RenderExtras()
 *
 * **The screen shake is added to the camera here and nowhere else.**
 * CalcShakeOffset writes only the z component and zeroes x and y, and this adds
 * all three, so the shake moves the eye along z -- toward and away from the
 * fight -- rather than jittering it sideways.
 *
 * `_Camera` is (0.0, -600.0, 146.0) and `_CameraLookAt` is the origin, which is
 * what this port measured independently from a capture of the game running:
 * an eye height of 136 to 143 against the 146 the binary carries.
 *
 * **LIME_RenderEvents runs twice, with 0 and then 1** -- the same two-pass
 * argument decomp/lime/Events.c documents, opaque then translucent, and the
 * players are drawn BETWEEN them.
 *
 * `_ClearedZBuffer` is cleared before the players and tested after, so
 * RenderLevelPlayers sets it. Combined with LevelSelect == 2 it triggers a
 * depth clear before the second event pass -- a character drawn on top of the
 * arena regardless of depth, which is what a level-select preview needs.
 */
void RenderGameView(void)
{
    float eye[3];

    LIMEDS_Set3dMode();

    eye[0] = Camera[0] + ShakeOffset[0];
    eye[1] = Camera[1] + ShakeOffset[1];
    eye[2] = Camera[2] + ShakeOffset[2];    /* the shake is z-only */
    SetToUseCamera(eye);

    RenderLevelBG();
    LIME_RenderEvents(0);                   /* opaque pass */

    ClearedZBuffer = 0;
    RenderLevelPlayers();                   /* which may set it */

    if (ClearedZBuffer != 0 && *LevelSelectPtr == 2)
        limeClearDepthBuffer();

    LIME_RenderEvents(1);                   /* translucent pass */
    MaintainParticles();
    KillIllegalWhirlwinds();
    RenderExtras();
}


extern int Destiny;                     /* 0x0014e20c */
extern int GameStarted;                 /* 0x0014e208 */
extern int Stage;                       /* 0x0014e214 */


extern int *Character1Ptr;              /* slot -> 0x000ff988 */
extern int *ClassicSubZeroUnlockedPtr;  /* slot -> 0x000ff970 */
extern int *ErmacUnlockedPtr;           /* slot -> 0x000ff974 */
extern int *MileenaUnlockedPtr;         /* slot -> 0x000ff978 */
extern int *JadeUnlockedPtr;            /* slot -> 0x000ff97c */
extern int *SurvivalStagePtr;           /* slot -> 0x000ff980 */
extern int *TreasureGained;             /* slot -> 0x00101164, 10 words */
extern int *EndingsGained;              /* slot -> 0x00101088, 23 words */
extern int  winStreak;                  /* 0x0014e1a8 */
void Write_SaveData(void);


/* -------------------------------------------------------------- Reset_SaveData
 *
 * armv7 0x0002359c, 124 bytes.  **Complete.**
 *
 * Zeroes everything a save holds and writes it straight back out:
 *
 *      Destiny, GameStarted, Stage, Character1, winStreak, SurvivalStage
 *      ClassicSubZeroUnlocked, ErmacUnlocked, MileenaUnlocked, JadeUnlocked
 *      TreasureGained[0..9]        (loop to 0x28)
 *      EndingsGained[0..22]        (loop to 0x5c)
 *      Write_SaveData()
 *
 * **The four unlock flags are cleared too**, so this is a full wipe and not a
 * "start a new run" -- Classic Sub-Zero, Ermac, Mileena and Jade all go back to
 * locked. Anything that wants to reset progress without taking the roster away
 * needs a different function; this one does not have a partial mode.
 *
 * `Destiny` is set to 0 here, where FE_Task_Game_Over sets it to -1. Two
 * different "no destiny" values in the same codebase, and both are transcribed
 * as written -- FE_Task_Game_Over is ending a run, this is erasing one.
 *
 * The two arrays are 10 and 23 words, from the loop bounds 0x28 and 0x5c.
 */
void Reset_SaveData(void)
{
    int i;

    Destiny     = 0;                    /* 0 here, -1 in FE_Task_Game_Over */
    GameStarted = 0;
    Stage       = 0;

    *Character1Ptr = 0;
    *ClassicSubZeroUnlockedPtr = 0;     /* the unlocks go too */
    *ErmacUnlockedPtr          = 0;
    *MileenaUnlockedPtr        = 0;
    *JadeUnlockedPtr           = 0;

    winStreak         = 0;
    *SurvivalStagePtr = 0;

    for (i = 0; i < 0x28 / 4; i++)
        TreasureGained[i] = 0;
    for (i = 0; i < 0x5c / 4; i++)
        EndingsGained[i] = 0;

    Write_SaveData();
}


void Task_LoadingScreen_DRAWSCREEN(long a, long percent);


extern int   randomKode;                /* 0x00151084 */
extern int   DrawRandomKode;            /* 0x001f44cc */
extern int   TipToDisplay;              /* 0x001f44d0 */
extern int   NextTask;                  /* 0x0015058c */
void *limeLoadTexture(const char *name, long a, long b);
long  limeRand(void);
int   printf(const char *fmt, ...);


/* ---------------------------------------------------------- Task_LoadingScreen
 *
 * armv7 0x0001d4c4, 168 bytes.  **Complete.**
 *
 *      LoadingTexture = limeLoadTexture("FE_TITLE_LOADING.PNG", 0, 0)
 *      randomKode     = |limeRand()| % 20
 *      printf("RANDOM KODE IS %d\n", randomKode)
 *      DrawRandomKode = limeRand() & 1
 *      TipToDisplay   = |limeRand()| % 14
 *      Task_LoadingScreen_DRAWSCREEN(NextTask == 5 ? 1 : 0, 0)
 *      CurrentTask = NextTask
 *
 * **Three separate limeRand calls, and each is masked differently**: modulo 20
 * for the kode, one bit for whether to show it at all, modulo 14 for the tip.
 * Both moduli are reciprocal multiplies -- the %14 uses the same 0x92492493
 * getRandomLevel does, which is how you can tell they are the same idiom rather
 * than two different intents.
 *
 * The negation before each modulus is the same guard get_rsound and get_gsound
 * carry: a negative remainder would index backwards.
 *
 * **The loading screen's own art is a PNG.** `FE_TITLE_LOADING.PNG` -- one of
 * the 183 textures that exist only in that format, which is why this port needed
 * a PNG decoder before any of it could be seen.
 *
 * NextTask == 5 selects a different draw variant and is the only thing the
 * first argument carries.
 */
void Task_LoadingScreen(void)
{
    long r;

    LoadingTexture = limeLoadTexture("FE_TITLE_LOADING.PNG", 0, 0);

    r = limeRand();
    if (r < 0) r = -r;
    randomKode = (int)(r % 20);
    printf("RANDOM KODE IS %d\n", randomKode);

    DrawRandomKode = (int)(limeRand() & 1);

    r = limeRand();
    if (r < 0) r = -r;
    TipToDisplay = (int)(r % 14);       /* the same 0x92492493 as getRandomLevel */

    Task_LoadingScreen_DRAWSCREEN(NextTask == 5 ? 1 : 0, 0);
    CurrentTask = NextTask;
}


#define FRAME_ID_MAX  0x1c4c            /* 7244 */

extern long FrameInfo2[][4];            /* 0x00129f1c, {x, y, w, h} */
extern long FrameInfo[][4];             /* 0x0010df1c, the fallback */


/* ------------------------------------------------------------ FrameID_GetBBox
 *
 * armv7 0x0001c674, 260 bytes.  **Complete, and it has three paths.**
 *
 * Normal: FrameInfo2[fid] is {x, y, w, h} at a 16-byte stride, and the outputs
 * are x, y, x+w and y+h -- each written only if its pointer is non-NULL, so a
 * caller can ask for any subset.
 *
 * **Fallback: if FrameInfo2[fid].h is zero it reads `_FrameInfo` instead**, a
 * second table at 0x0010df1c with the same shape. So there are two frame tables
 * and the second is consulted when the first has no height. That is not
 * mentioned anywhere else in this tree.
 *
 * **Out of range is not an error**: fid above 7244 zeroes all four outputs and
 * carries on. 7244 is one less than the 7,245 entries ClearAnimRemapTables
 * walks -- the two tables are the same length, established from opposite ends.
 *
 * **fid == -1 means "the camera", not a frame.** It builds a box from
 * `_Camera` and `_WorldScaleAdjust` (64.0) with three literals -- 200, 196 and
 * 100:
 *
 *      cx = Camera[0] * 64
 *      *x0 = cx - 200         *x1 = cx + 200
 *      cy = -(Camera[2] * 64)
 *      *y0 = cy - 100 + 196   *y1 = cy + 100 + 196
 *
 * Note the vertical uses Camera[2], negated, where the horizontal uses
 * Camera[0] -- the Z-up world reaching the 2D box -- and that the 196 is added
 * to BOTH edges while the 100 is the half-height. So the box is 400 by 200,
 * centred horizontally on the camera and offset 196 vertically.
 *
 * The -1 path writes all four unconditionally, unlike the normal one.
 */
void FrameID_GetBBox(long fid, long *x0, long *y0, long *x1, long *y1)
{
    long x = 0, y = 0, w = 0, h = 0;

    if (fid <= FRAME_ID_MAX) {
        if (FrameInfo2[fid][3] != 0) {
            x = FrameInfo2[fid][0];
            y = FrameInfo2[fid][1];
            w = FrameInfo2[fid][2];
            h = FrameInfo2[fid][3];
        } else {
            x = FrameInfo[fid][0];      /* the second table */
            y = FrameInfo[fid][1];
            w = FrameInfo[fid][2];
            h = FrameInfo[fid][3];
        }
    }

    if (x0) *x0 = x;
    if (y0) *y0 = y;
    if (x1) *x1 = x + w;
    if (y1) *y1 = y + h;

    if (fid != -1)
        return;

    {   /* -1 is the camera, and every output is written */
        float cx = Camera[0] * WorldScaleAdjust;
        float cy = -(Camera[2] * WorldScaleAdjust);

        *x0 = (long)(cx - 200.0f);
        *x1 = (long)(cx + 200.0f);
        *y0 = (long)(cy - 100.0f + 196.0f);
        *y1 = (long)(cy + 100.0f + 196.0f);
    }
}


int  puts(const char *s);
int  putchar(int c);


/* -------------------------------------------------------------------- dumpMem
 *
 * armv7 0x0002b8dc, 100 bytes.  **Complete.**
 *
 * A debug hex dump, banner above and below:
 *
 *      ################################################
 *      %04x %04x %04x ...
 *      \n################################################
 *
 * **The bytes are read SIGNED** -- `ldrsb`, then passed to a `%04x`. So a byte
 * above 0x7f prints as `ffffffb2`, eight characters wide, not `00b2`. The
 * columns stop lining up exactly where the data stops being ASCII, which for a
 * dump of raw memory is most of it.
 *
 * That is transcribed rather than corrected. It is a debug function that
 * shipped in the retail binary, the misalignment is what its author saw, and
 * anyone reading a dump produced by a "fixed" version against one in an old bug
 * report would be comparing two different things.
 *
 * The trailing newline is only emitted when the last byte fills a row, so a
 * dump whose length is not a multiple of `perline` runs its closing banner onto
 * the same line as the last row.
 */
void dumpMem(char *p, int len, int perline)
{
    int i, col;

    puts("################################################");

    for (i = 0, col = 0; i < len; ) {
        printf("%04x ", (int)*(signed char *)p);
        p++;
        i++;
        col++;
        if (col >= perline) {
            putchar(10);                /* \n */
            col = 0;
        }
    }

    puts("\n################################################");
}


extern float FE_Fade;                   /* 0x00100898 */
extern int   limeScreenWidth;           /* 0x00171aec */
extern int   limeScreenHeight;          /* 0x00171af0 */

void limeEnableAlphaBlending_Basic(void);
void limeSet2DDrawing(void);
void limeFillRect(float x, float y, float w, float h,
                  float r, float g, float b, float a);


/* --------------------------------------------------------- IntroRender2dBits
 *
 * armv7 0x0001d7cc, 120 bytes.  **Complete.**
 *
 * The intro fade overlay, and that is all it is: a full-screen black quad at
 * alpha `1 - FE_Fade`, drawn in 2D with basic alpha blending.
 *
 *      if (FE_Fade == 1.0f) return         <- fully faded in, nothing to darken
 *      limeFillRect(0, 0, w, h, 0, 0, 0, 1 - FE_Fade)
 *
 * The early-out and the subtraction agree with each other: at FE_Fade == 1 the
 * alpha would be zero, so the test is not an approximation of "close enough",
 * it is the exact point where the quad stops mattering.
 *
 * `_limeScreenWidth` and `_limeScreenHeight` are ints and are converted with
 * `vcvt.f32.s32` at the call. The name "2dBits" suggests more than one overlay;
 * there is only this one.
 */
void IntroRender2dBits(void)
{
    limeEnableAlphaBlending_Basic();
    limeSet2DDrawing();

    if (FE_Fade == 1.0f)
        return;

    limeFillRect(0.0f, 0.0f,
                 (float)limeScreenWidth, (float)limeScreenHeight,
                 0.0f, 0.0f, 0.0f, 1.0f - FE_Fade);
}


/* `_Mk3Obj_t` -- the arcade object record. Only the four fields this function
 * reads are established here, all of them 16-bit:
 *
 *      +0x04  int16   x in arcade units
 *      +0x06  int16   y in arcade units, sign INVERTED on the way out
 *      +0x08  int16   frame id, signed
 *      +0x0a  uint16  flags, bit 4 tested
 */
typedef struct Mk3Obj_t Mk3Obj_t;

/* `_FrameRemapTable` 0x002003d4, eight bytes an entry, first word used.
 * `_PlayerDefs` 0x00170950, **52 bytes** an entry -- the compiler spells the
 * multiply out as `(n*16 - n*4 + n) << 2`, which is 13 << 2. */
extern long  *FrameRemapTable;          /* pointer slot -> 0x002003d4 */
extern char  *PlayerDefs;               /* pointer slot -> 0x00170950 */
/* Moved with `ldr`/`str`, never through the FPU, so it is declared as the word
 * it is copied as. See the note in the function below. */
extern union { float f; long w; } PlayerZPos;   /* 0x00150e88 */

#define PLAYERDEF_STRIDE  52


/* ------------------------------------------------- ArcadePosTo3dPosNO_OFFSETS
 *
 * armv7 0x0001c594, 140 bytes.  **Complete.**
 *
 * Arcade coordinates to a world position, without the per-object offsets the
 * 304-byte `ArcadePosTo3dPos` applies:
 *
 *      out->x = (float)obj->x / WorldScaleAdjust
 *      out->y = PlayerZPos                          <- copied as a raw word
 *      out->z = -(float)obj->y / WorldScaleAdjust
 *               + PlayerDefs[remap].height
 *
 * **The arcade Y is negated and lands in Z.** The arcade runs Y down the
 * screen; the engine runs Z up the world. That sign is the whole conversion and
 * it is the easiest thing here to lose.
 *
 * `PlayerZPos` is moved with `ldr`/`str`, not through the FPU -- the bit
 * pattern is copied, so a signalling NaN would survive it intact. Transcribed
 * as a word copy for that reason.
 *
 * The player-def index comes from `FrameRemapTable[obj->frame]`, and the frame
 * id is read SIGNED (`ldrsh`), so a negative frame indexes backwards off the
 * front of the table. Nothing guards it.
 *
 * ### The branch that does not branch
 *
 * `obj->flags & 0x10` selects between two literal-pool entries -- and **both
 * resolve to `_WorldScaleAdjust` at 0x0014df9c**, checked by hand rather than
 * trusted from the tool. The neighbours are `_blast_player_height` at
 * 0x0014df98 and `_psp_scale` at 0x0014dfa0, so there is no second symbol
 * hiding at that address.
 *
 * So the test is vestigial: whichever way it goes, the divisor is the same.
 * It is transcribed as the single divisor it really is, with the flag noted
 * here, because writing an `if` whose arms are identical would be inventing a
 * distinction the machine does not make.
 *
 * **Why it is there is now known.** `ArcadePosTo3dPos` below is the same
 * function with the player offsets kept, and there the very same
 * `flags & 0x10` chooses the SIGN of the X offset -- subtract when set, add
 * when clear. Drop the offset term and the test has nothing left to select.
 * The dead branch here is the scar of that function, not a compiler artefact.
 */
void ArcadePosTo3dPosNO_OFFSETS(Mk3Obj_t *obj, float *out)
{
    const short *o = (const short *)obj;
    long remap = FrameRemapTable[o[4] * 2];         /* [frame], stride 8 */
    const float *def;

    /* o[2] is +4, o[3] is +6, o[4] is +8 -- all int16. */
    out[0] = (float)o[2] / WorldScaleAdjust;
    ((long *)out)[1] = PlayerZPos.w;    /* word copy, not a float load */

    def = (const float *)(PlayerDefs + remap * PLAYERDEF_STRIDE);
    out[2] = (float)(-o[3]) / WorldScaleAdjust + def[0x0c / 4];
}


extern int  limeScreenWidthI;           /* alias comment only -- see below */
extern long col[];                      /* 0x0014fa00 */

void limeDrawSprite(TEXTURE *tex, float x, float y, float w, float h,
                    float u0, float v0, float u1, float v1, long *colour);


/* ------------------------------------------------------ drawLoadingBackground
 *
 * armv7 0x0001c824, 152 bytes.  **Complete.**
 *
 * The loading screen backdrop, drawn full-screen from `_LoadingTexture`:
 *
 *      limeDrawSprite(tex, 0, 0, screenW, screenH, 0, 0, 1.0f, 0.75f, col)
 *
 * **`v1` is 0.75, not 1.0.** The texture is sampled to three quarters of its
 * height, which is what a 1024x768 image sitting in a 1024x1024 texture needs.
 * A port that stretches the whole texture gets the picture squashed and a
 * quarter of blank space at the bottom, and it will look almost right.
 *
 * ### It reloads its own texture
 *
 * If `_LoadingTexture` is NULL it prints `reloading texture...` and calls
 * `limeLoadTexture("FE_TITLE_LOADING.PNG", 0, 0)` itself, stores the result,
 * and falls back into the draw. Task_LoadingScreen above loads the same file --
 * so this is a second, defensive load for the case where the texture was freed
 * underneath the loading screen. If that load fails too it draws nothing and
 * returns; it does not loop.
 *
 * The guard before the draw is `tex[0x40] != 0`, a field of TEXTURE this tree
 * has not otherwise named -- a loaded texture with that word clear is skipped.
 */
void drawLoadingBackground(void)
{
    TEXTURE *tex = LoadingTexture;

    if (tex == 0) {
        puts("reloading texture...");
        tex = (TEXTURE *)limeLoadTexture("FE_TITLE_LOADING.PNG", 0, 0);
        LoadingTexture = tex;
        if (tex == 0)
            return;
    }

    if (((const long *)tex)[0x40 / 4] == 0)
        return;

    limeDrawSprite(tex, 0.0f, 0.0f,
                   (float)limeScreenWidth, (float)limeScreenHeight,
                   0.0f, 0.0f, 1.0f, 0.75f, col);
}


/* `_ButtonsTPage` -- 0x001f40d8, a pointer slot to the button atlas texture.
 * Eight buttons across: the U extent below is exactly 1/8. */
extern TEXTURE **ButtonsTPage;

int FE_X(float x);
int FE_Y(float y);
int FE_W(float w);
int FE_H(float h);


/* --------------------------------------------------------- drawSingleButton
 *
 * armv7 0x0001e09c, 152 bytes.  **Complete.**
 *
 * One 64x64 button from the atlas, positioned through the front-end scalers:
 *
 *      limeDrawSprite(*ButtonsTPage,
 *                     FE_X(x), FE_Y(y), FE_W(64), FE_H(64),
 *                     0.0f, 0.5f, 0.125f, 0.25f, colour)
 *
 * **The V pair runs backwards: v0 is 0.5 and v1 is 0.25.** That is not a
 * transcription slip -- 0.5 is loaded into the sp+8 slot and 0.25 into sp+0x10,
 * the same slots that hold 0 and 0.75 in drawLoadingBackground. The sprite is
 * sampled bottom-to-top, so a port that normalises the pair draws every button
 * upside down.
 *
 * U runs 0 to 0.125, one eighth, which is where the eight-across atlas comes
 * from.
 *
 * The colour is a five-word local: four 1.0f copied from the function own
 * static constant, then `tint` written over the fifth. So the caller controls
 * only that last word and the RGBA above it is always white.
 */
void drawSingleButton(int x, int y, long tint)
{
    /* Four floats then one raw word -- the fifth slot is written with `str`,
     * never as a float, so the union keeps that honest. */
    union { float f; long w; } colour[5];

    colour[0].f = 1.0f;                 /* __ZZ16drawSingleButtonE5C.105 */
    colour[1].f = 1.0f;
    colour[2].f = 1.0f;
    colour[3].f = 1.0f;
    colour[4].w = tint;

    limeDrawSprite(*ButtonsTPage,
                   (float)FE_X((float)x), (float)FE_Y((float)y),
                   (float)FE_W(64.0f),    (float)FE_H(64.0f),
                   0.0f, 0.5f, 0.125f, 0.25f, &colour[0].w);
}


extern float TestScale;                 /* 0x0014e268 */
extern float RenderMeshAlphaOverRide;   /* 0x0014e238 */

typedef struct limeVECTOR3  limeVECTOR3;
typedef struct limeMATRIX44 limeMATRIX44;
typedef struct MESHSETINFO  MESHSETINFO;

void LIMEDS_SetObjectOrientation(limeMATRIX44 *m, limeVECTOR3 *pos);
void LIME_RenderMesh(MESHSETINFO *ms, long n, TEXTURE *t0, TEXTURE *t1,
                     long flags);
void glPushMatrix(void);
void glPopMatrix(void);
void glScalef(float x, float y, float z);
void glEnable(unsigned int cap);
void glCullFace(unsigned int mode);
void glColor4f(float r, float g, float b, float a);

#define GL_FRONT      0x0404
#define GL_BACK       0x0405
#define GL_CULL_FACE  0x0B44


/* ----------------------------------------------------------------- RenderAMesh
 *
 * armv7 0x000250c4, 164 bytes.  **Complete.**
 *
 * The generic one-mesh draw, and the two things in it worth carrying across are
 * both about mirroring and both easy to get wrong:
 *
 *      flip == 0:  glScalef( TestScale, TestScale, TestScale)
 *                  glCullFace(GL_BACK)
 *
 *      flip != 0:  glScalef(-TestScale, TestScale, TestScale)
 *                  glCullFace(GL_FRONT)
 *
 * **A negative X scale reverses triangle winding, so the cull face has to flip
 * with it.** The game does exactly that, and it does it by culling the FRONT
 * face rather than by reordering anything. A port that mirrors the matrix and
 * leaves the cull alone loses every front-facing triangle of the mirrored
 * fighter and keeps the back ones -- which looks like the model turning inside
 * out, not like a missing flag.
 *
 * The negation is `eor r0, r1, #0x80000000`, the sign bit flipped in the
 * integer domain, so it is exact for every value including zero.
 *
 * **`glCullFace(GL_BACK)` is issued again on the way out, unconditionally.** So
 * the flipped state never leaks to the next draw, and nothing else has to
 * remember to restore it. Both `glPushMatrix` calls are matched by pops.
 *
 * The colour is white with alpha from `_RenderMeshAlphaOverRide` -- a global,
 * not an argument, so every mesh drawn through here shares one fade value.
 *
 * The two int arguments in r0 and r1 are never read.
 */
void RenderAMesh(int unused0, int unused1, limeVECTOR3 *pos, limeMATRIX44 *m,
                 int flip, TEXTURE *t0, TEXTURE *t1, MESHSETINFO *ms, long n)
{
    (void)unused0;
    (void)unused1;

    glPushMatrix();

    if (flip) {
        glScalef(-TestScale, TestScale, TestScale);
        glEnable(GL_CULL_FACE);
        glCullFace(GL_FRONT);           /* the winding is reversed */
    } else {
        glScalef(TestScale, TestScale, TestScale);
        glEnable(GL_CULL_FACE);
        glCullFace(GL_BACK);
    }

    LIMEDS_SetObjectOrientation(m, pos);
    glColor4f(1.0f, 1.0f, 1.0f, RenderMeshAlphaOverRide);

    glPushMatrix();
    LIME_RenderMesh(ms, n, t0, t1, 0);
    glPopMatrix();

    glPopMatrix();
    glCullFace(GL_BACK);                /* always restored */
}


/* The joystick bit alphabet, as far as this function establishes it:
 *
 *      0x0004  left            0x0800  "toward the opponent"
 *      0x0008  right           0x1000  "away from the opponent"
 *      0x0080  a button, tested against the PREVIOUS frame
 *      0x2000  set while IsInFinishing and the caller flag is set
 *
 * 0x800 and 0x1000 are FACING-RELATIVE and 4 and 8 are absolute. Translating
 * between the two is what the tail of this function does. */
#define JOY_LEFT     0x0004
#define JOY_RIGHT    0x0008
#define JOY_TOWARD   0x0800
#define JOY_AWAY     0x1000
#define JOY_FINISH   0x2000

typedef struct MKMOVE {
    long unused;                        /* 0x00 */
    long mask;                          /* 0x04  the bit pattern to match */
    long index;                         /* 0x08  into _VeteranMoves */
} MKMOVE;

#define MKMOVE_SLOTS  0x4c              /* 76 */

extern MKMOVE VeteranMoves[];           /* 0x0015059c, also 12 bytes an entry */
extern long   LastJoyBitsIn;            /* 0x00150cc0 */
/* `IsInFinishing` and `RemapKicksPunches` are declared above. */


/* --------------------------------------------------------- GetArcadeJoyBits
 *
 * armv7 0x0001b7a4, 272 bytes.  **Complete.**
 *
 * Matches the current joystick state against a 76-entry move table and returns
 * the arcade bit pattern for whatever it found.
 *
 * ### Facing-relative directions are converted on the way OUT, not in
 *
 * The table stores `JOY_TOWARD` / `JOY_AWAY`; the game wants `JOY_LEFT` /
 * `JOY_RIGHT`. The tail does the swap and it is a genuine mirror:
 *
 *      facing != 0:   AWAY -> RIGHT,  TOWARD -> LEFT
 *      facing == 0:   AWAY -> LEFT,   TOWARD -> RIGHT
 *
 * then clears both relative bits. **Both arms then re-test `0x800` on the
 * value they are building, not on the original** -- so a pattern holding both
 * TOWARD and AWAY comes out with both LEFT and RIGHT set rather than one.
 * Transcribed as written; it is reachable only from a table entry that sets
 * both, and whether any does is not established here.
 *
 * ### The 0x80 button is edge-detected against the previous frame
 *
 * `_LastJoyBitsIn` is read and immediately overwritten with this frame's bits,
 * and the match then uses `~previous & current & 0x80` -- the rising edge, not
 * the level. Only entries whose mask has a relative direction bit take that
 * path; the rest compare the raw bits with `0x1800` masked off.
 *
 * That edge is why `_LastJoyBitsIn` must be updated **once per call and before
 * anything else**: a port that refreshes it after the scan, or twice, changes
 * which frame a button counts on.
 *
 * ### An assertion that hangs
 *
 * On a match it looks the move up in `_VeteranMoves` and checks the entry
 * agrees with its own index:
 *
 *      if (VeteranMoves[idx].index != idx) for (;;) ;
 *
 * A branch to its own address, the same shape `Error()` uses. It shipped in
 * retail, so it is a table-consistency assertion nobody expected to fire. A
 * port should make it loud rather than silent -- but it must not be dropped,
 * because reaching it means the move tables are wrong.
 *
 * `0xcf` in a mask is a sentinel: it ends the scan with a tail call to
 * `RemapKicksPunches` on the accumulated bits instead of a table lookup.
 * Falling off the end of the 76 entries returns 0.
 */
long GetArcadeJoyBits(long bits, MKMOVE *moves, long facing, long finishFlag)
{
    long prev = LastJoyBitsIn;
    long notPrev;
    long inFinish;
    long cur, probe, out, idx, mask;
    long i;

    LastJoyBitsIn = bits;               /* before anything else */
    notPrev = ~prev;
    inFinish = IsInFinishing ? ((finishFlag != 0) ? 1 : 0) : 0;

    cur = bits;

    for (i = 0; i < MKMOVE_SLOTS; i++, moves++) {
        out = inFinish ? (cur | JOY_FINISH) : cur;
        mask = moves->mask;

        if ((mask & (JOY_TOWARD | JOY_AWAY)) == 0) {
            probe = cur & ~(JOY_TOWARD | JOY_AWAY);
        } else {
            probe = cur & ~(JOY_LEFT | JOY_RIGHT);
            if (cur & JOY_TOWARD) {
                long edge = notPrev & 0x80 & bits;   /* the rising edge */
                probe = (cur & ~0x8c) | edge;
                cur   = (cur & ~0x80) | edge;
            }
        }

        if (probe == mask || cur == mask)
            break;                      /* matched */

        if (mask == 0xcf)
            return RemapKicksPunches(out);

        cur = bits;
    }

    if (i == MKMOVE_SLOTS)
        return 0;

    idx = moves->index;
    if (VeteranMoves[idx].index != idx)
        for (;;)                        /* b to its own address */
            ;

    mask = VeteranMoves[idx].mask;
    if ((mask & (JOY_TOWARD | JOY_AWAY)) == 0)
        return mask;

    probe = mask & ~(JOY_LEFT | JOY_RIGHT);

    if (facing != 0) {
        if (mask  & JOY_AWAY)   probe |= JOY_RIGHT;
        if (probe & JOY_TOWARD) probe |= JOY_LEFT;
    } else {
        if (mask  & JOY_AWAY)   probe |= JOY_LEFT;
        if (probe & JOY_TOWARD) probe |= JOY_RIGHT;
    }

    return probe & ~(JOY_TOWARD | JOY_AWAY);
}


#define ARCADE_POS_RAW  0x4e20          /* 20000 -- the "no offsets at all" frame */


/* ---------------------------------------------------------- ArcadePosTo3dPos
 *
 * armv7 0x0001c464, 304 bytes.  **Complete.**
 *
 * The full version of the conversion `ArcadePosTo3dPosNO_OFFSETS` does without
 * the player offsets. Same core arithmetic:
 *
 *      out->x = obj->x / WorldScaleAdjust  -/+ def->xOffset
 *      out->y = PlayerZPos
 *      out->z = -obj->y / WorldScaleAdjust  +  def->height
 *
 * ### The flag bit that was vestigial there is load-bearing here
 *
 * `obj->flags & 0x10` chooses the SIGN of the X offset -- subtract when set,
 * add when clear -- and nothing else differs between the two arms. In
 * `NO_OFFSETS` the same test survives with both arms resolving to the same
 * literal-pool entry, which read as a branch that does not branch.
 *
 * Together they explain each other: the two functions share a shape, the
 * offset term was dropped from the NO_OFFSETS variant, and the test that
 * selected its sign was left behind with nothing to select. So the dead branch
 * there is not a compiler artefact -- it is the scar of this function.
 *
 * ### Three ways to reach a PLAYERDEF, and a sentinel
 *
 *      frame == 20000        no def at all: raw divide, no offsets, no height
 *      third argument NULL   def = PlayerDefs[FrameRemapTable[frame]]
 *      otherwise             def = PlayerDefs[*(signed char *)arg]
 *
 * The third argument is a pointer to a single SIGNED byte holding a character
 * index -- not the index itself. A negative byte indexes backwards off the
 * front of the table, and nothing guards it.
 *
 * **A frame above 7243 returns without writing anything**, leaving the caller
 * vector holding whatever it did before. Note 7243, one below the 7244 that
 * bounds `LoadAllFramesTXT` and one below the `> 7244` that `FrameID_GetBBox`
 * rejects on -- three related limits, three different numbers. They are
 * recorded as they are rather than reconciled.
 *
 * `PlayerZPos` is copied as a word here too, never through the FPU.
 */
void ArcadePosTo3dPos(Mk3Obj_t *obj, float *out, const signed char *who)
{
    const short *o = (const short *)obj;
    long frame = o[4];                          /* +8, signed */
    float s = WorldScaleAdjust;
    const float *def;
    long idx;

    if (frame == ARCADE_POS_RAW) {              /* the sentinel: no offsets */
        out[0] = (float)o[2] / s;
        ((long *)out)[1] = PlayerZPos.w;
        out[2] = (float)(-o[3]) / s;
        return;
    }

    if (frame > 0x1c4b)                         /* 7243 -- nothing is written */
        return;

    if (who == 0)
        idx = FrameRemapTable[frame * 2];       /* stride 8, first word */
    else
        idx = *who;                             /* a signed byte, not an index arg */

    def = (const float *)(PlayerDefs + idx * PLAYERDEF_STRIDE);

    if (((const unsigned short *)obj)[5] & 0x10)        /* +0x0a */
        out[0] = (float)o[2] / s - def[0x08 / 4];
    else
        out[0] = (float)o[2] / s + def[0x08 / 4];

    ((long *)out)[1] = PlayerZPos.w;
    out[2] = (float)(-o[3]) / s + def[0x0c / 4];
}


extern long **IntroLists;               /* 0x0014e008 */
extern long  *SizeofIntroLists;         /* 0x0014e070 */
extern float  IntroCount;               /* 0x0014e1c4 */
extern float  IntroCount2;              /* 0x0014e1c8 */
extern long   IntroFrame1;              /* 0x0014f908 */
extern long   IntroFrame2;              /* 0x0014f90c */
extern long   AnimSmoothWindowSize;     /* 0x00171368 */
extern long   Character1;               /* 0x000ff988 */
extern long   Character2;               /* 0x000ff98c */
extern char   Players[];                /* 0x001fa4d4 */

void PlayerAutoSmoothAnims(void *p);


/* ------------------------------------------------ UpdateIntroCharacterPlayers
 *
 * armv7 0x00021970, 316 bytes.  **Complete.**
 *
 * Steps both fighters through their intro animation, one player at a time and
 * each from its own counter and its own list:
 *
 *      player 1:  IntroCount  -> IntroLists[Character1] -> IntroFrame1
 *      player 2:  IntroCount2 -> IntroLists[Character2] -> IntroFrame2
 *
 * Each half is skipped entirely if that player has no loaded character
 * (`+0x04` of the PLAYER, and `+0x5f4` for the second -- 0x5f0 plus the same
 * four, confirming the player stride from a third function).
 *
 * ### The frame is only overwritten when the list agrees
 *
 *      if (count < entries && list[count] != -1)
 *          IntroFrameN = list[count];
 *      player->frame = IntroFrameN;
 *
 * A count past the end of the list, or a -1 in it, leaves `IntroFrameN`
 * **holding its previous value** and the player is set to that. So the
 * animation freezes on its last good frame rather than snapping to zero or
 * reading past the array -- and the sticky global is what makes that work.
 * Clamping the index instead would look equivalent and is not: it would replay
 * the last entry rather than hold whatever was last accepted.
 *
 * The counters are floats converted with `vcvt.s32.f32`, so they advance
 * fractionally somewhere else and are truncated here.
 *
 * The entry count is `SizeofIntroLists[who] / 4` with the signed-division
 * rounding transcribed as emitted, the same shape `AnimateFECharacters` uses.
 *
 * ### The smoothing window is borrowed again, at a different value
 *
 * `_AnimSmoothWindowSize` is saved, set to **0x14** and restored -- twenty,
 * where `AnimateFECharacters` uses forty for the same global. So intros smooth
 * over half the window the menus do, and both leave the game's own value
 * untouched.
 */
void UpdateIntroCharacterPlayers(void)
{
    long saved = AnimSmoothWindowSize;
    long *p1 = (long *)Players;
    long *p2 = (long *)(Players + 0x5f0);

    AnimSmoothWindowSize = 0x14;        /* 20, not the 40 the front end uses */

    if (p1[1] != 0) {                   /* +0x04, a loaded character */
        long i = (long)IntroCount;
        const long *list = IntroLists[Character1];
        long n = SizeofIntroLists[Character1];

        if (n < 0)
            n += 3;
        n >>= 2;

        if (i < n && list[i] != -1)
            IntroFrame1 = list[i];      /* otherwise it keeps its old value */

        p1[0x14 / 4] = IntroFrame1;
        PlayerAutoSmoothAnims(p1);
    }

    if (p2[1] != 0) {                   /* +0x5f4 */
        long i = (long)IntroCount2;
        const long *list = IntroLists[Character2];
        long n = SizeofIntroLists[Character2];

        if (n < 0)
            n += 3;
        n >>= 2;

        if (i < n && list[i] != -1)
            IntroFrame2 = list[i];

        p2[0x14 / 4] = IntroFrame2;     /* Players + 0x604 */
        PlayerAutoSmoothAnims(p2);
    }

    AnimSmoothWindowSize = saved;
}


extern float IntroCountTimer;           /* 0x0014e1cc */
extern long  IntroCamCount;             /* 0x0014f940 */


/* ------------------------------------------ AnimateIntroCharacterPlayers1Frame
 *
 * armv7 0x00021aac, 368 bytes.  **Complete.**
 *
 * Steps one intro frame for each fighter, then calls
 * `UpdateIntroCharacterPlayers` to push the result into the players.
 *
 * ### Which fighter advances is decided by IntroCamCount
 *
 *      IntroCamCount == 0   ->  player 2 always;  player 1 only if `force`
 *      IntroCamCount != 0   ->  player 1 always;  player 2 only if `force`
 *
 * The two tests are built from the same `force != 0` boolean with an `orr #1`
 * on opposite arms, so exactly one fighter is unconditional at any moment and
 * the argument overrides that. The intro alternates whose animation runs by
 * flipping one counter.
 *
 * ### The counter is clamped UP, not down: only the last 120 entries play
 *
 * Per fighter:
 *
 *      count += 1.0f
 *      n = SizeofIntroLists[character]
 *      if (n == 0) { IntroCountTimer = 1.0f; }
 *      else {
 *          limit = n / 4 - 120
 *          if (count < limit) { count = limit; if (limit < 0) count = 0; }
 *          if (!force) IntroCountTimer += 1/120
 *      }
 *
 * `count < limit` sets `count = limit` -- forward, not back. So an intro whose
 * list is longer than 120 entries **never plays anything before its last 120**;
 * the counter is snapped past them on the first frame and increments normally
 * after that. A list shorter than 120 gives a negative limit and the counter is
 * reset to 0 instead.
 *
 * A clamp written the other way round -- the obvious reading -- makes long
 * intros play from the beginning and run 120 frames too long. This is the
 * detail in the function.
 *
 * ### The timer step is 1/120
 *
 * `0.008333333767950535`, the nearest float to 1/120, and only when `force` is
 * zero. So the timer tracks unforced frames only, and at 30 fps it reaches 1.0
 * after four seconds of them.
 *
 * The `n == 0` path sets the timer to a flat 1.0 and skips the counter work
 * entirely -- a character with no intro list is treated as already finished.
 */
void AnimateIntroCharacterPlayers1Frame(long force)
{
    long f = (force != 0) ? 1 : 0;
    long n;
    float limit;

    /* player 2 -- unconditional while IntroCamCount is zero */
    if ((IntroCamCount != 0) ? f : (f | 1)) {
        IntroCount2 += 1.0f;
        n = SizeofIntroLists[Character2];

        if (n == 0) {
            IntroCountTimer = 1.0f;
        } else {
            if (n < 0)
                n += 3;
            limit = (float)((n >> 2) - 0x78);       /* 120 */

            if (IntroCount2 < limit) {
                IntroCount2 = limit;                /* forward, not back */
                if (limit < 0.0f)
                    IntroCount2 = 0.0f;
            }
            if (!force)
                IntroCountTimer += 0.008333333767950535f;   /* 1/120 */
        }
    }

    /* player 1 -- unconditional while IntroCamCount is non-zero */
    if ((IntroCamCount == 0) ? f : (f | 1)) {
        IntroCount += 1.0f;
        n = SizeofIntroLists[Character1];

        if (n == 0) {
            IntroCountTimer = 1.0f;
        } else {
            if (n < 0)
                n += 3;
            limit = (float)((n >> 2) - 0x78);

            if (IntroCount < limit) {
                IntroCount = limit;
                if (limit < 0.0f)
                    IntroCount = 0.0f;
            }
            if (!force)
                IntroCountTimer += 0.008333333767950535f;
        }
    }

    UpdateIntroCharacterPlayers();
}


extern float JOUTERDIAL;                /* 0x00150598 */
extern float JINNERDIAL;                /* 0x00150594, read only here */
extern long  P2Controls;                /* 0x0014fec8 */
extern long  JoystickStatePosX;         /* 0x0014fec0 */
extern long  JoystickStatePosY;         /* 0x0014fec4 */
extern long  JoystickStatePosXP2;       /* 0x0014fed0 */
extern long  JoystickStatePosYP2;       /* 0x0014fed4 */

/* Ten touch slots each; -1.0f means the slot is empty. */
#define TOUCH_SLOTS  10
extern float *limeTouchScreenX;         /* pointer slot -> 0x00171af4 */
extern float *limeTouchScreenY;         /* pointer slot */

double acos(double x);
float  sqrtf(float x);


/* ------------------------------------------------------------- CheckLeftDial
 *
 * armv7 0x00026170, 384 bytes.  **Complete.**
 *
 * Reads the on-screen direction dial. Returns **0..7** for the eight-way
 * direction under the finger, or **-1** when no touch is on the dial.
 *
 * A touch counts only inside the ANNULUS between `JINNERDIAL` and
 * `JOUTERDIAL` -- squared distances are compared, so no square root is taken
 * until a slot has already passed both tests.
 *
 * ### The outer radius stops scaling under P2 controls
 *
 *      JOUTERDIAL = FE_W(80.0f);
 *      if (P2Controls) JOUTERDIAL = 96.0f;
 *
 * The default goes through `FE_W` and follows the screen; the P2 override is a
 * **raw 96 with no scaler anywhere near it**. On any screen where FE_W(80) is
 * not 96 the two players get different dial sizes. Transcribed as written --
 * it reads like a hardcoded pixel value someone dropped in, and reproducing it
 * is the only way a port behaves the same.
 *
 * It also writes the global every call rather than computing a local, so
 * anything else reading `JOUTERDIAL` sees whichever player was checked last.
 *
 * ### The angle
 *
 *      len = sqrt(dx*dx + dy*dy)
 *      t   = acos(dy / len) / PI          <- in [0, 1]
 *      if (dx / len < 0) t = -t           <- signed by the x half
 *      t   = (t + 1) * 0.5                <- back to [0, 1]
 *      if (t < 0) t += 1
 *      dir = (((int)((1 - t) * 256) + 16) & 0xFF) >> 5
 *
 * The `acos` is done in **double** precision -- `vcvt.f64.f32` in, the divide
 * by PI in `.f64`, and only then narrowed back. PI is the literal
 * 3.1415927410125732, the float value widened, not the double constant.
 *
 * The last line is the whole quantiser: scale to 256, add half a sector (16),
 * wrap to a byte, and take the top three bits. The `& 0xFF` is what makes the
 * wrap free, so sector 7 and sector 0 meet without a special case.
 *
 * `dy` is computed as `centre - touch` and `dx` as `touch - centre` -- opposite
 * senses, which is what puts screen-down and angle-up the same way round.
 */
long CheckLeftDial(int player)
{
    float cx, cy;
    float outer2, inner2;
    long i;

    JOUTERDIAL = (float)FE_W(80.0f);
    if (P2Controls != 0)
        JOUTERDIAL = 96.0f;             /* unscaled, unlike the default */

    if (player == 0) {
        cx = (float)JoystickStatePosX;
        cy = (float)JoystickStatePosY;
    } else {
        cx = (float)JoystickStatePosXP2;
        cy = (float)JoystickStatePosYP2;
    }

    outer2 = JOUTERDIAL * JOUTERDIAL;
    inner2 = JINNERDIAL * JINNERDIAL;

    for (i = 0; i < TOUCH_SLOTS; i++) {
        float dx, dy, d2, len, t;
        long dir;

        if (limeTouchScreenX[i] == -1.0f)
            continue;                   /* empty slot */

        dx = limeTouchScreenX[i] - cx;
        dy = cy - limeTouchScreenY[i];  /* note the opposite sense */
        d2 = dx * dx + dy * dy;

        if (d2 > outer2)
            continue;
        if (d2 < inner2)
            continue;

        len = sqrtf(d2);
        t = (float)(acos((double)(dy / len)) / 3.1415927410125732);

        if (dx / len < 0.0f)
            t = -t;

        t = (t + 1.0f) * 0.5f;
        if (t < 0.0f)
            t += 1.0f;

        dir = (long)((1.0f - t) * 256.0f);
        return ((dir + 0x10) & 0xFF) >> 5;
    }

    return -1;
}


/* `_SaveData` -- 0x001f439c, **172 bytes** (0xac), the last word being a
 * checksum. Every field below is written by this function and nothing else in
 * it is touched:
 *
 *      +0x00  GameStarted
 *      +0x04  Destiny                 which arcade ladder
 *      +0x08  Stage                   how far up it
 *      +0x0c  Character1
 *      +0x10  ClassicSubZeroUnlocked
 *      +0x14  ErmacUnlocked
 *      +0x18  MileenaUnlocked
 *      +0x1c  JadeUnlocked
 *      +0x20  TreasureGained[10]
 *      +0x48  winStreak
 *      +0x4c  EndingsGained[23]
 *      +0xa8  checksum -- the sum of every word above
 */
#define SAVEDATA_SIZE  0xac

/* `TreasureGained` (10 words) and `EndingsGained` (23 words) are already
 * declared above with those same counts, derived there independently. */
extern long  SaveData[];                /* 0x001f439c */
extern long *ClassicSubZeroUnlocked;
extern long *ErmacUnlocked;
extern long *MileenaUnlocked;
extern long *JadeUnlocked;
extern long *SurvivalStage;
extern long *SurvivalHealth;


/* ------------------------------------------------------------- Write_SaveData
 *
 * armv7 0x00023404, 408 bytes.  **Complete.**
 *
 * Serialises the save into `_SaveData` and writes it to `savedata`.
 *
 * ### The four unlock flags are named here
 *
 *      ClassicSubZeroUnlocked, ErmacUnlocked, MileenaUnlocked, JadeUnlocked
 *
 * -- the four classic MK3 hidden fighters, each its own word in the save at
 * +0x10 through +0x1c. So the hidden roster is not a derived state or a kode
 * side effect: it is **persisted, one flag per character**, and whatever sets
 * them is what a port has to find. Nothing in this function writes them; it
 * only copies them out.
 *
 * ### It does nothing at all unless GameMode is 0
 *
 * The whole body is skipped for any other mode, and the function then falls
 * straight to the survival check. So a save written during an arcade ladder is
 * written by somebody else, or not at all.
 *
 * ### The checksum is a plain sum
 *
 * Every word stored is added into a running total and the total goes in the
 * last word, +0xa8. Not a CRC, not weighted -- an unsigned sum, so any two
 * fields that swap values leave it unchanged. The size passed to
 * `limeWriteFile` is 0xac, exactly the checksum offset plus four.
 *
 * ### Survival is a second, separate file
 *
 * `GameMode == 4` additionally writes **twelve bytes** to `survival` from a
 * stack buffer: `SurvivalStage`, `Character1`, `SurvivalHealth`. That file has
 * no checksum and shares no layout with the main one.
 */
void Write_SaveData(void)
{
    long sum = 0;
    long i;

    if (GameMode == 0) {
        SaveData[0x00 / 4] = GameStarted;
        SaveData[0x04 / 4] = Destiny;
        SaveData[0x08 / 4] = Stage;
        SaveData[0x0c / 4] = Character1;
        SaveData[0x10 / 4] = *ClassicSubZeroUnlocked;
        SaveData[0x14 / 4] = *ErmacUnlocked;
        SaveData[0x18 / 4] = *MileenaUnlocked;
        SaveData[0x1c / 4] = *JadeUnlocked;
        SaveData[0x48 / 4] = winStreak;

        sum = SaveData[0x00 / 4] + SaveData[0x04 / 4] + SaveData[0x08 / 4]
            + SaveData[0x0c / 4] + SaveData[0x10 / 4] + SaveData[0x14 / 4]
            + SaveData[0x18 / 4] + SaveData[0x1c / 4] + SaveData[0x48 / 4];

        for (i = 0; i < 10; i++) {              /* +0x20 .. +0x44 */
            SaveData[0x20 / 4 + i] = TreasureGained[i];
            sum += TreasureGained[i];
        }

        for (i = 0; i < 23; i++) {              /* +0x4c .. +0xa4 */
            SaveData[0x4c / 4 + i] = EndingsGained[i];
            sum += EndingsGained[i];
        }

        SaveData[0xa8 / 4] = sum;               /* a plain sum, not a CRC */
        limeWriteFile("savedata", SaveData, SAVEDATA_SIZE, 0);
    }

    if (GameMode == 4) {
        long survival[3];

        survival[0] = *SurvivalStage;
        survival[1] = Character1;
        survival[2] = *SurvivalHealth;
        limeWriteFile("survival", survival, 0xc, 0);
    }
}


extern long *SurvivalCharacter1;        /* pointer slot -> 0x000ff9?? */

void *limeLoadSaveFile(const char *name);
void  Reset_SaveData(void);


/* -------------------------------------------------------------- Load_SaveData
 *
 * armv7 0x00023648, 464 bytes.  **Complete.**
 *
 * Reads `savedata` back into the globals `Write_SaveData` copied out of, then
 * validates every one of them.
 *
 * ### The checksum is verified, and failing it wipes the save
 *
 * The same plain sum is recomputed while reading and compared against +0xa8;
 * a mismatch calls **`Reset_SaveData()`** and the fields are then re-validated
 * on top of the reset values. So a corrupt save is not rejected -- it is
 * silently replaced, and the game continues.
 *
 * ### The clamps encode the ladder lengths
 *
 *      Destiny     > 3 -> 0,  < 0 -> 0
 *      Character1  outside [0, 0x17] -> 1
 *      Stage       clamped to at most Destiny + 8
 *
 * **`Destiny + 8` is exactly the ladder length.** `PopulateTower` fills the
 * four ladders with 6, 7, 8 and 9 random opponents plus the two fixed bosses --
 * 8, 9, 10 and 11 fights for Destiny 0 through 3. Two functions written from
 * opposite ends of the save agree on the number without either stating it.
 *
 * Character 0x17 is 23, the slot `LoadFrontEndCharacters` loads as character 0.
 * The out-of-range fallback is **1**, not 0.
 *
 * ### The survival file is read asymmetrically
 *
 * `Write_SaveData` writes `{SurvivalStage, Character1, SurvivalHealth}`; this
 * reads `{SurvivalStage, SurvivalCharacter1, SurvivalHealth}`. The middle word
 * goes out of one global and comes back into a different one. Whether that is
 * deliberate is not established here -- it is transcribed because a port that
 * "fixes" it changes which character a resumed survival run uses.
 *
 * Health is clamped to (0, 100]: zero or negative and anything above 100 both
 * become 100, so a corrupt file resumes at full health rather than dead.
 *
 * Both files are freed after use. A missing `savedata` skips straight past
 * everything, including the survival load.
 */
void Load_SaveData(void)
{
    long *save = (long *)limeLoadSaveFile("savedata");
    long *surv;
    long sum, i, v;

    if (save == 0)
        return;

    GameStarted = save[0x00 / 4];
    Destiny     = save[0x04 / 4];
    Stage       = save[0x08 / 4];
    Character1  = save[0x0c / 4];
    *ClassicSubZeroUnlocked = save[0x10 / 4];
    *ErmacUnlocked          = save[0x14 / 4];
    *MileenaUnlocked        = save[0x18 / 4];
    *JadeUnlocked           = save[0x1c / 4];
    winStreak   = save[0x48 / 4];

    sum = save[0x00 / 4] + save[0x04 / 4] + save[0x08 / 4] + save[0x0c / 4]
        + save[0x10 / 4] + save[0x14 / 4] + save[0x18 / 4] + save[0x1c / 4]
        + save[0x48 / 4];

    for (i = 0; i < 10; i++) {
        TreasureGained[i] = save[0x20 / 4 + i];
        sum += save[0x20 / 4 + i];
    }
    for (i = 0; i < 23; i++) {
        EndingsGained[i] = save[0x4c / 4 + i];
        sum += save[0x4c / 4 + i];
    }

    if (sum != save[0xa8 / 4])
        Reset_SaveData();               /* silently replaced, not rejected */

    if (Destiny > 3)
        Destiny = 0;
    else if (Destiny < 0)
        Destiny = 0;

    if (Character1 < 0 || Character1 > 0x17)
        Character1 = 1;                 /* the fallback is 1, not 0 */

    if (Destiny + 8 <= Stage)
        Stage = Destiny + 8;            /* the ladder length */

    limeFree(save);

    surv = (long *)limeLoadSaveFile("survival");
    if (surv == 0)
        return;

    *SurvivalStage = surv[0];

    v = surv[1];
    *SurvivalCharacter1 = v;            /* written from Character1, read here */
    if (v < 0 || v > 0x17)
        *SurvivalCharacter1 = 1;

    v = surv[2];
    *SurvivalHealth = v;
    if (v <= 0 || v > 100)
        *SurvivalHealth = 100;

    limeFree(surv);
}


extern long  EnduranceChange;           /* 0x0010df14 */
extern long  EnduranceCharacters[];     /* 0x001ab014 */
extern long  LastEnduranceCharacter;    /* 0x001ab674 */
extern long  EnduranceMatchTable2[];    /* 0x00145f1c, two words a row */
extern long  EnduranceMatchTreasure7[]; /* 0x00145f3c, four words a row */
extern long  EnduranceMatchTreasure8[]; /* 0x00145f7c, four words a row */
extern long  EnduranceTowerList[];      /* 0x0014fb50, eleven words a row */
/* `RoundParam` is declared above as `int *`; the three fields this function
 * writes are BYTES, so they go through a char view of the same pointer. */
#define ROUNDPARAM_B  ((char *)RoundParam)
extern long *TreasurePlayed;            /* pointer slot */
extern long  girlrand, girlrand2;       /* 0x0010de74, 0x0010de78 */
extern long  boyrand,  boyrand2;        /* 0x0010de6c, 0x0010de70 */
extern long *PLAYER2MODEL;              /* pointer slot -> 0x0014e1b8 */


/* --------------------------------------------------------- InitEnduranceMatch
 *
 * armv7 0x0001b5a0, 512 bytes.  **Complete.**
 *
 * Sets up an endurance fight -- one player against a queue of opponents. The
 * queue lives in `_EnduranceCharacters`, terminated by -1, and is mirrored into
 * three bytes of `_RoundParam` at +0x18, +0x19 and +0x1a.
 *
 * The default comes from `EnduranceMatchTable2[Destiny]`, two words a row: the
 * first becomes `Character2` and `PLAYER2MODEL`, the second the single queued
 * opponent. The queue is then closed with -1.
 *
 * ### `EnduranceTowerList` is eleven words a row -- again
 *
 * The index is `Stage + 11 * Destiny`, the same shape `FE_Task_VS_Screen_Init`
 * uses on `OpponentTowerList` and the same 44-byte row `PopulateTower` writes.
 * **A value of 2 in that list means a two-opponent endurance match**, and the
 * setup is derived from the 2 itself rather than looked up: `2 + 16` is the
 * fighter shown, and the queue becomes `{5, 15, -1}` with 15 being that
 * fighter minus three. Three constants from one table entry.
 *
 * ### GameMode 5 overrides everything with the treasure matches
 *
 *      TreasurePlayed == 7   three from EnduranceMatchTreasure7, by girlrand
 *      TreasurePlayed == 8   three from EnduranceMatchTreasure8, by boyrand
 *      TreasurePlayed == 9   a fixed queue: fighter 11 against 24 then 25
 *
 * The two random ones read **three consecutive entries of a four-wide row,
 * wrapping**: row `girlrand`, starting at `girlrand2 & 3`, then `+1` and `+2`
 * masked the same way. So the same three opponents always appear together and
 * only their order rotates -- it is a rotation, not a draw, exactly like the
 * ladder in `PopulateTower`.
 *
 * 24 and 25 in the third case are the same two fixed bosses `PopulateTower`
 * puts at the end of every ladder.
 *
 * Every path writes `-1` into the last queue slot and into `RoundParam + 0x1a`,
 * so the queue is always terminated even when it is shorter than three.
 */
void InitEnduranceMatch(void)
{
    long d = Destiny;
    long v;

    EnduranceChange = 0;

    Character2    = EnduranceMatchTable2[d * 2];
    *PLAYER2MODEL = EnduranceMatchTable2[d * 2];
    EnduranceCharacters[0]  = EnduranceMatchTable2[d * 2 + 1];
    LastEnduranceCharacter  = EnduranceMatchTable2[d * 2 + 1];
    ROUNDPARAM_B[0x18] = (char)EnduranceMatchTable2[d * 2 + 1];
    ROUNDPARAM_B[0x19] = (char)-1;
    EnduranceCharacters[1]  = -1;

    v = EnduranceTowerList[Stage + 11 * d];
    if (v == 2) {
        Character2    = v + 0x10;       /* 18, derived from the 2 */
        *PLAYER2MODEL = v + 0x10;
        ROUNDPARAM_B[0x18] = 5;
        ROUNDPARAM_B[0x19] = (char)(v + 0x10 - 3);        /* 15 */
        ROUNDPARAM_B[0x1a] = (char)-1;
        EnduranceCharacters[0] = 5;
        EnduranceCharacters[1] = v + 0x10 - 3;
        EnduranceCharacters[2] = -1;
        LastEnduranceCharacter = v + 0x10 - 3;
    }

    if (GameMode != 5)
        return;

    if (*TreasurePlayed == 7) {
        long r = girlrand * 4;
        long a = EnduranceMatchTreasure7[r + ((girlrand2 + 0) & 3)];
        long b = EnduranceMatchTreasure7[r + ((girlrand2 + 1) & 3)];
        long c = EnduranceMatchTreasure7[r + ((girlrand2 + 2) & 3)];

        Character2    = a;
        *PLAYER2MODEL = a;
        ROUNDPARAM_B[0x18] = (char)b;
        ROUNDPARAM_B[0x19] = (char)c;
        ROUNDPARAM_B[0x1a] = (char)-1;
        EnduranceCharacters[0] = b;
        EnduranceCharacters[1] = c;
        EnduranceCharacters[2] = -1;
        LastEnduranceCharacter = c;
    } else if (*TreasurePlayed == 8) {
        long r = boyrand * 4;
        long a = EnduranceMatchTreasure8[r + ((boyrand2 + 0) & 3)];
        long b = EnduranceMatchTreasure8[r + ((boyrand2 + 1) & 3)];
        long c = EnduranceMatchTreasure8[r + ((boyrand2 + 2) & 3)];

        Character2    = a;
        *PLAYER2MODEL = a;
        ROUNDPARAM_B[0x18] = (char)b;
        ROUNDPARAM_B[0x19] = (char)c;
        ROUNDPARAM_B[0x1a] = (char)-1;
        EnduranceCharacters[0] = b;
        EnduranceCharacters[1] = c;
        EnduranceCharacters[2] = -1;
        LastEnduranceCharacter = c;
    } else if (*TreasurePlayed == 9) {
        Character2    = 11;
        *PLAYER2MODEL = 11;
        ROUNDPARAM_B[0x18] = 24;          /* the two ladder bosses */
        ROUNDPARAM_B[0x19] = 25;
        ROUNDPARAM_B[0x1a] = (char)-1;
        EnduranceCharacters[0] = 24;
        EnduranceCharacters[1] = 25;
        EnduranceCharacters[2] = -1;
        LastEnduranceCharacter = 25;
    }
}


extern void *SplashTexture1;            /* 0x001abb8c */
extern void *SplashTexture2;            /* 0x001abb90 */
extern long  SplashCount;               /* 0x00150cc8 */
extern long *limeDeferredDeviceSideways;/* pointer slot */
extern long *limeDeviceSideways;        /* pointer slot */
extern float *FE_YOffset;               /* pointer slot */
extern float *FE_WidthScaleP;           /* pointer slot -- see below */
extern float *FE_HeightScaleP;          /* pointer slot */

void SetupFEScale(void);
void limeSetColourMask(long r, long g, long b, long a);
void Task_LoadingScreen(void);


/* ------------------------------------------------------- Task_LoadSplashScreen
 *
 * armv7 0x0001d594, 568 bytes.  **Complete.**
 *
 * The two publisher splash screens, driven entirely by one frame counter,
 * `_SplashCount`, which this function increments on **every** path including
 * the ones that draw nothing.
 *
 * The whole timeline, in frames:
 *
 *        0          load SPLASH1.PNG and SPLASH2.PNG, draw 1 at full alpha
 *        1 .. 120   SPLASH1, alpha 1
 *      121 .. 179   SPLASH1, alpha (180 - n) / 60      fading out
 *      180 .. 190   nothing drawn -- a deliberate gap
 *      191 .. 249   SPLASH2, alpha (n - 190) / 60      fading in
 *      250 .. 430   SPLASH2, alpha 1
 *      431 .. 489   SPLASH2, alpha (490 - n) / 60      fading out
 *      491 ..       delete both textures, CurrentTask = NextTask = 1,
 *                   Task_LoadingScreen(), delete LoadingTexture if present
 *
 * **The eleven-frame gap between the two logos is real**, not an artefact of
 * the fades meeting: 180..190 falls outside every drawing range. At 30 fps that
 * is about a third of a second of black, and it is what makes the two logos
 * read as separate rather than as a crossfade.
 *
 * All three fades divide by **60**, so each takes two seconds at 30 fps
 * regardless of how long the plateau either side of it is.
 *
 * ### Both orientation flags are forced sideways
 *
 *      *limeDeferredDeviceSideways = 1
 *      *limeDeviceSideways         = 1
 *
 * every frame, not once. So the splash cannot be rotated out from under itself
 * by anything else changing them.
 *
 * ### The sprite is a window into the texture, not the whole thing
 *
 *      limeDrawSprite(tex, 0, FE_YOffset,
 *                     480 * FE_WidthScale, 320 * FE_HeightScale,
 *                     0.03125f, 0.1875f, 0.9375f, 0.625f, colour)
 *
 * The four UVs are 1/32, 6/32, 30/32 and 20/32 -- an inset window, so the
 * shipped PNG is larger than the part that is shown and the margins are never
 * sampled. A port that draws 0..1 gets the logo surrounded by whatever the
 * padding contains.
 *
 * 480 x 320 is the device resolution written as literals and scaled at draw
 * time, which is how this survives a different screen.
 *
 * `limeSetColourMask(1, 1, 1, 0)` leaves the alpha channel unwritten -- the
 * fade is in the vertex colour, not in the framebuffer alpha.
 *
 * The colour block is written **twice**: copied from the function's own static
 * `{1, 1, 1, 1}` and then filled with four more explicit 1.0 stores before the
 * alpha is overwritten. Transcribed once; the duplication does nothing.
 */
void Task_LoadSplashScreen(void)
{
    float colour[4];
    long n;
    void *tex;

    colour[0] = colour[1] = colour[2] = colour[3] = 1.0f;   /* C.243 */

    SetupFEScale();
    *limeDeferredDeviceSideways = 1;
    *limeDeviceSideways         = 1;

    limeEnableAlphaBlending_Basic();
    limeSetColourMask(1, 1, 1, 0);
    limeSet2DDrawing();

    n = SplashCount;

    if (n == 0) {
        SplashTexture1 = limeLoadTexture("SPLASH1.PNG", 1, 0);
        SplashTexture2 = limeLoadTexture("SPLASH2.PNG", 1, 0);
        tex = SplashTexture1;
    } else if (n > 179) {
        if ((unsigned long)(n - 191) <= 298) {          /* 191 .. 489 */
            if (n <= 249)
                colour[3] = (float)(n - 190) / 60.0f;   /* fading in */
            else if (n > 430)
                colour[3] = (float)(490 - n) / 60.0f;   /* fading out */
            tex = SplashTexture2;
        } else if (n <= 490) {
            SplashCount++;                              /* the gap: nothing */
            return;
        } else {
            limeDeleteTexture(SplashTexture1);
            limeDeleteTexture(SplashTexture2);
            CurrentTask = 1;
            NextTask    = 1;
            Task_LoadingScreen();
            if (LoadingTexture != 0)
                limeDeleteTexture(LoadingTexture);
            SplashCount++;
            return;
        }
    } else if (n > 120) {
        colour[3] = (float)(180 - n) / 60.0f;           /* fading out */
        tex = SplashTexture1;
    } else {
        tex = SplashTexture1;
    }

    limeDrawSprite(tex, 0.0f, *FE_YOffset,
                   480.0f * *FE_WidthScaleP,
                   320.0f * *FE_HeightScaleP,
                   0.03125f, 0.1875f, 0.9375f, 0.625f,
                   (long *)colour);

    SplashCount++;
}


/* `GameObjects` and `limeScreenWidth` are declared above. */
extern long  AverageFPSCount;           /* 0x0014e1d0 */
extern float AverageFPS;                /* 0x0014e1d4 */
extern float DisplayAverageFPS;         /* 0x0014e1d8 */
extern long  ToggleDebug;               /* 0x00150588 */
extern long  AIOn;                      /* 0x0014e1f4 */
extern long  SpeedNormal;               /* 0x0014e1f8 */
extern long  JoystickState;             /* 0x0014febc */
extern float *limeFPS;                  /* pointer slot */
extern long  *limeRenderedPolyCount;    /* pointer slot */
extern GAMEFONT NameFont;               /* 0x001c3bf4 */
extern float  fontcol[];                /* 0x0014f9f0 */
extern char   str[];                    /* 0x001f3cac, the shared scratch buffer */

int  sprintf(char *dst, const char *fmt, ...);
void limeDrawFONT(void *font, const char *text, float x, float y,
                  long align, float scale, const float *colour);


/* -------------------------------------------------------------- ShowDebugInfo
 *
 * armv7 0x0001db84, 572 bytes.  **Complete.**
 *
 * The developer overlay, and it shipped: poly count, joystick bits, AI mode and
 * game speed drawn over the fight in `_NameFont`.
 *
 * ### The FPS average runs even when the overlay is off
 *
 *      AverageFPS += limeFPS
 *      if (++AverageFPSCount == 10) {
 *          DisplayAverageFPS = AverageFPS / 10
 *          AverageFPSCount = 0
 *          AverageFPS = 0
 *      }
 *      if (!ToggleDebug) return
 *
 * The accumulation happens **before** the `ToggleDebug` check, so
 * `_DisplayAverageFPS` is correct the moment the overlay is switched on rather
 * than needing ten frames to settle. That ordering is the only reason the
 * number is not garbage on the first frame.
 *
 * The whole function returns immediately if `_GameObjects` is null -- so the
 * average does not accumulate outside a fight either.
 *
 * **Ten frames, hardcoded**, and the divisor is the `vmov.f32 s12, #10.0`
 * immediate rather than a constant anywhere in the data.
 *
 * ### What it draws
 *
 *      "Poly Count %d  Joy: %d"    at FE_Y(96),  left,  size 8
 *      "AI: Human vs Human"        at FE_Y(112)          AIOn == 0
 *      "AI: Human vs CPU"                                AIOn == 1
 *      "AI: CPU vs CPU"                                  AIOn == 2
 *      "Speed: Normal"             at FE_Y(96),  right   SpeedNormal != 0
 *      "Speed: Slow-mo"                                  SpeedNormal == 0
 *
 * The two speed lines are right-aligned (`align` 2) at
 * `limeScreenWidth - 8`, and **-8 is a raw pixel inset with no scaler on it** --
 * the same shape as the leaderboard's unscaled left margin and the dial's
 * unscaled P2 radius. Three separate places where one dimension of a pair is
 * scaled and the other is not.
 *
 * `_str` at 0x001f3cac is a shared scratch buffer and `sprintf` is unbounded,
 * which is normal for this tree.
 */
void ShowDebugInfo(void)
{
    if (GameObjects == 0)
        return;

    AverageFPSCount++;
    AverageFPS += *limeFPS;

    if (AverageFPSCount == 10) {
        DisplayAverageFPS = AverageFPS / 10.0f;
        AverageFPSCount   = 0;
        AverageFPS        = 0.0f;
    }

    if (ToggleDebug == 0)
        return;                         /* the average has already been kept */

    sprintf(str, "Poly Count %d  Joy: %d",
            (int)*limeRenderedPolyCount, (int)JoystickState);
    limeDrawFONT(&NameFont, str, 8.0f, (float)FE_Y(96.0f), 0, 1.0f, fontcol);

    if (AIOn == 2)
        limeDrawFONT(&NameFont, "AI: CPU vs CPU", 8.0f, (float)FE_Y(112.0f),
                     0, 1.0f, fontcol);
    else if (AIOn == 1)
        limeDrawFONT(&NameFont, "AI: Human vs CPU", 8.0f, (float)FE_Y(112.0f),
                     0, 1.0f, fontcol);
    else
        limeDrawFONT(&NameFont, "AI: Human vs Human", 8.0f, (float)FE_Y(112.0f),
                     0, 1.0f, fontcol);

    if (SpeedNormal != 0)
        limeDrawFONT(&NameFont, "Speed: Normal",
                     (float)(limeScreenWidth - 8), (float)FE_Y(96.0f),
                     2, 1.0f, fontcol);
    else
        limeDrawFONT(&NameFont, "Speed: Slow-mo",
                     (float)(limeScreenWidth - 8), (float)FE_Y(96.0f),
                     2, 1.0f, fontcol);
}


extern long  LastSpecialButton[2];      /* 0x00150e98 */
extern long  Player1NumButtons;         /* 0x0010de64 */
extern long  Player2NumButtons;         /* 0x0010de68 */
extern MKMOVE FourButtonMoves[];        /* 0x0015092c */

int isParentBasedOnSpeed(void);


/* ------------------------------------------------------ GetReal6ButtonJoyBits
 *
 * armv7 0x0001e3cc, 576 bytes.  **Complete.**
 *
 * Builds the raw six-button input word from the dial direction and the button
 * array, then converts the directions to facing-relative form.
 *
 * ### The dial is eight-way and diagonals set two bits
 *
 *      dir in {8, 1, 2}   |= 0x01   up
 *      dir in {4, 5, 6}   |= 0x02   down
 *      dir in {6, 7, 8}   |= 0x04   left
 *      dir in {2, 3, 4}   |= 0x08   right
 *
 * Each range is three wide and they overlap at the corners, so `dir == 2` sets
 * up **and** right. Direction 0 sets nothing -- neutral. Every test is written
 * as an unsigned range check (`subs` then `cmp ... #2`), which is how one
 * comparison covers three values.
 *
 * The six buttons are `buttons[0..5]` into bits 0x10 through 0x200 -- that is
 * the "6Button" in the name.
 *
 * ### This is the exact inverse of GetArcadeJoyBits' tail
 *
 *      if (LEFT)  set (facing & 0x10) ? 0x0800 : 0x1000
 *      if (RIGHT) set (facing & 0x10) ? 0x1000 : 0x0800
 *
 * 0x800 is TOWARD and 0x1000 is AWAY -- the same two bits `GetArcadeJoyBits`
 * converts back into LEFT and RIGHT on the way out, with the same facing flag.
 * **One function turns absolute into relative on input and the other turns
 * relative into absolute on output**, and neither makes sense without the
 * other. Both are needed, in that order, or the fighter mirrors his own inputs.
 *
 * The facing flag lives at `GameObjects[player * 16 + 0x0a]`, so the two
 * players' object records are sixteen bytes apart.
 *
 * ### 0x400 is edge-triggered
 *
 *      if (buttons[6] && LastSpecialButton[p] == 0) bits |= 0x400;
 *      LastSpecialButton[p] = buttons[6];
 *
 * The bit is set only on the rising edge, and the store happens on **every**
 * path including when the button is released -- so a port that only updates
 * `LastSpecialButton` when the button is down latches the bit forever.
 *
 * ### Fewer than six buttons goes back through GetArcadeJoyBits
 *
 * With `PlayerNNumButtons` at 4 or 5 the assembled word is run through
 * `GetArcadeJoyBits(bits, FourButtonMoves, facing & 0x10, 1)` to synthesise the
 * buttons the player does not have. At 6 nothing extra happens.
 *
 * The last argument is **1 in all four cases**, but spelled two ways: the
 * four-button arms compute it as `NumButtons - 3` and the five-button arms use
 * a literal 1. `NumButtons - 3` would be 2 at five buttons -- that expression is
 * simply never reached with a 5. Transcribed as the constant it always is.
 *
 * The four-button arms then fall through into the five-button test, which
 * cannot also be true. Dead, harmless, and left as written.
 *
 * ### Which player
 *
 *      isParentBasedOnSpeed()  ->  p = (the fifth argument != 0)
 *      otherwise               ->  p = (GameMode == 1)
 *
 * so in single player the player index comes from the game mode rather than
 * from the caller.
 */
void GetReal6ButtonJoyBits(int dir, const int *buttons, Mk3Obj_t *unused,
                           long *out, int which)
{
    long bits = *out;
    long p;
    const unsigned short *obj;

    (void)unused;

    if (dir == 8 || (unsigned)(dir - 1) <= 1) bits |= 0x01;     /* up    */
    if ((unsigned)(dir - 4) <= 2)             bits |= 0x02;     /* down  */
    if ((unsigned)(dir - 6) <= 2)             bits |= 0x04;     /* left  */
    if ((unsigned)(dir - 2) <= 2)             bits |= 0x08;     /* right */

    if (buttons[0]) bits |= 0x010;
    if (buttons[1]) bits |= 0x020;
    if (buttons[2]) bits |= 0x040;
    if (buttons[3]) bits |= 0x080;
    if (buttons[4]) bits |= 0x100;
    if (buttons[5]) bits |= 0x200;

    *out = bits;

    p = isParentBasedOnSpeed() ? (which != 0) : (GameMode == 1);

    obj = (const unsigned short *)*GameObjects;
    if (obj != 0) {
        long facing = obj[(p * 16 + 0x0a) / 2] & 0x10;

        if (bits & 0x04)                        /* left  */
            bits |= facing ? 0x0800 : 0x1000;
        if (bits & 0x08)                        /* right */
            bits |= facing ? 0x1000 : 0x0800;

        *out = bits;
    }

    if (buttons[6] != 0 && LastSpecialButton[p] == 0)
        *out |= 0x400;                          /* the rising edge only */
    LastSpecialButton[p] = buttons[6];           /* stored either way */

    obj = (const unsigned short *)*GameObjects;
    if (obj == 0)
        return;

    if (p) {
        if (Player2NumButtons == 4 || Player2NumButtons == 5)
            *out = GetArcadeJoyBits(*out, FourButtonMoves,
                                    obj[0x1a / 2] & 0x10, 1);
    } else {
        if (Player1NumButtons == 4 || Player1NumButtons == 5)
            *out = GetArcadeJoyBits(*out, FourButtonMoves,
                                    obj[0x0a / 2] & 0x10, 1);
    }
}


/* ### More of PLAYER, from the reading side
 *
 * `PlayerAutoSmoothAnims` writes +0x51c, +0x520 and +0x524; this function is
 * what reads them, and it hands all three straight to
 * `RenderAnimatedCharacter` as its two frames and blend factor. The chain is
 * closed: the smoother decides, the renderer interpolates.
 *
 *      +0x51c  long   frameA          written by PlayerAutoSmoothAnims
 *      +0x520  long   frameB
 *      +0x524  float  t
 *      +0x528  TEXTURE *skin
 *      +0x52c  long            (passed to LIME_RenderScene)
 *      +0x540  long   mirrored        also read by DoSmokesSmoke
 *      +0x548  float  matrix[16]      multiplied straight onto MODELVIEW
 *      +0x5d0  float  shadowY
 *      +0x5d4  float  grey            AnimateFECharacters sets this to 1.0f
 *      +0x5d8  float  pos[3]
 */
typedef struct ANIMATEDCHARACTER ANIMATEDCHARACTER;
typedef struct PLAYER PLAYER;

long IsFrameVisible(ANIMATEDCHARACTER *c, long a, long b);
void RenderAnimatedCharacter(char *name, ANIMATEDCHARACTER *c,
                             long frameA, long frameB, float t,
                             float y, float grey, limeVECTOR3 *pos,
                             void *tex, long visible);
extern float AttachTransforms[];        /* 0x0018ee00 */
extern float **MatrixPalette2;          /* pointer slot */

void LIME_PushMatrix(void);
void LIME_PopMatrix(long n);
void LIME_KillAllLights(void);
void LIME_RenderScene(long a, void *scene, long frameA, long frameB, float t,
                      long b, long c, long d, void *tex, long e, float *att);
void limeDisableAlphaBlending(void);
void limeEnableDepthWrites(void);
void glMatrixMode(unsigned int m);
void glMultMatrixf(const float *m);
#define GL_MODELVIEW 0x1700


/* --------------------------------------------------------------- RenderPlayer
 *
 * armv7 0x00023c7c, 620 bytes.  **Complete.**
 *
 * Draws one fighter and, optionally, whatever is attached to him.
 *
 *      LIME_PushMatrix()
 *      glMatrixMode(GL_MODELVIEW)
 *      glMultMatrixf(p + 0x548)            <- the player's own 4x4
 *      glCullFace(p->mirrored ? GL_FRONT : GL_BACK)
 *      limeDisableAlphaBlending()
 *      limeEnableDepthWrites()
 *      ... RenderAnimatedCharacter(...)
 *      glCullFace(GL_BACK)
 *      LIME_KillAllLights()
 *      LIME_PopMatrix(1)
 *
 * **The mirrored fighter flips the cull face here too**, from the same +0x540
 * flag, and restores GL_BACK unconditionally on the way out -- the identical
 * discipline `RenderAMesh` uses. Two independent draw paths, one rule.
 *
 * ### Four call sites, one difference
 *
 * `RenderAnimatedCharacter` is called from four places in this function and
 * every argument but the last is the same. The last is its `visible` flag:
 *
 *      IsFrameVisible said yes, `flag` set      ->  0
 *      IsFrameVisible said yes, `flag` clear    ->  1
 *      character 12 on frame 295                ->  1, and a DIFFERENT name
 *      IsFrameVisible said no                   ->  whatever it returned
 *
 * The third is the per-character exception again -- **12 and 295, the same pair
 * `IsFrameVisible` special-cases** -- and here it does something concrete: the
 * name passed is `PlayerDefs[0x288]` rather than the fighter's own
 * `PlayerDefs[id].name`. A fixed entry, not indexed by character. So that
 * combination draws with somebody else's asset name.
 *
 * A `frameA` of -1 skips the draw entirely and goes straight to the cleanup.
 *
 * ### The attachment pass copies the whole palette first
 *
 *      memcpy(AttachTransforms, *MatrixPalette2, 0x1c20)
 *      LIME_RenderScene(6, anim->[0x10], frameA, frameB, t, 0, 0, 0,
 *                       skin, +0x52c, AttachTransforms)
 *
 * 0x1c20 is 7,200 bytes -- 150 matrices of 48, the 3x4 skin matrix this tree
 * already knows. So the attachment is posed against a **snapshot** of the
 * palette taken after the fighter was drawn, not against the live one; anything
 * that moves the palette between the two draws does not affect the attachment.
 *
 * Returns `p->anim->[0x34][1]`, read after everything else is done.
 */
long RenderPlayer(PLAYER *p, long attach, long flag)
{
    long *w = (long *)p;
    ANIMATEDCHARACTER *c = (ANIMATEDCHARACTER *)(uintptr_t)
                           (unsigned long)w[1];
    float grey = ((float *)w)[0x5d4 / 4];
    char *const *def;
    long vis;

    LIME_PushMatrix();
    glMatrixMode(GL_MODELVIEW);
    glMultMatrixf((const float *)&w[0x548 / 4]);

    glEnable(GL_CULL_FACE);
    glCullFace(w[0x540 / 4] != 0 ? GL_FRONT : GL_BACK);

    limeDisableAlphaBlending();
    limeEnableDepthWrites();

    vis = IsFrameVisible(c, w[0x51c / 4], w[0x520 / 4]);
    def = (char *const *)(PlayerDefs + w[0] * PLAYERDEF_STRIDE);

    if (vis == 0) {
        RenderAnimatedCharacter(def[0x18 / 4], c,
                                w[0x51c / 4], w[0x520 / 4],
                                ((float *)w)[0x524 / 4],
                                ((float *)w)[0x5d0 / 4], grey,
                                (limeVECTOR3 *)&w[0x5d8 / 4],
                                (void *)(uintptr_t)(unsigned long)w[0x528 / 4],
                                vis);
    } else if (w[0x51c / 4] != -1) {
        if (w[0x14 / 4] == 0x127 && w[0] == 12) {
            /* the 12/295 exception: somebody else's asset name */
            RenderAnimatedCharacter(
                    ((char *const *)PlayerDefs)[0x288 / 4], c,
                    w[0x51c / 4], w[0x520 / 4],
                    ((float *)w)[0x524 / 4],
                    ((float *)w)[0x5d0 / 4], grey,
                    (limeVECTOR3 *)&w[0x5d8 / 4],
                    (void *)(uintptr_t)(unsigned long)w[0x528 / 4], 1);
        } else {
            RenderAnimatedCharacter(def[0x18 / 4], c,
                                    w[0x51c / 4], w[0x520 / 4],
                                    ((float *)w)[0x524 / 4],
                                    ((float *)w)[0x5d0 / 4], grey,
                                    (limeVECTOR3 *)&w[0x5d8 / 4],
                                    (void *)(uintptr_t)(unsigned long)
                                        w[0x528 / 4],
                                    flag ? 0 : 1);
        }

        if (attach != 0) {
            memcpy(AttachTransforms, *MatrixPalette2, 0x1c20);
            LIME_RenderScene(6,
                             (void *)(uintptr_t)(unsigned long)
                                 ((const long *)c)[0x10 / 4],
                             w[0x51c / 4], w[0x520 / 4],
                             ((float *)w)[0x524 / 4], 0, 0, 0,
                             (void *)(uintptr_t)(unsigned long) w[0x528 / 4],
                             w[0x52c / 4], AttachTransforms);
        }
    }

    glCullFace(GL_BACK);
    LIME_KillAllLights();
    LIME_PopMatrix(1);

    return ((const long *)(uintptr_t)(unsigned long)
            ((const long *)c)[0x34 / 4])[1];
}


/* ### The second background layer has its own everything
 *
 * This function is the first place in the tree where `_BGSceneHandle2` is
 * driven rather than merely mentioned, and it settles the shape of the pair:
 *
 *      layer 0   BGSceneHandle,  SceneScale,  SceneX,  SceneY,  SceneZ
 *                -> RealBGSceneMatrix + 0x00
 *      layer 1   BGSceneHandle2, SceneScale2, SceneX2, SceneY2, SceneZ2
 *                -> RealBGSceneMatrix + 0x40
 *
 * so `_RealBGSceneMatrix` is TWO 4x4 matrices, and the second layer is
 * positioned and scaled entirely independently of the first. See issue #17. */
extern void  *BGSceneHandle;            /* 0x001aba40 */
extern void  *BGSceneHandle2;           /* 0x001aba44 */
extern long   BGSceneLoops[2];          /* 0x001aba80 */
extern float  BGSceneFrame[2];          /* 0x001abb20 */
extern long   BGSceneController[];      /* 0x001aba88, twelve bytes an entry */
extern float  RealBGSceneMatrix[32];    /* 0x001abaa0, two 4x4 */
extern float  M_Rot90[16];              /* 0x0018edc0 */
extern long   ExtraEffects;             /* 0x0014e1e8 */
extern float  SceneScale,  SceneX,  SceneY,  SceneZ;    /* 0x0014dfd8 .. */
extern float  SceneScale2, SceneX2, SceneY2, SceneZ2;   /* 0x0014dfe8 .. */

void RotMatrixX(float *m, float angle);
void limeMatrixLoadIdentity(float *m);
void limeMatrixMult(const float *a, const float *b, float *out);
void limeScaleMatrix(float *m, float s);
void LIME_TriggerEventsFromScene(void *scene, long frame, const float *m,
                                 long a, long b, long c, long d, long e);


/* ------------------------------------------------------------------ AnimateBG
 *
 * armv7 0x00021c1c, 672 bytes.  **Complete.**
 *
 * Advances the background scene animation, **for both layers**, and fires their
 * event tracks. Returns immediately when `_ExtraEffects` is clear or the first
 * scene handle is null.
 *
 * ### Building the two matrices
 *
 *      RotMatrixX(M_Rot90, 1.5707964f)         <- PI/2, from the pool
 *      identity -> multiply by M_Rot90 -> scale by SceneScale
 *      translate by (SceneX, SceneY, SceneZ)   -> RealBGSceneMatrix[0]
 *      identity -> scale by SceneScale2
 *      translate by (SceneX2, SceneY2, SceneZ2) -> RealBGSceneMatrix[0x40]
 *
 * **Only the first layer gets the X rotation.** The second is built from a
 * fresh identity and never sees `M_Rot90`, so the two layers do not share an
 * orientation -- which is the sort of thing a port reproduces by accident only
 * if it copies the sequence rather than the intent.
 *
 * The translation is written **directly into elements 12, 13 and 14** of the
 * identity matrix before the multiply, not applied through a call -- the stores
 * are at `sp+0x40` with the matrix at `sp+0x10`, so they land on the
 * translation row of the 4x4. Reading those offsets as if they were relative to
 * the matrix pointer puts them past its end; gcc's `-Warray-bounds` caught
 * exactly that mistake here before it was committed.
 *
 * ### The per-layer loop
 *
 * For each layer, if its frame counter has crossed into a new integer it calls
 *
 *      LIME_TriggerEventsFromScene(handle, (long)frame, matrix,
 *                                  0, -1, LevelSelect == 2, 0, 0)
 *
 * -- and the second layer passes `0` where the first passes `0` too, but from a
 * different literal (`r3 = -1` then `adds r3, #1`), so the two call sites are
 * genuinely separate code rather than a shared tail.
 *
 * **`LevelSelect == 2` is passed as a flag to both.** Whatever stage 2 is, it
 * changes how the background events are triggered.
 *
 * Then the counter advances by exactly `1.0f` a call -- **not scaled by frame
 * time**, unlike `MaintainFESlide`. The background animation is therefore tied
 * to the frame rate, and a 60 fps port runs it at double speed unless this is
 * changed deliberately.
 *
 * ### Non-looping scenes stop on the last frame
 *
 * When `BGSceneLoops[layer]` is zero the counter is clamped to
 * `scene->count - 1` (`+0x44` of the scene, the same field `HUDANIM_Update`
 * reads) and the layer stops advancing. Looping scenes are never clamped here
 * at all -- the wrap happens inside `LIME_TriggerEventsFromScene`.
 *
 * The loop ends after layer 1, and layer 1 is skipped entirely when
 * `_BGSceneHandle2` is null -- which is the normal case for most stages and is
 * why the second layer went unnoticed for so long.
 */
void AnimateBG(void)
{
    long stage2;
    long i;

    if (ExtraEffects == 0)
        return;

    stage2 = (*LevelSelectPtr == 2);

    if (BGSceneHandle == 0)
        return;

    {
        float rot[16], tmp[16], acc[16];

        RotMatrixX(M_Rot90, 1.5707964f);        /* 0x3fc90e55 */

        limeMatrixLoadIdentity(tmp);
        limeMatrixMult(M_Rot90, tmp, rot);
        limeScaleMatrix(rot, SceneScale);

        limeMatrixLoadIdentity(acc);
        acc[12] = SceneX;   /* sp+0x40, the matrix being at sp+0x10 */
        acc[13] = SceneY;
        acc[14] = SceneZ;
        limeMatrixMult(acc, rot, RealBGSceneMatrix);

        limeMatrixLoadIdentity(acc);            /* layer 2: no rotation */
        acc[12] = SceneX2;
        acc[13] = SceneY2;
        acc[14] = SceneZ2;
        limeScaleMatrix(acc, SceneScale2);
        limeMatrixMult(acc, RealBGSceneMatrix, &RealBGSceneMatrix[0x40 / 4]);
    }

    for (i = 0; i < 2; i++) {
        void *handle = (i == 0) ? BGSceneHandle : BGSceneHandle2;
        long *ctl = &BGSceneController[i * 3];
        float *m  = (i == 0) ? RealBGSceneMatrix
                             : &RealBGSceneMatrix[0x40 / 4];

        if (i == 1 && BGSceneHandle2 == 0)
            return;
        if (handle == 0)
            continue;

        if (BGSceneLoops[i] == 0) {
            float last = (float)(((const long *)handle)[0x44 / 4] - 1);
            if (BGSceneFrame[i] >= last) {
                BGSceneFrame[i] = last;         /* stop on the last frame */
                continue;
            }
        }

        if ((long)BGSceneFrame[i] != ctl[2]) {
            LIME_TriggerEventsFromScene(handle, (long)BGSceneFrame[i], m,
                                        0, -1, stage2, 0, 0);
            ctl[2] = (long)BGSceneFrame[i];
        }
        ctl[1] = (long)BGSceneFrame[i];

        BGSceneFrame[i] += 1.0f;                /* not frame-rate scaled */
    }
}


extern long   DrawSpear[2];             /* 0x0010deec */
extern long   SpearWhichTexture[2];     /* 0x0010def4 */
extern float  SpearStartPos[2][3];      /* 0x001ab63c */
extern float  SpearEndPos[2][3];        /* 0x001ab624 */
extern void  *SpearTexture[];           /* 0x001ab654 */
extern float *FaceMeMatrix;             /* pointer slot */
extern float  ShadowOffset;             /* 0x0014dfc8 */

void limeDrawFaceMeSpriteWH(void *tex, const float *m, float x, long a,
                            float y, long b, long c, float d, float e,
                            float w, float f, float g, float h, float i,
                            float j, long k, float l);


/* ------------------------------------------------------------- RenderExtras
 *
 * armv7 0x00020fa8, 636 bytes.  **Complete.**
 *
 * Draws Scorpion's spear -- the only thing in "extras" -- for both players, as
 * two face-me sprites: a stretched shaft and a fixed-size tip.
 *
 * Per player, and it is skipped entirely unless `_DrawSpear[player]` is set:
 *
 * ### The direction test is inverted by the mirror flag
 *
 *      mirrored (+0x540 set):  draw only while start.x <  end.x
 *      not mirrored:           draw only while start.x >= end.x
 *
 * The same +0x540 that flips the cull face in `RenderPlayer` and picks the
 * smoke offset in `DoSmokesSmoke`. Here it decides which way the spear is
 * allowed to point, so a spear travelling the wrong way for the fighter's
 * facing is simply not drawn.
 *
 * ### The shaft
 *
 * The texture is `SpearTexture[SpearWhichTexture[player] % 3]` -- **three
 * shaft textures cycled**, and the modulo is a reciprocal multiply with magic
 * `0x55555556` and no shift, which is 3 worked out numerically rather than
 * assumed.
 *
 * The sprite is stretched: its width argument is `start.x - end.x`, so it spans
 * whatever the spear currently covers, and its Y is
 * `ShadowOffset + 1.35` computed in **double** and narrowed at the call. The
 * 1.35 is a double literal in the pool, not a float widened.
 *
 * ### The tip
 *
 * A second sprite, drawn only when `SpearWhichTexture[player] % 3 <= 1` -- so
 * one of the three shaft phases has no tip at all. It uses
 * `SpearTexture[3]` or `SpearTexture[4]` and a width of **+0.25 or -0.25**,
 * chosen by comparing the same two X positions again and by whether
 * `SpearWhichTexture` is above 2. The sign is what points the tip.
 *
 * So `_SpearTexture` holds at least five entries: three shaft phases and two
 * tip orientations.
 *
 * Everything else in the long argument list is 1.0f or 0, written slot by slot;
 * the parameter names of `limeDrawFaceMeSpriteWH` are not established, so the
 * call below is transcribed positionally.
 */
void RenderExtras(void)
{
    long i;
    char *p = Players;

    limeEnableAlphaBlending_Basic();

    for (i = 0; i < 2; i++, p += 0x5f0) {
        float y;
        long phase;
        void *tex;

        if (DrawSpear[i] == 0)
            continue;

        if (((const long *)p)[0x540 / 4] != 0) {
            if (!(SpearStartPos[i][0] < SpearEndPos[i][0]))
                continue;
        } else {
            if (SpearStartPos[i][0] > SpearEndPos[i][0])
                continue;
        }

        phase = SpearWhichTexture[i] % 3;       /* magic 0x55555556 */
        tex   = SpearTexture[phase];
        y     = (float)((double)ShadowOffset + 1.35);

        /* the shaft: width is however far the spear reaches */
        limeDrawFaceMeSpriteWH(tex, FaceMeMatrix, SpearEndPos[i][0], 0,
                               y, 0, 0, 1.0f, 1.0f,
                               SpearStartPos[i][0] - SpearEndPos[i][0],
                               0.25f, 1.0f, 1.0f, 1.0f, 1.0f, 0, 0.25f);

        if (phase > 1)
            continue;                           /* one phase has no tip */

        if (SpearWhichTexture[i] > 2) {
            if (SpearStartPos[i][0] < SpearEndPos[i][0]) {
                tex = SpearTexture[4];
                limeDrawFaceMeSpriteWH(tex, FaceMeMatrix, SpearEndPos[i][0], 0,
                                       y, 0, 0, 1.0f, 1.0f, 0.25f,
                                       0.25f, 1.0f, 1.0f, 1.0f, 1.0f, 0, 0.25f);
            } else {
                tex = SpearTexture[3];
                limeDrawFaceMeSpriteWH(tex, FaceMeMatrix, SpearEndPos[i][0], 0,
                                       y, 0, 0, 1.0f, 1.0f, 0.25f,
                                       0.25f, 1.0f, 1.0f, 1.0f, 1.0f, 0, 0.25f);
            }
        } else {
            tex = SpearTexture[3];
            if (SpearStartPos[i][0] < SpearEndPos[i][0])
                limeDrawFaceMeSpriteWH(tex, FaceMeMatrix, SpearEndPos[i][0], 0,
                                       y, 0, 0, 1.0f, 1.0f, 0.25f,
                                       0.25f, 1.0f, 1.0f, 1.0f, 1.0f, 0, 0.25f);
            else
                limeDrawFaceMeSpriteWH(tex, FaceMeMatrix, SpearEndPos[i][0], 0,
                                       y, 0, 0, 1.0f, 1.0f, -0.25f,
                                       0.25f, 1.0f, 1.0f, 1.0f, 1.0f, 0, 0.25f);
        }
    }
}


extern long   GamePaused;               /* 0x0014e1fc */
extern long   PauseMenuAreYouSure;      /* 0x0014e260 */
extern long   DidIntroThisFrame;        /* 0x0010dec4 */
extern float *HUD_Scale;                /* pointer slot */
extern float *FE_FadeAddP;              /* pointer slot -> 0x0010089c */
extern float *limeLastTouchScreenX;     /* pointer slot */
extern float *limeLastTouchScreenY;     /* pointer slot */
extern long  SFXHandle[];               /* 0x001ab99c -- an ARRAY of sound handles.
                                         * Every site reaches it as `ldr r3,[slot]`
                                         * then `ldr r0,[r3,#0x68]`: the slot holds
                                         * the ADDRESS of the array, so declaring it
                                         * `long *` dereferenced once too many. */
extern int    Settings[10];             /* 0x00100e34 */
extern float MusicVol[];                /* 0x000ff830 -- an ARRAY, same correction:
                                         * `add r1,pc` puts the array address in r1
                                         * and the volume is `[r1 + idx*4]`. */

void limePlaySound(long id, float vol, float pan, long flags);

void sendPause(long state);
void EASDK_LogEventEnumEnumString(long id, long a, const char *s1,
                                  long b, const char *s2);


/* ----------------------------------------------------------- TogglePauseMenu
 *
 * armv7 0x0001e134, 664 bytes.  **Complete.**
 *
 * Two hot corners at the top of the screen, tested on **touch release**:
 *
 *      top RIGHT   x > limeScreenWidth - HUD_Scale * 80,  y < HUD_Scale * 64
 *                  -> GamePaused = 1, PauseMenuAreYouSure = 0
 *                  -> logs "INGAME MENU" / "PAUSE BUTTON"
 *
 *      top LEFT    x < HUD_Scale * 80,                    y < HUD_Scale * 64
 *                  -> GamePaused = 2
 *                  -> logs "INGAME MENU" / "MOVES INFO"
 *
 * So **the pause menu and the moves list are two different values of the same
 * flag**, 1 and 2, reached from opposite corners of the same 80x64 shape. Both
 * corners are scaled by `HUD_Scale`, both dimensions -- unlike the three
 * unscaled insets recorded in issue #22.
 *
 * ### The event id is 50016, and that matches the captured log
 *
 *      EASDK_LogEventEnumEnumString(0xc360, 15, "INGAME MENU", 15, "MOVES INFO")
 *
 * 0xc360 is 50016. The log lines quoted in issue #5 -- `LOGGING (50016):
 * INGAME MENU, MOVES INFO` -- are emitted from exactly here, which pins the
 * capture to this function and confirms the two strings are literals rather
 * than anything computed.
 *
 * ### Three guards before either corner counts
 *
 *      FE_FadeAdd != 0                 no input during a screen fade
 *      limeTouchScreenX[0] != -1       only a RELEASE counts, never a hold
 *      DidIntroThisFrame               swallowed on the intro frame
 *
 * The fade guard is the same one `drawPage2x1Wide` and
 * `drawPage2x2BigForSettings` use, and it is re-tested **after** the pause
 * branch as well -- so opening the pause menu cannot also trigger the moves
 * list in the same frame.
 *
 * The click sound is `SFXHandle[0x1a]` at `MusicVol[Settings[3]] / 100`, the
 * same one `TouchAreaWH` plays on release.
 *
 * ### sendPause is called three times
 *
 * In `GameMode == 1` the state goes out **three times in a row** -- and the
 * first call's argument is whatever was already in r0, not `GamePaused`; only
 * the second and third read the global. Transcribed as written. Three sends for
 * one state change is what an unreliable link gets instead of an ack, and the
 * stale first argument suggests it was written that way rather than looped.
 */
void TogglePauseMenu(void)
{
    float lx, ly;

    if (*FE_FadeAddP != 0.0f)
        return;
    if (limeTouchScreenX[0] != -1.0f)
        return;

    lx = limeLastTouchScreenX[0];

    if (lx != -1.0f
        && lx > (float)limeScreenWidth - *HUD_Scale * 80.0f
        && (ly = limeLastTouchScreenY[0]) < *HUD_Scale * 64.0f
        && DidIntroThisFrame == 0) {

        if (Settings[3] != 0)
            limePlaySound(SFXHandle[0x68 / 4],
                          MusicVol[Settings[3]] / 100.0f, 1.0f, 0);

        GamePaused          = 1;
        PauseMenuAreYouSure = 0;

        if (GameMode == 1) {
            sendPause(0);               /* r0 is stale here */
            sendPause(GamePaused);
            sendPause(GamePaused);
        }

        EASDK_LogEventEnumEnumString(0xc360, 15, "INGAME MENU",
                                     15, "PAUSE BUTTON");

        if (*FE_FadeAddP != 0.0f)
            return;
        if (limeTouchScreenX[0] != -1.0f)
            return;
    }

    lx = limeLastTouchScreenX[0];
    if (lx == -1.0f)
        return;
    if (lx >= *HUD_Scale * 80.0f)
        return;
    if (limeLastTouchScreenY[0] >= *HUD_Scale * 64.0f)
        return;
    if (DidIntroThisFrame != 0)
        return;

    if (Settings[3] != 0)
        limePlaySound(SFXHandle[0x68 / 4],
                      MusicVol[Settings[3]] / 100.0f, 1.0f, 0);

    GamePaused = 2;                     /* the moves list, not the menu */

    if (GameMode == 1) {
        sendPause(0);
        sendPause(GamePaused);
        sendPause(GamePaused);
    }

    EASDK_LogEventEnumEnumString(0xc360, 15, "INGAME MENU", 15, "MOVES INFO");
}


extern float *startTime;                /* pointer slot */
extern float  FrameCount;               /* 0x0014fa60 */
extern long  *readyToSync;              /* pointer slot */
extern long   LevelMusic[];             /* 0x0014f8c8 */
extern void  *GameFontP;                /* pointer slot -> 0x001abb98 */
extern float *limeFPSScaleFactorP;      /* pointer slot */

char *limeUC(const char *s);
long  usprintf(char *dst, const char *fmt, ...);

const char *UC(const char *s);
const char *GameTextNoHeader(long id);
long  syncGame(long frame);
void  enableHeartbeat(long n);
void  limePlayTune(const char *file, long vol, long arg);


/* -------------------------------------------------------- Task_MultiplayerSync
 *
 * armv7 0x00022514, 504 bytes.  **Complete.**
 *
 * The "waiting for the other player" screen. Draws the loading backdrop, one
 * centred line of text, and calls `syncGame(FrameCount)` every frame until it
 * returns 1.
 *
 * ### The text blinks on a 128-frame cycle
 *
 *      (FrameCount % 128) > 64  ?  <one string>  :  <the other>
 *
 * The modulo is signed and spelled out the way the compiler emits it
 * (`asr #31`, `lsr #25`, `add`, `and #0x7f`, `sub`) rather than as `% 128`.
 * Which pair of strings is used depends on `*startTime`:
 *
 *      startTime != 0    GameTextNoHeader(0x3b7)  alternating with `" "`
 *      startTime == 0    GameTextNoHeader(0x0e)   alternating with `" "`
 *
 * So it is a two-state blink between a message and a single space -- the
 * message flashes rather than animating, and the "%s" format is only there to
 * pass one or the other through `usprintf`.
 *
 * The result goes through `usprintf` into a stack buffer and then `limeUC` for
 * the BOM, which is three of the four functions in the UTF-16 chain used in one
 * line.
 *
 * ### FrameCount is frame-rate scaled, unlike BGSceneFrame
 *
 *      FrameCount += 1.0f / limeFPSScaleFactor
 *
 * -- the same `limeFPSScaleFactor` division `MaintainFESlide` uses, and the
 * opposite of `AnimateBG`, which adds a flat 1.0f. Two frame counters in the
 * same binary with different frame-rate behaviour; a port has to keep them
 * apart.
 *
 * ### On a successful sync
 *
 *      enableHeartbeat(10)
 *      CurrentTask = 6
 *      free the loading texture if it is still there
 *      if (Settings[2]) limePlayTune(LevelMusic[*LevelSelect],
 *                                    MusicVol[Settings[2]], 1)
 *
 * `_LevelMusic` is indexed by the selected stage, so each arena has its own
 * tune, and `Settings[2]` is the music volume index -- the same slot
 * `PlayFatalityVoice` reads. The volume is converted from the float table to an
 * int at the call.
 *
 * `FrameCount` still advances on the frame the sync succeeds.
 */
void Task_MultiplayerSync(void)
{
    char buf[0x100];
    const char *msg;
    long f;

    limeSet2DDrawing();
    limeEnableAlphaBlending_Basic();
    drawLoadingBackground();

    f = (long)FrameCount;

    if (*startTime != 0.0f)
        msg = (f % 128 > 64) ? GameTextNoHeader(0x3b7) : UC(" ");
    else
        msg = (f % 128 > 64) ? UC(" ") : GameTextNoHeader(0x0e);

    usprintf(buf, UC("%s"), msg);

    limeDrawFONT(GameFontP, limeUC(buf),
                 (float)(limeScreenWidth / 2),
                 (float)(limeScreenHeight / 2),
                 1, *FE_WidthScaleP, fontcol);

    *readyToSync = 1;

    if (syncGame((long)FrameCount) == 1) {
        enableHeartbeat(10);
        CurrentTask = 6;

        if (LoadingTexture != 0)
            limeDeleteTexture(LoadingTexture);

        if (Settings[2] != 0)
            limePlayTune((const char *)(uintptr_t)(unsigned long)
                             LevelMusic[*LevelSelectPtr],
                         (long)MusicVol[Settings[2]], 1);
    }

    FrameCount += 1.0f / *limeFPSScaleFactorP;
}


/* ### The sprite-animation frame record
 *
 * `DrawAnimAsSprite` indexes an animation table, takes the frame number out of
 * it, and reads a record at a **64-byte stride**. Eleven of its words are used:
 *
 *      [0]  x extent          [6]  texture index into the caller's array
 *      [1]  y extent          [7]  texture width   (the UV divisor)
 *      [2]  x extent 2        [8]  texture height  (the UV divisor)
 *      [3]  y extent 2        [9]  x anchor
 *      [4]  x origin          [10] y anchor
 *      [5]  y origin
 *
 * The names are what the arithmetic makes them; nothing in the symbol table
 * describes this record.
 */
#define ANIMSPRITE_STRIDE  64

long __modsi3(long a, long b);


/* ---------------------------------------------------------- DrawAnimAsSprite
 *
 * armv7 0x0001c8bc, 392 bytes.  **Complete**, and unusually opaque per byte --
 * fourteen arguments, four of which are only pinned down by what the arithmetic
 * does with them.
 *
 * ### Picking the frame
 *
 *      wrap != 0:   idx = first + ((last - first + 1) % abs(modulus))
 *      wrap == 0:   idx = first + min(last - first, modulus)
 *
 * The absolute value is `eor`/`sub` on the sign bit, and the modulo is a real
 * `__modsi3` call rather than a reciprocal multiply -- so the divisor is not a
 * constant here. **The two arms differ in kind, not just in clamping**: one
 * wraps and one saturates, and the caller's flag chooses between a looping
 * animation and one that holds its last frame.
 *
 * The frame number is `table[idx + 1]`, not `table[idx]`.
 *
 * ### The UVs are ratios against the record's own texture size
 *
 *      u0 =  record[0] / record[7]        v0 =  record[1] / record[8]
 *      u1 = -record[2] / record[7]        v1 =  record[3] / record[8]
 *
 * with **the mirrored path swapping which extent feeds u0 and u1**, and only
 * that. Everything else -- position, colour, the vertical pair -- is identical
 * between the two arms, so the whole mirror is one exchange of two divisions.
 *
 * The negation on `u1` is a `vneg.f32` on the unmirrored path only.
 *
 * ### The position
 *
 * The draw origin is built from the record's origin minus its anchor, with two
 * of the caller's scalars subtracted in:
 *
 *      x = record[4] - (record[9]  - arg4)
 *      y = record[5] - (record[10] - arg5)
 *
 * so the caller supplies a per-call offset that cancels part of the record's
 * own anchoring. Both are then scaled by the float in r2 and added to the
 * caller's x and y.
 *
 * Returns the frame index it used.
 */
long DrawAnimAsSprite(long x, long y, float scale, long ax,
                      long ay, long unused,
                      const char *frames, const long *table,
                      long mirror, long modulus,
                      long first, long last, long wrap,
                      long *colour)
{
    long n = last - first;
    long idx;
    const long *r;
    float ox, oy, tw, th;
    void *tex;

    (void)unused;

    if (wrap != 0) {
        long m = (modulus ^ (modulus >> 31)) - (modulus >> 31);   /* abs */
        idx = first + __modsi3(n + 1, m);
    } else {
        idx = first + ((n >= modulus) ? modulus : n);
    }

    r = (const long *)(frames + table[idx + 1] * ANIMSPRITE_STRIDE);

    ox = (float)(r[4] - (r[9]  - ax));
    oy = (float)(r[5] - (r[10] - ay));
    tw = (float)r[7];
    th = (float)r[8];
    tex = ((void *const *)frames)[r[6]];        /* the caller's texture array */

    limeDrawSprite((TEXTURE *)tex,
                   (float)x + ox * scale,
                   (float)y + oy * scale,
                   (float)r[0] * scale,
                   (float)r[1] * scale,
                   mirror ?  (float)r[0] / tw : (float)r[2] / tw,
                   (float)r[1] / th,
                   mirror ? -(float)r[2] / tw : (float)r[0] / tw,
                   (float)r[3] / th,
                   colour);

    return idx;
}


/* `_Level_Info` -- 0x0014e8d4, **244 bytes** a level. The compiler builds that
 * stride as `(n*64 - n*4 + n) << 2`, which is 61 << 2.
 *
 * Eight of its fields are established here, and they come in **two sets of
 * four** -- one per value of `_CurrentScene`:
 *
 *      scene 0            other scenes        what it is
 *      +0x24              +0x58               left player limit   ("lx2")
 *      +0x28              +0x5c               right player limit  ("rx2")
 *      +0x2c              +0x60               left camera margin
 *      +0x30              +0x64               right camera margin
 *
 * All eight are floats, and the debug sliders below name them. */
#define LEVELINFO_STRIDE  244

/* `Level_Info` is declared above as char[]; the eight fields here are floats
 * inside it. `G` is declared above as GAMESTATE *. */
extern long   CurrentScene;             /* 0x0014e29c */
extern long   blast_state;              /* 0x0014df94 */
extern float  CamLeftLimit;             /* 0x001f44a8 */
extern float  CamRightLimit;            /* 0x001f44ac */
extern long  *UpperLowerTxt;            /* 0x0015107c */
extern float  ShadowHeightFromGround;   /* 0x00171364 */

void ClearDebugWindow(void);
void LIME_printf(long level, const char *fmt, ...);
void LIME_Slider(long a, float *value, const char *label, float lo,
                 float hi, long step, long b);
void LightPlayers(void);


/* ------------------------------------------------------- MaintainLevelScenes
 *
 * armv7 0x0001d844, 832 bytes.  **Complete.**
 *
 * Applies the current level's camera and player limits, then puts a row of
 * debug sliders on screen for them.
 *
 * ### Every arena has two halves, and `_CurrentScene` picks one
 *
 * The limits are read from **two separate sets of four fields** in
 * `_Level_Info`, chosen by whether `_CurrentScene` is zero. The debug labels
 * for the second set are literally the first set's with a `2` appended --
 * `"lx2"`, `"rx2"`, `"left cam margin2"`, `"right cam margin2"`.
 *
 * And the function prints `_UpperLowerTxt[CurrentScene]`, which names the two
 * states outright. **So a stage is not one space: it is an upper and a lower,
 * with independent camera bounds**, and `_CurrentScene` is which one the fight
 * is in. That is the Pit, the Subway and the Bell Tower -- the arenas with a
 * drop -- and it is why a port that treats a stage as a single camera volume
 * will get the limits wrong on exactly those.
 *
 * ### How the limits are derived
 *
 *      RoundParam[0] = (long)Level_Info[lvl].leftPlayerLimit
 *      RoundParam[1] = (long)Level_Info[lvl].rightPlayerLimit
 *      CamLeftLimit  =  (float)RoundParam[0] + leftCamMargin
 *      CamRightLimit =  (float)RoundParam[1] - rightCamMargin
 *      G[0xb0]       = RoundParam[0]
 *      G[0xb4]       = RoundParam[1] - 399
 *
 * The player limits are **truncated to int and then widened back to float**
 * before the margins are added, so the camera bound is quantised to whole units
 * even though the source field is a float. That rounding is visible only at the
 * edges of a stage and is easy to lose.
 *
 * The **399** is `0x18c + 3` -- written as two subtractions, not one constant.
 *
 * ### `blast_state` gates the whole thing
 *
 *      1 or 2   reset: CurrentScene = 0, RoundParam[9] = 0,
 *               ShadowOffset = 0, and fall through
 *      3        blast_state++ and fall through
 *      other    straight to the limits
 *
 * So the "blast" -- whatever knocks a fighter between the two halves -- resets
 * the scene and the shadow origin on its way through, and state 3 self-advances
 * every frame it is in.
 *
 * ### The sliders shipped
 *
 * Five `LIME_Slider` calls with their ranges, all live in the retail binary:
 *
 *      left playerlimit           -1280 .. 1280, step 6
 *      right playerlimit          -1024 .. 1280
 *      left cam margin             -300 .. 300
 *      right cam margin            -300 .. 300
 *      Shadow HeightFrom Ground      -4 .. 300
 *
 * The last one is `_ShadowHeightFromGround`, the same global
 * `RenderAnimatedCharacter` adds to the flattened shadow's height -- so the
 * developers tuned it live, and its slider range says they expected it small
 * and possibly negative.
 *
 * Ends with `LightPlayers()`.
 */
void MaintainLevelScenes(void)
{
    long lvl;
    float *info;
    long *rp;
    long base;

    if (blast_state == 1 || blast_state == 2) {
        CurrentScene = 0;
        ((long *)RoundParam)[0x24 / 4] = 0;
        ShadowOffset = 0.0f;    /* an integer zero store; same bit pattern */
    } else if (blast_state == 3) {
        blast_state++;
    }

    lvl  = *LevelSelectPtr;
    info = (float *)&Level_Info[lvl * LEVELINFO_STRIDE];
    rp   = (long *)RoundParam;
    base = (CurrentScene == 0) ? 0x24 : 0x58;

    rp[0] = (long)info[base / 4];
    rp[1] = (long)info[(base + 4) / 4];

    CamLeftLimit  = (float)rp[0] + info[(base + 8) / 4];
    CamRightLimit = (float)rp[1] - info[(base + 12) / 4];

    ((long *)G)[0xb0 / 4] = rp[0];
    ((long *)G)[0xb4 / 4] = rp[1] - 0x18c - 3;   /* 399, as two subtractions */

    ClearDebugWindow();
    LIME_printf(0, "");
    LIME_printf(0, "", UpperLowerTxt[CurrentScene]);
    LIME_printf(0, "");

    if (CurrentScene == 0) {
        LIME_Slider(0, &info[0x24 / 4], "left playerlimit",
                    -1280.0f, 1280.0f, 6, 0);
        LIME_Slider(0, &info[0x28 / 4], "right playerlimit",
                    -1024.0f, 1280.0f, 6, 0);
        LIME_Slider(0, &info[0x2c / 4], "left cam margin",
                    -300.0f, 300.0f, 6, 0);
        LIME_Slider(0, &info[0x30 / 4], "right cam margin",
                    -300.0f, 300.0f, 6, 0);
    } else {
        LIME_Slider(0, &info[0x58 / 4], "lx2",  -1024.0f, 1280.0f, 6, 0);
        LIME_Slider(0, &info[0x5c / 4], "rx2",  -1024.0f, 1280.0f, 6, 0);
        LIME_Slider(0, &info[0x60 / 4], "left cam margin2",
                    -300.0f, 300.0f, 6, 0);
        LIME_Slider(0, &info[0x64 / 4], "right cam margin2",
                    -300.0f, 300.0f, 6, 0);
    }

    LIME_Slider(0, &ShadowHeightFromGround, "Shadow HeightFrom Ground",
                -4.0f, 300.0f, 6, 0);

    LightPlayers();
}


extern float SceneGroundOffset;         /* 0x0014df8c */
extern long  InitGroundOffset;          /* 0x0014df90 */
extern long  blast_player_height;       /* 0x0014df98 */
extern long  DoneSmashEffect;           /* 0x0010ded4 */
extern void *SmashThruScene;            /* 0x001aba74 */
extern float LastEye[3];                /* 0x001f4454 */
extern float LastAt[3];                 /* 0x001f4448 */
extern long  NewCam;                    /* 0x0014e1bc */
extern long  DoIntroFlag;               /* 0x0014e1c0 */
extern float GameTime;                  /* 0x0014fa58 */
extern float *m;                        /* pointer slot */
extern float *CameraLookAt;             /* pointer slot -> 0x0014fa80 */

long get_tsound(long id);

void limeMatrixCopy(const float *src, float *dst);
void LIME_PlayFBXAtPos(float *m, long a, void *scene, long b);
void LIMEDS_SetCameraOrientation(float ex, float ey, float ez,
                                 float tx, float ty, float tz,
                                 float ux, float uy, float uz);


/* ------------------------------------------------------------ SetToUseCamera
 *
 * armv7 0x00025d50, 900 bytes.  **Complete.**
 *
 * Places the camera. Takes an eye position and produces the eye, target and up
 * vectors for `LIMEDS_SetCameraOrientation` -- with the up vector a static
 * `(0, 0, 1)`, the same Z-up `HUDANIM_Render` uses.
 *
 * ### The camera lags by exactly one seventh
 *
 *      eye = (eye + LastEye * 6) / 7
 *      at  = (at  + LastAt  * 6) / 7
 *
 * Each frame it moves **one seventh of the way** to where it was asked to go.
 * That is the whole camera damping, and 6 and 7 are `vmov.f32` immediates, not
 * data -- there is no tuning global for it.
 *
 * It is not always on. The smoothing runs only when **all five** of these hold:
 *
 *      CurrentTask == 6            in the fight
 *      GamePaused == 0
 *      DoIntro == 0
 *      GameTime < 98.0
 *      blast_state is 0 or 4
 *
 * so the camera snaps rather than glides during the intro, while paused, in the
 * last stretch of the round, and through a stage transition. A port that damps
 * unconditionally gets a camera that drifts during the intro and refuses to cut
 * on a blast.
 *
 * `_LastEye` and `_LastAt` are written on **every** path, smoothed or not, so
 * the history is correct the moment smoothing turns back on.
 *
 * ### Two camera modes
 *
 *      NewCam == 0   at  = arg + (0, 0, SceneGroundOffset)
 *                    eye = at with Y reduced by exactly 1.0
 *
 *      NewCam != 0   at  = CameraLookAt + (0, 0, SceneGroundOffset)
 *                    eye = arg         + (0, 0, SceneGroundOffset)
 *
 * The old mode ignores `_CameraLookAt` entirely and pins the eye one unit
 * behind the target on Y; the new one takes both from globals. Both add the
 * same ground offset to Z only.
 *
 * ### SceneGroundOffset, and the smash
 *
 *      blast_state == 0    if RoundParam[0x30] != 0,
 *                          offset = -InitGroundOffset / WorldScaleAdjust
 *      blast_state 1 or 2  offset = (blast_player_height - player Y)
 *                                   / WorldScaleAdjust
 *      CurrentTask == 3    offset = 0, unconditionally
 *
 * The player Y is an `int16` read out of `_GameObjects` at `blast_state * 16 -
 * 0x0a`, so state 1 reads player one and state 2 reads player two -- the state
 * doubles as the player index.
 *
 * **The smash effect fires from inside the camera code.** Once the offset
 * reaches -1.5 or above and `_DoneSmashEffect` is clear, it copies the falling
 * player's matrix, zeroes its +0x38, plays `_SmashThruScene` through
 * `LIME_PlayFBXAtPos`, plays `get_tsound(0)` at the usual
 * `MusicVol[Settings[3]] / 100`, and sets the done flag. So the sound and the
 * particle burst for falling through a floor are triggered by the camera
 * noticing how far down the fighter is, not by the collision.
 *
 * Player two's matrix is at `Players + 0xb20 + 0x18` and player one's at
 * `Players + 0x548` -- 0xb20 being 0x548 + 0x5d8, which is neither the player
 * stride nor a round number. Transcribed as the two literals they are.
 */
void SetToUseCamera(const float *arg)
{
    float up[3];
    float eye[3], at[3];

    up[0] = 0.0f;                       /* C.217 */
    up[1] = 0.0f;
    up[2] = 1.0f;

    if (GameObjects != 0) {
        long st = blast_state;

        if (st == 0) {
            if (((const signed char *)RoundParam)[0x30] != 0)
                SceneGroundOffset = (float)(-InitGroundOffset)
                                    / WorldScaleAdjust;
        } else if (st == 1 || st == 2) {
            const short *o = (const short *)GameObjects;
            long h = blast_player_height - o[st * 8 - 5];

            SceneGroundOffset = (float)h / WorldScaleAdjust;

            if (SceneGroundOffset >= -1.5f && DoneSmashEffect == 0) {
                const char *pm = (st == 2) ? (Players + 0xb20 + 0x18)
                                           : (Players + 0x548);
                limeMatrixCopy((const float *)pm, m);
                m[0x38 / 4] = 0.0f;
                LIME_PlayFBXAtPos(m, 0, SmashThruScene, 1);

                if (Settings[3] != 0) {
                    long s = get_tsound(0);
                    if (s != -1)
                        limePlaySound(s, MusicVol[Settings[3]] / 100.0f,
                                      1.0f, 0);
                }
                DoneSmashEffect = 1;
            }
        }
    }

    if (CurrentTask == 3)
        SceneGroundOffset = 0.0f;

    if (NewCam == 0) {
        at[0]  = arg[0];
        at[1]  = arg[1];
        at[2]  = arg[2] + SceneGroundOffset;
        eye[0] = arg[0];
        eye[1] = arg[1] - 1.0f;         /* one unit behind on Y */
        eye[2] = at[2];
    } else {
        at[0]  = CameraLookAt[0];
        at[1]  = CameraLookAt[1];
        at[2]  = CameraLookAt[2] + SceneGroundOffset;
        eye[0] = arg[0];
        eye[1] = arg[1];
        eye[2] = arg[2] + SceneGroundOffset;

        if (CurrentTask == 6 && GamePaused == 0 && DoIntroFlag == 0
            && GameTime < 98.0f
            && (blast_state == 4 || blast_state == 0)) {
            at[0]  = (at[0]  + LastAt[0]  * 6.0f) / 7.0f;
            at[1]  = (at[1]  + LastAt[1]  * 6.0f) / 7.0f;
            at[2]  = (at[2]  + LastAt[2]  * 6.0f) / 7.0f;
            eye[0] = (eye[0] + LastEye[0] * 6.0f) / 7.0f;
            eye[1] = (eye[1] + LastEye[1] * 6.0f) / 7.0f;
            eye[2] = (eye[2] + LastEye[2] * 6.0f) / 7.0f;
        }
    }

    LastEye[0] = eye[0];  LastEye[1] = eye[1];  LastEye[2] = eye[2];
    LastAt[0]  = at[0];   LastAt[1]  = at[1];   LastAt[2]  = at[2];

    LIMEDS_SetCameraOrientation(eye[0], eye[1], eye[2],
                                at[0],  at[1],  at[2],
                                up[0],  up[1],  up[2]);
}


extern float *StaticMeshAmbient;        /* pointer slot -> 0x002bfe74 */
extern void  *WhiteTexture;             /* 0x001ab998 */

float fabsf(float x);

/* Fifteen slots, not two: this loop walks `_Players` fifteen times at the
 * 0x5f0 stride. The compiler spells that stride as `(i*128 - i*32 - i) << 4`,
 * which is 95 << 4 = 1520 = 0x5f0 -- a third independent confirmation. */
#define PLAYER_SLOTS  15


/* ------------------------------------------------------------- LightPlayers
 *
 * armv7 0x0001bfe4, 1000 bytes.  **Complete.**
 *
 * Sets each player slot's light position and brightness, and publishes the
 * ambient for static meshes. Called at the end of `MaintainLevelScenes`.
 *
 * ### The light position comes from the level, per scene
 *
 *      CurrentScene == 0   Level_Info[lvl] + 0x00, 0x04, 0x08
 *      otherwise           Level_Info[lvl] + 0x34, 0x38, 0x3c
 *
 * -- a **third** pair of per-scene fields in that table, on top of the two
 * camera sets `MaintainLevelScenes` established. So the upper and lower halves
 * of an arena have independent lighting as well as independent camera bounds.
 *
 * The three components are copied into the player at +0x5d8, +0x5dc and +0x5e0,
 * and the same three multiplied by **255.0** become `_StaticMeshAmbient`.
 *
 * ### Four levels get distance-based brightness, and no two the same way
 *
 * Brightness starts at 1.0 in `p[0x5d4]` and four stages override it from the
 * fighter's Z (`p[8]`), each with its own reference height, falloff and step
 * count. All four floor at **0.7** and clamp at 1.0:
 *
 *      level 1   b = 1 + |z - 183/scale| / -10       one sample
 *      level 8   b = 1 + |z - 120/scale| / -11       one sample
 *      level 5   four samples from -630/scale, stepping 480/scale,
 *                b = 1 + |z - h| * -0.5, taking the BRIGHTEST
 *      level 4   scene 1: five samples from -550/scale, stepping 330/scale,
 *                         b = 1 + |z - h| / -3.5, brightest wins
 *                scene 0: falls into level 5's four-sample form
 *
 * The multi-sample cases are **lamps in a row**: each iteration measures the
 * distance to one light and keeps the largest brightness, which is why the
 * comparison is `if (candidate > current)` and not an accumulation. Level 4's
 * upper and lower halves have different numbers of lamps -- five and four.
 *
 * All the falloff arithmetic is done in **double** and narrowed only when
 * stored, including the `-0.5`, `-3.5`, `-10` and `-11` which are `vmov.f64`
 * immediates rather than pool constants.
 *
 * ### Per-slot texture selection
 *
 * Four flags on the player pick which texture goes into `p[0x528]`:
 *
 *      +0x530 non-null   that texture directly, and p[0x52c] = anim[0x28]
 *      +0x538 set        anim[0x1c], and all four corners set to 1.0
 *      +0x53c set        `_WhiteTexture`, corners to 1.0
 *      +0x534 set        anim[0x18], corners to 1.0
 *
 * They are tested in that order and each can overwrite the last, so the final
 * texture is whichever of the four flags is set **latest in the sequence**, not
 * the first one found.
 *
 * ### One slot is skipped by identity
 *
 * When `CurrentScene` is non-zero and the slot is index 0, it compares a signed
 * byte at `GameObjects + 0x0c` against the same byte at `GameObjects + 0x1c`;
 * equal means the two fighters are the same object and the lighting for that
 * slot is derived from `Players[0].anim[8]` instead. A mirror-match guard, in
 * the lighting.
 */
void LightPlayers(void)
{
    long lvl = *LevelSelectPtr;
    long scene = CurrentScene;
    float ref1 = 183.0f / WorldScaleAdjust;
    float ref8 = 120.0f / WorldScaleAdjust;
    char *p = Players;
    long i;

    for (i = 0; i < PLAYER_SLOTS; i++, p += 0x5f0) {
        float *bright = (float *)(p + 0x5d4);
        float *lp     = (float *)(p + 0x5d8);
        const float *src;
        float z = ((const float *)p)[2];
        long k;

        *bright = 1.0f;

        if (lvl == 1) {
            double b = 1.0 + (double)fabsf(z - ref1) / -10.0;
            *bright = 0.7f;
            if (b > 0.7)
                *bright = (b > 1.0) ? 1.0f : (float)b;
        } else if (lvl == 8) {
            double b = 1.0 + (double)fabsf(z - ref8) / -11.0;
            *bright = 0.7f;
            if (b > 0.7)
                *bright = (b > 1.0) ? 1.0f : (float)b;
        } else if (lvl == 4 && scene == 1) {
            float h = -550.0f / WorldScaleAdjust;
            *bright = 0.7f;
            for (k = 0; k < 5; k++, h += 330.0f / WorldScaleAdjust) {
                double b = 1.0 + (double)fabsf(z - h) / -3.5;
                if ((double)*bright < b)
                    *bright = (float)b;
            }
            if (*bright > 1.0f)
                *bright = 1.0f;
        } else if (lvl == 5 || (lvl == 4 && scene == 0)) {
            float h = -630.0f / WorldScaleAdjust;
            *bright = 0.7f;
            for (k = 0; k < 4; k++, h += 480.0f / WorldScaleAdjust) {
                double b = 1.0 + (double)fabsf(z - h) * -0.5;
                if ((double)*bright < b)
                    *bright = (float)b;
            }
            if (*bright > 1.0f)
                *bright = 1.0f;
        }

        src = (const float *)&Level_Info[lvl * LEVELINFO_STRIDE
                                         + (scene != 0 ? 0x34 : 0x00)];
        lp[0] = src[0];
        lp[1] = src[1];
        lp[2] = src[2];

        StaticMeshAmbient[0] = lp[0] * 255.0f;
        StaticMeshAmbient[1] = lp[1] * 255.0f;
        StaticMeshAmbient[2] = lp[2] * 255.0f;

        /* the four texture flags, in order, each able to override the last */
        {
            long *pw = (long *)p;
            const long *anim = (const long *)(uintptr_t)
                               (unsigned long)pw[1];

            if (anim != 0 && pw[0x530 / 4] != 0) {
                pw[0x528 / 4] = pw[0x530 / 4];
                pw[0x52c / 4] = anim[0x28 / 4];
            }
            if (pw[0x538 / 4] != 0) {
                *bright = 1.0f;
                if (anim != 0)
                    pw[0x528 / 4] = anim[0x1c / 4];
            }
            if (pw[0x53c / 4] != 0) {
                *bright = 1.0f;
                if (anim != 0)
                    pw[0x528 / 4] = (long)(uintptr_t)WhiteTexture;
            }
            if (pw[0x534 / 4] != 0) {
                *bright = 1.0f;
                if (anim != 0)
                    pw[0x528 / 4] = anim[0x18 / 4];
            }
        }
    }
}


/* `_ButtonsPos` 0x001f4144 and `_ButtonsPosP2` 0x001f41bc, **20 bytes** an
 * entry, six entries each:
 *
 *      +0x00  long  x
 *      +0x04  long  y
 *      +0x08, +0x0c  not read here
 *      +0x10  long  button index, or -1 for an unused slot
 */
#define BUTTONPOS_STRIDE  20
#define BUTTON_SLOTS      6
#define TOUCH_SLOTS_RC    10

extern long ButtonsPos[];               /* 0x001f4144 */
extern long ButtonsPosP2[];             /* 0x001f41bc */
extern long ButtonStates[7];            /* 0x0014fef4 */
extern long LastButtonStates[7];        /* 0x0014fed8 */
extern long ButtonStatesP2[7];          /* 0x0014ff2c */
extern long LastButtonStatesP2[7];      /* 0x0014ff10 */
extern long JoystickStateP2;            /* 0x0014fecc */


/* -------------------------------------------------------------- ReadControls
 *
 * armv7 0x000262f0, 740 bytes.  **Complete.**
 *
 * Turns the raw touch slots into dial and button state, once per frame, for one
 * player or two.
 *
 *      P2Controls = 0
 *      if (GameMode == 6) P2Controls = GameMode - 5      <- 1, written as 6-5
 *
 * so two-player controls are on exactly in mode 6, and the 1 is computed from
 * the mode rather than assigned.
 *
 * ### Each touch claims the NEAREST button, not every button it overlaps
 *
 * For each of the ten touch slots it measures the distance to all six button
 * positions, keeps the closest one inside a radius, and sets that button's
 * state. A slot whose X is -1 is skipped, and a button whose index is -1 is
 * skipped -- so an unused layout slot costs nothing.
 *
 * The search starts from **999.0f**, which is the "no button yet" sentinel; a
 * touch further than that from everything would be missed, and nothing on a
 * 480-wide screen can be.
 *
 * Because it is nearest-wins rather than any-overlap, **two adjacent buttons
 * can never both fire from one finger** -- but two fingers can each claim the
 * same button, and nothing here prevents that.
 *
 * ### The two players get different hit radii, and one is unscaled
 *
 *      player 1, single-player   (float)(long)FE_W(40.0f)   truncated to int
 *      player 1, two-player      FE_W(40.0f)                not truncated
 *      player 2                  52.0f                      no scaler at all
 *
 * Three behaviours from one function. The truncation is a real `vcvt.s32.f32`
 * followed by `vcvt.f32.s32` on the P1 path and it happens **only** when
 * `P2Controls` is clear, so turning on two-player controls silently changes
 * player one's button radius by up to a pixel.
 *
 * The flat 52 for player two is the fourth place in this tree where one side of
 * a pair is scaled and the other is not -- see issue #22 -- and the second in
 * the input path, after `CheckLeftDial`'s unscaled P2 dial radius. On the
 * original 480x320 screen `FE_W(40)` is 40 and 52 is simply a bigger target;
 * anywhere else they diverge.
 *
 * ### The state rings
 *
 * Before the scan, each of the seven button slots is copied into
 * `LastButtonStates` and then cleared, so a button not touched this frame is
 * released rather than sticky, and the previous frame is preserved for edge
 * detection. Slot 0 is done outside the loop, which then runs from 4 to 0x1c --
 * the same peeled first iteration `InitGameEvents` and `InitKodeScreen` use.
 *
 * `JoystickState` is `CheckLeftDial(player) + 1`, so the eight-way result 0..7
 * becomes 1..8 -- exactly the range `GetReal6ButtonJoyBits` tests, with 0 left
 * free for "no touch on the dial".
 */
void ReadControls(void)
{
    long t, b, i;

    P2Controls = 0;
    if (GameMode == 6)
        P2Controls = GameMode - 5;

    JoystickState = CheckLeftDial(0) + 1;

    LastButtonStates[0] = ButtonStates[0];
    ButtonStates[0] = 0;
    for (i = 1; i < 7; i++) {
        LastButtonStates[i] = ButtonStates[i];
        ButtonStates[i] = 0;
    }

    for (t = 0; t < TOUCH_SLOTS_RC; t++) {
        float best = 999.0f;
        long nearest = -1;

        for (b = 0; b < BUTTON_SLOTS; b++) {
            const long *e = &ButtonsPos[b * (BUTTONPOS_STRIDE / 4)];
            float dx, dy, d, radius;

            if (limeTouchScreenX[t] == -1.0f)
                continue;
            if (e[4] == -1)
                continue;

            dx = (float)e[0] - limeTouchScreenX[t];
            dy = limeTouchScreenY[t] - (float)e[1];
            d  = sqrtf(dx * dx + dy * dy);

            radius = (float)FE_W(40.0f);
            if (P2Controls == 0)
                radius = (float)(long)radius;   /* truncated, only here */

            if (d >= radius)
                continue;
            if (best > d) {
                best = d;
                nearest = b;
            }
        }

        if (nearest != -1)
            ButtonStates[ButtonsPos[nearest * (BUTTONPOS_STRIDE / 4) + 4]] = 1;
    }

    if (P2Controls == 0)
        return;

    JoystickStateP2 = CheckLeftDial(1) + 1;

    LastButtonStatesP2[0] = ButtonStatesP2[0];
    ButtonStatesP2[0] = 0;
    for (i = 1; i < 7; i++) {
        LastButtonStatesP2[i] = ButtonStatesP2[i];
        ButtonStatesP2[i] = 0;
    }

    for (t = 0; t < TOUCH_SLOTS_RC; t++) {
        float best = 999.0f;
        long nearest = -1;

        for (b = 0; b < BUTTON_SLOTS; b++) {
            const long *e = &ButtonsPosP2[b * (BUTTONPOS_STRIDE / 4)];
            float dx, dy, d;

            if (limeTouchScreenX[t] == -1.0f)
                continue;
            if (e[4] == -1)
                continue;

            dx = (float)e[0] - limeTouchScreenX[t];
            dy = limeTouchScreenY[t] - (float)e[1];
            d  = sqrtf(dx * dx + dy * dy);

            if (d >= 52.0f)             /* a flat 52, never scaled */
                continue;
            if (d < best) {
                best = d;
                nearest = b;
            }
        }

        if (nearest != -1)
            ButtonStatesP2[ButtonsPosP2[nearest * (BUTTONPOS_STRIDE / 4) + 4]]
                = 1;
    }
}


extern long ButtonsPos4[];              /* 0x0015012c */
extern long ButtonsPos5[];              /* 0x001501a4 */
extern long ButtonsPos6[];              /* 0x0015021c */
extern long JoystickStatePosXv;         /* 0x0014fec0 */
extern long JoystickStatePosYv;         /* 0x0014fec4 */
extern float JSIZE;                     /* 0x0014e1dc = 64.0 */


/* -------------------------------------------------------- DrawControlsPreview
 *
 * armv7 0x0001ddc0, 732 bytes.  **Complete.**
 *
 * Draws the on-screen controls at half size, offset by the caller's origin.
 *
 * ### It rebuilds the live layout from the scheme every frame
 *
 *      Settings[4] == 4  ->  copy ButtonsPos4 into ButtonsPos
 *                  == 5  ->  ButtonsPos5
 *                  == 6  ->  ButtonsPos6
 *
 * all 6 entries x 5 words, and the copy is written as a **transposed** double
 * loop -- outer over the five words, inner over the six entries -- so it walks
 * the destination in 0x14 steps five separate times rather than once in
 * sequence. Same bytes, five passes.
 *
 * ### The dial position is derived, not stored
 *
 *      JoystickStatePosX = (long)JSIZE
 *      JoystickStatePosY = (long)(limeScreenHeight - JSIZE)
 *
 * so the dial sits `JSIZE` in from the left and `JSIZE` up from the bottom --
 * one constant placing it in the corner, and `_JSIZE` is 64.0 in the shipped
 * data. `CheckLeftDial` then hit-tests against this position.
 *
 * ### Opacity comes from Settings[6]
 *
 *      0 -> 0.5      1 -> 0.75      2 -> 1.0
 *
 * Three steps, written as two `it eq` blocks with 0.5 as the fall-through, so
 * any other value also gives 0.5.
 *
 * ### The atlas: pressed is the EVEN column
 *
 *      u0 = ((glyph & 3) * 2 + (pressed ? 0 : 1)) * 0.125
 *      v0 = (glyph / 4) * 0.25
 *      u1 = 0.125      v1 = 0.25
 *
 * Eight columns by four rows, and each button occupies **two adjacent cells** --
 * pressed on the even column, released on the odd one. The `+ 1` is the only
 * difference between the two draw paths, which the compiler emitted as two
 * near-identical copies of the whole call.
 *
 * The glyph id is `+0x0c` of the entry; the button index used for
 * `ButtonStates` is `+0x10`. They are separate fields, so the same artwork can
 * serve two logical buttons.
 *
 * ### Everything is halved
 *
 *      x = FE_X(originX) + (entry.x - entry.size / 2) * 0.5
 *      y = FE_Y(originY) + (entry.y - entry.size / 2) * 0.5
 *      w = h = entry.size * 0.5
 *
 * The `size / 2` centring uses the signed `(n + (n >>> 31)) >> 1` shape, and the
 * outer 0.5 is what makes this a preview rather than the live control.
 */
void DrawControlsPreview(long originX, long originY)
{
    float colour[4];
    float alpha;
    long i, k;
    const long *src;

    colour[0] = colour[1] = colour[2] = colour[3] = 1.0f;   /* C.126 */

    src = (Settings[4] == 4) ? ButtonsPos4
        : (Settings[4] == 5) ? ButtonsPos5
        : (Settings[4] == 6) ? ButtonsPos6 : 0;

    if (src != 0) {
        for (k = 0; k < 5; k++)                 /* transposed on purpose */
            for (i = 0; i < 6; i++)
                ButtonsPos[i * 5 + k] = src[i * 5 + k];
    }

    alpha = (Settings[6] == 1) ? 0.75f
          : (Settings[6] == 2) ? 1.0f : 0.5f;

    JoystickStatePosXv = (long)JSIZE;
    JoystickStatePosYv = (long)((float)limeScreenHeight - JSIZE);

    for (i = 0; i < 6; i++) {
        const long *e = &ButtonsPos[i * 5];
        long idx = e[4];
        long glyph, col;
        float x, y, wh;

        if (idx == -1)
            continue;

        glyph = e[3];
        col   = (glyph & 3) * 2;
        if (ButtonStates[idx] == 0)
            col += 1;                           /* released is the odd cell */

        x  = (float)FE_X((float)originX)
             + (float)(e[0] - ((e[2] + ((unsigned long)e[2] >> 31)) >> 1))
               * 0.5f;
        y  = (float)FE_Y((float)originY)
             + (float)(e[1] - ((e[2] + ((unsigned long)e[2] >> 31)) >> 1))
               * 0.5f;
        wh = (float)e[2] * 0.5f;

        colour[3] = alpha;

        limeDrawSprite((TEXTURE *)*ButtonsTPage, x, y, wh, wh,
                       (float)((double)col * 0.125),
                       (float)((double)(glyph / 4) * 0.25),
                       0.125f, 0.25f, (long *)colour);
    }
}


extern long  *JustWon;                  /* pointer slot */
extern long   winningStryk;             /* 0x0014dffc */
extern long  *feedPosted;               /* pointer slot */
extern long   defeatedBySK;             /* 0x0010deb4 */
extern long   lastWinStreak;            /* 0x0014e1ac */
extern long   points;                   /* 0x0014e1b0 */
extern float  timeInGame;               /* 0x0014e1e0 */
extern float *KontinueTime;             /* pointer slot -> 0x000ff960 -- a FLOAT.
                                         * The store is a raw word from the pool
                                         * (0x419ffdf4), which says nothing on its
                                         * own; the countdown that reads it is what
                                         * types it. */
extern float *exitTimeout;              /* pointer slot -> 0x00182c80 -- also a
                                         * FLOAT: the value stored is 0x44160000,
                                         * which is 600.0f, not the integer 600.
                                         * This header always said 600.0f; the C
                                         * under it stored 600 and was wrong. */
extern long   WaitForOpponent;          /* 0x0010df18 */
extern long   FadeMusicOut;             /* 0x0010dee8 */
/* Both are pointer slots to arrays of C strings. */
extern const char **DestinyNames;
extern const char **DestinyNamesLoss;
extern long  *DisplaySurvivalStage, *SurvivalStageP;
extern long  *FE_TaskStackPointer, *FE_CurrentTask;

extern long Player1Wins;                /* 0x0014e204 */

const char *getStageName(long stage);
void PushFETask(int task);
void UpdateStats(void);
int  achievementsUnlock(int id);
void sendQuit(void);
void Write_AchievementsData(void);
/* The last argument is a LONG, not a float. The call site stores it with
 * `vstr s14, [sp]` after a `vcvt.s32.f32`, so the word on the stack is an
 * integer that happens to have been computed in a VFP register; the callee
 * loads it with a plain `ldr` and hands it to `numberWithInt:`. Typed float,
 * the clean C converted the integer back to a float and logged nonsense. */
void EASDK_LogEventEnumEnumStringNum(long id, long a, const char *s,
                                     long b, long n);


/* ---------------------------------------------------------------- QuitAsLose
 *
 * armv7 0x000269d0, 692 bytes.  **Complete.**
 *
 * The lose path out of a fight. Clears `*JustWon`, logs the arcade case, then
 * does something different for every game mode.
 *
 * ### Three losses to character 25 unlock achievement 15
 *
 *      if (PLAYER2MODEL == 25) {
 *          if (++defeatedBySK > 2) achievementsUnlock(15);
 *      } else {
 *          defeatedBySK = 0;
 *      }
 *
 * The counter is **reset by any loss to anyone else**, so it is three
 * consecutive losses, not three in total. Character 25 is one of the two fixed
 * bosses `PopulateTower` puts at the end of every ladder, and `defeatedBySK`
 * names it: Shao Kahn.
 *
 * ### Per-mode exits
 *
 *      mode 0 (arcade)  winStreak -> lastWinStreak and points, then 0
 *                       KontinueTime = 19.999001f
 *                       PushFETask(0x1d), Player1Wins = 0, UpdateStats()
 *      mode 1 (versus)  PushFETask(0x28), WaitForOpponent = 0,
 *                       Player1Wins = 0, sendQuit(); UpdateStats() only if
 *                       the fade had not already started
 *      mode 2           nothing but the fade
 *      mode 3           PushFETask(0x27), exitTimeout = 600.0f
 *      mode 4 (survival) streak saved as above, PushFETask(0x26),
 *                       DisplaySurvivalStage = SurvivalStage, SurvivalStage = 0,
 *                       Write_SaveData(), exitTimeout = 600.0f
 *      mode 5           FE_TaskStackPointer = 0, FE_CurrentTask = 0,
 *                       Player1Wins = 0, UpdateStats()
 *      mode 6           nothing but the fade
 *
 * Every one of them sets `FE_FadeAdd` to **-0.03333333507180214**, the same
 * literal the whole front end uses to start a fade out.
 *
 * **`KontinueTime` gets 19.999001f -- bit for bit the same odd literal
 * `InitKodeScreen` writes into `_KodeTime`.** Two unrelated countdowns sharing
 * one value that is neither 20 nor anything derived; whatever produced it was
 * used twice.
 *
 * Mode 5 is the only one that empties the front-end task stack rather than
 * pushing onto it.
 *
 * ### The arcade logging happens before the switch
 *
 *      EASDK_LogEventEnumEnumString(0x754e, 15, DestinyNamesLoss[Destiny],
 *                                   15, getStageName(Stage))
 *      EASDK_LogEventEnumEnumStringNum(0x754f, 15, DestinyNames[Destiny],
 *                                      7, (long)timeInGame)
 *      printf(..., (double)timeInGame)
 *
 * 0x754e and 0x754f are 30030 and 30031. `timeInGame` is truncated to an int
 * for the event and passed as a **double** to the printf on the very next line,
 * so the log and the analytics disagree about its precision.
 *
 * Ends with `Write_AchievementsData()` and, if `Settings[2]` is set,
 * `FadeMusicOut = 1`.
 */
void QuitAsLose(void)
{
    *JustWon = 0;

    if (GameMode == 0) {
        EASDK_LogEventEnumEnumString(0x754e, 15,
                DestinyNamesLoss[Destiny],
                15, getStageName(Stage));
        EASDK_LogEventEnumEnumStringNum(0x754f, 15,
                DestinyNames[Destiny],
                7, (long)timeInGame);
        printf("%f", (double)timeInGame);
    }

    winningStryk = 0;
    *feedPosted  = 0;

    switch (GameMode) {
    case 1:
        PushFETask(0x28);
        WaitForOpponent = 0;
        Player1Wins = 0;
        sendQuit();
        if (*FE_FadeAddP == 0.0f)
            UpdateStats();
        *FE_FadeAddP = -0.033333335f;
        break;

    case 2:
    case 6:
        *FE_FadeAddP = -0.033333335f;
        break;

    case 3:
        *FE_FadeAddP = -0.033333335f;
        PushFETask(0x27);
        *exitTimeout = 600.0f;
        break;

    case 4:
        lastWinStreak = winStreak;
        winStreak     = 0;
        points        = lastWinStreak;
        *FE_FadeAddP    = -0.033333335f;
        PushFETask(0x26);
        *DisplaySurvivalStage = *SurvivalStageP;
        *SurvivalStageP       = 0;
        Write_SaveData();
        *exitTimeout = 600.0f;
        break;

    case 5:
        *FE_FadeAddP = -0.033333335f;
        *FE_TaskStackPointer = 0;
        *FE_CurrentTask      = 0;
        Player1Wins = 0;
        UpdateStats();
        break;

    default:                            /* arcade */
        if (*PLAYER2MODEL == 25) {
            defeatedBySK++;
            if (defeatedBySK > 2)
                achievementsUnlock(15);
        } else {
            defeatedBySK = 0;
        }
        lastWinStreak = winStreak;
        winStreak     = 0;
        points        = lastWinStreak;
        *FE_FadeAddP    = -0.033333335f;
        *KontinueTime = 19.999001f;     /* the same odd literal InitKodeScreen
                                         * writes into KodeTime */
        PushFETask(0x1d);
        Player1Wins = 0;
        UpdateStats();
        break;
    }

    Write_AchievementsData();
    if (Settings[2] != 0)
        FadeMusicOut = 1;
}


extern float IntroPlayer1PosX;          /* 0x0014f930 */
extern float IntroPlayer1PosZ;          /* 0x0014f934 */
extern float PlayerSize;                /* 0x00150cc4 */

void glTranslatef(float x, float y, float z);
void glRotatef(float a, float x, float y, float z);


/* --------------------------------------------------- RenderIntroCharacterPlayer
 *
 * armv7 0x00021638, 824 bytes.  **Complete.**
 *
 * Draws the two fighters during the intro, each with its attached objects.
 *
 *      glTranslatef(IntroPlayer1PosX, IntroPlayer1PosZ, SceneGroundOffset)
 *      glRotatef(90, 1, 0, 0)
 *      glScalef(PlayerSize, PlayerSize, PlayerSize)
 *
 * `_PlayerSize` is the same 0.01015625 global `runtime/demo.c` uses for the
 * fighter-to-stage ratio, and the 90-degree X rotation is the same one
 * `HUDANIM_Render` applies -- the Z-up world meeting a Y-up mesh.
 *
 * ### Character 24 is drawn mirrored
 *
 *      if (anim->characterId == 24) {
 *          glScalef(-scale, scale, scale);
 *          glCullFace(GL_FRONT);
 *      } else {
 *          glScalef(scale, scale, scale);
 *          glCullFace(GL_BACK);
 *      }
 *
 * The negation is `eor r0, r1, #0x80000000` and the cull flip goes with it --
 * the **fourth** place in this tree with that exact pairing, after
 * `RenderAMesh`, `RenderPlayer` and `RenderExtras`. Character 24 is one of the
 * two fixed bosses `PopulateTower` appends to every ladder, and it is the only
 * character with a hardcoded mirror in the intro.
 *
 * The per-character scale comes from `PlayerDefs[id] + 0x04`, so it multiplies
 * the global `PlayerSize` already on the matrix.
 *
 * ### Which fighters appear depends on IntroCamCount
 *
 *      player 1 drawn when  IntroCamCount > 1
 *      player 2 drawn when  IntroCamCount > 2 || IntroCamCount == 0
 *
 * so at 0 only player two, at 1 neither, at 2 only player one, and above that
 * both. `AnimateIntroCharacterPlayers1Frame` uses the same global to choose
 * which fighter's animation advances -- the two halves of one intro
 * choreography.
 *
 * ### Player two's translate is divided by the scale
 *
 *      glTranslatef(-IntroPlayer1PosX / PlayerSize,
 *                   -IntroPlayer1PosZ / PlayerSize, ...)
 *
 * because `glScalef(PlayerSize, ...)` is already on the matrix stack, so the
 * offset has to be pre-divided to land in the same units. Both components are
 * negated first: player two is placed by undoing player one's offset and going
 * the other way.
 *
 * Each fighter is followed by the same attachment pass `RenderPlayer` uses --
 * `memcpy(AttachTransforms, *MatrixPalette2, 0x1c20)` then
 * `LIME_RenderScene(6, ...)` -- so the attachment is posed against a snapshot
 * taken after the body was drawn.
 *
 * `p[0x534]` is cleared before each draw, and `p[0x528]` is set from
 * `anim[0x14]`, overriding whatever `LightPlayers` chose.
 */
void RenderIntroCharacterPlayer(void)
{
    long *p0 = (long *)Players;
    long *p1 = (long *)(Players + 0x5f0);

    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();

    glTranslatef(IntroPlayer1PosX, IntroPlayer1PosZ, SceneGroundOffset);
    glRotatef(90.0f, 1.0f, 0.0f, 0.0f);
    glScalef(PlayerSize, PlayerSize, PlayerSize);
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);

    if (IntroCamCount > 1 && p0[1] != 0) {
        const long *anim = (const long *)(uintptr_t)(unsigned long) p0[1];
        const float *def = (const float *)(PlayerDefs
                                           + p0[0] * PLAYERDEF_STRIDE);
        float s = def[1];

        glEnable(GL_CULL_FACE);

        if (anim[2] == 24) {            /* the hardcoded mirror */
            glScalef(-s, s, s);
            glCullFace(GL_FRONT);
        } else {
            glScalef(s, s, s);
            glCullFace(GL_BACK);
        }

        p0[0x534 / 4] = 0;
        p0[0x528 / 4] = anim[0x14 / 4];

        RenderAnimatedCharacter(0, (ANIMATEDCHARACTER *)anim,
                                p0[0x51c / 4], p0[0x520 / 4],
                                ((float *)p0)[0x524 / 4],
                                0.0f, 1.0f,
                                (limeVECTOR3 *)&p0[0x5d8 / 4],
                                (void *)(uintptr_t)(unsigned long)
                                    p0[0x528 / 4], 1);

        memcpy(AttachTransforms, *MatrixPalette2, 0x1c20);
        LIME_RenderScene(6,
                         (void *)(uintptr_t)(unsigned long) anim[0x10 / 4],
                         p0[0x51c / 4], p0[0x520 / 4],
                         ((float *)p0)[0x524 / 4], 0, 0, 0,
                         (void *)(uintptr_t)(unsigned long) p0[0x528 / 4],
                         p0[0x52c / 4], AttachTransforms);
    }

    if ((IntroCamCount > 2 || IntroCamCount == 0) && p1[1] != 0) {
        const long *anim = (const long *)(uintptr_t)(unsigned long) p1[1];
        const float *def = (const float *)(PlayerDefs
                                           + p1[0] * PLAYERDEF_STRIDE);
        float s = def[1];

        /* pre-divided: PlayerSize is already on the matrix */
        glTranslatef(-IntroPlayer1PosX / PlayerSize,
                     -IntroPlayer1PosZ / PlayerSize, 0.0f);

        if (anim[2] == 24) {
            glScalef(-s, s, s);
            glCullFace(GL_FRONT);
        } else {
            glScalef(s, s, s);
            glCullFace(GL_BACK);
        }

        p1[0x534 / 4] = 0;
        p1[0x528 / 4] = anim[0x14 / 4];

        RenderAnimatedCharacter(0, (ANIMATEDCHARACTER *)anim,
                                p1[0x51c / 4], p1[0x520 / 4],
                                ((float *)p1)[0x524 / 4],
                                0.0f, 1.0f,
                                (limeVECTOR3 *)&p1[0x5d8 / 4],
                                (void *)(uintptr_t)(unsigned long)
                                    p1[0x528 / 4], 1);

        memcpy(AttachTransforms, *MatrixPalette2, 0x1c20);
        LIME_RenderScene(6,
                         (void *)(uintptr_t)(unsigned long) anim[0x10 / 4],
                         p1[0x51c / 4], p1[0x520 / 4],
                         ((float *)p1)[0x524 / 4], 0, 0, 0,
                         (void *)(uintptr_t)(unsigned long) p1[0x528 / 4],
                         p1[0x52c / 4], AttachTransforms);
    }

    glPopMatrix();
}

/* ------------------------------------------------- Task_LoadGeneralData
 *
 * armv7 0x00023910, 788 bytes.  **Complete.**
 *
 * The boot loader for everything that is not a level: language, save data,
 * sound, the three fonts, the translated text, and the first task to run. It
 * is one straight line with two early-out branches parked at the end of the
 * function, so the ORDER below is the game's real start-up order and can be
 * read off directly.
 *
 * ## The language is chosen by whether EA shipped a terms-of-service URL
 *
 * `limeGetLanguage` fills `Language` from the device, and the very next thing
 * the function does is ask for the property `TOS_URL_<lang>`. If that property
 * is missing the code does `strcpy(Language, "EN")` and carries on. So the
 * list of languages the game supports is not a list anywhere in the code --
 * it is whichever `TOS_URL_*` keys exist in the property file. A device set to
 * a language EA never shipped legal text for falls back to English, and it
 * falls back BEFORE anything else reads `Language`, so the fallback also
 * chooses the font tables and the text file.
 *
 * `compareLanguages(1)` then saves the code and reports whether it differs
 * from the previous run. Only the changed path logs to EA's tracking; the
 * unchanged path just prints. Both converge on `InitAllGameData`.
 *
 * ## The game mutes its own music if the player is already playing some
 *
 *      if (limeCheckForUserMusic()) Settings[2] = 0;
 *
 * `Settings[2]` is the music volume index -- `FrontEnd.c` plays MainMenu.mp3
 * at `MusicVol[Settings[2]]`. Index 0 is the muted level. So a player who
 * started their own music before launching gets the game's soundtrack turned
 * off for them, once, at boot, and it is written into the settings rather
 * than applied as a temporary override: it survives into the next launch.
 *
 * ## The three fonts, and the two things done to each after loading
 *
 *      GameFont       MKFONT_0.PNG + MKFONT_1.PNG   mkfont_ipad.ft2  2048^2
 *      NameFont       NAMES_FONT.PNG                namefont.ft2      256^2
 *      CountDownFont  COUNTDOWNFONT.PNG             countdownfont.ft2 128^2
 *
 * Only the game font has a second atlas -- it is the one that has to carry a
 * translated character set. The other two pass NULL and limeCreateFONT skips
 * the second load.
 *
 * Each font then gets `spacing` and `fallbackAdvance` written by hand,
 * OVERWRITING what limeCreateFONT just put there (it sets spacing from its
 * own argument, which is 0 in all three calls, and fallbackAdvance to the
 * constant 8):
 *
 *      GameFont       spacing -4   fallbackAdvance 17
 *      NameFont       spacing -2   fallbackAdvance  6
 *      CountDownFont  spacing  0   fallbackAdvance 10
 *
 * Negative spacing is a kern-in: the game font pulls every character four
 * units back towards the previous one.
 *
 * ## mkunicode.txt REPLACES the game font's code table
 *
 * `limeCreateFONT` builds `codes`/`codesW` from the .ft2 file. This function
 * then loads `mkunicode.txt` and overwrites both, one glyph at a time, from a
 * file that is plain UTF-16LE: the loop starts at byte 2, which skips the BOM,
 * and reads two bytes per glyph. The wide table gets the whole code unit and
 * the byte table gets its low half.
 *
 * That is what makes a translated build possible without touching the .ft2:
 * the atlas keeps its glyph rectangles in file order and mkunicode.txt says
 * which Unicode character each rectangle is. Swap the text file and the same
 * atlas serves a different language.
 *
 * The name font goes the other way -- it has no unicode file, so its wide
 * table is built by widening its byte table, and the byte table is a constant
 * compiled into the binary: the digits, A-Z, a-z, and then
 * `-%:;@` a pound sign, `.,!?'&[]+/\"*()#<>~`.
 *
 * 87 characters and a terminator, memcpy'd as a fixed 0x58 bytes. See
 * docs/GAME-BUGS.md: the length is a literal, not the font's glyph count.
 *
 * ## The float that proves limeCreateFONT's signature
 *
 * The last argument is `0x3ea66666` for the game font and `0x3f800000` for the
 * other two -- 0.325f and 1.0f. Those are float literals, which is what fixed
 * `limeCreateFONT`'s last parameter from `int` to `float` in decomp/lime.
 *
 * ## Where the game goes next
 *
 *      NextTask        = 2
 *      FE_CurrentTask  = 0, or 0x24 when CheckForUnclaimedTreasure() is true
 *      CurrentTask     = 8
 *
 * so a player owed a treasure from a previous run is routed to front-end task
 * 0x24 instead of the main menu, before the menu has drawn once.
 *
 * ## The on-screen joystick is placed from the button size
 *
 *      JSIZE             = ButtonSize
 *      JoystickStatePosX = (int)ButtonSize
 *      JoystickStatePosY = (int)(limeScreenHeight - ButtonSize)
 *
 * One button-size in from the left and one up from the bottom -- the joystick
 * is anchored to the bottom-left corner with a margin equal to its own size,
 * and both coordinates are truncated to whole pixels. `ButtonSize` is a float
 * and the two positions are ints; the conversions are `vcvt.s32.f32`, so they
 * truncate rather than round.
 */

extern GAMEFONT GameFont;               /* 0x001abb98 */
extern GAMEFONT CountDownFont;          /* 0x001dbc50 */

extern float ButtonSize;                /* 0x0014ff48 */

void limeCreateFONT(const char *tex0, const char *tex1, const char *metrics,
                    GAMEFONT *font, int spacing, int height, int width,
                    int wide, float scale);
void limeGetLanguage(char *dst, int len);
const char *limeGetPropertyString(const char *key);
void limeInitSound(void);
int  limeCheckForUserMusic(void);
long limeLoadSound(const char *name);
void InitAllGameData(void);
void Load_Tower(void);
void Load_SettingsData(void);
void Load_PresetButtonData(void);
void Load_AchievementsData(void);
void Load_Stats(void);
void LoadTextData(const char *file);
void CheckAllUnicodeCharsUsed(void);

/* Five fixed arguments -- the callee reads r0..r3 and one stack word. Part of
 * the EA tracking family (LogEvent / LogEventEnumEnum / ...EnumEnumString),
 * all of which are stub territory for the port. The last argument is a
 * STRING: this call site passes 0 for it and says nothing, but
 * FE_Task_Main_Menu passes "OPTIONS", "PLAY" and friends. */
void EASDK_LogEvent(long id, long a, const char *s1, long b, const char *s2);

/* The name font's character set, 87 characters and a NUL. The 0xa3 is a pound
 * sign in Latin-1 -- the only non-ASCII code in the table, and the reason the
 * set is a byte array and not a plain C identifier-safe string. */
static const char NameFontCodes[] =
    "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "abcdefghijklmnopqrstuvwxyz"
    "-%:;@\xa3.,!?'&[]+/\\\"*()#<>~";

void Task_LoadGeneralData(void)
{
    char langbuf[30];                   /* sp+0x14 */
    char tosbuf[30];                    /* sp+0x32 */
    const uint8_t *unicode;
    int i;

    *limeDeferredDeviceSideways = 1;
    *limeDeviceSideways = 1;

    Task_LoadingScreen();
    if (LoadingTexture)
        limeDeleteTexture(LoadingTexture);

    limeGetLanguage(Language, 10);
    sprintf(tosbuf, "TOS_URL_%s", Language);
    if (limeGetPropertyString(tosbuf) == 0)
        strcpy(Language, "EN");         /* no legal text shipped: fall back */

    if (compareLanguages(1)) {
        printf("####################\n"
               "LANGUAGE CHANGED TO:%s\n"
               "####################", Language);
        EASDK_LogEvent(0xc35c, 15, Language, 0, 0);
    } else {
        puts("####################\n"
             "LANGUAGE NOT CHANGED\n"
             "####################");
    }

    InitAllGameData();
    Load_Tower();
    Load_SaveData();
    Load_SettingsData();
    Load_PresetButtonData();
    Load_AchievementsData();
    Load_Stats();

    limeInitSound();
    if (limeCheckForUserMusic())
        Settings[2] = 0;                /* their music wins over ours */

    /* ---- game font: two atlases, and a code table from a separate file */
    limeCreateFONT("MKFONT_0.PNG", "MKFONT_1.PNG", "mkfont_ipad.ft2",
                   &GameFont, 0, 0x800, 0x800, 1, 0.32499999f);
    GameFont.spacing = -4;
    GameFont.fallbackAdvance = 17;

    unicode = (const uint8_t *)limeLoadFile("mkunicode.txt");
    for (i = 0; i < GameFont.numGlyphs; i++) {
        const uint8_t *p = unicode + 2 + i * 2;   /* +2 skips the BOM */
        GameFont.codesW[i] = (int16_t)(p[0] | (p[1] << 8));
        GameFont.codes[i]  = p[0];
    }
    limeFree((void *)unicode);

    /* ---- name font: a fixed character set, widened in place */
    limeCreateFONT("NAMES_FONT.PNG", 0, "namefont.ft2",
                   &NameFont, 0, 0x100, 0x100, 1, 1.0f);
    memcpy(NameFont.codes, NameFontCodes, 0x58);
    for (i = 0; i < NameFont.numGlyphs; i++)
        NameFont.codesW[i] = NameFont.codes[i];
    NameFont.spacing = -2;
    NameFont.fallbackAdvance = 6;

    SFXHandle[0x68 / 4] = limeLoadSound("Gstart");

    /* ---- countdown font */
    limeCreateFONT("COUNTDOWNFONT.PNG", 0, "countdownfont.ft2",
                   &CountDownFont, 0, 0x80, 0x80, 1, 1.0f);
    CountDownFont.spacing = 0;
    CountDownFont.fallbackAdvance = 10;

    sprintf(langbuf, "LANGUAGE_TEXT_%s", Language);
    LoadTextData(limeGetPropertyString(langbuf));
    CheckAllUnicodeCharsUsed();

    NextTask = 2;
    *FE_CurrentTask = 0;
    if (CheckForUnclaimedTreasure())
        *FE_CurrentTask = 0x24;
    CurrentTask = 8;

    JSIZE = ButtonSize;
    JoystickStatePosX = (long)ButtonSize;
    JoystickStatePosY = (long)((float)limeScreenHeight - ButtonSize);
}

/* ----------------------------------------------------------------- QuitAsWin
 *
 * armv7 0x000265d4, 1020 bytes.  **Complete.**
 *
 * The mirror of `QuitAsLose` above, and the two are worth reading together:
 * they share a shape, the same fade constant, and the same per-mode exits, but
 * the win path carries the whole arcade ladder inside it.
 *
 * ### The ladder ends when the stage passes Destiny + 8
 *
 *      Stage++
 *      if (Stage >= Destiny + 8) { ...tower cleared... }
 *
 * `Destiny` is which of the four towers is being played, and it is also the
 * OFFSET that makes each tower longer than the last: tower 0 ends after 8
 * fights, tower 3 after 11. One field doing two jobs, which is why `Destiny`
 * is reset to **-1** and not to 0 when the tower is cleared -- 0 is a real
 * tower and -1 is the "no tower" value the front end tests for.
 *
 * Clearing a tower does five things in order: unlocks achievement 0 if the
 * player never lost a round on tower 3, sets this tower's bit in
 * `achievementTracker[0x54/4]` and unlocks achievement 1 once all four bits
 * are set, arms an unclaimed treasure, pushes front-end task 0x24 (the same
 * task `Task_LoadGeneralData` routes to at boot when a treasure is owed), and
 * clears `GameStarted`, `Destiny` and `Stage`.
 *
 * `TreasureSelected` is set to **-1**, not to a treasure: the value is chosen
 * later, on the screen that awards it. `SaveUnclaimedTreasure(1)` is what
 * makes it survive a quit.
 *
 * ### Playing as character 5 five times in a row unlocks achievement 13
 *
 *      if (PLAYER1MODEL == 5 && ++winningStryk == 5) achievementsUnlock(13);
 *
 * The test is `== 5`, not `>= 5`, so the achievement fires on exactly the
 * fifth win and never again in that run -- and `QuitAsLose` zeroes
 * `winningStryk`, so it is five consecutive wins as that character. This is
 * checked on two separate paths (the arcade tail and the survival tail),
 * written out twice in the original.
 *
 * ### Survival
 *
 *      survivalWinStreak++, Player1Wins = 1, (*SurvivalStageP)++
 *      if (survivalWinStreak > 19) { achievementsUnlock(19); Write_AchievementsData(); }
 *      Write_SaveData()
 *      Character2 = TowerRand[abs(limeRand()) % 22]
 *
 * Twenty survival wins unlock achievement 19. The next opponent is drawn from
 * `TowerRand`, the same 22-entry shuffle table `PopulateTower` uses, so
 * survival can repeat an opponent -- there is no exclusion, just a fresh draw.
 *
 * **`abs()` before the modulo, not after.** `limeRand` returns a signed value
 * and the code negates it when negative *before* dividing, so the index is
 * always in 0..21. Taking `% 22` of a negative first would have given a
 * negative index and read off the front of the table.
 *
 * ### Survival writes the save file twice
 *
 * The survival branch calls `Write_SaveData()`, and the common tail below it
 * calls `Write_SaveData()` again because the mode is not 1. Harmless, but it
 * is two full writes of the save file on every survival win, and the port
 * should not copy the second one into a build that writes to slower storage.
 *
 * ### The arcade logging, and what it says about the analytics
 *
 *      EASDK_LogEventEnumEnumString(0x7554, 15, DestinyNames[Destiny],
 *                                   15, getLayoutName(Settings[4], Settings[5]))
 *      EASDK_LogEventEnumEnumString(0x754e, 15, DestinyNamesWin[Destiny],
 *                                   15, getStageName(Stage))
 *      EASDK_LogEventEnumEnumStringNum(0x754f, 15, DestinyNames[Destiny],
 *                                      7, (long)timeInGame)
 *      printf("time spent:%f\n", (double)timeInGame)
 *
 * `0x754e` is the SAME event id the loss path uses -- the two are told apart
 * by the string, `DestinyNamesWin[Destiny]` here against `DestinyNamesLoss`
 * there, not by the id. EA also logs the button layout on a win and not on a
 * loss, so the layout data set is biased towards players who were winning.
 */
extern const char **DestinyNamesWin;    /* pointer slot -> 0x00176838 */
extern long  *TreasureSelected;         /* pointer slot */
extern long  *playerLostRound;          /* pointer slot -> 0x000ff8b8 */
extern long   survivalWinStreak;        /* 0x0014e1ec */
extern long   TowerRand[];              /* pointer slot -> 0x001014d0 */
extern int    achievementTracker[24];   /* 0x00379c60, see achievements.c */

const char *getLayoutName(int buttons, int custom);

void QuitAsWin(void)
{
    *JustWon = 1;

    if (GameMode == 0) {
        EASDK_LogEventEnumEnumString(0x7554, 15,
                DestinyNames[Destiny],
                15, getLayoutName(Settings[4], Settings[5]));
        EASDK_LogEventEnumEnumString(0x754e, 15,
                DestinyNamesWin[Destiny],
                15, getStageName(Stage));
        EASDK_LogEventEnumEnumStringNum(0x754f, 15,
                DestinyNames[Destiny],
                7, (long)timeInGame);
        printf("time spent:%f\n", (double)timeInGame);
    }

    switch (GameMode) {
    case 1:
        PushFETask(0x28);
        WaitForOpponent = 1;
        if (isParentBasedOnSpeed())
            sendQuit();
        if (*FE_FadeAddP == 0.0f) {
            *FE_FadeAddP = -0.033333335f;
            UpdateStats();
        }
        break;

    case 2:
        *FE_FadeAddP = -0.033333335f;
        break;

    case 3:
        *FE_FadeAddP = -0.033333335f;
        *exitTimeout = 600.0f;
        PushFETask(0x27);
        break;

    case 4:
        if (*FE_FadeAddP == 0.0f) {
            long r;

            survivalWinStreak++;
            Player1Wins = 1;
            (*SurvivalStageP)++;

            if (survivalWinStreak > 19) {
                achievementsUnlock(0x13);
                Write_AchievementsData();
            }

            Write_SaveData();
            r = limeRand();
            if (r < 0)
                r = -r;
            *FE_FadeAddP = -0.033333335f;
            Character2 = TowerRand[r % 22];

            if (PLAYER1MODEL == 5 && ++winningStryk == 5)
                achievementsUnlock(0xd);
        }
        break;

    case 5:
        *FE_FadeAddP = -0.033333335f;
        *FE_TaskStackPointer = 0;
        *FE_CurrentTask = 0;
        Player1Wins = 1;
        UpdateStats();
        break;

    default:
        /* Arcade (0) and mode 6 share this tail; only arcade counts the win
         * towards the streak. */
        if (GameMode != 6)
            winStreak++;

        if (PLAYER1MODEL == 5 && ++winningStryk == 5)
            achievementsUnlock(0xd);

        if (*FE_FadeAddP == 0.0f) {
            Player1Wins = 1;

            if (GameMode != 6) {
                Stage++;
                if (Stage >= Destiny + 8) {
                    /* Tower cleared. */
                    if (Destiny == 3 && *playerLostRound == 0)
                        achievementsUnlock(0);

                    achievementTracker[0x54 / 4] |= 1 << Destiny;
                    if (achievementTracker[0x54 / 4] == 0xf)
                        achievementsUnlock(1);

                    *TreasureSelected = -1;
                    SaveUnclaimedTreasure(1);
                    PushFETask(0x24);
                    GameStarted = 0;
                    Destiny = -1;
                    Stage = 0;
                }
            }

            *FE_FadeAddP = -0.033333335f;
            UpdateStats();
        }
        break;
    }

    if (GameMode != 1)
        Write_SaveData();
    Write_AchievementsData();
    if (Settings[2])
        FadeMusicOut = 1;
}

/* ------------------------------------------- Task_LoadingScreen_DRAWSCREEN
 *
 * armv7 0x0001d178, 844 bytes.  **Complete.**
 *
 * One frame of the loading screen: the background, one piece of advice, the
 * word "LOADING" and the percentage. `Task_LoadingScreen` calls it; the
 * prototype above this file's `Task_LoadingScreen` has been there since that
 * function landed.
 *
 * ### The background is drawn only once the texture has reached the GPU
 *
 *      if (LoadingTexture && LoadingTexture->name)
 *          limeDrawSprite(LoadingTexture, 0, 0, w, h, 0, 0, 1.0f, 0.75f, col);
 *
 * `TEXTURE+0x40` is the GL texture name, so the second half of that test is
 * "and it has actually been uploaded". A texture object that exists but has
 * not been given to GL draws nothing rather than drawing garbage -- which
 * matters here specifically, because this is the one screen that runs while
 * other textures are still being uploaded.
 *
 * **The V range stops at 0.75.** The image is 3/4 of its texture's height:
 * a 4:3 background in a square power-of-two atlas. A widescreen port that
 * replaces this art has to keep the same 0.75, or change it here as well.
 *
 * ### Which advice is shown
 *
 *      if (DrawRandomKode == 0 && Stage > 1)   drawKodeTip(randomKode)
 *      else if (Stage == 0)                    GameText(0x369)
 *      else if (Stage == 1)                    GameText(0x365)
 *      else                                    GameText(TipToDisplay + 0x365)
 *
 * **The flag reads inverted**: `DrawRandomKode` being SET is what suppresses
 * the kode tip, not what asks for it. Zero plus a stage past the first two is
 * what draws it. Whatever the name meant originally, the test in the binary
 * is the one above.
 *
 * Stages 0 and 1 get fixed strings -- the first two fights of a ladder, where
 * the player is most likely new -- and everything after that gets one of a
 * rotating set indexed by `TipToDisplay`, which is why the tips only start
 * varying once the player is past the opening.
 *
 * The chosen string is wrapped to `limeScreenWidth - 32` by
 * `CreateWrappedTextArrays` into `HelpSpiltText`, 256 bytes a line, and drawn
 * centred (`align 1`) at y = (line*16 + 132) * FE_HeightScale.
 *
 * ### Everything else is anchored to the far corner
 *
 *      "LOADING"   x = 8   * FE_WidthScale     align 0 (left)
 *      "%d%%"      x = w - 16 * FE_WidthScale  align 2 (right)
 *      both        y = h - 24 * FE_HeightScale
 *
 * The two share a baseline and sit at opposite ends of it. Note the y is
 * `limeScreenHeight - 24 * FE_HeightScale` and NOT `(h - 24) * scale`: the
 * screen height is used raw and only the inset is scaled, so the text stays
 * the same distance off the bottom edge on any screen. Getting that grouping
 * wrong is the classic way a port ends up with text off the bottom of the
 * display.
 *
 * ### The percentage is clamped, and the font is checked twice
 *
 *      sprintf(buf, "%d%%", percent >= 100 ? 100 : percent)
 *
 * so a caller that overshoots still shows 100%%, never 103%%.
 *
 * Both text draws are guarded by `GameFont.numGlyphs != 0` -- separately, with
 * the guard re-read between them. This function runs before
 * `Task_LoadGeneralData` has built the font, so on the very first loading
 * screen the guard is false and only the background is drawn. That is the
 * whole reason the check exists.
 */
extern char   HelpSpiltText[];          /* 0x00182c84, 256 bytes a line */
extern float  FE_WidthScale;            /* 0x000ff9b8 */
extern float  FE_HeightScale;           /* 0x000ff9bc */

const char *GameText(long id);
void drawKodeTip(long index);
long CreateWrappedTextArrays(const char *text, char *out, long *lines,
                             long maxWidth, void *font, float scale);

void Task_LoadingScreen_DRAWSCREEN(long a, long percent)
{
    /* The original's is EIGHT bytes -- sp+0x20, with `lines` immediately
     * after it at sp+0x28. That is exactly enough for "100%" and it is only
     * enough because the clamp below guards the top end. A NEGATIVE percent
     * is not clamped and formats up to 12 characters, straight over `lines`.
     * Sixteen here: identical for every value the game passes, and not a
     * stack overwrite for the ones it does not. See docs/GAME-BUGS.md. */
    char buf[16];                       /* sp+0x20, widened deliberately */
    long lines;                         /* sp+0x28 */
    long i;

    SetupFEScale();
    limeSet2DDrawing();
    limeEnableAlphaBlending_Basic();

    if (LoadingTexture != 0 && LoadingTexture->name != 0)
        limeDrawSprite(LoadingTexture, 0.0f, 0.0f,
                       (float)limeScreenWidth, (float)limeScreenHeight,
                       0.0f, 0.0f, 1.0f, 0.75f, col);

    if (a != 0) {
        const char *text;

        if (DrawRandomKode == 0 && Stage > 1) {
            drawKodeTip(randomKode);
        } else {
            if (Stage == 0)
                text = GameText(0x369);
            else if (Stage == 1)
                text = GameText(0x365);
            else
                text = GameText(TipToDisplay + 0x365);

            CreateWrappedTextArrays(text, HelpSpiltText, &lines,
                                    limeScreenWidth - 0x20,
                                    &GameFont, FE_WidthScale);

            for (i = 0; i < lines; i++)
                limeDrawFONT(&GameFont, limeUC(&HelpSpiltText[i * 256]),
                             (float)(limeScreenWidth / 2),
                             (float)(i * 16 + 0x84) * FE_HeightScale,
                             1, FE_WidthScale, fontcol);
        }
    }

    if (GameFont.numGlyphs != 0)
        limeDrawFONT(&GameFont, GameText(0x13),
                     8.0f * FE_WidthScale,
                     (float)limeScreenHeight + -24.0f * FE_HeightScale,
                     0, FE_WidthScale, fontcol);

    sprintf(buf, "%d%%", (int)(percent >= 100 ? 100 : percent));

    if (GameFont.numGlyphs != 0)
        limeDrawFONT(&GameFont, buf,
                     (float)limeScreenWidth + -16.0f * FE_WidthScale,
                     (float)limeScreenHeight + -24.0f * FE_HeightScale,
                     2, FE_WidthScale, fontcol);
}


/* ----------------------------------------------------------- InitAllGameData
 *
 * armv7 0x00021224, 1044 bytes.  **Complete.**
 *
 * Despite the name this function does exactly one thing: it lays out every
 * on-screen touch button, for every control scheme, from the screen size.
 * `Task_LoadGeneralData` calls it once at boot and reads `ButtonSize` straight
 * afterwards to place the joystick, so the two have to be read together.
 *
 * ### Everything comes from one ratio
 *
 *      k = limeScreenWidth / 640.0f      the design width
 *      B = k * ButtonSize                the one-player button
 *      C = B * 0.66666698f               the two-player button, 2/3 as big
 *
 * 640 is the layout the art was authored for; `k` is what carries it to any
 * other width. **Only the width feeds the scale** -- the height is used for
 * positions but never for scaling, so a taller screen gets the same button
 * size and more empty space, and a wider one gets bigger buttons.
 *
 * ### ButtonSize is rewritten in place, so this must run exactly once
 *
 *      ButtonSize = C / 0.66666698f      ( == B, up to one rounding )
 *
 * The global it read is the global it overwrites. Called twice, every button
 * would be scaled twice. Nothing else calls it -- `Task_LoadGeneralData` is
 * the only caller -- but a port that adds a "resolution changed" path cannot
 * simply call this again: it has to restore the design-time `ButtonSize`
 * first. Note also the round trip through 2/3 and back rather than just
 * keeping `B`; the two agree to within a float rounding, and the code stores
 * the round-tripped one.
 *
 * ### The layouts
 *
 * Every array is 120 bytes: six records of five words, of which this function
 * writes three -- x, y and size -- and leaves the last two alone. The
 * one-player arrays step in units of B from the bottom-right corner:
 *
 *      x: SW-0.5B, SW-1.5B, SW-2.5B      y: SH-0.5B, SH-1.5B
 *
 *      ButtonsPos4   4 buttons   a 2x2 block in the corner
 *      ButtonsPos5   5 buttons   the block plus one to its left
 *      ButtonsPos6   6 buttons   a 3x2 block
 *
 * `CustomButtonsPos4/5/6` get exactly the same values -- they are the player's
 * editable copy -- and are then copied into `DEFAULT_CustomButtonsPos4/5/6`,
 * which is what "reset controls" restores. **All three copies are 120 bytes**,
 * including the four- and five-button ones, so the unused records travel too.
 *
 * The two-player arrays split the screen. Player 2 (`_2`) works leftwards from
 * the right edge exactly as above but in units of C. Player 1 (`_1`) works
 * leftwards from
 *
 *      M = (limeScreenWidth / 2) - 0.5f * C
 *
 * and then subtracts a **flat 48 pixels** before stepping. That 48 is the only
 * number here that is not scaled by anything -- on a 640-wide screen it is
 * 48px of dead space either side of the centre line, and on a 2048-wide one it
 * is still 48px. For a widescreen port it is the first constant to revisit.
 *
 * ### The same value computed twice
 *
 * `M - C - 48 - C` and `(M - 2C) - 48` both appear, for what is arithmetically
 * one number, and both are truncated to int separately. They can differ by one
 * unit when the float rounding falls badly. Both are kept below rather than
 * folded into one, because folding them would be a change and not a
 * transcription.
 */

/* The records are the same 20-byte BUTTONPOS_STRIDE entries the touch code
 * above walks: word 0 x, word 1 y, word 2 size, word 4 the button id. This
 * function writes the first three and never touches the id -- that comes from
 * the preset data. Every array is 120 bytes, six records, however many the
 * layout actually uses. */
extern long ButtonsPosP2_1[];           /* 0x0014ff4c  2P mode, player 1 */
extern long ButtonsPosP2_2[];           /* 0x0014ffc4  2P mode, player 2 */
extern long ButtonsPos6P2_1[];          /* 0x0015003c  2P six-button, player 1 */
extern long ButtonsPos6P2_2[];          /* 0x001500b4  2P six-button, player 2 */
extern long CustomButtonsPos4[];        /* 0x00150294 */
extern long CustomButtonsPos5[];        /* 0x0015030c */
extern long CustomButtonsPos6[];        /* 0x00150384 */
extern long DEFAULT_CustomButtonsPos4[];        /* 0x001503fc */
extern long DEFAULT_CustomButtonsPos5[];        /* 0x00150474 */
extern long DEFAULT_CustomButtonsPos6[];        /* 0x001504ec */

static void SetButton(long *a, int n, long x, long y, long size)
{
    a[n * (BUTTONPOS_STRIDE / 4) + 0] = x;
    a[n * (BUTTONPOS_STRIDE / 4) + 1] = y;
    a[n * (BUTTONPOS_STRIDE / 4) + 2] = size;
}

void InitAllGameData(void)
{
    float SW = (float)limeScreenWidth;
    float SH = (float)limeScreenHeight;
    float halfW = (float)(limeScreenWidth / 2);
    float B = (SW / 640.0f) * ButtonSize;
    float C = B * 0.66666698f;
    float M = halfW + C * -0.5f;

    /* Two-player geometry, in units of C. */
    long px1 = (long)((M - 48.0f) - C);
    long px2 = (long)(((M - C) - 48.0f) - C);
    long px2b = (long)((M + C * -2.0f) - 48.0f);   /* the same number, again */
    long px3 = (long)(((M + C * -2.0f) - 48.0f) - C);
    long py1 = (long)(SH + C * -0.5f);
    long py2 = (long)((SH + C * -0.5f) - C);
    long py3 = (long)((SH + C * -0.5f) + C * -2.0f);
    long qx1 = (long)(SW + C * -0.5f);
    long qx2 = (long)((SW + C * -0.5f) - C);
    long qx3 = (long)(C * -2.0f + (SW + C * -0.5f));
    long sz2 = (long)C;

    long bx1, bx2, bx3, by1, by2, sz1;
    int i;

    SetButton(ButtonsPosP2_1, 0, px1, py1, sz2);
    SetButton(ButtonsPosP2_1, 1, px2, py1, sz2);
    SetButton(ButtonsPosP2_1, 2, px2, py2, sz2);
    SetButton(ButtonsPosP2_1, 3, px1, py2, sz2);
    SetButton(ButtonsPosP2_1, 4, px3, py1, sz2);

    SetButton(ButtonsPosP2_2, 0, qx1, py2, sz2);
    SetButton(ButtonsPosP2_2, 1, qx2, py2, sz2);
    SetButton(ButtonsPosP2_2, 2, qx2, py3, sz2);
    SetButton(ButtonsPosP2_2, 3, qx1, py3, sz2);
    SetButton(ButtonsPosP2_2, 4, qx3, py3, sz2);

    SetButton(ButtonsPos6P2_1, 0, px1,  py1, sz2);
    SetButton(ButtonsPos6P2_1, 1, px2,  py1, sz2);
    SetButton(ButtonsPos6P2_1, 2, px1,  py2, sz2);
    SetButton(ButtonsPos6P2_1, 3, px2,  py2, sz2);
    SetButton(ButtonsPos6P2_1, 4, px3,  py1, sz2);
    SetButton(ButtonsPos6P2_1, 5, px2b, py3, sz2);

    SetButton(ButtonsPos6P2_2, 0, qx1, py2, sz2);
    SetButton(ButtonsPos6P2_2, 1, qx2, py2, sz2);
    SetButton(ButtonsPos6P2_2, 2, qx1, py3, sz2);
    SetButton(ButtonsPos6P2_2, 3, qx2, py3, sz2);
    SetButton(ButtonsPos6P2_2, 4, qx1, py1, sz2);
    SetButton(ButtonsPos6P2_2, 5, qx3, py3, sz2);

    /* One-player geometry, in units of B -- and the write-back. */
    bx1 = (long)(SW + B * -0.5f);
    by1 = (long)(SH + B * -0.5f);
    bx2 = (long)((SW + B * -0.5f) - B);
    by2 = (long)((SH + B * -0.5f) - B);
    bx3 = (long)((SW + B * -0.5f) + B * -2.0f);
    sz1 = (long)B;

    ButtonSize = C / 0.66666698f;

    /* The 2x2 corner block is identical in all three one-player layouts. */
    for (i = 0; i < 3; i++) {
        long *fixed  = (i == 0) ? ButtonsPos4
                     : (i == 1) ? ButtonsPos5 : ButtonsPos6;
        long *custom = (i == 0) ? CustomButtonsPos4
                     : (i == 1) ? CustomButtonsPos5 : CustomButtonsPos6;

        SetButton(fixed,  0, bx1, by1, sz1);
        SetButton(fixed,  1, bx2, by1, sz1);
        SetButton(fixed,  2, bx2, by2, sz1);
        SetButton(fixed,  3, bx1, by2, sz1);
        SetButton(custom, 0, bx1, by1, sz1);
        SetButton(custom, 1, bx2, by1, sz1);
        SetButton(custom, 2, bx2, by2, sz1);
        SetButton(custom, 3, bx1, by2, sz1);
    }

    SetButton(ButtonsPos5, 4, bx3, by1, sz1);
    SetButton(CustomButtonsPos5, 4, bx3, by1, sz1);

    SetButton(ButtonsPos6, 4, bx3, by1, sz1);
    SetButton(CustomButtonsPos6, 4, bx3, by1, sz1);
    SetButton(ButtonsPos6, 5, bx3, by2, sz1);
    SetButton(CustomButtonsPos6, 5, bx3, by2, sz1);

    /* Every copy is 120 bytes -- six records -- whatever the layout uses. */
    memcpy(DEFAULT_CustomButtonsPos4, CustomButtonsPos4, 0x78);
    memcpy(DEFAULT_CustomButtonsPos5, CustomButtonsPos5, 0x78);
    memcpy(DEFAULT_CustomButtonsPos6, CustomButtonsPos6, 0x78);
}


/* ---------------------------------------------------------------- Task_GameInit
 *
 * armv7 0x0002e6f4, 1232 bytes.  **Complete.**
 *
 * The task that builds a fight. It is a three-state machine driven by
 * `GameInitState`, and it runs once a frame like every other task -- the
 * loading is spread across frames so the loading screen keeps animating.
 *
 *      state 0   first frame: clear the players, reset the event system,
 *                GameInitState = 1
 *      state 1   one slice of loading per frame, then GameInitState = 2
 *      state 2   finish the loading screen, GameInitState = 0, and fall
 *                through into the fight setup
 *
 * **The fight setup is only reached from state 2** (or from an out-of-range
 * state), so states 0 and 1 return early and the long tail below runs exactly
 * once per fight.
 *
 * ### The loading bar is 52 steps
 *
 *      Task_LoadingScreen_DRAWSCREEN(1, GI_LoadCount * 100 / 52)
 *      done = GameInit_LoadABit(GI_LoadCount)
 *      GI_LoadCount++
 *
 * The division is the usual reciprocal multiply -- magic `0x4ec4ec4f` with a
 * shift of 36, which is exactly `1/52`. So `GameInit_LoadABit` is expected to
 * take **52 calls**, and the percentage is derived from that expectation
 * rather than from the function's own progress: if it finishes early the bar
 * never reaches 100 on its own, which is why state 2 redraws it at a literal
 * 100 before deleting the texture.
 *
 * ### Sixteen player slots, one word each
 *
 *      for (i = 0; i < 16; i++) ((long *)(Players + i * 0x5f0))[1] = 0;
 *
 * 0x5f00 / 0x5f0 = 16, which is the fourth independent confirmation of the
 * 0x5f0 PLAYER stride. Only `+0x04` is cleared -- the rest of each slot is
 * left as it was.
 *
 * ### Wins needed, by mode
 *
 *      mode 2 (training)   0, and no intro at all
 *      mode 4 (survival)   1
 *      mode 3 (karnage)    0, and KarnageScore = 0
 *      everything else     2
 *
 * Training is the only mode that clears `DoIntro`; every other mode sets it
 * and then runs **twenty-five frames of `AnimateIntroCharacterPlayers1Frame`
 * back to back** before returning, to settle the intro animation before the
 * first drawn frame. That is a visible cost at load time and a place a port
 * could stop early.
 *
 * ### Kode 0x13 in versus starts the match one round from the end
 *
 *      if (GameMode == 1 && theKode == 0x13) {
 *          RoundWins[0] = RoundWins[1] = WinsNeeded - 1;
 *          H[0] = H[1] = 1;
 *      }
 *
 * Both players at match point and both at one health: a one-hit-kill round.
 *
 * ### A treasure played in mode 5 rewrites the kode
 *
 *      if (GameMode == 5 && TreasurePlayed == 10) {
 *          theKode = TreasurePlayed - 9;      // 1
 *          puts("TREASURE PLAY IN DARK KOBAT MODE!");
 *      }
 *
 * `TreasurePlayed - 9` for a value the branch has already established is 10 --
 * so it is the constant 1 written as arithmetic, which suggests the branch was
 * once a range.
 *
 * ### Two identical debug prints
 *
 * `"ACTIVE EVENTS:%ld"` is printed before `LIME_KillAllEvents` and again after
 * `LIME_InitEventsManager`, from two separate copies of the same string, and
 * `dumpMem` walks `mpSpriteList` and `mpEventQueue` on every entry into state
 * 0. All of it is live in the shipped build.
 */
extern long  *InGameLevelSelect;        /* pointer slot -> 0x000ff7f4 */
extern long  *LevelSelectP;             /* pointer slot -> 0x000ff7f8 */
extern long   MoveListPage;             /* 0x00150eb4 */
extern long   SnapCam;                  /* 0x00150e90 */
extern long   GameInitState;            /* 0x00150e84 */
extern long   GI_LoadCount;             /* 0x00151088 */
extern long  *MKEventQueue;             /* pointer slot */
extern long  *lastTimestamp;            /* pointer slot */
extern long   ScorpionFade;             /* 0x0010df04 */
extern long   ScorpionFadeAdd;          /* 0x0010df08 */
extern long   ScorpionFlash;            /* 0x0010df0c */
extern long   ClockTens;                /* 0x0014fa50 */
extern long   ClockSingles;             /* 0x0014fa54 */
extern long   RoundSummaryTime;         /* 0x0014e220 */
extern long   RoundSummary;             /* 0x0014e224 */
extern long   Round;                    /* 0x0014e228 */
extern long   RoundWins[2];             /* 0x0014e22c */
extern long   FightMessage;             /* 0x0014e258 */
extern long   FightMessageTimer;        /* 0x0014e25c */
extern long   DontQuitAfterFade;        /* 0x0014e254 */
extern long   DoSmokesEarthFatal;       /* 0x0010defc */
extern long   DoSmokeEarthFatalSFX;     /* 0x0010df00 */
extern long   DoIntro;                  /* 0x0014e1c0 */
extern long   WinsNeeded;               /* 0x0014e234 */
extern long   KarnageScore;             /* 0x0014df88 */
extern long  *theKode;                  /* pointer slot -> 0x0010ded0 */
extern long  *H;                        /* pointer slot */
extern long  *TrainingCatagoryP;        /* pointer slot -> 0x0017809c */

void mk3_dizzy(void);

void limeMemoryReport(const char *label);
void InitVarEdit(void);
long LIME_CountActiveEvents(void);
void LIME_KillAllEvents(void);
void ResetFightData(void);
void heartbeatSetIncoming(long n);
void preprocessPostloadKode(void);
long GameInit_LoadABit(long step);

void Task_GameInit(void)
{
    long i;

    *InGameLevelSelect = *LevelSelectP;
    MoveListPage   = 0;
    LockCamera     = 0;
    OverrideCamera = 0;
    SnapCam        = 1;
    AllowCameraTracking();
    DidIntroThisFrame = 0;

    if (GameInitState == 1) {
        long done;

        Task_LoadingScreen_DRAWSCREEN(1, GI_LoadCount * 100 / 52);
        done = GameInit_LoadABit(GI_LoadCount);
        GI_LoadCount++;
        if (done)
            GameInitState = 2;
        return;
    }

    if (GameInitState == 2) {
        Task_LoadingScreen_DRAWSCREEN(1, 100);
        DeleteLoadingScreenTexture();
        GameInitState = 0;
        /* falls through to the fight setup */
    } else if (GameInitState == 0) {
        for (i = 0; i < 16; i++)
            ((long *)(Players + i * 0x5f0))[1] = 0;

        limeMemoryReport("Start OF Game Init Memory report");
        InitVarEdit();
        GI_LoadCount = 0;
        Task_LoadingScreen_DRAWSCREEN(1, 0);
        GameInitState = 1;
        GameObjects = 0;
        clearSpriteListsAndEvents();
        *MKEventQueue = 0;
        IsInFinishing = 0;

        printf("#########################\nACTIVE EVENTS:%ld\n"
               "###########################\n", LIME_CountActiveEvents());
        LIME_KillAllEvents();
        LIME_InitEventsManager();
        printf("#########################\nACTIVE EVENTS:%ld\n"
               "###########################\n", LIME_CountActiveEvents());

        dumpMem(mpSpriteList, 0x140, 0x20);
        dumpMem(mpEventQueue, 0x1b0, 0x20);
        return;
    }

    /* ---- the fight setup, reached from state 2 (or an out-of-range state) */
    CurrentTask    = 6;
    FrameCount     = 0.0f;
    *lastTimestamp = 0;

    if (GameMode == 1) {
        CurrentTask = 6 + 8;            /* 14 */
        syncGame(1);
    } else if (Settings[2] != 0) {
        limePlayTune((const char *)(uintptr_t)LevelMusic[*LevelSelectP],
                     (long)MusicVol[Settings[2]], 1);
    }

    FE_Fade      = 0.0f;
    *FE_FadeAddP = 0.033333335f;        /* fade IN, note the sign */
    ScorpionFade    = 0;
    ScorpionFadeAdd = 0;
    ScorpionFlash   = 0;

    if (GameMode == 2 && *TrainingCatagoryP == 2)
        mk3_dizzy();

    CalcShakeOffset(0);

    GameTime     = 99.0f;
    ClockTens    = 9;
    ClockSingles = 9;

    RoundSummaryTime = 0;
    RoundSummary     = 2;
    Round            = 0;
    RoundWins[0]     = 0;
    RoundWins[1]     = 0;

    FightMessage      = 0;
    FightMessageTimer = 0;
    DontQuitAfterFade = 0;

    DoSmokesEarthFatal   = 0;
    DoSmokeEarthFatalSFX = 0;

    if (GameMode == 4)
        Health[0] = *SurvivalHealth;

    ResetFightData();

    if (GameMode == 2) {
        DoIntro         = 0;
        IntroCount      = 0.0f;
        IntroCount2     = 0.0f;
        IntroCountTimer = 0.0f;
        IntroCamCount   = 0;
        WinsNeeded      = GameMode;     /* 2, from the register the test used */
    } else {
        DoIntro         = 1;
        IntroCount      = 0.0f;
        IntroCount2     = 0.0f;
        IntroCountTimer = 0.0f;
        IntroCamCount   = 0;

        if (GameMode == 4) {
            WinsNeeded = 1;
        } else {
            WinsNeeded = 2;
            if (GameMode == 3) {
                WinsNeeded   = 0;
                KarnageScore = 0;
            }
        }
    }

    timeInGame = 0.0f;
    DeleteLoadingScreenTexture();
    limeMemoryReport("End of GAME Init Memory report");

    heartbeatSetIncoming(3);
    heartbeatUpdate();

    /* Twenty-five frames of intro animation, run back to back. */
    AnimateIntroCharacterPlayers1Frame(1);
    for (i = 1; i < 25; i++)
        AnimateIntroCharacterPlayers1Frame(1);

    preprocessPostloadKode();
    puts("########## TASK_GAME_INIT: 10");

    if (GameMode == 1 && *theKode == 0x13) {
        RoundWins[0] = WinsNeeded - 1;
        RoundWins[1] = WinsNeeded - 1;
        H[0] = 1;
        H[1] = 1;
    }

    printf("GameMode = %d, TreasurePlayed = %d\n",
           (int)GameMode, (int)*TreasurePlayed);

    if (GameMode == 5 && *TreasurePlayed == 10) {
        *theKode = *TreasurePlayed - 9;
        puts("\n#############################\n"
             "TREASURE PLAY IN DARK KOBAT MODE!");
    }
}


/* ------------------------------------------------------------- ResetFightData
 *
 * armv7 0x0002270c, 1364 bytes.  **Complete.**
 *
 * Puts every per-fight global back to its starting value. Most of it is a flat
 * list of zeroes; the interesting parts are the two places where it is not.
 *
 * ### G+0x368 and G+0x36c are health x 1.66
 *
 * Every kode branch writes a pair of numbers into the game state alongside the
 * health it sets:
 *
 *      health 100 -> 0xa6 = 166
 *      health  50 -> 0x53 =  83
 *      health  25 -> 0x29 =  41
 *
 * and the survival branch computes its one directly:
 *
 *      G->healthBar1 = Health[0] * 166 / 100
 *
 * 166, 83 and 41.5-truncated-to-41. **The two words are the health scaled by
 * 1.66**, which is the bar length -- 100 health drawn across 166 units. Five
 * independently written constants and one open-coded multiply all agreeing is
 * what settles it; from any one branch alone they are just numbers.
 *
 * ### Survival carries health between fights, and rescales it
 *
 *      SurvivalHealth = Health[0]          // whatever the last fight left
 *      if (SurvivalStage > 0 || Round != 0)
 *          G->healthBar1 = Health[0] * 166 / 100;
 *      else
 *          SurvivalHealth = Health[0] = 100;
 *
 * `Health[0]` is read **before** it is set, so it is the carry-over. Only the
 * very first round of the very first stage resets it. Note the bar is rescaled
 * from the carried health but `Health[0]` itself is left alone -- the fight
 * starts with the bar already short.
 *
 * ### Four handicap kodes, which are really two
 *
 *      0x13   both players to 1 health          (one hit kills)
 *      0x0d   100 against 50
 *      0x0e   100 against 25
 *      0x0f   100 against 50   -- identical to 0x0d in every branch
 *      0x10   100 against 25   -- 0x0e with the two sides SWAPPED
 *
 * Which player gets the short bar is decided by two network predicates:
 *
 *      0x0d, 0x0e, 0x0f    player 1 gets the big bar when
 *                          isParent() != isParentBasedOnSpeed()
 *      0x10                player 1 gets the big bar when
 *                          isParent() == isParentBasedOnSpeed()
 *
 * So `0x0d` and `0x0f` are byte-for-byte the same handicap under two different
 * kodes, and `0x10` is `0x0e` with the sides reversed. Whether the reversal is
 * the point of the kode or a slip is not established -- what is established is
 * that it is the only one of the four whose side rule differs.
 *
 * Using two predicates rather than one is how both machines in a network game
 * reach the same answer without exchanging anything: `isParent` is the session
 * role and `isParentBasedOnSpeed` is derived from the measured link, and their
 * agreement or disagreement is a value both ends compute identically.
 *
 * ### The babality bounce table
 *
 *      BabalityVel[0..7]    = 0
 *      BabalityHeight[0..7] = { 288, 256, 272, 256, 288, 272, 256, 288 }
 *
 * Eight entries each, written out one store at a time and deliberately out of
 * order in the original. Three distinct heights in a repeating pattern -- the
 * bounce is authored, not simulated.
 */
extern long  RunBar[2];                 /* 0x0014fa6c */
extern long  FlawlessCounter;           /* 0x0014fb48 */
extern long  FlawlessMessage;           /* 0x0014fb4c */
extern long  DangerMessage[2];          /* 0x0014e23c */
extern long  RoundMessage;              /* 0x0014e250 */
extern long  lightsOn;                  /* 0x0010decc */
extern uint8_t WinnerMessage[2];        /* 0x0014faa8, two BYTES */
extern long  RoundHasEnded;             /* 0x0014e248 */
extern long  FinishHimHer;              /* 0x0014e24c */
extern long  RoundHasEndedStatsUpdated; /* 0x0014e244 */
extern long  DoneSmashEffect;           /* 0x0010ded4 */
extern float BabalityVel[8];            /* 0x001f4104 */
extern float BabalityHeight[8];         /* 0x001f4124 */
extern long  MercyMessage;              /* 0x0014fb40 */
extern long  MercyMessageCounter;       /* 0x0014fb44 */
extern long  BabalityMessageG;          /* 0x0014fb28 */
extern long  AnimalityMessageG;         /* 0x0014fb2c */
extern long  FatalityMessageG;          /* 0x0014fb30 */
extern long  FriendshipMessageG;        /* 0x0014fb34 */
extern long  AnimalityMessageCounter;   /* 0x0014fb38 */
extern long  FatalityMessageCounter;    /* 0x0014fb3c */
extern long  DoingStageFatal;           /* 0x0010dee0 */
extern long  DoingStageFatalBringForward;   /* 0x0010dee4 */
extern long  sindelFlying;              /* 0x0014dff8 */
extern long  DoingSKDeath;              /* 0x0010deb8 */
extern long  SKDeathMessageOffset;      /* 0x0010debc */
extern long  opponentPerformedMercy;    /* 0x0010dea4 */
extern long *SurvivalStageP2;           /* pointer slot -> 0x000ff980 */

void checkIfKode(void);
int  isParent(void);
int  isParentBasedOnSpeed(void);

/* The kode handicaps. `p1Big` says which side gets the long bar; the bar
 * lengths are the health scaled by 1.66, which is why they arrive as a pair. */
static void SetKodeHandicap(long bigHp, long bigBar,
                            long smallHp, long smallBar, int p1Big)
{
    if (p1Big) {
        G->healthBar1 = bigBar;
        Health[0]     = (int)bigHp;
        G->healthBar2 = smallBar;
        Health[1]     = (int)smallHp;
    } else {
        G->healthBar1 = smallBar;
        Health[0]     = (int)smallHp;
        G->healthBar2 = bigBar;
        Health[1]     = (int)bigHp;
    }
}

void ResetFightData(void)
{
    long i;

    if (GameMode == 4) {
        /* Survival: Health[0] is read BEFORE it is set -- the carry-over. */
        *SurvivalHealth = Health[0];

        if (*SurvivalStageP2 > 0 || Round != 0)
            G->healthBar1 = Health[0] * 166 / 100;
        else
            *SurvivalHealth = Health[0] = 100;
    } else {
        Health[0] = 100;
    }

    RunBar[0] = 100;
    RunBar[1] = 100;
    Health[1] = 100;
    BGSceneFrame[0] = 0.0f;
    BGSceneFrame[1] = 0.0f;

    checkIfKode();

    if (*theKode == 0x13) {
        Health[0] = 1;
        Health[1] = 1;
        G->healthBar1 = 1;
        G->healthBar2 = 1;
    } else if (*theKode == 0x0d) {
        SetKodeHandicap(100, 0xa6, 50, 0x53,
                        isParent() != isParentBasedOnSpeed());
    } else if (*theKode == 0x0e) {
        SetKodeHandicap(100, 0xa6, 25, 0x29,
                        isParent() != isParentBasedOnSpeed());
    } else if (*theKode == 0x0f) {
        SetKodeHandicap(100, 0xa6, 50, 0x53,
                        isParent() != isParentBasedOnSpeed());
    } else if (*theKode == 0x10) {
        /* The one whose side rule is inverted -- see the header. */
        SetKodeHandicap(100, 0xa6, 25, 0x29,
                        isParent() == isParentBasedOnSpeed());
    }

    FlawlessCounter  = 0;
    FlawlessMessage  = 0;
    DangerMessage[0] = 0;
    DangerMessage[1] = 0;
    RoundMessage     = 0;
    lightsOn         = 0;

    GameTime     = 99.0f;
    ClockTens    = 9;
    ClockSingles = 9;

    RoundSummaryTime = 0;

    WinnerMessage[0] = 0;
    WinnerMessage[1] = 0;

    RoundHasEnded             = 0;
    FinishHimHer              = 0;
    RoundHasEndedStatsUpdated = 0;
    DoneSmashEffect           = 0;

    for (i = 0; i < 8; i++)
        BabalityVel[i] = 0.0f;

    BabalityHeight[0] = 288.0f;
    BabalityHeight[1] = 256.0f;
    BabalityHeight[2] = 272.0f;
    BabalityHeight[3] = 256.0f;
    BabalityHeight[4] = 288.0f;
    BabalityHeight[5] = 272.0f;
    BabalityHeight[6] = 256.0f;
    BabalityHeight[7] = 288.0f;

    MercyMessage            = 0;
    MercyMessageCounter     = 0;
    BabalityMessageG        = 0;
    AnimalityMessageG       = 0;
    FatalityMessageG        = 0;
    FriendshipMessageG      = 0;
    AnimalityMessageCounter = 0;
    FatalityMessageCounter  = 0;

    DoingStageFatal             = 0;
    DoingStageFatalBringForward = 0;
    sindelFlying                = 0;
    DoingSKDeath                = 0;
    SKDeathMessageOffset        = 0;
    opponentPerformedMercy      = 0;
}
