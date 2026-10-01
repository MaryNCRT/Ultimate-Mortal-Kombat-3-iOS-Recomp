"""genfile.py -- assemble one decomp file from what the readers can prove.

Runs pushfn and microfn over a translation unit, drops anything the second
would define that the first already did, and writes the file with a header
saying which shapes accounted for what. Whatever neither can prove is listed
so it can be read by hand.

    python genfile.py mkdrone.c "one line about the file"
"""

import io
import os
import re
import subprocess
import sys

src = sys.argv[1]
blurb = sys.argv[2] if len(sys.argv) > 2 else ""
out = "decomp/gamecode/logic/" + src


def run(tool, *args):
    r = subprocess.run([sys.executable, "tools/" + tool, "--file", src] +
                       list(args), capture_output=True, text=True)
    if r.returncode:
        sys.exit(r.stderr)
    return r.stdout


push = run("pushfn.py", "--max", "600", "--emit")
micro = run("microfn.py", "--max", "600", "--emit")
leaf = run("leaffn.py", "--max", "96", "--emit")

defined = set(re.findall(r"^(?:long|void) (\w+)\(", push, re.M))

# Split microfn's output into blocks and keep the ones pushfn did not take.
kept = []
for block in micro.split("\n\n"):
    m = re.search(r"^(?:long|void) (\w+)\(", block, re.M)
    if m and m.group(1) in defined:
        continue
    kept.append(block)
micro = "\n\n".join(kept)

# And the leaf reader against what both of the others took.
taken = defined | set(re.findall(r"^(?:long|void) (\w+)\(\w", micro, re.M))
kept = []
for block in leaf.split("\n\n"):
    m = re.search(r"^(?:long|void) (\w+)\(", block, re.M)
    if m and m.group(1) in taken:
        continue
    kept.append(block)
leaf = "\n\n".join(kept)

n_push = len(defined)
n_micro = len(set(re.findall(r"^(?:long|void) (\w+)\(\w", micro, re.M)))
n_leaf = len(set(re.findall(r"^(?:long|void) (\w+)\(\w", leaf, re.M)))

HEAD = '''/*
 * %(src)s -- gamecode/logic/%(src)s, decompiled.
 *
%(blurb)s *
 * This first pass was read by two programs rather than by eye, because most of
 * what is here is one function written many times.
 *
 * `tools/pushfn.py` executes a body symbolically -- every register tracked as
 * a constant, a pc-relative address, a load or nothing at all -- and accepts
 * it only when it accounted for EVERY instruction and the effects come out as
 * the frame-push shape: some stores into the object, then the handler and the
 * cleared slot above. One instruction it cannot model and the function is
 * refused rather than guessed at.
 *
 * `tools/leaffn.py` is that same interpreter with the guard requirement
 * dropped and the OBJECT in r0: it takes the straight-line leaves --
 * stores, calls and a return -- and refuses anything that branches,
 * anything whose return value it cannot prove, and any value read from a
 * field the function also writes, because that is a SAVED value and not a
 * re-read. Rendering one as a re-read produced `obj->field40 =
 * obj->field40` once, which is where that rule comes from.
 *
 * `tools/microfn.py` matches whole bodies against fixed templates for the
 * smaller shapes -- a tail call, a constant into 0x5c, a table handed to a
 * search routine -- and refuses anything with an instruction out of place.
 *
 * Both refuse loudly. What they could not prove is not in this file; it is
 * read one function at a time.
 */

#include "mk3logic.h"

'''

body = push + "\n" + micro + "\n" + leaf + "\n"

def drop_known(text, already):
    """Remove declarations of functions the file already names.

    `written()` stops the readers re-DEFINING what is there, but a called
    function can be declared here and defined -- or declared differently --
    higher up the same file. Two spellings of one prototype is an error, and
    the one already in the file is the one that was read by hand.
    """
    keep = []
    for line in text.splitlines():
        m = re.match(r"^(?:long|void) (\w+)\(.*\);$", line)
        if m and m.group(1) in already:
            continue
        keep.append(line)
    return "\n".join(keep)


if os.path.exists(out):
    # The file already holds functions read by hand. Append rather than
    # replace: `written()` has already stopped the readers re-emitting any of
    # them, so everything arriving here is new.
    prior = io.open(out, encoding="utf-8").read()
    hdr = io.open("decomp/gamecode/logic/mk3logic.h", encoding="utf-8").read()
    body = drop_known(body, set(re.findall(r"^(?:long|void) (\w+)\(",
                                           prior + hdr, re.M)))

    # A definition arriving now beats a declaration already in the file. The
    # earlier readers wrote `long f(MK3OBJ *)` for everything they called,
    # because a caller cannot see a return type; leaffn PROVES which functions
    # return nothing. Where the two disagree the old guess is CORRECTED rather
    # than dropped -- the callers are above the definition and still need it.
    defines = dict((m[1], m[0]) for m in
                   re.findall(r"^(long|void) (\w+)\([^;]*$", body, re.M))
    if defines:
        out_lines = []
        for line in prior.splitlines():
            m = re.match(r"^(long|void) (\w+)\((.*)\);$", line)
            if m and m.group(2) in defines and defines[m.group(2)] != m.group(1):
                line = "%s %s(%s);" % (defines[m.group(2)], m.group(2),
                                       m.group(3))
            out_lines.append(line)
        prior_new = "\n".join(out_lines)
        if prior_new != prior:
            io.open(out, "w", encoding="utf-8", newline="").write(prior_new)
    io.open(out, "a", encoding="utf-8", newline="").write(
        "\n\n/* " + "-" * 68 + "\n"
        " * What the readers could prove. See tools/pushfn.py, which executes\n"
        " * a body symbolically, and tools/microfn.py, which matches whole\n"
        " * bodies against templates. Both refuse anything they cannot account\n"
        " * for instruction by instruction.\n"
        " * " + "-" * 68 + " */\n\n" + body)
else:
    io.open(out, "w", encoding="utf-8", newline="").write(
        HEAD % {"src": src, "blurb": blurb} + body)

print("%s: %d by pushfn, %d by microfn, %d by leaffn"
      % (out, n_push, n_micro, n_leaf))
