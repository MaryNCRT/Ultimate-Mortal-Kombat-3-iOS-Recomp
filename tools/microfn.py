#!/usr/bin/env python3
"""microfn.py -- recognise the micro-shapes that make up most of gamecode/logic.

`moves.c` has 357 functions in nineteen kilobytes; the median is thirty-six
bytes and three hundred of them are under sixty-four. They are not varied. A
typical one is

    push {r7, lr}
    add  r7, sp, #0
    ldr  r2, [pc, #8]
    add  r2, pc              ; -> _sm_ermac_bc
    bl   secret_move_search
    pop  {r7, pc}

-- a name, a table, and a tail call. Reading three hundred of those one at a
time is not reading, it is transcription, and transcription is what a program
is for.

So this matches whole bodies against a small set of templates. **Every
instruction has to match**, including the ones that do nothing: a body with one
extra store falls through to the unrecognised list rather than being emitted
with the store dropped. That makes the match a proof about the function rather
than a guess from its first two lines, and it is stricter than reading by eye.

What it cannot recognise it lists, and those get read by hand.

    python tools/microfn.py --file moves.c            # what it can do
    python tools/microfn.py --file moves.c --emit     # the C
    python tools/microfn.py --file moves.c --rest     # what it cannot
"""

import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import dumpfn
import samefn


def body(addr, end, text, starts):
    """[(mnemonic, operands, resolved-target-or-None)], literal pool removed."""
    end = samefn.pool_start(addr, end, text)
    out = []
    pending = None
    for line in text.rstrip("\n").split("\n"):
        m = re.match(r"^(0x[0-9a-f]+)\s+(\S+)\s*(.*)$", line)
        if m:
            here = int(m.group(1), 16)
            if here >= end:
                continue
            out.append([m.group(2), m.group(3).strip(), None])
            pending = out[-1]
            continue
        m = re.match(r"^\s*; -> (0x[0-9a-f]+)\s*(\S*)", line)
        if m and pending is not None:
            pending[2] = (int(m.group(1), 16), m.group(2))
    # A `nop` after the return is alignment, not code.
    while out and out[-1][0] == "nop":
        out.pop()

    # name the bl targets
    for ins in out:
        if ins[0] in ("bl", "blx", "b", "b.w"):
            mm = re.match(r"^#(0x[0-9a-f]+)$", ins[1])
            if mm:
                t = int(mm.group(1), 16)
                if t in starts:
                    ins[2] = (t, starts[t])
    return out


def sym(ins):
    """The name a resolved target carries, without its leading underscore."""
    if ins[2] is None:
        return None
    return ins[2][1].lstrip("_") or None


_IMG = None
_SLOT = {}


def slot_target(addr, starts):
    """The function a pointer slot points at, Thumb bit and all.

    A handler installed through `ldr r3, [pc]; add r3, pc; ldr r1, [r3]` is a
    slot in __nl_symbol_ptr, not the routine itself. The word it holds is the
    address, with bit 0 set when the target is Thumb -- which every one of
    these is.
    """
    global _IMG
    if addr in _SLOT:
        return _SLOT[addr]
    if _IMG is None:
        _IMG = open(dumpfn.BINARY, "rb").read()
    off = addr - 0x1000
    if off < 0 or off + 4 > len(_IMG):
        return None
    w = int.from_bytes(_IMG[off:off + 4], "little")
    name = starts.get(w & ~1)
    _SLOT[addr] = name
    return name


def match(b):
    """(kind, detail) for a body this understands, or None."""
    ops = [i[0] for i in b]

    # An empty function: nothing but the return.
    if ops == ["bx"] and b[0][1] == "lr":
        return ("empty", None)

    # obj->field5c = <constant>
    if ops == ["movs", "str", "bx"]:
        m = re.match(r"^r3, #(\d+)$", b[0][1])
        if m and b[1][1] == "r3, [r0, #0x5c]" and b[2][1] == "lr":
            return ("answer", int(m.group(1)))

    # A tail call: push, frame, bl, pop. r0 and r1 flow through untouched.
    if ops == ["push", "add", "bl", "pop"]:
        if b[0][1] == "{r7, lr}" and b[1][1] == "r7, sp, #0" \
                and b[3][1] == "{r7, pc}" and sym(b[2]):
            return ("tail", sym(b[2]))

    # A tail call with a table in r2.
    if ops == ["push", "add", "ldr", "add", "bl", "pop"]:
        if b[0][1] == "{r7, lr}" and b[1][1] == "r7, sp, #0" \
                and re.match(r"^r2, \[pc, #\w+\]$", b[2][1]) \
                and b[3][1] == "r2, pc" and b[3][2] \
                and b[4][0] == "bl" and sym(b[4]) and b[5][1] == "{r7, pc}":
            return ("tail_table", (sym(b[4]), b[3][2][1].lstrip("_"),
                                   b[3][2][0]))

    # Two constants and a tail call. The second is formed by adding to the
    # first, which is how the compiler gets two numbers out of one `movs`.
    if ops == ["push", "add", "movs", "str", "adds", "str", "bl", "pop"]:
        m1 = re.match(r"^r3, #(0x[0-9a-f]+|\d+)$", b[2][1])
        m2 = re.match(r"^r3, #(0x[0-9a-f]+|\d+)$", b[4][1])
        s1 = re.match(r"^r3, \[r0, #(0x[0-9a-f]+|\d+)\]$", b[3][1])
        s2 = re.match(r"^r3, \[r0, #(0x[0-9a-f]+|\d+)\]$", b[5][1])
        if (b[0][1] == "{r7, lr}" and b[1][1] == "r7, sp, #0" and m1 and m2
                and s1 and s2 and sym(b[6]) and b[7][1] == "{r7, pc}"):
            k1 = int(m1.group(1), 0)
            return ("two_const", (int(s1.group(1), 0), k1,
                                  int(s2.group(1), 0), k1 + int(m2.group(1), 0),
                                  sym(b[6])))
    return None


def match_slot(b, starts):
    """The frame-push family with a constant and a handler out of a slot."""
    ops = [i[0] for i in b]
    want = ["ldr.w", "ldr.w", "adds", "ldr.w", "cbz", "mvn", "bx",
            "movs", "str", "ldr", "add", "ldr", "ldr.w", "lsls", "adds",
            "str", "ldr.w", "adds", "str.w", "mov", "b"]
    if ops != want:
        return None
    m = re.match(r"^r3, #(0x[0-9a-f]+|\d+)$", b[7][1])
    s = re.match(r"^r3, \[r1, #(0x[0-9a-f]+|\d+)\]$", b[8][1])
    if not (m and s and b[0][1] == "r3, [r0, #0xa4]"
            and b[1][1] == "r1, [r0, #0x108]" and b[10][2]):
        return None
    name = slot_target(b[10][2][0], starts)
    if name is None:
        return None
    return ("act_slot", (int(s.group(1), 0), int(m.group(1), 0), name,
                         b[10][2][0]))


C_EMPTY = '''/* %(name)s -- armv7 0x%(addr)08x, %(size)d bytes.  **Complete.**
 *
 * `bx lr`, and nothing else. The function exists so that a table can name it;
 * whatever it is asked, the answer is whatever the caller already had. */
void %(name)s(MK3OBJ *obj)
{
    (void)obj;
}
'''

C_ANSWER = '''/* %(name)s -- armv7 0x%(addr)08x, %(size)d bytes.  **Complete.**
 *
 *      obj->field5c = %(k)d
 */
void %(name)s(MK3OBJ *obj)
{
    obj->field5c = %(k)d;
}
'''

C_TAIL = '''/* %(name)s -- armv7 0x%(addr)08x, %(size)d bytes.  **Complete.**
 *
 * A tail call to `%(callee)s` with the arguments untouched, so whatever the
 * caller put in r1 goes with them. */
long %(name)s(MK3OBJ *obj)
{
    return %(callee)s(obj);
}
'''

C_TAIL_TABLE = '''/* %(name)s -- armv7 0x%(addr)08x, %(size)d bytes.  **Complete.**
 *
 * `%(callee)s` with `_%(table)s` (0x%(taddr)08x) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t %(table)s[];            /* 0x%(taddr)08x */

long %(name)s(MK3OBJ *obj, uint32_t arg)
{
    return %(callee)s(obj, arg, %(table)s);
}
'''


C_TWO_CONST = '''/* %(name)s -- armv7 0x%(addr)08x, %(size)d bytes.  **Complete.**
 *
 *      obj->field%(o1)02x = %(k1)d
 *      obj->field%(o2)02x = %(k2)d
 *      %(callee)s(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
long %(name)s(MK3OBJ *obj)
{
    obj->field%(o1)02x = %(k1)d;
    obj->field%(o2)02x = %(k2)d;
    return %(callee)s(obj);
}
'''

C_ACT_SLOT = '''/* %(name)s -- armv7 0x%(addr)08x, %(size)d bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field%(off)02x = 0x%(k)x
 *      frame[frame].handler = %(handler)s
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x%(slot)08x rather than as a
 * link-time constant, so it lives in another translation unit. */
long %(handler)s(struct MK3THREAD *thread);

long %(name)s(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field%(off)02x = 0x%(k)x;
    return mk3_push_handler(thread, (MK3THREADFUNC)%(handler)s);
}
'''


def main(argv):
    src = argv[argv.index("--file") + 1]
    emit = "--emit" in argv
    rest = "--rest" in argv

    rows = dumpfn.table()
    starts = dict((a, dumpfn.plain(s)) for a, s, _ in rows)
    by = {}
    for i, (a, s, p) in enumerate(rows):
        end = rows[i + 1][0] if i + 1 < len(rows) else a + 64
        by.setdefault(dumpfn.plain(s), (a, end, p))

    done = dumpfn.written()
    cap = int(argv[argv.index("--max") + 1]) if "--max" in argv else 64

    want = []
    for n, (a, e, p) in by.items():
        if os.path.basename(p) != src or n in done or e - a > cap:
            continue
        want.append((a, e, n))
    want.sort()

    got = {}
    unknown = []
    for a, e, n in want:
        b = body(a, e, dumpfn.disasm(a, e), starts)
        m = match(b) or match_slot(b, starts)
        if m is None:
            unknown.append((a, e, n))
        else:
            got[n] = (a, e, m)

    if rest:
        for a, e, n in unknown:
            print("%-34s 0x%08x  %d bytes" % (n, a, e - a))
        print("\n%d unrecognised of %d" % (len(unknown), len(want)))
        return 0

    if not emit:
        kinds = {}
        for n, (a, e, m) in got.items():
            kinds[m[0]] = kinds.get(m[0], 0) + 1
        for k in sorted(kinds):
            print("%-12s %d" % (k, kinds[k]))
        print("%-12s %d" % ("unknown", len(unknown)))
        print("%-12s %d" % ("total", len(want)))
        return 0

    # Every callee these bodies reach, declared with the shape the call site
    # implies. A callee written later with a different signature will conflict
    # here, which is the point: the compiler says so.
    decl = {}
    for n, (a, e, (kind, detail)) in got.items():
        if kind == "tail":
            decl.setdefault(detail, "long %s(MK3OBJ *obj);" % detail)
        elif kind == "tail_table":
            decl.setdefault(detail[0],
                            "long %s(MK3OBJ *obj, uint32_t arg, "
                            "uint32_t *table);" % detail[0])
        elif kind == "two_const":
            decl.setdefault(detail[4], "long %s(MK3OBJ *obj);" % detail[4])
    if decl:
        print("/* The callees these reach, declared from what the call sites")
        print(" * pass. One written later with a different signature will")
        print(" * conflict here, which is what the check is for. */")
        for k in sorted(decl):
            if k not in got:
                print(decl[k])
        print("")

    for n in sorted(got, key=lambda x: got[x][0]):
        a, e, (kind, detail) = got[n]
        d = {"name": n, "addr": a, "size": e - a}
        if kind == "empty":
            print(C_EMPTY % d)
        elif kind == "answer":
            d["k"] = detail
            print(C_ANSWER % d)
        elif kind == "tail":
            d["callee"] = detail
            print(C_TAIL % d)
        elif kind == "tail_table":
            d["callee"], d["table"], d["taddr"] = detail
            print(C_TAIL_TABLE % d)
        elif kind == "two_const":
            (d["o1"], d["k1"], d["o2"], d["k2"], d["callee"]) = detail
            print(C_TWO_CONST % d)
        elif kind == "act_slot":
            d["off"], d["k"], d["handler"], d["slot"] = detail
            print(C_ACT_SLOT % d)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
