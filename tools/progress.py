"""Honest progress count for lime/common.

A function counts as done only if decomp/lime/ holds a real body for it.

EXCLUDED, deliberately:
  lime_unimplemented.c  -- bodies that only call abort(). They exist so the
                           linker is satisfied; counting them would report
                           work that has not been done. This script counted
                           them once and jumped from 88 to 93 with nothing
                           written, which is precisely the failure the ENCARGO
                           warns about.
  lime_globals.c        -- data, not functions.
"""
import re, os, io, collections, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
EXCLUDE = {"lime_unimplemented.c", "lime_globals.c"}

rows = []
for line in open(os.environ.get("UMK3_FUNC_TO_FILE") or os.path.join("work", "func-to-file.txt"), errors="ignore"):
    p = line.split()
    if len(p) < 3 or not p[0].startswith("0x") or "/lime/common/" not in p[2]:
        continue
    rows.append((p[1], p[2].split("/")[-1]))

DEF = re.compile(r'^[A-Za-z_][\w \*]*?\**\s*(\w+)\s*\([^;]*\)\s*\{', re.M)
defined = set()
for fn in sorted(os.listdir("decomp/lime")):
    if not fn.endswith(".c") or fn in EXCLUDE:
        continue
    defined |= set(DEF.findall(io.open(os.path.join("decomp/lime", fn),
                                       encoding="utf-8", errors="ignore").read()))

by = collections.defaultdict(lambda: [0, 0])
for sym, f in rows:
    short = re.sub(r'^_+', '', sym)
    short = re.sub(r'^Z\d+', '', short)
    base = re.split(r'[PS]\d|v$', short)[0]
    alt = re.sub(r'(P[a-z]|S_|P\d+\w*|l+)+$', '', base)
    by[f][0] += 1
    if base in defined or alt in defined:
        by[f][1] += 1

t = d = 0
for f in sorted(by):
    n, k = by[f]
    t += n
    d += k
    print("  %-22s %2d/%-2d" % (f, k, n))
pc = round(100 * d / t)
print("\n  lime/common: %d/%d = %d%%" % (d, t, pc))
print("  overall: %.2f%%" % sum(a * b / 100 for a, b in
      [(4, 100), (8, 100), (8, 100), (12, pc), (18, 0), (28, 4), (17, 10), (5, 0)]))
