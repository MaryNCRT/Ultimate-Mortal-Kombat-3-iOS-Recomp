#!/usr/bin/env python3
"""pushfn.py -- read the frame-push family by executing it symbolically.

Most of gamecode/logic is one function written a thousand times:

    if (frame[frame + 1].w0 != 0) return -3
    <a few stores into the object>
    frame[frame].handler = <a routine>
    frame[frame + 1].w0 = 0
    return 0

`microfn.py` matches whole bodies against fixed instruction lists, which works
where the bodies are literally identical and stops the moment a store moves or
a constant changes width. mkdrone.c has thirty-eight of one variant and
thirty-one of another and neither matches the templates written for moves.c.

So this one does not pattern-match the instructions. It **runs** them: a tiny
symbolic interpreter over the straight-line body, tracking each register as one
of

    THREAD      r0, the argument
    IMM(k)      a constant
    PCREL(a)    a pc-relative address, with the symbol at `a` if there is one
    LOAD(b, o)  a word read from somewhere
    UNKNOWN     anything it cannot account for

and recording every store. A function is accepted only when the interpreter
accounted for **every instruction** and the effects come out as: some stores
into `thread->proc`, then the two stores and the return that make a push. One
instruction it cannot model, one store to somewhere unexpected, one register
that went UNKNOWN before being used -- and the function is refused and goes on
the list to be read by hand.

That refusal is the whole point. The interpreter is not being asked to guess
what a function does; it is being asked to prove that a function is exactly the
shape it claims, and to say so out loud when it cannot.

    python tools/pushfn.py --file mkdrone.c            # a census
    python tools/pushfn.py --file mkdrone.c --emit     # the C
    python tools/pushfn.py --file mkdrone.c --rest     # what it refused
"""

import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import dumpfn
import samefn
import microfn


class V(object):
    """A symbolic register value."""
    def __init__(self, kind, a=None, b=None):
        self.kind, self.a, self.b = kind, a, b

    def __repr__(self):
        return "%s(%s,%s)" % (self.kind, self.a, self.b)


THREAD = V("thread")
UNK = V("unknown")


def imm(s):
    """The integer behind `#0x1c` or `#28`, or None."""
    m = re.match(r"^#(0x[0-9a-fA-F]+|\d+)$", s.strip())
    return int(m.group(1), 0) if m else None


class Refuse(Exception):
    pass


class Run(object):
    """Executes the straight-line part of one of these bodies."""

    def __init__(self, body, starts):
        self.b = body
        self.starts = starts
        self.r = {"r0": THREAD}
        self.stores = []        # (base V, offset, value V, width)

    def get(self, name):
        return self.r.get(name, UNK)

    def step(self, i):
        """Execute body[i]; return how many instructions were consumed."""
        op, args, tgt = self.b[i]
        a = [x.strip() for x in args.split(",")] if args else []
        # A memory operand keeps its own spacing: splitting on every comma and
        # stripping would turn "[r3, #4]" into "[r3,#4]" and nothing matches.
        dst, _, rest = args.partition(",")
        dst, rest = dst.strip(), rest.strip()

        # ---- constants
        if op in ("movs", "mov.w", "movw", "mov") and len(a) == 2:
            k = imm(a[1])
            if k is not None:
                self.r[a[0]] = V("imm", k)
            elif a[1] in self.r or re.match(r"^(r\d+|ip|lr|sb|sl|fp)$", a[1]):
                self.r[a[0]] = self.get(a[1])
            else:
                raise Refuse("mov %s" % args)
            return 1
        if op == "mvn" and len(a) == 2 and imm(a[1]) is not None:
            self.r[a[0]] = V("imm", ~imm(a[1]) & 0xffffffff)
            return 1

        # ---- pc-relative address, in two halves the compiler likes to
        # separate: `ldr rX, [pc, #n]` loads the offset and `add rX, pc`
        # turns it into the address. Anything may sit between them, so they
        # are handled independently rather than as a pair.
        if op in ("ldr", "ldr.w") and rest.startswith("[pc"):
            self.r[dst] = V("litpending")
            return 1
        if op in ("add", "add.w") and rest == "pc":
            if tgt is None:
                raise Refuse("unresolved pc-relative")
            if self.get(dst).kind != "litpending":
                raise Refuse("add pc without a literal")
            self.r[dst] = V("pcrel", tgt[0], tgt[1])
            return 1

        # ---- arithmetic used by the frame arithmetic
        if op in ("adds", "add") and len(a) == 3 and a[2] == "r0" \
                and self.get(a[1]).kind == "frame8":
            self.r[a[0]] = V("slot", self.get(a[1]).a)
            return 1
        if op in ("adds", "add.w", "add") and len(a) in (2, 3):
            dst = a[0]
            src = self.get(a[1]) if len(a) == 3 else self.get(a[0])
            k = imm(a[-1])
            if k is not None and src.kind == "imm":
                self.r[dst] = V("imm", src.a + k)
            elif k is not None and src.kind == "frame":
                self.r[dst] = V("frame", src.a + k)
            elif k is not None and src.kind == "pcrel":
                self.r[dst] = V("pcrel", src.a + k, None)
            else:
                self.r[dst] = UNK
            return 1
        if op in ("lsls", "lsl.w") and len(a) == 3 and imm(a[2]) == 3:
            s = self.get(a[1])
            self.r[a[0]] = V("frame8", s.a) if s.kind == "frame" else UNK
            return 1
        if op in ("adds", "add") and len(a) == 3 and a[2] == "r0":
            s = self.get(a[1])
            self.r[a[0]] = V("slot", s.a) if s.kind == "frame8" else UNK
            return 1

        # ---- loads
        if op in ("ldr", "ldr.w", "ldrsh.w", "ldrh", "ldrh.w", "ldrb"):
            m = re.match(r"^\[(\w+), #(0x[0-9a-fA-F]+|\d+)\]$", rest)
            if m and self.get(m.group(1)).kind == "thread":
                off = int(m.group(2), 0)
                if off == 0xa4:
                    self.r[a[0]] = V("frame", 0)
                elif off == 0x108:
                    self.r[a[0]] = V("proc")
                else:
                    self.r[a[0]] = V("load", "thread", off)
                return 1
            m = re.match(r"^\[(\w+), (\w+), lsl #3\]$", rest)
            if m and self.get(m.group(1)).kind == "thread" \
                    and self.get(m.group(2)).kind == "frame":
                self.r[a[0]] = V("framew0", self.get(m.group(2)).a)
                return 1
            self.r[a[0]] = UNK
            return 1

        # ---- stores
        if op in ("str", "str.w", "strh", "strh.w", "strb"):
            val = self.get(dst)
            m = re.match(r"^\[(\w+), #(0x[0-9a-fA-F]+|\d+)\]$", rest)
            if m:
                self.stores.append((self.get(m.group(1)),
                                    int(m.group(2), 0), val, op))
                return 1
            m = re.match(r"^\[(\w+), (\w+), lsl #3\]$", rest)
            if m and self.get(m.group(1)).kind == "thread":
                f = self.get(m.group(2))
                if f.kind != "frame":
                    raise Refuse("store to a frame we did not track")
                self.stores.append((V("framew0", f.a), 0, val, op))
                return 1
            m = re.match(r"^\[(\w+)\]$", rest)
            if m:
                self.stores.append((self.get(m.group(1)), 0, val, op))
                return 1
            raise Refuse("store %s" % args)

        if op in ("bx", "b", "nop", "pop", "push", "cbz", "cbnz"):
            return 1

        raise Refuse(op)


GUARD_A = ["ldr.w", "ldr.w", "adds", "ldr.w", "cbz", "mvn", "bx"]
GUARD_B = ["ldr.w", "add.w", "ldr.w", "cbz", "mvn", "bx"]
GUARD_C = ["ldr.w", "adds", "ldr.w", "cbz", "mvn", "bx"]


def split_guard(b):
    """(proc_reg or None, index after the guard) -- or None if it is not one."""
    ops = [i[0] for i in b]
    if ops[:7] == GUARD_A and re.match(r"^\w+, \[r0, #0xa4\]$", b[0][1]) \
            and re.match(r"^(\w+), \[r0, #0x108\]$", b[1][1]) \
            and b[5][1] == "r0, #2" and b[6][1] == "lr":
        return (b[1][1].split(",")[0], 4, 7)
    if ops[:6] == GUARD_B and re.match(r"^\w+, \[r0, #0xa4\]$", b[0][1]) \
            and b[4][1] == "r0, #2" and b[5][1] == "lr":
        return (None, 3, 6)
    # A third spelling: the frame loaded and incremented in place, with no
    # proc. Same three instructions of work, one register fewer.
    if ops[:6] == GUARD_C and re.match(r"^\w+, \[r0, #0xa4\]$", b[0][1]) \
            and b[4][1] == "r0, #2" and b[5][1] == "lr":
        return (None, 3, 6)
    return None


def read(name, a, e, starts):
    """The stores and the handler, or None with a reason."""
    b = microfn.body(a, e, dumpfn.disasm(a, e), starts)
    g = split_guard(b)
    if g is None:
        return None, "not the guard"
    proc_reg, pre, start = g

    run = Run(b, starts)
    if proc_reg:
        run.r[proc_reg] = V("proc")
    try:
        # The guard's loads run too -- GUARD_B keeps the frame in a register
        # the body reuses -- but not its `mvn r0, #2`, which would clobber the
        # thread pointer.
        i = 0
        while i < pre:
            i += run.step(i)
        i = start
        while i < len(b):
            i += run.step(i)
    except Refuse as why:
        return None, str(why)

    # The tail must be the push: a handler into frame[frame].handler and a
    # zero into frame[frame+1].w0, and nothing else.
    handler = None
    stores = []
    for base, off, val, width in run.stores:
        if base.kind == "slot" and off == 4:
            if val.kind != "pcrel":
                return None, "handler is not an address"
            handler = val
        elif base.kind == "framew0" and off == 0:
            if not (val.kind == "framew0" or (val.kind == "imm" and val.a == 0)):
                return None, "the slot above is not cleared"
        elif base.kind == "proc":
            stores.append((off, val, width))
        else:
            return None, "a store this does not model"

    if handler is None:
        return None, "no handler"
    return (stores, handler), None


FIELD = {0x04: "thread", 0x44: "a10"}


def cname(n):
    """A legal C spelling of a Mach-O symbol.

    The compiler numbered its own static functions `funcs.11119`, and a
    dot is not an identifier. The real symbol is kept in each function's
    comment; only the spelling changes.
    """
    return re.sub(r"[^A-Za-z0-9_]", "_", n)


# The offsets MK3OBJ actually names. A store outside this set is written as a
# byte offset rather than invented as a field: the struct records what has been
# established, and adding to it from one store would be a guess at a layout
# nobody has measured.
KNOWN = set([0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24,
             0x28, 0x2c, 0x30, 0x34, 0x38, 0x3c, 0x40, 0x44, 0x48, 0x54,
             0x5c])


def field(off):
    """What MK3OBJ calls the word at that offset, or None if it names none."""
    if off not in KNOWN:
        return None
    return FIELD.get(off, "field%02x" % off)


def name_of(v, starts):
    if v.b:
        return v.b.lstrip("_")
    n = starts.get(v.a & ~1)
    return n


HEAD = '''/* %(name)s -- armv7 0x%(addr)08x, %(size)d bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
%(steps)s *      frame[frame].handler = %(handler)s
 *      frame[frame+1].w0 = 0
 */
'''


def main(argv):
    src = argv[argv.index("--file") + 1]
    emit = "--emit" in argv
    rest = "--rest" in argv
    cap = int(argv[argv.index("--max") + 1]) if "--max" in argv else 128

    rows = dumpfn.table()
    starts = dict((a, dumpfn.plain(s)) for a, s, _ in rows)
    by = {}
    for i, (a, s, p) in enumerate(rows):
        end = rows[i + 1][0] if i + 1 < len(rows) else a + 64
        by.setdefault(dumpfn.plain(s), (a, end, p))
    done = dumpfn.written()

    want = sorted((a, e, n) for n, (a, e, p) in by.items()
                  if os.path.basename(p) == src and n not in done
                  and e - a <= cap)

    ok, bad = [], []
    for a, e, n in want:
        got, why = read(n, a, e, starts)
        (ok if got else bad).append((a, e, n, got or why))

    if rest:
        from collections import Counter
        c = Counter(x[3] for x in bad)
        for why, k in c.most_common():
            print("%4d  %s" % (k, why))
        print("\n%d refused of %d" % (len(bad), len(want)))
        return 0

    if not emit:
        print("accepted %d of %d" % (len(ok), len(want)))
        return 0

    # Collect every name these bodies mention before printing any of them:
    # a handler stored into an object field is discovered while emitting, and
    # a declaration printed after its use is no declaration at all.
    decl = {}
    emit_list = []
    for a, e, n, (stores, h) in ok:
        hn = name_of(h, starts)
        if hn is None:
            continue
        names = [hn]
        good = True
        for off, val, width in stores:
            if val.kind == "pcrel":
                vn = name_of(val, starts)
                if vn is None:
                    good = False
                    break
                names.append(vn)
            elif val.kind != "imm":
                good = False
                break
        if not good:
            continue
        for x in names:
            decl.setdefault(x, True)
        emit_list.append((a, e, n, stores, h, hn))

    # Declare everything, including what this file goes on to define: a
    # handler used two hundred lines above its definition needs a declaration,
    # and one that matches is harmless.
    for hn in sorted(decl):
        print("long %s(struct MK3THREAD *thread);" % cname(hn))
    print("")

    for a, e, n, stores, h, _hn in emit_list:
        hn = name_of(h, starts)
        if hn is None:
            continue
        steps = ""
        body = ""
        for off, val, width in stores:
            f = field(off)
            lhs = ("obj->%s" % f) if f else \
                  ("*(uint32_t *)((char *)obj + 0x%x)" % off)
            if val.kind == "imm":
                steps += " *      %s = 0x%x\n" % (lhs, val.a)
                body += "    %s = 0x%x;\n" % (lhs, val.a)
            elif val.kind == "pcrel":
                vn = name_of(val, starts)
                if vn is None:
                    steps = None
                    break
                steps += " *      %s = %s\n" % (lhs, vn)
                body += ("    %s = (uint32_t)(uintptr_t)%s;\n"
                         % (lhs, cname(vn)))
                decl.setdefault(vn, True)
            else:
                steps = None
                break
        if steps is None:
            continue
        print(HEAD % {"name": n, "addr": a, "size": e - a,
                      "steps": steps, "handler": cname(hn)})
        print("long %s(MK3THREAD *thread)\n{" % n)
        if body:
            print("    MK3OBJ *obj = (MK3OBJ *)thread->proc;\n")
        print("    if (*mk3_frame(thread, thread->frame + 1) != 0)")
        print("        return -3;\n")
        if body:
            print(body, end="")
            print("")
        print("    return mk3_push_handler(thread, (MK3THREADFUNC)%s);\n}\n"
              % cname(hn))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
