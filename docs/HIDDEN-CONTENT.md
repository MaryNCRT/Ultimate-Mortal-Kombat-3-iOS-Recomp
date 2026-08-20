# Hidden and possibly unreachable content

![The hidden tier: Noob Saibot, Human Smoke, Classic Sub-Zero, Motaro, Shao Kahn](img/hidden-tier.png)

<sub>Left to right: **Noob Saibot**, **Human Smoke**, **Classic Sub-Zero**,
**Motaro**, **Shao Kahn** — posed by [`tools/pose.py`](../tools/pose.py) from
their own `.bones`, `.skinanim` and `.skin`. Noob renders as a pure black
silhouette because that is his design, not because anything is missing.</sub>

---

## The roster table has a hidden tier

The binary carries the roster as a string table at `0x14ee34`:

```
KANO · SONYA · JAX · NIGHTWOLF · SUB-ZERO · STRYKER · SINDEL · SEKTOR · CYRAX ·
KUNG LAO · KABAL · SHEEVA · SHANG TSUNG · LIU KANG · SMOKE · KITANA · JADE ·
MILEENA · SCORPION · REPTILE · ERMAC · SUB-ZERO · SMOKE · NOOB SAIBOT ·
MOTARO · SHAO KAHN
```

Twenty-six entries, and **`SUB-ZERO` and `SMOKE` each appear twice**. The second
of each is Classic Sub-Zero and Human Smoke — the game ships them as
`OLDSUBZERO_STANDARD` and `OLDSMOKE_STANDARD`, and Human Smoke's versus art is
named `SMOKE_SECRET_VERSUS.PNG`.

So the last five entries form a distinct tier, and the game has UI for it:
**`HIDDENPORTRAIT.PNG`** ships alongside the normal character portraits.

## Noob Saibot is complete, not vestigial

Asked to check a forum rumour about leftover Noob Saibot assets, we found the
opposite of leftovers.

| | |
|---|---|
| Asset weight | **2,466,395 bytes** — within 1 KB of Scorpion's 2,465,648 |
| Animation | 347 frames over 48 bones |
| Full set | `.bones` `.skin` `.skinanim` `.scene` `.events` `.meshset` |
| Own stage | `NOOBS_DORFEN_LEVEL` + `NOOBSDORFEN_LEVEL_SCENE` |
| Own finishers | `BABALITY_NOOBSAIBOT`, `NOOBSAIBOT_DECAP`, `NOOBSAIBOT_FLOAT` |
| Deaths at others' hands | Cyrax, Kung Lao, Reptile, Jax, Mileena, Sheeva |
| Stage deaths | `LAIR_NOOBSAIBOT`, `SUBWAY_NOOBSAIBOT`, and `2` variants of each |
| UI art | iPad portrait, `NOOBSAIBOT_VERSUS`, `_VERSUS2`, `_LOW` |

The binary carries `NOOB SAIBOT WINS`, `_NoobSaibotIntroFrames`,
`_Player_NOOB_Idles`, `_t_noob_slam`, and at `0x162ea0` the pair `delete_slave`
and `noob_p` — his shadow clone.

### Why he looks cut, and is not

Searching `frames.x` and `moves_data.x` for "noob" or "saibot" returns **zero
hits**. That is the whole basis for thinking he was removed. He simply has his
own frame list, `res/framelists/noobsaibotframes.txt`, and its contents explain
everything:

```
SCBACKBREAK1 · SCBLOCK1 · SCBZZ1 · SCCOMBO1 · HALF_NJ · NJMOUTH7_KN
```

**`SC` is Scorpion's prefix and `NJ` is the shared ninja set.** Noob is built on
the male ninja rig and reuses Scorpion's frame naming, exactly as the 1995
arcade did with its palette-swap ninjas — his 347 frames over 48 bones match
Liu Kang's and Old Smoke's precisely. The naming convention hides him from a
text search; nothing is missing.

## The select-screen portraits give the tier away

![Character-select portraits: the hidden tier against the normal roster](img/hidden-portraits.png)

Every one of the **24 normal selectable characters has a 128x128 portrait**.
Exactly five files are **64x64**, and they are precisely the hidden tier plus
the two non-combatants:

```
DUMMYPORTRAIT · ENDURANCEPORTRAIT · NOOBSAIBOTPORTRAIT ·
OLDSMOKEPORTRAIT · OLDSUBZEROPORTRAIT
```

Half the resolution of everybody else, with no exceptions in either direction.
That is not a coincidence of art budgets; it is a category.

### Human Smoke never got a portrait at all

Noob Saibot and Classic Sub-Zero have **real, drawn portraits** — a masked
ninja face on green and a blue-masked one on purple. `OLDSMOKEPORTRAIT.PNG`
is the **red question mark**: the same placeholder art as `HIDDENPORTRAIT.PNG`,
downscaled to 64x64 and shipped as his actual portrait.

Measured against `HIDDENPORTRAIT` resampled to 64x64:

| File | Mean pixel difference |
|---|---:|
| `OLDSMOKEPORTRAIT.PNG` | **3.65** — the same image |
| `NOOBSAIBOTPORTRAIT.PNG` | 53.05 — a different, real portrait |
| `OLDSUBZEROPORTRAIT.PNG` | 48.99 — a different, real portrait |

A factor of fourteen. So the character-select art for Human Smoke is
**unfinished**, and the placeholder went out in the retail build.

This is the one place so far where the evidence supports the word *unfinished*
rather than merely *hidden*. Noob Saibot, by contrast, has everything.

## What is genuinely unknown

**Whether the character select screen exposes any of this.** That logic lives in
`FrontEnd.cpp`, which is not decompiled, so we can state what ships and not what
is reachable. The honest summary:

- the **assets** are complete for all five
- the **roster table** lists them
- a **hidden-portrait** asset exists
- the **selection path** is unread

Calling them "unused" would overstate it. "Present, and not yet shown to be
reachable" is what the evidence supports.

## Rain: one string, and nothing else

Rain is the other famous UMK3 rumour -- he appears in the arcade attract mode
and was not playable until Trilogy. Checked the same way Noob Saibot was, the
answer is the exact opposite.

The binary carries **two roster tables**, and they disagree:

| Table | Entries |
|---|---:|
| Character names, at `0x14ee34` | **26** |
| Win messages, at `0x173a80` | **29** |

They are otherwise in identical order. The three that appear only in the win
messages are:

```
RAIN WINS          between SCORPION and REPTILE -- his arcade roster slot
TOBIAS WINS        John Tobias, one of Mortal Kombat's creators
OON WINS
```

Alongside them sit `JOHNNY CAGE LOSES BIG TIME !!` and
`JOHHNY CAGE TRANSFORMATION ACTIVATED` -- the typo is the binary's -- which are
arcade-era developer jokes for a character who is not in UMK3 at all.

So the win-message array was carried over from the arcade **verbatim**, jokes
included, while the actual roster was trimmed to 26.

### There is nothing else of him

Every asset category searched, excluding the Subway `TRAIN` and training-mode
matches that share the substring:

| Looked for | Found |
|---|---:|
| `*RAIN*.pvr` / `.PNG` | 0 |
| `*RAIN*.meshset` / `.skin` | 0 |
| `*RAIN*frames.txt` | 0 |
| `*RAIN*PORTRAIT*` | 0 |

**No model, no animation, no texture, no portrait, no frame list, no scene.**

### Why this is the useful comparison

| | Noob Saibot | Rain |
|---|---|---|
| Assets | 2.47 MB, complete | none |
| In the name table | yes | **no** |
| Win message | yes | yes |
| Select portrait | a real drawn face | none |
| Verdict | present, reachability unknown | **absent** |

Noob Saibot looked cut and is complete; Rain looks present and is a leftover
string. Either one alone would mislead. Checking both is what makes the method
worth anything.

## Genuinely unused: build leftovers

- **`res/framelists/subzeroframes.txt.tmp`** — a temp file that shipped. The
  binary contains zero occurrences of `.tmp`, so nothing loads it.
- **SINDEL's duplicate animation half** — ~265 KB never read; see
  [GAME-BUGS.md](GAME-BUGS.md).

---

## On restoring it later

This is a **post-playable** goal, deliberately. Restoration means changing
behaviour, and behaviour cannot be judged before there is a running port to
judge it against. It sits on the roadmap after the decompilation and a playable
build, not before.

One boundary to state in advance, because it will come up: reconstructing
arcade behaviour must come from **observing the arcade ROM** — which this
project has already done under MAME — and from **our own binary's symbol
table**, which names 4,342 functions. It must not come from leaked retail
source, or from third-party write-ups that are themselves readings of leaked
source. That rule is why this project's findings are reusable at all, and
restoration work does not get an exception from it. See
[METHODOLOGY.md](METHODOLOGY.md).
