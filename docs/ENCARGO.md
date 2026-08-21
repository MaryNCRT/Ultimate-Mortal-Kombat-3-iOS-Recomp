# Encargo — what to pick up next

A short, specific work order for whoever takes this on next. For orientation,
read [HANDOFF.md](HANDOFF.md) first; this file is the *current* task, not the
project overview.

---

## The engine compiles now. What that did and did not settle

```bash
for f in decomp/lime/*.c; do gcc -std=c99 -Wall -Wextra -fsyntax-only -I runtime -I decomp/lime $f; done
```

**0 errors, 12 warnings** — and every remaining warning is `unused parameter` on
a body the binary itself left empty, so they are correct rather than tolerated.

Linking every object together leaves exactly eighteen unresolved symbols, and
each falls into one of two groups that are *supposed* to be unresolved:

| group | symbols | why |
|---|---|---|
| Bodies deliberately not written | `CreateMatrixPaletteForGeneratingMesh`, `LIME_LoadEvents`, `LIME_LoadMeshSetTextures`, `LIME_LoadSkin1`, `LIME_RenderMeshSingle`, `LIME_TriggerEventFromSceneH` | documented declarations — see the table below |
| The platform boundary | `glPushMatrix`, `glPopMatrix`, `glLoadIdentity`, `glMatrixMode`, `glMultMatrixf`, `glTranslatef`, `limeLoadFile`, `limeFileSize`, `limeFree`, `limeMalloc`, `limeLoadTexture`, `limeDeleteTexture` | `runtime/` supplies these; `decomp/` must not |

Nothing else dangles. The engine is internally consistent.

**That link-time gap is closed.** `runtime/lime_platform.c` supplies the twelve
platform symbols on the host, `decomp/lime/lime_globals.c` the engine's globals,
and `decomp/lime/lime_unimplemented.c` resolves the six deliberately-bodyless
functions with definitions that abort and name themselves if reached. The loop
links the whole engine minus the file under test.

**RenderMesh.cpp passed** — 590 files, 7,327 meshes, 0 divergences:

```bash
UMK3_WORK=work UMK3_RES=<the res dir> python tools/decomp_loop.py --candidate   --name rendermesh --source-file RenderMesh.cpp   --clean decomp/lime/RenderMesh.c --test tests/test_rendermesh_diff.c --class B
```

**The next module is whichever one you write a differential test for.**
`tests/test_switchqueue_diff.c` already exists and has never been run. After
that, the modules with no test at all are the real work: a test is a day's
thought about what could differ, and it is worth more than the function it
checks.

### The test that found something

`tests/test_events_diff.c` is the first differential test here to catch a real
error in already-committed code rather than confirm it. `LIME_UpdateEvents` had
a branch read backwards — the path taken when an event's counters run out is
where it **kills itself**, and the committed version treated it as "nothing to
do". Finished effects stayed alive forever.

It was invisible on the page. Both readings produce plausible C, and the
disassembly line that settles it is a `beq` to an address 300 bytes away. Only
running both implementations over the same pool showed it.

**So write the test even when the function looks understood** — especially then.
And assert behaviour, not only agreement: two implementations agreeing on the
wrong thing is still wrong, which is why that test checks the grace period is
two frames rather than merely that both sides do the same thing.

### One rule this pass earned

**Never step an array of host structs by the binary's byte stride.** `EVENT` is
248 bytes in the binary because an ARM pointer is 4; `sizeof(EVENT)` here is 256.
`LIME_UpdateEvents` walked a 192-slot array with `+ 0xf8` and ran off the end.
A hard-coded stride is correct only for memory the engine treats as raw bytes —
a loaded file buffer, like the 216-byte track records in `Events.c`. For a C
array, index it.

Engine globals now live in `decomp/lime/lime_globals.c` — one translation unit,
because the original spread them across the files that used them and mirroring
that gives every file both a declaration and a definition.

---

## First: extend the oracle past the calibration pair

**Phase 0 is green.** `python tools/decomp_loop.py --calibrate` passes 2/2,
60,019 cases, 0 divergences. It needs `UMK3_WORK` to hold `symbols.txt`,
`func-to-file.txt` and `UMK3.armv7`.

**Only 13 of the 88 written functions have ever been run.** That is the gap
worth closing before writing more, because the first run found three real
defects in an afternoon — including the recompiler emitting undefined behaviour
for `ASR #32`, which means the oracle itself was capable of certifying wrong
code.

`RenderMesh.cpp` is the next module and `tests/test_rendermesh_diff.c` already
exists. It currently fails to compile with **20 errors**, all bounded and all of
one kind — the file was written to be read, not built:

```
8   undeclared globals      g_fadeTableBuilt, g_fadeTable, FADE_LEVELS,
                            FullBrightLoaded, TheFullBrightInfo,
                            g_debugEnabled, g_debugCubeScene, DEBUG_CUBE_SCENE
6   missing declarations    LIME_RenderMeshSingle, limeDeleteTexture,
                            LIME_FreeSingleMesh, limeFree, limeFileSize,
                            LIME_LoadScene
5   missing struct fields   MESHINFO.texture, MESHINFO.visible, MESHINFO.data
1   signature mismatch      limeLoadFile
```

**The signature one is a design decision, not a typo.** `lime.h` declares
`limeLoadFile(path, size_t *out)` — the shape the PC runtime wants — while the
binary has `limeLoadFile(path)` with a separate `limeFileSize(path)`. The
decompiled code is a description of the original and should carry the original
signature; the runtime should adapt. Decide that deliberately and write it down,
because both call shapes are already in the tree.

Do not add a struct field to `lime.h` without an offset you can point at.
Guessing one here corrupts every function that touches the struct.

---

## The job: finish `lime/common`

**92 of 109 have a body (84%).** The remaining 17 are **not all equal work**,
and the split matters more than the number:

| | count | what it means |
|---|---:|---|
| Body written | 92 | decompiled and verified against the gate |
| **Documented, body pending** | **11** | read, analysed, findings recorded — only the transcription is missing |
| Not yet read | 10 | nobody has opened these |

A documented declaration is deliberate, not a gap to be tidied. Each one carries
what was established plus an explicit note on what was *not*, because writing a
plausible body over an unconfirmed layout is the failure mode this project
guards against hardest. Filling one in is a short job for whoever confirms the
missing piece; inventing one silently costs a session to undo.

### Documented, body pending — the cheap wins

```
DS_DebugWin.c      LIME_Slider
Events.cpp         LIME_LoadEvents
Events.cpp         LIME_TriggerEventFromSceneH
LIMEDS_Misc.cpp    ConvertQSTMatrixtoPCMatrix
RenderMesh.cpp     LIME_LoadMeshSetTextures
RenderMesh.cpp     LIME_RenderMeshSingleIndexed
RenderMesh.cpp     CreateFadedRGBS
RenderScene.cpp    FlushTranspMeshList
RenderSkinned.cpp  LIME_LoadSkin1
limeFont.cpp       limeGetStringWidth
limeFont.cpp       limeGetStringWidthUCNoHeader
```

### Not yet read

```
Events.cpp         LIME_LoadMasterEventOffsets
Events.cpp         LIME_RenderEvents
Events.cpp         LIME_TriggerEvent
Events.cpp         LIME_TriggerEventsFromSceneOffsetIfFollowing
RenderMesh.cpp     LIME_RenderMeshSingle
RenderScene.cpp    LIME_RenderScene
RenderScene.cpp    LIME_RenderSceneOverrideTextures
RenderSkinned.cpp  CreateMatrixPaletteForGeneratingMesh
limeFont.cpp       limeDrawFONT
limeFont.cpp       limeDrawFONTAtAngle
```

`limeDrawFONT` is the highest-value one left: it is the only function that reads
the two font metric arrays [FONT-FORMAT.md](FONT-FORMAT.md) could not name.

**A caveat on that classification script.** It matches mangled names by trimming
the argument encoding, and it misfiles anything whose suffix it cannot strip —
`CreateFadedRGBS` and `CreateMatrixPaletteForGeneratingMesh` both report as
unread when the first is in fact documented. Regenerate the lists by reading
`decomp/lime/*.c`, not by trusting the matcher. This is the same class of bug
that once made three published percentages too low. This is the row that moves
the overall bar, and it is the bottleneck for everything downstream — there is
no engine for the platform layer to drive until it is finished.

| File | Done | Left |
|---|---|---:|
| `Matrix.cpp` | 11/11 | — |
| `limeVector.cpp` | 2/2 | — |
| `RenderSkinned.cpp` | 18/20 | 2 |
| `RenderMesh.cpp` | 15/19 | 4 |
| `Events.cpp` | 16/22 | **6** |
| `RenderScene.cpp` | 11/14 | 3 |
| `DS_DebugWin.c` | 6/7 | 1 |
| `LIMEDS_Misc.cpp` | 7/8 | 1 |
| `limeFont.cpp` | 2/6 | 4 |

### The method, which is routine now

```bash
python tools/disasm.py OUTPUT/armv6/UMK3.armv6 <mangled_symbol>
```

**Disassemble by name, never by a bare `0x...` address.** A numeric target makes
`disasm` assume Thumb; the armv6 slice is ARM throughout, so it silently
produces garbage rather than erroring.

Order by size — the small ones are accessors and wrappers and go in minutes. To
list what is left, sorted:

```python
# addresses and sizes come from OUTPUT/func-to-file.txt; a function is "done"
# only if decomp/lime/*.c contains a definition WITH A BODY
```

Then, without exception:

```bash
python tools/symcheck.py decomp/ OUTPUT/symbols.txt      # must report 0
```

And **before reading any function that calls libc or GL**, resolve its imports:

```bash
python tools/stubs.py OUTPUT/armv6/UMK3.armv6 0x127e24
```

733 stubs resolve. Skipping this is not just a missing name, it is an invitation
to guess: `IsTextureFullBright` was recorded as using `strcmp` when it actually
uses **`strstr`**, and that one wrong word made the `.???` wildcard in
`res/nolight.txt` look like an open mystery for several sessions. It was not —
591 of the 605 shipped `.meshset` files contain `.???` in their texture names,
and a substring test matches them exactly as intended.

---

## Three rules that this session actually needed

**Write what you established, not what would look complete.** Some functions
are in the repo as documented declarations with **no body** — `limeGetStringWidth`
is the current example, where the glyph *search* is not pinned down even though
the format around it now is. That is the correct outcome, not a gap to be tidied.

The patience pays off: the glyph table was undecoded for several sessions, and
`limeCreateFONT` then gave up the whole format at once — see
[FONT-FORMAT.md](FONT-FORMAT.md). Guessing a body earlier would have buried a
plausible wrong layout under a correct-looking function.

**`symcheck` is not a formality.** It caught a live invention this session — a
`limeFontAdvance()` helper written to paper over exactly that undecoded part.
Run it before every commit. If it flags something, decide whether the name is
real or invented; **do not add it to `ALLOW`**. An earlier session silenced
`lime_load_file` that way and hid the fact that the binary calls `limeLoadFile`.

**Do not state a constant you could not resolve.** `DS_DebugWin.c` documents the
window layout but deliberately omits the record size, because those literal
pools disassemble as `0xe12fff1e` — `bx lr` read as data. Say so in the comment.

### And one about the counter itself

The script that tallies progress matches a mangled symbol by trimming its
argument encoding, and it **has been wrong at least once**: it failed on `Pc`
and `PcS_` suffixes, so seven finished functions did not count and three
published percentages were too low. If the number jumps without you having done
the work, suspect the matcher and **check the newly-matched names by hand**
before publishing the higher figure.

---

## What is worth finding, not just counting

The value of this work has consistently been in what each function *confirms or
contradicts*, not in the function count. Recent examples, all from small
functions nobody expected anything from:

- `MatrixIdentity2` writes `1.0f` at `m[0]`, `m[4]`, `m[8]` — a 3x3 identity
  only lands there at **stride 3**, confirming `SKINMATRIX43` a third time.
- `LIME_FreeSkin` frees exactly the six documented `SKININFO` arrays. A missed
  field would leak; a phantom one would crash.
- `ConvertDSMatrixtoPCMatrix` multiplies by **1/4096** — the Nintendo DS
  fixed-point scale. The "DS" in the filename is literal, and it fits the Java
  ME ancestry already known from `EA_SDK/microedition/`.
- `LIME_printf` and `RenderAxesLines` are **compiled away**. An empty function
  is a finding.

Write that line in every comment. It is what makes the file worth reading.

### The standard a field identification has to meet

Two independent functions, same offset, same meaning -- or a prediction from the
disassembly that the shipped data then confirms without being consulted first.

Both happened this session. `RenderDebugCube` reads `scene->[0x80]` and hands it
to LIME_LoadMeshSetTextures; `LIME_LoadScene` contains the store that puts the
meshset there. Separately, `LIME_LoadScene` implied one unconditional sibling
load and one guarded one, and counting `res/` afterwards gave 545 `.events`
against 547 `.scene`, and only 74 `.offsets`. The prediction was written down
before the count was taken.

One function asserting an offset is a hypothesis. Do not write it as a fact.

---

## Traps already paid for

- **The engine mixes matrix conventions.** `CreatePerspectiveMatrix` and
  `ConvertDSMatrixtoPCMatrix` are row-major and need transposing for GL;
  `LIMEDS_SetObjectOrientation` hands its argument to `glMultMatrixf`
  untransposed. There is no blanket rule.
- **Geometry is Z-up**, GL is Y-up.
- **`LerpVector3` runs backwards** from its argument order: `t = 0` returns the
  *second* argument.
- **Strings may be UTF-16**, detected at runtime from a `0xFF 0xFE` BOM. Both
  encodings travel as `const char *`.
- **Lighting is monochrome with no ambient**, two directional lights through
  `pow()`, negated dot products. A plain `max(0, dot)` looks visibly wrong.

---

## After `lime/common`

**Local two-player is already written.** Do not build it. `_ButtonStatesP2`,
five 120-byte button layouts, `_JoystickStateP2`, `_P2Controls`,
`_PLAYER2MODEL`, plus `_isp2` and `_gup2` as real code — all present in **both**
retail builds. The iPhone build simply has no menu entry reaching it; the iPad
build does, and calls it "2 Players on 1 iPad". See
[IPAD-BUILD.md](IPAD-BUILD.md).

`_isp2` (48 bytes) and `_gup2` (368 bytes) are the obvious next targets once the
engine is done — they are in `gamecode`, not `lime/common`, so they are not part
of this task.

---

## Housekeeping that is currently true

- `runtime/` builds and runs on Windows (WGL) and Linux (SDL2), draws textured
  lit geometry, and poses characters — verified against real game data to
  0.000094, which is the print width.
- `tools/decomp_loop.py` exists and implements the acceptance gate from
  `ORDEN-BUCLE-AUTOMATIZADO.md`, **but has never been run**: it expects a
  populated `work/` directory. Calibrating it against `Matrix.cpp` and
  `limeVector.cpp` — its Phase 0 — is unfinished and worth doing before
  trusting it.
- Both READMEs, `PROGRESS.md` and `HANDOFF.md` are current as of `lime/common`
  at 88/109 and overall at 32%.
