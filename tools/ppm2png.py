#!/usr/bin/env python3
"""ppm2png -- convert the demo's binary PPM screenshots to PNG.

Pure stdlib (zlib + struct), so it works without Pillow. The demo writes P6
because that is four lines of C; PNG is what anybody actually wants to look at.

    python tools/ppm2png.py shot.ppm shot.png
"""
import struct, sys, zlib


def read_ppm(path):
    d = open(path, "rb").read()
    if d[:2] != b"P6":
        raise SystemExit("not a P6 PPM: %s" % path)
    vals, i = [], 2
    while len(vals) < 3:
        while i < len(d) and d[i:i + 1].isspace():
            i += 1
        if d[i:i + 1] == b"#":
            while i < len(d) and d[i] != 0x0A:
                i += 1
            continue
        j = i
        while j < len(d) and not d[j:j + 1].isspace():
            j += 1
        vals.append(int(d[i:j]))
        i = j
    w, h, maxv = vals
    if maxv != 255:
        raise SystemExit("only 8-bit PPM supported (maxval=%d)" % maxv)
    return w, h, d[i + 1:i + 1 + w * h * 3]


def write_png(path, w, h, rgb):
    raw = b"".join(b"\x00" + rgb[y * w * 3:(y + 1) * w * 3] for y in range(h))

    def chunk(tag, data):
        c = tag + data
        return struct.pack(">I", len(data)) + c + struct.pack(">I", zlib.crc32(c))

    png = (b"\x89PNG\r\n\x1a\n"
           + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0))
           + chunk(b"IDAT", zlib.compress(raw, 6))
           + chunk(b"IEND", b""))
    open(path, "wb").write(png)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit(__doc__)
    W, H, RGB = read_ppm(sys.argv[1])
    write_png(sys.argv[2], W, H, RGB)
    print("%s  %dx%d" % (sys.argv[2], W, H))
