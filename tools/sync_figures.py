#!/usr/bin/env python3
"""sync_figures.py -- publish the measured percentage wherever it is quoted.

The overall figure appears in README.md, README.es.md and docs/PROGRESS.md, and
a reader trusts all three. Keeping them in step by remembering to edit them does
not work: the figure had already drifted once, and the drift was only caught
because two of the numbers disagreed.

So this runs tools/progress.py, reads the figure IT measured, and rewrites the
three files to match. The tool that measures is the tool that publishes.

It rewrites only the bar and the sentence beside it. Everything else in those
files is prose somebody wrote on purpose.

    python tools/sync_figures.py
"""
import io
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FULL = chr(0x2588)          # the filled bar cell
EMPTY = chr(0x2591)         # and the empty one


def measured():
    """The overall percentage, from progress.py rather than from anywhere else."""
    out = subprocess.run([sys.executable,
                          os.path.join(ROOT, "tools", "progress.py")],
                         capture_output=True, text=True, cwd=ROOT).stdout
    m = re.search(r"overall:\s+(\d+\.\d\d)%", out)
    if not m:
        raise SystemExit("progress.py printed no overall figure")
    return float(m.group(1))


def bar(pct, width=40):
    filled = int(round(pct / 100.0 * width))
    return FULL * filled + EMPTY * (width - filled)


def main():
    pct = measured()
    en = "%.2f" % pct
    es = en.replace(".", ",")
    art = bar(pct)

    targets = [
        ("README.md",        en, r"\d+\.\d\d% of the total estimated effort"),
        ("README.es.md",     es, r"\d+,\d\d% del esfuerzo total estimado"),
        ("docs/PROGRESS.md", en, r"\d+\.\d\d% of the total estimated effort"),
    ]

    changed = 0
    for name, num, prose in targets:
        path = os.path.join(ROOT, name)
        if not os.path.exists(path):
            continue
        with io.open(path, encoding="utf-8") as fh:
            text = fh.read()
        before = text

        # the bar line, whatever it currently reads
        text = re.sub("[" + FULL + EMPTY + r"]{40}\s+\d+[.,]\d\d%",
                      art + "  " + num + "%", text)
        # and the sentence beside it
        text = re.sub(prose,
                      lambda m: re.sub(r"\d+[.,]\d\d", num, m.group(0)),
                      text)

        if text != before:
            with io.open(path, "w", encoding="utf-8") as fh:
                fh.write(text)
            print("  updated %s" % name)
            changed += 1

    print("  overall %s%%  (%d file%s rewritten)"
          % (en, changed, "" if changed == 1 else "s"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
