#!/usr/bin/env python3
"""leaffn.py -- read the straight-line leaf functions.

`pushfn.py` executes a body symbolically and accepts it only if the effects
come out as the frame-push shape: a guard, some stores, a handler. A census of
what is left in `gamecode/logic` found **a hundred functions under 96 bytes
with no branch in them at all** -- no guard, no handler, just stores into the
object and calls, then a return. `pushfn` refuses every one of them for want
of a guard it was built to require.

This is the same interpreter with that requirement removed. It reuses
`pushfn.Run` and seeds r0 with the OBJECT rather than the thread, so a store
through r0 is a store into MK3OBJ and the existing rules apply unchanged.

It refuses the same way `pushfn` does: one instruction it cannot account for
and the function is not written down. In particular it refuses rather than
guesses about the RETURN VALUE, because guessing there is exactly the mistake
that made `randper` and `DrawSkinnedMesh2` lose values their callers were
using:

  - a body ending in a call, with nothing setting r0 afterwards, leaves the
    callee's leftover in r0. That is not a value this function computed, so
    it is written `void`.
  - a body whose r0 at the end is something this function put there returns
    it, and is written `long`.
  - anything else is refused.

    python tools/leaffn.py --file mkzap.c [--max 96] [--emit] [--rest]
"""

import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import dumpfn
import microfn
import pushfn
from pushfn import Refuse, V, cname, field, name_of


# The three fields of MK3OBJ that hold pointers. Everything else the struct
# names is a word, so a second argument taken from one of these is declared as
# what it is rather than as an integer that happens to be the same width.
PTRFIELD = {0x00: "MK3OBJPROC *", 0x04: "MK3THREAD *", 0x08: "MK3OBJ *"}


BRANCH = set("b bne beq blt bgt ble bge bhi bls bcc bcs bmi bpl cbz cbnz "
             "it ite itt itte ittt itet tbb tbh blx".split())


class LeafRun(pushfn.Run):
    """pushfn's interpreter with the object in r0 instead of the thread."""

    def __init__(self, body, starts):
        pushfn.Run.__init__(self, body, starts)
        self.r = {"r0": V("proc")}
        # True when the last thing to touch r0 was a call. That is the one
        # case where an unknown r0 at the end is PROVABLY not a value this
        # function computed -- it is the callee's leftover. Without this
        # distinction "unknown means void" would drop a real return, which is
        # the mistake that hid randper's answer and DrawSkinnedMesh2's count.
        self.r0_from_call = False
        # Registers written since the last call. A function that sets r2 or r3
        # before a `bl` is passing a THIRD or fourth argument, and this reader
        # only models two -- so that call gets refused rather than written with
        # the extra arguments silently dropped. `secret_move_search` takes
        # three and was emitted with one before this existed.
        self.wrote = set()

    def step(self, i):
        """One extra rule: a load through the object keeps its provenance.

        `pushfn` only cares where the THREAD's fields go, so a load from the
        object falls through to unknown and every later store through that
        register is refused. But `ldr r1, [r0, #8]` then `str r3, [r1, #0x2c]`
        is `obj->field08->field2c = ...`, which is the commonest two-step in
        this directory. Remembering the offset is all it takes to write it.
        """
        op, args, _tgt = self.b[i]
        dst, _, rest = args.partition(",")
        dst, rest = dst.strip(), rest.strip()

        if op == "bl" and ("r2" in self.wrote or "r3" in self.wrote):
            raise Refuse("a call with more arguments than this models")

        n = None
        if op in ("ldr", "ldr.w"):
            m = re.match(r"^\[(\w+), #(0x[0-9a-fA-F]+|\d+)\]$", rest)
            if m and self.get(m.group(1)).kind == "proc":
                self.r[dst] = V("objload", int(m.group(2), 0))
                n = 1
            elif rest == "[r0]" and self.get("r0").kind == "proc":
                self.r[dst] = V("objload", 0)
                n = 1

        if n is None:
            n = pushfn.Run.step(self, i)

        if op == "bl":
            # Whether r1 was LOADED for this call decides if there is a second
            # argument at all. `q_am_i_a_boss` is `ldr r1, [r0, #8]` then
            # `bl bossck`, which is bossck(obj, obj->field08) -- and was
            # written `bossck(obj)` until this flag existed.
            if self.effects and self.effects[-1][0] == "call":
                self.effects[-1] = self.effects[-1] + ("r1" in self.wrote,)
            self.r0_from_call = True
            self.wrote = set()
        else:
            if dst == "r0":
                self.r0_from_call = False
            if op in ("str", "str.w", "strh", "strh.w", "strb", "strd"):
                # A store CONSUMES the register it names first: `ldr r3, [..]`
                # then `str r3, [..]` is scratch for that store and dead
                # afterwards, not an argument waiting for a call.
                self.wrote.discard(dst)
            elif op in ("push", "pop", "cmp", "cmn", "tst", "tst.w"):
                pass
            elif re.match(r"^r\d+$|^ip$|^lr$|^sl$|^fp$", dst):
                self.wrote.add(dst)
        return n


def straight(b):
    """True when nothing in the body branches.

    A `bl` is a call, not a branch. A trailing `bx` is the return. Everything
    else in BRANCH means control flow this does not model, and a function with
    any of it is left for a person.
    """
    ops = [row[0] for row in b]
    if not ops:
        return False
    inner = ops[:-1] if ops[-1] == "bx" else ops
    return not any(o in BRANCH for o in inner)


def read(name, a, e, starts):
    """(effects, returns) or (None, reason)."""
    b = microfn.body(a, e, dumpfn.disasm(a, e), starts)
    if not straight(b):
        return None, "it branches"

    run = LeafRun(b, starts)
    try:
        i = 0
        while i < len(b):
            i += run.step(i)
    except Refuse as why:
        return None, str(why)

    effects = []
    for eff in run.effects:
        if eff[0] == "call":
            # A call whose r1 was loaded for it takes a second argument. If
            # this cannot render that argument it refuses, because writing the
            # call without it is a silent change of meaning.
            live = eff[3] if len(eff) > 3 else False
            if live and eff[2][1].kind not in ("imm", "objload", "proc"):
                return None, "a second argument this cannot render"
            effects.append(("call", eff[1], eff[2], live))
            continue
        _, base, off, val, width = eff
        if base.kind == "proc":
            effects.append(("store", off, val, width))
        elif base.kind == "objload":
            effects.append(("store2", base.a, off, val, width))
        else:
            return None, "a store somewhere this does not model"

    if not effects:
        return None, "nothing happens"

    # A load rendered as a re-read is only the same thing if nothing wrote
    # that field in between. `setup_proj_obj` loads 0x40, overwrites it, calls
    # out, and puts the ORIGINAL back at the end -- borrow and restore, the
    # commonest idiom in this directory. Written as a re-read it becomes
    # `obj->field40 = obj->field40`, which is not what the binary does.
    #
    # Telling the two apart needs the loads in order, which these effects do
    # not carry. So: if a stored value came from a field this function also
    # writes, refuse. Losing a few is better than writing one wrong.
    written = set(e[1] for e in effects if e[0] == "store")
    written |= set(e[2] for e in effects if e[0] == "store2")
    for e in effects:
        val = e[3] if e[0] == "store2" else (e[2] if e[0] == "store" else None)
        if val is not None and val.kind == "objload" and val.a in written:
            return None, "a saved value, not a re-read"

    # The return value, decided rather than assumed. `pop {..., pc}` and
    # `bx lr` both end here; what matters is whether anything this function
    # did put a value in r0.
    r0 = run.get("r0")
    if run.r0_from_call:
        returns = None                  # the callee's leftover; not ours
    elif r0.kind == "proc":
        returns = None                  # never written; still the argument
    elif r0.kind == "imm":
        returns = r0.a
    else:
        return None, "cannot tell what it returns"

    return (effects, returns), None


def declare(fn, two):
    return "%s %s(MK3OBJ *obj%s);" % ("long" if False else "void", cname(fn),
                                      ", uint32_t arg" if two else "")


def render(name, a, size, effects, returns):
    """One function, comment and body."""
    steps, body, seen = "", "", []
    for eff in effects:
        if eff[0] == "call":
            fname, argv = eff[1], eff[2]
            live = eff[3] if len(eff) > 3 else False
            arg, ty = None, None
            if live:
                if argv[1].kind == "imm":
                    arg, ty = "0x%x" % argv[1].a, "uint32_t"
                elif argv[1].kind == "proc":
                    arg, ty = "obj", "MK3OBJ *"
                elif argv[1].kind == "objload":
                    vf = field(argv[1].a)
                    if vf is None:
                        return None, seen
                    arg = "obj->%s" % vf
                    ty = PTRFIELD.get(argv[1].a, "uint32_t")
            if arg is None:
                steps += " *      %s(obj)\n" % fname
                body += "    %s(obj);\n" % cname(fname)
            else:
                steps += " *      %s(obj, %s)\n" % (fname, arg)
                body += "    %s(obj, %s);\n" % (cname(fname), arg)
            seen.append((fname, ty))
            continue

        if eff[0] == "store2":
            _, base_off, off, val, width = eff
            bf, f = field(base_off), field(off)
            lhs = "%s->%s" % (
                ("obj->%s" % bf) if bf
                else ("(*(MK3OBJ **)((char *)obj + 0x%02x))" % base_off),
                f if f else None)
            if f is None:
                return None, seen
        else:
            _, off, val, width = eff
            f = field(off)
            lhs = ("obj->%s" % f) if f else \
                  ("*(uint32_t *)((char *)obj + 0x%02x)" % off)

        if val.kind == "imm":
            rhs = "0x%x" % val.a
        elif val.kind == "objload":
            vf = field(val.a)
            rhs = ("obj->%s" % vf) if vf else None
        else:
            rhs = None
        if rhs is None:
            return None, seen
        steps += " *      %s = %s\n" % (lhs, rhs)
        body += "    %s = %s;\n" % (lhs, rhs)

    rt = "void" if returns is None else "long"
    tail = "" if returns is None else "    return 0x%x;\n" % returns
    if returns is not None:
        steps += " *      return 0x%x\n" % returns

    out = ("/* %s -- armv7 0x%08x, %d bytes.  **Complete.**\n"
           " *\n%s */\n"
           "%s %s(MK3OBJ *obj)\n{\n%s%s}\n"
           % (name, a, size, steps, rt, cname(name), body, tail))
    return out, seen


def main(argv):
    src = argv[argv.index("--file") + 1]
    emit = "--emit" in argv
    rest = "--rest" in argv
    cap = int(argv[argv.index("--max") + 1]) if "--max" in argv else 96

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

    if not emit:
        for a, e, n, got in ok:
            eff, ret = got
            print("  %-30s %2d bytes  %d effects%s"
                  % (n, e - a, len(eff), "" if ret is None else "  returns"))
        if rest:
            for a, e, n, why in bad:
                print("  -- %-27s %s" % (n, why))
        print("%s: %d of %d" % (src, len(ok), len(want)))
        return 0

    blocks, decls = [], {}
    for a, e, n, got in ok:
        eff, ret = got
        text, seen = render(n, a, e - a, eff, ret)
        if text is None:
            continue
        for fname, ty in seen:
            if decls.get(fname) is None:
                decls[fname] = ty
        blocks.append(text)

    if not blocks:
        return 0
    for fn in sorted(decls):
        print("void %s(MK3OBJ *obj%s);"
              % (cname(fn), (", %s arg" % decls[fn].rstrip()) if decls[fn]
                 else ""))
    print("")
    print("\n\n".join(blocks))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
