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


/* ------------------------------------------------------- DrawSkinnedMesh2
 *
 * armv6 0x00083d10, 2152 bytes.
 * __Z16DrawSkinnedMesh2P8SKININFOjjlP11limeVECTOR3P11limeVECTOR2Phll
 *
 * The whole skinning loop: one iteration per vertex, four bone influences each,
 * producing a position, a normal and a lit vertex colour.
 *
 * This function is what settles the .skin format's remaining unknowns, so the
 * findings are worth stating before the code.
 *
 *  - **`indexes` is four packed bytes, not an integer.** The loop does
 *    `ldrb r3,[r6]`, `ldrb r3,[r6,#1]`, `[r6,#2]`, `[r6,#3]` and advances r6 by
 *    4 per vertex. Each byte is a bone index and **0xFF means "slot unused"**.
 *    The docs recorded these values as mysteriously negative; they were never
 *    signed -- an unused fourth slot puts 0xFF in the top byte, which sets the
 *    sign bit of the word.
 *
 *  - **`matricesA` is positions and `matricesB` is normals.** A is read at
 *    +0,+4,+8 then +0xc,+0x10,+0x14 and so on -- four vec3s, one per influence
 *    -- and feeds the position path. B feeds Xform2 and the result is passed
 *    straight to Normalise. An earlier note guessed this from B[0] being unit
 *    length and A[0] looking like a coordinate; the code confirms it.
 *
 *  - **The vectors are pre-multiplied by their weight.** That is why the
 *    rotation needs no weight (it is already in A and B) while the translation
 *    term is explicitly `w * m[9..11]`. It also explains Xform2 ignoring its
 *    weight argument beyond the zero test.
 *
 *  - **`num_matrices` is a vertex count.** The loop terminates on SKININFO+4
 *    and advances one entry per iteration: indexes +4, weights +0x10,
 *    matricesA +0x30.
 *
 * The position path is inlined rather than calling Xform2, because unlike the
 * normal it needs the translation row:
 *
 *      out.x = SUM over i of ( A[i].x*m[0] + A[i].y*m[3] + A[i].z*m[6]
 *                              + w[i]*m[9]  )
 *
 * and likewise y with m[1],m[4],m[7],m[10] and z with m[2],m[5],m[8],m[11].
 *
 * The normal path is the same rotation with no translation, via Xform2, then
 * Normalise, then LightVert -- whose result is scaled, clamped, narrowed to a
 * byte and written as R=G=B with alpha 0xFF. So **vertex colour is the lit
 * skinned normal**, which is what gives these characters their shading with no
 * per-pixel lighting anywhere.
 *
 * Output strides, from the cursor arithmetic at the loop tail: 24 bytes per
 * vertex on one cursor, 48 on another, 6 on the third.
 */
void DrawSkinnedMesh2(SKININFO *skin, unsigned a, unsigned b, long flags,
                      limeVECTOR3 *outPos, limeVECTOR2 *outUV,
                      unsigned char *outCol, long e, long f)
{
    const unsigned char *idx  = skin->indexes;      /* SKININFO+0x20 */
    const float         *wgt  = skin->weights;      /* SKININFO+0x24 */
    const limeVECTOR3   *A    = skin->matricesA;    /* SKININFO+0x14 */
    const limeVECTOR3   *B    = skin->matricesB;    /* SKININFO+0x28 */
    long i, k;

    for (i = 0; i < skin->numVerts; i++) {
        limeVECTOR3 pos = { 0.0f, 0.0f, 0.0f };
        limeVECTOR3 nrm = { 0.0f, 0.0f, 0.0f };
        limeVECTOR3 lit;

        for (k = 0; k < 4; k++) {
            unsigned bone = idx[k];
            const SKINMATRIX43 *m;

            if (bone == 0xFF)               /* empty influence slot */
                continue;

            m = &g_matrixPalette[bone];     /* 48-byte stride */

            /* position: rotation from the pre-weighted vector, translation
             * scaled by the weight itself */
            pos.x += A[k].x*m->m[0] + A[k].y*m->m[3] + A[k].z*m->m[6]
                     + wgt[k]*m->t[0];
            pos.y += A[k].x*m->m[1] + A[k].y*m->m[4] + A[k].z*m->m[7]
                     + wgt[k]*m->t[1];
            pos.z += A[k].x*m->m[2] + A[k].y*m->m[5] + A[k].z*m->m[8]
                     + wgt[k]*m->t[2];

            /* normal: same rotation, no translation */
            Xform2(&A[k], &B[k], NULL, &nrm, m, wgt[k]);
        }

        Normalise(&nrm);
        LightVert(&nrm, &lit);

        /* lit value -> one grey byte, alpha forced opaque */
        {
            float s = lit.x * LIGHT_SCALE;
            unsigned char c = (s < 0.0f) ? 0 : (unsigned char)s;
            outCol[0] = c;
            outCol[1] = c;
            outCol[2] = c;
            outCol[3] = 0xFF;
        }

        *outPos++ = pos;
        outCol += 4;
        idx += 4;                           /* four packed bone indices */
        wgt += 4;                           /* four floats */
        A   += 4;                           /* four vec3s = 48 bytes */
        B   += 4;
    }
}


/* ---------------------------------------------------------- NormaliseLDirs
 *
 * armv6 0x00083c38, 216 bytes.  __Z14NormaliseLDirsv
 *
 * Normalises the engine's **two** directional lights in place. There are
 * exactly two, held as six global floats, and this runs once to make them unit
 * length. The reciprocal square root is computed in **double** and narrowed --
 * the same accuracy habit as CreatePerspectiveMatrix.
 */
void NormaliseLDirs(void)
{
    double k;

    k = 1.0 / sqrt((double)(g_lightDir0[0]*g_lightDir0[0] +
                            g_lightDir0[1]*g_lightDir0[1] +
                            g_lightDir0[2]*g_lightDir0[2]));
    g_lightDir0[0] *= (float)k;
    g_lightDir0[1] *= (float)k;
    g_lightDir0[2] *= (float)k;

    k = 1.0 / sqrt((double)(g_lightDir1[0]*g_lightDir1[0] +
                            g_lightDir1[1]*g_lightDir1[1] +
                            g_lightDir1[2]*g_lightDir1[2]));
    g_lightDir1[0] *= (float)k;
    g_lightDir1[1] *= (float)k;
    g_lightDir1[2] *= (float)k;
}


/* --------------------------------------------------------------- LightVert
 *
 * armv6 0x00083ab8, 384 bytes.  __Z9LightVertP11limeVECTOR3S0_
 *
 * **The entire lighting model of the game.** Two directional lights, a power
 * falloff on each, summed, clamped to 1, written as a single scalar.
 *
 * Three things are worth stating because they are unusual:
 *
 *  - **There is no ambient term.** The accumulator starts at literal 0.0f
 *    (verified at 0x83c00), so a surface facing away from both lights is
 *    fully black.
 *  - **The dot product is negated.** -dot(N, L) means the stored light vectors
 *    point *from* the surface *toward* the light, the opposite of the usual
 *    convention. Getting this backwards lights the model inside out.
 *  - **Each light is raised to a power**, via a real pow() call -- two of them,
 *    per vertex. On a 2011 iPhone that is an expensive choice, and it is what
 *    gives these characters their hard, almost rim-lit falloff instead of a
 *    soft Lambert ramp.
 *
 * The result is **monochrome**: one float, which DrawSkinnedMesh2 writes as
 * R = G = B with alpha 0xFF. Lighting is a grey multiplier over the texture,
 * never a coloured light.
 */
void LightVert(const limeVECTOR3 *n, float *out)
{
    float l = 0.0f;                      /* no ambient -- literal 0.0f */
    float d;

    d = -(n->x * g_lightDir0[0] + n->y * g_lightDir0[1] + n->z * g_lightDir0[2]);
    if (d < 0.0f)
        d = 0.0f;
    l += g_lightPower0 * (float)pow((double)d, (double)g_lightExp0);

    d = -(n->x * g_lightDir1[0] + n->y * g_lightDir1[1] + n->z * g_lightDir1[2]);
    if (d < 0.0f)
        d = 0.0f;
    l += g_lightPower1 * (float)pow((double)d, (double)g_lightExp1);

    if (l > 1.0f)                        /* ceiling, verified at 0x83c04 */
        l = 1.0f;
    *out = l;
}


/* -------------------------------------------------------- MatrixIdentity2
 *
 * armv6 0x0008314c, 32 bytes.  __Z15MatrixIdentity2P12SKINMATRIX43
 *
 * Writes 1.0f at byte offsets 0x00, 0x10 and 0x20 and zero everywhere else --
 * that is, at m[0], m[4] and m[8].
 *
 * Which is a third independent confirmation of the SKINMATRIX43 layout: the
 * diagonal of a 3x3 identity lands at 0, 4 and 8 only if the rotation is nine
 * floats at **stride 3**. A genuine 4x3 would put it at 0, 5 and 10.
 */
void MatrixIdentity2(SKINMATRIX43 *m)
{
    int i;
    for (i = 0; i < 12; i++)
        m->m[i] = 0.0f;
    m->m[0] = m->m[4] = m->m[8] = 1.0f;
}


/* --------------------------------------------------------- LIME_FreeBones
 *
 * armv6 0x00083644, 24 bytes.
 *
 * Frees the bone array and then the BONESINFO itself. A NULL argument returns
 * immediately.
 *
 * Confirms BONESINFO is exactly what SKIN-FORMAT.md says: a pointer to the
 * bones at +0x00 and a count at +0x04, with nothing else owning memory.
 */
void LIME_FreeBones(BONESINFO *info)
{
    if (info == NULL)
        return;
    limeFree(info->bones);
    limeFree(info);
}


/* ------------------------------------------------------- GenerateMatrices
 *
 * armv6 0x00083634, 28 bytes.
 *
 * Swaps two arguments and tail-calls
 * CreateMatrixPaletteForGeneratingMesh. Nothing else. The two functions differ
 * only in the order they take their parameters, which usually means one of
 * them is the older signature kept for callers that were never updated.
 */
void GenerateMatrices(char *dst, BONESINFO *bones, long a, long b,
                      float t, long flags)
{
    CreateMatrixPaletteForGeneratingMesh(dst, a, b, flags, t, bones);
}
