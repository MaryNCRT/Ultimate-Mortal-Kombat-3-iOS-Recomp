/*
 * lime/common/RenderSkinned.cpp -- the skinning pipeline.
 *
 * Recovered from the **armv6 slice**, not armv7. The armv7 build of this file
 * is packed-NEON throughout, which Ghidra mis-decompiles (see
 * docs/LIME-ENGINE.md); the armv6 build of the same source is plain scalar VFP
 * and reads straight off the disassembly. Same C, two code generators.
 *
 * Addresses below are armv6 unless marked otherwise.
 *
 * Status: Xform2 and GetMFromQuat2 are complete and exact -- every instruction
 * is accounted for. CreateMatrixPaletteRecurse2 is structurally complete; the
 * three globals it walks are named by role, not yet by symbol.
 */

#include "lime.h"

/* ------------------------------------------------------------------ types
 *
 * SKINMATRIX43 is 48 bytes: a 3x3 rotation stored as three rows of three,
 * followed by a translation. Note the rotation stride is **3, not 4** -- the
 * name says 4x3 but the rotation rows are packed tight and the translation is
 * simply the last three floats.
 *
 *      float m[9];     rotation, row-major, m[row*3 + col]
 *      float t[3];     translation
 *
 * This is not an assumption. Xform2 loads the rotation at byte offsets
 * 0,4,8,0xc,0x10,0x14,0x18,0x1c,0x20 and never touches anything past 0x20,
 * while CreateMatrixPaletteRecurse2 writes the bone's position into 0x24,
 * 0x28, 0x2c of the same struct.
 *
 * BONEANIMFRAME is 20 bytes. The first 16 are a quaternion; the fifth word is
 * copied along with the rest but is not consumed by anything decompiled so far.
 *
 * BONE, as far as this function needs it:
 *      +0x00   BONE *child         (recursion terminates on NULL)
 *      +0x04   float x
 *      +0x08   float y
 *      +0x0c   float z
 */


/* ------------------------------------------------------------------ Xform2
 *
 * armv6 0x00082f48, 144 bytes.
 * __Z6Xform2P11limeVECTOR3S0_S0_S0_P12SKINMATRIX43f
 *
 * Transforms one vertex by one bone matrix and **accumulates** into the
 * destination. That accumulation is the whole point: a vertex driven by three
 * bones is Xform2'd three times into the same output, and the sum is the
 * skinned position.
 *
 * Two things about this function are worth stating plainly because they are
 * easy to get wrong from the C signature alone:
 *
 *  - **Only the rotation is applied.** The translation at m[9..11] is never
 *    read. Bone translation enters through the matrix palette instead, when
 *    MatrixMul2 composes a bone with its parent.
 *
 *  - **The weight is only tested, never multiplied.** `w` is compared against
 *    zero and the function returns early if it is zero; after that the value is
 *    discarded. So the caller passes a matrix that has already been scaled by
 *    the weight, and `w` survives only as a skip test. Reading `w` as a blend
 *    factor here would be wrong.
 *
 * The first and third arguments are unused in the compiled code. The compiler
 * kept them in the signature; nothing reads r0 or the original r2.
 */
void Xform2(limeVECTOR3 *unused0, const limeVECTOR3 *vin,
            limeVECTOR3 *unused2, limeVECTOR3 *vout,
            const SKINMATRIX43 *m, float w)
{
    float x, y, z;

    if (w == 0.0f)                      /* vcmp.f32 s15,#0 / bxeq lr */
        return;

    x = vin->x;
    y = vin->y;
    z = vin->z;

    vout->x += x * m->m[0] + y * m->m[3] + z * m->m[6];
    vout->y += x * m->m[1] + y * m->m[4] + z * m->m[7];
    vout->z += x * m->m[2] + y * m->m[5] + z * m->m[8];
}


/* ----------------------------------------------------------- GetMFromQuat2
 *
 * armv6 0x00083188, 184 bytes.
 * __Z13GetMFromQuat2P13BONEANIMFRAMEP12SKINMATRIX43
 *
 * Quaternion to rotation matrix, the ordinary formula with no surprises. It
 * writes the nine rotation floats and leaves the translation alone, which is
 * why the caller fills those in afterwards.
 *
 * **The quaternion is stored (x, y, z, w) -- w last.** That falls out of
 * matching the nine outputs against the standard conversion, and it is the one
 * thing here a .bones parser has to get right.
 *
 * The 1.0f is a literal in the pool at 0x8323c, which the disassembler renders
 * as `svclo #0x800000` because it is data: 0x3F800000.
 */
void GetMFromQuat2(const BONEANIMFRAME *q, SKINMATRIX43 *out)
{
    const float x = q->q[0], y = q->q[1], z = q->q[2], w = q->q[3];

    const float xx = 2.0f * x * x, yy = 2.0f * y * y, zz = 2.0f * z * z;
    const float xy = 2.0f * x * y, xz = 2.0f * x * z, yz = 2.0f * y * z;
    const float wx = 2.0f * w * x, wy = 2.0f * w * y, wz = 2.0f * w * z;

    out->m[0] = 1.0f - (yy + zz);
    out->m[1] = xy + wz;
    out->m[2] = xz - wy;

    out->m[3] = xy - wz;
    out->m[4] = 1.0f - (xx + zz);
    out->m[5] = yz + wx;

    out->m[6] = xz + wy;
    out->m[7] = yz - wx;
    out->m[8] = 1.0f - (xx + yy);
}


/* -------------------------------------------- CreateMatrixPaletteRecurse2
 *
 * armv6 0x00083240, 356 bytes.
 * __Z27CreateMatrixPaletteRecurse2P4BONEP12SKINMATRIX43
 *
 * Walks the bone tree depth-first, composing each bone with its parent and
 * emitting the result into a flat matrix palette. This is the function that
 * turns a hierarchy into the array Xform2 indexes.
 *
 * It runs on three global cursors rather than parameters, which is why the
 * signature looks smaller than the work it does:
 *
 *   - an **animation frame cursor**, advanced 20 bytes per bone. Each step
 *     yields one BONEANIMFRAME. The frames are therefore laid out in the same
 *     depth-first order as the bones.
 *   - a **second cursor** advanced by the same 20 bytes in lockstep.
 *   - a **palette write cursor**, advanced 48 bytes per bone -- one
 *     SKINMATRIX43 each.
 *
 * The order of operations per bone:
 *
 *   1. copy 20 bytes from the frame cursor into a local BONEANIMFRAME
 *   2. GetMFromQuat2 -> the 3x3 rotation of a local matrix
 *   3. write bone->x, bone->y, bone->z into that matrix's translation
 *   4. if a global counter is still zero, replace that translation with three
 *      floats from a global instead. This fires once, on the first bone
 *      visited, and the counter is incremented immediately after -- so **the
 *      root bone takes its position from a global rather than from the file**.
 *      That global is where the character's world position enters the skeleton.
 *   5. MatrixMul2(local, parent, result)
 *   6. copy the 48-byte result to the palette cursor and advance it
 *   7. recurse into bone->child while it is non-NULL
 *
 * Step 4 is the part worth remembering: a .bones file's root translation is
 * not what gets used at runtime.
 */
void CreateMatrixPaletteRecurse2(BONE *bone, SKINMATRIX43 *parent)
{
    BONEANIMFRAME frame;
    SKINMATRIX43 local, result;

    /* 1-2: one frame per bone, in tree order */
    frame = *(const BONEANIMFRAME *)g_animFrameCursor;
    GetMFromQuat2(&frame, &local);

    /* 3: the bone's own offset becomes the translation */
    local.t[0] = bone->x;
    local.t[1] = bone->y;
    local.t[2] = bone->z;

    /* 4: the first bone visited is the root, and it is placed by the caller */
    if (g_boneCounter == 0) {
        local.t[0] = g_rootPosition[0];
        local.t[1] = g_rootPosition[1];
        local.t[2] = g_rootPosition[2];
    }

    g_animFrameCursor += 20;
    g_animFrameCursor2 += 20;
    g_boneCounter++;

    /* 5-6: compose with the parent and emit */
    MatrixMul2(&local, parent, &result);
    *(SKINMATRIX43 *)g_paletteCursor = result;
    g_paletteCursor += 48;

    /* 7: depth first */
    if (bone->child != NULL)
        CreateMatrixPaletteRecurse2(bone->child, &result);

    /* the sibling walk continues past the excerpt disassembled so far */
}
