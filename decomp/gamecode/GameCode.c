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
typedef struct TEXTURE TEXTURE;
typedef struct TEXTURETOLOAD {
    const char *name;            /* 0x00  NULL ends the list */
    TEXTURE   **dest;            /* 0x04  where the handle goes */
} TEXTURETOLOAD;

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
    uint8_t _pad000[0x44e];
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
extern void  *NameFont;                 /* 0x001c3bf4 */
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
    limeDrawFONT(NameFont, str, 8.0f, (float)FE_Y(96.0f), 0, 1.0f, fontcol);

    if (AIOn == 2)
        limeDrawFONT(NameFont, "AI: CPU vs CPU", 8.0f, (float)FE_Y(112.0f),
                     0, 1.0f, fontcol);
    else if (AIOn == 1)
        limeDrawFONT(NameFont, "AI: Human vs CPU", 8.0f, (float)FE_Y(112.0f),
                     0, 1.0f, fontcol);
    else
        limeDrawFONT(NameFont, "AI: Human vs Human", 8.0f, (float)FE_Y(112.0f),
                     0, 1.0f, fontcol);

    if (SpeedNormal != 0)
        limeDrawFONT(NameFont, "Speed: Normal",
                     (float)(limeScreenWidth - 8), (float)FE_Y(96.0f),
                     2, 1.0f, fontcol);
    else
        limeDrawFONT(NameFont, "Speed: Slow-mo",
                     (float)(limeScreenWidth - 8), (float)FE_Y(96.0f),
                     2, 1.0f, fontcol);
}
