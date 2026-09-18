#!/usr/bin/env python3
"""facts_c.py -- pull the SAME facts out of the readable decomp.

`facts_asm.py` reads the machine transcription and reports stores, calls,
handler targets and constants. This reads our own C and reports the same
things in the same vocabulary, so `factdiff.py` can put the two lists side by
side without either side knowing about the other.

## Why this one can be simple

The house style is regular, and that regularity is the whole reason a checker
is cheap here:

    obj->field1c = 3;                     a store into MK3OBJ at 0x1c
    obj->field00->field58 = 3;            a store into MK3OBJPROC at 0x58
    thread->fieldfc = 1;                  a store into MK3THREAD at 0xfc
    group_sound(obj);                     a call
    mk3_install(thread, (MK3THREADFUNC)t_jhp5)        a handler
    mk3_frame(thread, thread->frame)[1] = ...t_jhp5;  the same, spelled out
    *mk3_frame(thread, thread->frame + 1) = 0x807;    a state token
    return -3;                            the refusal

`mk3logic.h` supplies the offsets. A field spelled `fieldNN` carries its own
offset in its name; the ones with real names -- `a10`, `him`, `slave`, `frame`
-- carry it in the `/* 0xNN` comment beside them. Both are read, per struct,
because 0x44 is `a10` in MK3OBJ and `p_hit` in MK3OBJPROC and confusing the
two would invent a difference that is not there.

## What it deliberately does not do

It does not evaluate expressions. `obj->field1c = obj->field48;` reports a
store of `?`, not of whatever field48 held, for the same reason `facts_asm.py`
reports `?` rather than carrying a stale constant: a wrong fact stated with
confidence is worse than no fact. The diff treats `?` on either side as "not
compared" and says so in its summary, so the pair that cannot be checked is
visible rather than silently counted as agreement.

## What it does not read yet

Each of these shows up as a phantom difference until it is fixed, so anyone
adding to this file should check the list before chasing a report:

  * a loop. `for (i = 0; i < 5; i++) find_part2(obj);` reports ONE call where
    the binary has five unrolled. Reading the bound would fix it.
  * a store through a global: `*(uint32_t *)(G_BYTES + 0x378 + p * 4) = 0`.
    Nothing reached through `G` or `H` is checked at all.
  * a value that is an expression rather than a literal or a name. Following
    one level of copy -- `obj->field1c = obj->field48;` -- would recover a
    good many of the `?`.

## The rule that keeps it honest

A name is a fact only when the symbol table has it. Everything else is `?`.
This file used to report `below` and `carried` -- locals invented here to
hold what the binary keeps in a register -- as though they were values, and
every one came out as a difference against a binary that has no such thing.

Usage:
    python facts_c.py <file.c> [function-name]
"""
import os
import re
import sys

HDR = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                   "..", "decomp", "gamecode", "logic", "mk3logic.h")

# --- the offset map, out of the header ---------------------------------
RE_STRUCT = re.compile(r"typedef struct (MK3[A-Z0-9]*)\s*\{")
RE_END = re.compile(r"^\}\s*(MK3[A-Z0-9]*);")
# a member line, with or without a trailing /* 0xNN comment
RE_MEMBER = re.compile(r"^\s+[A-Za-z_][A-Za-z_0-9 ]*?\s+\**"
                       r"([a-z_][a-z_0-9]*)\s*(?:\[[^\]]*\])?\s*;"
                       r"(?:\s*/\*\s*(0x[0-9a-f]+))?")


def offsets():
    """{struct name: {member: offset}} out of mk3logic.h."""
    out, cur = {}, None
    try:
        fh = open(HDR, encoding="utf-8", errors="replace")
    except OSError:
        return out
    with fh:
        for line in fh:
            m = RE_STRUCT.search(line)
            if m:
                cur = m.group(1)
                out.setdefault(cur, {})
                continue
            m = RE_END.match(line)
            if m:
                cur = None
                continue
            if cur is None:
                continue
            m = RE_MEMBER.match(line)
            if not m:
                continue
            name, off = m.group(1), m.group(2)
            if name.startswith("_pad"):
                continue
            if off is not None:
                out[cur][name] = int(off, 16)
            elif re.fullmatch(r"field[0-9a-f]{2}", name):
                # the name IS the offset, which is the point of the convention
                out[cur][name] = int(name[5:], 16)
    return out


# --- the statements we recognise ---------------------------------------
RE_FUNCDEF = re.compile(r"^(?:long|void|int32_t|uint32_t)\s+\**"
                        r"([A-Za-z_][A-Za-z_0-9]*)\s*\([^;]*\)\s*$")
# obj->field1c = 3;   /  obj->field00->field58 = 3;   /  thread->fieldfc = 1;
RE_STORE = re.compile(r"^\s*([a-z_][a-z_0-9]*)"
                      r"((?:->[a-z_][a-z_0-9]*)+)\s*=\s*([^;]+);")
# A call taking the object, WHEREVER it appears -- `group_sound(obj);` on
# its own, and `if (am_i_facing_him(obj))` inside a condition. Matching
# only bare statements missed every call the file makes inside an `if`,
# which came out as dozens of phantom differences.
RE_CALL = re.compile(r"\b([A-Za-z_][A-Za-z_0-9]*)\s*\(")
# mk3_install(thread, (MK3THREADFUNC)t_jhp5)  and the plyr_install spelling
RE_INSTALL = re.compile(r"mk3_(?:install|push_handler)\s*\(\s*thread\s*,\s*"
                        r"\(MK3THREADFUNC\)\s*([A-Za-z_][A-Za-z_0-9]*)")
RE_PLYRINST = re.compile(r"plyr_install\s*\([^,]+,[^,]+,\s*"
                         r"\(const void \*\)\s*([A-Za-z_][A-Za-z_0-9]*)")
# mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_punch_sleep;
RE_HANDLER = re.compile(r"mk3_frame\([^)]*\)\[1\]\s*=\s*"
                        r"(?:\(uint32_t\)\s*)?(?:\(uintptr_t\)\s*)?"
                        r"([A-Za-z_][A-Za-z_0-9]*)\s*;")
RE_HANDLER2 = re.compile(r"mk3_frame\([^)]*\)\[1\]\s*=$")
RE_BARENAME = re.compile(r"^\s*\(uint32_t\)\(uintptr_t\)"
                         r"([A-Za-z_][A-Za-z_0-9]*)\s*;")
# *(uint32_t *)((char *)obj->field00 + 0x58) = 1;
#
# A field the header had no name for when the function was written. mkstat.c
# spells several this way and every one of them read as a store the binary
# makes and we do not, which is the most alarming shape a difference can take
# and was nothing.
RE_RAWSTORE = re.compile(r"^\s*\*\(uint32_t \*\)\s*\(\(char \*\)\s*"
                         r"([a-z_][a-z_0-9]*(?:->[a-z_][a-z_0-9]*)*)\s*\+\s*"
                         r"(0x[0-9a-fA-F]+)\)\s*=\s*([^;]+);")
# *mk3_frame(thread, thread->frame + 1) = 0x807;
RE_TOKEN = re.compile(r"^\s*\*mk3_frame\([^)]*\)\s*=\s*([^;]+);")
RE_RETURN = re.compile(r"^\s*return\s+([^;]+);")
RE_IF = re.compile(r"^\s*(?:\}\s*else\s+)?if\s*\((.+)\)")

HEXNUM = re.compile(r"^(?:0x[0-9a-fA-F]+|\d+)$")
# only literals, the four operators and brackets -- nothing that could
# name anything, so the eval below cannot reach out of itself
ARITH = re.compile(r"[\s0-9xa-fA-F+\-*()]+")

# `if (obj->field5c != 0)` matches the call pattern and is not a call. So do
# the frame accessors, which are how the readable C spells a field rather
# than anything the binary branches to.
NOT_A_CALL = frozenset((
    "if", "while", "for", "switch", "return", "sizeof",
    "mk3_frame", "mk3_arg", "mk3_install", "mk3_push_handler", "mk3_unwind",
    "plyr_install", "plyr_park1",
    # casts and macros that look like a call in C and are not a call in ARM
    "uint32_t", "uintptr_t", "int32_t", "int16_t", "uint16_t", "uint8_t",
    "long", "void", "const", "MK3THREADFUNC", "MK3OBJ", "MK3OBJPROC",
    "MK3THREAD", "G_BYTES",
    # accessor macros for the half-word fields: they compile to a ldrh/strh,
    # not to anything the binary branches to
    "MK3_FIELD12", "MK3_SET_FIELD12", "MK3_FIELD0E", "MK3_SET_FIELD0E",
    "MK3_FIELD0E_S",
))


def split_functions(path):
    """{name: [line, ...]} for every function body in one .c file."""
    out, name, buf, depth, started = {}, None, [], 0, False
    prev = ""
    with open(path, encoding="utf-8", errors="replace") as fh:
        for line in fh:
            line = line.rstrip("\n")
            if name is None:
                m = RE_FUNCDEF.match(prev) if line.strip() == "{" else None
                if m:
                    name, buf, depth, started = m.group(1), [], 0, False
                prev = line
                if name is None:
                    continue
            depth += line.count("{") - line.count("}")
            if "{" in line:
                started = True
            buf.append(line)
            if started and depth <= 0:
                out[name] = buf
                name = None
            prev = line
    return out


def value(expr, consts=None):
    """A literal as itself, a name as itself, anything else as `?`."""
    e = expr.strip().rstrip(";").strip()
    # strip the casts the house style sprinkles about
    for cast in ("(uint32_t)(uintptr_t)", "(uint32_t)", "(uintptr_t)",
                 "(long)", "(int32_t)", "(MK3THREADFUNC)"):
        while e.startswith(cast):
            e = e[len(cast):].strip()
    if HEXNUM.match(e):
        return hex(int(e, 0))
    m = re.fullmatch(r"\(uint32_t\)-(\d+)", e) or re.fullmatch(r"-(\d+)", e)
    if m:
        return hex(((-int(m.group(1))) & 0xffffffff))
    # `((0xa + 6) - 0xd) + 0x14` is 23. The house style writes these sums out
    # so the binary's shared-literal habit stays visible -- `adds r3, #6` on a
    # register that already holds 10 -- and collapsing them in the source
    # would lose the reading. So the reader does the sum.
    if ARITH.fullmatch(e):
        try:
            return hex(eval(e, {"__builtins__": {}}, {}) & 0xffffffff)
        except Exception:
            return "?"
    if re.fullmatch(r"[A-Za-z_][A-Za-z_0-9]*", e):
        # A bare name is a fact only when it names something the symbol table
        # knows. `t_jhp5` is a routine and comparable; `below`, `carried`,
        # `sel` and `flags` are locals this file invented to hold a value the
        # binary keeps in a register, and reporting one as a fact invents a
        # difference that is not there. They become `?`, which is what they
        # are: not checkable from here.
        return e if is_symbol(e) else "?"
    return "?"


_SYMNAMES = set()


def is_symbol(name):
    """Does the binary have a routine or datum by this name?"""
    if not _SYMNAMES:
        try:
            fh = open("E:/umk3repo/work/symbols.txt", encoding="utf-8",
                      errors="replace")
        except OSError:
            return False
        with fh:
            for line in fh:
                if "SECT" not in line:
                    continue
                parts = line.split()
                if parts:
                    _SYMNAMES.add(parts[-1].lstrip("_"))
    return name in _SYMNAMES


def struct_of(chain, maps):
    """Which struct a `->a->b` chain lands in, by walking the header.

    Only the shapes the file actually uses are followed: an object, its
    header at field00, and the thread. Anything else reports None and its
    stores come out with an unknown base rather than a guessed one.
    """
    parts = [p for p in chain.split("->") if p]
    return parts


def facts_of(lines, maps):
    """One function's facts, in source order."""
    out = []
    for i, line in enumerate(lines):
        s = line.strip()
        # A token store also starts with `*`, so it is recognised BEFORE the
        # comment filter rather than after it. That ordering was a real bug:
        # every state token in the file was silently dropped.
        m = RE_TOKEN.match(line)
        if m:
            out.append(("token", value(m.group(1))))
            continue
        # A raw-offset store starts with `*` too, so it joins the token
        # recogniser ABOVE the comment filter. Both were being eaten.
        m = RE_RAWSTORE.match(line)
        if m:
            base, off, val = m.group(1), m.group(2), m.group(3)
            st = "MK3OBJPROC" if "field00" in base else "MK3OBJ"
            out.append(("store", hex(int(off, 16)), value(val), st))
            continue
        if not s or s.startswith("*") or s.startswith("/*"):
            continue

        m = RE_INSTALL.search(line) or RE_PLYRINST.search(line)
        if m:
            out.append(("handler", m.group(1)))
            continue

        m = RE_HANDLER.search(line)
        if m:
            # `mk3_frame(...)[1] = below;` is the stack surgery putting a
            # SAVED handler back. The name is a local, the value is whatever
            # was there, and neither side can compare it.
            nm = m.group(1)
            out.append(("handler", nm if is_symbol(nm) else "?"))
            continue
        if RE_HANDLER2.search(line.rstrip()):
            nxt = lines[i + 1] if i + 1 < len(lines) else ""
            m = RE_BARENAME.match(nxt)
            if m:
                out.append(("handler", m.group(1)))
            continue

        # Calls are scanned FIRST and without consuming the line, because a
        # call usually lives inside something else: `if (is_he_airborn(obj))`
        # is a branch AND a call, and handling the branch first swallowed
        # every one of them.
        for cm in RE_CALL.finditer(line):
            nm = cm.group(1)
            if nm not in NOT_A_CALL:
                out.append(("call", nm))

        m = RE_STORE.match(line)
        if m:
            root, chain, val = m.group(1), m.group(2), m.group(3)
            members = [p for p in chain.split("->") if p]
            last = members[-1]
            # which struct the LAST hop lands in
            if root == "thread" and len(members) == 1:
                st = "MK3THREAD"
            elif len(members) == 1:
                st = "MK3OBJ"
            else:
                st = "MK3OBJPROC"
            off = maps.get(st, {}).get(last)
            if off is None:
                # try the other two rather than drop the fact entirely
                for alt in ("MK3OBJ", "MK3OBJPROC", "MK3THREAD"):
                    if last in maps.get(alt, {}):
                        st, off = alt, maps[alt][last]
                        break
            if off is not None:
                out.append(("store", hex(off), value(val), st))
            continue

        m = RE_RETURN.match(line)
        if m:
            out.append(("ret", value(m.group(1))))
            continue

        m = RE_IF.match(line)
        if m:
            out.append(("branch", m.group(1).strip()))
            continue

    return out


def main(argv):
    maps = offsets()
    fns = split_functions(argv[1])
    want = argv[2] if len(argv) > 2 else None
    for name in sorted(fns):
        if want and name != want:
            continue
        print("=== %s" % name)
        for f in facts_of(fns[name], maps):
            if f[0] == "store":
                print("    %-8s %-6s = %-22s in %s" % (f[0], f[1], f[2], f[3]))
            else:
                print("    %-8s %s" % (f[0], f[1]))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
