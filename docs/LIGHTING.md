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

## The lights themselves

`NormaliseLDirs` (armv6 `0x00083c38`) makes both directions unit length once, at
startup, computing the reciprocal square root in **double** and narrowing to
float -- the same accuracy habit as `CreatePerspectiveMatrix`.

There are exactly two, held as six global floats. No point lights, no spot
lights, no attenuation, and **no shadows of any kind**: no shadow term, no
shadow volume, no projected blob anywhere in the engine.

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
