# How a fighter gets drawn

`RenderLevelPlayers` (armv7 `0x00023ee8`, 4,572 bytes) is where the game stops
being arcade logic and becomes OpenGL. It walks the engine's object list twice
and, for each object, builds a model matrix and hands it to `RenderPlayer`.

> **Written.** `RenderLevelPlayers` is decompiled in
> [`decomp/gamecode/GameCode.c`](../decomp/gamecode/GameCode.c); this page is
> the map that was made first, kept because the tables on it are easier to read
> than the code.

---

## The GL calls, named

The function calls OpenGL ES directly through the lazy-binding stubs. Every one
was named by walking the indirect symbol table with `tools/imports.py`, not
guessed from its arguments:

| stub | import |
|---|---|
| `0x000dd890` | `glColor4f` |
| `0x000dd8e4` | `glCullFace` |
| `0x000dda7c` | `glLoadIdentity` |
| `0x000dda88` | `glMatrixMode` |
| `0x000dda94` | `glMultMatrixf` |
| `0x000ddad0` | `glRotatef` |
| `0x000ddadc` | `glScalef` |
| `0x000ddb30` | `glTranslatef` |
| `0x000ddb9c` | `memcpy` |

This is the first place in the project where the raw GL entry points are named.
A port replacing the fixed-function pipeline needs this list — everything here
is GL ES 1.1 matrix-stack work, and it is all in one function.

## The fighter transform

For each object, in this order:

```c
glMatrixMode(GL_MODELVIEW);                 /* 0x1700 */
glLoadIdentity();
glTranslatef(player[0x5c8], player[0x5cc], player[0x5d0]);
glScalef(s, s, s);                          /* s = PlayerDefs[k].f04 * PlayerSize */
glTranslatef(PlayerDefs[k].f10 * ±2.15f, 0.0f, PlayerDefs[k].f14 * 0.65f);
glRotatef(90.0f, 1.0f, 0.0f, 0.0f);
```

The `±` is the mirror: `+2.15` facing one way, `-2.15` the other. A mirrored
fighter additionally gets

```c
glScalef(-1.0f, 1.0f, 1.0f);
glCullFace(GL_FRONT);                       /* 0x0404 */
```

and an unmirrored one `glCullFace(GL_BACK)` (`0x0405`). That is the concrete
form of the note in CLAUDE.md that mirrored geometry needs the winding flipped —
here it is, one `glScalef` and one `glCullFace`.

`glColor4f(1, 1, 1, 1)` resets the vertex colour before each object.

Separately from the GL path the function also builds a `limeMATRIX` for the
same object — `limeScaleMatrixXYZ(&mtx, -(f04 * PlayerSize), f04 * PlayerSize,
f04 * PlayerSize)` then `limeMatrixMult(M_Rot90, &mtx, player + 0x548)` — and
`M_Rot90` is set up once at the top with `RotMatrixX(M_Rot90, 1.57075f)`. Note
that constant: **1.57075, not pi/2**. The negative X scale is the mirror again.

## The object list

`GameObjects[0]` is the head and **the first word of each object is the next
pointer**. The fields this function reads:

| offset | width | what |
|---|---|---|
| +0x00 | ptr | next object |
| +0x08 | int16 | frame id |
| +0x0a | uint16 | flags — bit 4 mirrors, bits 0–3 an effect nibble, bit 7 picks the spear |
| +0x0c | int8 | character index, which indexes `PlayerDefs` at stride 52 |
| +0x0d | uint8 | bit 0 is the side, `>> 1` is the player/object slot |
| +0x0e | int16 | a second frame id, tested against the spear and fatality ids |

## The PLAYER fields it touches

Stride 0x5f0, as established elsewhere.

| offset | what |
|---|---|
| +0x14 | the resolved frame |
| +0x51c, +0x520, +0x524 | frame triple, seeded from +0x14 |
| +0x528, +0x52c | passed to `RenderPlayer` |
| +0x530 | copied from the owning fighter |
| +0x534, +0x538, +0x53c | a tint triple, cleared per object and set from the effect nibble |
| +0x540 | the mirror flag, taken from object flags bit 4 |
| +0x548 | the world matrix, handed to `glMultMatrixf` |
| +0x584 | a float, set to 100.0 for nine slots before the walk |
| +0x5c8, +0x5cc, +0x5d0 | the 3D position, written by `ArcadePosTo3dPos` |
| +0x5e8, +0x5ec | compared to decide whether to re-trigger scene events |

## Two passes, and the depth clear

`mk3_who_in_front()` decides the draw order. The first pass starts one element
into the list when the far fighter is second, and `limeClearDepthBuffer()` runs
between the passes with `ClearedZBuffer = 1`. That is how the game gets the
fighters to overlap correctly without sorting.

## `MatrixPalette2` is 150 bones

Each object's skinning matrices are `memcpy`'d out of `MatrixPalette2` into
`AttachTransforms` in blocks of **0x1c20 = 7200 bytes**, and `AttachTransforms`
is indexed by the object slot at that same stride. 7200 / 48 is **150 three-by-
four float matrices** — the bone count a port's skinning path has to match.

## `AllFramesTable` records are 65 bytes

The function indexes it as `frame * 0x41 + 1` — a 65-byte record with one
leading byte skipped. That is the first measurement of that table's stride.

## Frame ids that mean something

| id | what it selects |
|---:|---|
| `0x4e20` | skips the whole per-object translate |
| `0x1a7f`, `0x1a80` | `SpearWhichTexture` 1 and 2 |
| `0x129c`, `0x129d`, `0x129e` | `SpearWhichTexture` 3, 4 and 5 |
| `0x0758` | starts `DoSmokesEarthFatal` |
| `0x10aa` | skips `RenderPlayer` |
| `0x1b36`–`0x1b37` | clears the mirror bit |
| `0x1b4e`–`0x1b67` | toggles the mirror bit |

`DrawSpear[side]` is set when none of the spear ids matched.

---

## The three callees, and two of them were easy to cross

| address | function |
|---|---|
| `0x00023c7c` | `RenderPlayer` — the fighter, already decompiled in `GameCode.c` |
| `0x0005f7a4` | `LIME_RenderScene` — the projectile and effect path |
| `0x0005ee78` | `RenderDebugCube` |

`RenderPlayer` and `LIME_RenderScene` sit next to each other in the same arms and
take similar argument shapes. An earlier pass over this function had them
swapped; they are only distinguishable by resolving the call target against the
symbol table, which is what the table above does.

## Jax, Jade and the axe trail

- **`JaxBeingSquashed`** short-circuits the whole prologue: `glColor4f(1,1,1,1)`,
  then `RenderPlayer(&JaxSquashedPlayer, 0, 0)` if `JaxGrowCounter <= 0x108`,
  before rejoining the normal path.
- **`JadeStomachShaker`** is called on both fighters, and the depth buffer is
  cleared if *either* returns non-zero.
- **`AxeTrailDisallowed`** is a countdown: when non-zero it is decremented and
  the object's scene events are skipped for that frame.
- **`DoingStageFatalBringForward`** is applied as `glTranslatef(0, that, 0)`
  when the object's slot matches `DoingStageFatal - 1`.

## What the transcription added

Four things came out of writing it that the map above did not have:

- **The walk is not a plain walk.** When `mk3_who_in_front()` says the far
  fighter is second, the order is **1, 0, 2, 3, ...** — it starts at
  `GameObjects->next`, returns to the head, and then steps *twice* to skip the
  object it already drew.
- **The reset covers nine slots, the sweep only eight.** `f584 = 100.0f` is
  written for nine PLAYER records before the walk and read back for eight after
  it, so the ninth slot's `f5ec` is never cleared. That is the original's
  off-by-one, not a misreading of it — both counts come out of the same 0x5f0
  stride (`0x3570` is nine, `0x2f80` is eight).
- **Slot 3 has an unguarded debug print.** `LIME_printf(4, "**ph
  arcadeXY=%f,%f,%f, otype %d")` runs every frame for that slot with no flag
  around it. `LIME_printf` is an eight-byte no-op in this build, so it costs
  three float-to-double conversions and a call.
- **Frame id `0x758` is what starts the stage fatality.** It seeds
  `DoSmokesEarthFatal = 0.01f`, and every threshold in `Task_GameMain`'s
  330-tick cutaway counts up from there. The two functions are the two ends of
  one sequence.

The `axes` arm — taken whenever `LIME_Paused` is set or the frame lookup fails —
calls `RenderAxesLines` and `RenderDebugCube`, which are respectively an empty
function and a debug-flag-gated loader in the retail binary. So on a shipped
device that arm draws **nothing**: the object disappears rather than falling
back to a gizmo.
