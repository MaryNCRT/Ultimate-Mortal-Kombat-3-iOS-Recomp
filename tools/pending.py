#!/usr/bin/env python3
"""pending.py -- which gamecode functions are still to be written, smallest first.

The size comes from the gap to the next symbol, which is what makes this useful:
attacking the small ones first is worth a lot more than going in file order, and
guessing at "small" from the name does not work.

Two details this gets right that a naive version does not:

  - a C++ symbol encodes its own name LENGTH (`_Z20DeviceRenderSettingsv` is 20
    characters then the parameter list), so the name has to be cut to that
    length. Taking everything after the digits leaves the parameter encoding
    attached and reports finished functions as pending.

  - a function is "written" if a DEFINITION exists in decomp/, not a
    declaration. Matching prototypes too marks a file's own forward
    declarations as work already done.

    python tools/pending.py [count]
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FUNCS = os.environ.get("UMK3_FUNCS",
                       "E:/MK3 PROJECT/OUTPUT/func-to-file.txt")


def written():
    done = set()
    for path in glob.glob(os.path.join(ROOT, "decomp", "**", "*.c"),
                          recursive=True):
        for line in open(path, encoding="utf-8", errors="replace"):
            if not line or line[0] in " \t\n#/*}":
                continue
            if line.rstrip().endswith(";"):        # a prototype, not a body
                continue
            m = re.match(r"^[A-Za-z_][A-Za-z0-9_ \t\*]*?([A-Za-z_]\w*)\s*\(", line)
            if m:
                # Both forms -- see the same fix in tools/progress.py. `plain`
                # strips leading underscores off the symbol, so a definition
                # that keeps them would never match.
                done.add(m.group(1))
                done.add(m.group(1).lstrip("_"))
    return done


def plain(sym):
    """The source-level name behind a Mach-O symbol."""
    b = sym.lstrip("_")
    m = re.match(r"^Z(\d+)(.*)$", b)
    return m.group(2)[:int(m.group(1))] if m else b


def main(argv):
    limit = int(argv[1]) if len(argv) > 1 else 20
    done = written()

    funcs = []
    for line in open(FUNCS, encoding="utf-8", errors="replace"):
        m = re.match(r"(0x[0-9a-f]+)\s+(\S+)\s+(\S+)", line)
        if m:
            funcs.append((int(m.group(1), 16), m.group(2), m.group(3)))
    funcs.sort()

    rows = []
    for i, (addr, sym, path) in enumerate(funcs):
        if "/gamecode/" not in path or "/logic/" in path or "limeMP" in path:
            continue
        size = funcs[i + 1][0] - addr if i + 1 < len(funcs) else 0
        name = plain(sym)
        if name in done:
            continue
        rows.append((size, sym, name, os.path.basename(path)))
    rows.sort()

    print("written: %d   pending in gamecode: %d\n" % (len(done), len(rows)))
    for size, sym, name, src in rows[:limit]:
        print("  %5d  %-38s %-28s %s" % (size, sym, name, src))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
