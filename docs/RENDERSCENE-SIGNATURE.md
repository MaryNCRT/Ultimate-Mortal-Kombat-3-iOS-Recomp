# The two scene renderers: what driving them actually showed

`LIME_RenderScene` and `LIME_RenderSceneOverrideTextures` carried
*structurally complete* bodies in `decomp/lime/RenderScene.c` for a long time.
The first differential test that drove them found the bodies wrong in six
measured ways, starting with the argument list.

This file records what was measured and how, because several of the facts
contradict comments that were previously committed with confidence.

---

## How these were established

Not by reading. `tools/armrecomp/recomp.py` emits every import as
`stub_auto_glXxx(arm_ctx *ctx)`, so `tests/gl_trace.c` can record the register
file at the instant of each GL call, and `build/probe*` drives one function at a
time with chosen registers.

That converts questions that looked like static-analysis problems into
experiments. `docs/ENCARGO.md` said pairing GL enums with their calls needed
register liveness tracking; it does not, if you can run the code.

---

## 1. The argument positions were wrong

Measured by putting the scene in each register in turn and watching which one
produced `glScalef(1.5f)` — the scene's own scale — rather than garbage:

```
scene in r0, frame in r1 -> glScalef 0x00000000     <- reading rubbish
scene in r1, frame in r2 -> glScalef 0x3fc00000     <- 1.5f, correct
scene in r2, frame in r3 -> no GL calls at all
```

| | `LIME_RenderScene` | `LIME_RenderSceneOverrideTextures` |
|---|---|---|
| scene | **arg 2** (r1) | **arg 1** (r0) |
| frame A | **arg 3** (r2) | **arg 3** (r2) |

The committed C declared `LIME_RenderScene(SCENEINFO *scene, long frame, long
flags)`. With the scene passed first, the binary's `cmp r1, #0` sees the frame
number, treats a frame of 0 as a NULL scene and returns immediately — which is
exactly how the test failed on its first run.

**Both functions take the frame as their third argument.** That is the
consistency between them; the scene position is not.

## 2. There is no `flags`. There are about eleven arguments

`sub sp, #0xdc` after `push {r4-r7,lr}`, `push {r8,sl,fp}` and `vpush {d8}`
puts the first stack argument at `[sp, #0x104]`. Reads were found at `+0x104`,
`+0x110`, `+0x114` and `+0x11c`; `+0x108` and `+0x10c` are never read.

    arg1  r0          handed to LIME_printf's first slot
    arg2  r1          SCENEINFO *scene
    arg3  r2          first frame index
    arg4  r3          second frame index          <- NOT frame + 1
    arg5  sp+0x104    float, the blend factor
    arg6  sp+0x108    never read
    arg7  sp+0x10c    never read
    arg8  sp+0x110    flag, compared against 1
    arg9  sp+0x114    TEXTURE *, for the final flush
    arg11 sp+0x11c    SKINMATRIX43 *, for the final flush

`LIME_printf` itself is an eight-byte no-op in this build — `push {r1,r2,r3};
add sp,#0xc; bx lr` — the release stub of a variadic debug printf. It
constrains nothing about arg1 beyond it being one word.

## 3. The second frame is an argument, not `frame + 1`

    mov  r0, r5            ; r5 = arg4
    mov  r1, r4            ; r4 = scene->count2
    blx  ___modsi3

The committed body computed `fb = (frame + 1) % scene->count2`. The binary
takes the second index from the caller and clamps it the same way as the first.
So the caller chooses which two poses to blend, and consecutive frames are only
the common case.

## 4. The blend factor is arg5, not zero

    vmov r2, s16           ; s16 = arg5, loaded from sp+0x104
    bl   _LerpQSTMatrix

The committed body passed a literal `0.0f`, which makes the blend a no-op and
returns the first pose every time. The interpolation factor is supplied by the
caller. With arg3, arg4 and arg5 together the call is a proper two-key blend.

## 5. The transparency cutoff is 0.97, not "not zero"

    vldr    s12, [pc, #0x294]      ; -> 0x0005fb14
    vcmpe.f32 s14, s12             ; s14 = key->alpha

The literal at `0x0005fb14` is **0.9700000286102295**. The committed body tested
`if (ka->alpha != 0.0f)` and deferred to the transparent list on anything
non-zero. The binary treats a mesh as opaque at alpha >= 0.97 and defers only
below that — an "almost fully opaque" cutoff, and a different rule entirely.

## 6. `SCENENODEKEY + 5` is not padding

Every read of the eight-byte key record:

    vldr  s14, [r6]        ; +0  alpha, float
    ldr   r3,  [r6]        ; +0  the same word, raw
    ldrb  sl,  [r6, #4]    ; +4  mesh index
    ldrb  r3,  [r6, #5]    ; +5  READ, and stored into the temporary node
    ldrh  r0,  [r6, #6]    ; +6  palette index

`lime.h` declared `+5` as `_pad05`. It is read and copied to `[sp, #0x41]`,
inside a temporary the function builds at `sp+0x3c` and hands to
`AddToTranspMeshList` as its `SCENENODE *`. That temporary is `{ float at +0,
byte at +5 }` — so the byte survives into the transparent list.

What it *means* is not established. It is named `field05` rather than given a
meaning it has not earned.

## 7. The flush is conditional and takes two of the stack arguments

    ldr  r4, [sp, #0x110]
    cmp  r4, #1
    bne  ...
    ldr  r0, [sp, #0x114]
    ldr  r1, [sp, #0x11c]
    bl   __Z19FlushTranspMeshListP7TEXTUREP12SKINMATRIX43

So arg8 selects whether this call is the one that drains the deferred list, and
arg9/arg11 are the texture and matrix it drains with.

---

## What the GL state wrappers do

Measured one at a time with `build/probe`, and worth recording because every
enum here was previously unresolved:

| function | GL calls |
|---|---|
| `limeEnableDepthWrites` | `glDepthMask(1)` |
| `limeDisableDepthWrites` | `glDepthMask(0)` |
| `limeDisableAlphaBlending` | `glDisable(GL_BLEND)` |
| `limeEnableAlphaBlending_Basic` | `glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)`, `glEnable(GL_BLEND)` |
| `limeEnableAlphaBlending_Additive` | `glBlendFunc(GL_SRC_ALPHA, GL_ONE)`, `glEnable(GL_BLEND)` |
| `LIME_PushMatrix` | `glPushMatrix()` |
| `LIME_PopMatrix(n)` | `glPopMatrix()` **n times** |

This confirms from behaviour what `docs/ENCARGO.md` had only asserted: the
additive path really is `SRC_ALPHA/ONE` and the basic path really is the
order-dependent `SRC_ALPHA/ONE_MINUS_SRC_ALPHA`. `LIME_PopMatrix` taking a
count was already recorded in `runtime/lime_platform.c`; this measures it.

These live in `lime/iphone/lime.m`, so they belong to the platform layer that
this project rewrites rather than to `lime/common`.

---

## The lesson worth keeping

A body can be wrong in its *argument list* and still read as plausible, still
compile, still pass `symcheck`, and still sit in the repository labelled
"structurally complete" through several review passes. Nothing short of running
it against the original catches that.

The previous note in `RenderScene.c` said driving these functions "would be
comparing this project's reading against itself in the places where the reading
is least certain". That was the wrong conclusion from a correct worry: the
oracle is not this project's reading, it is a mechanical translation of the
shipped instructions, and it disagreed with the reading on six separate points.
