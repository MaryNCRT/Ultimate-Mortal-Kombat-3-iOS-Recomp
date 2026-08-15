# The `.scene` format

The scene graph: which objects make up a stage or an effect, their animation
tracks, and a trailing table. 547 files ship with the game.

Derived from `LIME_LoadScene` (`0x0005f0ac`) in the armv7 slice.
Parser and validator: [`tools/scene.py`](../tools/scene.py).

**Status: solved.** `python tools/scene.py validate <res dir>` walks **545 of
547 files** to their exact last byte — 7,254 objects, 1,664,493 track records,
152,306 tail records. The two exceptions are discussed at the end.

```
int32   numObjects
int32   count2
per object, numObjects times:
    byte  object[64]            // begins with a name string
    byte  track[count2][12]     // three floats each
int32   count3
byte    tail[count3][40]
```

---

## Every stride comes from the loader

Not from a formula fitted to file sizes. That distinction is the whole point,
and an earlier attempt at this format produced a formula matching 71 of 92
single-object files — a near-miss that looked like a solution and was not.

**The header is two int32** (`0x0005f204`):

```
ldr   r0, [r6], #4       ; numObjects, cursor advances 4
str   r0, [r4, #0x48]
ldr   r1, [r1, #4]       ; count2
str   r1, [r4, #0x44]
add.w fp, r6, #4         ; cursor now at +8
```

**The object is 64 bytes** (`0x0005f28e`), copied verbatim rather than
scattered field by field the way `.events` is:

```
blx   memcpy             ; 64 bytes into objects[i]
add.w fp, fp, #0x40      ; cursor advances 64
```

**Each object carries `count2` track records of 12 bytes** (`0x0005f3a0`):

```
ldr  r0, [sp, #0x1c]     ; count2
lsls r2, r0, #2          ; count2*4
lsls r3, r0, #4          ; count2*16
subs r3, r3, r2          ; count2*12
add  fp, r3              ; cursor advances past this object's tracks
```

The inner loop reads a float at `[sl, #0x40]` stepping `sl` by `0xc`, and
`0x0005f3bc` resets `sl` to the advanced cursor for the next object. So the
tracks are **per object**, giving `numObjects × count2` records in total.

**Then a third count, read from the file** (`0x0005f3c4`):

```
ldr.w r6, [fp]           ; count3
lsls  r1, r6, #5         ; count3 * 32   <- in-memory record is 32 bytes
bl    limeMalloc
```

**And the tail records are 40 bytes on disk** (`0x0005f444`) — the giveaway is
the pre-indexed load with writeback at the end of the copy sequence:

```
ldr r3, [r1, #0x28]!     ; read, then advance r1 by 0x28
```

The first tail field is read at `+4` rather than `+0`, because `+0` holds the
`count3` that precedes the array.

---

## Why the walk is evidence

By this project's own rule, a file walk proves nothing unless it depended on
values that varied. Across the 545 files that parse:

| | distinct values | range |
|---|---:|---|
| `numObjects` | 63 | 0 – 201 |
| `count2` | 74 | 2 – 4,802 |
| `count3` | 175 | 0 – 9,068 |

Three independently varying counts, each governing a different array, and the
walk still lands on the exact last byte of 545 files. A wrong layout does not
survive that.

---

## What the data is

The objects are **scene graph nodes exported from a modelling package**. Their
names give it away — `BALCONY_LEVEL_SCENE.scene` holds `Plane002`, `Box004`,
`Box03`, which are 3ds Max defaults. Other files use authored names like
`Text001` and `Helix001`.

The per-object 12-byte tracks are three floats, overwhelmingly `1.0, 0.0, 0.0`
in the files inspected — consistent with per-frame scale or visibility that is
mostly inert. The loader compares the first float against a constant and only
acts when it exceeds it, then calls `LIME_FindMeshByName` with the object's
name, which is how a scene node is bound to geometry.

`AXEFIRE.scene` shows non-trivial tracks: `(5, 0.7209), (6, 0.6903),
(7, 0.6606), (8, 0.6309)` — an index rising while a value falls, which is a
keyframed fade.

The 40-byte tail records hold four floats the loader scales and narrows to
`int16`, followed by five `int32`s. Their meaning is not yet established.

---

## A scene is the root of a file group

The loader strips the last 6 characters of the filename — exactly `.scene` —
builds variants, and calls `limeLoadFile` three more times plus
`LIME_LoadEvents` once. That explains something that had gone unremarked: the
`.events` corpus is the same size as the scene corpus because **every scene
owns one**.

Scenes are also **cached and reference-counted**. `LIME_GetSceneFromFilename`
(`0x0005ef6c`) runs first and, on a hit, the loader just increments the count at
`+0x40` and returns. Loading the same scene twice does not reparse it.

### The in-memory `SCENE`

| Offset | Contents |
|---|---|
| `+0x40` | reference count |
| `+0x44` | `count2` |
| `+0x48` | `numObjects` |
| `+0x4c` | objects array, `numObjects × 64` |
| `+0x54`…`+0x70` | seven pointers, from the three extra `limeLoadFile` calls |
| `+0x7c` | tail array, `count3 × 32` |
| `+0x84` | the scene's `.events` |
| `+0x88`, `+0x8c` | pointer arrays, `numObjects × 4` each |

---

## The two files that do not parse

`ROBO1_STANDARD.scene` (8 bytes — the header alone, with no `count3`) and
`ROBO2_STANDARD.scene` (13,904 bytes; the walk overshoots to 153,908).

**This is the same pair that breaks every other format.** `.bones` reads a
24-byte bone for them rather than 25, and their `.meshset` uses the unindexed
variant. Whatever is different about Cyrax and Sektor's assets is consistent
across four formats, which makes it one question rather than four — and a more
interesting one than a parser bug.
