# Phase 0 — can we reproduce the original compiler's output?

The matching plan (`ORDEN-MATCHING-1A1`) asks one question before anything
else: **if we compile our decompiled C, do we get the original instructions
back?** Everything downstream depends on the answer, and the plan budgets half
a day to build LLVM-GCC 4.2 — the compiler Apple shipped for iOS in 2011 — to
find out.

This is the result of asking the question a cheaper way first.

**Answer: yes, close enough to be useful, with a compiler already on the
machine.** Building the period toolchain is not the prerequisite it was
assumed to be.

## Method

No period compiler. Modern clang, aimed at the original target:

```
clang --target=armv7-apple-darwin -mthumb -ffreestanding -Os -mno-movt \
      -I decomp/gamecode/logic -S -o out.s decomp/gamecode/logic/mkzap.c
```

Only two accommodations are needed. `-ffreestanding` because there is no iOS
sysroot here, plus a four-line `string.h` declaring `memset` and `memcpy`.
`-mno-movt` is explained below — it is not a hack, it is the flag that selects
the addressing style the original was built with.

Compared against `tools/dumpfn.py`, which disassembles the shipped binary.

## Results

### Leaf functions: exact

`q_yes` — three instructions, and clang emits three:

| binary | clang |
|---|---|
| `movs r3, #1` | `movs r1, #1` |
| `str r3, [r0, #0x5c]` | `str r1, [r0, #92]` |
| `bx lr` | `bx lr` |

`92 = 0x5c`. Identical but for which register was chosen.

`inc_p_hit` — six instructions, six out, in the same order:

| binary | clang |
|---|---|
| `ldr r2, [r0]` | `ldr r1, [r0]` |
| `ldr r3, [r2, #0x44]` | `ldr r2, [r1, #68]` |
| `adds r3, #1` | `adds r2, #1` |
| `str r3, [r0, #0x1c]` | `str r2, [r0, #28]` |
| `str r3, [r2, #0x44]` | `str r2, [r1, #68]` |
| `bx lr` | `bx lr` |

Both are `EQUIVALENT` under the plan's own definition: same instructions, same
order, register allocation aside.

### The frame-push family: same length, three known differences

`t_new_smoke_spear_proc` is one of the ~600 functions built from the shape that
dominates `gamecode/logic`. The original is 21 instructions. Clang at `-O1`,
`-O2` and `-Os` all emit **21 instructions**. They are not all the same 21:

| | binary (2011) | clang 22 | what it is |
|---|---|---|---|
| 1 | two separate `str` | `strd r3, r9, [r2, #28]` | a newer optimiser pairing stores |
| 2 | `adds r3, #0x5d` derives the second constant | `mov.w r9, #21` materialises it | forced by (1): `strd` needs two registers |
| 3 | recomputes `[r0, r3, lsl #3]` at each use | hoists `add.w r1, r0, r1, lsl #3` once | a newer optimiser lifting an invariant |
| 4 | `ldr r1, [pc, #0x14]` + `add r1, pc` | `movw`/`movt` + `add pc` | **not the compiler — the flag** |

Difference 4 disappears with `-mno-movt`, which produces `ldr r2, LCPI0_0` +
`add r2, pc`, the original's exact form. Both are position-independent; the
original used the literal-pool spelling because early LLVM preferred it, and
modern LLVM prefers `movw`/`movt` on armv7. One flag chooses between them.

(A residual `ldr r2, [r2]` remains only because our `mkzap.c` is incomplete and
declares `t_new_spear_proc` as external, where the original defined it in the
same file. That is our file, not the compiler.)

Differences 1–3 are genuine fifteen-year-old-optimiser-versus-new ones.

## What this changes

The plan assumed matching needs the period compiler, and put building it on the
critical path. It does not. Three mechanical normalisations close the gap on
everything tested:

1. **register allocation** — α-renaming, which any comparator needs anyway
2. **`strd rA, rB, [rX, #n]` ≡ `str rA, [rX, #n]; str rB, [rX, #n+4]`**
3. **address reassociation** — a base recomputed per use versus hoisted once

None requires a 2011 toolchain. All three belong in `asmmatch.py`, which has to
exist regardless.

This does not prove the period compiler is never needed. It has been tested on
integer code with a simple control flow — the shape most of `gamecode/logic`
happens to be. Float and C++ (`Matrix.cpp`, the vector maths) are untested and
are exactly where the plan already expects trouble. **The claim is narrow: the
matching campaign can start now, on this machine, and the toolchain build can
wait until something actually demands it.**

## It found a bug on the first compile

Before any comparison, `clang` refused a line in `mkzap.c`:

```
warning: implicit conversion from 'long long' to 'uint32_t'
         changes value from 4294967317 to 21
    obj->field20 = 0x100000015;
```

The binary says:

```
mvn  r3, #0x47      ; 0xffffffb8
str  r3, [r1, #0x1c]
adds r3, #0x5d      ; 0xffffffb8 + 0x5d
str  r3, [r1, #0x20]
```

`0xffffffb8 + 0x5d` is `0x15` in a 32-bit register, with the carry falling off
the end. `tools/pushfn.py` computed it in Python, which has no end to fall off,
and wrote a 33-bit constant. Its subtraction path masked to 32 bits; its
addition path did not.

One function was affected and is fixed. The point is the mechanism: **a
compiler reading our C is an independent check on the tools that wrote it**, and
it earned its keep before the experiment it was set up for had begun.

## Reproducing

```bash
python tools/dumpfn.py t_new_smoke_spear_proc
clang --target=armv7-apple-darwin -mthumb -ffreestanding -Os -mno-movt \
      -I decomp/gamecode/logic -S -o - decomp/gamecode/logic/mkzap.c \
  | sed -n '/^_t_new_smoke_spear_proc:/,/End function/p'
```
