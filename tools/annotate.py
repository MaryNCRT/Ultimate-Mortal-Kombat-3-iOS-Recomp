#!/usr/bin/env python3
"""
annotate.py -- disassemble a function with everything resolved.

Raw disassembly of this binary is unreadable in three separate ways, and each
needs a different lookup:

  1. `bl #0x127974`          an import stub      -> tools/stubs.py has the name
  2. `ldr r0, [pc, #0x2c]`   a literal pool      -> read the four bytes
  3. `ldr r0, [pc, #N]` then `add r0, pc, r0`    -> a PC-RELATIVE ADDRESS, and
                                                    often a string

The third is the one that has cost this project the most. A value like
`0x000bca2c` printed next to a `glActiveTexture` call looks like a GL enum and
is not -- it is half of an address computation, and reading it as a constant is
how a wrong number gets written into a comment. Conversely a plain literal like
`0x8074` really is `GL_VERTEX_ARRAY`, and refusing to name it because the other
kind exists loses information that is there.

This tool tells the two apart by looking at the instruction that follows.

    python tools/annotate.py OUTPUT/armv6/UMK3.armv6 _LIME_RenderMeshSingle
    python tools/annotate.py OUTPUT/armv6/UMK3.armv6 _limeDrawFONT --calls

`--calls` prints only the call sequence, which is usually what you want first.

## One thing this tool cannot do for you

It annotates each instruction where it stands. It does **not** pair a literal
with the call that consumes it, because the compiler interleaves them: in
`LIME_RenderMeshSingle` a `GL_VERTEX_ARRAY` is loaded immediately before a
`glClientActiveTexture`, which does not take that enum. The value belongs to a
later call and the register was simply free.

So read the annotations as "these constants appear in this function", not as
"this call takes this argument". Getting that wrong writes a confident and
false comment, which is the failure mode this whole project is built to avoid.
"""
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(HERE, "..", "OUTPUT", "tools"))
import macho  # noqa: E402

DISASM = os.path.join(HERE, "disasm.py")
if not os.path.isfile(DISASM):
    DISASM = os.path.join(HERE, "..", "OUTPUT", "tools", "disasm.py")

VA_BASE = 0x1000        # vmaddr = file offset + 0x1000 in the extracted slices

# The GL ES 1.1 enums this engine actually uses. Only names that appear in the
# binary's own import list are here -- a constant is named when it is one of
# these and left as a number otherwise.
GL_ENUMS = {
    0x0004: "GL_TRIANGLES",      0x0405: "GL_BACK",
    0x0b44: "GL_CULL_FACE",      0x0b71: "GL_DEPTH_TEST",
    0x0de1: "GL_TEXTURE_2D",     0x1400: "GL_BYTE",
    0x1401: "GL_UNSIGNED_BYTE",  0x1402: "GL_SHORT",
    0x1403: "GL_UNSIGNED_SHORT", 0x1406: "GL_FLOAT",
    0x1700: "GL_MODELVIEW",      0x1701: "GL_PROJECTION",
    0x1702: "GL_TEXTURE",        0x1d00: "GL_SMOOTH",
    0x1d01: "GL_FLAT",           0x2100: "GL_MODULATE",
    0x2200: "GL_TEXTURE_ENV_MODE", 0x2300: "GL_TEXTURE_ENV",
    0x8074: "GL_VERTEX_ARRAY",   0x8075: "GL_NORMAL_ARRAY",
    0x8076: "GL_COLOR_ARRAY",    0x8078: "GL_TEXTURE_COORD_ARRAY",
    0x84c0: "GL_TEXTURE0",       0x84c1: "GL_TEXTURE1",
    0x84c2: "GL_TEXTURE2",
}


def load(path):
    with open(path, "rb") as fh:
        data = fh.read()
    return data, macho.MachO(data).stub_map()


def read_u32(data, va):
    off = va - VA_BASE
    if off < 0 or off + 4 > len(data):
        return None
    return int.from_bytes(data[off:off + 4], "little")


def read_cstr(data, va, limit=72):
    off = va - VA_BASE
    if off < 0 or off >= len(data):
        return None
    out = []
    while off < len(data) and len(out) < limit:
        b = data[off]
        if b == 0:
            break
        if b < 0x20 or b > 0x7E:
            return None
        out.append(chr(b))
        off += 1
    return "".join(out) if len(out) >= 3 else None


def resolve_symbol(name):
    """Accept a plain C name and find its mangled form in the symbol table."""
    path = os.environ.get("UMK3_SYMBOLS") or os.path.join(
        os.path.dirname(HERE), "work", "symbols.txt")
    if not os.path.isfile(path):
        return name
    want = name.lstrip("_")
    best = None
    with open(path, encoding="utf-8", errors="ignore") as fh:
        for line in fh:
            p = line.split()
            if len(p) < 2:
                continue
            sym = p[-1]
            s2 = sym.lstrip("_")
            m = re.match(r"Z(\d+)(.*)", s2)
            plain = m.group(2)[:int(m.group(1))] if m else s2
            if plain == want:
                best = sym
                if m:
                    break
    return best or name


def annotate(binary, func, calls_only=False):
    data, stubs = load(binary)
    func = resolve_symbol(func)
    out = subprocess.run([sys.executable, DISASM, binary, func],
                         capture_output=True, text=True).stdout.splitlines()
    if not out:
        raise SystemExit("no disassembly for %s" % func)

    print(out[0])
    lines = out[1:]

    # pending[register] = the literal value it was just loaded with, so the next
    # instruction can say whether it was an address or a constant
    pending = {}

    for i, line in enumerate(lines):
        note = ""

        m = re.search(r"\bbl\s+#0x([0-9a-f]+)", line)
        if m and "->" not in line:      # disasm already names some
            name = stubs.get(int(m.group(1), 16))
            if name:
                note = name

        m = re.search(r"\bldr\s+(\w+), \[pc, #(?:0x)?([0-9a-fx]+)\]\s*;\s*=0x([0-9a-f]+)", line)
        if m:
            reg, val = m.group(1), int(m.group(3), 16)
            nxt = lines[i + 1] if i + 1 < len(lines) else ""
            if re.search(r"\badd\s+%s, pc, %s\b" % (reg, reg), nxt):
                # a PC-relative ADDRESS, not a constant
                pcm = re.match(r"\s*0x([0-9a-f]+)", nxt)
                if pcm:
                    target = (int(pcm.group(1), 16) + 8 + val) & 0xFFFFFFFF
                    text = read_cstr(data, target)
                    note = "ADDRESS 0x%08x%s" % (target, (' "%s"' % text) if text else "")
            elif val in GL_ENUMS:
                note = GL_ENUMS[val]
            elif val < 0x10000:
                note = "constant %d" % val
            pending[reg] = val

        m = re.search(r"\b(?:mov|movw)\s+(\w+), #(?:0x)?([0-9a-f]+)", line)
        if m:
            val = int(m.group(2), 16)
            if val in GL_ENUMS:
                note = GL_ENUMS[val]

        if calls_only and "bl " not in line and not note:
            continue
        print(line.rstrip() + (("   ; " + note) if note else ""))


def main(argv):
    if len(argv) < 3:
        print(__doc__.strip())
        return 1
    annotate(argv[1], argv[2], "--calls" in argv[3:])
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
