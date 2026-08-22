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
