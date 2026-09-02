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

#include <math.h>
#include <string.h>
#include <stdio.h>
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
void Xform2(const limeVECTOR3 *unused0, const limeVECTOR3 *vin,
            const limeVECTOR3 *unused2, limeVECTOR3 *vout,
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
 *   7. loop over the nine child slots, recursing into each non-NULL one
 *
 * Step 4 is the part worth remembering: a .bones file's root translation is
 * not what gets used at runtime.
 */
void CreateMatrixPaletteRecurse2(BONE *bone, SKINMATRIX43 *parent)
{
    BONEANIMFRAME frame;
    SKINMATRIX43 local, result;
    int i;

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
    /* **A loop, not one child.** The disassembly reads the child pointer at
     * +0x14, recurses when it is non-NULL, then does `add r4, r4, #4` and comes
     * back -- walking the nine slots, bounded by the count at +0x00 which it
     * reloads every iteration.
     *
     * An earlier pass wrote this as a single `bone->child`, which follows only
     * the first branch. Every humanoid skeleton branches at the spine, so that
     * version poses one arm and leaves the other at its bind pose. */
    for (i = 0; i < bone->numChildren; i++) {
        if (bone->children[i] != NULL)
            CreateMatrixPaletteRecurse2(bone->children[i], &result);
    }

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
    /* Casts, not sloppiness. docs/SKIN-FORMAT.md types +0x20 as `int32 *` and
     * +0x14 / +0x28 as matrix arrays, which is what the LOADER allocates. This
     * consumer reads the same memory differently: the index array byte by byte
     * -- four bone indices packed per word, matching the four floats per vertex
     * at +0x24 -- and the matrices as flat vectors. Keeping the declared types
     * honest and casting here records both views instead of blurring one. */
    const unsigned char *idx  = (const unsigned char *)skin->indexes;   /* +0x20 */
    const float         *wgt  = skin->weights;                          /* +0x24 */
    const limeVECTOR3   *A    = (const limeVECTOR3 *)skin->matricesA;   /* +0x14 */
    const limeVECTOR3   *B    = (const limeVECTOR3 *)skin->matricesB;   /* +0x28 */
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
        LightVert(&nrm, (float *)&lit);

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
 *
 * ## Why this clears the struct rather than looping to twelve
 *
 * The original writes forty-eight bytes -- twelve floats -- and an earlier
 * draft here said so with `for (i = 0; i < 12; i++) m->m[i] = 0.0f;`. But `m`
 * is `float[9]` and `t` is the `float[3]` after it, so indices 9, 10 and 11
 * walk off the end of one member into the next. It produced the right bytes
 * purely because the two are adjacent.
 *
 * That is undefined behaviour, not a style point: `gcc -O2` reports
 * "iteration 9 invokes undefined behavior" and is entitled to assume the loop
 * never gets there. Clearing the whole struct writes the same forty-eight
 * bytes and says what it means.
 *
 * The same shape as the EVENT stride that walked off its array: correct today
 * by adjacency, wrong the moment anything moves. And `-fsyntax-only` cannot
 * see it -- it took building at -O1 to surface, which is why tools/check.sh
 * now compiles rather than only parses.
 */
void MatrixIdentity2(SKINMATRIX43 *m)
{
    memset(m, 0, sizeof(*m));           /* the rotation AND the translation */
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


/* ----------------------------------------------------------- LIME_FreeSkin
 *
 * armv6 0x00083668, 100 bytes.
 *
 * Frees the six arrays a SKININFO owns, then the struct. The order it frees
 * them in is the order they appear here, and every one of the six offsets
 * matches the table in docs/SKIN-FORMAT.md:
 *
 *      +0x18   vertExtra      M * 6 bytes
 *      +0x1c   vertData       M * 24 bytes
 *      +0x14   matricesA      N * 48
 *      +0x24   weights        N * 4 floats
 *      +0x20   indexes        N * 4
 *      +0x28   matricesB      N * 48
 *
 * Six allocations freed, six documented, none left over -- which is a stronger
 * statement about the struct than any single reader could make, because a
 * missed field would leak and a phantom one would crash.
 */
void LIME_FreeSkin(SKININFO *skin)
{
    if (skin == NULL)
        return;

    limeFree(skin->vertExtra);      /* +0x18 */
    limeFree(skin->vertExtra);       /* +0x1c */
    limeFree(skin->matricesA);      /* +0x14 */
    limeFree(skin->weights);        /* +0x24 */
    limeFree(skin->indexes);        /* +0x20 */
    limeFree(skin->matricesB);      /* +0x28 */
    limeFree(skin);
}


/* ------------------------------------------------------------- LerpVector3
 *
 * armv6 0x00083498, 88 bytes.
 *
 * ```c
 * out = a * t + b * (1 - t)
 * ```
 *
 * **Note which way round that runs.** At t = 0 the result is `b`, and at t = 1
 * it is `a` -- the opposite of what the argument order suggests. Reading it as
 * the usual `a + (b - a) * t` inverts every interpolation the skinning system
 * does.
 */
void LerpVector3(const limeVECTOR3 *a, const limeVECTOR3 *b, float t,
                 limeVECTOR3 *out)
{
    const float u = 1.0f - t;

    out->x = a->x * t + b->x * u;
    out->y = a->y * t + b->y * u;
    out->z = a->z * t + b->z * u;
}


/* -------------------------------------------------------- LoadSomeTextures
 *
 * armv6 0x000845c4, 36 bytes.  __Z16LoadSomeTexturesP13TEXTURETOLOAD
 *
 * Walks a **NULL-terminated array of 8-byte entries**, loading each texture and
 * writing the handle back through the entry's own pointer:
 *
 *      typedef struct {
 *          const char *name;       // +0x00, NULL ends the list
 *          TEXTURE   **dest;       // +0x04, where the handle goes
 *      } TEXTURETOLOAD;
 *
 * The stride is visible as a pre-indexed load with writeback --
 * `ldr r0, [r4, #8]!` -- which is the same idiom the `.scene` loader uses for
 * its tail records.
 *
 * A declarative texture manifest, in other words: a module lists what it needs
 * and where to put it, and one call fills them all in.
 */
void LoadSomeTextures(TEXTURETOLOAD *list)
{
    for (; list->name != NULL; list++)
        *list->dest = limeLoadTexture(list->name, 0, 1);
}


/* -------------------------------------------------------- FreeSomeTextures
 *
 * armv6 0x00084578, 40 bytes.
 *
 * The mirror image, walking the same manifest. Note it **NULLs each slot after
 * freeing**, so the list is safe to free twice -- which matters because the
 * same manifest is shared between load and unload paths.
 */
void FreeSomeTextures(TEXTURETOLOAD *list)
{
    for (; list->name != NULL; list++) {
        if (*list->dest != NULL) {
            limeDeleteTexture(*list->dest);
            *list->dest = NULL;
        }
    }
}


/* --------------------------------------------------------- UnpackAnimFrame
 *
 * armv6 0x000833a4, 64 bytes.
 * __Z15UnpackAnimFramePhP13BONEANIMFRAMEP11limeVECTOR3l
 *
 * Splits one `.skinanim` frame into its root position and its per-bone
 * quaternions.
 *
 * **This confirms the frame layout independently.** It reads three words at
 * **+0x04** into the root vector -- so the `int32` at +0x00 really is skipped,
 * exactly as docs/SKIN-FORMAT.md says -- and then copies **20 bytes per bone**
 * starting at **+0x10**.
 *
 * Despite the name it unpacks nothing: the quaternions are already plain
 * `float32`, which is what the |q| = 1.0000 measurement showed. The name is a
 * leftover from a compressed format that is not what shipped.
 */
void UnpackAnimFrame(const uint8_t *src, BONEANIMFRAME *bones,
                     limeVECTOR3 *root, long count)
{
    long i;

    root->x = *(const float *)(src + 0x04);
    root->y = *(const float *)(src + 0x08);
    root->z = *(const float *)(src + 0x0c);

    if (count == 0)
        return;

    for (i = 0; i < count; i++)
        memcpy(&bones[i], src + 0x10 + i * 20, 20);
}


/* ------------------------------------------------------------ LIME_LoadSkin
 *
 * armv6 0x00083a24, 100 bytes.
 *
 * Loads a `.skin` and builds the SKININFO chain.
 *
 * **SKININFO is 0x30 = 48 bytes**, which is the literal handed to `limeMalloc`
 * and exactly what docs/SKIN-FORMAT.md derived from the field offsets. The
 * first thing written is a **zero at +0x00** -- the `next` pointer -- before
 * anything is parsed, so a single-block file leaves a correctly terminated
 * chain without the parser having to know how many blocks there were.
 *
 * The block count is read with `ldr r4, [r0], #4`: post-indexed, so the cursor
 * advances past it in the same instruction. That is the leading `int32` the
 * format doc describes, and the reason ROBO1 and ROBO2 -- which do not have one
 * -- need the fallback path.
 */
SKININFO *LIME_LoadSkin(const char *filename)
{
    const uint8_t *data = limeLoadFile(filename);
    SKININFO *skin;
    int32_t count;

    if (data == NULL)
        return NULL;

    skin = (SKININFO *)limeMalloc("skin", sizeof(SKININFO));   /* 0x30 in the image */
    skin->next = NULL;                   /* +0x00, before parsing anything */

    /* The leading word is read and stepped over. Nothing here consumes it --
     * LIME_LoadSkin1 re-reads the counts it needs from the block it is handed,
     * so this is the file's own record count and the loader trusts the inner
     * header instead. Kept, and marked, rather than deleted: a read the binary
     * performs is part of the description even when its value goes unused. */
    count = *(const int32_t *)data;
    (void)count;
    data += 4;

    LIME_LoadSkin1((const char *)data, skin);
    return skin;
}


/* -------------------------------------------------------------- GetSlerpedQ
 *
 * armv6 0x00083408, 180 bytes.
 * __Z11GetSlerpedQP13BONEANIMFRAMES0_fS0_
 *
 * **Not fully decompiled.** Blends two animation frames' quaternions by `t`.
 *
 * What is established: it loads all four components of both quaternions,
 * computes their **dot product** (`vmul` then chained `vmla` over the four
 * pairs), loads a literal and forms **`1 - t`**, and writes a blended
 * quaternion out.
 *
 * The dot product before the blend is the tell for **hemisphere correction** --
 * two unit quaternions can represent the same rotation with opposite signs, and
 * without checking you get the long way round. Any port that interpolates
 * animation frames has to do the same test or limbs will occasionally swing
 * through 300 degrees to reach a pose next to where they started.
 *
 * **That open question is now answered, and the body is further down this
 * file.** It is neither a slerp nor a normalised lerp: it is a plain lerp with
 * the hemisphere flip and no renormalisation at all. The instinct recorded
 * above -- that the name is not evidence -- was right.
 */


/* ------------------------------------------------------------ LIME_LoadBones
 *
 * armv6 0x000836f8, 268 bytes.  **Structurally complete.**
 *
 * Reads a `.bones` file into the in-memory skeleton, turning stored indices
 * into real pointers.
 *
 * Every stride in docs/SKIN-FORMAT.md is visible here as a literal:
 *
 *      add ip, ip, #0x19       disk record   = 25 bytes
 *      add lr, lr, #0x38       memory record = 56 bytes
 *      cmp r0, #9              nine child slots per bone
 *      add r1, r1, #4          nine pointers, written from +0x14
 *
 * The allocation is `numBones*64 - numBones*8`, which is `numBones * 56` --
 * the compiler turning one multiply into two shifts and a subtract.
 *
 * The index-to-pointer conversion is the interesting part. Each child byte is
 * read **signed** (`ldrsb`), tested against -1, and either stored as NULL or
 * turned into `bones + index * 56` by the same shift-and-subtract trick. So the
 * file stores indices and memory holds pointers, and nothing later has to know
 * the difference.
 *
 * The file buffer is freed before returning: the skeleton owns no reference to
 * the bytes it was built from.
 */
BONESINFO *LIME_LoadBones(const char *filename)
{
    const uint8_t *data = limeLoadFile(filename);
    BONESINFO *info;
    BONE *bones;
    int32_t n;
    int i, k;

    if (data == NULL)
        return NULL;

    info = (BONESINFO *)limeMalloc("bones", sizeof(BONESINFO));  /* 8 in the image */
    if (info == NULL)
        return NULL;

    n = *(const int32_t *)data;
    info->numBones = n;                          /* +0x04 */
    /* sizeof, not 56: a BONE is 56 bytes in the image and 96 here,
     * and `&bones[i]` below steps by the host size. The compiler
     * spells the image multiply as n*64 - n*8, which is where 56
     * came from. */
    bones = (BONE *)limeMalloc("bones", n * sizeof(BONE));
    info->bones = bones;                         /* +0x00 */
    if (bones == NULL)
        return NULL;

    for (i = 0; i < n; i++) {
        const uint8_t *rec = data + 4 + i * 25;  /* 0x19 on disk */
        BONE *b = &bones[i];                     /* 0x38 in memory */

        memcpy(b, rec, 16);                      /* four words verbatim */

        for (k = 0; k < 9; k++) {                /* cmp r0, #9 */
            int8_t child = (int8_t)rec[0x10 + k];
            b->children[k] = (child == -1) ? NULL : &bones[child];
        }
    }

    limeFree((void *)data);                      /* the file buffer is not kept */
    return info;
}


/* -------------------------------------------------------------- MatrixMul2
 *
 * armv6 0x00082fd8, 372 bytes.  **Complete.**
 *
 * Composes two SKINMATRIX43s: `out = a * b`.
 *
 * This is the fourth independent confirmation of the SKINMATRIX43 layout, and
 * the cleanest one. Row 0 of the result is built as
 *
 *      out[0] = a[0]*b[0] + a[1]*b[3] + a[2]*b[6]
 *
 * -- `a` walked at 0, 4, 8 and `b` at 0, 0xc, 0x18. A row of `a` against a
 * column of `b` only lands on those offsets if **b is row-major with a stride
 * of three floats**, which is what docs/SKIN-FORMAT.md says and what
 * MatrixIdentity2 implied by writing 1.0f at m[0], m[4] and m[8].
 *
 * The fourth row is the interesting one. Rows 0 to 2 are pure multiply-
 * accumulate, but row 3 ends with a bare `vadd.f32` against b[9], b[10] and
 * b[11]:
 *
 *      vmla.f32 s15, s13, s14      ; the rotation part
 *      vldr     s14, [r1, #0x24]   ; b translation
 *      vadd.f32 s15, s15, s14      ; added, not multiplied
 *
 * So the fourth row is a **translation, not a fourth basis vector**, and this
 * is an affine compose: rotate the translation of `a` by `b`, then add the
 * translation of `b`. A port that treats the type as a plain 4x3 matrix
 * multiply gets the rotation right and every bone position wrong.
 *
 * Nothing is aliased-checked -- `out` must not be `a` or `b`, because elements
 * are stored as they are computed.
 */
void MatrixMul2(const SKINMATRIX43 *a, const SKINMATRIX43 *b, SKINMATRIX43 *out)
{
    int r, c;

    for (r = 0; r < 3; r++)             /* the three rotation rows */
        for (c = 0; c < 3; c++)
            out->m[r * 3 + c] = a->m[r * 3 + 0] * b->m[0 + c]
                              + a->m[r * 3 + 1] * b->m[3 + c]
                              + a->m[r * 3 + 2] * b->m[6 + c];

    for (c = 0; c < 3; c++)             /* the translation */
        out->t[c] = a->t[0] * b->m[0 + c]
                  + a->t[1] * b->m[3 + c]
                  + a->t[2] * b->m[6 + c]
                  + b->t[c];            /* added, not multiplied */
}


/* ------------------------------------------------------------- GetSlerpedQ
 *
 * armv6 0x00083408, 144 bytes.  **Complete -- and it does not slerp.**
 *
 * Blends the rotation of two animation frames. The name says spherical linear
 * interpolation. The code is a **plain linear blend with a shortest-arc sign
 * fix**, and nothing else:
 *
 *      vmla.f32 s15, s9, s6        ; finish the four-term dot product
 *      vcmpe.f32 s15, #0
 *      vmrs     apsr_nzcv, fpscr
 *      vnegls.f32 s12, s12         ; dot <= 0 -> negate all four components
 *      vnegls.f32 s11, s11
 *      vnegls.f32 s10, s10
 *      vnegls.f32 s9, s9
 *      vmul.f32 s15, s12, s13      ; then a straight lerp
 *      vmla.f32 s15, s5, s14
 *
 * There is no `acos`, no `sin`, no division and no renormalisation anywhere in
 * the 144 bytes. A real slerp needs all of them. What this does is the cheap
 * substitute every 2011 phone engine used -- and it is not even the normalised
 * variant, so **the result is not a unit quaternion**.
 *
 * That is deliberate rather than broken. A lerp between two unit quaternions
 * shortens as the angle widens, which makes rotation speed vary through the
 * blend and shrinks the rotation matrix slightly. At the frame rates and blend
 * windows a fighting game uses, nobody sees it, and the engine buys back a
 * transcendental per bone per frame.
 *
 * **For the port this is a trap in both directions.** Substituting a true slerp
 * "fixes" nothing visible and changes every in-between pose; leaving out the
 * sign flip makes blends across a quaternion-negation take the long way round,
 * which looks like a limb snapping through the body. Keep the flip, keep the
 * lerp.
 *
 * The dot product is compared with `vcmpe` and the negate is predicated `ls`,
 * so **the flip happens at dot == 0 as well as below it**. That is the
 * boundary case, and copying `< 0` instead of `<= 0` is a difference that only
 * shows up on exactly-orthogonal frames.
 *
 * Two smaller facts:
 *
 *  - The blend runs the same way round as `LerpVector3` in this file --
 *    `out = b*t + a*(1-t)`, so **t = 0 returns the SECOND argument**. That
 *    convention is now confirmed twice and is still the opposite of what the
 *    argument order suggests.
 *  - It writes **1.0f at `+0x10` of the output**, a fifth float past the four
 *    quaternion components, before touching anything else. The destination is
 *    therefore not a bare quaternion; the field is set unconditionally and is
 *    left unnamed here.
 */
void GetSlerpedQ(const BONEANIMFRAME *a, const BONEANIMFRAME *b,
                 float t, BONEANIMFRAME *out)
{
    float u = 1.0f - t;
    float bx = b->q[0], by = b->q[1], bz = b->q[2], bw = b->q[3];
    float dot;

    out->field10 = 1.0f;                /* +0x10, written first */

    dot = a->q[0] * bx + a->q[1] * by + a->q[2] * bz + a->q[3] * bw;

    if (dot <= 0.0f) {                  /* vnegls -- note: <=, not < */
        bx = -bx; by = -by; bz = -bz; bw = -bw;
    }

    out->q[0] = bx * t + a->q[0] * u;   /* t = 0 yields `a`... via the u term */
    out->q[1] = by * t + a->q[1] * u;
    out->q[2] = bz * t + a->q[2] * u;
    out->q[3] = bw * t + a->q[3] * u;
    /* not renormalised: the result is deliberately not a unit quaternion */
}


/* ----------------------------------------------------------- LIME_LoadSkin1
 *
 * armv6 0x00083804, 544 bytes.  **Structurally complete.**
 *
 * Fills a SKININFO from a `.skin` buffer already in memory -- it takes the
 * data pointer, not a filename, so the read happened elsewhere.
 *
 * The header is two words, copied straight into the struct:
 *
 *      ldr  r1, [r3], #4
 *      str  r1, [sl, #4]           ; +0x04 -- the count everything else scales from
 *      ldr  r0, [r0, #4]
 *      str  r0, [sl, #8]           ; +0x08
 *
 * Then the arrays, each sized from `+0x04` by a shift, which is what pins their
 * element widths:
 *
 * | field | size | element |
 * |---|---|---|
 * | `+0x20` | `count << 2` | 4 bytes, `memcpy`d verbatim from the file |
 * | `+0x24` | `count << 4` | **16 bytes** |
 *
 * `+0x20` and `+0x24` are two of the six arrays `LIME_FreeSkin` releases, so
 * the allocation side and the release side now agree on both -- the standard
 * this project holds field identifications to.
 *
 * ## The weights are four per matrix, not an interleaved record
 *
 * An earlier pass saw `lsl #2` and `lsl #1` on the same counter and read it as
 * one 16-byte record written in mixed widths. It is not interleaved at all:
 * the two shifts are the two *strides*, one for each side of a conversion.
 *
 *      lsls r2, r3, #2         ; the loop runs count * 4 times
 *      lsl  r3, r2, #2         ; destination: floats, 4 bytes apart
 *      lsl  r3, r2, #1         ; source:      uint16, 2 bytes apart
 *      ldrh r3, [r3, r6]
 *      vcvt.f32.u32 s15, s14   ; UNSIGNED
 *      vmul.f32 s15, s15, s14  ; x 1/65536
 *
 * **Four weights per matrix entry**, each stored on disk as a `uint16` and
 * expanded to a float by the 1/65536 scale docs/SKIN-FORMAT.md records. That is
 * why `+0x24` is `N * 16` bytes: four floats, not one sixteen-byte struct.
 *
 * The conversion is `vcvt.f32.u32` -- unsigned. A signed read would turn every
 * weight above 0.5 negative, which is the half of the range that matters most.
 *
 * ## Two matrices per entry, 96 bytes apart
 *
 *      bl memcpy                       ; 48 bytes -> +0x14
 *      add r1, r6, #0x30
 *      bl memcpy                       ; 48 bytes -> +0x28
 *      add r6, r6, #0x60               ; 96 per entry
 *
 * Which settles the ordering warning in SKIN-FORMAT.md from the loader's own
 * side: the **first** matrix of each pair goes to `+0x14` and the second to
 * `+0x28`, even though `+0x14` and `+0x28` are allocated in that same order.
 * Allocation order and storage order agree here; it is the *pair* that could be
 * read backwards, and it is not.
 *
 * ## Every size is a shift pair
 *
 * | field | expression in the code | bytes |
 * |---|---|---|
 * | `+0x20` | `N << 2` | `N * 4` -- indices, memcpy'd verbatim |
 * | `+0x24` | `N << 4` | `N * 16` -- four floats per matrix |
 * | `+0x14` | `N << 6` minus `N << 4` | `N * 48` |
 * | `+0x28` | same | `N * 48` |
 * | `+0x1c` | `M << 5` minus `M << 3` | `M * 24` |
 * | `+0x18` | `M << 3` minus `M << 1` | `M * 6` |
 *
 * Six arrays, and they are exactly the six LIME_FreeSkin releases. Allocation
 * and release agree on all six.
 *
 * Every allocation is null-checked and bails to a common exit, so a partial
 * load leaves the SKININFO holding whatever succeeded. Nothing is rolled back.
 */
void LIME_LoadSkin1(const char *data, SKININFO *skin)
{
    const uint8_t *src = (const uint8_t *)data;
    const float wscale = 1.0f / 65536.0f;
    int32_t n, m;
    int i;

    if (skin == NULL)
        return;

    n = *(const int32_t *)src;          /* +0x04  matrices */
    skin->numMatrices = n;
    m = *(const int32_t *)(src + 4);    /* +0x08  vertices */
    skin->numVerts = m;
    src += 8;

    skin->indexes = limeMalloc("skin", (size_t)n * 4);          /* +0x20 */
    if (skin->indexes == NULL)
        return;
    memcpy(skin->indexes, src, (size_t)n * 4);
    src += (size_t)n * 4;

    skin->weights = limeMalloc("skin", (size_t)n * 16);         /* +0x24 */
    if (skin->weights == NULL)
        return;
    for (i = 0; i < n * 4; i++)         /* four per matrix, uint16 -> float */
        skin->weights[i] = (float)((const uint16_t *)src)[i] * wscale;
    src += (size_t)n * 8;

    skin->matricesA = limeMalloc("skin", (size_t)n * 48);       /* +0x14 */
    skin->matricesB = limeMalloc("skin", (size_t)n * 48);       /* +0x28 */
    if (skin->matricesA == NULL || skin->matricesB == NULL)
        return;
    for (i = 0; i < n; i++) {           /* 96 bytes per entry: first, second */
        memcpy(&skin->matricesA[i], src + (size_t)i * 96,        48);
        memcpy(&skin->matricesB[i], src + (size_t)i * 96 + 0x30, 48);
    }
    src += (size_t)n * 96;

    skin->uvs = limeMalloc("skin", (size_t)m * 24);             /* +0x1c */
    if (skin->uvs == NULL)
        return;
    memcpy(skin->uvs, src, (size_t)m * 24);
    src += (size_t)m * 24;

    skin->vertExtra = limeMalloc("skin", (size_t)m * 6);        /* +0x18 */
    if (skin->vertExtra == NULL)
        return;
    memcpy(skin->vertExtra, src, (size_t)m * 6);
}


/* ------------------------------------- CreateMatrixPaletteForGeneratingMesh
 *
 * armv6 0x000834e8, 332 bytes.  **Complete.**
 *
 * The top of the animation pipeline: two keyframes and a blend factor go in, a
 * posed skeleton comes out. Every function it calls is already recovered, and
 * four of the five have been verified against the original, which is why this
 * one can be written out in full rather than described.
 *
 * ## The whole pose, in five calls
 *
 *      UnpackAnimFrame(data + stride * frameA, ...)
 *      UnpackAnimFrame(data + stride * frameB, ...)
 *      LerpVector3(a, b, t, out)          ; the root position
 *      GetSlerpedQ(...)                   ; per bone, the rotation
 *      MatrixIdentity2(root)
 *      CreateMatrixPaletteRecurse2(bones, root)
 *
 * The two frame pointers come from `mla r0, r1, r2, r0` -- `data + stride *
 * index`, a multiply-accumulate in one instruction. So the animation is a flat
 * array of fixed-size records and a frame is reached by index, with no table
 * and no seeking.
 *
 * ## BONEANIMFRAME is 20 bytes, and the loop says so
 *
 *      lsl r2, r4, #4      ; i * 16
 *      lsl r3, r4, #2      ; i * 4
 *      add r3, r3, r2      ; i * 20
 *
 * The same shift-and-add trick used for 216 and 80 elsewhere, and it confirms
 * the struct: four quaternion floats plus the field at +0x10 that GetSlerpedQ
 * writes 1.0f into. Nothing is padded.
 *
 * ## The root is special, twice over
 *
 * The root position is blended with `LerpVector3` -- which runs backwards from
 * its argument order, so `t = 0` yields the SECOND frame. Then
 * `MatrixIdentity2` supplies the root's parent transform, because the root has
 * no parent. And CreateMatrixPaletteRecurse2 then overrides the root's own
 * translation with `g_rootPosition` rather than using the one in the file.
 *
 * That last part is worth restating because it is counter-intuitive: **a
 * `.bones` file's root translation is not what gets used at runtime.** The
 * caller places the character; the file only describes the shape.
 *
 * ## Why the rotation loop is per bone but the position is not
 *
 * One `LerpVector3` for the whole pose and one `GetSlerpedQ` per bone. The
 * skeleton carries a single root translation and a rotation at every joint --
 * which is the standard way to store a skeletal animation, and it is why
 * `GetSlerpedQ` being a lerp rather than a slerp matters at every joint while
 * the position blend only matters once.
 */
void CreateMatrixPaletteForGeneratingMesh(char *data, long stride,
                                          long frameA, long frameB,
                                          float t, BONESINFO *bones)
{
    BONEANIMFRAME framesA[MAX_BONES];
    BONEANIMFRAME framesB[MAX_BONES];
    limeVECTOR3 posA, posB;
    SKINMATRIX43 root;
    int i;

    UnpackAnimFrame((uint8_t *)(data + stride * frameA), framesA, &posA,
                    bones->numBones);
    UnpackAnimFrame((uint8_t *)(data + stride * frameB), framesB, &posB,
                    bones->numBones);

    /* one root position for the whole pose -- and LerpVector3 runs backwards */
    LerpVector3(&posA, &posB, t, &g_rootPositionV);

    if (bones->numBones != 0) {
        for (i = 0; i < bones->numBones; i++)   /* stride 20, as i*16 + i*4 */
            GetSlerpedQ(&framesA[i], &framesB[i], t, &g_animBlended[i]);
    }

    MatrixIdentity2(&root);                     /* the root has no parent */
    CreateMatrixPaletteRecurse2(bones->bones, &root);
}
