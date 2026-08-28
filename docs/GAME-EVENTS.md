# The engine's event queue

**This is the seam.** The MK3 fight engine does not draw, play sound, or know
what a fatality is. It appends eight-byte records to `MKEventQueue`, and once a
frame `AddNewGameEvents` (armv7 `0x000732a8`, 6,644 bytes) drains that queue and
turns each record into blood, an FBX effect, a sound, a banner, an achievement,
a stat, or a change of round state.

Everything below the seam is arcade logic ported from the original game.
Everything above it is the iOS presentation layer. A port that wants to change
how the game *looks* changes `AddNewGameEvents`; a port that wants to change how
it *plays* does not touch it.

> `AddNewGameEvents` itself is **not decompiled yet** — see [what is left](#what-is-left).
> What is on this page was read from the disassembly; what is not on it was not.

There are two unrelated event queues in `Blood.cpp`. `GameEvents` (stride 0x64)
is the file's own particle and screen-shake list, run by `RunGameEvents` and
already decompiled. `MKEventQueue` is the engine's, and is what this page is
about.

---

## The record

```
+0  int8   type       0..4, the class
+1  int8   player     which side the event is about
+2  int8   subtype    the event proper
+3  int8   (unused)
+4  int32  param
```

`MKEventQueue[0]` is the count and the records start at +4. The loop walks
exactly `count` of them and never looks at a used-flag, so the engine hands over
a fresh, packed array each frame.

## The five classes

| type | class | subtypes | live |
|---:|---|---:|---:|
| 0 | camera | 1 | 1 |
| 1 | position | 4 | 4 |
| 2 | sound | 5 | 5 |
| 3 | state | 14 | 10 |
| 4 | effects | **69** | 34 |

Type 4's table is an inline `.word` array the compiler jumps into with
`mov pc, r0`, not a `tbb`, so the dead subtypes are visible as explicit jumps
back to the loop tail. **Thirty-nine of the eighty-eight arms across all the
tables do nothing.**

```bash
python tools/disasm_range.py work/UMK3.armv7 0x732a8 0x74c9c > ev.txt
python tools/lits.py ev.txt > evl.txt
python tools/handlers.py evl.txt --table 0x733c0:69:1 --table 0x734ec:14:0 \
                                 --table 0x7353c:5:0 --tail 0x73388
```

---

## The finishers, named by the binary

Five subtypes carry the finisher set, and four of them log an EA analytics event
whose last argument is a plain ASCII literal — so these names are **read, not
inferred**:

| subtype | finisher | logged as | music |
|---:|---|---|---|
| 22 | **Fatality** | `"Fatality"` | — |
| 28 | **Animality** | `"Animality"` | `Animality.mp3` |
| 29 | **Mercy** | not logged | `Mercy.mp3` |
| 42 | **Friendship** | `"Friendship"` | `Friendship.mp3` |
| 43 | **Babality** | `"Babality"` | `Babality.mp3` |

Every logging call is
`EASDK_LogEventEnumEnumString(0x3f7, 15, DestinyNames[Destiny], 15, <name>)` —
the difficulty and the finisher. Mercy changes the music but is never logged.

The four logged ones share a shape that carries three facts:

- the log fires only when the **loser is actually at zero health**;
- in `GameMode == 0` it also unlocks an achievement and bumps a stat, which is
  why those two only ever count arcade play;
- in `GameMode == 1` the stat is bumped for whichever side the local machine is,
  decided by `isParent()`.

**Classic Sub-Zero (index 21) suppresses the friendship** on either side:
subtype 42 returns early if the performer is `0x15`. And `0x19` (Shao Kahn)
gates the whole Shao-Kahn death sequence in subtype 65. Both indices match
[ROSTER.md](ROSTER.md).

---

## Stats and achievements this function owns

| counter | what |
|---|---|
| `Stats[5]` | fatalities |
| `Stats[8]` | animalities |

| achievement | earned by |
|---:|---|
| 4 | the blast, outside modes 1 and 6 |
| 9 | a babality |
| 0xa | an animality |
| 0xc | a fatality |

---

## What else the map named

- **`groundoffsets` (0x001725bc)** is a per-character ground offset table.
  Subtype 54 computes `blast_player_height = 0xf7 - groundoffsets[PLAYER2MODEL]`,
  a fixed 247 minus the character's offset. First use of that table found.
- **The scene globals** all resolve through pointer slots and are named:
  `BloodScene`, `PitDeathScene`, `SZEffectScene`, `SwatEffectScene`,
  `CyraxSelfDestructScene`, `SKEffectScene`, `XeroxScene`, `RocksScene`,
  `TrainScene`, `TrainDie1Scene`, `TrainDie2Scene`, `SLDie1Scene`,
  `SLDie2Scene`. The stage-death scenes pair with
  [STAGES.md](STAGES.md)'s inventory.
- **`ScorpionFade`, `ScorpionFadeAdd`, `ScorpionFlash` and `lightsOn` are
  floats**, written here as `1.0f` and `1.0f/30.0f`. That is an independent
  confirmation of the type correction made when `DrawHUD` landed — two
  functions, neither of which had been read when the wrong `long` was written
  down.
- **Health arrives as a bar length, not a percentage.** Type 3 subtype 0
  computes `Health[p] = 100 * (param + 1) / 166`, the exact inverse of the
  `* 166 / 100` that `GameCode.c` uses to draw the bar. The run meter is
  `100 * param / 48`.

---

## Three shared tails

Many arms converge on one of three tails, which is why the function is smaller
than eighty-eight handlers would suggest:

- **the effect spawn** — identity matrix, `RotMatrixX(m, pi/2)`,
  `limeScaleMatrix(m, WorldScaleAdjust)`, the packed position dropped into
  `m[0x30]` and `m[0x38]`, then `LIME_PlayFBXAtPos`. The position arrives as two
  16-bit halves of `param`.
- **the sound tail** (`0x0007417e`) — `limePlaySound(id, MusicVol[Settings[3]],
  ...)`, skipped entirely when `Settings[3]` is zero.
- **the finisher tail** — stop the tune, start the finisher's own.

---

## What is left

The function is mapped, not decompiled. Every arm's *shape* is known from
`tools/handlers.py`; these arms still need an instruction-level read before any
of them can be written down as code:

| arm | what is unread |
|---|---|
| type 0 | the whole body — the `GetNewEvent` / `ArcadePosTo3dPos` pair |
| type 1 | all four subtypes |
| 4 sub 13 | the combo slider and timer constants |
| 4 sub 17/18 | the sound id, the two `achievementsUnlock` ids at `0x74a54`, the `RoundParam` offset |
| 4 sub 24 | the text id and the `Player1Pos` arithmetic |
| 4 sub 27 | the `FrameRemapTable` indexing and the `LIME_TriggerEventsFromScene` arguments |
| 4 sub 30, 34, 35 | the sound ids and the scale arguments |
| 4 sub 42 | the friendship achievement id at `0x74ab0` |
| 4 sub 60, 63 | the second `LIME_PlayFBXAtPos` and the `DoingStageFatal == 2` variants |
| 4 sub 65 | the `SKDeathMessageOffset` value and the camera argument |

A summary from `handlers.py` is a reason to go and read an arm. It is never a
substitute for having read it.
