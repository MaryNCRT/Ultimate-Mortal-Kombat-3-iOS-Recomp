# Encargo — what to pick up next

A short, specific work order for whoever takes this on next. For orientation,
read [HANDOFF.md](HANDOFF.md) first; this file is the *current* task, not the
project overview.

---

## The job: finish `lime/common`

**69 of 109 done (63%).** Forty left. This is the row that moves
the overall bar, and it is the bottleneck for everything downstream — there is
no engine for the platform layer to drive until it is finished.

| File | Done | Left |
|---|---|---:|
| `Matrix.cpp` | 11/11 | — |
| `limeVector.cpp` | 2/2 | — |
| `RenderSkinned.cpp` | 15/20 | 5 |
| `RenderMesh.cpp` | 12/19 | 7 |
| `Events.cpp` | 11/22 | **11** |
| `RenderScene.cpp` | 8/14 | 6 |
| `DS_DebugWin.c` | 5/7 | 2 |
| `LIMEDS_Misc.cpp` | 4/8 | 4 |
| `limeFont.cpp` | 1/6 | 5 |

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

---

## Three rules that this session actually needed

**Write what you established, not what would look complete.** Two of
`limeFont.cpp`'s functions are in the repo as documented declarations with **no
body**, because the glyph-table layout is not decoded and writing a body would
have meant inventing one. That is the correct outcome, not a gap to be tidied.

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
  at 69/109 and overall at 30%.
