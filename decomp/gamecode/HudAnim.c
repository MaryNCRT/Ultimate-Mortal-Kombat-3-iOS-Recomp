/*
 * HudAnim.c — src/gamecode/HudAnim.cpp
 *
 * The HUD's animated overlay: the "TOASTY!", "FLAWLESS VICTORY" and friends
 * that drop in over the fight. Hand-written from the disassembly of the armv7
 * slice.
 *
 * Everything here goes through one global, `_TheHud` at 0x00371458, and the two
 * functions below only ever touch its first three words. Their offsets are what
 * the code uses; the struct is spelled out rather than guessed at beyond that.
 */

#include <stdint.h>

typedef struct TEXTURE TEXTURE;
typedef struct TEXTURETOLOAD {
    const char *name;
    TEXTURE   **dest;
} TEXTURETOLOAD;

void FreeSomeTextures(TEXTURETOLOAD *list);

/* HUDANIM is an enum passed by value in r0 — `7HUDANIM` in the mangled name is
 * a seven-character type, not a pointer, so it arrives as an int. */
typedef int HUDANIM;

/* `_TheHud` — 0x00371458. Only three words are reached from these two
 * functions, and they are named for what each is used as rather than for
 * anything the symbol table says, because it says nothing. */
typedef struct HUD {
    int     active;                 /* 0x00  zero means there is no HUD yet */
    HUDANIM anim;                   /* 0x04  the animation to play */
    float   timer;                  /* 0x08  a FLOAT -- see HUDANIM_Update */
} HUD;

extern HUD TheHud;                          /* 0x00371458 */
extern TEXTURETOLOAD HUDANIM_ttl[];         /* 0x00174e4c */


/* ------------------------------------------------------- HUDANIM_TriggerAnim
 *
 * armv7 0x0007dbe0, 20 bytes.  **Complete.**
 *
 *      ldr  r2, =_TheHud
 *      ldr  r3, [r2]
 *      cbz  r3, out            <- nothing happens without an active HUD
 *      movs r3, #0
 *      str  r0, [r2, #4]       <- anim
 *      str  r3, [r2, #8]       <- timer
 *
 * The guard is worth keeping rather than tidying away: a trigger arriving
 * before the HUD exists is DROPPED, not queued. Any port that queues it changes
 * behaviour at exactly the moments this is called — round start, first hit.
 */
void HUDANIM_TriggerAnim(HUDANIM anim)
{
    if (TheHud.active == 0)
        return;                     /* cbz r3 */

    TheHud.anim  = anim;
    TheHud.timer = 0.0f;
}


/* ----------------------------------------------------------- HUDANIM_Destroy
 *
 * armv7 0x0007dc3c, 36 bytes.  **Complete.**
 *
 *      ldr r4, =_TheHud
 *      ldr r3, [r4]
 *      cbz r3, out
 *      ldr r0, =_HUDANIM_ttl
 *      bl  _FreeSomeTextures
 *      movs r3, #0
 *      str r3, [r4, #4]        <- anim cleared BEFORE active
 *      str r3, [r4]
 *
 * Note it clears `+4` and then `+0`, in that order. Both are zeroed either way,
 * so the order does not matter here — but it is transcribed as written rather
 * than reordered, because the only reason to reorder it would be taste.
 */
void HUDANIM_Destroy(void)
{
    if (TheHud.active == 0)
        return;

    FreeSomeTextures(HUDANIM_ttl);
    TheHud.anim   = 0;
    TheHud.active = 0;
}


void LoadSomeTextures(TEXTURETOLOAD *list);


/* ------------------------------------------------------------- HUDANIM_Init
 *
 * armv7 0x0007dc60, 40 bytes.  **Complete.**
 *
 *      ldr  r3, [_TheHud]
 *      cbnz r3, skip               <- textures only when not already up
 *      bl   _LoadSomeTextures(_HUDANIM_ttl)
 *   skip:
 *      movs r2, #1
 *      str  r2, [_TheHud]          <- active
 *      subs r2, #1
 *      str  r2, [_TheHud, #4]      <- anim = 0
 *
 * The texture load is guarded but the two stores are not, so calling this twice
 * loads once and resets the animation both times. `subs r2, #1` producing the
 * zero is the compiler reusing the 1 it already had, not a second constant.
 */
void HUDANIM_Init(void)
{
    if (TheHud.active == 0)
        LoadSomeTextures(HUDANIM_ttl);

    TheHud.active = 1;
    TheHud.anim   = 0;
}


extern void **Scene_FIGHT;              /* pointer slot -> 0x00183d60 */


/* ------------------------------------------------------------ HUDANIM_Update
 *
 * armv7 0x0007dbf4, 68 bytes.  **Complete.**
 *
 *      if (!TheHud.active) return
 *      if (!TheHud.anim)   return
 *      TheHud.timer += 1.0f
 *      if (TheHud.timer >= (float)(Scene_FIGHT->count2 - 2))
 *          TheHud.anim = 0
 *
 * **The timer at +8 is a FLOAT.** `vldr s12, [r2, #8]`, `vadd.f32` with the
 * immediate 1.0, `vstr` back. This file had it as an int, which compiles, runs,
 * and is wrong: the comparison against the scene length is a float compare
 * (`vcmpe.f32`), and an integer timer would still terminate but by a different
 * rule.
 *
 * The length comes from the FIGHT scene's own `+0x44`, which
 * decomp/lime/lime.h names `count2` -- the modulus LIME_TriggerEventsFromScene
 * uses. **Minus two**, so the animation is cleared two frames before the scene
 * would wrap, not at the end.
 *
 * That -2 is the kind of constant a port drops as an off-by-one. It is not one.
 */
void HUDANIM_Update(void)
{
    float limit;

    if (TheHud.active == 0)
        return;
    if (TheHud.anim == 0)
        return;

    TheHud.timer += 1.0f;

    limit = (float)(((const long *)*Scene_FIGHT)[0x44 / 4] - 2);
    if (TheHud.timer >= limit)
        TheHud.anim = 0;
}
