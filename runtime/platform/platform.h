/*
 * The platform layer's entire interface.
 *
 * Everything iOS-specific in the original lives behind this. The point of
 * keeping it this small is that porting to another OS means writing one file,
 * not auditing the engine.
 *
 * Backends:
 *   win32_gl.c   Win32 + WGL. No dependencies, builds with the toolchain that
 *                is already here. This is what the vertical slice uses.
 *   sdl_gl.c     SDL2. The portable path, and the reason the interface is
 *                shaped this way rather than exposing HWND. Default off
 *                Windows; -DUMK3_BACKEND=sdl2 selects it on Windows too.
 */
#ifndef LIME_PLATFORM_H
#define LIME_PLATFORM_H

#include <stdbool.h>

/* Open a window with a GL context current on it. Returns false on failure. */
bool plat_open(const char *title, int width, int height);

/* Pump the OS event queue. Returns false once the user has asked to quit. */
bool plat_poll(void);

/* Present the back buffer. */
bool plat_swap(void);

void plat_close(void);

/* Current drawable size in pixels -- not the same as the requested size once
 * the user resizes or the OS applies scaling. */
void plat_size(int *width, int *height);

/* Pointer position in client pixels, and whether a button is down. The engine
 * has no mouse -- it reads a touch position -- so the caller maps one onto the
 * other. */
int plat_mouse(int *x, int *y);

/* Seconds since plat_open, monotonic. */
double plat_time(void);

/* ------------------------------------------------------------------ input
 *
 * The fight engine takes ONE TEN-BIT WORD PER PLAYER and nothing else -- see
 * "THE INPUT CONTRACT" at the top of decomp/gamecode/logic/joy.c, where the
 * six buttons are named from three independent measurements. These two calls
 * are how a keyboard and a gamepad produce that word.
 *
 * `plat_key` takes a platform-independent code from the list below. The engine
 * never sees these; the caller maps them onto the ten bits.
 */
enum {
    PK_UP, PK_DOWN, PK_LEFT, PK_RIGHT,
    PK_HP, PK_LP, PK_BL, PK_HK, PK_LK, PK_RUN,
    PK_P2_UP, PK_P2_DOWN, PK_P2_LEFT, PK_P2_RIGHT,
    PK_P2_HP, PK_P2_LP, PK_P2_BL, PK_P2_HK, PK_P2_LK, PK_P2_RUN,
    PK_RESET,
    /* the debug selector's own keys, kept apart from the fight's */
    PK_MENU, PK_OK, PK_NEXT, PK_PREV, PK_BACK, PK_TEST,
    PK_COUNT
};

/* Is that key down right now? */
int plat_key(int code);

/* The first attached gamepad, as the same ten bits the engine wants, or -1
 * when there is none. Bit order is the engine's: 0..3 directions, then HP, LP,
 * BL, HK, LK, RUN. */
int plat_pad(int which);


/* ------------------------------------------------------------------ audio
 *
 * The game's sounds are plain RIFF/WAVE: PCM, mono, 8-bit unsigned, 16 kHz.
 * 497 of them sit in `res/audio`, and which ones belong together is the sound
 * group table `tools/sounds.py` recovers from the binary.
 *
 * The mixer is deliberately small: one output stream, a fixed number of
 * one-shot voices, no streaming and no 3D. A fighting game plays short
 * overlapping samples and nothing else, and anything more would be a
 * capability this port has no use for yet.
 *
 * Every call is safe to make when the audio device failed to open -- it
 * silently does nothing. A machine with no sound card still plays the game.
 */

/* Open the mixer at the sample rate the assets use. */
int  plat_audio_open(int rate);
void plat_audio_close(void);

/* Start one sound. `pcm` is unsigned 8-bit mono at the rate `plat_audio_open`
 * was given, and the CALLER OWNS IT -- it must stay alive until the sound has
 * finished, which for a loaded .wav held for the life of the program it does.
 *
 * Returns 0 when every voice is busy. That is not an error: dropping the
 * quietest new sound is what a fixed voice count means, and the engine's own
 * event queue drops its eleventh event the same way. */
int  plat_audio_play(const unsigned char *pcm, int frames, float gain);

/* The same, for a source whose rate is NOT the device's. The game's assets are
 * not uniform -- 496 of its 497 .wav files are 16 kHz and one is 44,100 -- so
 * a caller that loaded a file should pass what the file actually said rather
 * than assume. */
int  plat_audio_play_at(const unsigned char *pcm, int frames, int rate,
                        float gain);

/* Feed the device. Call once a frame. */
void plat_audio_update(void);

/* Background music, straight from a file. MP3 in this game's case, which is
 * why it goes to the OS rather than through the mixer above: writing an MP3
 * decoder to play a menu loop would be absurd. */
void plat_music_play(const char *path, int loop);
void plat_music_stop(void);

#endif
