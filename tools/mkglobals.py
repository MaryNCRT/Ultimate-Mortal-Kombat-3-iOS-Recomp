#!/usr/bin/env python3
"""mkglobals.py -- emit definitions for every global the decomp only declares.

The decompiled sources are transcriptions: every global they touch is an
`extern` and nothing defines it, so the tree compiles and does not link. This
walks the `extern` declarations, keeps the ones no translation unit defines, and
writes a single C file that gives each one storage.

    python tools/mkglobals.py > runtime/gamecode_globals.c

## The pointer-slot problem

Most globals are declared the way the binary reaches them. A plain scalar is

    extern int GameMode;                    /* slot -> 0x0014faa4 */

and a **pointer slot** is

    extern float *col;                      /* pointer slot -> 0x0014fa00 */

where the code writes `*col` or `col[i]`. Defining that as a bare `float *col;`
gives a null pointer and the first read segfaults. So a pointer-slot global gets
**backing storage plus a definition that points at it**:

    static float col__store[SLOT_WORDS];
    float *col = col__store;

`SLOT_WORDS` is deliberately generous: the real extents are not all known, and a
few words of slack costs nothing against a crash that would take an afternoon to
localise. Where an extent IS known -- because the declaration carries a size --
that size is used instead.

This file is generated. Do not hand-edit it; change this script.
"""

import os
import re
import subprocess
import sys
import tempfile

DECOMP_DIRS = ["decomp/gamecode", "decomp/lime"]
SLOT_WORDS = 64

# Field types whose size is known without a layout. Anything else embedded by
# value has to have a body in the decomp, or the struct around it cannot be
# given storage.
SCALARS = {
    "char", "short", "int", "long", "float", "double", "void", "size_t",
    "signed", "unsigned", "uintptr_t",
    "int8_t", "int16_t", "int32_t", "int64_t",
    "uint8_t", "uint16_t", "uint32_t", "uint64_t",
}

# Declarations we must NOT define here: the runtime owns them, or they are
# function prototypes that only look like data.
SKIP_PREFIX = ("lime", "gl", "EASDK", "EASOC")

# `extern <stuff> <name>[dims];` on one line. The decomp writes these one per
# line with the address in a trailing comment, which is what makes this safe.
DECL = re.compile(
    r"^extern\s+"
    r"(?P<type>(?:const\s+|unsigned\s+|signed\s+|struct\s+)*"
    r"[A-Za-z_][A-Za-z0-9_]*)\s+"
    r"(?P<stars>[*]*)\s*"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_]*)\s*"
    r"(?P<dims>(?:\[[^\]]*\])*)\s*;"
)


# Just the `extern <type>` head, so a declarator list can be split off it.
HEAD = re.compile(
    r"^extern\s+(?P<type>(?:const\s+|unsigned\s+|signed\s+|struct\s+)*"
    r"[A-Za-z_][A-Za-z0-9_]*)\s+"
)

# `extern void (*TaskFunctionList[])(void);` -- a table of task entry points.
# It has parentheses, so the plain-declaration path skips it as a prototype, but
# it is data and the front end indexes it every frame.
FNPTR = re.compile(
    r"^extern\s+(?P<ret>[A-Za-z_]\w*)\s*"
    r"\(\s*\*\s*(?P<name>[A-Za-z_]\w*)\s*(?P<dims>(?:\[[^\]]*\])*)\s*\)\s*"
    r"\((?P<args>[^)]*)\)\s*;"
)


class FnPtrMatch(object):
    """Quacks like a DECL match so the emitter can treat both the same."""

    def __init__(self, m):
        self._m = m

    def group(self, k):
        if k == "type":
            return self._m.group("ret")
        if k == "name":
            return self._m.group("name")
        if k == "stars":
            return ""
        if k == "dims":
            return self._m.group("dims")
        return self._m.group(k)

    fnptr = True


def decl_lines():
    """Every `extern ...;` declaration in the decomp, one per declarator.

    Two shapes need care. `extern long A, B, C;` declares three globals on one
    line -- taking only the first left sixty of them undefined. And a function-
    pointer table has parentheses, so the prototype filter would throw it away.
    """
    for d in DECOMP_DIRS:
        for fn in sorted(os.listdir(d)):
            if not fn.endswith(".c"):
                continue
            path = os.path.join(d, fn)
            with open(path, encoding="utf-8", errors="replace") as fh:
                for line in fh:
                    line = line.strip()
                    if not line.startswith("extern "):
                        continue

                    fp = FNPTR.match(line)
                    if fp:
                        yield path, line, FnPtrMatch(fp)
                        continue

                    if "(" in line.split(";")[0]:
                        continue            # a real function prototype

                    m = DECL.match(line)
                    if m:
                        yield path, line, m
                        continue

                    # `extern long A, B, C;` -- DECL wants the `;` right after
                    # the name, so it does not match this at all. Split the
                    # declarator list and re-match each one against the shared
                    # base type. Sixty globals were missing on this alone.
                    head = HEAD.match(line)
                    if not head:
                        continue
                    body = line.split(";")[0][head.end():]
                    for part in body.split(","):
                        part = part.strip()
                        if not part:
                            continue
                        m2 = DECL.match("extern %s %s;"
                                        % (head.group("type"), part))
                        if m2:
                            yield path, line, m2


# The transcription writes a layout two ways: inline as
# `typedef struct X { ... } X;`, or forward-declared and then given its body at
# the function that proved it, as a bare `struct X { ... };`. Both are real
# definitions and both have to be scraped, or half the layouts go missing.
TYPEDEF = re.compile(r"^typedef struct\s+([A-Za-z_][A-Za-z0-9_]*)\s*\{")
# ... and the anonymous form, whose name only appears on the closing line.
ANONDEF = re.compile(r"^typedef struct\s*\{")
ANONEND = re.compile(r"^\}\s*([A-Za-z_][A-Za-z0-9_]*)\s*;")
STRUCTDEF = re.compile(r"^struct\s+([A-Za-z_][A-Za-z0-9_]*)\s*\{")


def typedef_blocks():
    """Every struct layout in the decomp, by name, plus the names of the ones
    that are only ever forward-declared.

    The layouts live in the .c files that established them -- that is where the
    offsets were proved -- so this scrapes them rather than duplicating them by
    hand. A duplicate would drift.
    """
    out, opaque = {}, set()
    for d in DECOMP_DIRS:
        for fn in sorted(os.listdir(d)):
            if not fn.endswith(".c"):
                continue
            with open(os.path.join(d, fn), encoding="utf-8",
                      errors="replace") as fh:
                lines = fh.readlines()
            i = 0
            while i < len(lines):
                line = lines[i]
                fwd = re.match(r"^typedef struct\s+(\w+)\s+\1\s*;", line)
                if fwd:
                    opaque.add(fwd.group(1))
                    i += 1
                    continue
                m = TYPEDEF.match(line) or STRUCTDEF.match(line)
                anon = None if m else ANONDEF.match(line)
                if not m and not anon:
                    i += 1
                    continue
                name, depth, block = (m.group(1) if m else None), 0, []
                while i < len(lines):
                    block.append(lines[i].rstrip("\n"))
                    depth += lines[i].count("{") - lines[i].count("}")
                    end = ANONEND.match(lines[i].strip())
                    i += 1
                    if depth == 0 and len(block) > 1:
                        if name is None and end:
                            name = end.group(1)
                        break
                if name is None:
                    continue
                body = "\n".join(block)
                if STRUCTDEF.match(body):       # give the bare form its typedef
                    body += "\ntypedef struct %s %s;" % (name, name)
                out.setdefault(name, body)
    return out, opaque - set(out)


DEFINE = re.compile(r"^#define\s+([A-Z_][A-Z0-9_]*)\s+(\S.*?)\s*(?:/\*.*)?$")


def define_values():
    """`#define NAME value` from the decomp, for the constants structs size with."""
    out = {}
    for d in DECOMP_DIRS:
        for fn in sorted(os.listdir(d)):
            if not fn.endswith(".c"):
                continue
            with open(os.path.join(d, fn), encoding="utf-8",
                      errors="replace") as fh:
                for line in fh:
                    m = DEFINE.match(line.strip())
                    if m and "(" not in m.group(1):
                        out.setdefault(m.group(1), m.group(2))
    return out


def emit_header(needed, blocks, path, opaque=(), decl_texts=()):
    """Write the typedefs, in an order that compiles.

    A struct can name another, so the blocks go out in dependency order: repeat
    a pass over what is left, emitting anything whose unmet references are all
    already out. Anything still circular after that is emitted last -- there is
    none today, and if one appears the compiler says so rather than this silently
    producing something wrong.
    """
    todo = {n: blocks[n] for n in needed if n in blocks}
    done, order = set(), []
    while todo:
        progress = False
        for n in sorted(todo):
            body = todo[n]
            refs = {o for o in todo
                    if o != n and re.search(r"\b%s\b" % o, body)}
            if not refs - done:
                order.append(n)
                done.add(n)
                del todo[n]
                progress = True
        if not progress:
            order.extend(sorted(todo))
            break

    with open(path, "w", encoding="utf-8", newline="") as fh:
        fh.write("/* Generated by tools/mkglobals.py -- do not hand-edit.\n"
                 " *\n"
                 " * The struct layouts the decompiled globals need, scraped from the .c\n"
                 " * files that established them. Copying them by hand would let the two\n"
                 " * drift, and the offsets are the part that was expensive to prove.\n"
                 " */\n\n"
                 "#ifndef GAMECODE_GLOBALS_H\n#define GAMECODE_GLOBALS_H\n\n"
                 "#include <stdint.h>\n\n")

        # Types the decomp only forward-declares, plus any a struct body names
        # that nothing declares at all. Globals of these are always pointers, so
        # an incomplete type is exactly right -- and inventing a body would be
        # inventing a layout, which is the one thing this project does not do.
        known = define_values()
        # Words that look like a type but are not one. Without this the scan
        # emitted `typedef struct NULL NULL;`.
        NOT_A_TYPE = {"NULL", "GL", "FALSE", "TRUE", "EOF", "RGBA", "UV", "XYZ"}
        unknown = set()
        for n in order:
            for w in re.findall(r"\b([A-Z][A-Z0-9_]{2,})\b", blocks[n]):
                if (w not in blocks and w not in known and w not in opaque
                        and w not in NOT_A_TYPE):
                    unknown.add(w)
        for n in sorted(set(opaque) | unknown):
            fh.write("typedef struct %s %s;\n" % (n, n))
        if opaque or unknown:
            fh.write("\n")

        # Struct bodies AND global declarations size arrays with named
        # constants -- `extern long BioText[BIOS_PAGES];` is as common as a
        # constant inside a struct -- so both have to be searched.
        defs = define_values()
        haystack = "\n".join([blocks[n] for n in order] + list(decl_texts))
        want = {d for d in defs if re.search(r"\b%s\b" % d, haystack)}
        while True:
            grown = set(want)
            for d in list(want):
                for other in defs:
                    if other not in grown and re.search(r"\b%s\b" % other, defs[d]):
                        grown.add(other)
            if grown == want:
                break
            want = grown
        wanted = sorted(want)
        if wanted:
            for d in wanted:
                fh.write("#ifndef %s\n#define %s %s\n#endif\n" % (d, d, defs[d]))
            fh.write("\n")

        for n in order:
            fh.write(blocks[n] + "\n\n")
        fh.write("#endif\n")
    return order


def undefined_symbols():
    """Compile every decomp TU and collect what nothing defines."""
    tmp = tempfile.mkdtemp(prefix="mkglobals")
    objs = []
    for d in DECOMP_DIRS:
        for fn in sorted(os.listdir(d)):
            if not fn.endswith(".c"):
                continue
            obj = os.path.join(tmp, "%s_%s.o" % (os.path.basename(d), fn[:-2]))
            r = subprocess.run(
                ["gcc", "-std=c99", "-O0", "-c",
                 "-I", "runtime", "-I", "decomp/lime",
                 os.path.join(d, fn), "-o", obj],
                capture_output=True)
            if r.returncode == 0:
                objs.append(obj)

    if not objs:
        sys.exit("mkglobals: nothing compiled")

    out = subprocess.run(["nm", "-u"] + objs,
                         capture_output=True, text=True).stdout
    undef = set()
    for line in out.splitlines():
        line = line.strip()
        if line.startswith("U "):
            undef.add(line[2:].strip())
    return undef


def main():
    undef = undefined_symbols()

    seen = {}
    for path, line, m in decl_lines():
        name = m.group("name")
        if name in seen or name not in undef:
            continue
        if name.startswith(SKIP_PREFIX):
            continue
        seen[name] = (path, line, m)

    blocks, opaque = typedef_blocks()

    # A struct names other structs, so the set of layouts the header must carry
    # is the transitive closure over the ones the globals mention -- not just
    # the first level. Missing that put HUDANIM and MKEVENT in the header's
    # bodies without their own definitions.
    needed = {m.group("type") for _, _, m in seen.values()} & set(blocks)
    while True:
        grown = set(needed)
        for n in list(needed):
            for other in blocks:
                if other not in grown and re.search(r"\b%s\b" % other, blocks[n]):
                    grown.add(other)
        if grown == needed:
            break
        needed = grown

    # A struct that embeds an unknown type BY VALUE cannot be given storage: its
    # size is not known, and this project does not invent layouts. `HUD` is the
    # live case -- it holds a `HUDANIM anim` and `HUDANIM` has no body anywhere
    # in the decomp. Find those transitively and drop both the type and every
    # global declared with it, by value, and say which.
    field = re.compile(r"\s*(?:const\s+|unsigned\s+|struct\s+)*"
                       r"([A-Za-z_]\w*)\s+(?!\*)\w+\s*(?:\[[^\]]*\])?\s*;")
    incomplete = set()
    while True:
        grown = set(incomplete)
        for n in needed:
            for line in blocks[n].split("\n"):
                mm = field.match(line)
                if mm and mm.group(1) not in SCALARS and (
                        mm.group(1) in grown or mm.group(1) not in blocks):
                    grown.add(n)
        if grown == incomplete:
            break
        incomplete = grown

    needed -= incomplete
    dropped = sorted(n for n, (_, _, m) in seen.items()
                     if not m.group("stars") and not m.group("dims")
                     and (m.group("type") in incomplete
                          or m.group("type") in opaque))
    for n in dropped:
        del seen[n]

    order = emit_header(needed, blocks, "runtime/gamecode_globals.h",
                        opaque, [l for _, l, _ in seen.values()])
    sys.stderr.write("mkglobals: %d typedefs -> runtime/gamecode_globals.h\n"
                     % len(order))
    if dropped:
        sys.stderr.write("mkglobals: %d globals skipped -- incomplete type: %s\n"
                         % (len(dropped), ", ".join(dropped)))

    print("/* Generated by tools/mkglobals.py -- do not hand-edit.")
    print(" *")
    print(" * Storage for the %d globals the decompiled sources declare and no"
          % len(seen))
    print(" * translation unit defines. See the script for the pointer-slot rule.")
    print(" */")
    print()
    print('#include "gamecode_globals.h"')
    print()
    print("#define SLOT_WORDS %d" % SLOT_WORDS)
    print()

    # A `*` in the declaration does NOT mean a pointer slot. `void *FloorTexture`
    # is an opaque handle the code assigns and never dereferences; `float *col`
    # is a slot the code reads through as `col[i]`. The two need opposite
    # treatment, and the only thing that tells them apart is the comment the
    # transcription carries -- which is exactly what it is for.
    plain, slots = [], []
    for name, (path, line, m) in sorted(seen.items()):
        is_slot = "pointer slot" in line and m.group("stars") and not m.group("dims")
        (slots if is_slot else plain).append((name, path, line, m))

    print("/* ---- %d plain globals ---- */" % len(plain))
    print()
    for name, path, line, m in plain:
        typ, dims = m.group("type"), m.group("dims")
        comment = line.split("/*", 1)[1].rstrip("*/ ").strip() if "/*" in line else ""
        if dims and "[]" in dims:
            dims = dims.replace("[]", "[SLOT_WORDS]", 1)
        if getattr(m, "fnptr", False):
            print("%s (*%s%s)(%s);%s"
                  % (typ, name, dims or "[SLOT_WORDS]", m.group("args"),
                     ("  /* %s */" % comment) if comment else ""))
            continue
        # Keep the stars: `extern void *X[26]` is an array of pointers, and
        # dropping them declares an array of void.
        print("%s %s%s%s;%s" % (typ, m.group("stars"), name, dims,
                                ("  /* %s */" % comment) if comment else ""))

    print()
    print("/* ---- %d pointer slots: storage, then a pointer at it ---- */"
          % len(slots))
    print()
    for name, path, line, m in slots:
        typ, stars = m.group("type"), m.group("stars")
        inner = stars[:-1]                  # one fewer star: this is the storage
        # `void` has no storage of its own; a `void *` slot backs onto words.
        store_t = "void *" if (typ == "void" and not inner) else "%s %s" % (typ, inner)
        print("static %s%s__store[SLOT_WORDS];" % (store_t, name))
        print("%s %s%s = %s__store;" % (typ, stars, name, name))

    print()
    print("/* %d plain + %d slots = %d" % (len(plain), len(slots), len(seen)),
          "*/")


if __name__ == "__main__":
    main()
