## Ultimate Mortal Kombat 3 — PC port 0.0.6 alpha (Windows)

The current public build; it replaces 0.0.5. As before, **no game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone** with `UMK3-Launcher.exe`.

### How to play
1. Unzip and run `UMK3-Launcher.exe` -- **a new launcher** in this build. The window resizes freely (4:3 by default) and F11 makes it fullscreen; mouse, or arrows and Enter.
2. In *COMPILE YOUR .IPA* choose your `.ipa` and press **Compilar** (it downloads a pinned compiler the first time, about 190 MB).
3. In *GRAPHICS* pick resolution, fullscreen, language, debug mode and, optionally, a frame picture for the fullscreen bars. In *CONTROLS* pick the 6- or 5-button layout and set each layout's keys. Then press the big **PLAY** in *PLAY*.
4. Keys, 6 buttons: W A S D or arrows to move; U high punch, I low punch, O block, J high kick, K low kick, L run. 5 buttons: U punch, O block, J kick, L run, H special. **P** pause, **M** moves list.
5. Debug mode: tick it in *GRAPHICS*, then **F2** in the game.

### New in 0.0.6
Every game fix was read from the original armv7 binary.

- **New launcher**: resizable and fullscreen, the game logo, an arcade-style menu. The menu's PLAY entry only opens the section; the big PLAY button starts the game.
- **Controls: 5 or 6 buttons.** A tab in the launcher picks the layout the game starts with, and each layout keeps its own keys (the 5-button special now has a key).
- **Shao Kahn's death at the end of Arcade plays in full**: Shao Kahn in green light with the beams, then "<fighter> WINS", "SHAO KAHN IS NO MORE", "YOU ARE THE ULTIMATE MK3 CHAMPION". `LIME_RenderEvents` (0xa4a3c), which draws every scene effect, was an old armv6 transcription that drew with an uninitialised matrix; the closing texts (`DrawHUD`, 0x2a5e0) were missing.
- **Stage effects appear where they belong** (same fix): the graveyard's moon and sky, the spiked bridge's background.
- **The Waterfront (pier) has its floor again.** The engine's `StringInString` (0x5e27c) is an exact comparison; using a substring search made the floor match another mesh, and the floor was freed at load.
- **The treasure screen no longer softlocks** after picking a reward (0x113ba).
- **A custom frame** no longer shows through the gaps of the stage: the game area is black underneath.

### Fixed in earlier builds
- **0.0.5:** Arcade can be completed and Shao Kahn no longer crashes; menu buttons as in the original; no slow black fades; FINISH HIM for male fighters; moves-list layout; achievement banners; Motaro; Human Smoke; debug menu round keys and Arcade boss jump.
- **0.0.4:** debug mode and the F2 menu; audio no longer dies after two fights in Arcade; the unlockables and other spotlight screens no longer crash; no menu section crashes; Motaro and Shao Kahn's first hit reaction no longer crashes.
- **0.0.3:** the tower; complete pause menu; moves-list pages and icons; HUD "i" and pause buttons; P / M keys; configurable keys.
- **0.0.2:** fights play to the end; the camera; voices and sounds; no black fighters; Sindel's hair; the on-screen joystick.
- **0.0.1:** the launcher, which builds the game from your own `.ipa`; the first fight by the real path.

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
