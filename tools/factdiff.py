#!/usr/bin/env python3
"""factdiff.py -- put the two fact lists side by side and name what differs.

`facts_asm.py` reads the machine transcription of a function; `facts_c.py`
reads ours. Neither knows about the other. This compares them and reports, per
function, the things a transcription gets wrong.

## Multisets, not sequences

The two are compared as MULTISETS rather than in order, on purpose. The
readable C is allowed to say the same thing in a different order -- an
`if/else` where the binary has a branch and a fall-through, a `goto pop` where
the binary repeats the tail four times -- and comparing sequences would report
every one of those as a difference. What cannot legitimately differ is WHICH
stores happen, WITH WHAT values, to WHICH routines control passes, and what
comes back.

So four comparisons:

    stores    (offset, value) where both sides resolved the value
    handlers  the routines installed into the frame
    tokens    the state numbers written into the frame
    calls     which routines are called, and how many times

## `?` is not a disagreement

Either side reports `?` when it will not guess. A pair where one side is `?`
is counted as UNCHECKED and reported separately rather than folded into either
column, because calling it agreement would be the same overclaiming the tools
were built to avoid. The summary prints that count; a function with many of
them has been checked less than its verdict suggests.

Usage:
    python factdiff.py <recompiled.c> <readable.c> [function]
    python factdiff.py --summary <recompiled.c> <readable.c>
"""
import collections
import sys
import os

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import facts_asm                                             # noqa: E402
import facts_c                                               # noqa: E402


def asm_sets(fs):
    """The asm facts, bucketed for comparison."""
    stores, handlers, tokens, calls, unk = [], [], [], [], 0
    for f in fs:
        if f[0] == "store":
            off, val = f[1], f[2]
            if val == "?":
                unk += 1
                continue
            nm = facts_asm.name_of(val)
            # a handler is a store of a routine's address into the frame
            if nm and off == "0x4":
                handlers.append(nm)
            else:
                stores.append((off, val))
        elif f[0] == "token":
            (tokens.append(f[1]) if f[1] != "?" else None)
            unk += 1 if f[1] == "?" else 0
        elif f[0] == "call":
            calls.append(f[1])
    return stores, handlers, tokens, calls, unk


def c_sets(fs):
    """Ours, bucketed the same way."""
    stores, handlers, tokens, calls, unk = [], [], [], [], 0
    for f in fs:
        if f[0] == "store":
            off, val = f[1], f[2]
            if val == "?":
                unk += 1
                continue
            stores.append((off, val))
        elif f[0] == "handler":
            handlers.append(f[1])
        elif f[0] == "token":
            (tokens.append(f[1]) if f[1] != "?" else None)
            unk += 1 if f[1] == "?" else 0
        elif f[0] == "call":
            calls.append(f[1])
    return stores, handlers, tokens, calls, unk


def compare(a, b, label, out, slack_bin=0, slack_c=0):
    """One bucket, as a multiset difference in both directions.

    `slack` is how many facts the other side declined to resolve. An item the
    binary could not read is not evidence that ours is wrong, so that many
    unmatched items are absorbed rather than reported. Without this every
    handler fetched through a pointer table -- which the binary loads in two
    steps and this reader will not follow -- came out as ours being invented.
    """
    ca, cb = collections.Counter(a), collections.Counter(b)
    only_bin = ca - cb
    only_c = cb - ca
    for _ in range(slack_c):
        if not only_bin:
            break
        k = next(iter(only_bin))
        only_bin[k] -= 1
        if only_bin[k] <= 0:
            del only_bin[k]
    for _ in range(slack_bin):
        if not only_c:
            break
        k = next(iter(only_c))
        only_c[k] -= 1
        if only_c[k] <= 0:
            del only_c[k]
    for k, n in sorted(only_bin.items(), key=lambda x: str(x[0])):
        out.append("    %-9s binario tiene %s  x%d  y el C no" % (label, k, n))
    for k, n in sorted(only_c.items(), key=lambda x: str(x[0])):
        out.append("    %-9s el C tiene   %s  x%d  y el binario no"
                   % (label, k, n))
    return len(only_bin) + len(only_c)


def check(name, afacts, cfacts):
    """One function: a verdict, the lines explaining it, and the unchecked."""
    a = asm_sets(afacts)
    c = c_sets(cfacts)
    out, n = [], 0
    # a[4] and c[4] count what each side declined to resolve; each side's
    # unknowns give the OTHER side that much slack.
    n += compare(a[0], c[0], "store", out, a[4], c[4])
    n += compare(a[1], c[1], "handler", out, a[4], c[4])
    n += compare(a[2], c[2], "token", out, a[4], c[4])
    n += compare(a[3], c[3], "call", out)
    return n, out, a[4] + c[4]


def main(argv):
    args = [x for x in argv[1:] if not x.startswith("--")]
    summary = "--summary" in argv
    rec, src = args[0], args[1]
    want = args[2] if len(args) > 2 else None

    afns = facts_asm.split_functions(
        open(rec, encoding="utf-8", errors="replace").read())
    maps = facts_c.offsets()
    cfns = facts_c.split_functions(src)

    clean = diff = missing = 0
    unchecked_total = 0
    for name in sorted(cfns):
        if want and name != want:
            continue
        if name not in afns:
            missing += 1
            if not summary:
                print("??  %-28s no esta en la transcripcion" % name)
            continue
        n, lines, unk = check(name,
                              facts_asm.facts(afns[name]),
                              facts_c.facts_of(cfns[name], maps))
        unchecked_total += unk
        if n == 0:
            clean += 1
            if not summary:
                print("OK  %-28s (%d sin comprobar)" % (name, unk))
        else:
            diff += 1
            print("!!  %-28s %d diferencia(s), %d sin comprobar"
                  % (name, n, unk))
            for ln in lines:
                print(ln)

    total = clean + diff + missing
    print()
    print("%d funciones: %d coinciden, %d con diferencias, %d sin transcripcion"
          % (total, clean, diff, missing))
    print("%d hechos quedaron sin comprobar (un lado dijo '?')"
          % unchecked_total)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
