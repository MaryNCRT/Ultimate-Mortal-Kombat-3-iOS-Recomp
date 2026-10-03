#!/usr/bin/env python3
"""mklogicdata.py -- the fight engine's data tables, read out of the binary.

    python tools/mklogicdata.py <UMK3.armv7> <symbols.txt> <needed.txt> \
                                <native.txt> > build/logic_data.c

Linking all of `decomp/gamecode/logic` leaves about three hundred symbols
undefined, and none of them is code: they are the move lists (`sm_*`), the
animation scripts (`a_*`), the per-character tables (`ochar_*`), the reaction
and strike tables, and the `static` function lists the drone AI walks
(`funcs.NNNN` in the binary's debug symbols). This writes them as C.

## Why the output is 32-bit, and why that is not a compromise

The logic stores addresses in 32-bit words -- `obj->field40 =
(uint32_t)(uintptr_t)a_scorpion` -- because the armv7 code does, and the
behavioural tests that verified it (tools/difftest) build it for i686. So the
program that runs it is i686 too, and there a table here has exactly the
layout it has in the image: a word is a word and a pointer is a word. What does
not carry over is the VALUE of a pointer, so every word is classified:

    in __text with bit 0 set    a Thumb function   -> (uint32_t)name
    inside a data symbol        an address         -> (uint32_t)&sym + off
    in __cstring                text               -> (uint32_t)"..."
    anything else               a number           -> the number

A data symbol that a table points at is emitted too, unless the native build
already defines it, so the output is closed under "points at".

## What it does not guess

The classification only fires on a word that lands on something with a name.
Halfword pairs can still form a value inside a symbol by accident; each one that
lands mid-symbol, rather than on a symbol's first byte, is listed on stderr so it
can be checked against a use site. A word that falls in the image but on nothing
named is left as a number and listed too. The output compiles only with a 32-bit
compiler, and says so.

The output is generated from the user's own binary at build time and is not
checked in: it is the game's data, the same as the textures.
"""

import re
import sys

VM_BIAS = 0x1000

TEXT = (0x00002c94, 0x00002c94 + 893752)
CSTRING = (0x000e0404, 0x000e0404 + 56493)

# The binary has three `static` copies each of q_yes and q_no, one per file.
# The native build gives the two that are not moves.c's a file suffix (see
# CMakeLists.txt), and a table that points at one has to name the right copy.
FUNC_RENAME = {
    0x000a85cc: "q_yes_mkboss", 0x000a85d4: "q_no_mkboss",
    0x0006752c: "q_yes_mkdrone", 0x00067524: "q_no_mkdrone",
}

# Five names the transcription gave to pointer slots that have no symbol of
# their own -- each is a word in __nl_symbol_ptr or __data whose content is an
# address, read here out of the image:
#
#   Difficulty       0x0014e20c  is `_Destiny`: the difficulty IS the column
#                                of the arcade tower
#   SwitchTableA     0x000f3204 -> _switch_close_jumps
#   SwitchTableB     0x000f3210 -> _switch_open_jumps
#   ThreadListHead   0x000f3220 -> _TList
#   uppercut_stream  0x000f3180 -> ___stdoutp, the C library's stdout
SYNTH = ("Difficulty", "SwitchTableA", "SwitchTableB", "ThreadListHead",
         "uppercut_stream")
SYNTH_NEEDS = ("switch_close_jumps", "switch_open_jumps", "TList")
SYNTH_TEXT = """/* ---- slots with no symbol of their own; see tools/mklogicdata.py ---- */
extern long Destiny;
void *Difficulty     = &Destiny;
void *SwitchTableA   = switch_close_jumps;
void *SwitchTableB   = switch_open_jumps;
void *ThreadListHead = TList;

/* `___stdoutp` is filled in by dyld; stdout is not a constant here either. */
static FILE *uppercut_slot;
void *uppercut_stream = &uppercut_slot;
__attribute__((constructor)) static void uppercut_stream_init(void)
{
    uppercut_slot = stdout;
}
"""

LOGIC_DIR = "decomp/gamecode/logic"


def logic_slots(size):
    """Names the logic reads THROUGH: storage it declares as a pointer.

    The same rule as tools/mkglobals.py. A name every declaration spells
    `T *name`, whose symbol is wider than one word, and which the code never
    assigns whole nor takes the address of, is a slot: the code reads the
    word and uses it as the base of the storage. `GrObj`, `Plyr`, `Pp` and
    `block_xfers` are this; `TList` (assigned) and `bt_null` (`&bt_null`) are
    not.
    """
    import glob
    decl = {}
    assigned, addressed = set(), set()
    dpat = re.compile(r"^\s*extern\s+([^;(]*?)\b(\w+)\s*((?:\[[^\]]*\])*)\s*;",
                      re.M)
    # `X = v` assigns the name; `*(T *)X = v` and `*X = v` store THROUGH it,
    # so a `)` or `*` before the name is not an assignment of it. mk3.c's
    # `*(void **)(void *)mo = mo + 0x10` is the case that taught this.
    upat = re.compile(r"(?:(?<![\w.>)*])(\w+)\s*=(?!=))|&\s*(\w+)\b")
    for f in glob.glob(LOGIC_DIR + "/*.c") + glob.glob(LOGIC_DIR + "/*.h"):
        text = open(f, encoding="utf-8", errors="replace").read()
        for m in dpat.finditer(text):
            kind = "ptr" if ("*" in m.group(1) and not m.group(3)) else "other"
            decl.setdefault(m.group(2), set()).add(kind)
        text = re.sub(r"/\*.*?\*/", " ", text, flags=re.S)
        text = re.sub(r"//[^\n]*", " ", text)
        for a, b in upat.findall(text):
            (assigned if a else addressed).add(a or b)
    return set(n for n, k in decl.items()
               if k == {"ptr"} and size.get(n, 0) > 4
               and n not in assigned and n not in addressed
               and n not in VARIABLES)


# Pointer variables whose symbol LOOKS wider than a word. `_txt_tie` holds the
# address of the "tie" string; the gap to the next symbol is 468 bytes only
# because the winner strings after it ("KANO WINS", ...) carry no symbol.
VARIABLES = ("txt_tie",)


def decomp_aliases():
    """Names the transcription gave to `static` tables, with their address.

    `funcs_boss1` is `_funcs.5093` in the image; the decomp named it after
    what it is and wrote the address in the comment:

        extern MK3THREADFUNC funcs_boss1[];              /* 0x0017b9d4 */
    """
    import glob
    out = {}
    pat = re.compile(r"^\s*extern\s+[^;(]*?\b(\w+)\s*\[\]\s*;\s*/\*\s*(0x[0-9a-fA-F]+)\b",
                     re.M)
    for f in glob.glob(LOGIC_DIR + "/*.c"):
        for m in pat.finditer(open(f, encoding="utf-8", errors="replace").read()):
            out[m.group(1)] = int(m.group(2), 16)
    return out


DATA_SECTIONS = ("__DATA,__data", "__DATA,__const", "__DATA,__common",
                 "__DATA,__bss", "__TEXT,__const")
ZERO_SECTIONS = ("__DATA,__common", "__DATA,__bss")


def c_ident(name):
    """`funcs.14271` -> `funcs_14271`, the spelling the decomp uses."""
    return re.sub(r"[^A-Za-z0-9_]", "_", name)


def load_symbols(path):
    """{addr: [names]} and {name: (addr, section)} for data and text.

    SECT lines are the external symbols. The `static` tables only exist as
    STAB lines, which repeat every symbol too -- so a STAB line is taken only
    when it carries a real address and a name no SECT line has.
    """
    syms = {}
    for line in open(path, encoding="utf-8", errors="replace"):
        p = line.split()
        if len(p) < 5 or not p[0].startswith("0x"):
            continue
        a = int(p[0], 16)
        if a == 0:
            continue
        sect = p[3] if p[1] == "SECT" else p[3]
        name = p[-1]
        if not name.startswith("_"):
            continue
        name = c_ident(name[1:])
        if name in syms and p[1] != "SECT":
            continue
        syms[name] = (a, sect)
    return syms


def extents(syms):
    """Each symbol's size: the gap to the next symbol in its section."""
    per = {}
    for name, (a, sect) in syms.items():
        per.setdefault(sect, set()).add(a)
    nxt = {}
    for sect, addrs in per.items():
        s = sorted(addrs)
        for i, a in enumerate(s):
            nxt[(sect, a)] = s[i + 1] if i + 1 < len(s) else None
    out = {}
    for name, (a, sect) in syms.items():
        n = nxt.get((sect, a))
        out[name] = (n - a) if n is not None else 4
    return out


def main():
    binary, symbols, needed_path, native_path = sys.argv[1:5]
    data = open(binary, "rb").read()
    syms = load_symbols(symbols)
    size = extents(syms)
    at = {}
    for n, (a, s) in syms.items():
        at.setdefault(a, []).append(n)
    for alias, a in decomp_aliases().items():
        if alias in syms or a not in at:
            continue
        real = at[a][0]
        syms[alias] = syms[real]
        size[alias] = size[real]
    native = set(l.strip() for l in open(native_path) if l.strip())
    needed = [l.strip() for l in open(needed_path) if l.strip()]

    # Data symbols, sorted, for "which symbol contains this address".
    data_syms = sorted((a, n) for n, (a, s) in syms.items()
                       if s in DATA_SECTIONS)
    starts = [a for a, _ in data_syms]
    by_addr = {}
    for a, n in data_syms:
        by_addr.setdefault(a, []).append(n)
    text_at = {}
    for n, (a, s) in syms.items():
        if s == "__TEXT,__text":
            text_at.setdefault(a, []).append(n)

    import bisect

    def owner(word):
        i = bisect.bisect_right(starts, word) - 1
        if i < 0:
            return None
        a = starts[i]
        names = by_addr[a]
        # Prefer a name something already uses.
        names = sorted(names, key=lambda n: (n not in native, n not in needed,
                                             len(n), n))
        n = names[0]
        if word < a + size[n]:
            return n, word - a
        return None

    def cstring(addr):
        off = addr - VM_BIAS
        end = data.find(b"\0", off, off + 512)
        if end < 0:
            return None
        raw = data[off:end]
        if not all(32 <= b < 127 for b in raw):
            return None
        return raw.decode("ascii").replace("\\", "\\\\").replace('"', '\\"')

    slots = logic_slots(size) - native

    def cname(sym):
        """The C name a binary symbol's STORAGE has here."""
        return sym + "__store" if sym in slots else sym

    emitted = {}
    order = []
    work = [n for n in needed if n not in SYNTH] + list(SYNTH_NEEDS)
    warn = []
    funcs_used = set()
    native_refs = set()

    while work:
        name = work.pop(0)
        if name in emitted or name in native:
            continue
        if name not in syms:
            warn.append("%s: not in the symbol table" % name)
            continue
        a, sect = syms[name]
        n = size[name]
        if sect not in DATA_SECTIONS:
            warn.append("%s: in %s, not data" % (name, sect))
            continue
        if sect in ZERO_SECTIONS:
            emitted[name] = ("zero", n)
            order.append(name)
            continue
        raw = data[a - VM_BIAS:a - VM_BIAS + n]
        if a % 4 or n % 4:
            emitted[name] = ("bytes", list(raw))
            order.append(name)
            continue
        words = []
        for i in range(0, n, 4):
            w = int.from_bytes(raw[i:i + 4], "little")
            lit = None
            if TEXT[0] <= w < TEXT[1] and (w & 1):
                fa = w & ~1
                if fa in FUNC_RENAME:
                    lit = "(uint32_t)%s" % FUNC_RENAME[fa]
                    funcs_used.add(FUNC_RENAME[fa])
                elif fa in text_at:
                    fn = sorted(text_at[fa], key=lambda s: (s not in native,
                                                             len(s), s))[0]
                    lit = "(uint32_t)%s" % fn
                    funcs_used.add(fn)
                    if fn not in native:
                        warn.append("%s+0x%x: function %s is not defined natively"
                                    % (name, i, fn))
            elif CSTRING[0] <= w < CSTRING[1]:
                s = cstring(w)
                if s is not None:
                    lit = '(uint32_t)"%s"' % s
            elif w >= VM_BIAS:
                hit = owner(w)
                # A real pointer into a table lands on a word: every one of
                # the 2,103 aligned hits points into the same fighter's own
                # data. The unaligned ones were all text -- "INS\0" read as
                # 0x00534e49 lands in __common by accident -- and so is a
                # printable word that points at zero-filled storage.
                if hit and (hit[1] % 4 or (
                        syms[hit[0]][1] in ZERO_SECTIONS and all(
                            32 <= b < 127 or b == 0
                            for b in w.to_bytes(4, "little")))):
                    hit = None
                if hit:
                    tgt, off = hit
                    lit = "(uint32_t)&%s" % cname(tgt) if off == 0 else \
                          "(uint32_t)&%s + 0x%x" % (cname(tgt), off)
                    if off:
                        warn.append("%s+0x%x: 0x%08x is %s+0x%x (mid-symbol)"
                                    % (name, i, w, tgt, off))
                    if tgt in native:
                        native_refs.add(tgt)
                    elif tgt not in emitted:
                        work.append(tgt)
            if lit is None:
                if VM_BIAS <= w < 0x00200000 and not (w & 0xffff0000 == 0):
                    if (TEXT[0] <= w < TEXT[1] and w & 1) or w >= 0x000f3000:
                        warn.append("%s+0x%x: 0x%08x looks like an address "
                                    "and lands on nothing named" % (name, i, w))
                lit = "0x%08x" % w if w > 9 else str(w)
            words.append(lit)
        emitted[name] = ("words", words)
        order.append(name)

    out = sys.stdout
    out.write("/* Generated by tools/mklogicdata.py from the binary. Do not edit,\n"
              " * do not commit: it is the game's data. 32-bit only. */\n")
    out.write("#include <stdint.h>\n#include <stdio.h>\n\n")
    out.write("#if UINTPTR_MAX != 0xffffffffu\n"
              "#error \"the fight's tables hold 32-bit addresses: build i686\"\n"
              "#endif\n\n")
    # Every name first, so tables can point at each other in any order.
    for name in order:
        kind = emitted[name][0]
        ctype = "uint32_t" if kind == "words" else "unsigned char"
        out.write("extern %s %s[];\n" % (ctype, cname(name)))
    for name in sorted(native_refs - set(order)):
        out.write("extern unsigned char %s[];\n" % name)
    for fn in sorted(funcs_used):
        out.write("void %s(void);\n" % fn)
    out.write("\n")
    for name in order:
        kind, val = emitted[name]
        a = syms[name][0]
        c = cname(name)
        if kind == "zero":
            out.write("unsigned char %s[%d] __attribute__((aligned(4)));"
                      "  /* 0x%08x */\n" % (c, val, a))
        elif kind == "bytes":
            body = ", ".join(str(b) for b in val)
            out.write("unsigned char %s[%d] = { %s };  /* 0x%08x */\n"
                      % (c, len(val), body, a))
        else:
            out.write("uint32_t %s[%d] = {  /* 0x%08x */\n" % (c, len(val), a))
            for i in range(0, len(val), 4):
                out.write("    " + ", ".join(val[i:i + 4]) + ",\n")
            out.write("};\n")
    out.write("\n")

    # The slots: one word holding the storage's address, which is what the
    # transcription's `T *name` reads.
    out.write("/* ---- %d pointer slots ---- */\n" % len(slots))
    for name in sorted(slots):
        if name in emitted:
            out.write("void *%s = %s;\n" % (name, cname(name)))
        elif name in native:
            warn.append("%s: a slot, but defined natively" % name)
    out.write("\n")
    out.write(SYNTH_TEXT)
    sys.stderr.write("%d symbols emitted, %d warnings\n" % (len(order), len(warn)))
    for w in warn:
        sys.stderr.write("  " + w + "\n")


if __name__ == "__main__":
    main()
