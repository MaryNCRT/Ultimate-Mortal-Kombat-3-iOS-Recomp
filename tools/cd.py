#!/usr/bin/env python3
"""cd.py -- compact annotated disassembly for hand transcription.

    python tools/cd.py fn [fn ...]

Like dumpfn.py but terse, with every pc-relative literal resolved: the value of
`ldr rX, [pc, #k]` is read from the image (Thumb alignment: Align(addr+4,4)+k),
and a following `add rX, pc` turns it into the address it points at, which is
then named from the symbol table -- a function, a global, or a __DATA pointer
slot (shown as `slot -> name`, the name of what the slot holds).

The point is tokens: one line per instruction, no addresses beyond the low five
hex digits, no blank lines, no literal-pool junk after the function's end.
"""
import os
import re
import struct
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import umk3paths  # noqa: E402

_DATA = None
_SYM = None


def image():
    global _DATA
    if _DATA is None:
        _DATA = open(umk3paths.require_slice(), "rb").read()
    return _DATA


def rd(a):
    d = image()
    return struct.unpack("<I", d[a - 0x1000:a - 0x1000 + 4])[0]


def symbols():
    global _SYM
    if _SYM is None:
        _SYM = {}
        path = os.path.join(HERE, "..", "work", "symbols.txt")
        for ln in open(path, encoding="utf-8", errors="replace"):
            p = ln.split()
            if len(p) >= 5 and p[1] == "SECT":
                _SYM.setdefault(int(p[0], 16), p[-1].lstrip("_"))
    return _SYM


def name_of(a):
    s = symbols()
    if a in s:
        return s[a]
    if (a & ~1) in s:
        return s[a & ~1]
    if (a - 1) in s:
        return s[a - 1]
    return None


def describe(a):
    n = name_of(a)
    if n:
        return n
    if 0xf0000 <= a < 0x100000:
        v = rd(a)
        return "slot->%s" % (name_of(v) or hex(v))
    return hex(a)


def main(argv):
    for fn in argv[1:]:
        out = subprocess.run([sys.executable, os.path.join(HERE, "dumpfn.py"), fn],
                             capture_output=True, text=True).stdout.split("\n")
        head = [l for l in out if "bytes" in l][:1]
        print("== " + (head[0].split("  ")[0] + " " + " ".join(head[0].split()[1:3]) if head else fn))
        pend = {}                       # reg -> literal value
        hm = re.search(r"0x([0-9a-f]+)\s+(\d+) bytes", " ".join(head))
        end = int(hm.group(1), 16) + int(hm.group(2)) if hm else 1 << 40
        for l in out:
            m = re.match(r"0x([0-9a-f]+)\s+(\S+)\s*(.*)", l)
            if not m:
                continue
            a, mn, ops = int(m.group(1), 16), m.group(2), m.group(3).split(";")[0].rstrip()
            if a >= end:
                break
            note = ""
            lm = re.match(r"(\w+), \[pc, #(0x[0-9a-f]+|\d+)\]", ops)
            if mn.startswith("ldr") and lm:
                lit = ((a + 4) & ~3) + int(lm.group(2), 0)
                v = rd(lit)
                pend[lm.group(1)] = v
                note = "= 0x%x" % v
            am = re.match(r"(\w+), pc$", ops)
            if mn == "add" and am and am.group(1) in pend:
                tgt = (pend[am.group(1)] + a + 4) & 0xffffffff
                note = "-> " + describe(tgt)
            if mn.startswith("bl") and ";" in l:
                note = l.split(";")[1].strip()
                ops = ops.split("#")[0] + "#" + ops.split("#")[-1] if "#" in ops else ops
            print("%05x %s %s%s" % (a & 0xfffff, mn, ops, ("   ; " + note) if note else ""))
            if mn in ("bx", "pop") and "lr" in ops + "pc" and False:
                ended = True
        print()


if __name__ == "__main__":
    main(sys.argv)
