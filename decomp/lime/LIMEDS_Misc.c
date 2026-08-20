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


/* ---------------------------------------------------------------------------
 * QSTMATRIX -- Quaternion, Scale, Translation, in 16-bit fixed point
 *
 * The two functions below give the type its meaning. `ConvertQSTMatrixtoPCMatrix`
 * reads **four consecutive int16** at +0x00, +0x02, +0x04 and +0x06, converts
 * them to double, and immediately starts squaring and cross-multiplying them --
 * which is quaternion-to-matrix arithmetic and nothing else. So the Q in QST is
 * literal.
 *
 * The scale is the double at 0x0007ff40: **1/32767**. That is the same constant
 * the `.meshset` variant-A vertex positions use, and it is worth putting beside
 * the others, because this engine has three different fixed-point conventions
 * and they are easy to mix up:
 *
 *      int16  * 1/32767    QST quaternions, .meshset vertex positions
 *      int32  * 1/4096     DS matrices (ConvertDSMatrixtoPCMatrix)
 *      uint16 * 1/65536    .skin weights
 *
 * Getting one wrong produces geometry that is subtly the wrong size rather than
 * obviously broken, which is the worst kind of wrong.
 */


/* ------------------------------------------------------------ LerpQSTMatrix
 *
 * armv6 0x0007fc44, 344 bytes.  **Structurally complete.**
 *
 * Interpolates two QST matrices by `t`, element by element.
 *
 * Every element round-trips: `ldrsh` to load the int16, `vcvt.f32.s32` up to
 * float, the blend, then `vcvt.s32.f32` and `strh` back down. So the result is
 * **re-quantised to int16 at every step**, not kept in float and converted once
 * at the end.
 *
 * That matters for a port. Reproducing this in float throughout gives visibly
 * smoother results than the original, which sounds like an improvement and is
 * actually a behaviour change -- the quantisation is part of how the animation
 * looks.
 *
 * The blend weights are `t` and `1 - t`, with the 1.0f literal at 0x0007fd8c.
 */
void LerpQSTMatrix(const int16_t *a, const int16_t *b, float t, int16_t *out)
{
    const float u = 1.0f - t;           /* literal 1.0f at 0x0007fd8c */
    int i;

    for (i = 0; i < QST_ELEMENTS; i++) {
        float blended = (float)b[i] * t + (float)a[i] * u;
        out[i] = (int16_t)blended;      /* re-quantised every element */
    }
}


/* ------------------------------------------------- ConvertQSTMatrixtoPCMatrix
 *
 * armv6 0x0007fd90, 416 bytes.  **Not fully decompiled.**
 *
 * Expands a QST matrix into the float 4x4 the renderer uses.
 *
 * What is established: it reads four `int16` from +0x00 through +0x06, scales
 * each by **1/32767**, and works in **double** -- `vcvt.f64.s32`, `vmul.f64` --
 * before narrowing. The immediate squaring (`vmul.f64 d1, d4, d4`) is the
 * quaternion-to-matrix expansion, the same shape as `GetMFromQuat2` in
 * RenderSkinned.cpp but at higher precision.
 *
 * Computing in double here is consistent with the rest of the engine's
 * accuracy-sensitive code -- `CreatePerspectiveMatrix` and `NormaliseLDirs` do
 * the same and narrow once at the end.
 *
 * The scale and translation halves are not broken out; the body is omitted
 * rather than guessed.
 */
void ConvertQSTMatrixtoPCMatrix(const int16_t *src, float *dst);


/* ---------------------------------------------------------- LIMEDS_Set3dMode
 *
 * armv6 0x00080134, 216 bytes.
 *
 * Resets both matrix stacks for 3D drawing: `glMatrixMode(GL_MODELVIEW)` then
 * `glLoadIdentity`, and the same for `GL_PROJECTION` (0x1701).
 *
 * It then installs a projection built around the literal `0x3f19999a`, which is
 * **0.6f**. That constant is not the field of view -- `CreatePerspectiveMatrix`
 * takes that as an argument -- so it is more likely a near plane or a scale, and
 * it is left unnamed here rather than guessed at.
 */
void LIMEDS_Set3dMode(void)
{
    glMatrixMode(GL_MODELVIEW);         /* 0x1700 */
    glLoadIdentity();
    glMatrixMode(GL_PROJECTION);        /* 0x1701 */
    glLoadIdentity();
    /* projection setup follows, using the 0.6f literal */
}
