# Lighting

There is no lighting hardware in play. The engine targets **OpenGL ES 1.1 fixed
function** -- [77 entry points, no shaders anywhere](LIME-ENGINE.md) -- and it
never enables GL lighting. Everything below is computed on the CPU, per vertex,
and handed to GL as vertex colour.

Recovered from the **armv6 slice**, where the same source compiles to plain
scalar VFP. C in [`decomp/lime/RenderSkinned.c`](../decomp/lime/RenderSkinned.c).

---

## The whole model, in one function

`LightVert` (armv6 `0x00083ab8`) is the entire lighting model of the game:

```c
l = 0.0f;                                   /* no ambient */
d = -dot(N, L0);  if (d < 0) d = 0;
l += power0 * pow(d, exp0);
d = -dot(N, L1);  if (d < 0) d = 0;
l += power1 * pow(d, exp1);
if (l > 1.0f) l = 1.0f;
```

**Two directional lights. No ambient. A power falloff on each. Clamped to 1.**

### Three things that are easy to get wrong

**There is no ambient term.** The accumulator starts at a literal `0.0f` --
verified as `0x00000000` at `0x83c00`. A surface facing away from both lights is
fully black, with nothing to lift it.

**The dot product is negated.** `-dot(N, L)` means the stored light vectors
point *from the surface toward the light*, the opposite of the usual convention.
Reimplementing this with the sign the other way lights the model inside out.

**Each light is raised to a power**, through a genuine `libm` `pow()` call --
two of them, per vertex, per frame. On a 2011 iPhone that is a striking choice,
and it is what gives these characters their hard, almost rim-lit falloff rather
than a soft Lambert ramp. A port that substitutes a plain `max(0, dot)` will
look visibly wrong.

### The result is monochrome

`LightVert` returns **one float**, and `DrawSkinnedMesh2` writes it as
`R = G = B` with alpha `0xFF`. Lighting is therefore a **grey multiplier over
the texture** and can never tint. Every colour a character has comes from its
diffuse map.

## The lights themselves, with their actual values

`NormaliseLDirs` (armv6 `0x00083c38`) makes both directions unit length once, at
startup, computing the reciprocal square root in **double** and narrowing to
float -- the same accuracy habit as `CreatePerspectiveMatrix`.

The globals sit in one contiguous block at `0x001bb874`, and these are the
values the binary ships with:

| | direction | exponent | power |
|---|---|---:|---:|
| light 0 | `(68, 462, 247)` | 0.8 | **0.0** |
| light 1 | `(0, -300, -50)` | 3.5 | 2.0 |

Two things fall out. The directions are **not unit length** -- they are authored
in world units, like positions, which is exactly why `NormaliseLDirs` has to
exist. And **light 0 ships with a power of zero**, so as initialised it
contributes nothing: only light 1 is doing any work. Either the second light is
switched on at runtime or it is a disabled experiment; the initialiser alone
cannot tell them apart.

There are no point lights, no spot lights and no attenuation.

## Shadows: one drop shadow, and nothing else

The engine has no shadow volumes, no shadow maps and no projected-texture
shadows -- there is not a single shadow texture or shadow mesh in the game's
assets. What it does have is a **single character drop shadow**, and the
evidence is three separate traces:

- **`Shadow HeightFrom Ground`** -- an entry in the in-game debug menu, sitting
  between the camera margin tweakables. So the shadow's height above the floor
  is a tuned constant someone was adjusting live.
- **`_ShadowOffset`** -- a global named alongside `_SceneX`, `_SceneY`,
  `_SceneZ`, `_SceneScale` and `_CamTrackToPlayer`, i.e. in the scene placement
  family.
- **`_clear_shadow_bit`** (`0x00054f60`, `gamecode/logic/other.c`) -- a
  per-player state flag, in the same family as `_set_inviso`, `_half_damage`,
  `_set_quarter_damage` and `_set_noscroll`. So a fighter can have its shadow
  turned off as a gameplay state, not just a rendering one.

With no shadow asset anywhere, the shadow is drawn procedurally -- most likely a
flattened copy of the character projected to a fixed ground height, which is
what "height from ground" as the only tunable implies.

## `.lighting`: baked per-vertex light, still encoded

Thirteen `.lighting` files ship, one per character and covering only 13 of the
29 -- consistent with the palette-swap characters sharing a rig and therefore a
bake.

Their sizes scale with **vertices x animation frames**, at roughly 1.3 to 2.0
bytes each:

| Character | bytes | verts | frames | bytes per vertex-frame |
|---|---:|---:|---:|---:|
| Ermac | 919,240 | 1,292 | 356 | 1.999 |
| Scorpion | 869,768 | 1,278 | 344 | 1.978 |
| Liu Kang | 568,856 | 829 | 347 | 1.978 |
| Shao Kahn | 282,310 | 1,797 | 122 | 1.288 |

That is the shape of **precomputed per-vertex lighting for every frame of
animation** -- a prelight bake. The ratio is not constant, so there is a header,
padding, or compression involved.

**The encoding is not decoded.** The bytes are heavily skewed -- 62% zeros, 7%
`0xFF`, with small values dominating the remainder and all 256 present -- which
looks like delta coding or a simple compression rather than a flat array. Saying
more than that would be guessing.

If the bake is what it appears to be, then `LightVert` is the *fallback* path
and most characters are lit from the table instead. Establishing which runs when
means decompiling the loader, and is the natural next step here.

## Where else lighting shows up

- **`.lighting` files** ship next to `.meshset`s and are documented in
  [MESHSET-FORMAT.md](MESHSET-FORMAT.md). They are per-mesh, and the loader
  reads them alongside geometry.
- **`IsTextureFullBright`** and `IsTextureFullBrightPath` in `RenderMesh.cpp`
  mark textures that bypass shading entirely -- the fixed-function equivalent of
  an unlit material. Not yet decompiled.
- **`CreateFadedLookupTable`** and `CreateFadedRGBS` in the same file build a
  precomputed fade ramp. Not yet decompiled, and the obvious next thing to read.
- **`glShadeModel`** appears once, in `RenderMesh.cpp`, so smooth versus flat
  shading is selected per draw.

## What this means for the port

The good news for a native rewrite is that **none of this needs a shader to
reproduce**, and none of it depends on fixed-function GL lighting. It is
arithmetic over a normal, and it can be lifted verbatim into a vertex shader or
kept on the CPU exactly as it is.

The trap is the two unusual choices above -- the negated dot and the `pow()`
falloff. Both are the kind of thing a reimplementation tidies away by accident,
and both change how every character in the game looks.
