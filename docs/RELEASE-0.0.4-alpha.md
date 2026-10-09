## Ultimate Mortal Kombat 3 — PC port 0.0.4 alpha (Windows)

The current public build; it replaces 0.0.1–0.0.3. As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe`.

### How to play
1. Unzip, run `UMK3-Launcher.exe`, choose your `.ipa` and press **Compilar** (it downloads a pinned compiler the first time, about 190 MB).
2. Pick resolution, fullscreen and language, and press **JUGAR**.
3. Keys: W A S D or arrows to move; U high punch, I low punch, O block, J high kick, K low kick, L run; **P** pause, **M** moves list. Player 1 keys can be changed in the launcher.

### Fixed in 0.0.4
Every fix was read from the original armv7 binary.

- **Debug mode** (checklist 1). Launcher box *Debug mode (F2 menu)*. **F2** opens a menu drawn inside the game, over the frozen frame: start any fight — both fighters, **Motaro and Shao Kahn included**, any stage — jump to any of the 51 menu screens, win or lose the round or the whole match (skips the fight), show an info line. Direct keys: F3 info line, F6/F7 previous/next screen, F8 main menu, F9/F10 end the round, F11/F12 win/lose the match; the menu can turn them off.
- **Audio no longer dies after two fights in Arcade** (checklist 2). `UnLoadSoundList` (0xa7f08) never deleted a fight's sounds, so the 512-slot sound table filled after about two fights.
- **The unlockables screen at the end of Arcade works** (it crashed) (checklist 13), and so do the other screens with the two animated spotlights (Stats, Treasure, the Survival and Karnage summaries...): empty spotlight tables, and `DrawAnimAsSprite` (0x1c8bc) took the wrong texture, frame and size.
- **No menu section crashes any more** (checklist 4; checked by Mary, 2026-10-09). Treasure and Stats were among the spotlight screens above.
- **Menu backgrounds** use the device's `.pvr` textures first: the metal background no longer shows a white band (part of checklist 4).
- **Motaro and Shao Kahn**: the first hit reaction against either crashed or ran garbage (`t_rst5`, 0x473d0, read their tables at raw iPhone addresses) (checklist 5 and 10, to confirm in game).

### Fixed in earlier builds
- **0.0.3:** the tower shows the real ladder (no more all-Jade) and animates as in the original; complete pause menu (buttons, layout, music and SFX volume); moves-list pages and icons; the HUD "i" and pause buttons; P = pause, M = moves list, Esc no longer quits; player 1 keys configurable in the launcher.
- **0.0.2:** fights play to the end (round 2, end of match, Continue, next fight); the camera follows both fighters; voices and sounds at the right moment; fighters, Kung Lao's hat and props no longer black; Sindel's hair; the on-screen joystick moves.
- **0.0.1:** the launcher, which builds the game from your own `.ipa`; the first fight by the real path.

### Known problems (still present)
Numbers are the checklist in the README's *Known problems*.

- **(3)** Texture errors on some stages and in some modes.
- **(4)** Texture errors in some menus.
- **(5, 10)** Shao Kahn crashes and the bosses' behaviour: the crash found is fixed; the bosses still need a full check. Shao Kahn's death is not shown at the end of Arcade **(12)**.
- **(6)** The winner's name ("X WINS") is not shown.
- **(7)** Some special attacks have no sound, projectiles especially.
- **(8)** The game's ads open in separate windows (they should open inside the game).
- **(9, 11)** The menus are not complete; some modes are missing.
- **(14)** Achievements draw with overlapping text.
- **(15)** Icons misplaced on the loading screen; **(16)** and in the moves list.
- **(17)** Against Motaro, Kitana kept blocking and behaved oddly, and the fight's audio was wrong — probably the `t_rst5` fix above; to confirm.
- In Arcade the arena is always the same, except for the boss fights.
- The game can still crash in places not listed here; please send the log.
- The launcher is Windows only (Linux/macOS: build from source with CMake). Only the iPhone 1.2.59 `.ipa` works.

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
