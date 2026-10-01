# The mesh draw: nine defects a loader test could not see

`decomp/lime/RenderMesh.c` was listed as verified. Its test, `test_rendermesh_diff`,
runs the clean mesh-set **loader** against 590 real files and 7,327 meshes with
zero divergences, and it is a good test. It never touches the draw.

So half the file was verified and the other half was not, and the label said
"verified". When the scene renderers were finally driven every remaining
divergence turned out to be in here.

`tests/test_rendermesh_gl_diff.c` now drives `LIME_RenderMeshSingle` over 193
combinations of its gates and compares the GL call stream. **Zero divergences.**

---

## What was wrong

### 1. The colour path ignored its own gate

    0x5e600  ldr  r3, [sp, #0x3c]   ; flags -- the FIFTH argument
    0x5e602  cbz  r3, #0x5e61a

The body had `(void)flags;` and gated only on `fullBright` and the texture.
`LIME_RenderMesh` calls this with `flags = 0`, so the vertex-colour path should
never run from there -- and the old body ran it every single time.

Driving 97 combinations, the original took that branch in **none** of them.
That is what sent the reading back to the prologue.

### 2. `glEnableClientState(GL_VERTEX_ARRAY)` was `glDisableClientState(GL_NORMAL_ARRAY)`

`0x8074` against `0x8075`. This is exactly the mis-pairing the old comment in
this file warned about and then committed: the constants present were known,
which call consumed each one was not.

### 3. Vertex positions are `GL_SHORT`, not `GL_FLOAT`

    movw r1, #0x1402       ; GL_SHORT
    movs r2, #0x10         ; stride 16

`LIMEVERTEX` is three `int16` and two floats -- `lime.h` has said so since the
loader was written. Declaring them float makes GL read two vertices as one.

### 4. Stride 16 on both arrays, and the texcoords start at `+8`

    add.w r3, sl, #8

Position and UV are the **same buffer** read at two offsets, which is the whole
reason the vertex is sixteen bytes rather than two arrays. The old body passed
stride 0, so GL would walk off the end of the UVs.

### 5. The scale is the RECIPROCAL

    vmov     s12, #1.0
    vdiv.f32 s16, s12, s14      ; s14 = mesh->[0x10]

`MESHINFO+0x10` is a divisor, not a scale -- which fits int16 positions coming
back down to model space. The old body passed the field straight through and
produced 2.5 where the original produces 0.4.

### 6. Texture setup happens with or without a texture

`beq #0x5e7b0` binds the null pointer and rejoins. A mesh with no material still
binds 0 and still enables `GL_TEXTURE_2D`. The old body skipped all three calls.

### 7. Teardown walks unit 1 first, then unit 0

Not arbitrary: it finishes on the unit that setup will use next. The old body had
them the other way round and left unit 1 current.

### 8. Teardown uses `GL_REPLACE`, setup uses `GL_MODULATE`

The literal `0x45f00800` is `7681.0f`, and 7681 is `0x1E01`. Both arrive as
floats because the entry point is `glTexEnvf`.

### 9. `glDisable(GL_CULL_FACE)` and `glDisableClientState(GL_VERTEX_ARRAY)` were missing

Two teardown calls simply absent.

Also: the `alpha` argument is never read. `CreateFadedRGBS` gets a literal
`1.0f` (`mov.w r2, #0x3f800000`). The old body passed `alpha` through, where the
original never has.

---

## The oracle was wrong too, and it nearly corrupted the clean code

Thirty-six cases still diverged after all of the above, and they said the
original took its vertex-colour path when the mesh was flagged **full-bright** --
which is backwards from what the flag means.

The generated oracle explained it:

```c
/* 0005e60e  movs r3, #0 */
if (!ctx->zf) { ctx->r[3] = 0x0u; SET_NZ(ctx->r[3]); }
/* 0005e610  and r3, r2, #1 */
if (ctx->zf) { ctx->r[3] = ctx->r[2] & 0x1u; }
```

**Instructions inside a Thumb IT block do not update the flags.** A 16-bit
data-processing instruction normally does -- `movs r3, #0` -- but inside an IT
block the S bit is clear and the disassembly reads `movne r3, #0`. Capstone
still reports the mnemonic as `movs`, `recomp.py` trusted it, and the emitted
`SET_NZ` clobbered the very flags the next predicated instruction was about to
test. Both halves of every `ITE` ran.

`cmp`/`cmn`/`tst`/`teq` are exempt -- they have no destination and setting flags
is their purpose, which is why they are legal inside an IT block. Fixed in
`recomp.py`; every oracle was regenerated and the whole suite re-run.

This is the fifth defect found in the oracle, and the first that would have
propagated into the clean code: the obvious response to those 36 divergences was
to invert the `fullBright` test. Doing so would have produced a body that agreed
with the oracle, passed the gate, and lit exactly the surfaces the engine
exists to leave unlit.

**A red result deserves no more trust than a green one until the instrument has
been checked.**

---

## And one invention in RenderScene, caught the same way

`FlushTranspMeshList` appeared to read a "pending translation" global that
something upstream armed, and a body was written saying so. The values changed
with the blend factor, which a global would not do.

    0x5f6b2  bl  _ConvertQSTMatrixtoPCMatrix   ; writes into r5
    0x5f6be  ldr r1, [r4, #0x34]               ; r4 == r5
    0x5f6c4  blx _glTranslatef
    0x5f6cc  str r3, [r4, #0x30]               ; then zeroed
    0x5f6d2  blx _glMultMatrixf

`r4` and `r5` resolve to the same address. It is `m[12..14]` of the matrix just
converted -- the translation row, applied with `glTranslatef`, zeroed, and the
remainder multiplied in. Two PC-relative loads landing on one buffer looked like
two different globals until the arithmetic was done.

---

## One more, about the test rather than the code

The first version of both GL tests put their guest arenas at `0x00300000`, which
is **inside the loaded slice's own data**. Filling a palette with random words
quietly overwrote the engine's globals, and the renderer then read a "pending
translation" that was actually the test's palette.

The slice is `0x23D0B0` bytes plus data and bss. Anything a test builds has to
start clear of that; both now sit above `0x00600000`.
