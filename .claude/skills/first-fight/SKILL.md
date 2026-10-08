---
name: first-fight
description: Current top priority of the UMK3 project (brief v2, 2026-10-08) - get the first real fight running through the game's own task path (select -> Task_GameInit -> Task_GameMain -> Task_GameDestroy). Load at the start of every session on this repo, before choosing what to work on, and whenever the work touches umk3-game, character select, Task_GameInit/GameMain, mk3_init, FrameID_GetBBox, input masks, or the open PRs #42-#50.
---

# First fight — the project's current priority

Source: the brief `ENCARGO-PRIMERA-PELEA.md` (v2, 2026-10-08), which supersedes
`ENCARGO-HANDOVER.md`. This work outranks everything else until the five
done-criteria below are met. AGENTS.md still applies in full (the iOS binary is
the only source of truth; cite binary addresses in every fix).

Talk to Mary in Spanish. Code, commits and repo docs stay in English.

## State at the time of the brief (verify — it was written without building)

- `main`: 229 fight data tables extracted and verified (#46, #48;
  `tools/logic_tables.py`, `tools/check_logic_tables.py`, `ctest -R logic`).
  `runtime/fight_headless.c` runs the engine windowless with a **fake** bbox
  callback (`headless_bbox`).
- Open PRs: **#50** `umk3-game` (i686) boots `GameCodeMain` to character select,
  fixes the Arcade crash (MP3 via ACM/waveOut) and `Load_Tower`; contains #43.
  **#44** character select (cards, `IdleLists`) but the 3D fighter crashes in
  `IsAFrameVisible`. **#42** platform layer. **#49** sdl2 lint. **#45** no
  description, unreviewed.
- The hand-over is not to be invented: `GameCodeMain` already dispatches
  `TaskFunctionList[CurrentTask]()` and `Task_GameInit`/`Task_GameMain` are in
  that table (`runtime/gamecode_globals.c`). It happens when the real front end
  changes `CurrentTask`.
- The manual bridge in `runtime/test_main.c` (F2) is temporary; remove it once
  `Task_GameInit` runs by the real path.

## Decision already taken

The game executable is **32-bit (i686)** — the fight stores addresses in 32-bit
words. Python tools and the menu may stay 64-bit. Record this in
`docs/HANDOFF.md` when closing.

## Steps, in order

0. **Status**: `git fetch --all --prune`, `git log --oneline --since=2026-10-07 --all`,
   `python tools/progress.py`. Read any new branch/PR first.
1. **Land #50** (includes #43): review, run the gate, **re-test Arcade with this
   exact build**, merge. Then #49 and #42 if they pass. Read #45; if it adds
   nothing, close it with a comment.
2. **Select-screen 3D model (#44)**: `RenderPlayer -> IsFrameVisible ->
   IsAFrameVisible` crashes because `MESHREC` (`decomp/gamecode/Players.c`,
   88 bytes, `+0x18 = hasCols`) and `MESHINFO` (`decomp/lime/lime.h`,
   `+0x18 = verts` pointer) disagree. Disassemble `LoadAnimatedCharacter`
   (0x5c348): what it writes/reads at `+0x18`, and what `IsAFrameVisible` reads.
   Same record -> one struct is wrong, fix it citing addresses. Different
   records -> the bug is whoever passes one as the other. Proof: fighter draws,
   `UMK3_SHOT=n` saves a capture.
3. **Reach `Task_GameInit` by the real path**: pick and confirm a fighter in
   `umk3-game`, log `CurrentTask` per frame to stderr (remove later); confirm it
   becomes the `Task_GameInit` index (`__ZL16TaskFunctionList` @ 0x0017d940).
   If not, trace the select screen (input, timers, unreplicated `Task_FEMain`
   state). `Task_GameInit` is a 53-step manifest (`GameInit_LoadABit`, 11,700
   bytes): the log must show steps up to 52. Never add branches to `decomp/`
   that the original does not have.
4. **Real `FrameID_GetBBox`** (`decomp/gamecode/GameCode.c:1207`): pass it to
   `mk3_init` as the original does (`GameCode.c` ~6747:
   `mk3_init(P1, P2, FrameID_GetBBox, 1)`; AI opponent `P2 | 0x80`). Remove
   `headless_bbox` from the `umk3-game` path (may stay in headless).
5. **Input**: `runtime/lime_menu.c:152` has the 64-bit key mask read by
   `Task_GameMain` (bit 8 = BLOCK). Verify bit order against `Task_GameMain`,
   map keyboard -> P1's 10 bits (P2 if present). Proof: a key press produces the
   expected move in the engine log.
6. **Draw and close**: reuse the renderer that already draws the 18 arenas with
   an animated fighter. `Task_GameMain` >= 600 frames without a crash; clean exit
   through `Task_GameDestroy` back to the front end.

## Debug order when something crashes

1. Reproduce with `UMK3_SHOT=<n>` or the log, always with the same input.
2. Structures and offsets first, then 32 vs 64-bit pointers, then tables.
3. Compare with the original: `tools/difftest/run.sh`, `tools/factdiff.py`,
   oracle `tools/armrecomp/recomp.py`. Indirect dispatch (cooperative threads,
   `other.c`) is not covered by the oracle — use traces.
4. Ghidra is wrong on 2-lane NEON: use the armv6 slice as a second opinion.
5. Every fix cites the binary address in a comment.
6. One change at a time, capture after each (the `IsAFrameVisible` crash may
   have more than one cause). If one of the 271 untested fight functions fails
   in game, write its test before fixing it.

## Gate before every merge

```
bash tools/check.sh
python tools/symcheck.py <file> work/symbols.txt
python tools/progress.py --write
ctest --test-dir build -R logic
```

Hard rules: zero assets in the repo; no `assert()` in stubs; never add names to
`ALLOW`; repo content in English; if a doc figure disagrees with
`progress.py`, fix the doc. Doc contradictions (figures, `E:/MK3 PROJECT`
paths, missing `DECOMP-LOOP.md`) are fixed at the end, not mixed with code.

## Done = all five

1. `Task_GameInit` reached by the real path; log shows steps up to 52.
2. `Task_GameMain` runs >= 600 frames.
3. Arena and fighters drawn.
4. P1 keyboard control, and a hit that reacts and lowers health.
5. Clean exit through `Task_GameDestroy`.

Never call it "playable" unless 4 and 5 hold.

Out of scope until criterion 5: matching phase 0 (`docs/TOOLCHAIN-MATCHING.md`).

## Final report format (mandatory)

- PRs merged and not merged (with numbers).
- Criteria 1–5: met / not, with the command or capture proving each.
- Findings on `+0x18` (`MESHREC` vs `MESHINFO`), with addresses.
- What remains, with risks.
- `progress.py` figures, verbatim.
