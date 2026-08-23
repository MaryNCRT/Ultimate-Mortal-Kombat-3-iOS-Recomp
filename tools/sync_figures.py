#!/usr/bin/env python3
"""sync_figures.py -- publish the measured figures wherever they are quoted.

The progress numbers appear in README.md, README.es.md and docs/PROGRESS.md, and
a reader trusts all three. Keeping them in step by remembering to edit them does
not work, and the project has the receipts: the overall figure drifted once and
was only caught because two of the three disagreed, and the per-area rows for
`gamecode` sat at 12.03% for five commits after the real figure had passed 30%.

So this runs tools/progress.py, reads the figures IT measured, and rewrites both
the overall percentage AND the three measured rows of the area table in all
three files. The tool that measures is the tool that publishes.

**Only the three MEASURED rows are touched.** The other five are judgement calls
a person maintains, and rewriting those from a script would be inventing
numbers rather than publishing them.

Everything else in those files is prose somebody wrote on purpose.

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

# The area-table rows progress.py measures. The key is what identifies the row
# in the table -- it is inside backticks in every one of the three files, in
# both languages, because the module path is not translated.
MEASURED_ROWS = ("lime/common", "gamecode", "gamecode/logic")


def progress_output():
    return subprocess.run([sys.executable,
                           os.path.join(ROOT, "tools", "progress.py")],
                          capture_output=True, text=True, cwd=ROOT).stdout


def measured(out):
    """(overall, {area: (done, total, percent)}) straight from progress.py."""
    m = re.search(r"overall:\s+(\d+\.\d\d)%", out)
    if not m:
        raise SystemExit("progress.py printed no overall figure")
    overall = float(m.group(1))

    rows = {}
    area = None
    for line in out.splitlines():
        head = re.match(r"^  (\S.*)$", line)
        if head and "TOTAL" not in line and "overall" not in line:
            area = head.group(1).strip()
        t = re.match(r"^\s+TOTAL\s+(\d+)/(\d+)\s+=\s+([\d.]+)%", line)
        if t and area:
            rows[area] = (int(t.group(1)), int(t.group(2)), float(t.group(3)))
    return overall, rows


def bar(pct, width=10):
    filled = int(round(pct / 100.0 * width))
    # No minimum. An earlier version lit one cell for any non-zero figure so a
    # started row would not read as empty -- which made 0.14% look like 10%.
    # A bar that overstates is worse than one that shows nothing yet.
    return FULL * filled + EMPTY * (width - filled)


def rewrite_row(text, key, done, pct, comma):
    """Rewrite the Done cell and bar of the table row naming `key`."""
    num = ("%.2f" % pct).replace(".", ",") if comma else "%.2f" % pct
    cell = "100%" if pct >= 100.0 else "%s%% (%d)" % (num, done)
    if pct >= 100.0:
        cell = "**100%**"

    pattern = re.compile(
        r"^(\|\s*`" + re.escape(key) + r"`[^|]*\|[^|]*\|)[^|]*\|[^|]*\|",
        re.M)

    def repl(m):
        return "%s %s | `%s` |" % (m.group(1), cell, bar(pct))

    return pattern.sub(repl, text, count=1)


def main():
    out = progress_output()
    overall, rows = measured(out)

    en = "%.2f" % overall
    es = en.replace(".", ",")
    art = bar(overall, 40)

    targets = [
        ("README.md",        en, False,
         r"\d+\.\d\d% of the total estimated effort"),
        ("README.es.md",     es, True,
         r"\d+,\d\d% del esfuerzo total estimado"),
        ("docs/PROGRESS.md", en, False,
         r"\d+\.\d\d% of the total estimated effort"),
    ]

    changed = 0
    for name, num, comma, prose in targets:
        path = os.path.join(ROOT, name)
        if not os.path.exists(path):
            continue
        with io.open(path, encoding="utf-8") as fh:
            text = fh.read()
        before = text

        text = re.sub("[" + FULL + EMPTY + r"]{40}\s+\d+[.,]\d\d%",
                      art + "  " + num + "%", text)
        text = re.sub(prose,
                      lambda m: re.sub(r"\d+[.,]\d\d", num, m.group(0)),
                      text)

        for key in MEASURED_ROWS:
            if key in rows:
                done, _total, pct = rows[key]
                text = rewrite_row(text, key, done, pct, comma)

        if text != before:
            with io.open(path, "w", encoding="utf-8") as fh:
                fh.write(text)
            print("  updated %s" % name)
            changed += 1

    for key in MEASURED_ROWS:
        if key in rows:
            done, total, pct = rows[key]
            print("  %-16s %d/%d = %.2f%%" % (key, done, total, pct))
    print("  overall %s%%  (%d file%s rewritten)"
          % (en, changed, "" if changed == 1 else "s"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
