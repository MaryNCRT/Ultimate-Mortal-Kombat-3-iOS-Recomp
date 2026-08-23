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
    int     timer;                  /* 0x08  reset to 0 when one is triggered */
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
    TheHud.timer = 0;
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
