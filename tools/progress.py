"""Honest progress count for the decompiled modules.

A function counts as done only if `decomp/` holds a real body for it.

Three modules are counted, each the same way: `lime/common`, `gamecode`, and
`gamecode/logic`. They are separated because they are separate rows in the
README's table and separate bodies of work -- the fight engine is eight times
the size of the rest of gamecode and nothing useful is learned by averaging
them together.

## How a symbol is matched to a C function

By its **Itanium length prefix**, not by trimming type codes off the end.
`__Z36CreateMatrixPaletteForGeneratingMeshPclllfP9BONESINFO` says the identifier
is 36 characters long, so it is exactly `CreateMatrixPaletteForGeneratingMesh`
and everything after it is argument encoding. That is unambiguous.

The earlier version guessed instead, stripping suffixes with a regexp, and it
mismatched anything whose type codes it had not anticipated -- `Pclllf` and
`PhPcfl11limeVECTOR3` among them. It undercounted by two. An older variant of
the same bug undercounted by seven and put three wrong figures in the README.

## The overall figure is measured, not asserted

Five of the eight blocks in the README's table are judgement calls about work
that is not function-counted -- analysis, tooling, format specifications, the
platform rewrite, the SDK stubs. Those stay as numbers a person maintains.

The other three are counted from the tree on every run. They used to be
hardcoded here too, and `gamecode` sat at 0% and `gamecode/logic` at 4% long
after both had real verified bodies committed. A progress script that has to be
edited by hand to reflect progress is a progress script that will be wrong, and
this one is specifically the place this project put its "suspect the counter"
rule.

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

# The five blocks that are not function-counted, as the README orders them.
# These are estimates a person maintains; the three measured ones are inserted
# between them by main().
JUDGEMENT = {
    "analysis": 100.0,      # binary analysis and source-tree mapping
    "tooling": 100.0,       # tooling and the verification oracle
    "formats": 100.0,       # asset format specifications
    "platform": 10.0,       # native PC platform layer
    "sdkstubs": 0.0,        # EA SDK stubs
}


def plain_name(sym):
    """Recover the C identifier from a symbol, mangled or not."""
    s = sym.lstrip("_")
    m = re.match(r"Z(\d+)(.*)", s)
    if m:                                   # C++: the length prefix is exact
        return m.group(2)[:int(m.group(1))]
    return s                                # C: already plain


def defined_functions(root):
    """Every function with a real body under `root`, at any depth."""
    names = set()
    if not os.path.isdir(root):
        return names
    for dirpath, _dirs, files in os.walk(root):
        for fn in sorted(files):
            if not fn.endswith(".c") or fn in EXCLUDE:
                continue
            text = io.open(os.path.join(dirpath, fn),
                           encoding="utf-8", errors="ignore").read()
            for n in re.findall(
                    r'^[A-Za-z_][\w \*]*?\**\s*(\w+)\s*\([^;]*\)\s*\{',
                    text, re.M):
                # Both forms. `plain_name` strips leading underscores off the
                # SYMBOL, so a C definition that keeps them -- as
                # `__GLOBAL__I_InGameLevelSelect` must, because that is its real
                # name -- would never match and the function would be counted as
                # outstanding forever. One function, silently undercounted, in a
                # tool whose whole job is not to be silently wrong.
                names.add(n)
                names.add(n.lstrip("_"))
    return names


# `gamecode/limeMPGameSpecific.m` is the multiplayer layer, and CLAUDE.md puts
# it in the STUB bucket rather than the decompile one -- along with
# limeMPSession and modalAlert. Counting its 48 functions as work outstanding
# would report a debt this project has decided not to pay. 339 - 48 = 291,
# which is the figure the README has always quoted.
NOT_DECOMPILED = ("limeMPGameSpecific",)


def rows_for(marker, exclude=None):
    """(name, source file) for every function whose translation unit matches."""
    out = []
    for line in io.open(FUNC_TO_FILE, encoding="utf-8", errors="ignore"):
        p = line.split()
        if len(p) < 3 or not p[0].startswith("0x"):
            continue
        src = p[2].replace("\\", "/")
        if marker not in src:
            continue
        if exclude and exclude in src:
            continue
        if any(skip in src for skip in NOT_DECOMPILED):
            continue
        out.append((plain_name(p[1]), src.rsplit("/", 1)[-1]))
    return out


def tally(rows, defined):
    """(done, total, per-file breakdown)."""
    by = collections.defaultdict(lambda: [0, 0])
    for name, src in rows:
        by[src][0] += 1
        if name in defined:
            by[src][1] += 1
    done = sum(k for _n, k in by.values())
    total = sum(n for n, _k in by.values())
    return done, total, by


def bar(pct, width=10):
    filled = int(round(pct / 100.0 * width))
    return "#" * filled + "." * (width - filled)


def main():
    if not os.path.isfile(FUNC_TO_FILE):
        raise SystemExit("func-to-file.txt not found: %s\n"
                         "Set UMK3_FUNC_TO_FILE or put a copy in work/."
                         % FUNC_TO_FILE)

    lime_def = defined_functions(os.path.join("decomp", "lime"))
    game_def = defined_functions(os.path.join("decomp", "gamecode"))

    modules = [
        ("lime/common", tally(rows_for("/lime/common/"), lime_def)),
        ("gamecode", tally(rows_for("/gamecode/", "/gamecode/logic/"), game_def)),
        ("gamecode/logic", tally(rows_for("/gamecode/logic/"), game_def)),
    ]

    pcts = {}
    for title, (done, total, by) in modules:
        print("\n  %s" % title)
        for src in sorted(by):
            n, k = by[src]
            if k:
                print("    %-26s %3d/%-5d" % (src, k, n))
        pct = 100.0 * done / total if total else 0.0
        pcts[title] = pct
        print("    %-26s %3d/%-5d = %.2f%%  %s"
              % ("TOTAL", done, total, pct, bar(pct)))

    weights = [
        (4, JUDGEMENT["analysis"]),
        (8, JUDGEMENT["tooling"]),
        (8, JUDGEMENT["formats"]),
        (12, pcts["lime/common"]),
        (18, pcts["gamecode"]),
        (28, pcts["gamecode/logic"]),
        (17, JUDGEMENT["platform"]),
        (5, JUDGEMENT["sdkstubs"]),
    ]
    overall = sum(w * v / 100.0 for w, v in weights)
    print("\n  overall: %.2f%%  %s" % (overall, bar(overall, 40)))
    print("  (three rows measured from the tree, five maintained by hand --"
          " see the docstring)")


if __name__ == "__main__":
    main()
