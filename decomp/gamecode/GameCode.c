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
