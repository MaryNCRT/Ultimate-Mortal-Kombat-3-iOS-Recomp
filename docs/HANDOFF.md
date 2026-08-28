# Handoff

Written for whoever picks this up next, human or model, with no prior context.
Read this, then [METHODOLOGY.md](METHODOLOGY.md). Everything else is reference.

---

## Where the project actually stands

**49.20% of the total estimated effort. Nothing is playable.** The arithmetic is
in the [README](../README.md#overall-progress) and the weights are a judgement
call; the completion figures are measured by `tools/progress.py` on every run.

| | |
|---|---|
| Asset formats | **100%** — solved, demonstrated, animating |
| `lime/common` | **109 of 109** written, **all nine files verified** |
| Native executable | **exists**, draws all 18 arenas with a skinned animated fighter |
| `gamecode` | **250 of 291** — the current front |
| `gamecode/logic` (fight engine) | 3 of 2,172 — essentially untouched |
| Platform layer | window, GL context and asset loading on Windows and Linux; no audio, no input mapping |

The shape of the project is still that it has **more verified knowledge than
code**, but less lopsidedly than it was: `lime/common` is finished and
`gamecode` is past five-sixths. The fight engine is the mountain that remains.

**If you are picking this up mid-stream, the front is `gamecode`.** Work
smallest-function-first through `python tools/pending.py`; the small ones keep
turning up the constants and struct offsets the big ones then need. The bar for
landing one is in the ["Next up"](PROGRESS.md#next-up) section of PROGRESS.md
and is not negotiable: `check.sh` at **zero errors and zero warnings** in
`decomp/gamecode`, `symcheck` at zero unknown callees, figures republished with
`tools/sync_figures.py`.

---

## The five rules that produced everything here

These are not style preferences. Each came from a specific failure.

**1. Never trust a decompiler.** Ghidra silently mis-decompiles the 2-lane NEON
this compiler emits for scalar float maths — `_Len` returned an uninitialised
variable and compiled fine. Every accepted function is cross-checked.

**2. Read the armv6 slice, not armv7.** Same source, two code generators. armv7
is packed NEON and unreadable; armv6 is plain scalar VFP. This is now the
default route and it has never failed. `tools/slices.py` extracts both.

**3. Visual evidence terminates a hunt; numerical evidence only sustains one.**
Four times this project burned hours on something one glance at an image ended
— touchHLE's off-screen gamepad, MAME's door interlock, a PVRTC "bug" that
lived in the reference data, and a model that turned out to be Z-up.

**4. Question the reference, not only the code.** Three of thirteen PVRTC
reference images were different assets. The decoder was right the whole time.

**5. A file that will not parse is usually a variant, not corruption.** The tell
is that the alternative reading **divides exactly rather than nearly**. This
closed ROBO1/ROBO2, SINDEL, and CUTUP.

### And one anti-rule, learned the hard way this session

**Measure before changing.** A model lying on its back was confidently
diagnosed as a texture-orientation problem, on reasoning that sounded airtight
— PVR row 0 is the top, GL's V=0 is the bottom, therefore flip. The fix broke
textures that were already correct. The bounding-box extents named the real
cause in one line and had been available all along.

---

## Hard boundary: leaked source

Leaked UMK3 retail source has been offered to this project three times and
declined three times. **Continue to decline.** Using it destroys the clean-room
basis; possessing a copy grants no licence to make derivative works; the
contamination is irreversible.

This extends to **third-party write-ups that are themselves readings of leaked
source** — Ryiron's arcade process analysis is explicitly a "Source Code
Review". Building on someone else's reading of leaked material is the same
contamination one step removed.

Arcade behaviour comes from **observing the ROM under MAME**, which this project
has already done, and from **our own binary's symbol table**, which names 4,342
functions. That rule is why the findings here are reusable at all.

`.gitignore` carries broad patterns to catch renamed folders.

---

## Legal model

**Zero game assets in the repository.** Every build extracts what it needs from
a copy the user supplies. The `LABORATORIO MAME/` folder is fully gitignored and
the ROM is never committed.

Documentation **screenshots are fine** and are in `docs/img/` — a render depicts
geometry, is not an asset file, cannot be unpacked back into one, and is not
part of any build. Both READMEs state this. Reading "no assets" as "no pictures"
protects nothing and costs the project its only visible evidence.

---

## What to do next, in order

### 1. Finish `gamecode` — this is the front

**250 of 291.** Ten files under `decomp/gamecode/`. Run
`python tools/pending.py 40` for what is left, size-ordered.

**Work smallest-first.** This has been repeatedly worth it: the small functions
keep turning up the constants, strides and struct offsets the large ones then
need, and going in size order means you never block on an unknown. `checkIfKode`
(136 bytes) answered a question `resetKodeSelector` had left open; `getToken`
(156 bytes) caught a misread jump table in `initArguments`; `limeUC` (184 bytes)
explained why `getToken` starts at `s + 2`.

**The strongest case for it so far**: the front-end task functions corrected
*seven* wrong type declarations, none of which was findable from inside the
function that declared them. `limeCreateFONT`'s last parameter is a float and
not an int, `SFXHandle` and `MusicVol` are arrays and not pointers,
`exitTimeout` and `KontinueTime` are floats and not longs, and both
`EASDK_LogEvent` variants had an argument typed wrong. Every one was settled by
reading a caller. Assume any signature that has never been read from a call site
is provisional.

What is left is the tail, and it is all large. `GameInit_LoadABit` (11,700 B) is
done and was worth the day it cost — it is the asset manifest for a fight and it
produced [the roster table](ROSTER.md). Five remain over 5 KB: `DrawHUD`
11,536 B, `FE_Task_About_Help` 10,360 B, `MovesList` 8,796 B, `AddNewGameEvents`
6,644 B, `UpdateInGamePauseMenu` 5,720 B — and the next tier
(`FE_Task_About_About`, `DrawControls`, `TrackCam`, `MaintainParticles`,
`FE_Task_Bios`) is 1.6 to 1.9 KB each. Budget for them separately; they are not
more of the same.

**A big function is often mostly one thing repeated.** `GameInit_LoadABit` is 53
steps of which twenty are two lines each, plus four 24-way switches that are one
table written out four times. Find the repetition first — extract the tables
mechanically with a script — and what is left to read by hand is small.

**`tools/annotate.py` truncates at the first literal pool** inside a function,
so for anything of this size its output stops early — and silently, which is
worse. Several functions in this block have their last third past a pool. Use
`tools/disasm_range.py` for those:

```bash
python tools/disasm_range.py work/UMK3.armv7 0x00010348 0x00010474
```

It steps over undecodable halfwords as `.word` and resumes, and resolves the
`ldr rN,[pc,#imm]` / `add rN,pc` pairs the same way `annotate.py` does. Reach
for `annotate.py` first — it names call targets, which this does not — and fall
back to this the moment the output ends somewhere a branch says it should not.

**The bar for landing one is not negotiable:** `bash tools/check.sh` at **zero
errors and zero warnings in `decomp/gamecode`** (the 13 `unused parameter`
warnings elsewhere are pre-existing), `python tools/symcheck.py <file>
work/symbols.txt` at zero unknown callees, then `python tools/sync_figures.py`
to republish the figures, then commit. A warning tolerated once becomes noise
that hides the next real one.

Write each function into its file with the armv7 address, the byte size, and
**what it confirms or contradicts**. That last part is where the value has
consistently been.

### 2. Then `gamecode/logic`

3 of 2,172, and the real mountain. **Its boundary with `gamecode` is already a
function pointer**: `mk3_init`'s third argument is `FrameID_GetBBox`, handed in
at init rather than called directly (see `decomp/gamecode/training.c`). Any
indirect call inside the logic module that takes a frame id and returns a box is
almost certainly that callback.

Everything learned in `gamecode` about
`PLAYER` (stride 0x5f0), `ANIMATEDCHARACTER` (character id at +8, frames at
+4 with an 88-byte stride) and the two frame tables feeds straight into it.
`moves_data.x` already names **92 `t_` handlers and 90 `q_` predicates** — see
[X-TABLES.md](X-TABLES.md) and [issue #1](../../issues/1).

This is the part the verification oracle cannot reach, so the standard of
evidence has to come from somewhere else: MAME observation and the binary's own
symbol table, never leaked source.

### 3. The platform layer

229 functions, of which **56 are a vendored MIT copy of zoul/Finch** and need no
reverse engineering. The GL target is measured, not guessed: **77 entry points**,
all ES 1.1 fixed function, three texture units, no shaders anywhere. See
[LIME-ENGINE.md](LIME-ENGINE.md).

What exists today: window creation and a GL context on Windows (`win32_gl.c`)
and everywhere else (`sdl_gl.c`, selected by CMake, or `-DUMK3_BACKEND=sdl2` to
force it on Windows), plus the asset readers under `runtime/lime/`. **No audio
at all, and no input mapping.** Those are the gaps.

### 4. Renderer fixes whose causes are now known

Not open searches any more — each has a named function behind it:

- [#20](../../issues/20) a mirrored fighter needs `glCullFace(GL_FRONT)` to go
  with its negative X scale. `runtime/demo.c` enables culling and never calls
  `glCullFace`, which is correct only while one fighter is drawn.
- [#17](../../issues/17) the second background layer — `RenderLevelBG`,
  `MaintainLevelScenes` and `AnimateBG` are the three functions that settle it,
  all still pending.
- [#19](../../issues/19) Graveyard's floor gap.

## Things that will bite you

- **The engine does not use one matrix convention.**
  `CreatePerspectiveMatrix` needs transposing for GL; `LIMEDS_SetObjectOrientation`
  does not. Do not apply a blanket rule.
- **Geometry is Z-up.** GL is Y-up.
- **`LerpVector3` runs backwards** from its argument order: `t = 0` gives the
  *second* argument. `GetSlerpedQ` blends the same way round, and despite its
  name it is a **lerp with a shortest-arc sign flip, not a slerp** — no acos, no
  sin, no renormalisation. See [SKIN-FORMAT.md](SKIN-FORMAT.md).
- **Transparency is ADDITIVE with depth writes off, and deliberately unsorted.**
  Additive blending is commutative, so insertion order is correct order and the
  missing depth sort is not an oversight. Switching to standard alpha blending
  to make smoke look denser makes the result order-dependent and turns the
  absence of a sort into a real bug.
- **Lighting is monochrome and has no ambient term.** Two directional lights,
  a `pow()` falloff on each, negated dot products, clamped to 1. Substituting a
  plain `max(0, dot)` will look visibly wrong. See [LIGHTING.md](LIGHTING.md).
- **Thumb is marked by `N_ARM_THUMB_DEF` in `n_desc`**, not by bit 0 of the
  symbol value. `macho.py` handles it; anything new must too.
- **`IsWhirlwindScene` matches a filename substring.** Repacking assets breaks
  effects with nothing to warn you.

---

## Tools worth knowing about

| | |
|---|---|
| `tools/disasm.py` | disassemble by name; resolves import stubs |
| `tools/slices.py` | extract armv6/armv7, find NEON-affected functions |
| `tools/glsurface.py` | inventory every GL entry point the engine calls |
| `tools/meshview.py` | render a `.meshset` to PNG |
| `tools/pose.py` | pose a character; `idle` finds the stance |
| `tools/animate.py` | name the clips in an animation stream and play them |
| `tools/finishers.py` | the fatality/babality catalogue with frame indices |
| `tools/armrecomp/recomp.py` | the verification oracle |

---

## Open questions worth someone's time

- **`.lighting` is a prelight bake and is not decoded.** 13 files, sizes scaling
  with vertices x frames at ~2 bytes each, bytes 62% zero — delta coding or
  compression. If it is what it appears to be, `LightVert` is the *fallback*
  path and most characters are lit from the table instead.
- **Each `*FRAMES.bin` is exactly 14,490 bytes** for every character with no two
  identical — a fixed-length table, presumably the compiled form of the text
  frame list. Layout undecoded.
- **`word0` of a bone record** is not the child count. Meaning unknown, and
  nothing needs it.
- **Is the hidden roster reachable?** Noob Saibot, Human Smoke and Classic
  Sub-Zero ship complete with portraits and a `HIDDENPORTRAIT.PNG` exists. The
  select-screen logic is in `FrontEnd.cpp`, now 66 of 126 — but the two
  functions that would answer this, `drawCharacterSelection` (3,116 B) and
  `FE_Task_Character_Select` (1,152 B), are both still pending. See
  [HIDDEN-CONTENT.md](HIDDEN-CONTENT.md).

  Two adjacent things are already known and narrow it. `LoadFrontEndCharacters`
  loads **character 23 as character 0** while keeping 23's own id, and
  `TheFECharacters` has **25 slots**. And `checkIfKode` compares six words of
  `KodeSelector` against a `-1`-terminated `_kodes` table at `0x00176c04`,
  publishing the matched entry's payload in `_theKode` — so the kode system is
  fully mapped even though what each kode unlocks is not.

---

## Keep doing this

Update `PROGRESS.md` at the end of each block of work, keep the percentage bars
honest — **they did not move for several very productive sessions and that was
correct**, because the row those sessions advanced was already at 100% — close
issues that are resolved, open issues for what you find, and record the failures
alongside the results. Half the value in this repository is in the paragraphs
explaining what did *not* work.

## Where the work stopped (2026-08-27)

`MovesList` landed; **gamecode is 251/291 = 85.9 -> 86.25%**.

`DrawHUD` landed after it (armv7 `0x000282dc`, 11,536 bytes, the largest in
gamecode), taking **gamecode to 252/291 = 86.60%**. The finding that changes how
the fight loop has to be ported: **`DrawHUD` runs the round and match state
machine**, not just drawing -- `QuitAsWin`, `QuitAsLose`, `mk3_init`,
`ResetFightData` and `InitEnduranceMatch` are all called from inside it.

Two tools were added for it and both are verified:

- `tools/imports.py` names a `blx` into `__symbol_stub4` by walking the
  indirect symbol table. `0x000f3d34` is `_sprintf`.
- `tools/lits.py` appends the pool value to every pc-relative literal load.
  Sprite sizes, UV extents and timer rates all live in the literal pool.

## AddNewGameEvents landed

`AddNewGameEvents` (armv7 `0x000732a8`, 6,644 bytes) is decompiled, and
**`Blood.cpp` is the first complete file in `gamecode` at 8/8**. See
[GAME-EVENTS.md](GAME-EVENTS.md).

The next largest are `FE_Task_About_Help` (10,360 B),
`UpdateInGamePauseMenu` (5,720 B), `FE_Task_Tower` (4,696 B) and
`RenderLevelPlayers` (4,572 B). Of those `RenderLevelPlayers` is the one a
booting port needs.

The trap to avoid, having been walked into twice already: a `handlers.py`
summary tells you an arm calls `get_tsound`. It does not tell you the id. Three
constants in `DrawHUD` were written from a summary and all three were wrong --
the health bar's y, the danger sprite's size, and the flawless timeout.
