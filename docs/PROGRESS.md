# Progress

Current state of the project. Written so that someone can pick it up with no prior context.

**Last updated:** 2026-08-15 — see [HANDOFF.md](HANDOFF.md) for the route, and
[SESSION-2026-08-15.es.md](SESSION-2026-08-15.es.md) for that day's report.

> Latest: the verification oracle is **finished**; the game runs in touchHLE
> with **no known crash** (5 bytes, three patches); the **armv6 slice**
> decompiles cleanly where armv7's NEON defeats Ghidra; `.events` solved;
> `.pvr` measured and its block geometry verified 1,400/1,400; a PVRTC decoder
> exists and is **wrong at 5.5%**, with the reference that proves it.

---

## Overall progress

```
█████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  23%
```

**≈23% of the total estimated effort. Nothing is playable yet.**

Weights are our judgement of how much of the total each area represents;
the completion figures are measured. Two numbers are worth keeping apart:

- **23%** — share of the *whole project*, counting analysis, tooling and formats.
- **0.7%** — share of the *decompilation itself*: 17 finished functions of 2,572.

Both are true. The first says the foundations are in place; the second says the
bulk of the work has not started.

> **Part of the jump from 18% is an arithmetic correction, not new progress.**
> The table below has always been the stated basis for the headline figure, but
> nobody had actually summed it: with the previous completion values it came to
> 19%, not 18%. It is computed now. Of the real movement, most is the asset
> formats reaching 80% and the platform layer starting from a smaller base —
> see the Finch note below.

| Area | Weight | Done | |
|---|---:|---:|---|
| Binary analysis and source-tree mapping | 4% | 100% | `██████████` |
| Tooling and the verification oracle | 8% | 100% | `██████████` |
| Asset format specifications | 8% | 85% | `████████░░` |
| `lime/common` — engine core (109 fn) | 12% | 15% | `██░░░░░░░░` |
| `gamecode` — game logic (291 fn) | 18% | 0% | `░░░░░░░░░░` |
| `gamecode/logic` — fight engine (2,172 fn) | 28% | 4% | `░░░░░░░░░░` |
| Native PC platform layer (161 fn to rewrite) | 17% | 10% | `█░░░░░░░░░` |
| EA SDK stubs (~1,412 fn) | 5% | 0% | `░░░░░░░░░░` |

**The platform layer shrank twice.** It used to read "229 fn rewritten".
**56** of those are `Finch/`, a vendored copy of MIT-licensed
[zoul/Finch](https://github.com/zoul/Finch); another **12** are
`ES1Renderer.m` and `ES2Renderer.m`, which are Apple's `GLES2Sample` template
with the method sets matching exactly. Both have published, readable, legally
reusable sources. **68 of 229 — 30% — need no reverse engineering**, leaving
161. The 10% reflects that those modules have known upstream sources, not that
any of the port is written.

### Milestones

| Milestone | Status |
|---|---|
| The binary is understood and mapped | ✅ done |
| A verification method exists and is proven | ✅ done |
| The game runs somewhere as a behavioural reference | ✅ done (touchHLE, no known crash) |
| Model format readable | ✅ done |
| Animation formats readable | ✅ `.skin`, `.bones`, `.skinanim` and `.events` done |
| Every format needed to draw an animated character | ✅ done — only `.scene` remains |
| Something renders on a PC screen | ⬜ not started |
| The game boots natively | ⬜ far off |
| The game is playable natively | ⬜ far off |

---

## At a glance

| Phase | Status |
|---|---|
| 0 — Binary analysis and source-tree mapping | ✅ complete |
| 1 — Asset formats | 🔄 `.meshset`, `.skin`, `.bones`, `.skinanim`, `.events` solved; `.scene` open |
| 2 — Verification oracle | ✅ complete and proven |
| 3 — Ghidra automation | ✅ headless pipeline working |
| 4 — Decompile `lime/common` | 🔄 109/109 drafted, 2.5 modules finished |
| 8 — Decompile fight logic | 🔄 `SwitchQueue` verified; entry points mapped |
| 5 — Native PC platform layer | ⬜ not started |
| 6 — EA SDK stubs | ⬜ not started (scope reduced, see below) |
| 7 — Decompile `gamecode` | ⬜ not started |
| 8 — Decompile fight logic | ⬜ not started |
| 9 — Widescreen, gamepad, mods | ⬜ not started |

**Honest framing:** 17 of 2,572 functions are fully done. That is ~0.7%. The percentage is not the interesting number — the pipeline that produced them is, and it now runs unattended.

---

## Module status — `lime/common`

| Module | Decompiled | Verified | Clean C | Differential test |
|---|---|---|---|---|
| `Matrix.cpp` (11 fn) | ✅ | ✅ | ✅ | **40,006 cases, 0 divergences** |
| `limeVector.cpp` (2 fn) | ✅ | ✅ | ✅ | **20,013 cases, 0 divergences** |
| `RenderMesh.cpp` — loader (3 of 19 fn) | ✅ | ✅ | ✅ | **590 files, 7,327 meshes, 0 divergences** |
| `RenderMesh.cpp` — rendering (16 fn) | ✅ | ⬜ | ⬜ | needs a graphics backend first |
| `RenderScene.cpp` (14 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `RenderSkinned.cpp` (20 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `Events.cpp` (22 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `limeFont.cpp` (6 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `LIMEDS_Misc.cpp` (8 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `DS_DebugWin.c` (7 fn) | ✅ | ⬜ | ⬜ | ⬜ |

"Decompiled" means Ghidra produced a draft with signatures applied. "Clean C" means a human-readable reimplementation exists. Only the last column means *done*.

---

## `Matrix.cpp` — finished

`test_matrix_diff` → **40,006 cases, 0 divergences.**

Semantics derived from the **disassembly**, not the decompiler output — 5 of the 11 functions use NEON, where Ghidra's output is unusable for the arithmetic:

- `RotMatrixX`: `m[5]=cos, m[6]=sin, m[9]=-sin, m[10]=cos`
- `RotMatrixY`: `m[0]=cos, m[2]=-sin, m[8]=sin, m[10]=cos`
- `RotMatrixZ`: `m[0]=cos, m[1]=sin, m[4]=-sin, m[5]=cos`
- `limeScaleMatrixXYZ` scales **columns**, not rows
- `limeMatrix3x4RotateSkin(m, vin, vout)`: `out[j] = Σᵢ vin[i]·m[i*4+j]`, no translation. `RotVector` is an alias (tail call).
- **`CreatePerspectiveMatrix`**: `f = sin(fov)/(1−cos(fov)) = cot(fov/2)`, computed in **double precision** and narrowed to float at the end. `fov` is the full **vertical** field of view.
  **Widescreen: `aspect` divides the X term only.** That is the single point to modify.

Established facts:

- The matrix is **4×4 float, row-major**. Verified, not assumed.
- `limeMatrixCopy(src, dst)` — source is the first argument.
- `limeMatrixMult(a, b, out)` — output in the third argument (`r2`).
- `CreatePerspectiveMatrix(m, fov, aspect, zNear, zFar)` — fifth argument on the stack (AAPCS).
- The binary uses **AAPCS soft-float**: floats travel in integer registers. Confirmed by `blx _cosf` followed by `str r0, [r4]`.

One error cost an iteration: `_sin` and `_cos` had been swapped. The binary calls stub `0x000ddcd4` (`_sin`) first, then `0x000dd770` (`_cos`).

---

## `limeVector.cpp` — finished

`test_limevector_diff` → **20,013 cases, 0 divergences.** Named cases (zero, axes, negatives, 1e−20, 1e8) plus 20,000 deterministic pseudorandom vectors.

`test_limevector` → 10 assertions, 0 failures, including the zero-length path through the IT block — the riskiest part of the recompiler.

Both functions (`_Len`, `_Normalise`) are 100% NEON, and **Ghidra's output for both is wrong**. See [METHODOLOGY.md](METHODOLOGY.md).

---

## `RenderMesh.cpp` — loader finished

Two tests, both over the game's real data:

**`test_meshset_loader`** runs the original `_LIME_LoadMeshSet`, recompiled, and
checks what it leaves in memory against [MESHSET-FORMAT.md](MESHSET-FORMAT.md).
That validates the *specification*.

**`test_rendermesh_diff`** runs the hand-written `decomp/lime/RenderMesh.c`
against the same recompiled original and compares the results. That validates
the *reimplementation*.

```
files compared:          590
skipped (variants B/C):   14
meshes compared:       7,327
divergences:               0
```

Byte-for-byte agreement on `numMeshes`, copied names, `numVerts`, `numFaces`,
`boundsRadius`, the index buffer, the vertex buffer and per-vertex lighting.

Three findings came out of this, all now in MESHSET-FORMAT.md:

1. **`LIME_FindMeshByName` returns an index, not a pointer** — and matches by
   substring, not equality. Asking for `"SKULL"` finds `"SKULL3"`. The
   signature file had it wrong.
2. **The in-memory vertex has two undefined bytes.** The copy loop at
   `0x0005ebcc` writes x, y, z, u and v and nothing else, so the padding at
   offset 6 keeps whatever the allocator left there. Comparing the 16-byte
   struct with `memcmp` fails on 584 of 590 files for that reason alone.
3. **`KANO_STANDARD.lighting` is one byte short** — 42,867 bytes for 42,868
   vertices. The retail game reads one byte past the end of that buffer every
   time it loads Kano. Every other lighting file matches its vertex count
   exactly. This is a defect in EA's shipped data, not a misreading of the
   format; it took running both loaders side by side to tell those apart.

---

## `.skin` — format solved

`python tools/skin.py validate <res dir>` → **29 of 29 files, 0 mismatches**,
28,315 skinning matrices, 54,413 vertices. There is no length field anywhere in
the file, so walking every one of them to its exact last byte is what makes the
layout credible rather than merely plausible.

Derived from `LIME_LoadSkin` (`0x00060650`) and `LIME_LoadSkin1` (`0x000604c0`).
Full specification in [SKIN-FORMAT.md](SKIN-FORMAT.md). The short version:

```
int32   blockCount                  // 1 or 2
per block:
  int32  numMatrices (N), numVerts (M)
  uint32 indexes[N]
  uint16 weights[N*4]               // scaled by 1/65536 on load
  { MATRIX43 a; MATRIX43 b; }[N]    // 96 bytes each
  byte   vertData[M*24]
  byte   vertExtra[M*6]
```

Two things made this quick. First, `limeMalloc`'s debug tags survive in the
binary and name every buffer — `skin_indexes`, `skin_mweights`, `skin_normals`,
`skin_uvs`. Second, the decoded weights read `0.99998, 0, 0, 0`: one bone at
full influence and three unused slots, which is what skinning weights are
supposed to look like. That is semantic confirmation, not just arithmetic.

`ROBO1_STANDARD.skin` and `ROBO2_STANDARD.skin` omit the leading block count —
the same two files that use the unindexed `.meshset` variant. A reader should
try the counted layout and fall back to a bare single block.

**Still open:** what the 24 and 6 bytes per vertex contain, and why `indexes`
decodes negative. Those are questions of interpretation; the layout is settled.

---

## `.skinanim` — format solved

`python tools/skin.py validate-anim <res dir>` → **28 of 29 files**, 9,590
animation frames. From `UnpackAnimFrame` (`0x0006012c`).

```
float  scale          // always 1.0 in the shipped data
int32  numFrames
int32  frameSize      // == 16 + numBones*20
FRAME  frames[numFrames]
```

A frame is an `int32` tag, a `limeVECTOR3` root position, then one 20-byte
`BONEANIMFRAME` per bone. `GetSlerpedQ` and `GetMFromQuat2` operate on those,
so four of the five floats are a quaternion; the fifth is unidentified.

**Read `frameSize` from the header; never derive it from the matching
`.bones`.** Deriving it looks right on most characters and then fails on ROBO1
and ROBO2, whose animations carry a different bone count than their skeletons —
ROBO1's animation has 20 bones where its `.bones` declares 25. That cost an
iteration.

`SINDEL_STANDARD.skinanim` is the one file that does not fit: its header reads
a second float where the frame count belongs. A 16-byte header gives
`frameSize = 1256`, exactly `16 + 62*20` for Sindel's 62 bones, and
`16 + 844*1256` is exactly the file size — but the header's own count says 422,
half of 844. Two streams or one longer header; the arithmetic works either way.
**Unresolved.**

---

## Research contributed by DeepSeek, audited

A handover package arrived on 2026-08-14. Every symbol/address pair in it was
checked against `functions.txt` before anything was adopted:

```
pairs checked:  258
correct:        223
wrong:           15
non-existent:    20
```

The failures were not spread evenly. All twenty non-existent symbols — `_slave`,
`_him_x`, `_shake_ob_up`, `_a0_for_him`, `_rough_hypotenuse` and the rest — sat
in the notes that mapped iOS addresses onto names taken from other releases of
the game. Those notes were rejected. The material derived from disassembling our
own binary verified at essentially 100% and was kept.

**Adopted** (in `OUTPUT/research/`, verified):

- The cooperative process scheduler in `gamecode/logic/other.c`:
  `_StartThreadAt` (`0x56cac`), `_KillSThread` (`0x56cbc`), `_KillProc`
  (`0x56d14`), `_QueueAndJump` (`0x572b8`), `_SwitchQueue` (`0x55ed4`),
  `_DoSwitchJump` (`0x55efc`), `_UnstackSwitches` (`0x573e8`), `_clear_queues`
  (`0x58974`).
- `PROC` struct: 268 bytes (`0x10c`) of stride per player, with field offsets.
- Function-pointer dispatch tables. I confirmed the contents of both:
  `0xf3150` holds `_t_do_fatality_1`, `_t_do_stationary`, `_t_drone_animality`,
  `_t_do_friendship`, `_t_master_proc_mercy`, `_t_drone_babality`; `0xf3200`
  holds `_t_make_db_tone`, `_t_bonus_count`, `_t_do_shake`. Note they live in
  `__DATA,__nl_symbol_ptr` and the pointers carry the Thumb bit.
- An independent run of the differential tests on Linux — they pass off the
  machine they were written on.

This is why `gamecode/logic` moved from 0% to 2%: nothing is decompiled yet,
but the entry points into the fight engine are now mapped and verified.

---

## `gamecode/logic` — first function verified

`SwitchQueue` (`0x00055ed4`) → **500 pushes, 0 divergences**
(`tests/test_switchqueue_diff.c`).

A 20-slot circular buffer. Each entry packs the current PROC's counter, read
from `PROC+0xa8`, into the low 16 bits and the caller's value into the high
ones. The wrap is checked *after* the store, so the last slot is written before
`head` resets — reordering it would drop an entry.

It was picked because it is verifiable at all: pure data manipulation, no
function pointers and no indirect branches. Most of this file's dispatch code
will not allow that, which is why the entry points around it were worth mapping
first.

### Two recompiler bugs it caught

Both produced code that compiled, ran, and was wrong.

**Shift types.** Capstone orders them `ASR, LSL, LSR, ROR` — not the intuitive
`LSL, LSR, ASR`. The translator assumed the intuitive order, so every
`lsl #16` became `>> 16`. `SwitchQueue` packs its two halves with exactly that
instruction, which is how it surfaced. **Every shifted operand in the binary
was affected**; the previously verified modules happened not to use one.

**Literal pools decoded as code.** The linear sweep ran past the end of the
function into the constant pool and turned `0x0009d6a0` into a `bvs` branching
to a label that would never be emitted. Emission now stops at a terminal
instruction when nothing further is a branch target — a minimal form of the
recursive descent still owed.

All three finished modules were re-verified after the fixes: 40,006 / 20,013 /
7,327 cases, still zero divergences.

---

## The emulator prints its own event traces

Worth knowing before starting on `.events` or `.scene`: the running game logs
every event it triggers, with the source scene, the frame number and the
parameters.

```
- EVENT CAVE_LEVEL_SCENE.scene (fr 2) triggered event LENSFLARE.scene (FromGround 0, spd 1.00...)
- EVENT SEKTOR_STANDARD.scene (fr 356) triggered event PULSE_TRAIL.scene (FromGround 0, spd 1.00...)
```

That is ground truth for the event system, produced by EA's own code running on
EA's own data. A `.events` parser can be checked directly against it: parse the
file, predict which events fire on which frames, and compare with the log.

It also names fields — `FromGround`, `spd` — which is a head start on the struct.

`SEKTOR_STANDARD.scene` firing at frame 356 lines up with its `.skinanim`
declaring 356 frames, so the frame numbers in these traces are animation frames.

The full log of a session is 4,281 lines; the game's own output is 1,623 of
them, the rest being touchHLE's. Two other things visible in it:

- Hundreds of missing `*_LOW.PNG` textures. The game asks for a low-resolution
  texture set that is not in the bundle and carries on without it.
- 47 × `Failed to create OpenAL source, error code a005` — the source limit is
  exhausted. Sound is partially broken under the emulator.

---

## `.events` — format solved

`python tools/events.py validate <res dir>` → **544 of 545 files**, 1,547
tracks, walked to their exact last byte. From `LIME_LoadEvents` (`0x000a477c`).
Full specification in [EVENTS-FORMAT.md](EVENTS-FORMAT.md).

```
int32   numTracks
TRACK   tracks[numTracks]           // variable length
  268 bytes header, numEntries at +0x108
  numEntries * 56 bytes of entries
```

Both strides come from the loader's arithmetic, not from the walk: the entry
base is built as `(cursor+0x5c)+0xb0 = cursor+0x10c` at `0x000a4934`, and the
cursor advances by `numEntries*64 - numEntries*8 = numEntries*56` at
`0x000a49be`. The 268-byte header is then accounted for **byte by byte,
contiguously**, by the load sequence at `0x000a4876`–`0x000a490a` — a 64-byte
name, twelve int32s, a second 64-byte name, six int32s, a 64-byte slot name,
and `numEntries`.

The earlier note here said tracks divided as 324 for 125 files and 436 for 24
and "did not divide at all for the rest". That now resolves cleanly:
`324 = 268 + 1*56` and `436 = 268 + 3*56`, and the rest are files whose tracks
carry different entry counts.

### The 268-vs-216 gap is not discarded data

An on-disk header of 268 against a 216-byte in-memory struct looks like the
loader throws 52 bytes away. It does not. The 64-byte name at `+0x000` is
**used but never stored** — copied to the stack, uppercased in place, given a
7-byte suffix. That leaves 204 bytes reaching the struct, and the struct's
other 12 bytes are its own: a flag at `+0x04`, padding at `+0xc0`, and the
entries pointer at `+0xd4`. `204 + 12 = 216`, exact.

### An audit finding that turned out to be wrong

This format was audited as resting on **circular evidence**: `numEntries` was
reported as 1 in 211 of 212 tracks, which would make every track exactly 324
bytes and every file `4 + numTracks*324` — and against a fixed record size, any
split of 324 lands exactly, so the walk would prove nothing.

That was measured on a subset. Over the full corpus of 1,547 tracks,
`numEntries` takes **ten distinct values** and **103 tracks (6.7%) are not 1**:

| `numEntries` | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 16 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| tracks | 46 | 1,444 | 5 | 29 | 6 | 8 | 4 | 2 | 2 | 1 |

The `4 + numTracks*324` formula fails exactly where it should — the
`CUTUP_BY_LAO_*` family comes out 112 bytes larger, which is the two extra
entries. And brute-forcing every header size from 268 to 516 against every
entry size from 0 to 196 leaves **exactly one pair** that walks all 544 files:
`(268, 56)`.

So the walk is not circular, and the layout has two independent legs. The audit
was still right about the underlying principle, and about the `+0x108`
derivation being wrong as written — the old one indexed the wrong live range of
`r5` and produced `0x1b0`. `tools/events.py` now prints the `numEntries != 1`
count on every run so the distinction stays visible instead of being trusted.

**Still open:** `CUTUP_BY_REPTILE_STRYKER.events` (6,224 bytes, walk stops at
272). Its name field holds a single junk byte and its slot is empty, unlike
every other file, so it is probably not an events file at all. The earlier
"embedded SCENE" hypothesis is unproven either way.

Other names visible in this subsystem, not yet investigated:
`SCENEINFO`, `LIME_LoadMasterEventOffsets`, `FindIdInMasterOffsets`, and the
74 `.offsets` files in `res/`.

---

## The game prints its own dispatch indices

A play session through the menus produced this before dying:

```
#0:FE_Task_Main_Menu(0)
#1:FE_Task_Extras(6)
######################### (FE_Task_Select_Leaderboard)(49)
```

That is the front-end task stack, with **each task's name and its index**. All
three are real symbols — `_FE_Task_Main_Menu` at `0x0001ac64`,
`_FE_Task_Extras` at `0x0001962c`, `_FE_Task_Select_Leaderboard` at
`0x00013e6c` — and there are **53 `FE_Task_*` functions** in the binary.

**This is a general technique, not a one-off.** The engine dispatches through
numbered tables and prints the numbers. Walking the menus maps index → function
by observation, which is exactly the method needed for the tables behind
`_DoSwitchJump` ([#1](../../issues/1)) that no differential test can reach.
Reaching a state in the emulator and reading the index it reports is evidence;
guessing from a name is not.

Indices observed so far, 12 of the 53:

| Index | Task | | Index | Task |
|---:|---|---|---:|---|
| 0 | `FE_Task_Main_Menu` | | 9 | `FE_Task_Settings` |
| 1 | `FE_Task_Play` | | 10 | `FE_Task_Button_Config` |
| 2 | `FE_Task_Single_Player` | | 27 | `FE_Task_Character_Select` |
| 5 | `FE_Task_Options` | | 28 | `FE_Task_Tower` |
| 6 | `FE_Task_Extras` | | 29 | `FE_Task_Continue_Screen` |
| 7 | `FE_Task_About` | | 49 | `FE_Task_Select_Leaderboard` |

Filling the rest is a matter of walking the menus and reading the log.

### A second EA SDK blocker, at runtime this time

Entering the leaderboard kills the emulator:

```
UIAlertView: "¡ERROR AL CARGAR LA PÁGINA SOLICITADA! ¡COMPRUEBA TU CONEXIÓN A INTERNET!"
panicked at src/dyld.rs:811:9: Call to unimplemented function _CFRunLoopRun
```

The online layer fails to reach EA's servers, raises a modal alert, and the
modal needs a nested run loop that touchHLE does not implement.

**This refines the earlier conclusion about the EA SDK.** It remains true that
the SDK does not block *startup* — one function did, and patching it was
enough. But the online features still crash when *entered*. It also explains
the long-standing note that achievements crash the emulator in 1.0.4: same
layer, same modal path.

For the native port this means the leaderboard, achievements and any other
online menu entry need to be **removed or stubbed at the menu level**, not just
given neutral return values further down. A stub that returns "no connection"
still ends up in the alert.

### The EULA screen is a web view pointed at EA's servers

Opening the licence agreement produces:

```
UMK3[0] ASSIGNED:http://tos.ea.com/legalapp/mobileeula/US/es/OTHER/
touchHLE: TODO: [(UIWebView*) 0x3023be20 loadRequest:(null) ()]
UMK3[0] REQUESTED URL:http://tos.ea.com/legalapp/mobileeula/US/es/OTHER/
```

The screen renders empty because `UIWebView loadRequest` is unimplemented. It
does not crash — the interface is simply broken.

That maps to `WebViewController.m` (18 functions in `lime/iphone`), which the
port has to replace anyway. Worth noting for whoever writes it: **the bundle
already ships local copies** — `res/defaults/dmg/staticpage/dmg_staticpage_*.html`
in eight languages. The native version can serve those instead of reaching for
a URL that will not resolve, and the EULA screen works offline.

---

## Playing the game as an analysis method

Nine emulator sessions, culminating in a full arcade run — the tower, Shao Kahn
and Motaro, several characters and the unlockables. The largest log is **47,421
lines with 368 event traces**. Everything below came from playing, not from
static analysis.

### Gamepad mapping, and a bug in touchHLE's own defaults

touchHLE ships a recommended mapping for this game:

```
com.ea.umk3.bv: --dpad-to-touch=30,690,280,280 --button-to-touch=A,1020,900
                --button-to-touch=B,1215,900 --button-to-touch=X,1400,900
```

Its own `--help` states that in landscape the bottom-right corner is `480,320`.
**Those coordinates are far outside the screen**, so no press can ever register.
That is why a gamepad appears to do nothing with the defaults.

The working mapping, read off a screenshot of the running game, is in
`docs/TOUCHHLE-PATCH.md`. The on-screen layout is a joystick at `15,202` sized
`115×113`, and six buttons: `S` `P` `R` along the bottom at y≈285 and `K` `B`
along a second row at y≈235.

Worth noting for its own sake: **one screenshot settled in a single attempt what
four rounds of guessing had not.**

### Hidden characters need a hold timer, not a tap

Holding a finger on Smoke in the character select reveals Human Smoke. That
means `FE_Task_Character_Select` (index 27) measures *press duration*, and a
port that only implements "tap" loses the secret characters silently.

The binary has **`_secret_move_search` at `0x00053754`** — a dedicated system,
not a special case. Expect Kombat Kodes and other secrets to run through it.
The symbol name is EA's own, from the STABS table.

`_t_nj_smoke_slam` (`nj` = ninja) confirms robot and human Smoke are separate
entities in the engine, not a palette swap.

### The babality model sometimes fails to draw — and it is not the game's fault

Reported symptom: the baby model is invisible after a babality, but only
sometimes. It rendered correctly for Kabal on a different stage.

The logs rule out the obvious explanation. The texture *does* load:

```
loading scene: BABALITY_KUNGLAO.scene...
".../Textures/KUNGLAOBABY_LOW.PNG", returning nil      <- the _LOW variant is absent
*** Loaded KUNGLAOBABY.???, allocating ptr 36 [VRAM 6498k]   <- the .pvr loads fine
```

All 64 babality `.pvr` textures are present in the bundle, and the fallback from
the missing `_LOW` variant works.

What does fail is the upload:

```
Error uploading compressed texture level: 0. glError: 0x0500   (GL_INVALID_ENUM)
Error uploading compressed texture level: 0. glError: 0x0503   (GL_STACK_OVERFLOW)
```

Both on **compressed** texture upload, which is what PVRTC is. The model loads,
the texture is read, the upload to the GPU fails, and the geometry draws with no
valid texture. That it depends on the stage rather than the character fits: a
different stage means different textures uploaded beforehand and a different
VRAM state at the moment the baby is needed.

**This is a touchHLE limitation, not a game bug, and patching the IPA would be
the wrong fix.** EA's binary is behaving correctly. For the native port the
problem disappears on its own, because the port decodes PVRTC itself rather
than relying on a GL extension.

### Runtime blockers, in order of how much they matter

| Symptom | Cause | Patchable? |
|---|---|---|
| Emulator dies on any confirmation dialog | `-[modalAlertDelegate initWithRunLoop:]` (`0x000b53bc`) spins a nested run loop; touchHLE has no `_CFRunLoopRun` | **Yes** — neutralise `+[modalAlert confirm:]` (`0x000b54a0`) and `ask:` (`0x000b54e4`) |
| Leaderboard, achievements | same modal path, reached through EA's online layer | same patch |
| EULA screen blank | `UIWebView loadRequest` unimplemented; the bundle ships local HTML | port-side |
| Babality model invisible | PVRTC upload failing | no — emulator side |
| 47× `Failed to create OpenAL source` | source limit exhausted | no |

### The fight engine prints more than events

Mining the full arcade log (47,421 lines, 23,551 of them the game's own output)
turned up three more things the engine reports about itself.

**`seq_lookup` prints its arguments — 366 times:**

```
seq_lookup( 18, 0, 1 );
seq_lookup( 17, 3, 1 );
seq_lookup( 10, 1, 1 );
```

`_seq_lookup` is at `0x000adb80` in **`playback.c`**, a file with only four
functions. Structure of the 366 observed calls:

| Arg | Range | Distinct | Reading |
|---|---|---:|---|
| 1st | 1–18 | **5** | sequence set — likely character or move class |
| 2nd | 0–710 | 30 | sequence index within the set |
| 3rd | 1 | 1 | flag or mode; never varied |

Most frequent: `(18,0,1)` ×50, `(17,3,1)` ×42, `(1,0,1)` ×40, `(10,1,1)` ×34.

The function is **7,608 bytes with 3,964 undecodable as instructions** — about
4 KB of embedded data, consistent with the large lookup table its name promises.

**This makes `playback.c` the best first target in `gamecode/logic`:** four
functions, self-contained, and a printed oracle giving real inputs. Comparing
what a reimplementation would produce against what the game prints is
verification that needs no differential harness.

**Other engine output mapped to symbols:**

| Log line | Symbol | Address |
|---|---|---|
| `########## TASK_GAME_INIT: N` | `_Task_GameInit` | `0x0002e6f4` |
| `Tsound NxN N` | `_tsound_func` | `0x00057dd0` |
| `TRACK ALREADY CLOSED (setGain)!` | audio, `GBMusicTrack.m` | — |

`_Task_GameMain` (`0x0002afec`) and `_Task_GameDestroy` (`0x00022c74`) complete
the game task triple; only the init one announces itself.

### The moves list dumps the move input tables

Those 10,208 bare-number lines turned out to be the best find of the session.

They form **four contiguous runs**, and two of them start immediately after
`LOGGING (50016): INGAME MENU, MOVES INFO`. Each run is one integer per line,
values 0–22, and every run is **strictly periodic**:

| Run | Values | Structure |
|---|---:|---|
| 1 | 1,128 | period 6, `14 0 4 13 22 3` × 188 |
| 2 | 6,240 | period 6, same cycle × 1,040 |
| 3 | 318 | period 6, same cycle × 53 |
| 4 | 2,522 | five different cycles, **in the same order twice** |

Run 4 is the informative one:

```
period 6  x15   14 0 4 13 22 3
period 6  x25   22 21 22 3 1 0
period 5  x34   2 2 10 3 0
period 5  x94   12 2 0 3 14
period 7  x29   0 4 3 1 12 5 11
period 6  x44   14 0 4 13 22 3     <- the same five again
period 6  x11   22 21 22 3 1 0
period 5  x10   2 2 10 3 0
period 5  x27   12 2 0 3 14
period 7  x132  0 4 3 1 12 5 11
```

Five cycles, traversed twice in the same order: that is somebody scrolling down
the moves list and back. So the screen **reprints the displayed move's input
sequence every frame**, the period is the number of inputs in that move, and
the values are icon indices — directions and buttons, which is the right size
for a range of 0–22. Runs 1–3 are the same screen left open on one move for
188, 1,040 and 53 frames.

**This is a free dump of the move input tables**, which are exactly the fight
engine data that matters and exactly what static analysis handles worst. Nobody
has to find and decode the tables in `__DATA`: open the moves list, scroll
through every move of every character with the log running, and the game
prints them.

That experiment is written up as the first item in [HANDOFF.md](HANDOFF.md).
It needs no tooling, no decompilation and no Ghidra — only patience with a
controller — and it would produce the input table for all 24 characters.

The 184 lines of 32 numbers remain unidentified.

---

## Recursive descent: 852 silently wrong becomes 822 honestly incomplete

The recompiler walked each function linearly. Thumb-2 literal pools sit **in
the middle of functions** (the `ldr rX,[pc,#N]` reach is only ±4 KB), so the
sweep decoded constants as instructions and desynchronised — **852 of 4,342
functions (19.6%)** had bytes it could not decode, and an unknown number more
were misread without complaint.

It now follows control flow from the entry point and decodes only what is
reachable. Anything unreached is data.

| | linear | recursive |
|---|---|---|
| desynchronises | 852 fn (19.6%) | — |
| every byte accounted for | — | 3,520 fn (81.1%) |
| >25% unreached (indirect branch) | — | 822 fn (18.9%) |
| bytes decoded | 87.6% | 80.0% |

**The headline number dropping is the improvement.** The bytes no longer
decoded were never code.

**Jump tables are followed.** A dense `switch` compiles to `tbb`/`tbh`, which
stops recursive descent dead — but GCC's idiom is fixed (`cmp rN,#limit` /
`bhi` / `tbh [pc,rN,lsl #1]` / table of halfword offsets) and can be resolved.
`_seq_lookup` went from **38 bytes of 7,608** to 906 bytes across 315
instructions. 28 functions carry such tables.

Incidentally this confirms a reading from the play logs: `_seq_lookup` is
bounded by `cmp r4, #0x16`, so its first argument dispatches 23 ways — and the
366 logged calls used values 1 to 18, inside that range.

### The oracle's limit, stated as a limit

`blx <reg>`, `bx <reg>` and computed branches cannot be resolved statically.
`gamecode/logic` is cooperative multitasking with a process dispatcher and
per-process stacks inherited from the arcade TMS34010; dispatching through
function pointers *is* its architecture. **The oracle will never cover the
fight engine, structurally rather than for want of work.** That is not a
backlog item, and it is why [#5](../../issues/5) and [#6](../../issues/6)
attack that code by observing the running game instead.

### Coverage, measured rather than estimated

`recomp.py --all` now runs over the **whole binary**:

| | |
|---|---:|
| functions recompiled | **4,342** (all of them) |
| instructions translated | **274,240** |
| untranslatable | **49 — 0.02%** |
| functions affected | **24 — 0.6%** |
| literal-pool loads resolved | 25,331 |

Measuring first is what made this cheap. The owed work was listed as "import
shims, and six missing instructions: `adr`, `uxtb`, `sxtb`, `smull`, `vmrs`,
`vcmp`". **None of those six even appear in the failure list** — they were
already handled, and the list was stale. What actually failed:

| | before | |
|---|---:|---|
| `blx` | **9,001** | 93% of all failures |
| `ldrex` / `strex` | 478 | |
| everything else | 163 | |

**`blx` was the whole problem, and it was a policy error rather than a missing
instruction.** Any import without a hand-written shim aborted *generation* —
which contradicts the recompiler's own stated principle of failing loudly at
*runtime* and never blocking on code that may never execute. It now emits a
call to an auto-named shim and writes `<name>_shims.c` with default bodies that
call `arm_unimplemented()`. Generation succeeds; anything actually executed
aborts and names itself; you write only the shims your tests reach. That single
change took untranslatable instructions from 3.52% to 0.23%.

`ldrex`/`strex` follow next: the guest is single-threaded and uncontended, so
the pair is a plain load/store with the exclusive always granted. Then `mla`,
`mls`, `addw`, `subw`, `smulbb`, `sxtah`, `rev`, scalar `vmla`/`vmls`/`vnmls`/
`vnmul`, and `tbb`/`tbh` — which can now be emitted as an explicit `switch`
because recursive descent has already resolved the table.

### The 49 that remain, and why 38 of them should

**38 are packed `vmla`/`vnmls` on D registers** — 2-lane NEON. A scalar
translation would look right and be wrong, so it is refused. This is the same
rule that made the project distrust Ghidra in the first place; the oracle does
not get an exemption. Where those matter, the **armv6 slice** carries the same
functions in scalar VFP.

The other 11 are genuine oddities: `vcvt` (2), `andeq`, `adc`, `svc`, `vld1`,
`smmla`, `cdp2`, `bxns`. Several look like literal-pool bytes in the handful of
functions where recursive descent still mis-steps.

### What "100%" means here

Not that the oracle covers all 4,342 functions in a way that could verify the
whole game. It means **it does everything it can do, and what it cannot do is
written down as a limit rather than a to-do**:

- Indirect branches (`blx reg`, `bx reg`) cannot be resolved statically, and
  `gamecode/logic` dispatches through function pointers by architecture. The
  oracle will never verify the fight engine.
- Packed 2-lane NEON is refused rather than approximated. Use armv6.
- Import shims are generated as loud stubs, not implemented. Implement the ones
  your test executes.

No regression: `_Len`, `_Normalise`, `_RotMatrixZ`, `_limeMatrixMult`,
`_SwitchQueue`, `_LIME_LoadMeshSet` and `_LIME_LoadEvents --with-deps` all
recompile with zero unsupported instructions.

---

## A PVRTC decoder, and the reference that proved it wrong

The plan was to convert the textures with Noesis and diff against that. **It
was not needed.** The game ships **38 textures twice** — as `NAME.PNG` *and*
`NAME.pvr`. The PNG is the uncompressed source the PVR was built from: a
reference implementation that costs nothing, needs no download, and is EA's own
data rather than a third party's reading of it. It was in the bundle all along.

`tools/pvrtc.py` decodes all 1,400 textures without error, to the right
dimensions, producing plausible-looking images. `tools/pvrtc_diff.py` compares
them against the PNGs:

| round | mean error | what changed |
|---|---:|---|
| first version | 48.42 / 255 (19.0%) | — |
| colour B extraction | 31.18 (12.2%) | B is the low 16 bits **unshifted**; the modulation flag shares bit 0 with blue's LSB |
| blend direction | **14.06 (5.5%)** | the modulation weight runs the other way |

Eliminated by measurement rather than argument: Morton order is right (the
alternative scores 68.78), column-major modulation is worse (17.37), and
swapping the endpoint extraction instead of the blend is much worse (31.26).

**5.5% is close enough to look right and far enough to be wrong.** The decoder
stays committed and clearly marked — its container handling and block geometry
are verified — but it produces nothing usable yet.

This is the fourth time in this project that something looked right and was
not: Ghidra's `_Len`, the 71-of-92 `.scene` formula, the invented
`proc_switch_counter`, and now this. The decoder compiled, ran over the whole
corpus, and made images that look like textures. **Judged by eye it would have
passed.**

Suspicion order for whoever picks it up: modulation bit ordering first (the
2 bits per pixel at 4bpp are indexed `(y*4+x)*2` here, and a column-major or
different-origin convention would scramble each block internally while still
producing plausible colour), then the bilinear endpoint interpolation and its
edge wrap, then the endpoint colour bit layouts.

The 25 `*_VERSUS` pairs cannot be compared: the PNG is 512×512 against a
256×256 PVR, so they are different assets rather than the same one compressed.
The diff correctly refuses them.

---

## `.pvr` — measured, and narrower than expected

1,400 texture files, surveyed rather than assumed. Full note in
[PVR-FORMAT.md](PVR-FORMAT.md).

| | |
|---|---:|
| PVRTC **2bpp** | 725 (51.8%) |
| PVRTC **4bpp** | 675 (48.2%) |
| Any other pixel format | **none** |
| Mipmap levels | **0 in every file** |
| Non-power-of-two | **none** |

The container is **legacy PVR v2** — 52-byte header, `PVR!` tag — not the v3
format modern tooling defaults to.

**Block geometry verified**: `python tools/pvr.py validate <app dir>` →
**1,400 of 1,400 exact, 0 mismatches**. PVRTC1 packs 8-byte blocks covering
4×4 pixels at 4bpp and 8×4 at 2bpp, so the payload must be
`ceil(w/bw) * ceil(h/bh) * 8` and the header's `dataLength` has to agree. It
does for every file at both depths. Same standard `.meshset` and `.skin` were
held to — exact across the corpus, not approximately right on most of it. A
decoder can now be built on this layout without wondering whether the layout is
the bug.

`tools/pvr.py` stops there on purpose: it reads headers and establishes
geometry, and does **not** decode pixels, because decoding is the part that
needs an independent reference and there is nothing yet to check against.

**This turns "support PVR" into a small, closed job**: PVRTC1 at two bit
depths, square, power-of-two, one surface, no mipmaps. Anything else can be
rejected loudly instead of guessed at.

It also has to be a **CPU** decoder. PVRTC is a PowerVR hardware format and
desktop GPUs lack the extension — which is precisely what fails inside touchHLE
(`glError 0x0500`/`0x0503` on compressed upload, the cause of the babality
model sometimes not drawing). Decode on the CPU, upload plain RGBA, problem
gone.

**Noesis converts these**, which ermaccer's write-up recommends alongside the
mesh converter, and it batch-converts so the whole 1,400-file set becomes PNGs
in one pass.

**It is also the oracle for our own decoder** — the same method this project
runs on everywhere else. Convert with Noesis, decode with ours, diff per pixel.
PVRTC is a lossy block format with non-obvious corner interpolation, so "looks
about right" is exactly the judgement that hides a bug for a year; 1,400 files
across two bit depths, 320 with alpha, is a real corpus to hold a decoder to.
Noesis scripts in Python, so the reference pass can be automated.

It is a development tool rather than a dependency — closed-source and
Windows-only, so it ships with nothing, the same way Ghidra does. The decoder
in the repository has to be ours.

Asset formats 80% → 85%.

---

## `.scene` — started, not solved

547 files, from `LIME_LoadScene` (`0x0005f0ac`). Full notes in
[SCENE-FORMAT.md](SCENE-FORMAT.md). **Asset formats stays at 80%**: this is
progress, not a solved format, and the difference matters.

Established: the header is `int32 numObjects; int32 count2;`. The in-memory
`SCENE` is reference-counted at `+0x40` and cached by filename, so loading the
same scene twice does not reparse it. Objects live at `+0x4c` as
`numObjects × 64`, with two `numObjects × 4` pointer arrays at `+0x88` and
`+0x8c`. The per-object copy is a straight 64-byte `memcpy`, with none of the
field-by-field scatter `.events` had.

**A scene is the root of a file group.** The loader strips the last 6
characters of the filename — exactly `.scene` — builds variants, calls
`limeLoadFile` three more times and `LIME_LoadEvents` once. That explains
something that had gone unremarked: the `.events` corpus is the same size as
the scene corpus because **every scene owns one**.

**Where it stops.** The on-disk record is not 64 bytes, so the walk does not
close — `8 + numObjects*64` matches 1 file of 547. For the 92 single-object
files, `8 + 108 + 12*count2` matches **71**, which looks like a 108-byte record
plus `count2` items of 12. But 21 miss, and badly: `GYMIST1.scene` is 104,128
bytes against a predicted 24,128. Something of variable length is in there that
`count2` does not describe.

**71 of 92 is exactly the kind of near-miss that looks like a solution.** By
the rule this project already learned twice, the stride has to come from the
loader's arithmetic, not from a formula fitted to most of the corpus. The
resume point is precise: the cursor advance for the *next* object, immediately
after the `memcpy` at `0x0005f27a`. That one instruction is what settled
`.events`, and it will settle this.

---

## A name we had no business using

Checking the LIME reference against the binary turned up an error in our own
committed code.

`decomp/gamecode/logic/other.c` declared `extern uint16_t
proc_switch_counter(void)` and called it. **There is no such function in the
binary, and no such name in its symbol table.** What `_SwitchQueue`
(`0x00055ed4`) actually does is read a field:

```
ldr    r2, [pc, #0x20]     ; literal -> 0x0009d6a0
add    r2, pc              ; -> 0x000f357c in __DATA,__nl_symbol_ptr
ldr    r2, [r2]            ; -> _G, the global state struct at 0x0038c1fc
ldrh.w r2, [r2, #0xa8]     ; a uint16 field
```

No call. A global pointer, dereferenced, and a `uint16` read at `+0xa8`. The
symbol at the end of that chain is **`_G`**.

The differential test passed anyway — 500 pushes, zero divergences — because
the test supplied the same value through the invented function. **Behaviourally
equivalent, structurally wrong**, and the differential test cannot tell those
apart: it compares outputs, not shapes. That is a real limit of the method and
worth stating alongside its successes.

The name came from third-party notes derived from a source this project does
not use. `other.c` and its test now describe what the binary does, and
[LIME-ENGINE.md](LIME-ENGINE.md) records that `process_sleep` and
`proc_switch_counter` are absent from this binary.

The architecture those notes describe **is** correct, and is independently
established from our own symbols: 1,172 `t_` functions, 139 `q_`, 105 `c_`,
plus `_reset_proc_stack`, `_UnstackSwitches`, `_stack_switch_bits`,
`_DoSwitchJump` and `_SwitchQueue`. The conclusion stands on its own evidence;
only the borrowed names had to go.

---

## Two NEON figures, and the difference between them

- **32 of 109** `lime/common` functions (29%) use packed `.f32` NEON — the set
  where Ghidra's output cannot be trusted.
- **25 of 109** (23%) are the ones the armv6 slice fixes; the other 7 use
  packed SIMD in both slices.

An earlier entry here reported 23% as the affected figure and called the
long-standing "29 of 109, 27%" an overstatement. That was wrong: 27% was
essentially right, and 23% is the fixable subset. Both numbers are useful, but
they answer different questions.

Per-file counts for `lime/common` were checked against the binary at the same
time and **all nine match exactly** — 109 functions total.

---

## The armv6 slice is a second opinion on every NEON function

The fat binary carries **armv6 and armv7**. The project has always worked on
armv7 — and for the NEON problem that has been costing us.

ARMv6 has no NEON, so the armv6 slice is an independent compilation of the same
source in plain scalar VFP, which Ghidra decompiles correctly. `_Len`, the
function that started the whole "never trust a decompiler" rule, reads as nine
plain instructions there:

```
vldr      s15, [r0, #4]        vmul.f32  s15, s15, s15   ; y*y
vldr      s13, [r0]            vmla.f32  s15, s13, s13   ; += x*x
vldr      s14, [r0, #8]        vmla.f32  s15, s14, s14   ; += z*z
                               vsqrt.f32 s15, s15
```

`python tools/slices.py neon <armv7> <armv6> <func-to-file.txt>`:

| | functions with packed `.f32` on D/Q |
|---|---:|
| armv7 | 153 |
| armv6 | 58 |
| **armv7 only** | **107** |

**The problem is mostly not in the engine.** `FrontEnd.cpp` (39) and
`GameCode.cpp` (22) hold 61 of the 107 between them — more than all of
`lime/common`, which measures 25 of 109 (23%) rather than the 27% quoted until
now.

This does not replace the oracle: armv6 is still machine code, and a readable
decompilation still has to be proven equivalent. What it removes is the case
where the decompiler is *silently wrong* rather than merely ugly.

Two traps, both already cost time once. Much of armv6 is built as **ARM, not
Thumb**. And the Thumb flag (`N_ARM_THUMB_DEF`, `n_desc` bit 3) is set on the
**STABS** symbol entry and not on the plain one — reading only one of them
disassembles Thumb as ARM and produces confident garbage. `tools/slices.py` ORs
the flag across every entry for an address.

---

## The audio engine is not EA's code

**`lime/iphone/Finch/` is a vendored copy of
[zoul/Finch](https://github.com/zoul/Finch), MIT-licensed.** All seven source
files appear in the STABS paths and all seven classes are in the binary with
their pre-refactor names — `Finch` (11 methods), `Sound` (15), `Sample` (14),
`RevolverSound` (6), `Reporter` (5), `Decoder` (2), `PCMDecoder` (2), plus the
`_FinchEngine` symbol. That is 56, matching the count attributed to `Finch/`.
Upstream now uses `FI` prefixes, so this is roughly the 2010 version.

**56 of the 229 platform-layer functions — 24% — do not need reverse
engineering.** The upstream source is readable, documented and legally
reusable. Provenance is clean: public repository, MIT, unrelated to any leaked
source.

`GBMusicTrack.m` was checked the same way and **could not be confirmed**. The
class name and its 11 methods match a compressed-music AudioQueue player that
circulated on iOS game-development forums around 2009-2010, but no canonical
repository or licence turned up. That puts it in a different category from
Finch: probably third-party, which is a reason to understand it quickly, not a
licence to copy it. Those functions still need a native reimplementation.

**The general technique**, and the reason this is worth writing down: before
decompiling any platform-layer module, check whether the class name belongs to
a known third-party library of the period. `Reachability.m`, `SBJSON.m` and the
whole `FB*` Facebook Connect family are already visible in the source tree and
are all well-known public code.

Full reference: [LIME-ENGINE.md](LIME-ENGINE.md).

---

## The verification oracle

**Verdict: it works.** `test_matrix` → 22 assertions, 0 failures.

`tools/armrecomp/recomp.py` translates ARM/Thumb to C literally, one instruction at a time, with CPU state in an explicit `arm_ctx`. Faithful by construction — it transcribes rather than interprets. Unreadable as a product, ideal as a behavioural reference.

### Recompiler coverage

- The binary is **100% Thumb** — only 2 ARM functions out of 4,342. No mode switching needed.
- **94.9% of instructions translated**; 2,109 functions (48.6%) translated completely.
- The remaining 5.1% is mostly mechanical, not fundamental:
  - `blx` (9,700) → calls to imported functions with no shim written yet. 689 stubs resolved, 9 shims written.
  - ~~conditional-suffix dispatcher bug~~ → **fixed**. The suffix is now separated using Capstone's `ins.cc` before dispatch, so `movs` is no longer parsed as `mov`+`vs`, nor `lsls` as `lsl`+`ls`. Unsupported instructions: 5.15% → 4.55%.
  - `cdp`/`stc`/`ldc`/`udf`/`svc`/`bkpt` (~250) → literal pools misread as instructions, not real code.
  - `adr`, `uxtb`, `sxtb`, `smull`, `vmrs`, `vcmp` → trivial, not yet implemented.

### Infrastructure added to unblock `RenderMesh`

1. **Guest heap** (`guest_malloc`/`guest_free`, first-fit with free coalescing) at `GUEST_HEAP_BASE = 0x00800000`, 24 MB — above the binary image, which occupies `0x1000`–`~0x6bd000`.
2. **`arm_load_image()`** — maps the armv7 slice into guest memory. Essential: recompiled code references string literals and static data by original address, and without the image mapped those reads return zeros and produce wrong results **silently**. Convenient property: in this slice `vmaddr == fileoff + 0x1000` for `__TEXT` and `__DATA`, so dumping the whole file at `0x1000` is sufficient.
3. **Shims**: `strlen`, `strcpy`, `strcmp`, `strstr`, `sprintf` (`%s %d %u %x %c %f`), `printf`.
4. **`OVERRIDES`** — *internal* binary functions replaced by host implementations: `limeMalloc`, `limeFree`, `limeLoadFile`, `limeFileSize`. The last two go through Objective-C/NSFileManager internally — iOS platform layer, pointless to recompile.
5. **`--with-deps`** — transitive closure of calls, so helper functions no longer have to be listed by hand until it links.

### A recompiler bug worth knowing about

`ldr r3, [r1], #4` is **post-indexed**: access `[r1]`, *then* `r1 += 4`. Capstone does **not** put that 4 in `mem.disp` (which reads 0) — it appears as a **third operand**. The code was reading `mem.disp` and incrementing by zero, corrupting the pointer with no error anywhere.

The loader test caught it: `boundsRadius` came out as `0x00000004` instead of `0x4261fe6b`. Exactly the class of silent failure that justifies having an oracle — it would otherwise have shown up much later as corrupted geometry.

### Structural limitations

1. **Literal pools inside functions.** Thumb-2 PC-relative loads reach ±4 KB, so the compiler embeds constants inside large functions. A linear sweep derails there: 852 of 4,342 functions contain bytes Capstone cannot decode. **Fix:** recursive descent from the entry point following branches; anything unreached is data. Partially mitigated already — literal loads are resolved at recompile time (24,314 resolved).
2. **Indirect jumps** (`blx reg`, `bx reg`, `tbb`/`tbh`). Need a runtime address→function lookup table. None appear in `Matrix.cpp`, but the fight logic is full of them.

---

## Ghidra automation

```bash
python tools/decomp_driver.py --all-lime
```

Chains three pieces:

1. **`tools/rank.py`** — scores each function by difficulty (instruction count, conditional branches, loops, calls, IT blocks, indirect jumps, undecodable bytes) and emits a work list ordered easy-to-hard.
2. **`tools/ghidra/DecompileList.java`** — headless Ghidra. Reads the work list, **applies signatures** from `tools/signatures/`, writes C to `decomp/lime/_raw/`.
3. **Differential tests** — verify behaviour against the oracle.

### Why signatures matter

```c
/* without */
void _limeMatrixLoadIdentity(undefined4 *param_1)
{ *param_1 = 0x3f800000; param_1[1] = 0; ... }

/* with */
void _limeMatrixLoadIdentity(float *m)
{ *m = 1.0; m[1] = 0.0; m[2] = 0.0; ... }
```

Declaring `MESHINFO`, `MESHSETINFO` and `LIMEVERTEX` turned `_LIME_LoadMeshSet` from pointer arithmetic into ordinary struct access. An unexpected bonus: Ghidra recovered the `_limeMalloc` tags as readable strings — `"meshsethandle"`, `"meshset_meshes"` — independently confirming the field naming we had deduced.

### GhidraMCP — partial, not blocking

The extension is installed and `.mcp.json` is written, but GhidraMCP is a **GUI plugin**, not a headless service. Activating it requires opening Ghidra, loading the program, enabling `MCPServerPlugin` under *File → Configure → Miscellaneous*, and restarting the client.

**Decision: not worth blocking on.** The headless path is built, tested and automated, and is *better* for batch-processing 109 functions than going one at a time through MCP. GhidraMCP will earn its place for interactive work — renaming, typing structs, exploring cross-references.

---

## Critical finding: Ghidra mis-decompiles 2-lane NEON

**Ghidra's output for `_Len` is wrong.** It returns an uninitialized variable, losing the `vsqrt.f32` entirely, because EA's compiler used **2-lane NEON instructions for scalar maths** and Ghidra models those as opaque vector operations.

**Scope: 29 of 109 functions in `lime/common` (27%)**, concentrated in the maths-heavy modules — `limeVector` 100%, `limeFont` 67%, `Matrix` 45%, `RenderSkinned` 45%, `LIMEDS_Misc` 50%.

Operational rule:

> No NEON-marked function is considered correct until it passes the oracle. For those 29, Ghidra's output is a sketch of the control flow, not of the computation.

The other 80 (73%) come out clean and are directly usable.

Full analysis in [METHODOLOGY.md](METHODOLOGY.md).

---

## touchHLE — 1.2.59 runs

Version 1.2.59 boots and plays after a **2-byte patch** to `LocaleManager::setLocale`. Nobody had this version working before; the app database lists only 1.0.4 and 1.0.49.

The most useful consequence for the port: **the EA SDK does not block startup.** Exactly one function did. `Mayhem`, `EASDK_Handler` and even achievements initialised fine, which means Phase 6 stubs can be trivial — with the exception of `LocaleManager`, which must be implemented properly, and the rule that **no stub may use `assert()`**.

Full write-up: [TOUCHHLE-PATCH.md](TOUCHHLE-PATCH.md).

---

## Decisions and rationale

1. **Headless Ghidra over GhidraMCP** for batch work. Processing 109 functions one at a time through MCP is slower and more fragile than a script. MCP is for interactive work.
2. **Signatures in text files**, not embedded in code. They grow without touching Java, and double as documentation of what has been learned.
3. **Verify with mathematical invariants**, not only against a reference implementation. Invariants do not depend on having guessed the internal convention correctly.
4. **Resolve literals at recompile time** rather than mapping `__TEXT` into guest memory. They are immutable constants; folding them yields simpler code.
5. **gcc/MinGW over MSVC Build Tools.** Self-contained, far lighter, and matches the compiler used for the Linux side of the port.
6. **Raw Ghidra output is never the product.** It lives in `_raw/`, is regenerated when signatures improve, and serves as a draft only.

---

## Next up

1. **Extend the oracle to the rest of `RenderMesh.cpp`** — the loader is verified; the rendering functions are not.
2. **Add `RenderScene.cpp` and `RenderSkinned.cpp` to `signatures/lime.txt`.** Struct names are already known from the mangled symbols: `SKININFO`, `BONEANIMFRAME`, `SKINMATRIX43`, `limeVECTOR3`, `limeVECTOR2`. Declaring them should give another readability jump, as `MESHINFO` did.
3. **Recursive descent in `recomp.py`** — unblocks the 852 functions with literal pools.
4. **`.skin` / `.bones` / `.skinanim`** — the formats that make characters animate. `RenderSkinned.cpp`, now decompiled, is the best source. The running game in touchHLE can validate any hypothesis.
5. **Start the native platform layer** — 229 functions of new code, no reverse engineering, and it can proceed in parallel with everything above.

### Known technical debt

- `_RotVector` and `_limeMatrix3x4RotateSkin`: signatures assumed, not confirmed.
- Import shims: 9 written of 689 resolved stubs. Only the ones each verified module needs have to exist.
- `recomp.py` has no recursive descent, so large functions with embedded literal pools truncate. Does not affect `lime/common` (0 undecodable bytes in the verified modules).
- The missing `*_LOW.PNG` textures seen in the touchHLE log are unexplained, and matter for the port's asset pipeline.

---

## Toolchain

**MinGW-w64 gcc 16.1.0** (UCRT) and **clang 22.1.8**. gcc is used because clang targets `windows-msvc` and there is no MSVC on the machine.

```bash
# build a differential test
gcc -std=c11 -O1 -Wall -Wextra -I runtime -I recompiled \
    tests/test_matrix_diff.c decomp/lime/Matrix.c recompiled/matrix.c runtime/arm_runtime.c \
    -o build/test_matrix_diff -lm

# regenerate the oracle for a module
python tools/armrecomp/recomp.py UMK3.armv7 --file Matrix.cpp --out recompiled --name matrix --with-deps
```
