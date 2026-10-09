## Ultimate Mortal Kombat 3 — PC port 0.0.3 alpha (Windows)

Third public build. As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe` (see the 0.0.1 notes for the steps).

### Fixed in 0.0.3
Every fix was read from the original armv7 binary.

- **The tower shows the real ladder.** Each rung has its own opponent; before, every rung showed Jade. `Load_Tower` (0x23314) loaded the saved ladder into a table nothing read, so the tower kept its built-in default.
- **The tower animation.** The camera flies to your column and down to your rung, climbs after a win, and moves on to the fight by itself, as in the original. The camera states in `FE_Task_Tower` (0x8310) used the wrong column, never finished on their own, and skipped the climb setup. The two bosses now get their own arenas.
- **The pause menu is complete.** Number of buttons, layout, music volume and SFX volume are visible again. The bug was in `usprintf`: the text built from a template lost every `%s` / `%d` (0xa7600). The same fix brings back the moves-list titles and "N/A", and other text built the same way.
- **The moves list ("i" button).** Pages 2 and 3 of basic moves show their own moves instead of repeating page 1, and the generic pages no longer repeat each move's name in brackets (0x1efb0).
- **The HUD buttons are visible and work.** The "i" (moves list) and pause buttons are drawn in every mode, with the pulse on the "i" button (0x28910, 0x2a170, 0x2ab2a).
- **New keys:** **P** = pause menu (again = resume) and **M** = moves list (again = close). **Esc no longer quits the game.**
- **Player 1 keys can be changed in the launcher:** box "3. Player 1 controls". Click an action, then press a key. The keys are saved in `umk3.ini`, and **Reset** restores the defaults.

### Known problems (0.0.3)
- **The menus are not complete**, and **some menu sections still crash the game.**
- **Several texture errors remain.**
- The winner text ("X WINS") may now appear thanks to the `usprintf` fix; not confirmed yet.
- In Arcade the arena is always the same, except for the boss fights.
- The game can still crash in places not listed here; please send the log.
- The launcher is Windows only (Linux/macOS: build from source with CMake).

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
