"""Honest progress count for lime/common.

A function counts as done only if decomp/lime/ holds a real body for it.

## How a symbol is matched to a C function

By its **Itanium length prefix**, not by trimming type codes off the end.
`__Z36CreateMatrixPaletteForGeneratingMeshPclllfP9BONESINFO` says the identifier
is 36 characters long, so it is exactly `CreateMatrixPaletteForGeneratingMesh`
and everything after it is argument encoding. That is unambiguous.

The earlier version guessed instead, stripping suffixes with a regexp, and it
mismatched anything whose type codes it had not anticipated -- `Pclllf` and
`PhPcfl11limeVECTOR3` among them. It undercounted by two. An older variant of
the same bug undercounted by seven and put three wrong figures in the README.

## What is deliberately excluded

  lime_unimplemented.c  -- bodies that only call abort(). They exist so the
                           linker is satisfied; counting them reports work that
                           has not been done. This script counted them once and
                           jumped from 88 to 93 with nothing written, which is
                           the failure the ENCARGO warns about.
  lime_globals.c        -- data, not functions.

Reads work/func-to-file.txt, or UMK3_FUNC_TO_FILE if that is set.
"""
import collections
import io
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

EXCLUDE = {"lime_unimplemented.c", "lime_globals.c"}

FUNC_TO_FILE = (os.environ.get("UMK3_FUNC_TO_FILE")
                or os.path.join("work", "func-to-file.txt"))


def plain_name(sym):
    """Recover the C identifier from a symbol, mangled or not."""
    s = sym.lstrip("_")
    m = re.match(r"Z(\d+)(.*)", s)
    if m:                                   # C++: the length prefix is exact
        return m.group(2)[:int(m.group(1))]
    return s                                # C: already plain


def defined_functions():
    names = set()
    for fn in sorted(os.listdir(os.path.join("decomp", "lime"))):
        if not fn.endswith(".c") or fn in EXCLUDE:
            continue
        text = io.open(os.path.join("decomp", "lime", fn),
                       encoding="utf-8", errors="ignore").read()
        names |= set(re.findall(
            r'^[A-Za-z_][\w \*]*?\**\s*(\w+)\s*\([^;]*\)\s*\{', text, re.M))
    return names


def main():
    if not os.path.isfile(FUNC_TO_FILE):
        raise SystemExit("func-to-file.txt not found: %s\n"
                         "Set UMK3_FUNC_TO_FILE or put a copy in work/."
                         % FUNC_TO_FILE)

    rows = []
    for line in io.open(FUNC_TO_FILE, encoding="utf-8", errors="ignore"):
        p = line.split()
        if len(p) < 3 or not p[0].startswith("0x") or "/lime/common/" not in p[2]:
            continue
        rows.append((plain_name(p[1]),
                     p[2].replace("\\", "/").rsplit("/", 1)[-1]))

    defined = defined_functions()

    by = collections.defaultdict(lambda: [0, 0])
    for name, src in rows:
        by[src][0] += 1
        if name in defined:
            by[src][1] += 1

    total = done = 0
    for src in sorted(by):
        n, k = by[src]
        total += n
        done += k
        print("  %-22s %2d/%-2d" % (src, k, n))

    pc = round(100 * done / total)
    print("\n  lime/common: %d/%d = %d%%" % (done, total, pc))

    # the eight blocks the README bars track, in its order
    weights = [(4, 100), (8, 100), (8, 100), (12, pc),
               (18, 0), (28, 4), (17, 10), (5, 0)]
    print("  overall: %.2f%%" % sum(w * v / 100 for w, v in weights))


if __name__ == "__main__":
    main()
