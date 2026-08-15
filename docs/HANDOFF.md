# Handoff — 2026-08-15

For whoever picks this up next. Read [AGENTS.md](../AGENTS.md) first; it is the
working agreement and it has not changed.

---

## Where the project stands

**23% overall. 0.7% of the decompilation itself — 17 functions of 2,572.**
Nothing is playable natively yet.

The second number did not move at all, and that is the honest headline: no new
function was finished. What moved is everything underneath it. The verification
oracle is done. The game runs in touchHLE with **no known crash**. And the
armv6 slice turned out to answer the question that has blocked the maths-heavy
code since the start.

| Done | Where |
|---|---|
| `Matrix.cpp` — 11 fn | 40,006 cases, 0 divergences |
| `limeVector.cpp` — 2 fn | 20,013 cases, 0 divergences |
| `RenderMesh.cpp` loader — 3 fn | 7,327 meshes, 0 divergences |
| `other.c` `SwitchQueue` — 1 fn | 500 pushes, 0 divergences |
| `.meshset`, `.skin`, `.bones`, `.skinanim`, `.events` | all validated against every file |
| Verification oracle | 4,342 functions, 0.02% untranslatable |
| Game runs in touchHLE, no known crash | 5 bytes, `docs/TOUCHHLE-PATCH.md` |
| `.pvr` block geometry | 1,400 of 1,400 exact |

---

## The thing that changed today

**Playing the game is a first-class analysis method, not a sanity check.**

Nine sessions and a full arcade run produced findings that static analysis had
not and could not:

- The engine **prints its own dispatch indices**. `FE_Task_Main_Menu(0)`,
  `FE_Task_Character_Select(27)`, `FE_Task_Select_Leaderboard(49)` — 12 of 53
  mapped just by walking menus. This is the only way to attack the tables
  behind `_DoSwitchJump`, which no differential test can reach.
- The game **prints every event it triggers**, with source scene and frame
  number. That is a free oracle for `.events`.
- Holding a finger on Smoke reveals Human Smoke, so character select measures
  **press duration**. A port implementing only "tap" loses the hidden
  characters silently. Static analysis would never have suggested trying it.
- The babality model sometimes fails to draw — and the logs prove it is a
  PVRTC upload failure in the emulator, **not** a missing asset and **not** a
  game bug. Without playing, that would have looked like a format error and
  sent someone hunting for a bug that does not exist.

**Consequence for how to prioritise: prefer work the emulator can verify.**

---

## Revised route

The old order walked `lime/common` module by module. That was right when the
oracle was the only verification available. It no longer is.

### 0. ~~Fix the PVRTC decoder~~ — done ([issue #10](../../issues/10))

**1.5% mean error, and the residual is proven to be compression rather than a
bug** — it rises with the image's local gradient (4.75 flat, 30–51 at hard
edges) and is flat across block position. `python tools/pvrtc_diff.py`.

The lesson is worth more than the code. Three rounds were spent hunting a bug
that lived in the **reference data**: three of the thirteen PNG/PVR pairs are
different assets sharing a name, and `FE_METAL_BG` alone inflated the score
from 3.83 to 14.00. Rendering the images side by side ended it in one glance.
That is the third time this project has paid for not looking at the picture.

**Still owed before a C port ships:** the corpus is four independent assets, two
per bit depth. The 25 `*_VERSUS` pairs become usable if the 512×512 PNG is
downscaled to the PVR's 256×256.

### 1. Capture the move input tables — [issue #5](../../issues/5)

**Do this first, because it costs an evening and no skill.**

The in-game moves list **prints the displayed move's input sequence every
frame**, one integer per line, values 0–22. The period of the repetition is the
number of inputs in the move. Evidence and the five sequences already captured
are in [PROGRESS.md](PROGRESS.md#the-moves-list-dumps-the-move-input-tables).

So:

1. Launch with a log: `touchHLE.exe app.ipa *>&1 | Tee-Object -FilePath moves.txt`
2. Start a fight, open the in-game menu, go to **Moves Info**.
3. Scroll through **every move**, pausing a second or two on each so the cycle
   repeats enough times to be unambiguous.
4. Repeat for as many characters as patience allows. Note in a text file which
   character and which move order you walked, in the same order — that is what
   turns the numbers into a table.
5. Segment the log by periodicity; the code that does it is three lines and is
   shown in the PROGRESS entry.

The result is the move input table for the whole roster, which is the single
most valuable dataset in the fight engine and the part static analysis handles
worst. It also pins down the icon alphabet: with enough moves cross-referenced
against a public UMK3 move list, each of the 0–22 values gets a name.

Do not decompile anything to get this. The game is already telling you.

### 2. ~~Finish `.events`~~ — done ([issue #3](../../issues/3))

Solved. 544 of 545 files walk to their exact last byte; see
[EVENTS-FORMAT.md](EVENTS-FORMAT.md). Two things from it are worth carrying
into the next format:

- **Derive strides from the loader, not from the walk.** Both the 268-byte
  header and the 56-byte entry come out of the loader's own pointer
  arithmetic, and the header is then accounted for byte by byte by its load
  sequence. That is what makes the layout credible.
- **Check a claimed constant against the whole corpus before believing it.**
  This format was audited as circular evidence because `numEntries` looked
  constant across 212 tracks. Across all 1,547 it takes ten distinct values
  and 103 tracks are not 1 — so the walk was real evidence after all. A
  subset is not a corpus.

Still open: `CUTUP_BY_REPTILE_STRYKER.events` does not parse and probably is
not an events file at all.

### 3. A mesh viewer

All four model and animation formats are solved. There is enough to draw an
animated character on screen, and **the project has produced no visible output
in its entire life**. That matters for morale and for attracting contributors,
and it validates four format specifications at once in a way no test can.

Start from `.meshset` + `.skin` + `.bones` + `.skinanim`, GLFW and OpenGL 3.3.
PVRTC has to be decoded on the CPU — do not rely on a GL extension, which is
exactly what fails inside touchHLE.

### 4. ~~Patch the modal dialogs~~ — done, and the premise was wrong ([issue #4](../../issues/4))

The dialogs were never the problem. `_CFRunLoopRun` has two callers in the
whole binary; patching both made things **worse**, because those dialogs were a
barrier holding the game back from the GameKit path. The real crashes were
`GKSession` (unimplemented in touchHLE) and a licence screen whose exit branch
is conditional on a return value it does not always get. Three patches, five
bytes, no known crash. Superseded text below kept for the reasoning:

<details><summary>original</summary>

```
-[modalAlertDelegate initWithRunLoop:]   0x000b53bc   <- the cause
+[modalAlert confirm:]                   0x000b54a0
+[modalAlert ask:]                       0x000b54e4
```

Every confirmation dialog kills touchHLE, because the modal spins a nested run
loop and `_CFRunLoopRun` is unimplemented. Neutralising `confirm:` and `ask:`
the way `LocaleManager::setLocale` was neutralised would fix resetting arcade
progress, the leaderboard and achievements in one go — and make longer play
sessions possible, which feeds everything above.

Use `tools/patch_ipa.py`. Work on a copy.

</details>

### 5. `_DoSwitchJump` — [issue #1](../../issues/1)

Still the biggest prize and still the hardest. Now approach it **through the
emulator**: reach a state, read the index the game prints, map index to
function. Do not mark anything verified on the strength of a plausible-looking
decompilation.

### 6. `playback.c` / `_seq_lookup` — [issue #6](../../issues/6)

The best first target inside `gamecode/logic`: four functions, self-contained,
about 4 KB of embedded table, and the function **prints its own arguments** —
366 calls captured. Verification there needs no differential harness, which
matters because most of the fight engine dispatches through function pointers
the recompiler cannot follow.

It also cross-checks item 1: the sequences the moves list prints and the ones
`seq_lookup` resolves should be the same data seen from two directions.

### 7. Everything else

`RenderScene.cpp`, `RenderSkinned.cpp`, signatures and structs for
`SKININFO` / `BONE` / `BONEANIMFRAME`. Same loop as before:
`tools/decomp_driver.py`, then a differential test.

---

## Practical notes on the emulator

- **Run it with a log** when you want data: `touchHLE.exe app.ipa *>&1 | Tee-Object -FilePath log.txt`.
  Expect stutter — a long session writes ~47,000 lines. Run without the pipe
  when you want it smooth.
- **A working gamepad mapping** is in `docs/touchHLE_options.example.txt`.
  touchHLE's own defaults for this app put the touch targets off-screen, so a
  controller appears dead until you replace them.
- **Confirmation dialogs are fine now.** The old warning was based on a theory
  that did not survive testing — see [issue #4](../../issues/4).
- The log's own output is worth grepping for `triggered event`, `FE_Task_`,
  `loading scene:` and `glError`.

---

## What I would tell you if we only had one sentence

The differential test is what makes a function *correct*; the emulator is what
tells you *what to look at* — and this session ended with the game handing over
its own move tables, which is the strongest argument yet that the second
question was the under-served one.
