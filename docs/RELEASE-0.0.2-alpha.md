## Ultimate Mortal Kombat 3 — PC port 0.0.2 alpha (Windows)

Second public build. As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe` (see the 0.0.1 notes for the steps and the controls).

### Fixed in 0.0.2
Every fix was read from the original armv7 binary and checked in game.

- **Fights can be played to the end.** Round 2 starts, the match ends, the Continue screen appears and the next fight loads. (Five bugs: the round summary stopped while the winner banner was up; round 2 played on a black screen; the game hung freeing the stage at the end of a match; stage 1 crashed on load; the winner-text buffer was too small and overwrote other data.)
- **The camera follows both fighters**, centring and zooming on them as in the original. One fighter's 3D position was being read from the wrong place.
- **Character voices and sound effects.** Attack, jump, grab and hit voices play, and the stray sounds on button presses are gone.
- **Black fighters and props.** Fighters, Kung Lao's hat in character select and other attachments no longer draw as black silhouettes.
- **Sindel's hair** is drawn, with its texture.
- **The on-screen joystick animates** with the direction pressed.

New for testers: with `debug_keys=1` in `umk3.ini`, **F9 / F10** end the round (KO player 2 / player 1) and **F11 / F12** win / lose the whole match.

### Known problems (0.0.2)
- **The menus are not complete**, and **some menu sections still crash the game.**
- **Several texture errors remain**, although many were fixed in this version.
- The winner text ("X WINS") is not shown, although the announcer says it.
- The game can still crash in places not listed here — please send the log.
- Sometimes every opponent in the tower is Jade.
- The tower's descent animation does not display correctly.
- In Arcade the arena is always the same (the original picks it at random).
- The launcher is Windows only (Linux/macOS: build from source with CMake).

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
