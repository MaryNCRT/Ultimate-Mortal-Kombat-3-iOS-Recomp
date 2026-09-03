#!/usr/bin/env python3
"""samefn.py -- group functions by SHAPE, so identical ones are read once.

Reading `gamecode/logic` one function at a time found the same body three times
in one dump: `t_fatal_yes`, `t_finish_him_exit` and `t_its_a_tie` are the same
sixty-eight bytes at three addresses. That is not a coincidence of style -- a
thread entry point is identified by its ADDRESS, so a routine that behaves
identically still needs its own copy to be a distinct handler, and the compiler
duly emits one.

So it is worth asking the question in bulk: normalise each function's
disassembly and group by the result. Members of a group need reading once.

Normalising means dropping what an address changes and keeping what it means:

  - the address column becomes an offset from the function's start
  - a branch inside the function becomes that same relative offset
  - a branch out of it becomes the name it lands on
  - a pc-relative literal keeps its resolved TARGET, which is absolute and so
    is already the same for two functions that do the same thing

What survives is the body. Two functions with the same signature differ only in
where they sit.

    python tools/samefn.py --file other.c
    python tools/samefn.py --file other.c --pending
    python tools/samefn.py --logic --min 3
"""

import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import dumpfn


def pool_start(addr, end, text):
    """Where the literal pool begins, so it is not read as instructions.

    A constant sitting after the last instruction disassembles as whatever
    those four bytes happen to spell, which differs between two functions that
    are otherwise identical -- the constant is a pc-relative offset and pc is
    not the same. Cut it off.

    The address of a Thumb literal is ((pc of the ldr) + 4 & ~3) + imm; the ARM
    form is pc + 8 + imm. Try both and keep whichever lands inside the
    function, lowest first.
    """
    lo = end
    for m in re.finditer(r"^(0x[0-9a-f]+)\s+ldr(?:\.w)?\s+\S+,\s*\[pc,\s*#(0x[0-9a-f]+|\d+)\]",
                         text, re.M):
        here = int(m.group(1), 16)
        imm = int(m.group(2), 16) if m.group(2).startswith("0x") else int(m.group(2))
        for cand in (((here + 4) & ~3) + imm, here + 8 + imm):
            if addr < cand < end:
                lo = min(lo, cand)
    return lo


def signature(addr, end, text, starts):
    """The body with every address turned into what it means."""
    end = pool_start(addr, end, text)
    out = []
    for line in text.rstrip("\n").split("\n"):
        m = re.match(r"^(0x[0-9a-f]+)\s+(.*)$", line)
        if m:
            here = int(m.group(1), 16)
            if here >= end:                 # the literal pool, not code
                continue
            body = m.group(2)
            # a branch: inside becomes relative, outside becomes a name
            def fix(mm):
                t = int(mm.group(1), 16)
                if addr <= t < end:
                    return "#+%d" % (t - addr)
                return "#%s" % starts.get(t, mm.group(1))
            body = re.sub(r"#(0x[0-9a-f]{4,})", fix, body)
            out.append("%04x %s" % (here - addr, body))
        else:
            # the '; -> 0x...' annotation from disasm_range: absolute, keep it
            out.append(line.strip())
    return "\n".join(out)


def main(argv):
    rows = dumpfn.table()
    starts = dict((a, dumpfn.plain(s)) for a, s, _ in rows)

    by_name = {}
    for i, (a, s, p) in enumerate(rows):
        end = rows[i + 1][0] if i + 1 < len(rows) else a + 64
        by_name.setdefault(dumpfn.plain(s), (a, end, p))

    src = argv[argv.index("--file") + 1] if "--file" in argv else None
    logic = "--logic" in argv
    only_pending = "--pending" in argv
    minsize = int(argv[argv.index("--min") + 1]) if "--min" in argv else 2
    cap = int(argv[argv.index("--max") + 1]) if "--max" in argv else 400

    done = dumpfn.written()

    want = []
    for name, (a, end, p) in by_name.items():
        if src and os.path.basename(p) != src:
            continue
        if logic and "logic" not in p.replace("\\", "/"):
            continue
        if not src and not logic:
            continue
        if end - a > cap:
            continue
        want.append((name, a, end, p))

    groups = {}
    for name, a, end, p in want:
        sig = signature(a, end, dumpfn.disasm(a, end), starts)
        groups.setdefault(sig, []).append((name, a, end, p))

    interesting = [g for g in groups.values() if len(g) >= minsize]
    interesting.sort(key=lambda g: -len(g))

    total_p = 0
    for g in interesting:
        pend = [x for x in g if x[0] not in done]
        if only_pending and not pend:
            continue
        total_p += len(pend)
        model = [x for x in g if x[0] in done]
        print("=" * 68)
        print("%d functions, %d bytes%s"
              % (len(g), g[0][2] - g[0][1],
                 "   model: %s" % model[0][0] if model else "   (none written)"))
        print("=" * 68)
        for name, a, end, p in sorted(g, key=lambda x: x[1]):
            print("  %-38s 0x%08x  %s%s"
                  % (name, a, os.path.basename(p),
                     "" if name in done else "   PENDING"))
        print()

    print("%d groups of %d or more; %d pending members"
          % (len(interesting), minsize, total_p))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
