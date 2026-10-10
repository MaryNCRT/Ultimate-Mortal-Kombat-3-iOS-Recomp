## Ultimate Mortal Kombat 3 — PC port 0.0.8 alpha (Windows)

**The game is now 100% playable**: menus, Arcade up to Shao Kahn and the treasure screen, whole fights, and every finisher — fatalities, the stage fatality, mercy, animality, babality and friendship — with its banner and its music. It is still an alpha: you may run into bugs, and they will be fixed in the next versions. Please report them (see the end of these notes).

As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe`. How to play is unchanged from [0.0.6](RELEASE-0.0.6-alpha.md).

### Fixed in 0.0.8
- **Mercy** works start to finish: the MERCY banner and `Mercy.mp3` last their full time. DrawHUD's counter rises 0.2 a frame (0x2844e, the double at 0x286f4), not 13; at 13 the banner was gone in three frames and the stage music cut the tune. As in the original, the loser gets up with a sliver of health and the round goes on.
- **Animality**, which the game only allows after a mercy, now runs with its banner, its tune and the animal's model. With that, every finisher works.

### New in the launcher and the engine (port only)
- **GRAPHICS** is now the video options:
  - **Window resolution** and a separate **3D resolution**: the game really draws at the 3D resolution and is scaled to the window (lower is softer and faster, higher is sharper). *Same as the window* by default. 480 × 320 is marked **(IPHONE)**, the original's.
  - **Display mode**: *Window*, *Fullscreen* (exclusive, the monitor switched to the window resolution; borderless if the monitor has no such mode) or *Borderless window* (fullscreen without a border at the desktop's resolution). The custom frame shows in both fullscreen modes.
  - **Aspect ratio**: 3:2 (original); more will come.
  - **Antialiasing**: off, x2, x4, x8 or x16.
  - **Hide the on-screen controls**: the stick and the buttons are not drawn (they stay in the game for whoever wants them).
- **Game language** moved to *PLAY*.
- **CONTROLS** has two categories: *PLAYER 1* (with the 6- and 5-button layouts) and *DEBUG* (the debug mode's keys and shortcuts).
- The title logo is your `logo.png` in the game folder if you put one there; otherwise the game's own, taken from your compiled `.ipa`.

Everything in [0.0.7b](RELEASE-0.0.7b-alpha.md), [0.0.7](RELEASE-0.0.7-alpha.md) and earlier is included.

### Known problems (still open)
- Sometimes during FINISH HIM the dizzy loser slides toward the winner (not reproduced lately; being watched).
- Some objects other than the fighters may still not be drawn; some fatalities miss animations.
- Texture errors remain on some stages and fighters; modes other than Arcade can crash.
- Kombat Kode icons misplaced on the loading screen; pausing sometimes shows the fight shrunk into a corner.
- Some special attacks have no sound, projectiles especially. The game's ads open in separate windows.
- The launcher is Windows only (Linux/macOS: build from source with CMake). Only the iPhone 1.2.59 `.ipa` works.

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
