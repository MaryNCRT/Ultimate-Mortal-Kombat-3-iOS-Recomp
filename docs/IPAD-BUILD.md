# The iPad build, 1.2.56

There is a second retail build: `com.ea.umk3.ipad.bv`, version **1.2.56**,
`UIDeviceFamily [2]`, minimum iOS 3.2. It is reputed to have better graphics and
models than the iPhone release.

**It does not.** This page records the comparison, because "the iPad version
looks better" is the kind of claim that costs a project weeks if nobody checks
it.

---

## Every asset is byte-identical

All 5,092 files under `res/` were hashed in both builds.

| Category | Files | Identical | Different |
|---|---:|---:|---:|
| `.meshset` `.skin` `.bones` `.skinanim` | 692 | **692** | **0** |
| `.pvr` and `.PNG` | 1,783 | **1,783** | **0** |
| everything else | 2,617 | **2,617** | **0** |

No file exists in one build and not the other. The two `res/` trees are the same
397.3 MB down to the byte.

So there are **no higher-poly models and no higher-resolution textures**. The
same art ships to both devices.

### Where the impression probably comes from

Both builds carry 32 `IPAD`-prefixed assets — 27 character portraits and an
`IPAD_GRAVEYARD_LEVEL_SCENE`. The iPad build presumably selects them and the
iPhone build does not.

But measured, they are barely different:

- **The portraits are 128x128 either way**, except for the five whose base is
  64x64 — Endurance, Dummy, and the [hidden tier](HIDDEN-CONTENT.md). So the
  iPad "advantage" is that the hidden characters get a full-resolution portrait.
- **`IPAD_GRAVEYARD_LEVEL_SCENE.meshset` has identical geometry** to the base:
  58 meshes, 2,355 triangles, 3,591 vertices, differing by 305 bytes of names.

Nothing here is worth switching builds for, and both builds contain all of it
already.

---

## Switching would cost the armv6 slice

| | iPhone 1.2.59 | iPad 1.2.56 |
|---|---|---|
| Binary | **FAT: armv6 + armv7** | **thin armv7 only** |
| Size | 5,006,704 | 2,363,680 |
| Symbols / STABS | 29,076 / 21,112 | 29,081 / 21,114 |

The iPad build has **no armv6 slice**. That slice is this project's single most
valuable technical asset: it is the same source compiled without NEON, and it is
the only reason `RenderSkinned.cpp`, the lighting model and the skinning maths
are readable at all — armv7 compiles them to packed NEON that Ghidra
mis-decompiles silently.

The iPad build is also **older**: 1.2.56 against 1.2.59.

**Recommendation: keep the iPhone build as the reference.** Switching gains
nothing measurable and loses the production route.

---

## There is no local two-player mode

The iPad build has two symbols the iPhone lacks:

```
_Touch_Play2P
_LastTouch_Play2P
```

Both are **4 bytes of data**, not code — touch-state variables, matching the
existing `_Touch_PlayMultiPlayer` pair. So the iPad menu appears to have one
extra button.

There is nothing behind it. Every multiplayer function was compared:

| Function | iPhone | iPad |
|---|---:|---:|
| `FE_Task_Multiplayer` | 2,948 | 2,948 |
| `FE_Task_Multiplayer_Versus_Screen` | 3,808 | 3,808 |
| `Task_MultiplayerSync` | 504 | 504 |
| `FE_Task_Multiplayer_Character_Select` | 1,340 | **1,328** |
| the whole `limeMPSession` class | identical | identical |

Same sizes throughout, and the one that differs is **smaller** on iPad. Same
sizes with different bytes is relocation, not logic — branch targets and literal
addresses differ between any two builds.

And the string tables settle it: **no UI text for a local mode exists in either
build.** Searching the 1,386 iPad-only strings for a two-player vocabulary
returns the two symbol names themselves and a pile of false positives on
"Locale".

Both builds use the same `limeMPSession`, which is **GKSession peer-to-peer** —
already documented in [issue #8](../../issues/8). `Touch_Play2P` is most likely
a renamed or abandoned button; there is no local same-device mode to rescue.

---

## What the iPad build *is* good for

**A second fully-symbolised build of the same source.** 29,081 symbols with
21,114 STABS entries, from a different compile of a slightly earlier version.

That makes it usable as a **cross-check**: function boundaries, struct layouts
and call graphs that agree across two independent builds are more trustworthy
than ones seen once. It is worth keeping for that, and for nothing else.

It cannot replace the iPhone build, because it has no armv6.
