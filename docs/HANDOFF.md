# Handoff

Written for whoever picks this up next, human or model, with no prior context.
Read this, then [METHODOLOGY.md](METHODOLOGY.md). Everything else is reference.

---

## Where the project actually stands

**64.64% of the total estimated effort. Nothing is playable.** The arithmetic is
in the [README](../README.md#overall-progress) and the weights are a judgement
call; the completion figures are measured by `tools/progress.py` on every run.

| | |
|---|---|
| Asset formats | **100%** — solved, demonstrated, animating |
| `lime/common` | **109 of 109** written, **all nine files verified** |
| Native executable | **exists**, draws all 18 arenas with a skinned animated fighter |
| `gamecode` | **291 of 291** — finished, and it BOOTS: `tests/test_menu_boot.c` runs the loader and sixty ticks of the main menu |
| `gamecode/logic` (fight engine) | 3 of 2,172 — essentially untouched |
| Platform layer | window, GL context and asset loading on Windows and Linux; no audio, no input mapping |

The shape of the project has changed: **two of the three code modules are
finished.** `lime/common` is 109 of 109 and `gamecode` is 291 of 291 — every
front-end screen, every menu, the HUD, the tower, the loaders and the whole
network lobby. The fight engine is now the only mountain left, and it is a
large one: 2,172 functions against the 400 written so far.

**If you are picking this up mid-stream, the front is `gamecode/logic`.** The
method does not change — smallest-function-first through
`python tools/pending.py`, because the small ones keep turning up the constants
and struct offsets the big ones then need. The bar for landing one is in the
["Next up"](PROGRESS.md#next-up) section of PROGRESS.md and is not negotiable:
`check.sh` at **zero errors and zero warnings** in `decomp/gamecode`, `symcheck`
at zero unknown callees, figures republished with `tools/sync_figures.py`.

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

### 1. `gamecode` is finished — read it before starting the logic module

**291 of 291**, ten files under `decomp/gamecode/`. Nothing is left there, but it
is the reference for everything the fight engine will need, and the headers are
where the hard-won facts live.

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

The tail was all large and it is all landed. `GameInit_LoadABit` (11,700 B) is
the asset manifest for a fight and produced [the roster table](ROSTER.md);
`DrawHUD` (11,536 B) turned out to run the round and match state machine;
`FE_Task_About_Help` (10,360 B), the largest in the front end, is one text block
written out thirty-seven times with the spacing hand-tuned per block.

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
| `tools/dumpfn.py` | disassemble one function by name -- the thing you will run most |
| `tools/pending.py` | what is left, smallest first: `--logic mkzap.c 40` |
| `tools/protos.py` | every declaration against its definition; `--fix` corrects return types |
| `tools/samefn.py` | group functions by shape, so identical bodies are read once |

### The four readers, and what each will not do

Most of `gamecode/logic` is one function written many times, so three programs
read the repetitive parts and refuse the rest. `tools/genfile.py <file>.c` runs
all three and appends what they proved.

| | takes | refuses |
|---|---|---|
| `tools/pushfn.py` | the frame-push shape: a guard, stores, a handler installed | one instruction it cannot model, a handler that is not an address, a store it cannot place |
| `tools/microfn.py` | fixed templates -- a tail call, a constant into 0x5c, a table handed to a search routine | anything with an instruction out of place |
| `tools/leaffn.py` | straight-line leaves: stores, calls, a return | anything that branches, any return value it cannot prove, any value read from a field the function also writes |
| `tools/parkfn.py` | the token dispatch -- `it ne` / `mvnne r0, #2` -- and its two states | a state that is not exactly one of park, descend or install; a token, duration or handler that is not constant |

**The refusals are the point.** Each was added because guessing there produced
something wrong:

- `leaffn` refuses a value read from a field the function also writes because
  that is the borrow-and-restore idiom -- a value saved at the top and put back
  at the end. Written as a re-read it becomes `obj->field40 = obj->field40`,
  which it did, once, before the rule existed.
- `leaffn` calls a function `void` only when it can PROVE the last thing to
  touch r0 was a call, so what is left there is the callee's leftover. Assuming
  otherwise is what hid `randper`'s return value and `DrawSkinnedMesh2`'s count
  for months.
- `pushfn` masks its arithmetic to 32 bits because Python's does not, and
  `0xffffffb8 + 0x5d` came out as a 33-bit constant in a `uint32_t` field.
- `parkfn` tests for the CLEAR before the token, because a zero into the token
  slot is the clear that ends an install. Testing for a token first ate every
  clear in the directory and the reader accepted nothing at all.

**Two of `parkfn`'s three bugs were in the parsing, not the logic**, and both
came from copying a piece of `microfn` without the pass that follows it: a
`bl` carries its target on the same line rather than as a `; ->`
continuation, and `ldr rX, [pc, #n]` with no `add rX, pc` after it loads a
word rather than an address. Ninety-five functions were lost to the first and
every 0x16462 park to the second. If a reader's yield is surprisingly low,
suspect the parser before the rules.

**If a reader accepts something, check one against `dumpfn.py` before trusting
a batch.** Every bug above was found that way or by a compiler, not by
reasoning about the tool.

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
- **The hidden roster is reachable, and this is now settled.**
  `drawCharacterSelection` gives the exact routes:

  - **Smoke** — hold on Human Smoke (cell 14) for 180 frame-rate-corrected
    units, about three seconds. The code then turns the cell into character 22
    and writes `limeLastTouchScreenX = -1`, *fabricating a release* so the hold
    completes through the ordinary tap path.
  - **Ermac, Mileena, Classic Sub-Zero** — the three ten-digit kodes in
    `FE_Task_Enter_Kode`: `1234444321`, `2226422264` and `8183581835`, setting
    `ErmacUnlocked`, `MileenaUnlocked` and `ClassicSubZeroUnlocked`.

  Every cell is also matched against **two** tables, `CS_Layout` and
  `CS_Layout2`, so one grid position can stand for two fighters. See
  [HIDDEN-CONTENT.md](HIDDEN-CONTENT.md).

---

## Keep doing this

Update `PROGRESS.md` at the end of each block of work, keep the percentage bars
honest — **they did not move for several very productive sessions and that was
correct**, because the row those sessions advanced was already at 100% — close
issues that are resolved, open issues for what you find, and record the failures
alongside the results. Half the value in this repository is in the paragraphs
explaining what did *not* work.

## Where the work stopped (2026-08-29)

**`gamecode` reached 291 of 291.** The last twelve were all in `FrontEnd.cpp`:
the endings viewer, the versus screen, the treasure and kode rows, the lobby,
the character grid, the button editor, the tower and the help pages.

Eight declarations were corrected along the way, every one of them by finally
reading a *caller* — which remains the single most reliable way this project
finds its own mistakes:

| symbol | was | is | what proved it |
|---|---|---|---|
| `limeGetStringWidth` | `long` | `float` | `vmov s10, r0` with no `vcvt` |
| `VSWait` | `long` | `float` | `vcmpe.f32` against 30.0 |
| `Character_SelectWait` | `long` | `float` | `vldr` + `vcmp.f32` |
| `KodeSelectorParticle[]` | `int[]` | `float[]` | advanced by `0.05/fps` |
| `EASDK_LogEventEnumEnum` | 4 args | 5 args | callee reads `[sp, #0x34]` |
| `peerNames` | `[5][64]` | `[8][64]` | the symbol table's own extent |

Three things worth carrying forward into the fight engine:

- **A `= 0` store can never tell an `int` from a `float`.** Four of the six
  corrections above were invisible until a *read* appeared. Treat any type
  established only from stores as provisional.
- **Debug output shipped in retail** in at least four places:
  `printf("limeFPSScaleFactor:%f
")` on the endings screen's hot path,
  `printf("%d TOUCHED
")` in the lobby, `puts("PRESSED EXIT!")` on the network
  versus screen, and `puts("F")` / `puts("G")` inside the loader.
- **`FE_WidthScale` and `FE_HeightScale` are interchangeable on 480x320 and only
  there.** Four screens mix them — `FE_Task_VS_Screen` pulls the right-hand
  portrait back by a height-scaled 256 while drawing it width-scaled,
  `EditButtons` uses `FE_W(48)` for a vertical measurement, and
  `FE_Task_Select_Treasure` passes `FE_WidthScale` itself as a colour component.
  Every one of them is invisible at 4:3 and wrong at any other aspect. A
  widescreen port has to decide each case deliberately.

### The front is now `gamecode/logic`

3 of 2,172. Everything in `decomp/gamecode/` is the reference for it, and
`tools/pending.py` still orders the work. The plan of record is to automate the
loop with `tools/decomp_loop.py` rather than reading 2,169 functions by hand.
