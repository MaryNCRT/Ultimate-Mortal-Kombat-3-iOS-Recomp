# Architecture

What the original game is built out of, and how that maps onto the port.

---

## The binary

| Property | Value |
|---|---|
| Format | Mach-O fat binary — armv6 + armv7 |
| Slice used | **armv7** (offset `0x289000`, 2,348,400 bytes) |
| Encryption | **`cryptid = 0`** — no FairPlay DRM |
| Symbols | **not stripped**, 29,076 symbols |
| Debug info | **STABS table intact**, 21,112 entries |
| Functions | **4,342** named |
| Translation units | **135** across 19 directories |
| Instruction set | **100% Thumb** — only 2 ARM functions |
| Calling convention | **AAPCS soft-float** — floats in integer registers |
| Bundle | `com.ea.umk3.bv`, version 1.2.59, minimum iOS 3.0, built with SDK 4.3 |

Original build path, recovered from the binary:

```
/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/
```

### One trap worth knowing

This binary does **not** mark Thumb functions using bit 0 of the symbol value, which is the usual convention. It uses the **`N_ARM_THUMB_DEF` flag (`0x0008`) in `n_desc`**.

Get this wrong and every disassembly comes out as garbage, with no obvious indication why. `tools/macho.py` handles it.

---

## The LIME engine

EA Mobile built this on an in-house engine called **LIME**. The source tree splits cleanly into portable engine, platform layer, game logic, and commercial SDK — which is exactly the seam a port needs.

```
src/
├── lime/
│   ├── common/          109 fn   portable engine        → DECOMPILE
│   └── iphone/          229 fn   iOS platform layer     → REWRITE NATIVELY
│       └── Finch/                OpenAL audio
├── gamecode/            291 fn   game logic             → DECOMPILE
│   └── logic/         2,172 fn   fight state machine    → DECOMPILE
└── EA_SDK/            ~1,412 fn  commerce, social       → DELETE / STUB
    ├── microedition/             Java ME / BREW heritage
    ├── FBConnect/                Facebook
    └── (eamtx, DMG, Social, JSON, TouchXML)
```

### `lime/common` — the portable engine (109 functions)

Platform-independent. This is what gets decompiled first, because it is the smallest self-contained block and nothing renders without it.

| File | Functions | What it does |
|---|---|---|
| `Events.cpp` | 22 | event system |
| `RenderSkinned.cpp` | 20 | skinned/animated mesh rendering |
| `RenderMesh.cpp` | 19 | static mesh loading and rendering |
| `RenderScene.cpp` | 14 | scene graph |
| `Matrix.cpp` | 11 | 4×4 matrix maths |
| `LIMEDS_Misc.cpp` | 8 | miscellaneous |
| `DS_DebugWin.c` | 7 | debug overlay |
| `limeFont.cpp` | 6 | text rendering |
| `limeVector.cpp` | 2 | vector maths |

### `lime/iphone` — the platform layer (229 functions)

**This is not reverse engineered — it is replaced.** These functions talk to iOS, and the port talks to Windows and Linux instead. New code, written from scratch.

| iOS | PC replacement |
|---|---|
| `EAGLView.m`, `UMK3AppDelegate.m` | SDL2 or GLFW: window, main loop, events |
| `ES1Renderer.m` (GL ES 1.1, fixed pipeline) | OpenGL 3.3 core with shaders emulating fixed function |
| `ES2Renderer.m` (GL ES 2.0) | **the better starting point** — already programmable, maps almost 1:1 |
| `Texture2D.m`, `PVRTexture.m` | decode PVRTC → RGBA offline, as a build step |
| `Finch/` (OpenAL, 56 fn) | **Not ours to rewrite.** This is a vendored copy of [zoul/Finch](https://github.com/zoul/Finch), MIT-licensed — use upstream instead of reverse engineering it. See [LIME-ENGINE.md](LIME-ENGINE.md) |
| `GBMusicTrack.m` (AudioToolbox) | dr_mp3 / stb_vorbis / miniaudio |
| touch input (`joy.c`) | keyboard and gamepad mapped to the same button mask |
| `limeLoadFile` | standard file I/O |

Note on renderers: the game ships **both** an ES 1.1 and an ES 2.0 path. For a native port, start from **ES2Renderer** — GL ES 2.0 is already shader-based, so translating to OpenGL 3.3 core is close to mechanical, whereas the ES 1.1 fixed-function pipeline would have to be emulated wholesale.

### `gamecode` — the game (2,463 functions)

`gamecode/` (291 functions) holds `GameCode.cpp`, `Players.cpp`, `Blood.cpp`, `Particles.cpp`, `FrontEnd.cpp`, `achievements.cpp`, `explosion.cpp`, `fatal_HUDgfx.cpp`, `sound.cpp`, `text.cpp`, `training.cpp`.

`gamecode/logic/` (2,172 functions) is the fight engine — a state machine inherited from the arcade original:

| File | Functions | |
|---|---|---|
| `mkdrone.c` | 394 | AI |
| `moves.c` | 357 | move tables |
| `other.c` | 333 | |
| `mkreact.c` | 207 | hit reactions |
| `mkzap.c` | 174 | projectiles |
| `mkfatal.c` | 149 | fatalities |
| `mkboss.c` | 104 | |
| `mkprop.c` | 80 | |
| `joy.c` | 73 | **input — the gamepad hook** |
| `mkanimal.c` | 63 | animalities |
| `mkstat.c` | 62 | |
| `mkslam.c` | 60 | |
| `mkfriend.c` | 45 | friendships |

Note that the per-character files (`a_kano.c`, `a_lk.c`, `a_jax.c` …) contain almost **no functions**. The character-specific behaviour lives in **data** — `moves_data.x` and `frames.x` — not in code. That is good news: it means the fight engine is table-driven, and characters are content rather than logic.

### `EA_SDK` — commercial scaffolding (~1,412 functions)

Store, Facebook, analytics, JSON, XML, social features. **None of it is needed for an offline game.**

Empirically confirmed: running the game under touchHLE with only a single function patched, `Mayhem`, `EASDK_Handler` and the achievement system all initialised without complaint. The commerce layer does not block anything.

Two exceptions must be implemented rather than stubbed:

- **`LocaleManager.mm`** (26 functions) — the game reads it to load text. Stubbing it to nothing breaks localisation.
- **`SystemIPhone.mm`** — `getProperty` feeds `LocaleManager`.

And one rule, learned the hard way: **no stub may call `assert()`.** There are 59 assertions in the binary, all of them in the EA SDK, none in `gamecode` or `lime`. EA's code checks invariants that a port cannot satisfy, and a failed assertion takes the whole process down.

`EA_SDK/microedition/` (`JArray`, `JString`, `DataInputStream`) is a fossil: it shows the game was ported from a **Java ME / BREW** version. That explains why the game logic is so self-contained and has so few platform dependencies — it had already been through one port.

---

## Backend services (all stubbed)

Nothing here is required offline:

| Service | Endpoint |
|---|---|
| EA Synergy | `synergy.eamobile.com`, `sy-tr.eamobile.com` |
| Asset CDN | `cdn.skum.eamobile.com/skumasset/gameasset/` |
| Mayhem analytics | `sngames.eamobile.com/mh`, `cvt.mydas.mobi` |
| Facebook Connect | — |
| GameKit / StoreKit | — |

There is also a hardcoded internal development IP: `10.253.13.208`.

---

## Asset formats

| Format | Status | Notes |
|---|---|---|
| `.meshset` | ✅ **solved and verified** | static geometry, three variants — see [MESHSET-FORMAT.md](MESHSET-FORMAT.md) |
| `.lighting` | ✅ documented | per-vertex lighting byte |
| `.skin` | ✅ **solved and verified** | skinning weights, 29/29 files — see [SKIN-FORMAT.md](SKIN-FORMAT.md) |
| `.bones` | ✅ **solved and verified** | skeleton hierarchy, **29/29** — two variants, 25 and 24 bytes per bone |
| `.skinanim` | ✅ **solved** | skeletal animation, 28/29 (SINDEL open, [issue #2](../../issues/2)) |
| `.scene` | ✅ **solved and verified** | 545/547 files; scene graph nodes + per-object tracks — see [SCENE-FORMAT.md](SCENE-FORMAT.md) |
| `.events` | ✅ **solved and verified** | effect tracks: 268-byte header + N*56 entries — see [EVENTS-FORMAT.md](EVENTS-FORMAT.md) |
| `frames.x`, `moves_data.x` | ⬜ unsolved | animation and move tables |
| `.pvr` | ✅ **measured** | 1,400 files, only PVRTC 2bpp and 4bpp, no mipmaps — see [PVR-FORMAT.md](PVR-FORMAT.md) |

**Every LIME asset format is now solved.** Geometry, skinning weights, skeleton, animation, effect tracks, textures and the scene graph all read correctly against the shipped data. What remains is `frames.x` and `moves_data.x` — and those are *game* data rather than engine data, with [issue #5](../../issues/5) offering a way to recover the move tables without decompiling anything at all.

---

## Key functions

Useful entry points, with addresses in the armv7 slice:

| Function | Address | Why it matters |
|---|---|---|
| `_LIME_LoadMeshSet` | `0x0005ea34` | mesh loading — format verified against it |
| `_CreatePerspectiveMatrix` | `0x0005e0a0` | **the widescreen hook** — `aspect` divides the X term only |
| `LocaleManager::setLocale` | `0x0009e8c0` | **the touchHLE patch point** |
| `_LIME_RenderMesh` | — | static rendering |
| `_LIME_RenderMeshSingleIndexed` | — | |
| `_limeMatrix3x4RotateSkin` | — | skinning transform |
| `joy.c` (73 functions) | — | **the gamepad hook** |

---

## The port, in outline

```
umk3-port/
├── decomp/        verified C recovered from the binary  ← the product
│   ├── lime/          portable engine
│   └── gamecode/      game logic
├── runtime/       hand-written native platform layer
│   ├── platform/      window, input, gamepad, OpenGL, audio
│   └── stubs/         EA_SDK neutralised
├── recompiled/    oracle output — verification only, never shipped
├── tests/         differential tests
└── tools/         asset extraction, run at build time
```

Assets are extracted at build time from the user's own copy. Nothing belonging to EA is ever committed or distributed.
