#!/usr/bin/env python3
"""dumpfn.py -- disassemble functions by NAME, several at a time.

`disasm_range.py` takes a start and an end, which is the right shape for
studying one function and the wrong one for working through two thousand. This
takes names, finds each in the function table, works out where it ends from the
next symbol, and prints them one after another.

    python tools/dumpfn.py q_yes q_no stuff_buttons
    python tools/dumpfn.py --file other.c --max 24 --count 12

`--file` with `--max` takes the next unwritten functions of one translation
unit under a size, smallest first: the same order `pending.py` reports, so the
two agree about what is next.

Branch targets inside a function are left as addresses; targets OUTSIDE it are
resolved to the symbol they land on, because a `bl` to a name is the single
most useful thing on the screen when reading one of these. That is also what
makes the wrapper shapes obvious -- half of gamecode/logic is a two-instruction
function whose whole content is which name it calls.
"""

import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FUNCS = os.environ.get("UMK3_FUNCS",
                       "E:/MK3 PROJECT/OUTPUT/func-to-file.txt")
BINARY = os.environ.get("UMK3_BINARY",
                        "E:/MK3 PROJECT/OUTPUT/armv7/UMK3.armv7")


def table():
    """[(address, symbol, source path)], sorted, plus the lookups over it."""
    rows = []
    for line in open(FUNCS, encoding="utf-8", errors="replace"):
        m = re.match(r"(0x[0-9a-f]+)\s+(\S+)\s+(\S+)", line)
        if m:
            rows.append((int(m.group(1), 16), m.group(2), m.group(3)))
    rows.sort()
    return rows


def plain(sym):
    """The source-level name behind a Mach-O symbol."""
    b = sym.lstrip("_")
    m = re.match(r"^Z(\d+)(.*)$", b)
    return m.group(2)[:int(m.group(1))] if m else b


def written():
    """Every function name the decomp already defines."""
    import glob
    pat = re.compile(r'^[A-Za-z_][\w \*]*?\**\s*(\w+)\s*\([^;{}]*\)\s*\{', re.M)
    done = set()
    for path in glob.glob(os.path.join(ROOT, "decomp", "**", "*.c"),
                          recursive=True):
        for n in pat.findall(open(path, encoding="utf-8",
                                  errors="replace").read()):
            done.add(n)
            done.add(n.lstrip("_"))
    return done


def disasm(start, end):
    out = subprocess.run(
        [sys.executable, os.path.join(ROOT, "tools", "disasm_range.py"),
         BINARY, hex(start), hex(end)],
        capture_output=True, text=True)
    return out.stdout


def main(argv):
    rows = table()
    by_name = {}
    for i, (addr, sym, path) in enumerate(rows):
        end = rows[i + 1][0] if i + 1 < len(rows) else addr + 64
        by_name.setdefault(plain(sym), (addr, end, path))

    args = argv[1:]
    want = []
    if "--file" in args:
        src = args[args.index("--file") + 1]
        cap = int(args[args.index("--max") + 1]) if "--max" in args else 9999
        count = int(args[args.index("--count") + 1]) if "--count" in args else 12
        done = written()
        cands = []
        for name, (addr, end, path) in by_name.items():
            if os.path.basename(path) != src or name in done:
                continue
            if end - addr <= cap:
                cands.append((end - addr, name))
        cands.sort()
        want = [n for _, n in cands[:count]]
    else:
        want = [a for a in args if not a.startswith("--")]

    # Every address that is a function start, so a bl can be given its name.
    starts = dict((addr, plain(sym)) for addr, sym, _ in rows)

    for name in want:
        if name not in by_name:
            print("?? %s -- not in the function table\n" % name)
            continue
        addr, end, path = by_name[name]
        print("=" * 68)
        print("%s   0x%08x   %d bytes   %s"
              % (name, addr, end - addr, os.path.basename(path)))
        print("=" * 68)
        for line in disasm(addr, end).rstrip("\n").split("\n"):
            m = re.search(r"\b(?:bl|b|blx|bne|beq|bgt|blt|bge|ble)\s+#(0x[0-9a-f]+)",
                          line)
            if m:
                target = int(m.group(1), 16)
                if not (addr <= target < end) and target in starts:
                    line += "        ; %s" % starts[target]
            print(line)
        print()
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
