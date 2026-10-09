## Ultimate Mortal Kombat 3 — PC port 0.0.1 alpha (Windows)

First public build. **No game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone**.

### Cómo jugar
1. Descarga y descomprime `UMK3-PC-0.0.1-alpha.zip`.
2. Abre `UMK3-Launcher.exe` → **Buscar...** → elige tu `.ipa` → **Compilar**.
   La primera vez descarga el compilador (llvm-mingw 20260616, ~190 MB, SHA-256 comprobado) y Python 3.12.10; luego verifica tu binario, extrae las tablas, compila `umk3-game.exe` y copia `res\` desde tu `.ipa` (menos de un minuto).
3. Elige **resolución 3D**, **pantalla completa** e **idioma** (se guardan solos en `umk3.ini`) y pulsa **JUGAR**. El botón arriba a la derecha cambia el launcher entre español e inglés.

Requisitos: Windows 10/11 64 bits, internet la primera vez, ~1,5 GB libres. El `.ipa` de iPad 1.2.56 no sirve.

Controles: ratón = dedo (menús y controles táctiles); jugador 1: W A S D o flechas, golpes U I O J K L.

### Errores conocidos (0.0.1)
- Los ángulos de cámara en la pelea se ven mal.
- El joystick en pantalla no se anima.
- El pelo de Sindel sale blanco.
- Algunos sonidos suenan en momentos equivocados.
- A veces todos los rivales de la torre son Jade.
- La animación de bajada de la torre no se muestra bien.
- En Arcade el escenario es siempre el mismo (el original lo elige al azar).
- Launcher solo para Windows (Linux/macOS: compilar desde el código con CMake).

Si algo falla, abre un Issue con el archivo de `logs\` que está junto a `umk3-game.exe`.

Trabajo en curso: **0.0.2**.

*Ultimate Mortal Kombat 3 is © Electronic Arts / Midway / Warner Bros. This project is not affiliated with them; use only a copy you own.*
