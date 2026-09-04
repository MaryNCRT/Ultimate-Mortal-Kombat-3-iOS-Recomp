#!/usr/bin/env python3
"""parkfn.py -- read the two-state park routines.

A census of what is left in `gamecode/logic` found **346 pending functions
carrying one signature**:

    it      ne
    mvnne   r0, #2

That is the TOKEN CHECK of a routine that resumes at a saved point instead of
starting from the top. Each entry reads `frame[frame+1].w0`, recognises
exactly one value, does that step's work and leaves the next token behind. The
token is a resume point -- these are coroutines written as state machines, and
the shape is a quarter of everything still to read.

Every one of the 346 has exactly ONE such pair, so every one has exactly two
states: the entry at token 0 and one resume.

**The dispatch is uniform; the states are not.** Finding the signature was the
easy half. A state ends in one of three ways, and all three are already in
`pushfn`'s vocabulary -- this only names the combinations:

    park       a token, and a duration into `thread->fieldfc`. It returns the
               duration and is woken with that token. 0x16462 with a token its
               own dispatch rejects means never.
    descend    a token, the frame index INCREMENTED, a handler installed at
               the new level, the slot above cleared. `t_flight`'s shape: a
               call down a level. Returns 0.
    install    a handler at the CURRENT level and the slot cleared, with no
               token and no increment -- `mk3_push_handler`, the shape pushfn
               was built for, reached through a token dispatch.

It runs `pushfn`'s interpreter over each state separately, seeded from the
registers as they stand after the prologue, so all of that tool's refusals
still apply: one instruction it cannot model and the function is not written.
On top of those it refuses:

  - a body whose two states it cannot separate cleanly
  - a state whose ending is none of those three, or more than one of them
  - a token, duration or handler that is not a constant or a named address
  - a call it cannot render, on the same terms as `leaffn`

One ordering matters enough to name: a ZERO into the token slot is the CLEAR
that ends an install, not a token. Testing for a token first ate every clear
in the directory, and this reader accepted nothing at all until that was the
other way round.

Three spellings of the same thing had to be accepted before the yield stopped
looking like a rules problem: the dispatch is `cbnz rTok, RESUME` or
`cmp rTok, #0` with `bne RESUME`; the token check is `cmp` or `cmp.w`. Each
of those cost between forty and eighty functions on its own. **When a reader's
yield is surprisingly low, suspect the spelling before the logic.**

    python tools/parkfn.py --file mkfatal.c [--max 256] [--emit] [--rest]
"""

import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import dumpfn
import microfn
import pushfn
import samefn
from pushfn import Refuse, V, cname, field


def rows(addr, end, text, starts):
    """microfn.body, but keeping each instruction's ADDRESS.

    Branch targets inside a function are addresses, and splitting a body at
    one needs to know where each instruction sits. `microfn.body` drops that
    because nothing else needed it.

    The bl-naming pass at the end is `microfn.body`'s and has to be here too:
    a `bl` carries its target on the SAME line, not as a `; ->` continuation,
    so parsing only the continuations leaves every call unnamed -- and then
    `pushfn` refuses the function for calling nowhere. Ninety-five functions
    were being lost to that omission alone.
    """
    end = samefn.pool_start(addr, end, text)
    out, pending = [], None
    for line in text.rstrip("\n").split("\n"):
        m = re.match(r"^(0x[0-9a-f]+)\s+(\S+)\s*(.*)$", line)
        if m:
            here = int(m.group(1), 16)
            if here >= end:
                continue
            out.append([here, m.group(2), m.group(3).strip(), None])
            pending = out[-1]
            continue
        m = re.match(r"^\s*; -> (0x[0-9a-f]+)\s*(\S*)", line)
        if m and pending is not None:
            pending[3] = (int(m.group(1), 16), m.group(2))
    while out and out[-1][1] == "nop":
        out.pop()

    for ins in out:
        if ins[1] in ("bl", "blx", "b", "b.w"):
            mm = re.match(r"^#(0x[0-9a-f]+)$", ins[2])
            if mm:
                tg = int(mm.group(1), 16)
                if tg in starts:
                    ins[3] = (tg, starts[tg])
    return literals(out)


def literals(out):
    """Turn a bare pool load into the constant it is.

    `ldr rX, [pc, #n]` FOLLOWED BY `add rX, pc` computes an address, and the
    interpreter already handles that pair. On its own, with no add, the same
    instruction loads a plain word -- which is how the compiler spells a
    constant too wide for an immediate. 0x16462, the duration that means never
    wake, is always spelled that way.

    Left as-is those registers stay "pending an address" and every park using
    one is refused for a duration that is not constant. Reading the word and
    rewriting the instruction as a move says what it does.
    """
    for i, ins in enumerate(out):
        if ins[1] not in ("ldr", "ldr.w"):
            continue
        dst, _, rest = ins[2].partition(",")
        dst, rest = dst.strip(), rest.strip()
        m = re.match(r"^\[pc, #(-?(?:0x[0-9a-fA-F]+|\d+))\]$", rest)
        if not m:
            continue
        if any(out[j][1] in ("add", "add.w") and out[j][2] == "%s, pc" % dst
               for j in range(i + 1, min(i + 8, len(out)))):
            continue                        # the pair: an address, not a word
        where = ((ins[0] + 4) & ~3) + int(m.group(1), 0)
        try:
            word = dumpfn.word(where)
        except Exception:
            continue
        ins[1], ins[2], ins[3] = "mov.w", "%s, #%#x" % (dst, word), None
    return out


def branch_target(operands):
    """The address a `b`/`cbz`/`cbnz` names, or None."""
    m = re.search(r"#(0x[0-9a-f]+)$", operands)
    return int(m.group(1), 16) if m else None


def split(b):
    """(prologue_end, state0 range, token, stateT range) or a reason.

    The shape, in order:

        <prologue: frame index, proc, the token>
        cbnz  rTok, RESUME          ; or cbz to the other arm
        <state 0>
        <return>
    RESUME:
        movw  r2, #T                ; or the constant folded into the cmp
        cmp   rTok, r2
        it    ne
        mvnne r0, #2
        bne   RETURN
        <state T>
        <return>
    """
    at = dict((r[0], i) for i, r in enumerate(b))

    pair = None
    for i in range(len(b) - 2):
        if b[i][1] == "it" and b[i][2] == "ne" \
           and b[i + 1][1] == "mvnne" and b[i + 1][2] == "r0, #2" \
           and b[i + 2][1] == "bne":
            if pair is not None:
                return None, "more than one token check"
            pair = i
    if pair is None:
        return None, "not the park shape"

    # The comparison feeding it, and the value compared against.
    if pair < 1 or b[pair - 1][1] not in ("cmp", "cmp.w"):
        return None, "the token check has no cmp"
    cmp_at = pair - 1
    lhs, _, rhs = b[cmp_at][2].partition(",")
    rhs = rhs.strip()
    if rhs.startswith("#"):
        token = int(rhs[1:], 0)
        first = cmp_at
    else:
        if cmp_at < 1 or b[cmp_at - 1][1] not in ("movw", "mov.w", "movs",
                                                  "mov"):
            return None, "the compared value is not a constant here"
        d, _, v = b[cmp_at - 1][2].partition(",")
        if d.strip() != rhs or not v.strip().startswith("#"):
            return None, "the compared value is not a constant here"
        token = int(v.strip()[1:], 0)
        first = cmp_at - 1

    # The dispatch branch, in either of the two spellings the compiler used:
    # `cbnz rTok, RESUME`, or `cmp rTok, #0` and `bne RESUME`. They mean the
    # same thing, and taking only the compact one lost seventy-nine functions.
    disp, taken = None, None
    for i in range(first):
        if b[i][1] in ("cbz", "cbnz"):
            disp, taken = i, b[i][1] == "cbnz"
        elif b[i][1] in ("cmp", "cmp.w") and b[i][2].endswith(", #0") \
                and i + 1 < first and b[i + 1][1] in ("bne", "beq"):
            disp, taken = i + 1, b[i + 1][1] == "bne"
    if disp is None:
        return None, "no dispatch branch"
    tgt = branch_target(b[disp][2])
    if tgt is None or tgt not in at:
        return None, "the dispatch goes somewhere unmapped"

    resume = at[tgt]
    if taken:
        s0 = (disp + 1, resume)         # fall through on token == 0
    else:
        return None, "the zero arm is the branch, which this has not seen"
    if resume != first:
        return None, "the resume does not start at the token check"

    return (disp, s0, token, (pair + 3, len(b))), None


RET = ("pop", "bx", "b")


def run_region(run, b, lo, hi, skip):
    """Execute b[lo:hi] on `run`, stopping at the region's return."""
    i = lo
    while i < hi:
        op = b[i][1]
        if i in skip or op in RET:
            i += 1
            continue
        i += run.step(i)


class ParkRun(pushfn.Run):
    """pushfn's interpreter over a body indexed with addresses."""

    def __init__(self, b, starts):
        pushfn.Run.__init__(self, [[r[1], r[2], r[3]] for r in b], starts)

    def step(self, i):
        """One extra rule, the same one `leaffn` needed: a load through the
        OBJECT keeps its provenance.

        `pushfn` only tracks where the thread's fields go, so a load from the
        object falls through to unknown and every store of that value is
        refused for not being a constant. `obj->field20 = obj->field1c` is
        ordinary in these routines and worth being able to write.
        """
        op, args, _tgt = self.b[i]
        dst, _, rest = args.partition(",")
        dst, rest = dst.strip(), rest.strip()
        if op in ("ldr", "ldr.w"):
            m = re.match(r"^\[(\w+), #(0x[0-9a-fA-F]+|\d+)\]$", rest)
            if m and self.get(m.group(1)).kind == "proc":
                self.r[dst] = V("objload", int(m.group(2), 0))
                return 1
        return pushfn.Run.step(self, i)


def classify(effects, starts):
    """What one state does, or a reason it cannot be told.

    A state ends one of two ways, and both are already in the interpreter's
    vocabulary -- no new modelling, only naming the combinations:

      **park**      a token into frame[frame+1].w0 and a duration into
                    thread->fieldfc. The routine returns the duration and is
                    woken with that token.

      **descend**   a token, then the frame index INCREMENTED, a handler
                    installed at the new level, and the slot above cleared.
                    That is `t_flight`'s shape: a call down a level rather
                    than a wait. It returns 0.

    Anything else -- a state that does both, or neither, or writes somewhere
    this cannot place -- is refused.
    """
    out, token, dur = [], None, None
    handler, bumped, cleared = None, False, False
    for eff in effects:
        if eff[0] == "call":
            if eff[2][0].kind != "proc":
                return None, "a call whose first argument is not the object"
            if eff[2][1].kind not in ("imm", "unknown", "proc"):
                return None, "a call argument this cannot render"
            out.append(eff)
            continue
        _, base, off, val, width = eff
        if base.kind == "framew0" and off == 0:
            # ZERO first. A zero into this slot is the CLEAR that ends an
            # install, not a token -- and testing for a token first ate every
            # clear in the directory, which is why this reader accepted
            # nothing at all until the order was fixed.
            if val.kind == "framew0" or (val.kind == "imm" and val.a == 0):
                cleared = True
            elif val.kind == "imm" and token is None:
                token = val.a
            else:
                return None, "the token is not a constant"
        elif base.kind == "thread" and off == 0xfc:
            if val.kind != "imm":
                return None, "the duration is not a constant"
            dur = val.a
        elif base.kind == "thread" and off == 0xa4:
            if val.kind != "frame" or val.a != 1:
                return None, "the frame index moves somewhere unexpected"
            bumped = True
        elif base.kind == "slot" and off == 4:
            if val.kind != "pcrel":
                return None, "the handler is not an address"
            handler = val
        elif base.kind == "proc":
            if val.kind not in ("imm", "objload"):
                return None, "a store whose value is not a constant"
            out.append(("store", off, val))
        else:
            return None, "a store this does not model"

    # A value read from a field this state also writes is a SAVED value being
    # put back, not a re-read -- the same trap `leaffn` fell into once. Without
    # the loads in order the two cannot be told apart, so refuse.
    written = set(x[1] for x in out if x[0] == "store")
    for x in out:
        if x[0] == "store" and x[2].kind == "objload" and x[2].a in written:
            return None, "a saved value, not a re-read"

    if token is not None and dur is not None and handler is None and not bumped:
        return ("park", out, token, dur), None
    if token is not None and handler is not None and bumped and cleared \
            and dur is None:
        return ("descend", out, token, handler), None
    # The third ending: replace the handler at the CURRENT level, no token and
    # no increment. That is `mk3_push_handler` -- the shape pushfn was built
    # for -- reached here through a token dispatch instead of a guard.
    if token is None and handler is not None and cleared and not bumped \
            and dur is None:
        return ("install", out, handler), None
    return None, "not one of park, descend or install"


def read(name, a, e, starts):
    text = dumpfn.disasm(a, e)
    b = rows(a, e, text, starts)
    got, why = split(b)
    if got is None:
        return None, why
    disp, s0, token, sT = got

    run = ParkRun(b, starts)
    try:
        i = 0
        while i <= disp:
            # The dispatch itself is not an effect. Its `cmp` and branch are
            # accounted for by `split`, and the interpreter models neither.
            if b[i][1] in ("cbz", "cbnz", "cmp", "cmp.w", "bne", "beq"):
                i += 1
                continue
            i += run.step(i)
        after = dict(run.r)

        run.effects = []
        run_region(run, b, s0[0], s0[1], set())
        e0, why = classify(run.effects, starts)
        if e0 is None:
            return None, "state 0: " + why
        if e0[0] in ("descend", "install") and pushfn.name_of(
                e0[3] if e0[0] == "descend" else e0[2], starts) is None:
            return None, "state 0 descends into an unnamed handler"

        run.r = dict(after)
        run.effects = []
        # The comparison block itself is not an effect: the movw/cmp/it/mvnne
        # and its branch are the dispatch, already accounted for by `split`.
        run_region(run, b, sT[0], sT[1], set())
        eT, why = classify(run.effects, starts)
        if eT is None:
            return None, "state %#x: %s" % (token, why)
        if eT[0] in ("descend", "install") and pushfn.name_of(
                eT[3] if eT[0] == "descend" else eT[2], starts) is None:
            return None, "the resume descends into an unnamed handler"
    except Refuse as why:
        return None, str(why)

    return (e0, token, eT), None


def rhs(val):
    """The right-hand side of a store: a constant, or a field of the object."""
    if val.kind == "imm":
        return "0x%x" % val.a
    f = field(val.a)
    return ("obj->%s" % f) if f else \
           ("*(uint32_t *)((char *)obj + 0x%02x)" % val.a)


def work(eff, indent):
    """The stores and calls a state does before it parks or descends."""
    out = ""
    for x in eff:
        if x[0] == "call":
            arg = x[2][1]
            if arg.kind == "imm":
                out += "%s%s(obj, 0x%x)" % (indent, x[1], arg.a)
            else:
                out += "%s%s(obj)" % (indent, x[1])
        else:
            _, off, val = x
            f = field(off)
            lhs = ("obj->%s" % f) if f else \
                  ("*(uint32_t *)((char *)obj + 0x%02x)" % off)
            out += "%s%s = %s" % (indent, lhs, rhs(val))
        out += "\n"
    return out


def steps(state, starts, indent=" *          "):
    kind = state[0]
    out = work(state[1], indent)
    if kind == "park":
        _, _, token, dur = state
        out += "%spark(token 0x%x, duration 0x%x)%s\n" % (
            indent, token, dur, "   and never wakes" if dur == 0x16462 else "")
    elif kind == "descend":
        _, _, token, handler = state
        out += "%stoken := 0x%x, then descend into %s\n" % (
            indent, token, pushfn.name_of(handler, starts))
    else:
        _, _, handler = state
        out += "%sframe[frame].handler = %s\n" % (
            indent, pushfn.name_of(handler, starts))
    return out


def code(state, starts, indent="        "):
    kind = state[0]
    out = ""
    for x in state[1]:
        if x[0] == "call":
            arg = x[2][1]
            if arg.kind == "imm":
                out += "%s%s(obj, 0x%x);\n" % (indent, cname(x[1]), arg.a)
            else:
                out += "%s%s(obj);\n" % (indent, cname(x[1]))
        else:
            _, off, val = x
            f = field(off)
            lhs = ("obj->%s" % f) if f else \
                  ("*(uint32_t *)((char *)obj + 0x%02x)" % off)
            out += "%s%s = %s;\n" % (indent, lhs, rhs(val))
    if kind == "park":
        _, _, token, dur = state
        out += ("%s*mk3_frame(thread, thread->frame + 1) = 0x%x;\n"
                "%sthread->fieldfc = 0x%x;%s\n"
                "%sreturn 0x%x;\n"
                % (indent, token, indent, dur,
                   "          /* and never wakes */"
                   if dur == 0x16462 else "", indent, dur))
    elif kind == "descend":
        _, _, token, handler = state
        out += ("%s*mk3_frame(thread, thread->frame + 1) = 0x%x;\n"
                "%sthread->frame = thread->frame + 1;      /* push a level */\n"
                "%smk3_frame(thread, thread->frame)[1] =\n"
                "%s    (uint32_t)(uintptr_t)%s;\n"
                "%s*mk3_frame(thread, thread->frame + 1) = 0;\n"
                "%sreturn 0;\n"
                % (indent, token, indent, indent, indent,
                   cname(pushfn.name_of(handler, starts)), indent, indent))
    else:
        _, _, handler = state
        out += ("%sreturn mk3_push_handler(thread, (MK3THREADFUNC)%s);\n"
                % (indent, cname(pushfn.name_of(handler, starts))))
    return out


def render(name, a, size, s0, token, sT, starts):
    body = ("/* %s -- armv7 0x%08x, %d bytes.  **Complete.**\n"
            " *\n"
            " *      token == 0:\n%s"
            " *      token == 0x%x:\n%s"
            " *      otherwise:  return -3\n"
            " */\n"
            "long %s(MK3THREAD *thread)\n"
            "{\n"
            "%s"
            "    uint32_t token = *mk3_frame(thread, thread->frame + 1);\n"
            "\n"
            "    if (token == 0) {\n%s    }\n"
            "\n"
            "    if (token != 0x%x)\n        return -3;\n"
            "\n%s}\n"
            % (name, a, size,
               steps(s0, starts), token, steps(sT, starts),
               cname(name),
               # Only declare the object when a state actually touches it. A
               # routine that does nothing but park and install never does,
               # and an unused local is a warning for no reason.
               "    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;\n"
               if (s0[1] or sT[1]) else "",
               code(s0, starts), token,
               code(sT, starts, "    ")))
    calls = [(x[1], x[2][1].kind == "imm")
             for st in (s0, sT) for x in st[1] if x[0] == "call"]
    handlers = [pushfn.name_of(st[3] if st[0] == "descend" else st[2], starts)
                for st in (s0, sT) if st[0] in ("descend", "install")]
    return body, calls, handlers


def main(argv):
    src = argv[argv.index("--file") + 1]
    emit = "--emit" in argv
    rest = "--rest" in argv
    cap = int(argv[argv.index("--max") + 1]) if "--max" in argv else 256

    tbl = dumpfn.table()
    starts = dict((x[0], dumpfn.plain(x[1])) for x in tbl)
    by = {}
    for i, (x, s, p) in enumerate(tbl):
        end = tbl[i + 1][0] if i + 1 < len(tbl) else x + 64
        by.setdefault(dumpfn.plain(s), (x, end, p))
    done = dumpfn.written()

    want = sorted((x, e, n) for n, (x, e, p) in by.items()
                  if os.path.basename(p) == src and n not in done
                  and e - x <= cap)

    ok, bad = [], []
    for x, e, n in want:
        got, why = read(n, x, e, starts)
        (ok if got else bad).append((x, e, n, got or why))

    if not emit:
        for x, e, n, got in ok:
            print("  %-32s %3d bytes" % (n, e - x))
        if rest:
            for x, e, n, why in bad:
                print("  -- %-29s %s" % (n, why))
        print("%s: %d of %d" % (src, len(ok), len(want)))
        return 0

    blocks, decls, hands = [], {}, set()
    for x, e, n, got in ok:
        s0, token, sT = got
        text, calls, handlers = render(n, x, e - x, s0, token, sT, starts)
        for fn, two in calls:
            if decls.get(fn) is None:
                decls[fn] = two
        hands.update(handlers)
        blocks.append(text)
    if not blocks:
        return 0
    for h in sorted(hands):
        print("long %s(MK3THREAD *thread);" % cname(h))
    for fn in sorted(decls):
        print("void %s(MK3OBJ *obj%s);"
              % (cname(fn), ", uint32_t arg" if decls[fn] else ""))
    print("")
    print("\n\n".join(blocks))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
