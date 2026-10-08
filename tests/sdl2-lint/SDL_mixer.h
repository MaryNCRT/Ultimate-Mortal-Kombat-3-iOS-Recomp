/*
 * SDL_mixer.h -- a LINT FIXTURE, not SDL2_mixer. Never in the build path.
 *
 * `runtime/platform/sdl_audio.c` plays effects and MP3 music through
 * SDL2_mixer, so linting it against tests/sdl2-lint/SDL.h needs this too.
 * Everything SDL.h's header comment says applies here: the declarations are
 * written from the documented SDL2_mixer 2.x API, which makes them a claim,
 * not a reading of an installed header. Install SDL2_mixer and it stops
 * mattering.
 */
#ifndef UMK3_SDL2_MIXER_LINT_FIXTURE_H
#define UMK3_SDL2_MIXER_LINT_FIXTURE_H

#include "SDL.h"

typedef enum {
    MIX_INIT_FLAC = 0x00000001,
    MIX_INIT_MOD  = 0x00000002,
    MIX_INIT_MP3  = 0x00000008,
    MIX_INIT_OGG  = 0x00000010,
    MIX_INIT_MID  = 0x00000020,
    MIX_INIT_OPUS = 0x00000040
} MIX_InitFlags;

typedef struct Mix_Chunk {
    int    allocated;
    Uint8 *abuf;
    Uint32 alen;
    Uint8  volume;
} Mix_Chunk;

typedef struct _Mix_Music Mix_Music;

#define MIX_MAX_VOLUME 128
#define Mix_GetError   SDL_GetError

int  Mix_Init(int flags);
void Mix_Quit(void);
int  Mix_OpenAudio(int frequency, Uint16 format, int channels, int chunksize);
void Mix_CloseAudio(void);
int  Mix_AllocateChannels(int numchans);

Mix_Chunk *Mix_QuickLoad_RAW(Uint8 *mem, Uint32 len);
void       Mix_FreeChunk(Mix_Chunk *chunk);
int        Mix_Volume(int channel, int volume);
int        Mix_PlayChannel(int channel, Mix_Chunk *chunk, int loops);
int        Mix_HaltChannel(int channel);
int        Mix_Playing(int channel);

Mix_Music *Mix_LoadMUS(const char *file);
void       Mix_FreeMusic(Mix_Music *music);
int        Mix_PlayMusic(Mix_Music *music, int loops);
int        Mix_HaltMusic(void);
int        Mix_VolumeMusic(int volume);

#endif /* UMK3_SDL2_MIXER_LINT_FIXTURE_H */
