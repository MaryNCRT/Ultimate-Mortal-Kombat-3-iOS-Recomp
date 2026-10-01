#!/usr/bin/env python3
"""todo -- what is still unwritten in one source file, smallest first.

    python tools/todo.py mkzap.c
    python tools/todo.py mkzap.c 20        # only the first 20

`tools/progress.py` counts. This says WHICH, and orders them by size so the
cheap ones come first -- which is the order that has actually closed nine files.

It reuses `progress.py`'s own scan on purpose. The two must agree about what
"written" means, and the way to guarantee that is to call the same function
rather than to write a second one that looks the same. `docs/HANDOFF.md` warns
that `tools/pending.py` carries a stale index and should not be used to order
the work; this exists so there is something correct to use instead.

Sizes come from the symbol table: the gap to the next symbol in the same
section, which is what `dumpfn.py` uses.
"""
import io
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import progress                                   # noqa: E402

SYMBOLS = os.path.join("work", "symbols.txt")


def sizes():
    """name -> (address, byte length), from the gaps between text symbols."""
    rows = []
    for line in io.open(SYMBOLS, encoding="utf-8", errors="replace"):
        m = re.match(r"^(0x[0-9a-fA-F]+)\s+\S+\s+\S+\s+(\S+)\s+(_\S+)\s*$",
                     line)
        if m and "__TEXT,__text" in m.group(2):
            rows.append((int(m.group(1), 16), m.group(3)))

    rows.sort()
    out = {}
    for i, (addr, name) in enumerate(rows):
        # The same address can carry several names; the length is the gap to
        # the next DIFFERENT address, not to the next row.
        j = i + 1
        while j < len(rows) and rows[j][0] == addr:
            j += 1
        end = rows[j][0] if j < len(rows) else addr
        out.setdefault(name.lstrip("_"), (addr, end - addr))
    return out


def main(argv):
    if len(argv) < 2:
        raise SystemExit(__doc__)

    want = argv[1]
    limit = int(argv[2]) if len(argv) > 2 else None

    defined = progress.defined_functions(os.path.join("decomp", "gamecode"))
    defined |= progress.defined_functions(os.path.join("decomp", "lime"))

    size = sizes()
    rows = [(name, src) for name, src in progress.rows_for("/")
            if src == want and name not in defined]

    if not rows:
        print("%s: nothing unwritten (or no such file)" % want)
        return

    rows.sort(key=lambda r: size.get(r[0], (0, 1 << 30))[1])

    print("%s: %d unwritten" % (want, len(rows)))
    for name, _src in rows[:limit]:
        addr, n = size.get(name, (0, 0))
        print("  %5d  0x%06x  %s" % (n, addr, name))


if __name__ == "__main__":
    main(sys.argv)
