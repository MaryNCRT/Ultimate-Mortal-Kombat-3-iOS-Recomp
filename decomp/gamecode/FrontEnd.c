/*
 * FrontEnd.c — src/gamecode/FrontEnd.cpp (menus and screens)
 *
 * 125 functions in the original. These three are the coordinate scalers every
 * other one goes through, which makes them worth having first: they are the
 * front end's whole relationship with the screen it is drawn on.
 *
 * Hand-written from the disassembly of the armv7 slice and verified against the
 * oracle by tests/test_frontend_diff.c.
 */

#include <stdint.h>

/* Both live in the slice's data and both hold 1.0f as shipped. */
extern float FE_WidthScale;             /* 0x000ff9b8 */
extern float FE_HeightScale;            /* 0x000ff9bc */

float FE_X(float v);
float FE_W(float v);
float FE_H(float v);


/* ------------------------------------------------- the front end's scalers
 *
 * armv7 0x00002e84, 0x00002ecc and 0x00002ee8, 28 bytes each. Identical shape:
 *
 *      ldr   r3, [pc, #0x14]
 *      vmov  s12, r0            ; the argument -- soft-float, so it arrives
 *      add   r3, pc             ;   in a core register and is moved across
 *      vldr  s14, [r3]
 *      vmul.f32 s14, s12, s14
 *      vmov  r0, s14            ; and leaves the same way
 *      bx    lr
 *
 * **`FE_X` and `FE_W` resolve to the SAME global**, 0x000ff9b8, which the
 * symbol table calls `_FE_WidthScale`. `FE_H` uses `_FE_HeightScale` at
 * 0x000ff9bc. So horizontal positions and widths share one multiplier and
 * heights have their own — two numbers, not three.
 *
 * ## Why this is the widescreen hook
 *
 * Both scales hold **1.0f** in the shipped binary, so the front end draws at
 * its authored size and these functions are pass-throughs on the device. They
 * exist for the case where it does not.
 *
 * That makes them the place a widescreen port changes the menus, and it makes
 * the split matter: X and W move together because stretching horizontally has
 * to move a thing and its width by the same factor or the layout tears. A port
 * that gave positions and widths separate scales would look right on one
 * element and wrong on the next.
 *
 * `_CreatePerspectiveMatrix` is the corresponding hook for the game itself.
 * This is the other half of it.
 */
float FE_X(float v)
{
    return v * FE_WidthScale;
}

float FE_W(float v)
{
    return v * FE_WidthScale;
}

float FE_H(float v)
{
    return v * FE_HeightScale;
}
