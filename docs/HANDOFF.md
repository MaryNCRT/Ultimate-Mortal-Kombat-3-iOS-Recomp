# Handoff

Written for whoever picks this up next, human or model, with no prior context.
Read this, then [METHODOLOGY.md](METHODOLOGY.md). Everything else is reference.

---

## Where the project actually stands

**28% of the total estimated effort. Nothing is playable.** The arithmetic is in
the [README](../README.md#overall-progress) and the weights are a judgement
call; the completion figures are measured.

| | |
|---|---|
| Asset formats | **100%** — solved, demonstrated, animating |
| `lime/common` | **46 of 109** functions |
| Native executable | **exists**, draws textured lit geometry |
| `gamecode` + fight logic | 2,463 functions, essentially untouched |
| Platform layer | target measured (77 GL entry points), barely written |

The shape of the project is that it has **a great deal of verified knowledge and
not much code**. Closing that gap is the work.

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

### 1. Finish `lime/common` — 63 functions left

**This is the bottleneck for everything downstream.** No engine means nothing
for the platform layer to drive; no platform layer means no playable build.

Method, which is now routine and fast:

```bash
python tools/disasm.py OUTPUT/armv6/UMK3.armv6 <mangled_symbol>
```

Disassemble **by name, never by a bare `0x...` address** — a numeric target
makes `disasm` assume Thumb, and the armv6 slice is ARM throughout, so it
silently produces garbage rather than erroring. That bug cost a tool a rewrite.

Order by size; the small ones are accessors and wrappers and go in minutes.
`limeFont.cpp` (0/6) and `DS_DebugWin.c` (0/7) are untouched. `Events.cpp` has
15 left including the big `LIME_LoadEvents` and `LIME_UpdateEvents`.

Write each one into `decomp/lime/<File>.c` with the armv6 address, the byte
size, and **what it confirms or contradicts**. That last part is where the value
has consistently been.

### 2. Grow the vertical slice as you go

`runtime/` builds and runs. Each newly decompiled function can now be tested by
drawing rather than in a harness — which is the entire reason it was built
before the decompilation was finished.

The SDL2 backend now sits beside `win32_gl.c` and is what CMake picks anywhere
that is not Windows, so the slice builds and runs on Linux — verified there
against a generated `.meshset`, since the game data is not in the repository.
`-DUMK3_BACKEND=sdl2` selects it on Windows too.

The next step there is wiring `tools/pose.py`'s skinning into the C side so
characters animate natively.

### 3. Then the platform layer

229 functions, of which **56 are a vendored MIT copy of zoul/Finch** and need no
reverse engineering. The GL target is measured, not guessed: **77 entry points**,
all ES 1.1 fixed function, three texture units, no shaders anywhere. See
[LIME-ENGINE.md](LIME-ENGINE.md).

### 4. `gamecode` last

2,463 functions and the real mountain. `moves_data.x` already names **92 `t_`
handlers and 90 `q_` predicates**, which is a substantial head start on what
those functions are — see [X-TABLES.md](X-TABLES.md) and
[issue #1](../../issues/1).

---

## Things that will bite you

- **The engine does not use one matrix convention.**
  `CreatePerspectiveMatrix` needs transposing for GL; `LIMEDS_SetObjectOrientation`
  does not. Do not apply a blanket rule.
- **Geometry is Z-up.** GL is Y-up.
- **`LerpVector3` runs backwards** from its argument order: `t = 0` gives the
  *second* argument.
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
  Sub-Zero ship complete with portraits and a `HIDDENPORTRAIT.PNG` exists, but
  the select-screen logic is in `FrontEnd.cpp` and is not decompiled. See
  [HIDDEN-CONTENT.md](HIDDEN-CONTENT.md).

---

## Keep doing this

Update `PROGRESS.md` at the end of each block of work, keep the percentage bars
honest — **they did not move for several very productive sessions and that was
correct**, because the row those sessions advanced was already at 100% — close
issues that are resolved, open issues for what you find, and record the failures
alongside the results. Half the value in this repository is in the paragraphs
explaining what did *not* work.
