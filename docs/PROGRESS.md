# Progress

Current state of the project. Written so that someone can pick it up with no prior context.

**Last updated:** 2026-08-14

---

## Overall progress

```
██████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  15%
```

**≈15% of the total estimated effort. Nothing is playable yet.**

Weights are our judgement of how much of the total each area represents;
the completion figures are measured. Two numbers are worth keeping apart:

- **15%** — share of the *whole project*, counting analysis, tooling and formats.
- **0.6%** — share of the *decompilation itself*: 16 finished functions of 2,572.

Both are true. The first says the foundations are in place; the second says the
bulk of the work has not started.

| Area | Weight | Done | |
|---|---:|---:|---|
| Binary analysis and source-tree mapping | 4% | 100% | `██████████` |
| Tooling and the verification oracle | 8% | 90% | `█████████░` |
| Asset format specifications | 8% | 20% | `██░░░░░░░░` |
| `lime/common` — engine core (109 fn) | 12% | 15% | `██░░░░░░░░` |
| `gamecode` — game logic (291 fn) | 18% | 0% | `░░░░░░░░░░` |
| `gamecode/logic` — fight engine (2,172 fn) | 28% | 0% | `░░░░░░░░░░` |
| Native PC platform layer (229 fn rewritten) | 17% | 0% | `░░░░░░░░░░` |
| EA SDK stubs (~1,412 fn) | 5% | 0% | `░░░░░░░░░░` |

### Milestones

| Milestone | Status |
|---|---|
| The binary is understood and mapped | ✅ done |
| A verification method exists and is proven | ✅ done |
| The game runs somewhere as a behavioural reference | ✅ done (touchHLE) |
| Model format readable | ✅ done |
| Animation formats readable | ⬜ not started |
| Something renders on a PC screen | ⬜ not started |
| The game boots natively | ⬜ far off |
| The game is playable natively | ⬜ far off |

---

## At a glance

| Phase | Status |
|---|---|
| 0 — Binary analysis and source-tree mapping | ✅ complete |
| 1 — Asset formats | 🔄 `.meshset` solved; `.skin`/`.bones`/`.skinanim` open |
| 2 — Verification oracle | ✅ complete and proven |
| 3 — Ghidra automation | ✅ headless pipeline working |
| 4 — Decompile `lime/common` | 🔄 109/109 drafted, 2.5 modules finished |
| 5 — Native PC platform layer | ⬜ not started |
| 6 — EA SDK stubs | ⬜ not started (scope reduced, see below) |
| 7 — Decompile `gamecode` | ⬜ not started |
| 8 — Decompile fight logic | ⬜ not started |
| 9 — Widescreen, gamepad, mods | ⬜ not started |

**Honest framing:** 16 of 2,572 functions are fully done. That is ~0.6%. The percentage is not the interesting number — the pipeline that produced them is, and it now runs unattended.

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
