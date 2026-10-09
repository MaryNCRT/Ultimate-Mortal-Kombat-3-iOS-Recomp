## Ultimate Mortal Kombat 3 — PC port 0.0.1 alpha (Windows)

First public build. **No game data and no game executable are included**: you compile the game from **your own** `.ipa` of UMK3 **1.2.59 for iPhone**.

### Cómo jugar
1. Descarga y descomprime `UMK3-PC-0.0.1-alpha.zip`.
2. Abre `UMK3-Launcher.exe` → **Buscar...** → elige tu `.ipa` → **Compilar**.
   La primera vez descarga el compilador (llvm-mingw 20260616, ~190 MB, SHA-256 comprobado) y Python 3.12.10; luego verifica tu binario, extrae las tablas, compila `umk3-game.exe` y copia `res\` desde tu `.ipa` (menos de un minuto).
3. Elige **resolución 3D**, **pantalla completa** e **idioma** (se guardan solos en `umk3.ini`) y pulsa **JUGAR**. El botón arriba a la derecha cambia el launcher entre español e inglés.

Requisitos: Windows 10/11 64 bits, internet la primera vez, ~1,5 GB libres. El `.ipa` de iPad 1.2.56 no sirve.

### Controles
Ratón = dedo (menús y controles táctiles en pantalla). En la pelea:

| Tecla | Acción |
|---|---|
| W / ↑ | Saltar |
| S / ↓ | Agacharse |
| A / ← | Izquierda |
| D / → | Derecha |
| Dos direcciones a la vez | Diagonal (p. ej. W+D salta hacia delante) |
| U (num. 7) | Puñetazo alto (HP) |
| I (num. 8) | Puñetazo bajo (LP) |
| O (num. 9) | Bloqueo (BL) |
| J (num. 4) | Patada alta (HK) |
| K (num. 5) | Patada baja (LK) |
| L (num. 6) | Correr (RUN) |
| Esc | Cierra el juego al instante |

### Errores conocidos (0.0.1)
- **Ninguna pelea pasa del round 1**: el juego se queda bloqueado (softlock) al terminar el primer round.
- **El juego puede crashear con facilidad.**
- **Varios errores de texturas.**
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
