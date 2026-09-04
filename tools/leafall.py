"""Run the leaf reader over every logic file in ONE process.

`genfile.py` re-runs all three readers per file, and each rebuilds the symbol
table from scratch -- fine for a first pass over one file, far too slow for a
sweep. pushfn and microfn have already taken what they can from these files,
so this runs only the new reader, loading the table once.

Appends to each file the same way genfile does, including correcting a prior
declaration whose return type the new definition disproves.
"""

import io
import os
import re
import sys

sys.path.insert(0, "tools")
import dumpfn
import leaffn

BANNER = ("\n\n/* " + "-" * 68 + "\n"
          " * Straight-line leaves, read by tools/leaffn.py: stores, calls and\n"
          " * a return, with every instruction accounted for. It refuses\n"
          " * anything that branches, any return value it cannot prove, and any\n"
          " * value read from a field the function also writes -- that is a\n"
          " * saved value being put back, not a re-read.\n"
          " * " + "-" * 68 + " */\n\n")

rows = dumpfn.table()
starts = dict((a, dumpfn.plain(s)) for a, s, _ in rows)
by = {}
for i, (a, s, p) in enumerate(rows):
    end = rows[i + 1][0] if i + 1 < len(rows) else a + 64
    by.setdefault(dumpfn.plain(s), (a, end, p))
done = dumpfn.written()

want = {}
for n, (a, e, p) in by.items():
    if "gamecode/logic" not in p.replace("\\", "/") or n in done or e - a > 96:
        continue
    want.setdefault(os.path.basename(p), []).append((a, e, n))

total = 0
for src in sorted(want):
    out = "decomp/gamecode/logic/" + src
    if not os.path.exists(out):
        print("  %-14s (no file yet -- skipped)" % src)
        continue

    prior = io.open(out, encoding="utf-8").read()
    hdr = io.open("decomp/gamecode/logic/mk3logic.h", encoding="utf-8").read()
    known = set(re.findall(r"^(?:long|void) (\w+)\(", prior + hdr, re.M))

    blocks, decls, names = [], {}, []
    for a, e, n in sorted(want[src]):
        got, why = leaffn.read(n, a, e, starts)
        if not got:
            continue
        eff, ret = got
        text, seen = leaffn.render(n, a, e - a, eff, ret)
        if text is None:
            continue
        for fname, ty in seen:
            if decls.get(fname) is None:
                decls[fname] = ty
        blocks.append(text)
        names.append((n, "void" if ret is None else "long"))

    if not blocks:
        print("  %-14s 0" % src)
        continue

    # A definition arriving now beats a declaration already in the file.
    out_lines = []
    fixed = 0
    ret_of = dict(names)
    for line in prior.splitlines():
        m = re.match(r"^(long|void) (\w+)\((.*)\);$", line)
        if m and m.group(2) in ret_of and ret_of[m.group(2)] != m.group(1):
            line = "%s %s(%s);" % (ret_of[m.group(2)], m.group(2), m.group(3))
            fixed += 1
        out_lines.append(line)

    body = ""
    for fn in sorted(decls):
        if fn in known:
            continue
        body += "void %s(MK3OBJ *obj%s);\n" % (
            leaffn.cname(fn),
            (", %s arg" % decls[fn].rstrip()) if decls[fn] else "")
    if body:
        body += "\n"
    body += "\n\n".join(blocks)

    io.open(out, "w", encoding="utf-8", newline="").write(
        "\n".join(out_lines).rstrip("\n") + BANNER + body)
    total += len(blocks)
    print("  %-14s %d written%s"
          % (src, len(blocks), ", %d declarations corrected" % fixed if fixed else ""))

print("TOTAL:", total)
