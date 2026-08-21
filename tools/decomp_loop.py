"""Strict acceptance runner for the UMK3 decompilation loop.

This tool deliberately does *not* write clean C.  A readable implementation
and an independent differential test are still authored by a person.  What it
does automate is the repeatable, non-negotiable acceptance gate:

    compile -> symcheck -> regenerate oracle -> differential test

The `--calibrate` mode proves the gate against Matrix.cpp and limeVector.cpp,
two independently verified modules.  Only after that mode remains green should
new functions be submitted with `--candidate`.

All generated artefacts and metrics stay in UMK3_WORK (normally work/), never
in the repository.  See docs/DECOMP-LOOP.md.
"""

import argparse
import csv
import datetime as dt
import os
import shutil
import subprocess
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import umk3paths  # noqa: E402


ROOT = umk3paths.REPO
TOOLS = os.path.join(ROOT, "tools")
RUNTIME = os.path.join(ROOT, "runtime")
RECOMP = os.path.join(TOOLS, "armrecomp", "recomp.py")
SYMCHECK = os.path.join(TOOLS, "symcheck.py")

CALIBRATION = (
    {
        "name": "matrix",
        "source_file": "Matrix.cpp",
        "clean": os.path.join(ROOT, "decomp", "lime", "Matrix.c"),
        "test": os.path.join(ROOT, "tests", "test_matrix_diff.c"),
        "kind": "B",
    },
    {
        "name": "limevector",
        "source_file": "limeVector.cpp",
        "clean": os.path.join(ROOT, "decomp", "lime", "limeVector.c"),
        "test": os.path.join(ROOT, "tests", "test_limevector_diff.c"),
        "kind": "A",
    },
)

CSV_FIELDS = (
    "utc", "run", "name", "source_file", "class", "result", "reason",
    "retries", "seconds", "symcheck_unknowns", "differential_divergences",
)


def run(cmd, label):
    """Run one gate and return (passed, combined output)."""
    print("\n== %s ==" % label)
    print(" ".join(('"%s"' % x) if " " in x else x for x in cmd))
    proc = subprocess.run(cmd, cwd=ROOT, text=True, errors="replace",
                          stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if proc.stdout:
        print(proc.stdout.rstrip())
    return proc.returncode == 0, proc.stdout or ""


def loop_dir():
    path = umk3paths.work_file("loop")
    os.makedirs(path, exist_ok=True)
    return path


def stats_path():
    return umk3paths.work_file("loop-stats.csv")


def append_stat(row):
    path = stats_path()
    new = not os.path.exists(path)
    with open(path, "a", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=CSV_FIELDS)
        if new:
            writer.writeheader()
        writer.writerow(row)


def gcc_path():
    path = shutil.which("gcc")
    if not path:
        raise RuntimeError("gcc was not found on PATH; install a C compiler first")
    return path


def submit(spec, run_name, retries=0):
    """Run the gate for one manually prepared, independently tested function."""
    started = time.monotonic()
    base = os.path.join(loop_dir(), run_name, spec["name"])
    oracle_dir = os.path.join(base, "oracle")
    exe = os.path.join(base, "differential.exe")
    os.makedirs(oracle_dir, exist_ok=True)

    row = {
        "utc": dt.datetime.now(dt.UTC).isoformat(timespec="seconds"),
        "run": run_name, "name": spec["name"], "source_file": spec["source_file"],
        "class": spec["kind"], "result": "rejected", "reason": "",
        "retries": retries, "seconds": "", "symcheck_unknowns": "",
        "differential_divergences": "",
    }

    symbols = umk3paths.work_file("symbols.txt")
    if not os.path.isfile(symbols):
        raise RuntimeError("symbols.txt is missing from UMK3_WORK: %s" % symbols)

    # func-to-file.txt is loaded with required=False deep inside recomp.py, so a
    # missing copy yields an EMPTY map, no targets, and the useless error
    # "no se selecciono ninguna funcion" three steps later.  That cost a session
    # to diagnose the first time the loop was ever run.  Fail here instead.
    fmap = umk3paths.work_file("func-to-file.txt")
    if not os.path.isfile(fmap):
        raise RuntimeError(
            "func-to-file.txt is missing from UMK3_WORK: %s\n"
            "The oracle selects functions by source file and cannot do so "
            "without it." % fmap)
    if not os.path.isfile(spec["clean"]) or not os.path.isfile(spec["test"]):
        raise RuntimeError("candidate needs both --clean and --test files")

    # Structure precedes behaviour.  Do not regenerate or run an oracle if the
    # implementation names a callee the binary never contained.
    ok, output = run([sys.executable, SYMCHECK, spec["clean"], symbols], "symcheck")
    row["symcheck_unknowns"] = output.count("NOT IN BINARY:")
    if not ok:
        row["reason"] = "symcheck"
        row["seconds"] = "%.3f" % (time.monotonic() - started)
        append_stat(row)
        return False

    ok, _ = run([sys.executable, RECOMP, umk3paths.require_slice(),
                 "--file", spec["source_file"], "--out", oracle_dir,
                 "--name", spec["name"], "--with-deps"], "oracle")
    if not ok:
        row["reason"] = "oracle-generation"
        row["seconds"] = "%.3f" % (time.monotonic() - started)
        append_stat(row)
        return False

    compiler = gcc_path()
    # The clean C needs two more translation units to link. lime_globals.c holds
    # the engine's own global state; lime_platform.c is the host side of the
    # twelve platform symbols decomp/ declares but must not define.
    #
    # lime_platform.c is deliberately NOT the same code as arm_runtime.c's
    # stub_limeLoadFile: those operate on guest memory for the oracle, these on
    # host memory for the clean C. Two independent implementations reading the
    # same files is the point -- it keeps the differential honest instead of
    # having one side call the other.
    # The engine links as one library. Everything in decomp/lime/ goes in
    # EXCEPT the file under test, which the command already names -- linking it
    # twice is a duplicate-definition error, and leaving the rest out means every
    # cross-file call (LIME_LoadScene from RenderMesh, say) dangles.
    lime_dir = os.path.join(ROOT, "decomp", "lime")
    under_test = os.path.abspath(spec["clean"])
    engine = [os.path.join(lime_dir, f) for f in sorted(os.listdir(lime_dir))
              if f.endswith(".c")
              and os.path.abspath(os.path.join(lime_dir, f)) != under_test]

    support = engine + [os.path.join(RUNTIME, "lime_platform.c"),
               # recomp.py emits default bodies for every import it had no
               # hand-written shim for, each one calling arm_unimplemented().
               # Linking this is what makes an unimplemented import fail loudly
               # AT RUNTIME with its own name, which is the whole design -- and
               # not linking it turned that into a wall of undefined references
               # at link time instead.
               os.path.join(oracle_dir, spec["name"] + "_shims.c")]
    support = [f for f in support if os.path.isfile(f)]

    cmd = ([compiler, "-std=c99", "-Wall", "-Wextra", "-I", RUNTIME,
            "-I", oracle_dir, spec["test"], spec["clean"],
            os.path.join(oracle_dir, spec["name"] + ".c"),
            os.path.join(RUNTIME, "arm_runtime.c")]
           + support + ["-o", exe, "-lm"])
    ok, _ = run(cmd, "compile")
    if not ok:
        row["reason"] = "compile"
        row["seconds"] = "%.3f" % (time.monotonic() - started)
        append_stat(row)
        return False

    # Tests that read real game data need it pointed out to them. The pure-maths
    # calibration pair takes no arguments and ignores these; a data-driven test
    # like RenderMesh's needs the asset directory and the slice, and printed a
    # usage line instead of running when the loop invoked it bare.
    argv = [exe]
    res_dir = os.environ.get("UMK3_RES")
    if res_dir and os.path.isdir(res_dir):
        argv.append(res_dir)
        slice_path = umk3paths.slice_path()
        if os.path.isfile(slice_path):
            argv.append(slice_path)

    ok, output = run(argv, "differential")
    row["differential_divergences"] = 0 if ok else "nonzero"
    row["seconds"] = "%.3f" % (time.monotonic() - started)
    if not ok:
        row["reason"] = "differential"
        append_stat(row)
        return False

    row["result"] = "accepted"
    row["reason"] = "calibrated" if run_name == "phase0" else "zero-divergence"
    append_stat(row)
    return True


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    mode = ap.add_mutually_exclusive_group(required=True)
    mode.add_argument("--calibrate", action="store_true",
                      help="reproduce Matrix and limeVector from scratch")
    mode.add_argument("--candidate", action="store_true",
                      help="run the gate for one manually prepared candidate")
    ap.add_argument("--name", help="short output name for --candidate")
    ap.add_argument("--source-file", help="original source file for --candidate")
    ap.add_argument("--clean", help="clean C file for --candidate")
    ap.add_argument("--test", help="independent differential C test for --candidate")
    ap.add_argument("--class", dest="kind", choices=("A", "B", "C", "D"),
                    help="test class for --candidate")
    args = ap.parse_args()

    if args.calibrate:
        passed = [submit(spec, "phase0") for spec in CALIBRATION]
        print("\nPhase 0: %d/%d calibration modules passed." % (sum(passed), len(passed)))
        print("Metrics: %s" % stats_path())
        return 0 if all(passed) else 1

    missing = [name for name in ("name", "source_file", "clean", "test", "kind")
               if not getattr(args, name)]
    if missing:
        flags = {"source_file": "--source-file", "kind": "--class"}
        ap.error("--candidate also needs: %s" % ", ".join(flags.get(n, "--" + n)
                                                               for n in missing))
    spec = {"name": args.name, "source_file": args.source_file,
            "clean": os.path.abspath(args.clean), "test": os.path.abspath(args.test),
            "kind": args.kind}
    return 0 if submit(spec, "candidate") else 1


if __name__ == "__main__":
    sys.exit(main())
