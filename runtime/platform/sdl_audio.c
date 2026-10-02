/*
 * sdl_audio.c -- the SDL2 half of platform.h's audio.
 *
 * The same mixer as win32_audio.c: a fixed number of one-shot voices of
 * unsigned 8-bit mono, each with its own 16.16 step so a file whose rate is
 * not the device's still plays at the right speed, mixed into 16-bit mono.
 *
 * Output goes through `SDL_QueueAudio`, filled from the game loop by
 * `plat_audio_update` -- no callback, for the reason win32_audio.c gives: the
 * callback runs on SDL's thread and everything it touches would need a lock.
 * The queue is kept a few buffers deep and topped up once a frame.
 *
 * ## Music
 *
 * Silent. The tunes are MP3, SDL2's core has no MP3 decoder, and the Win32
 * backend gets one for free from MCI. Adding SDL_mixer (or a decoder) to play
 * the menu loop is a dependency decision left for later; until then
 * `plat_music_*` are accepted and do nothing.
 *
 * Every entry point is safe without a device, as platform.h requires.
 */

#include "platform.h"

#include <SDL.h>

#include <stdio.h>
#include <string.h>

#define VOICES      16
#define BUF_FRAMES 512          /* 32 ms at 16 kHz */
#define QUEUE_BUFS   3          /* keep this many buffers queued */

typedef struct {
    const unsigned char *pcm;
    int                  frames;
    unsigned             pos;   /* 16.16 */
    unsigned             step;  /* 16.16: src_rate / device_rate */
    float                gain;
    int                  active;
} voice;

static SDL_AudioDeviceID g_dev;
static int               g_open;
static int               g_rate = 16000;
static voice             g_voice[VOICES];

int plat_audio_open(int rate)
{
    SDL_AudioSpec want, have;

    if (g_open)
        return 1;

    g_rate = rate > 0 ? rate : 16000;

    if (!SDL_WasInit(SDL_INIT_AUDIO) && SDL_InitSubSystem(SDL_INIT_AUDIO) != 0) {
        fprintf(stderr, "audio: %s, running silent\n", SDL_GetError());
        return 0;
    }

    memset(&want, 0, sizeof want);
    want.freq     = g_rate;
    want.format   = AUDIO_S16SYS;
    want.channels = 1;
    want.samples  = BUF_FRAMES;
    want.callback = NULL;               /* queued from the game loop */

    g_dev = SDL_OpenAudioDevice(NULL, 0, &want, &have, 0);
    if (g_dev == 0) {
        fprintf(stderr, "audio: no output device (%s), running silent\n", SDL_GetError());
        return 0;
    }

    memset(g_voice, 0, sizeof g_voice);
    SDL_PauseAudioDevice(g_dev, 0);
    g_open = 1;
    return 1;
}

void plat_audio_close(void)
{
    if (!g_open)
        return;
    plat_music_stop();
    SDL_CloseAudioDevice(g_dev);
    g_dev  = 0;
    g_open = 0;
}

int plat_audio_play_at(const unsigned char *pcm, int frames, int rate, float gain)
{
    int i, quietest = -1;
    float lowest = 1e30f;
    unsigned step;

    if (!g_open || pcm == NULL || frames <= 0)
        return 0;

    if (rate <= 0)
        rate = g_rate;
    step = (unsigned)(((double)rate / (double)g_rate) * 65536.0 + 0.5);
    if (step == 0)
        step = 1;

    for (i = 0; i < VOICES; i++) {
        if (!g_voice[i].active)
            break;
        if (g_voice[i].gain < lowest) {
            lowest = g_voice[i].gain;
            quietest = i;
        }
    }
    if (i == VOICES) {
        /* every voice busy: steal the quietest only for a louder newcomer */
        if (quietest < 0 || gain <= lowest)
            return 0;
        i = quietest;
    }

    g_voice[i].pcm    = pcm;
    g_voice[i].frames = frames;
    g_voice[i].pos    = 0;
    g_voice[i].step   = step;
    g_voice[i].gain   = gain;
    g_voice[i].active = 1;
    return 1;
}

int plat_audio_play(const unsigned char *pcm, int frames, float gain)
{
    return plat_audio_play_at(pcm, frames, g_rate, gain);
}

static void fill(short *out)
{
    int i, n;

    memset(out, 0, BUF_FRAMES * sizeof(short));

    for (i = 0; i < VOICES; i++) {
        voice *v = &g_voice[i];

        if (!v->active)
            continue;

        for (n = 0; n < BUF_FRAMES; n++) {
            unsigned idx = v->pos >> 16;
            int s, m;

            if ((int)idx >= v->frames) {
                v->active = 0;
                break;
            }
            s = ((int)v->pcm[idx] - 128) << 8;      /* unsigned 8-bit, 128 silent */
            m = out[n] + (int)((float)s * v->gain);
            if (m >  32767) m =  32767;
            if (m < -32768) m = -32768;
            out[n] = (short)m;

            v->pos += v->step;
        }
        if ((int)(v->pos >> 16) >= v->frames)
            v->active = 0;
    }
}

void plat_audio_update(void)
{
    short buf[BUF_FRAMES];
    int   spun = 0;

    if (!g_open)
        return;

    while (spun < QUEUE_BUFS
           && SDL_GetQueuedAudioSize(g_dev) < (Uint32)(QUEUE_BUFS * BUF_FRAMES * sizeof(short))) {
        fill(buf);
        if (SDL_QueueAudio(g_dev, buf, sizeof buf) != 0)
            break;
        spun++;
    }
}

/* ------------------------------------------------------------------- music */

void plat_music_play(const char *path, int loop) { (void)path; (void)loop; }
void plat_music_stop(void)                       { }
void plat_music_volume(float gain)               { (void)gain; }
