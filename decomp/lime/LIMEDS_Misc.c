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


/* ------------------------------------------------- ConvertDSMatrixtoPCMatrix
 *
 * armv6 0x0007fb30, 240 bytes.
 *
 * Converts a matrix from the engine's older fixed-point form into the float
 * 4x4 the renderer uses.
 *
 * **The "DS" in this file is Nintendo DS.** The source is `int32` and every
 * element is multiplied by the literal at 0x0007fc40, which is `0x39800000` --
 * exactly **1/4096**, the DS's 1.3.12 fixed-point scale. That fits what the
 * project already knew about this codebase's ancestry: `EA_SDK/microedition/`
 * carries Java ME classes, so the lineage runs handheld to phone to iOS, and
 * this function is the seam where the old numeric format is still being paid
 * for at runtime.
 *
 * It also settles a layout question. The source is packed three floats at a
 * time while the destination gets **an explicit zero written at +0x0c and
 * +0x1c** -- the fourth column of each row. So the PC matrix is **row-major
 * 4x4 with w = 0 per row**, which is the same convention
 * CreatePerspectiveMatrix uses and the opposite of what glLoadMatrixf expects.
 *
 * (Note this is *not* the convention LIMEDS_SetObjectOrientation's argument
 * follows -- see the comment there. The engine genuinely mixes them.)
 */
void ConvertDSMatrixtoPCMatrix(const int32_t *src, float *dst)
{
    const float k = 1.0f / 4096.0f;     /* literal 0x39800000 */
    int row, col;

    for (row = 0; row < 4; row++) {
        for (col = 0; col < 3; col++)
            dst[row * 4 + col] = (float)src[row * 3 + col] * k;
        dst[row * 4 + 3] = 0.0f;        /* the written zero */
    }
}
