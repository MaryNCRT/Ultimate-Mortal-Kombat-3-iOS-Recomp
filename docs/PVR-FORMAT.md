# `.pvr` textures

1,400 files, and the format is narrower than "PVR" suggests. Measured across
every one of them, not assumed.

## What the game actually ships

| | |
|---|---:|
| Valid PVR files | **1,400 of 1,400** |
| PVRTC **2bpp** | 725 (51.8%) |
| PVRTC **4bpp** | 675 (48.2%) |
| Any other pixel format | **none** |
| Mipmap levels | **0 — every file** |
| Non-power-of-two dimensions | **none** |
| With alpha | 320 |

Dimensions are 256×256 (784), 512×512 (268), 128×128 (157), 1024×1024 (153),
and a handful of 64×64 and 32×32. All square, all power of two.

## Header

The **legacy PVR v2** container — 52-byte header, `PVR!` tag — not the PVR v3
format that modern tooling defaults to:

```c
uint32 headerLength;   /* 52 */
uint32 height, width;
uint32 numMipmaps;     /* always 0 here */
uint32 flags;          /* low byte is the pixel format: 24 = PVRTC2, 25 = PVRTC4 */
uint32 dataLength;
uint32 bitsPerPixel;   /* 2 or 4 */
uint32 bitmaskRed, bitmaskGreen, bitmaskBlue, bitmaskAlpha;
uint32 pvrTag;         /* 'PVR!' = 0x21525650 */
uint32 numSurfs;       /* 1 */
```

## What this means for the port

**The decoder is a small, closed job.** Not "support PVR" — implement PVRTC1
at 2bpp and 4bpp, square, power-of-two, single surface, no mipmaps. Nothing in
the shipped data needs anything else, so anything else can be rejected loudly
rather than guessed at.

**It has to be a CPU decoder.** PVRTC is a PowerVR hardware format; desktop
GPUs do not have the extension. This is exactly what fails inside touchHLE —
`glError 0x0500`/`0x0503` on compressed texture upload, the cause of the
babality model sometimes not drawing. Decoding on the CPU and uploading plain
RGBA sidesteps it entirely.

**Zero mipmaps is a decision to inherit or overturn deliberately.** The
original shipped none, presumably to save space on a 2011 device. A PC port can
generate them at load time and will look better in motion for it — but that is
a change from the original, and worth being explicit about rather than silently
doing.

## Tooling: Noesis

**[Noesis](https://richwhitehouse.com/index.php?content=inc_projects.php&showproject=91)**
by Rich Whitehouse converts these to ordinary image formats, and is what
[ermaccer's write-up](https://ermaccer.github.io/posts/umk3iosmeshsettool/)
recommends alongside its `.meshset` converter — drag the mesh onto the tool,
convert the textures with Noesis.

Use it. It is the fastest way to see what the game's texture data actually is,
and it batch-converts, so the whole 1,400-file set can be turned into PNGs in
one pass.

### And it is the oracle for our own decoder

This is the more valuable use, and it is the method this project already runs
on everywhere else: **two independent paths from the same data, accepted only
when they agree.**

1. Convert a `.pvr` with Noesis → reference PNG.
2. Decode the same `.pvr` with our own PVRTC decoder → our RGBA.
3. Compare pixel by pixel.

PVRTC is a lossy block format with non-obvious interpolation between block
corners, so "it looks about right" is exactly the kind of judgement that hides
a bug for a year. A per-pixel diff against an independent implementation turns
that into a number. 1,400 files, two bit depths, 320 of them with alpha — that
is a real corpus, not a smoke test.

Noesis also scripts in Python, so the reference pass can be automated rather
than done by hand.

### One limit worth stating

Noesis is closed-source, Windows-only freeware with no stated licence, so it is
a **development tool, not a dependency**: it cannot be redistributed with the
port or embedded in a build. The PVRTC format is publicly documented by
Imagination Technologies and the decoder we ship has to be ours. That is a
statement about what goes in the repository, not a reason to avoid the tool —
the same way Ghidra is essential here and ships with nothing.

---

## Block geometry — verified

`python tools/pvr.py validate <app dir>` → **1,400 of 1,400 exact, 0
mismatches.**

PVRTC1 packs pixels into 8-byte blocks — 4×4 pixels at 4bpp, 8×4 at 2bpp — so
the compressed payload must be exactly

```
ceil(width / bw) * ceil(height / bh) * 8
```

and the header's own `dataLength` has to agree. It does, for every file, at
both bit depths. The file also carries at least the payload it declares in
every case.

That is the same standard `.meshset` and `.skin` were held to: the arithmetic
comes out exact across the whole corpus rather than approximately right on most
of it. **A decoder can now be built on this block layout without wondering
whether the layout is the bug.**

`tools/pvr.py` deliberately stops here. It reads headers and establishes
geometry; it does not decode pixels, because decoding is the part that needs an
independent reference and there is nothing yet to check against.
