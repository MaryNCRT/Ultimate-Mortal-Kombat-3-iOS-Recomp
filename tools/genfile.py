"""genfile.py -- assemble one decomp file from what the readers can prove.

Runs pushfn and microfn over a translation unit, drops anything the second
would define that the first already did, and writes the file with a header
saying which shapes accounted for what. Whatever neither can prove is listed
so it can be read by hand.

    python genfile.py mkdrone.c "one line about the file"
"""

import io
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

defined = set(re.findall(r"^(?:long|void) (\w+)\(", push, re.M))

# Split microfn's output into blocks and keep the ones pushfn did not take.
kept = []
for block in micro.split("\n\n"):
    m = re.search(r"^(?:long|void) (\w+)\(", block, re.M)
    if m and m.group(1) in defined:
        continue
    kept.append(block)
micro = "\n\n".join(kept)

n_push = len(defined)
n_micro = len(set(re.findall(r"^(?:long|void) (\w+)\(\w", micro, re.M)))

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
 * `tools/microfn.py` matches whole bodies against fixed templates for the
 * smaller shapes -- a tail call, a constant into 0x5c, a table handed to a
 * search routine -- and refuses anything with an instruction out of place.
 *
 * Both refuse loudly. What they could not prove is not in this file; it is
 * read one function at a time.
 */

#include "mk3logic.h"

'''

io.open(out, "w", encoding="utf-8", newline="").write(
    HEAD % {"src": src, "blurb": blurb} + push + "\n" + micro + "\n")

print("%s: %d by pushfn, %d by microfn" % (out, n_push, n_micro))
