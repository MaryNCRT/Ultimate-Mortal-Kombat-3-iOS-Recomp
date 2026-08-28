# DrawHUD — working notes

**Not decompiled yet.** `DrawHUD` (armv7 `0x000282dc`, **11,536 bytes**) is the
largest function left in `gamecode` and the analysis below is where the work
stopped. It is written down so the next session starts from the findings rather
than from the disassembly.

```bash
python tools/disasm_range.py work/UMK3.armv7 0x000282dc 0x0002b00c > hud.txt
python tools/lits.py hud.txt > hud-annotated.txt
```

---

## The headline: it is not a draw function

`DrawHUD` calls `QuitAsWin`, `QuitAsLose`, `ResetFightData`, `mk3_init` (three
times), `InitEnduranceMatch`, `LoadGameCharacterCheckCache`, `updateMPWins`,
`achievementsUnlock` (six times) and `EASDK_LogEvent` (five times).

**The round and match state machine lives inside it.** Deciding who won,
starting the next round, loading the next endurance opponent and ending the
match all happen here, between drawing the health bars and drawing the combo
counter. Anything porting the fight loop has to know that — "draw the HUD" is
not a call you can reorder or skip a frame.

The function returns at `0x00028f12`:
`achievementsDraw(); limeEnableDepthTest(); limeEnableDepthWrites();`

## Layout is heavily reordered

Blocks are not in source order. `0x2960e`, `0x29846`, `0x2a816`, `0x2a8cc` and
a dozen more are cold blocks placed after the return that jump back into the
body. Reading the range top to bottom gives the wrong function; the control
flow has to be traced. Several regions in the middle are literal pools that
disassemble as plausible-looking nonsense.

---

## What is established

### The bars are drawn with negative widths

`limeDrawSprite`'s last four floats are UV **extents**, not corners — sprite 1
is 192x28 at UV 0.75 x 0.109375, and 192/256 = 0.75, 28/256 = 0.109375. The
atlas is 256x256.

Player 1, all coordinates multiplied by `HUD_Scale`:

| what | x | y | w | h | UV origin |
|---|---:|---:|---|---:|---|
| HUD plate (`HUDTPage`) | 18 | 24 | 192 | 28 | (0, 0) |
| run bar (`RunBar`) | 81 | 44 | `-62 * (100 - RunBar) / 100` | 7 | (0.125, 0.125) |
| health (`Health[0]`) | 209 | — | `-190 * (100 - Health) / 100` | 20 | — |

The widths are **negative**, so the rectangle runs leftward from `x`. These do
not draw the bar — the full bar is part of the plate — they draw the *depleted*
part over it, growing leftward from the right end. `209` is the plate's right
edge (18 + 192 = 210) and `-190` is very nearly the bar's full width. A
one-pixel UV width stretched across the rectangle is how both bars are filled.

Player 2 mirrors it: the same constants negated (`-18`, `-81`, `-192`) and
added to `limeScreenWidth`.

### The combo counter slides in from the edge

```
x = (128 - ComboSlider1[p]) * HUD_Scale                       player 1, align 2 (right)
x = limeScreenWidth - (128 - ComboSlider1[p]) * HUD_Scale     player 2, align 0 (left)
y = 108 * HUD_Scale    hit count,  GameTextNoHeader(0xb5)
y = 124 * HUD_Scale    damage,     GameTextNoHeader(0x11c)
```

`ComboTimer`, `ComboNumber`, `ComboDamage`, `ComboSlider1` and `ComboSlider2`
are all **two-element arrays**, one per player. The retract is staggered:
`ComboSlider2` only starts moving once `ComboSlider1` passes 64.

A combo above four hits unlocks **achievement 6**, in game modes 0 and 4 only.

### Round end, and what the kodes do

```c
if (WinnerMessage[0] || WinnerMessage[1]) {
    if (Health[0] == 0 && RoundSummary == 0) { RoundSummary = 1; RoundWins[1]++; Round++; ... }
    if (Health[1] == 0 && RoundSummary == 0) { RoundSummary = 1; RoundWins[0]++; Round++; ... }
}
```

Either half, on reaching `WinsNeeded`, calls `updateMPWins()`. Otherwise it
clears `flawlessVictories`, sets `playerLostRound = 1`, and:

- **`theKode == 0x13` ends the match in one round.** In `GameMode == 1`
  (network) the loser's `RoundWins` is set to `WinsNeeded` and the winner's to
  `WinsNeeded - 1`, so the very next test ends the match. Both halves do it,
  symmetrically.
- **A flawless round** (`Health[winner] == 100`) sets `FlawlessMessage = 1`,
  and in modes 0 and 4 increments `Stats[6]` and `flawlessVictories`, unlocks
  **achievement 2**, and unlocks **achievement 3** at five flawless victories.

`theKode == 1` is the lights-out kode: it counts `lightsOn` down by
`1.0 / limeFPSScaleFactor` a frame and clamps it at zero.

### The clock, and the two fades

```c
if (!GamePaused) GameTime = (float)(ClockTens * 10 + ClockSingles);
```

drawn centred at `(limeScreenWidth / 2, 20 * HUD_Scale)` in `CountDownFont` via
plain `sprintf(str, "%d", (int)GameTime)` — the one `_sprintf` call in the
function, named with `tools/imports.py` rather than guessed from its arguments.

Two full-screen overlays run before anything else:

```c
ScorpionFade += ScorpionFadeAdd / limeFPSScaleFactor;    /* clamped to 1 */
if (ScorpionFade != 0.0f)
    limeFillRect(0, 0, W, H, 0, 0, 0, ScorpionFade);     /* black */

if (ScorpionFlash != 0.0f) {                             /* white, a six-frame flash */
    ScorpionFlash += (-1.0f / 6.0f) / limeFPSScaleFactor;
    if (ScorpionFlash <= 0.0f) ScorpionFlash = 0.0f;
    limeFillRect(0, 0, W, H, 1, 1, 1, 1);
}
```

### Odds and ends

- `limePlayTune(LevelMusic[LevelSelect], (int)MusicVol[Settings[2]], 1)` restarts
  the level music when the mercy message finishes. `Settings[2]` is the music
  volume index.
- The win-streak line is `GameTextNoHeader(0xb4)` at `(34, 6) * HUD_Scale`,
  reading `winStreak` in mode 0 and `survivalWinStreak` in mode 4.
- The pause button is `InfoTexture` at `(-4, -7)` and `PauseTexture` at
  `(limeScreenWidth - 32 * HUD_Scale, -7)`, both 36x36, drawn additively.
- Every pointer slot in the function has been resolved: `HUD_Scale`,
  `limeFPSScaleFactor`, `limeScreenWidth`, `limeScreenHeight`, `FE_WidthScale`,
  `FE_HeightScale`, `Settings`, `LevelSelect`, `MusicVol`, `playerLostRound`,
  `Stats`, `fatal_HUDgfx_SpriteDef`, `fatal_HUDgfx_Anim`, `DestinyNames`,
  `RoundParam`, `Players`, `PlayerDefs`.

---

## What is left

The regions not yet read instruction by instruction:

| range | what is there |
|---|---|
| `0x295de - 0x29808` | the finisher HUD — `HUDFatalsTexture`, `IsInFinishing`, FINISH HIM |
| `0x29808 - 0x299be` | `InfoScale` pulse, round-win coins, the danger sprite |
| `0x299be - 0x2a200` | `no_ai_hack`, winner message, `RoundHasEnded`, SK death, babality, karnage score, `TrainingMessages` |
| `0x2a200 - 0x2a648` | tower completion logging, animality and fatality banners |
| `0x2a648 - 0x2a920` | round text, survival, `updateMPWins`, three achievement unlocks |
| `0x2a920 - 0x2ab96` | friendship message, the two `C.195` / `C.175` const tables |
| `0x2abc8 - 0x2ac54` | **next round** — `LIME_InitEventsManager`, `mk3_init`, `mk3_set_four_button` x2, `ResetFightData` |
| `0x2ac54 - 0x2af68` | **match end** — `QuitAsWin` / `QuitAsLose`, `InitEnduranceMatch`, `DumpAltCostume`, `LoadGameCharacterCheckCache`, `mk3_init` x2 |

The last two are the valuable ones for a port that boots into a fight.
