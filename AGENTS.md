# Working agreement for AI agents on this project

Two agents work on this repository in relay: when one runs out of context, the
other picks up. This file is the contract between them. Read it before doing
anything else.

---

## 1. The one rule that matters

**The iOS binary is the only source of truth.** `OUTPUT/armv7/UMK3.armv7`,
extracted from a legally owned copy of the game.

Nothing enters the main tree unless it is derived from that binary and
verified against it. Not from memory, not from a similar project, not from
another release of the same game.

### Why this is not negotiable

The project's legal basis is clean-room reverse engineering of a binary the
user owns, for interoperability and preservation. That is a defensible
position. Copying from leaked retail source is not, and it is not made
defensible by passing through an intermediate document, a summary, or another
agent. Once contaminated, the repository cannot be un-contaminated: there is no
way to prove afterwards which parts were clean.

Decompilation projects enforce this strictly — N64Recomp and the Nintendo
decomp community exclude contributors who have seen leaked source. A public
repo that admits to it is a takedown target and burns the maintainer's account.

**If you have read leaked source for this game, you cannot write code here.**
Say so and hand the work back.

### This is measurable, not theoretical

A cross-reference package built partly on historical source was audited against
the binary on 2026-08-14:

| Origin | Result |
|---|---|
| Tables derived from the iOS binary | **~100% correct** |
| `dispatch_notes.md`, which projects historical names onto iOS addresses | **20 symbols that do not exist in the binary** |

`_slave`, `_shake_ob_up`, `_him_x`, `_him_xy`, `_a0_for_him`, `_rough_hypotenuse`
and a dozen more were listed with iOS addresses. None of them are in the symbol
table. The contaminated material was not just legally unusable — **it was wrong**,
and it would have sent work down false paths for days.

Overall: 258 symbol/address pairs checked, 223 correct, 15 wrong, 20 fictional.

---

## 2. Acceptance criteria

A function is **done** when, and only when:

1. Its address is confirmed in `OUTPUT/functions.txt`.
2. Clean C exists in `decomp/<module>/`.
3. A differential test against the recompiled oracle passes with **zero
   divergences** across thousands of generated inputs.

Anything short of that is a draft. Mark it as such.

Do not use words like CONFIRMED, STRONG or PROBABLE based on a name
resembling something else. A symbol existing at an address is a fact worth
stating; what the function *does* is only established by decompiling it and
testing it.

---

## 3. What the tooling can and cannot do

`tools/armrecomp/recomp.py` is faithful by construction and is the reference
for behaviour. It does **not** handle:

- `blx reg`, `bx reg` — indirect calls
- `tbb` / `tbh` — jump tables
- function-pointer dispatch: `_QueueAndJump`, `_DoSwitchJump`, `_t_drone_proc`

Those need manual decompilation and verification by observation. The game runs
in touchHLE with a two-byte patch (see `docs/TOUCHHLE-PATCH.md`), which is the
behavioural reference for anything the recompiler cannot reach.

`tools/decomp_driver.py` ranks functions by difficulty and drives Ghidra. Start
with the easy ones — the types and conventions they establish make the hard
ones legible.

**Ghidra's output is a draft, never truth.** 27% of the engine core uses 2-lane
NEON for scalar maths, and Ghidra models it as opaque vector operations. Its
version of `_Len()` returns an uninitialised variable. For anything touching
NEON, write the arithmetic from the disassembly.

---

## 4. Handing over

When you run out of context, leave behind:

1. **`docs/PROGRESS.md` updated** — what you did, what you verified, what you
   left broken, and why. Written for someone with no context.
2. **Honest status.** If a test fails, say so and paste the output. A module
   marked done that is not done costs the next agent more than an empty one.
3. **Commits pushed**, with `Co-Authored-By:` naming which agent wrote what.

Do not leave uncommitted work in the tree.

---

## 5. Staging

Work from another agent arrives in a staging folder (`DEEKSEEK*/`,
`*_WORKING/`, `LOCAL_RESEARCH/` — all git-ignored). It is reviewed there and
only verified material is promoted to the main tree.

Do not commit staging folders. They tend to contain copies of the game assets
and, sometimes, material of uncertain provenance.

**Deliver text and your own code — not copies of the project tree or the game
data.** A 2.4 GB delivery that turned out to be a byte-identical copy of the
repository was deleted on 2026-08-14; the useful part was 0.23 MB of notes.

---

## 6. Credit

Both agents are credited in `AI-DISCLOSURE.md`. Attribute honestly: if the
other agent found something, say so. The research that mapped the cooperative
process scheduler in `other.c` came from DeepSeek and is credited there.
