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

**How widespread:** 29 of the 109 functions in the engine core — **27%**. Concentrated exactly where it hurts most:

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

---

## Bugs this method has caught

Concrete cases where verification found something review would not have:

**`_Len` returning an uninitialized variable.** Ghidra's output, plausible-looking, completely wrong. Caught immediately by the oracle. This is the finding that justified the whole approach.

**Post-indexed load addressing.** `ldr r3, [r1], #4` accesses `[r1]` and *then* increments `r1` by 4. Capstone reports that `4` as a third operand, not in `mem.disp` (which reads 0). The recompiler was incrementing by zero, silently corrupting a pointer. It surfaced as `boundsRadius` reading `0x00000004` instead of `0x4261fe6b` in the mesh loader test — a wrong number in a test, rather than corrupted geometry six months later.

**`sin` and `cos` transposed.** In `CreatePerspectiveMatrix`, the two stub addresses had been assigned the wrong way round. The invariant tests caught it on the first run.

**A wrong path in the format specification.** The lighting file lookup is `STATICLIGHTING/<name>.lighting`, not `<name>.lighting`. Found by running the real loader.

**A conditional `memset` that the spec had as unconditional.** `vertLight` is only filled with `0xFF` when lighting was requested *and* the file is missing. With `useLighting == 0` the branch skips the `memset` entirely and the buffer stays uninitialized.

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
