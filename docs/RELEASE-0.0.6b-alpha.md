## Ultimate Mortal Kombat 3 — PC port 0.0.6b alpha (Windows)

A small update to 0.0.6. As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe`. How to play is unchanged from [0.0.6](RELEASE-0.0.6-alpha.md).

### New in 0.0.6b
- **The game's alerts are drawn inside the game**, in the iPhone OS 3 style: the screen dims, and a translucent box with the text and glossy buttons appears. Examples are "check your internet connection" when opening the leaderboards, and "are you sure?" before a new game. They were Windows message boxes, which stayed hidden behind the game in fullscreen. As on the device (`+[modalAlert askFull:textOK:textCANCEL:]`, 0xb5444), the whole text is the title, OK is on the left and CANCEL on the right. Click a button, or press Enter (OK) or Esc (CANCEL).
- **The F2 debug menu** has the same style: a translucent box with a blue selection bar and sharp text at the screen's resolution.
- **The fullscreen frame picture** no longer disappears while the debug menu is open.

Everything in [0.0.6](RELEASE-0.0.6-alpha.md) is included: the new launcher, Shao Kahn's death and the closing texts, the stage effects, the Waterfront floor, the treasure screen.

### Known problems (still open)
- Texture errors on some other stages and fighters (parts of Kung Lao's hat black).
- Modes other than Arcade can crash; the menus are not complete and some modes are missing.
- Fatalities with missing animations (Sonya's does not show properly); fighters frozen by Sub-Zero draw white.
- In a finisher against Reptile, the dizzy opponent walks towards the player.
- Kombat Kode icons misplaced on the loading screen; pausing sometimes shows the fight shrunk into a corner.
- Some special attacks have no sound, projectiles especially.
- The game's ads open in separate windows.
- The launcher is Windows only (Linux/macOS: build from source with CMake). Only the iPhone 1.2.59 `.ipa` works.

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
