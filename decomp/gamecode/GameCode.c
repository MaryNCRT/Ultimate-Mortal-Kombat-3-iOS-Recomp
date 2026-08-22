/*
 * GameCode.c — src/gamecode/GameCode.cpp
 *
 * Top-level game state: camera, intro, and the texture sets that come and go
 * with it. Seventy-nine functions in the original; these are the small
 * self-contained ones, hand-written from the disassembly of the armv7 slice and
 * verified against the oracle by tests/test_gamecode_diff.c.
 */

#include <stdint.h>

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
