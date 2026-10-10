## Ultimate Mortal Kombat 3 — PC port 0.0.7 alpha (Windows)

The fixes since 0.0.6c, all checked in game by Mary. As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe`. How to play is unchanged from [0.0.6](RELEASE-0.0.6-alpha.md).

### Fixed in 0.0.7
- **Typed finishers work**, in the 5-button layout (one gesture with S during FINISH HIM) and the 6-button one (the arcade inputs). `GetArcadeJoyBits` compared later table entries against the bare stick bits instead of the word with the finishing bit (0x1b830).
- **Finisher banners and tunes**: FATALITY, ANIMALITY, FRIENDSHIP and the BABALITY blocks that bounce (DrawHUD 0x29d56..0x2ab26) were never drawn. Babality, animality, mercy and friendship also had no banner or tune because `create_fx_param` re-read its code after `NewThread` changed it (0x58b68 keeps it in a register). The fight no longer ends before the announcer finishes (0.7 a tick while finishing, 0x2a2d6).
- **Survival** no longer crashes after a win (`SurvivalStage` pointer slots).
- **Scorpion's spear** is drawn.
- **Shao Karnage**: player one's bar no longer covers the score, and the difficulty is right.
- **Kung Lao's hat** is no longer black on the select screen (the front end has no stage, so the ambient light the hat needs was 0; port fix).
- **Sub-Zero's ice**: frozen fighters and the ice clone have their ice texture instead of plain white (`_DIFFUSE_ICE` was loaded on the front-end path only).

### New in the launcher and the debug mode (port only)
- **Skip the intros** box in *PLAY*: the game starts past the two publisher logos.
- The **Debug mode** box moved to *PLAY*.
- *CONTROLS* has a separate **debug keys and shortcuts** section: the key that opens the menu, the info line, the menu's pages, the four fight keys and the three screen keys can all be rebound.
- The **F2 debug menu** has four pages — FIGHTERS, DURING THE FIGHT, MENUS, OPTIONS — turned with Q / E, and works with the **mouse** (click the title to turn the page; on a row with a value the left half lowers it and the right half raises it).
- **PALETTE 1 / PALETTE 2** rows: each fighter can be loaded with its first or its alternate colours (the alternate is what the game uses for the second of two identical fighters).

Everything in [0.0.6c](RELEASE-0.0.6c-alpha.md), [0.0.6b](RELEASE-0.0.6b-alpha.md) and [0.0.6](RELEASE-0.0.6-alpha.md) is included.

### Known problems (still open)
- Sometimes during FINISH HIM the dizzy loser slides toward the winner (seen again, not reproduced since; being watched).
- Some objects other than the fighters may still not be drawn; some fatalities miss animations.
- Texture errors remain on some stages and fighters; modes other than Arcade can crash.
- Kombat Kode icons misplaced on the loading screen; pausing sometimes shows the fight shrunk into a corner.
- Some special attacks have no sound, projectiles especially. The game's ads open in separate windows.
- The launcher is Windows only (Linux/macOS: build from source with CMake). Only the iPhone 1.2.59 `.ipa` works.

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
