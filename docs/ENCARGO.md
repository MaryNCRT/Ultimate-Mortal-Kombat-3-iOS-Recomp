# Encargo — what to pick up next

A short, specific work order for whoever takes this on next. Read
[HANDOFF.md](HANDOFF.md) first for orientation; this file is the *current* task.

---

## Where things stand

**`lime/common` is 109 of 109, and every file is verified.**

| Module | Differential test |
|---|---|
| `Matrix.cpp` | 40,006 cases |
| `limeVector.cpp` | 20,013 cases |
| `LIMEDS_Misc.cpp` | 21,950 cases |
| `RenderSkinned.cpp` | 18,780 cases |
| `Events.cpp` | 2,224 cases |
| `limeFont.cpp` | 896 cases |
| `RenderScene.cpp` | 80 helper cases + 29 GL-stream cases |
| `DS_DebugWin.c` | 58 cases |
| `RenderMesh.cpp` | 590 files, 7,327 meshes + 193 GL-stream cases |

Zero divergences throughout. 103,907 synthetic cases plus real game data.

**The engine draw path is closed.** Both scene renderers and the mesh draw now
match the original call for call:

| test | cases | divergences |
|---|---|---|
| `test_renderscene_gl_diff` | 29 | **0** |
| `test_rendermesh_gl_diff` | 193 | **0** |

Getting there took nineteen measured defects across the two files, plus a
fifth defect in the oracle itself. Written up in
[RENDERSCENE-SIGNATURE.md](RENDERSCENE-SIGNATURE.md) and
[RENDERMESH-DRAW.md](RENDERMESH-DRAW.md).

The one worth reading first: `recomp.py` emitted flag updates for instructions
inside Thumb IT blocks, so both halves of every `ITE` ran. The obvious response
to the divergences it caused was to invert a `fullBright` test in the clean C --
which would have agreed with the oracle, passed the gate, and lit exactly the
surfaces the engine exists to leave unlit. **A red result deserves no more trust
than a green one until the instrument has been checked.**

The enum-pairing problem this file used to describe as needing register liveness
tracking **is solved and never needed it.** `recomp.py` emits every import as
`stub_auto_glXxx(arm_ctx *ctx)`, so the register file at the instant of each
call is simply available. `tests/gl_trace.c` records both sides and compares
them. Measure, do not infer.

**So the next target is `gamecode`** -- 291 functions, starting with `_isp2`
(48 bytes) and `_gup2` (368 bytes).

---

## What writing those tests cost, and found

The three are written. **Writing tests has been worth more than writing code
for the whole of the last period**, and the numbers say so plainly.

Extending the differential tests found **nine defects**:

**Four in the oracle itself** — `recomp.py` emitting `>> 32` on a 32-bit type
(undefined behaviour, compiled to `>> 0`); `tbb`/`tbh` jump-table targets never
getting labels; double literals emitted with the invalid suffix `uULL`; and
`F32ADD`/`F32SUB`/`F32MUL`/`F32NEG` referenced by the emitter and never defined.

**Five in already-committed decompiled code** — `LIME_UpdateEvents` with a
branch read backwards, so finished effects never died; `ConvertDSMatrixtoPCMatrix`
writing zero at `m[15]` instead of `1.0f`; the QST scale constant taken as
`1/32767` when the binary holds `3.0518509447574615e-05`; `LerpQSTMatrix`
modelling all 32 bytes as `int16` when it blends four `int16` and six floats;
and `CreateFadedRGBS` with its source and destination arguments swapped.

**Every one of the four oracle defects fires only on code the calibration pair
does not resemble.** `Matrix.cpp` and `limeVector.cpp` contain no `vmls`, no
jump table, no double literal and no `ASR #32`. Calibration alone would never
have found any of them. That is the argument for testing modules rather than
trusting a green Phase 0.

### How to write one

Copy `tests/test_limedsmisc_diff.c`. It is the clearest of the five and it
demonstrates the thing that matters: **choose inputs against the specific ways
the function could be wrong**, not at random.

- `MatrixMul2` gets matrices *including the translation row*, because the
  rotation agrees under a plain 4×3 multiply and only row 3 tells the two apart.
- `GetSlerpedQ` gets pairs at *exactly zero* dot product, because that is the
  boundary the `vnegls` predicate includes and a `< 0` version would miss.
- `Xform2` gets a destination that is *already non-zero*, because it accumulates
  and a version that assigned would pass every test starting from zero.
- `LerpQSTMatrix` has its two halves compared *separately*, because one is
  quantised and one is not.

**Assert behaviour, not only agreement.** Two implementations agreeing on the
wrong thing is still wrong. `tests/test_events_diff.c` checks directly that a
killed event takes *two* frames to free, not merely that both sides do the same.

### The test this section used to say could not be written

It is written, and both halves of it. `tests/gl_trace.c` records the GL call
stream from either side of the comparison; `test_renderscene_gl_diff` and
`test_rendermesh_gl_diff` drive the renderers and the mesh draw against it.

The scene is built by hand in guest memory -- the two-level animation table
(`nodeKeys` at `+0x88`, `nodeStream` at `+0x8c`), a meshset, a palette, and
real geometry. **Put a test's arena above `0x00600000`**: the first version sat
at `0x00300000`, inside the loaded slice's own data, and quietly overwrote the
engine's globals with its palette.

And the enum pairing needed no liveness analysis at all -- see the top of this
file.

---

## Then: gamecode

**`gamecode`, 291 functions.** `SwitchQueue` is already verified and is the
proof that some of it is tractable: pure data manipulation over a ring buffer,
no function pointers, no indirect branches. Most of the fight engine will not
allow that, so treat `SwitchQueue` as the easy end of a hard body of code rather
than a representative sample.

**Local two-player is already written. Do not build it.** `_ButtonStatesP2`,
five 120-byte button layouts, `_JoystickStateP2`, `_P2Controls`, `_PLAYER2MODEL`,
plus `_isp2` and `_gup2` as real code — all present in **both** retail builds.
The iPhone build simply has no menu entry reaching it; the iPad build does, and
calls it "2 Players on 1 iPad". See [IPAD-BUILD.md](IPAD-BUILD.md). `_isp2`
(48 bytes) and `_gup2` (368 bytes) are the obvious first targets in `gamecode`.

---

## Rules this project paid for

**Write what you established, not what would look complete.** A body over an
unconfirmed layout is worse than no body. This was tested twice in one session:
`symcheck` rejected a `LIME_RenderSceneOverrideTextures` built on two invented
accessors, and the count went **backwards** from 104 to 103 before the real
layout was found. And `LIME_UpdateEvents` had a confidently wrong body that
survived weeks of reading and fell to the first test.

**`symcheck` is not a formality.** It has caught three live inventions:
`limeFontAdvance()`, a `LOAD_U16` macro, and the two scene-node accessors. Run
it before every commit. If it flags something, decide whether the name is real
or invented — **do not add it to `ALLOW`**. An earlier session silenced
`lime_load_file` that way and hid the fact that the binary calls `limeLoadFile`.

**Resolve imports before reading a function.** `tools/stubs.py` names all 733.
Skipping it is not a missing name, it is an invitation to guess:
`IsTextureFullBright` was recorded as using `strcmp` when it uses **`strstr`**,
and that one word made the `.???` wildcard look like an unsolved mystery for
several sessions.

**Do not state a constant you could not resolve.** And when you can resolve one,
do — the QST scale sat in the docs as `1/32767` for a long time on a
reasonable-looking assumption, and reading the eight bytes settled it in one
step after a formula rewrite had failed to.

**Never step an array of host structs by the binary's byte stride.** `EVENT` is
248 bytes there because an ARM pointer is 4; `sizeof(EVENT)` here is 256.
`LIME_UpdateEvents` walked a 192-slot array with `+ 0xf8` and ran off the end.
Hard-coded strides are correct only for memory the engine treats as raw bytes.

**Run with a control group.** A call-site scan once reported zero shader callers
*and* zero `glBindTexture` callers, the second of which was sitting in a
disassembly already read by eye. The scanner was mixing file offsets with
virtual addresses. A negative result that cannot detect a known positive is not
evidence of anything.

The same rule caught a phantom in the other direction. A naive `for f in $(find
. -name '*.c')` sweep reported an error in `runtime/platform/sdl_gl.c` -- a
missing `SDL.h`. That file is the **Linux** backend and CMake never compiles it
on Windows, so the sweep was reporting its own misconfiguration as a defect in
the tree. But the fix is not to exclude the file: a file nobody compiles is a
file where a typo lives forever, invisible until it reaches somebody else's
machine. `tools/check.sh` now selects the backend the way `CMakeLists.txt` does
*and* lints the off-platform one, and it was itself put through four deliberate
breakages before its zero was believed.

**Suspect the counter when it moves without work.** `tools/progress.py` now
matches by Itanium length prefix rather than by trimming type codes, because the
guessing version undercounted by two, an older variant undercounted by seven and
put three wrong figures in the README, and adding an abort-stub file once
inflated the count from 88 to 93 with nothing written.

---

## The standard a field identification has to meet

**Two independent functions, same offset, same meaning** — or a prediction from
the disassembly that the shipped data then confirms without being consulted
first.

Both kinds are in the repo. `RenderDebugCube` reads `scene->[0x80]` and hands it
to `LIME_LoadMeshSetTextures`; `LIME_LoadScene` contains the store that puts the
meshset there. Separately, `LIME_LoadScene` implied one unconditional sibling
load and one guarded one, and counting `res/` afterwards gave 545 `.events`
against 547 `.scene` and only 74 `.offsets` — the prediction was written down
before the count was taken.

**One function asserting an offset is a hypothesis.** Do not write it as a fact.

---

## Traps already paid for

- **The DS Ultimate Mortal Kombat is not this engine's ancestor.** The `LIMEDS_`
  prefix and the 1/4096 fixed point make it look like one; it shares no asset
  format, no source path, and none of 355 animation frame names. Evidence in
  [LIME-ENGINE.md](LIME-ENGINE.md). Do not re-check it.
- **`ES2Renderer` is dead template code.** Twelve shader entry points are
  imported and nothing calls them; no shader source and no `.vsh`/`.fsh` ship.
  Do not decompile it hoping to find the real renderer.
- **The engine mixes matrix conventions.** Matrices built from basis vectors
  arrive GL-ready; matrices converted from the older fixed-point formats are
  row-major and need transposing. There is no blanket rule.
- **Geometry is Z-up**, GL is Y-up.
- **`LerpVector3`, `GetSlerpedQ` and `LerpQSTMatrix` all run backwards** from
  their argument order: `t = 0` returns the *first* argument via the `(1-t)`
  term. Three functions, one convention.
- **`GetSlerpedQ` does not slerp.** No `acos`, no `sin`, no renormalisation — a
  lerp with a shortest-arc sign flip. Substituting a real slerp changes every
  in-between pose and fixes nothing visible.
- **Transparency is additive with depth writes off, and deliberately unsorted.**
  Switching to standard alpha blending makes the missing sort a real bug.
- **Shading is `GL_FLAT`.** Leaving GL's default `GL_SMOOTH` gives softer
  shading than the original everywhere.
- **Strings may be UTF-16**, detected at runtime from a `0xFF 0xFE` BOM. Both
  encodings travel as `const char *`.

---

## Housekeeping that is currently true

- `sh tools/check.sh` syntax-checks the whole tree and exits with the error
  count. It currently reports **0 errors and 13 warnings**, and every one of the
  13 is `unused parameter` on a body the binary itself left empty or on a body
  marked *structural*. Nothing is silenced.
- The Linux backend is linted on Windows against `tests/sdl2-lint/SDL.h`, which
  is a **fixture, not SDL2** -- it `#error`s unless the lint defines
  `UMK3_SDL2_LINT`. A pass there proves our own mistakes are gone (typos, wrong
  argument counts, bad `SDL_Event` members); it does **not** prove the
  declarations match real SDL2, because they were written from the documented
  API rather than read from an installed header. `check.sh` prefers a real SDL2
  via `pkg-config` whenever one exists and says which of the two it used.
- `runtime/` builds and runs on Windows (WGL) and Linux (SDL2), draws textured
  lit geometry and poses characters.
- `runtime/lime_platform.c` is the host side of the engine's platform API, and
  it is deliberately **not** the same code as the guest-side stubs in
  `arm_runtime.c` — two independent implementations reading the same files is
  what keeps the differential honest.
- **Three tests need the extracted IPA** and take the asset directory as their
  first argument: `test_rendermesh_diff`, `test_meshset_loader` and
  `test_switchqueue_diff`. Point them at the `res/` folder inside the extracted
  `Payload/UMK3.app/`. Nothing in the repository holds assets and nothing should.
- **`KANO_STANDARD.lighting` is one byte short** of its own header's vertex
  count -- the only such asset in `res/`. The loader sizes the buffer from the
  header, so the tail is whatever the allocator left: undefined on both sides
  and different on each. Both loader tests now count it instead of asserting on
  it. `test_meshset_loader` used to expect `0xFF` there, which is the
  MISSING-file value and not the short-file one, and reported a divergence for
  as long as it has existed.
- `tools/decomp_loop.py --calibrate` passes 2/2. It needs `UMK3_WORK` to hold
  `symbols.txt`, `func-to-file.txt` and `UMK3.armv7`, and `UMK3_RES` for tests
  that read game data.
- Both READMEs, `PROGRESS.md` and `HANDOFF.md` are current as of `lime/common`
  at 109/109 and overall at 35%.
