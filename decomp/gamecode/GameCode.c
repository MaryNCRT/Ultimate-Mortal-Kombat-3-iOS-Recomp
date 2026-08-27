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
 */
void RemapKicksPunches(long arg)
{
    (void)arg;
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
