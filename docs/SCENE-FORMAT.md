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

## Where it stops

**The on-disk record is not 64 bytes**, so the file walk does not close.
`8 + numObjects*64` matches exactly **1 of 547** files.

For the 92 files with `numObjects == 1`, a clean pattern does appear:

```
size == 8 + 108 + 12 * count2      ->  71 of 92 exact
```

which reads as a 108-byte object record followed by `count2` items of 12 bytes.
But **21 of those 92 do not fit**, and they miss by a lot rather than a little:

| File | Actual | Predicted |
|---|---:|---:|
| `BOMB1.scene` | 3,300 | 860 |
| `JAXGROWFINB.scene` | 4,968 | 1,328 |
| `GYMIST1.scene` | 104,128 | 24,128 |

So the object record carries something of variable length that `count2` does
not describe. `numObjects` runs from 0 to at least 11 across the corpus, and
the multi-object files do not divide cleanly either.

---

## Where to resume

1. **Trace the per-object loop past the `memcpy`.** The copy at `0x0005f27a`
   moves 64 bytes, but the cursor advance for the *next* object is what defines
   the on-disk record, and it has not been read. That single instruction is the
   answer — the same way `0x000a49be` settled `.events`.
2. **Watch for a second nested loop.** The `lsls r2, r0, #1` at `0x0005f268`
   computes `count2 * 2` and stashes it, which suggests a per-object inner
   sequence sized from `count2`.
3. **Two files have `numObjects == 0`** and are 8 and 12 bytes. The 8-byte one
   is the header alone and confirms it; the 12-byte one has four trailing bytes
   that nothing yet accounts for.

The rule that applies here, from [METHODOLOGY.md](METHODOLOGY.md): the strides
have to come from the loader's own arithmetic, not from guessing a formula that
fits most files. 71 of 92 is exactly the kind of near-miss that looks like a
solution and is not one.
