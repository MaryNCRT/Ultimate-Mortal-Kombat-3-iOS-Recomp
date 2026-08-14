# The `.skin` format

Skinning data: what binds a character's vertices to its skeleton. Together with
`.bones` and `.skinanim` this is what makes the fighters move, so it is the
format that stood between a static model viewer and an actual game.

Derived from the disassembly of `LIME_LoadSkin` (`0x00060650`) and
`LIME_LoadSkin1` (`0x000604c0`) in the armv7 slice, and validated against every
`.skin` file the game ships.

> **Validation: 29 of 29 files parse with the walk landing exactly on the last
> byte.** 28,315 skinning matrices, 54,413 vertices. There is no length field
> anywhere in the file, so an exact landing on every file is strong evidence
> that the layout is right rather than merely plausible.
>
> Reproduce with `python tools/skin.py validate <res dir>`.

---

## 1. Overall structure

```
int32   blockCount          // 1 or 2
BLOCK   blocks[blockCount]
```

`LIME_LoadSkin` reads the count, calls `LIME_LoadSkin1` once per block, and
chains the results through `SKININFO+0x00`. The code only ever tests for
`== 2`, so two is the practical maximum — a character with a second skin, such
as a detachable part.

### The two odd files

`ROBO1_STANDARD.skin` and `ROBO2_STANDARD.skin` have **no leading count**:
their first `int32` is already the matrix count, and the file is a single bare
block.

These are the same two files that use the unindexed variant of `.meshset`, so
they clearly came out of a different export path. A reader should try the
counted layout first and fall back to a bare single block if the walk does not
land exactly — which is what `tools/skin.py` does.

---

## 2. A block

```
int32   numMatrices         // N — skinning matrix entries
int32   numVerts            // M — vertices

uint32  indexes[N]                  // copied verbatim
uint16  weights[N * 4]              // each scaled by 1/65536 on load
struct { MATRIX43 a; MATRIX43 b; }  entries[N]   // 96 bytes each
byte    vertData[M * 24]            // copied verbatim
byte    vertExtra[M * 6]            // copied verbatim
```

Total size of a block: `8 + N*108 + M*30`.

`MATRIX43` is 12 floats — 48 bytes. The name comes from the binary itself: the
mangled symbol `__Z6Xform2P11limeVECTOR3S0_S0_S0_P12SKINMATRIX43f` decodes to
`Xform2(limeVECTOR3*, …, SKINMATRIX43*, float)`.

### Weights are 16-bit fixed point

The loader converts each `uint16` to float and multiplies by the constant at
`0x00060634`, which is `0x37800000` — exactly `1/65536`.

That the encoding is right is easy to confirm by looking at the values: the
first entries of `SCORPION_STANDARD.skin` decode to `0.99998, 0, 0, 0`, which
is one bone at full influence and three unused slots. Four weights per matrix
entry is the usual skinning arrangement.

### The buffers name themselves

`limeMalloc`'s first argument is a debug tag, and the strings survive in the
binary. They are the best evidence available for what each buffer is:

| Destination | Size | Tag in the binary |
|---|---|---|
| `SKININFO+0x20` | `N × 4` | `skin_indexes` |
| `SKININFO+0x24` | `N × 16` | `skin_mweights` |
| `SKININFO+0x14` | `N × 48` | (matrix array) |
| `SKININFO+0x28` | `N × 48` | `skin_normals` |
| `SKININFO+0x1C` | `M × 24` | `skin_uvs` |
| `SKININFO+0x18` | `M × 6` | (per-vertex, 6 bytes) |

Two caveats worth stating plainly:

- The `skin_uvs` tag sits on a **24 bytes per vertex** buffer, which is far more
  than a UV pair needs. Either the tag is stale — copied from another buffer
  when the code was written — or the buffer holds more than UVs. **Not yet
  resolved.** Do not treat those 24 bytes as two floats.
- `indexes` decode as large unsigned values (`0xFFFFFF2E` and similar), so they
  are almost certainly **signed**, and negative. Probably offsets rather than
  plain indices. **Not yet resolved either.**

---

## 3. `SKININFO` in memory

48 bytes — `limeMalloc(tag, 0x30)` in `LIME_LoadSkin`.

| Offset | Field | Notes |
|---|---|---|
| `0x00` | `SKININFO *next` | second block, or `NULL`; set to 0 before loading |
| `0x04` | `int numMatrices` | N |
| `0x08` | `int numVerts` | M |
| `0x14` | `MATRIX43 *matricesA` | first matrix of each entry |
| `0x18` | `void *vertExtra` | `M × 6` bytes |
| `0x1C` | `void *vertData` | `M × 24` bytes |
| `0x20` | `int32 *indexes` | N entries |
| `0x24` | `float *weights` | `N × 4` floats |
| `0x28` | `MATRIX43 *matricesB` | second matrix of each entry |

Offsets `0x0C`, `0x10` and `0x2C` are not written by the loader.

Note the ordering trap: within each 96-byte entry the **first** matrix goes to
`+0x14` and the **second** to `+0x28`, but the loader allocates `+0x14` first
and `+0x28` second. Reading the allocation order as the storage order gets the
two arrays backwards.

---

## 4. The `.bones` format

The skeleton itself. From `LIME_LoadBones` (`0x000603f0`).

```
int32  numBones (N)
BONE   bones[N]        // 25 bytes each
```

Total: `4 + N*25`. **Validated on 27 of the 29 files.**

`ROBO1_STANDARD.bones` and `ROBO2_STANDARD.bones` use **24 bytes** per bone
instead of 25 — the same two files that are the odd ones out in both
`.meshset` and `.skin`. At this point it is safe to treat those two as having
come out of a different exporter entirely.

### A bone on disk — 25 bytes

| Offset | Type | Meaning |
|---|---|---|
| `0x00` | `int32` | number of used entries in the link array below |
| `0x04` | `float` | offset X |
| `0x08` | `float` | offset Y |
| `0x0C` | `float` | offset Z |
| `0x10` | `byte[9]` | link array: parent first, then children; `0xFF` = unused |

The link encoding is what the data itself shows. In `SCORPION_STANDARD.bones`:

```
bone 0:  count=2   offset=(0.043, 106.068, -0.005)   links = FF 01 FF FF FF FF FF FF FF
bone 1:  count=2   offset=(0, 0, 0)                  links = 02 2D FF FF FF FF FF FF FF
bone 2:  count=3   offset=(10.740, 4.117, 0)         links = 03 25 29 FF FF FF FF FF FF
```

Bone 0 has `0xFF` as its first link and one child — a root. Bone 2 has parent
`0x03` and children `0x25`, `0x29`, which is three used entries, matching its
count of 3. The offsets are plausible skeleton dimensions: ~106 units up for
the root, ~10 units for a limb.

### In memory

`BONESINFO` is 8 bytes — `limeMalloc(tag, 8)`:

| Offset | Field |
|---|---|
| `0x00` | `BONE *bones` |
| `0x04` | `int numBones` |

`BONE` is **56 bytes** — the allocation is `N*64 − N*8`. The loader copies the
first 16 bytes of each disk record verbatim and then writes a pointer at
`+0x14`, computed as `bones + index * 56`: the link indices are turned into
real pointers at load time.

---

## 5. The `.skinanim` format

The animation itself. From `UnpackAnimFrame` (`0x0006012c`).

```
float  scale                 // always 1.0 in the shipped data
int32  numFrames
int32  frameSize
FRAME  frames[numFrames]
```

Total: `12 + numFrames * frameSize`. **Validated on 28 of the 29 files**,
9,590 animation frames in total.

Reproduce with `python tools/skin.py validate-anim <res dir>`.

### A frame

```
int32        tag             // not read by UnpackAnimFrame
limeVECTOR3  rootPosition    // three floats
BONEANIMFRAME bones[N]       // 20 bytes each
```

So `frameSize == 16 + N*20`, and the bone count follows from it.

**Read `frameSize` from the header. Never compute it from the matching
`.bones` file.** Doing so looks correct on most characters and then fails on
ROBO1 and ROBO2, whose animations carry a different bone count than their
skeletons — ROBO1's animation has 20 bones where its `.bones` declares 25.
That mistake cost an iteration here.

`BONEANIMFRAME` is 20 bytes: five floats. `GetSlerpedQ` and `GetMFromQuat2`
operate on it, so four of them are a quaternion; the fifth is not yet
identified.

### The one file that does not fit

`SINDEL_STANDARD.skinanim` reads a second float where the frame count should
be. Treating the header as 16 bytes gives `frameSize = 1256`, which is exactly
`16 + 62*20` for Sindel's 62 bones, and `16 + 844*1256` is exactly the file
size — but the header's own count says 422, which is half of 844. Two streams
of 422, or one of 844 with a longer header; the arithmetic works either way and
the disassembly has not been read far enough to say which. **Unresolved.**

---

## 6. What is still open

- What the 24 bytes per vertex actually contain.
- What the 6 bytes per vertex actually contain.
- What `indexes` indexes into, and why the values are negative.
- The relationship between the two matrix arrays. `matricesB[0]` of Scorpion
  reads `(0.008, 0.114, 0.994, 0…)`, which is unit length — so at least the
  first row is a normalised direction. `matricesA[0]` reads
  `(13.543, -5.923, 1.970, 0…)`, which looks like a position.
- `.bones` and `.skinanim`, neither of which has been touched yet. The
  functions to read next are in `RenderSkinned.cpp`: `GetMFromQuat2`,
  `GetSlerpedQ` and `DrawSkinnedMesh2`, whose mangled names already give away
  that `BONEANIMFRAME` holds quaternions.

The remaining unknowns are all about *interpretation*. The **layout** is settled:
every file in the game walks to its exact last byte.
