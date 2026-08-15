# The `.scene` format — partially solved

**Status: not solved.** This records what is established so far and where to
resume, so the next attempt does not start from zero.

547 files. From `LIME_LoadScene` (`0x0005f0ac`) in the armv7 slice.

---

## What is established

### The file header is two int32 **[verified]**

At `0x0005f204`:

```
ldr r0, [r6], #4        ; numObjects, cursor advances 4
str r0, [r4, #0x48]     ; -> SCENE.numObjects
ldr r1, [r1, #4]        ; the second int32
str r1, [r4, #0x44]     ; -> SCENE +0x44
add.w fp, r6, #4        ; cursor now at +8: object data starts here
```

So: `int32 numObjects; int32 count2;` then the objects.

`count2` is a per-object quantity rather than a file-wide one — at
`0x0005f25c` the loader does `mla r3, numObjects, count2, r3`, accumulating
`numObjects × count2` into a global. That is the shape of "objects × frames".

### The in-memory `SCENE` struct **[verified]**

| Offset | Contents | Source |
|---|---|---|
| `+0x40` | reference count | incremented at `0x0005f0c6` when the scene is already loaded |
| `+0x44` | `count2` | |
| `+0x48` | `numObjects` | |
| `+0x4c` | objects array, `numObjects × 64` | `lsls r1, r2, #6` at `0x0005f21c` |
| `+0x54`…`+0x70` | seven pointers, from three extra `limeLoadFile` calls | |
| `+0x80` | | |
| `+0x84` | the scene's `.events`, via `LIME_LoadEvents` | `0x0005f1f6` |
| `+0x88` | pointer array, `numObjects × 4` | `0x0005f236` |
| `+0x8c` | pointer array, `numObjects × 4` | `0x0005f248` |

### Scenes are cached and reference-counted **[verified]**

`LIME_LoadScene` first calls `LIME_GetSceneFromFilename` (`0x0005ef6c`) and, on
a hit, just increments `+0x40` and returns. Loading the same scene twice does
not reparse it.

### A scene pulls in sibling files **[verified]**

The loader takes the filename, strips the last 6 characters — exactly
`.scene` — and builds variants, then calls `limeLoadFile` three more times and
`LIME_LoadEvents` once. So a `.scene` is the root of a small file group, and
**`.events` is one of its members**. That is why the events corpus is the same
size as the scene corpus.

### The in-memory object is 64 bytes, copied verbatim **[verified]**

The per-object loop at `0x0005f27a`:

```
lsls r0, r1, #6         ; index * 64
ldr  r1, [r4, #0x4c]    ; objects base
adds r0, r0, r1         ; destination
mov  r1, fp             ; source = file cursor
movs r2, #0x40          ; 64 bytes
blx  memcpy
```

No field-by-field scatter, unlike `.events`. 64 bytes straight across.

---

## The on-disk object is 64 bytes **[verified]**

Read straight off the loader, at `0x0005f28e`, immediately after the `memcpy`:

```
blx      memcpy          ; 64 bytes from the cursor into objects[i]
add.w    fp, fp, #0x40   ; the cursor advances 64
```

So the object is the same 64 bytes on disk as in memory, copied verbatim. It
begins with a **name string** — `"Text001"`, `"Helix001"` in the files
inspected.

## A second array: 12-byte records, `numObjects × count2` of them

The inner loop walks a pointer `sl` in steps of `0xc` and reads a float at
`[sl, #0x40]`:

```
vldr     s12, [sl, #0x40]
...
add.w    sl, sl, #0xc
```

`sl` starts at the object data and — the detail that matters — **persists
across objects** rather than resetting, so the array holds `numObjects × count2`
records, not `count2`. Dumping `ADDIT.scene` confirms it: from the byte after
the objects the file repeats `1.0f, 0.0f, 0.0f` on a 12-byte period, and
`sl + 0x40` lands exactly on the first of them.

That gives a formula which matches **118 of 547 files exactly**:

```
8 + numObjects*64 + numObjects*count2*12 + 44
```

up from 71 with the previous guess, and now derived rather than fitted.

## A third array: 40-byte records

For the 429 files that do not match, **every single difference is a multiple of
40** — 40, 200, 240, 2440, 4200, 5240, 5840, 14080. So a further
variable-length array of 40-byte records exists, and 544 of 547 files give a
whole number of them.

**Where its count lives is not yet known.** No field of the 64-byte object,
read as int32 or uint16 at any offset, sums across objects to the required
count.

## Where it stops, and the shape of what is missing

`AXEFIRE.scene` shows the layout is **not a flat array of objects**. Its
"object 1", read at `+8 + 64`, decodes as `'fff?'` — those are float bytes
(`3f 66 66 66` = 0.9f), not a name. And immediately after, the file holds
`(int32, float)` pairs with the index rising and the float falling:

```
5  0.7209
6  0.6903
7  0.6606
8  0.6309
```

Keyframes. So **each object is followed by its own variable-length animation
data** before the next object begins, which is why a flat `numObjects × 64`
array only works for the files where that data happens to be absent.

That also explains the 40-byte records: they are per-object, and their count is
stored per-object — most likely inside the 64-byte header, in a field whose
meaning has not been pinned down, or immediately after it.

### Resume point

Trace the loader's **outer** loop rather than the inner one. The inner loop at
`0x0005f2a0` is understood; what is not is how the cursor reaches the *next*
object once an object's keyframe data has been consumed. The `add.w fp, fp,
#0x40` at `0x0005f28e` cannot be the whole story, because that would make
objects fixed-size — and `AXEFIRE` proves they are not.

Look for a second cursor advance later in the object loop, between `0x0005f2cc`
and the loop back-edge at `0x0005f3c0`.

