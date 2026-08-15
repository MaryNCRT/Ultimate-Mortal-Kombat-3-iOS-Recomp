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

## Tooling

**[Noesis](https://richwhitehouse.com/index.php?content=inc_projects.php&showproject=91)**
by Rich Whitehouse previews and converts these, and is what
[ermaccer's mesh tool write-up](https://ermaccer.github.io/posts/umk3iosmeshsettool/)
recommends for the textures alongside its `.meshset` converter.

Useful for looking at the data. **Not usable in the port**: it is closed-source
Windows-only freeware with no stated licence, so it cannot be redistributed,
embedded, or ported. Treat it the way this project treats
[GBMusicTrack](LIME-ENGINE.md) — a reason to understand the data quickly, not a
licence to ship someone else's work.

The PVRTC format itself is documented publicly by Imagination Technologies, and
the decoder is ours to write.
