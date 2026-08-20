/*
 * lime/common/LIMEDS_Misc.cpp -- the matrix-stack helpers.
 *
 * Recovered from the armv6 slice. Addresses below are armv6.
 *
 * The "DS" prefix survives from an earlier target; these are thin wrappers
 * over the fixed-function matrix stack, which is how this engine does all of
 * its transform work. See docs/LIME-ENGINE.md for the full GL surface.
 */

#include "lime.h"


/* --------------------------------------------------------- LIME_PushMatrix
 *
 * armv6 0x00080124, 12 bytes.
 *
 * Exactly glPushMatrix, wrapped. The wrapper exists so the platform layer has
 * a single place to intercept, which is precisely what a port needs when the
 * fixed-function stack has to be emulated on a core profile.
 */
void LIME_PushMatrix(void)
{
    glPushMatrix();
}


/* ---------------------------------------------------------- LIME_PopMatrix
 *
 * armv6 0x000800fc, 24 bytes.
 *
 * Pops `count` levels, not one. Passing zero is a no-op rather than an error
 * -- the early return is the first thing the function does.
 */
void LIME_PopMatrix(int count)
{
    int i;

    if (count == 0)
        return;

    for (i = 0; i < count; i++)
        glPopMatrix();
}


/* ----------------------------------------------- LIMEDS_SetObjectOrientation
 *
 * armv6 0x0007ff50, 36 bytes.
 *
 * Places an object: translate to its position, then apply its orientation
 * matrix.
 *
 * **Note what this does NOT do.** It hands `matrix` straight to glMultMatrixf
 * with no transpose, whereas CreatePerspectiveMatrix produces a layout that
 * has to be transposed before GL will accept it -- it puts the perspective
 * term at m[11] and the -1 at m[14], which is those two swapped relative to
 * GL's column-major order.
 *
 * So the engine is not consistent across all of its matrices, and a port must
 * not apply one blanket convention to every 4x4 it meets. Which matrices are
 * stored in which order is not yet fully mapped; the projection needs the
 * transpose and the object matrices here do not.
 */
void LIMEDS_SetObjectOrientation(const float *matrix, const limeVECTOR3 *pos)
{
    glMatrixMode(GL_MODELVIEW);                /* 0x1700 */
    glTranslatef(pos->x, pos->y, pos->z);
    glMultMatrixf(matrix);
}
