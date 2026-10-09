## Ultimate Mortal Kombat 3 — PC port 0.0.6c alpha (Windows)

A small update to 0.0.6b. As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe`. How to play is unchanged from [0.0.6](RELEASE-0.0.6-alpha.md).

### New in 0.0.6c
- **F2 debug menu: FINISHER row.** During FINISH HIM, once the loser is dizzy, it makes player one perform a pit/stage fatality, mercy, fatality 1 or 2, animality, babality or friendship. It makes the same call the joystick code does (`DoASpecial`, 0x51830), so each finisher can be looked at without typing its input. Every finisher goes through `mercy_xfer` (0x54ac4), which ignores the request until the loser is dizzy, so the row stays grey until then.

Everything in [0.0.6b](RELEASE-0.0.6b-alpha.md) and [0.0.6](RELEASE-0.0.6-alpha.md) is included.

### Known problems (still open)
- Typed finisher inputs (fatalities, friendships, babalities, animalities, mercy) do not seem to fire; forced from the debug menu they run. After a fatality the announcer and the FATALITY banner are missing.
- Objects other than the fighters are not drawn: Scorpion's spear, items some attacks make appear.
- Kung Lao's hat is wrong on the character select screen; other texture errors on some stages and fighters.
- Survival mode crashes after winning a fight; other modes than Arcade can crash.
- Sub-Zero's ice clone has misplaced textures; fighters frozen by Sub-Zero draw white.
- Kombat Kode icons misplaced on the loading screen; pausing sometimes shows the fight shrunk into a corner.
- Some special attacks have no sound, projectiles especially. The game's ads open in separate windows.
- The launcher is Windows only (Linux/macOS: build from source with CMake). Only the iPhone 1.2.59 `.ipa` works.

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
