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

---

## The oracle was in the bundle

The plan was to convert with Noesis and diff against that. It turned out not to
be needed: **the game ships 38 textures twice**, as `NAME.PNG` *and*
`NAME.pvr`. The PNG is the uncompressed source the PVR was built from — a
reference implementation that costs nothing, needs no download, and is EA's own
data rather than a third party's reading of it.

`tools/pvrtc_diff.py` compares the decoder's output against those PNGs channel
by channel. PVRTC is lossy, so a correct decoder will not score zero, but it
should land within a few units out of 255.

## Current decoder status: **5.5% error — better, still wrong**

`tools/pvrtc.py` decodes all 1,400 textures without error, to the right
dimensions, producing plausible-looking images. Against the reference it scores:

| round | mean error | what changed |
|---|---:|---|
| first version | 48.42 / 255 (19.0%) | — |
| colour B extraction | 31.18 (12.2%) | B is the **low 16 bits, unshifted** — the modulation flag shares bit 0 with blue's LSB rather than displacing the field |
| blend direction | **14.06 (5.5%)** | the modulation weight runs the other way: `w=0` selects one endpoint, not the other |

Ruled out by measurement rather than reasoning: **Morton order is correct**
(the alternative bit interleave scores 68.78, twice as bad), column-major
modulation indexing is worse (17.37), an alternate 2bpp index is neutral
(14.09), and swapping the endpoint *extraction* instead of the blend is much
worse (31.26).

**5.5% is close enough to look right and far enough to be wrong.** PVRTC is
lossy, but a correct decoder should land lower. The decoder stays committed and
clearly marked, because its container handling and block geometry are verified
and worth keeping — but it produces nothing usable yet.

This is the project's method doing exactly what it is for. The decoder compiled,
ran over the whole corpus, and produced images that look like textures. Judged
by eye it would have passed. The reference says otherwise.

### The error is not spread evenly — it is all in 4bpp

Breaking the diff down per texture is what turned guessing into a bounded
problem:

| | pairs | mean error | range |
|---|---:|---:|---|
| **PVRTC 2bpp** | 2 | **1.78** | 1.72 – 1.84 |
| **PVRTC 4bpp** | 11 | **16.30** | 5.69 – 75.17 |

**1.78 is compression loss.** The 2bpp path is, on this evidence, essentially
correct. Everything wrong is in 4bpp — and the worst case by far, `FE_METAL_BG`
at 75.17, is the only 4bpp texture *without* alpha.

The seven `FE_MAINLOGO_*` variants all score exactly 5.69, which is consistent:
same artwork, different lettering.

**Caveat that matters.** Only two of the thirteen comparable pairs are 2bpp, and
both are `VORTEX1`/`VORTEX2` — smooth swirling gradients, which are exactly the
kind of image that hides interpolation error. "2bpp is correct" is a hypothesis
resting on two forgiving samples, not a result.

### Eliminated by measurement — do not re-try these

Every one of these was tested against the corpus and scored *worse* than the
current code:

| Hypothesis | Score | vs 14.06 baseline |
|---|---:|---|
| Morton order with x in the low bit | 68.78 | far worse |
| Endpoint extraction swapped (instead of the blend) | 31.26 | worse |
| Column-major modulation indexing | 17.37 | worse |
| Bilinear with no half-block offset | 17.80 | worse |
| Bilinear offset `+bw/2` | 23.95 | worse |
| Bilinear offset `-bw/2 + 0.5px` | 14.58 | worse |
| Endpoint A blue as bits 0-3 | 15.54 | worse |
| A blue 0-3 and translucent blue 0-2 | 15.81 | worse |
| Modulation weights reversed | 36.43 | far worse |
| `3/8` and `5/8` swapped | 17.02 | worse |
| No special punch-through mode | 16.33 | neutral |
| Modulation rows reversed | 20.33 | worse |
| Modulation columns reversed | 20.21 | worse |
| Both reversed / full reverse | 22.62 | worse |
| 2bpp alternate bit index | 14.09 | neutral |

That is Morton order, endpoint colour unpacking, the bilinear offset
convention, the modulation weight table and the modulation bit ordering — all
**confirmed correct as written**, by being worse every other way.

### Where the error sits inside a block: nowhere in particular

Averaging the absolute error by position *within* the 4×4 block:

```
FE_METAL_BG          FE_MAINLOGO_EN        VORTEX1 (2bpp, 8×4)
 74.8 74.8 74.8 74.8   6.3 6.1 5.6 5.9      2.3 1.5 1.8 1.7 2.1 1.8 1.8 1.5
 75.2 75.2 75.3 75.3   5.9 5.9 5.3 5.6      1.8 1.5 2.0 1.7 2.0 1.7 1.8 1.5
 75.4 75.5 75.5 75.5   5.4 5.3 4.8 5.0      1.9 1.7 2.0 2.0 2.4 2.1 2.0 1.7
 75.1 75.1 75.2 75.2   6.3 6.2 5.6 6.0      1.8 1.5 2.0 1.7 2.1 1.7 1.8 1.5
```

**Flat.** A bug in the modulation bit ordering would scramble positions within
the block and show as a lumpy grid; a bug in the interpolation would show edges
differing from centres. Neither appears. That is independent confirmation of the
two eliminations above, arrived at by a different route.

### The pipeline can be exact

`FE_MAINLOGO_EN` returns deltas of **(0, 0, 0)** on many pixels — pixel-perfect,
not merely close. Those are the areas where a block's two endpoints are equal
(both `0xFFF` white), so no interpolation or modulation is needed to reach the
answer.

`FE_METAL_BG`'s deltas, by contrast, run in **both directions** — −34, +42, −29,
+22 — which is not a systematic bias in colour expansion. A wrong bit width
would push every pixel the same way.

**So the container, block layout, Morton order and endpoint unpacking deliver
exact pixels when nothing has to be blended.** The failure is specifically in
combining two *differing* endpoints — the interpolation, the modulation weight,
or which blocks the endpoints are gathered from.

One marginal gain kept from this round: endpoint A's blue read as 5 bits
(0–4) rather than 4 bits (1–4) scores 14.00 against 14.06. Real but tiny, and
not the bug.

### What is actually left

The endpoint, Morton and interpolation code is **shared** between 2bpp and
4bpp, and 2bpp scores 1.78 with it. So either that shared code is right and
something 4bpp-specific is wrong, or the two 2bpp samples are too smooth to
expose a shared error.

Distinguishing those two is the next step, and it is cheap: **find more 2bpp
pairs**, or synthesise a test — encode a known sharp image and round-trip it.
Until that is settled, further blind variation is wasted effort. Five rounds of
it produced nothing but a well-mapped set of dead ends.

The 25 `*_VERSUS` pairs could not be compared at all: the PNG is 512×512 and
the PVR 256×256, so those are different assets rather than the same one
compressed, and the diff correctly refuses to compare them.
