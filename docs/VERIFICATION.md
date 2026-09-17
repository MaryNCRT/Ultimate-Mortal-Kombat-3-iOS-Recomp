# Verifying the decomp against the binary

Which method, and why. Written after a day in which six transcription
errors reached `joy.c` and one unchecked claim in the Godot port deformed
the character model on every hit.

## What went wrong, precisely

None of the six was a reasoning error. Every one was a value read wrong
off a screen of disassembly:

| # | error | what it should have been |
|---|---|---|
| 1 | `t_jmp4`/`t_jmp5` sent `sel 0` to the continuation | `sel 0` is the cross-over |
| 2 | `part->field58 = 2` in the low punches | `3` — `mov.w sl, #3` at 0x00030aa0 |
| 3 | `t_jmp4` wrote `field48 = -1` unconditionally | only when the strike connected |
| 4 | `t_jmp5` assumed the same condition as its twin | the opposite one |
| 5 | `plyrthread` flip speed as `0xfff80000` | `0xfffc0000`, the word at 0x000317d0 |
| 6 | `check_block_bit` / `is_he_right` declared `void` | both return their flag in r0 |

The common factor is that all six are **mechanical facts** — a constant, a
store offset, a branch target, a return register. A machine reads those
without getting tired. A person reading a fifth screen of Thumb does not.

## The measurement that settles it

`TOOLS/armrecomp/recomp.py` translates ARM to C one instruction per
statement and **reports anything it cannot translate** rather than
emitting something plausible. Run over the files that matter:

| file | functions | unsupported instructions |
|---|---|---|
| `joy.c` | 73 | **0** (4,422 translated) |
| `mkreact.c` | 207 | 2 |
| `moves.c` | 355 | 13 |
| `mkstat.c` | 62 | 4 |
| `other.c` | 333 | 4 |

So a faithful, machine-made transcription of essentially everything is
one command away, and has been all along.

What that transcription looks like, for the store this project got wrong:

```c
ctx->r[10] = 0x3u;
/* 00030aa4  str r3, [r2, #0x30] */
MEM_ST32((ctx->r[2] + 48), ctx->r[3]);
/* 00030aa6  ldr r3, [r4] */
ctx->r[3] = MEM_LD32((ctx->r[4]));
/* 00030aa8  str.w sl, [r3, #0x58] */
MEM_ST32((ctx->r[3] + 88), ctx->r[10]);
```

Constant-propagate one register and that reads `store [+0x58] = 3`,
which contradicts the hand-written `field58 = 2` on sight.

## The four candidates

### A. The existing generators — `pushfn`, `leaffn`, `microfn`, `parkfn`

Already in `tools/`, already responsible for hundreds of functions, and
already built on the right principle: they execute or match a body and
**refuse** anything they cannot account for instruction by instruction.

Two limits make them the wrong tool for *checking* what is already
written. They skip written functions by construction — `pushfn.main`
does `done = dumpfn.written()` and filters on `n not in done` — and they
only handle the shapes they know. Forced over eight hand-written
functions from `joy.c` they accepted two and refused six, each with an
honest reason (`push.w`, `not the guard`, `a pointer slot with no
symbol`). Those refusals are correct behaviour, but a checker that
covers a quarter of the code is not a checker.

Keep them for what they are good at: writing new functions of a known
shape, correctly, without a human in the loop.

### B. The runtime oracle — the original Phase 2 plan

Execute the recompiled function and the readable one on the same inputs
and compare. Highest confidence available, and it is what `CLAUDE.md`
set out to do.

It needs a harness: a memory model, real `MK3OBJ` / `MK3THREAD` layouts,
and a stub for every leaf the function calls. `t_jhp4` alone reaches
`get_last_button`, `group_sound`, `rsnd_func`, `punch_strike_check` and
`t_act_mframew`; a fight function five levels deep reaches most of the
file. That is weeks, and the stubs themselves would need verifying.

Not now. Worth revisiting once the cheaper method stops finding things.

### C. Static fact diff, off the recompiler — **recommended**

Extract from the recompiled C the facts that a transcription can get
wrong, and extract the same facts from the readable C:

- every store, as `(offset, value)` after constant propagation
- every call, in order, with its immediate arguments
- the constants actually used, as a multiset
- the branch structure: which condition reaches which target
- whether r0 is live at the return

Then diff the two. No execution, no harness, no stubs — and it inherits
the recompiler's coverage, which the table above shows is effectively
total.

Against the six errors:

| error | caught by C? | how |
|---|---|---|
| 1 branch inverted | yes | condition-to-target mapping differs |
| 2 `field58` | yes | `store [+0x58]` value 3 vs 2 |
| 3 unconditional store | yes | a branch the readable C does not have |
| 4 opposite condition | yes | same |
| 5 wrong literal | yes | constant multiset |
| 6 dropped return value | yes | r0 live at return, declared `void` |

Six of six. Not because the method is clever — because all six were
mechanical, and this method only checks mechanical things.

### D. Constant-only audit

The cheap half of C: compare hex literals and nothing else. Catches 2
and 5, misses the structural ones. Worth having for an afternoon, not
worth building instead of C.

## The recommendation

Build **C**, in this order:

1. A fact extractor over the recompiler output. Constant propagation
   over straight-line blocks is enough; where it cannot resolve a
   register it reports `unknown` rather than guessing, the same
   discipline the rest of `tools/` already keeps.
2. A fact extractor over the readable C. Simpler: the house style is
   regular, and `mk3logic.h` gives field names to offsets.
3. The diff, with a per-function verdict and a reason for every
   difference.

Then run it over everything already written before adding anything new.

## What this does not cover

A fact diff proves the readable C does what the instructions do. It says
nothing about whether the *English in the banner* is true, and the
banners are where this project keeps its findings. The Godot port's
claim that interpolating between consecutive frames is what the engine
does was false, cost a day, and no instruction-level check would have
caught it — only following `next_anirate` and `PlayerAutoSmoothAnims` to
the end did.

So the rule that stays a human one: **a sentence claiming what the engine
does needs an address next to it, and the address needs reading.**
