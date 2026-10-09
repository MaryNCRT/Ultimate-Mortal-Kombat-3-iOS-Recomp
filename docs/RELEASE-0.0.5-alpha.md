## Ultimate Mortal Kombat 3 — PC port 0.0.5 alpha (Windows)

The current public build; it replaces 0.0.4. As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe`.

### How to play
1. Unzip, run `UMK3-Launcher.exe`, choose your `.ipa` and press **Compilar** (it downloads a pinned compiler the first time, about 190 MB).
2. Pick resolution, fullscreen and language, and press **JUGAR**.
3. Keys: W A S D or arrows to move; U high punch, I low punch, O block, J high kick, K low kick, L run; **P** pause, **M** moves list. Player 1 keys can be changed in the launcher.
4. Debug mode: tick *Debug mode (F2 menu)* in the launcher, then **F2** in the game.

### Fixed in 0.0.5
Every fix was read from the original armv7 binary.

- **Arcade can be completed**, and Shao Kahn no longer crashes. The end of the ladder goes on to the treasure screen.
- **Menu buttons look as in the original.** Every front-end button (Settings, Button setup, Stats, Achievements, Leaderboards, Share info, the confirmation boxes...) drew the wrong part of its texture -- the Facebook button art on the settings boxes. `DrawButtonNew` (0x57d8) had the texture corner transposed.
- **No more slow black fades** between rounds and at the end of fights. They ran ten times slower when an achievement was saved in a slot the game never shows (`areAchievementsViewing`, 0xa02ac, counts 20 slots, not 24).
- **FINISH HIM** is shown for male fighters (it always said HER; the voice was right).
- **The moves list ("i")**: each move's name and icons are on the same side; the rows zig-zag as in the original.
- **Achievement banners** no longer draw their two lines on top of each other.
- **Motaro**: no more odd behaviour (Kitana blocking all the time) or wrong audio in his fight.
- **Human Smoke** can be picked again by holding the click on Smoke's portrait for three seconds.
- **The arena changes in Arcade** (it is no longer always the same).
- **Debug menu (F2)**: win/lose round only acts while a round is in play, so a round can no longer go to both fighters; win/lose match also counts in the fight engine, so a debug win at the end of a ladder ends it like a real one; new rows *Arcade: next is Motaro* / *next is Shao Kahn* (Arcade only).

### Fixed in earlier builds
- **0.0.4:** debug mode and the F2 menu; audio no longer dies after two fights in Arcade; the unlockables screen and the other spotlight screens no longer crash; no menu section crashes; menu backgrounds use the device's `.pvr` textures; Motaro and Shao Kahn's first hit reaction no longer crashes.
- **0.0.3:** the tower shows the real ladder and animates as in the original; complete pause menu; moves-list pages and icons; the HUD "i" and pause buttons; P / M keys, Esc no longer quits; player 1 keys configurable in the launcher.
- **0.0.2:** fights play to the end (round 2, Continue, next fight); the camera; voices and sounds; no black fighters; Sindel's hair; the on-screen joystick.
- **0.0.1:** the launcher, which builds the game from your own `.ipa`; the first fight by the real path.

### Known problems (still open)
- **Shao Kahn's death at the end of Arcade:** his model and effects do not appear (the screen is empty while it runs) and its sound repeats.
- In a finisher against Reptile, the dizzy opponent walks towards the player instead of standing still.
- Frozen fighters (Sub-Zero's freeze) draw completely white.
- Sonya's fatality does not show properly.
- One stage (the spiked bridge, against Nightwolf) draws no background; texture errors remain on some other stages and modes.
- Kombat Kode icons are misplaced on the loading screen (the lower row covers "Loading").
- Pausing sometimes shows the fight shrunk into a corner behind the pause menu.
- Some special attacks have no sound, projectiles especially.
- The game's ads open in separate windows (they should open inside the game).
- The menus are not complete; some modes are missing.
- Random crashes have been seen; please send the log.
- The launcher is Windows only (Linux/macOS: build from source with CMake). Only the iPhone 1.2.59 `.ipa` works.

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
