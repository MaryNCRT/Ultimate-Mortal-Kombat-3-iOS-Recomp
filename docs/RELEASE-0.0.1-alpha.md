## Ultimate Mortal Kombat 3 — PC port 0.0.1 alpha (Windows)

First public build. **No game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone**.

### How to play
1. Download and unzip `UMK3-PC-0.0.1-alpha.zip`.
2. Open `UMK3-Launcher.exe` → **Browse...** → choose your `.ipa` → **Compile**.
   The first time, it downloads the compiler (llvm-mingw 20260616, ~190 MB, SHA-256 checked) and Python 3.12.10; then it checks your binary, extracts the game tables from it, compiles `umk3-game.exe` and copies `res\` out of your `.ipa` (under a minute).
3. Choose the **3D resolution**, **fullscreen** and **language** (saved automatically to `umk3.ini`) and press **PLAY**. The button at the top right switches the launcher between English and Spanish.

Requirements: Windows 10/11 64-bit, an internet connection the first time, ~1.5 GB free. The iPad 1.2.56 `.ipa` does not work.

### Controls
Mouse = finger (menus and on-screen touch controls). In a fight:

| Key | Action |
|---|---|
| W / ↑ | Jump |
| S / ↓ | Crouch |
| A / ← | Left |
| D / → | Right |
| Two directions at once | Diagonal (e.g. W+D jumps forward) |
| U (numpad 7) | High punch (HP) |
| I (numpad 8) | Low punch (LP) |
| O (numpad 9) | Block (BL) |
| J (numpad 4) | High kick (HK) |
| K (numpad 5) | Low kick (LK) |
| L (numpad 6) | Run (RUN) |
| Esc | Quits the game immediately |

### Known problems (0.0.1)
- **No fight gets past round 1**: the game softlocks when the first round ends.
- **The game can crash easily.**
- **Several texture errors.**
- The camera angles in the fight look wrong.
- The on-screen joystick does not animate.
- Sindel's hair draws white.
- Some sounds play at the wrong moments.
- Sometimes every opponent in the tower is Jade.
- The tower's descent animation does not display correctly.
- In Arcade the arena is always the same (the original picks it at random).
- The launcher is Windows only (Linux/macOS: build from source with CMake).

If something fails, open an Issue and attach the file from the `logs\` folder next to `umk3-game.exe`.

Work in progress: **0.0.2**.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
