# Current route — native PC link-up

This is the active work order for a human or AI taking over the project. Read
[PROGRESS.md](PROGRESS.md) first; it is the canonical record of measured
status. `HANDOFF.md` and `ENCARGO.md` are historical snapshots and must not be
used as task lists.

## State at handoff — 2026-10-02

- **Decompilation:** 2,572 / 2,572 bodies are present: 109 `lime/common`, 291
  `gamecode`, and 2,172 `gamecode/logic`.
- **Verification infrastructure:** complete. Static checking is strict, and
  `tools/difftest/` provides a runtime differential harness against the ARM
  recompilation oracle.
- **Visible native result:** the retail front end loads, draws, and accepts
  input; all 18 arenas and a skinned animated fighter render from user-supplied
  assets. This is not yet a playable fight.
- **Estimated overall project progress:** **85.55%**. This is deliberately not
  a claim that the port is 85.55% playable: the remaining work joins two large
  axes that function counting did not measure.

## Do not resume transcription

There is no remaining function-count backlog. Do not restart the old
smallest-function decompilation loop and do not substitute a new hand-written
fight state machine for the original one. The job is to prove the recovered
bodies, extract the data they require, and connect them to the native platform
layer.

## Work in this order

### 1. Close the behavioral regression run

The highest-confidence next action is an end-to-end re-run of the differential
harness on the **current branch** `difftest-triage-2`. Targeted triage has
already fixed the known real transcription and oracle faults, but the full
suite has not been repeated after the final fixes.

Use the checked-in harness rather than inventing a second oracle:

```sh
UMK3_SLICE=work/UMK3.armv7 sh tools/difftest/run.sh <stem> <recompiled-root> -n 80
```

Run its documented complete-file invocation, record every result, and increase
coverage for any `LOWCOV` function only when its state can be seeded honestly.
Keep these distinctions explicit:

- a real C/body mismatch;
- an ARM/recompiler-oracle limitation;
- a harness scenario that cannot model a handler-address arithmetic case;
- an untested path.

`mkzap.c` has three reviewed handler-address arithmetic false positives;
the `other.c` a9 frame walkers are clean after the `adr` / `mov pc` oracle fix;
`playback.c` still has no meaningful oracle scenarios. Do not mark an
unobservable path as verified.

Before landing changes, run the project checks. Never weaken a checker merely
to make a count green:

```sh
sh tools/check.sh
python tools/symcheck.py
python tools/factdiff.py <file>
```

### 2. Extract and declare the original data tables

The fight runtime has bodies but not all of the original data that drives them.
About **229 binary tables** must be recovered from the user-provided image.
They are the next material blocker, not missing game mechanics:

- `sm_*` (~120): per-character special-move command lists;
- `ochar_*` (~25): character parameters;
- `a_*` (~28): animation scripts;
- `scom_*`, `sm_all_ro`: special-move scripts;
- `reaction_table`, `strike_tables`, `propell_table`, `swtab`, and related
  global dispatch tables.

For every table: measure its span from the symbol gap, derive its stride from a
real use site or the element representation, resolve pointer entries through
the image, then add a reproducible extractor/test. Do not guess structures from
names. Existing examples are `projectile_jumps`, `rocket_routines`, and the
five `bt_*` button tables.

### 3. Replace the technical fight stand-in with the original runtime path

`runtime/fight_scene.c` is a diagnostic scene; its state machine and timing are
not the retail fight loop. Keep it as a visual/debug tool, but do not expand it
into the port. Link the recovered `mk3_init` / `mk3_update` path and its real
data into the platform loop, then add input, audio, save data, and presentation
only where the original code calls the platform boundary.

The platform layer already provides a Windows backend (window, GL, asset
loading, menu input). Its unfinished areas include audio, saves, and the
original fight-loop integration. The online EA/GameKit path remains intentionally
offline/stubbed.

## Build and asset boundary

The Windows build uses CMake, Ninja, and MinGW-w64 GCC. It creates `umk3`,
`umk3-menu`, `umk3-fight`, and `umk3-test`; their existing success proves the
toolchain and front-end link, not a playable game. Assets are never committed:
pass a legal `UMK3.app/res` directory to the executable or put it beside it as
`res/`.

## Non-negotiable project rules

- Do not commit IPA contents, extracted EA assets, binaries, ROMs, or private
  working directories.
- Keep readable recovered C in `decomp/`, native replacement code in
  `runtime/`, verification-only generated output in `recompiled/`, and tests in
  `tests/`.
- Preserve the clean-room method. Do not read, cite, or use leaked retail
  source code or analysis derived from it.
- Update [PROGRESS.md](PROGRESS.md), the honest percentage, and relevant GitHub
  issues after each completed work block. State uncertainty plainly.

## Definition of the next useful milestone

The next milestone is not "more functions." It is a reproducible run in which
the original fight code reaches its update loop with original command,
animation, reaction, and dispatch tables present, while the native platform
provides only its boundary services. That is the point at which playable
integration can begin without turning the project into a remake.
