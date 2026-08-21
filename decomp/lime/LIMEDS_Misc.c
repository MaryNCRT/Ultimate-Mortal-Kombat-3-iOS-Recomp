/*
 * lime/common/LIMEDS_Misc.cpp -- the matrix-stack helpers.
 *
 * Recovered from the armv6 slice. Addresses below are armv6.
 *
 * The "DS" prefix survives from an earlier target; these are thin wrappers
 * over the fixed-function matrix stack, which is how this engine does all of
 * its transform work. See docs/LIME-ENGINE.md for the full GL surface.
 */

#include <math.h>
#include <string.h>
#include <stdio.h>
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


/* ---------------------------------------------- LIMEDS_SetCameraOrientation
 *
 * armv6 0x0007ff84, 376 bytes.  **Complete.**
 *
 * This is **gluLookAt**, written out by hand. The engine never links GLU, so
 * the view matrix is built here and this is the only place the camera basis
 * exists.
 *
 * **It takes nine floats, not three vectors.** The prologue does
 * `stm sp, {r0, r1, r2}` and then immediately reads them back with `vldr` --
 * the first three arguments are float bit patterns arriving in core registers
 * under the soft-float ABI, not pointers. The other six come off the caller
 * stack at +0x7c through +0x90. So the grouping into eye, target and up below
 * is a reading of how they are used, not of how they are declared:
 *
 *      vsub.f32 s8, s22, s16       arg0 - arg3
 *      vsub.f32 s7, s23, s17       arg1 - arg4
 *      vsub.f32 s6, s24, s18       arg2 - arg5
 *
 * -- three componentwise subtractions in a row is a vector difference, which
 * makes 0..2 and 3..5 two points, and 6..8 the remaining direction.
 *
 * The rest is unmistakable: sum the squares, `vsqrt.f32`, divide. The divides
 * are `vdivne`, predicated on the length compare, so **a zero length silently
 * leaves the vector unnormalised rather than producing NaN**. That is worth
 * reproducing exactly; a port that divides unconditionally turns a degenerate
 * camera into a black screen instead of a stuck one.
 *
 * Note it does **not** call `Normalise` or `Len` from limeVector.cpp even
 * though both exist -- the normalisation and the cross product are inlined
 * here. There is no cross-product symbol anywhere in the binary, so every
 * cross product in this engine is written out by hand at its use site.
 *
 * The eye position is negated up front (`vneg.f32` on all three) and used at
 * the very end, which gives away the whole structure:
 *
 *      glMultMatrixf(basis);
 *      glTranslatef(-eye.x, -eye.y, -eye.z);
 *
 * -- rotate the world into the camera, then move it back. Standard view
 * matrix construction.
 *
 * **The basis is written down columns, not across rows.** The three components
 * of the first vector go to +0x00, +0x10 and +0x20 of the matrix; the second
 * to +0x04, +0x14, +0x24. Writing a basis transposed *is* inverting it for a
 * pure rotation, which is exactly what a view matrix needs -- so the matrix
 * arrives at glMultMatrixf already in the layout GL wants, and needs no
 * transpose.
 *
 * That resolves the convention question this file raises twice elsewhere.
 * ConvertDSMatrixtoPCMatrix produces row-major and needs transposing; this one
 * and LIMEDS_SetObjectOrientation do not. The rule is not per-function
 * whim -- **matrices built from basis vectors here are stored GL-ready, and
 * matrices converted from the old fixed-point formats are not.**
 *
 * The remaining fields are written as literal zeros (+0x0c, +0x1c, +0x2c for
 * the fourth column, +0x30, +0x34, +0x38 for the bottom row) with 1.0f at
 * +0x3c, so the translation genuinely is not in the matrix -- it is the
 * glTranslatef that follows.
 *
 * Only two normalised vectors are stored, at +0x00/+0x10/+0x20 and
 * +0x04/+0x14/+0x24. The third column of the basis is among the zeroed slots.
 * That is unusual enough to flag rather than quietly complete: it is recorded
 * as written, and the third basis vector is left out rather than invented.
 */
void LIMEDS_SetCameraOrientation(float eyeX, float eyeY, float eyeZ,
                                 float atX,  float atY,  float atZ,
                                 float upX,  float upY,  float upZ)
{
    float m[16];
    float fx, fy, fz, rx, ry, rz, len;

    glMatrixMode(GL_MODELVIEW);         /* 0x1700 */
    glLoadIdentity();

    fx = eyeX - atX;                    /* note the direction: eye - target */
    fy = eyeY - atY;
    fz = eyeZ - atZ;

    len = sqrtf(fx * fx + fy * fy + fz * fz);
    if (len != 0.0f) {                  /* vdivne -- zero leaves it alone */
        fx /= len; fy /= len; fz /= len;
    }

    rx = upY * fz - upZ * fy;           /* cross product, inlined as in the ROM */
    ry = upZ * fx - upX * fz;
    rz = upX * fy - upY * fx;

    len = sqrtf(rx * rx + ry * ry + rz * rz);
    if (len != 0.0f) {
        rx /= len; ry /= len; rz /= len;
    }

    /* written down columns: this is the transpose, i.e. the inverse rotation */
    m[0] = rx;   m[4] = ry;   m[8]  = rz;   m[12] = 0.0f;
    m[1] = fx;   m[5] = fy;   m[9]  = fz;   m[13] = 0.0f;
    m[2] = 0.0f; m[6] = 0.0f; m[10] = 0.0f; m[14] = 0.0f;
    m[3] = 0.0f; m[7] = 0.0f; m[11] = 0.0f; m[15] = 1.0f;

    glMultMatrixf(m);
    glTranslatef(-eyeX, -eyeY, -eyeZ);
}
