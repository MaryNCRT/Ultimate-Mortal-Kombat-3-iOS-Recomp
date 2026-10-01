# Methodology

How this project establishes that a piece of decompiled code is actually correct.

This is the part worth reading even if you are working on a different game. The specific findings here are about *Ultimate Mortal Kombat 3*; the method is general.

---

## The problem with decompilers

A decompiler takes machine code and produces C. The C it produces is a **reconstruction**, not a recovery — the original source is gone, and what comes out is the decompiler's best model of what the machine code does.

Most of the time that model is close enough. The failure mode that matters is when it is wrong *and looks right*.

Here is the case that shaped this entire project. Ghidra's output for the function that computes a 3D vector's length:

```c
float _Len(float *v)
{
  float in_s0;                      /* declared, never assigned */
  undefined4 uVar1, uVar2;
  ...
  FloatVectorMult(uVar1, uVar1, 2, 0x20);
  FloatVectorAdd(uVar1, uVar2, 2);
  return in_s0;                     /* returns an uninitialized register */
}
```

This compiles without error. Under a quick review it looks like a slightly ugly SIMD implementation. It is completely wrong: the square root has vanished, and the return value is whatever happened to be in that register.

**Why it happened:** EA's compiler emitted *scalar* arithmetic using **2-lane NEON instructions** on D registers (`vmul.f32 d6, d6, d7`). Ghidra models those as opaque vector primitives and loses the aliasing between `d6` and the `s12`/`s13` pair. On top of that, Ghidra does not know the binary uses AAPCS soft-float — that a returned `float` arrives in `r0` — and emits `/* WARNING: Unknown calling convention */`.

**How widespread:** measured with `tools/slices.py neon`, **153 functions across the binary** use packed `.f32` SIMD on D/Q registers. Within the engine core that is **32 of 109 — 29%** — concentrated exactly where it hurts most:

| File | Functions | NEON-affected |
|---|---|---|
| `limeVector.cpp` | 2 | 100% |
| `limeFont.cpp` | 6 | 67% |
| `Matrix.cpp` | 11 | 45% |
| `RenderSkinned.cpp` | 20 | 45% |
| `LIMEDS_Misc.cpp` | 8 | 50% |
| `RenderMesh.cpp` | 19 | 11% |
| `Events.cpp` | 22 | 9% |
| `RenderScene.cpp` | 14 | 7% |
| `DS_DebugWin.c` | 7 | 0% |

The maths-heavy modules are the infected ones. That is not a coincidence — that is precisely where a compiler reaches for SIMD.

**Two numbers, and they are not the same number.** 32 of 109 engine functions (29%) *use* packed NEON. 25 of them (23%) are *fixed by reading armv6* — the other 7 use it in both slices. An earlier edit here reported 23% as the affected figure, which was wrong: it is the fixable subset.

**And the engine is not where most of it is.** `FrontEnd.cpp` (39 functions) and `GameCode.cpp` (22) together hold 61 of the 107 armv6-fixable cases — more than the whole of `lime/common`.

Had this gone unnoticed, the symptom a year later would have been "character models look slightly wrong," with no path back to the cause.

---

## The solution: a second, independent implementation

The project builds **two** implementations from the same machine code, by completely different routes, and requires them to agree.

### Route 1 — Ghidra (readable, sometimes wrong)

Used to produce a *draft*: correct control flow, meaningful names, recognisable structure. It tells you what the function is shaped like.

### Route 2 — the oracle (faithful, unreadable)

`tools/armrecomp/recomp.py` is a static recompiler. It translates each ARM/Thumb instruction into the C that performs exactly that instruction, with processor state held in an explicit context struct:

```
add  r4, r4, #0x20      →   ctx->r4 = ADD32(ctx->r4, 0x20);
ldr  r3, [r1, #8]       →   ctx->r3 = mem_read32(ctx->r1 + 8);
vmul.f32 d6, d6, d7     →   lane-by-lane, the way the hardware does it
```

It does not interpret, infer, or optimise. It transcribes. **Because it makes no judgements, it cannot make judgement errors.** The output is unreadable and unshippable — and that is fine, because it is never shipped. Its only job is to answer the question *"what does the original actually do with these inputs?"*

### The acceptance criterion

A hand-written clean implementation is accepted only when a **differential test** shows it matches the oracle across thousands of inputs.

| Module | Cases | Divergences |
|---|---|---|
| `Matrix.cpp` | 40,006 | 0 |
| `limeVector.cpp` | 20,013 | 0 |

Anything less than zero divergences is a failure, not a rounding error.

---

## Invariant testing

Comparing two implementations catches transcription errors. It does not catch **shared misunderstandings** — if both implementations assume a matrix is column-major and it is actually row-major, they will agree with each other and both be wrong.

So the strongest tests check mathematical properties instead:

```c
A × I == A                        /* identity is neutral                 */
I × A == A                        /* on both sides                       */
R(0.3) · R(0.4) == R(0.7)         /* rotations compose additively        */
R(1.1) · R(−1.1) == I             /* and invert                          */
det(R) == +1                      /* rotations preserve orientation      */
R · Rᵀ == I                       /* and are orthonormal                 */
```

These hold only if the arithmetic is genuinely correct, and — crucially — **they do not depend on having guessed the internal convention right**. A test that passes these has verified something real about the code, not just that two copies of it agree.

This is how the matrix layout was established as **4×4 float, row-major** — verified, not assumed.

---

## Verification against real data

For code that consumes files rather than computing numbers, there is a stronger test still: run **the original loader, recompiled**, over **the game's real data**, and check what it leaves in memory against your specification.

That is how the `.meshset` format was confirmed:

```
files loaded:        590
skipped (variants B/C):  14
meshes checked:     7,326
vertices:       2,950,669
triangles:      2,810,730
mismatches:             1     (KANO_STANDARD.meshset, vertex lighting)
```

Agreement was byte-for-byte on mesh counts, names, vertex counts, face counts, bounding radii, index data and vertex data, and on per-vertex lighting for 7,325 of 7,326 meshes.

This is not two of our own readers agreeing with each other. It is **our understanding checked against EA's code running on EA's data**. Two errors in the specification were found and corrected this way — see [MESHSET-FORMAT.md](MESHSET-FORMAT.md).

### When walking a file proves nothing

A parser that reaches the exact last byte of a file feels like proof. It is only
proof **if the walk depended on values that varied**.

If every record is the same size, any split of that size lands exactly. A
324-byte record can be read as 268+56, or 324+0, or 200+2×62, and all three walk
the file perfectly. The landing distinguishes none of them.

So before treating an exact walk as evidence, ask what varied. In `.meshset`,
`numVerts` and `numFaces` varied across 7,326 meshes. In `.skin`, N and M
varied. Those walks are real evidence. A walk over fixed-size records is not.

### But check "it never varies" against the whole corpus

The `.events` format was audited as failing exactly that test: `numEntries`
appeared to be 1 in 211 of 212 tracks, which would make every track 324 bytes
and the walk circular.

**It was measured on a subset.** Across all 1,547 tracks the field takes ten
distinct values and 103 tracks are not 1. The walk was real evidence after all,
and brute force confirmed the split is the only one that survives the corpus.

Both halves of this are worth keeping. A constant makes a walk worthless — and
a constant observed on part of the data may not be a constant. Measure the
whole corpus before concluding either way, and derive the layout from the
loader's own arithmetic so the answer does not depend on the walk at all.

---

## Bugs this method has caught

Concrete cases where verification found something review would not have:

**`_Len` returning an uninitialized variable.** Ghidra's output, plausible-looking, completely wrong. Caught immediately by the oracle. This is the finding that justified the whole approach.

**Post-indexed load addressing.** `ldr r3, [r1], #4` accesses `[r1]` and *then* increments `r1` by 4. Capstone reports that `4` as a third operand, not in `mem.disp` (which reads 0). The recompiler was incrementing by zero, silently corrupting a pointer. It surfaced as `boundsRadius` reading `0x00000004` instead of `0x4261fe6b` in the mesh loader test — a wrong number in a test, rather than corrupted geometry six months later.

**`sin` and `cos` transposed.** In `CreatePerspectiveMatrix`, the two stub addresses had been assigned the wrong way round. The invariant tests caught it on the first run.

**A wrong path in the format specification.** The lighting file lookup is `STATICLIGHTING/<name>.lighting`, not `<name>.lighting`. Found by running the real loader.

**A conditional `memset` that the spec had as unconditional.** `vertLight` is only filled with `0xFF` when lighting was requested *and* the file is missing. With `useLighting == 0` the branch skips the `memset` entirely and the buffer stays uninitialized.

---

## The other slice is a second opinion

The fat binary ships **armv6 and armv7**. The project works on armv7 — and for
the NEON problem above, that was the wrong choice.

**ARMv6 has no NEON.** The armv6 slice is a second, independent compilation of
the same source in plain scalar VFP, which Ghidra decompiles correctly:

```
armv7 (Ghidra loses this)          armv6 (readable)
  vmul.f32  d6, d6, d6               vmul.f32  s15, s15, s15   ; y*y
  vmul.f32  d7, d7, d7               vmla.f32  s15, s13, s13   ; += x*x
  vadd.f32  d6, d6, d7               vmla.f32  s15, s14, s14   ; += z*z
  vmul.f32  d7, d5, d5               vsqrt.f32 s15, s15
  vadd.f32  d7, d6, d7
  vsqrt.f32 s14, s14
```

`tools/slices.py neon` measures the reach: **153 functions use packed `.f32`
SIMD in armv7, 58 in armv6, and 107 are affected in armv7 only.** Those 107 are
readable in the other slice for free.

More than half of them are not in the engine at all — `FrontEnd.cpp` (39) and
`GameCode.cpp` (22) account for 61. The "27% of `lime/common`" figure measures
23% by this method and, more importantly, looks in the wrong place.

Two traps: much of armv6 is built as ARM rather than Thumb, and the Thumb flag
lives in `n_desc` bit 3 on the *STABS* symbol entry, not on the plain one.
Reading one entry and not the other disassembles Thumb as ARM and yields
confident garbage.

This does not replace the oracle — the armv6 code is still machine code, and a
readable decompilation still has to be proven equivalent. It removes the case
where the decompiler's output is *silently wrong* rather than merely ugly.

---

## Recursive descent, and why less coverage is better coverage

The recompiler used to disassemble each function by walking it linearly from
start to end. That fails on this binary, and it fails *quietly*.

Thumb-2's `ldr rX,[pc,#N]` only reaches ±4 KB, so GCC drops constant pools
**in the middle of functions**. A linear sweep decodes those constants as
instructions, desynchronises, and produces plausible-looking garbage for
everything after — a `bvs` that is really half of a float, branching to a label
that will never exist. **852 of 4,342 functions (19.6%)** contained bytes the
sweep could not decode, and an unknown number more were silently misread.

The recompiler now does **recursive descent**: start at the entry point, follow
branches, and decode only what is reachable as code. Whatever is never reached
is data, and saying so is the whole point.

The headline number goes *down* — 87.6% of bytes decoded becomes 80.0% — and
that is the improvement. The bytes it no longer decodes were never code.

| | linear sweep | recursive descent |
|---|---|---|
| desynchronises | 852 functions (19.6%) | — |
| fully accounted for | — | 3,520 functions (81.1%) |
| >25% unreached | — | 822 functions (18.9%) |

"Fully accounted for" means every byte is classified: instructions, alignment
padding, or literal pool. The trade is **852 functions silently wrong** for
**822 functions honestly incomplete**, and the second is worth far more.

### Jump tables are followed

Recursive descent stops dead at an indirect branch, and a dense `switch`
compiles to one. GCC's idiom is fixed, so it can be resolved:

```
cmp   rN, #limit
bhi   <default>
tbh   [pc, rN, lsl #1]
<table: limit+1 halfwords, each an offset from pc in 2-byte units>
```

`_seq_lookup` is the case that made this necessary: bounded by `cmp r4, #0x16`,
it dispatches 23 ways. Without table following, recursive descent covered **38
bytes of 7,608**. With it, 906 bytes across 315 instructions. **28 functions**
carry such tables.

### The limit that will not be fixed

`blx <reg>`, `bx <reg>` and computed branches cannot be resolved statically.
Where a function dispatches through a pointer, recursive descent stops and says
so.

This is not a backlog item. `gamecode/logic` is cooperative multitasking with a
process dispatcher, per-process stacks and stack jumping, inherited from the
arcade original's TMS34010 — dispatch through function pointers is its
architecture. **The oracle will never cover the fight engine, by structure
rather than for want of work.** That is why the emulator matters there, and why
issues [#5](../../issues/5) and [#6](../../issues/6) attack it by observing the
running game instead.

---

## Look at the picture

Three times this project has spent real effort on a problem that one glance
would have ended. It is now a rule.

**touchHLE's gamepad.** Four rounds of guessing coordinates from the emulator's
own documentation. One screenshot from the user settled it — and revealed that
touchHLE's shipped defaults for this app place the touch targets *off-screen*.

**MAME's coin slot.** The scripted session inserted coins and pressed start, and
the machine sat on the attract screen. The inputs were being accepted and
ignored, because on this Midway board the coin mechanism is gated by a cabinet
**door interlock** switch that MAME models. A screenshot showed the attract loop
and named the problem; memory sampling would have gone on indefinitely.

**The PVRTC decoder.** Scored at 5.5% error, it survived **fourteen** careful
hypotheses that all made it worse. Rendering the reference images beside our own
output showed, immediately, that three of the thirteen reference pairs were
**different assets sharing a filename** — one framed differently, two being
unprocessed sources with a magenta chroma key. One of them alone inflated the
score from 3.83 to 14.00. The decoder had been essentially correct for three
rounds.

The pattern is the same each time. **Numerical evidence sustains an open-ended
hunt; visual evidence terminates it.** When something measures wrong and every
hypothesis fails, the next step is not a better hypothesis — it is to look at
the thing, and at what it is being compared against.

The corollary matters as much: **question the reference, not only the code.** A
differential test is only as good as the reference it diffs against, and a
reference that is confidently wrong is worse than none, because it produces a
number that invites explanation.

---

## Where the oracle stops working

Two limitations are structural rather than incidental. Both are documented in [PROGRESS.md](PROGRESS.md) with their intended fixes.

**Literal pools inside functions.** Thumb-2 PC-relative loads reach only ±4 KB, so the compiler embeds constants in the middle of large functions. A linear disassembly sweep reads them as instructions and derails. 852 of 4,342 functions contain bytes Capstone cannot decode. The fix is recursive descent from the entry point, following branches — anything unreached is data, not code.

**Indirect jumps** (`blx reg`, `bx reg`, `tbb`/`tbh`). The recompiler needs the branch target at translation time; these only have it at runtime. The fix is a runtime address→function lookup table, the same approach N64Recomp uses.

The second one matters strategically: the fight logic (`mkdrone.c`, `moves.c`, `other.c` — roughly 1,300 functions) is a state machine built on function-pointer tables. **The oracle will not cover it.** That is why getting the game running in touchHLE was worth the detour: for those functions, a live behavioural reference is the only oracle available.

---

## Making it scale

Verification is only useful if it can keep up with decompilation. Three things make that work:

**Rank by difficulty, attack the easy ones first.** `tools/rank.py` scores each function on instruction count, conditional branches, loops, calls, IT blocks, indirect jumps and undecodable bytes. Working easiest-first builds up signatures and struct knowledge that make the hard ones tractable when you reach them, instead of being blocked on day one.

**Signatures as accumulating knowledge.** `tools/signatures/` holds what has been learned about types, stored as text rather than embedded in code. Each addition improves every future regeneration:

```c
/* without signatures */
void _limeMatrixLoadIdentity(undefined4 *param_1)
{ *param_1 = 0x3f800000; param_1[1] = 0; ... }

/* with signatures */
void _limeMatrixLoadIdentity(float *m)
{ *m = 1.0; m[1] = 0.0; ... }
```

Same machine code, entirely different readability. Declaring `MESHINFO`, `MESHSETINFO` and `LIMEVERTEX` turned the mesh loader from pointer arithmetic into ordinary struct access.

**Automate the loop.** `python tools/decomp_driver.py --all-lime` chains ranking, headless Ghidra with signatures applied, and verification. Adding knowledge to the signature files and re-running is cheap.

---

## Summary

1. Treat decompiler output as a **draft**, never as truth.
2. Build an **independent, faithful** implementation to check against.
3. Require **zero divergences** across thousands of inputs before accepting anything.
4. Test **invariants**, not only comparisons — they catch shared misunderstandings.
5. Where possible, verify against **the original code running on the original data**.
6. Feed everything learned back into **signatures**, so it improves all future output.
7. Know where the method **stops working**, and have a different oracle ready for those cases.
