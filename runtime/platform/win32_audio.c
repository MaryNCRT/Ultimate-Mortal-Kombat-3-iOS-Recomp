/*
 * win32_audio.c -- the Win32 half of platform.h's audio.
 *
 * `waveOut` and nothing else: no XAudio2, no DirectSound, no dependency that
 * has to be installed. The same reasoning as `win32_gl.c` -- the port should
 * build with the toolchain that is already here.
 *
 * ## How it works
 *
 * One output stream at the assets' own rate, and a ring of small buffers that
 * are refilled and re-queued as the device finishes them. `plat_audio_update`
 * does that refill, once a frame, mixing whatever voices are active into 16-bit
 * mono.
 *
 * There is no callback. A `waveOut` callback runs on the driver's thread and
 * everything it touches needs a lock; refilling from the game loop instead
 * costs one buffer of latency -- about 32 ms here -- and removes the entire
 * question. For sounds triggered by a 60 Hz simulation that is the right
 * trade.
 *
 * ## The sources
 *
 * The game's .wav files are **unsigned 8-bit mono PCM at 16 kHz**, which is
 * what the RIFF header says: `fmt` tag 1, one channel, 0x3e80 samples per
 * second, 8 bits. So a source sample is 0..255 with 128 as silence, and the
 * mix is `(s - 128) << 8` scaled by the voice's gain.
 *
 * ## When the device is missing
 *
 * Every entry point checks `g_open` and returns quietly. A machine with no
 * sound card, or one where `waveOutOpen` fails because something else holds
 * the device exclusively, still runs the game in silence -- it does not crash
 * and it does not print an error every frame.
 */

#include "platform.h"

#include <windows.h>
#include <mmsystem.h>

#include <stdio.h>
#include <string.h>

#define VOICES      16          /* one-shot sounds at once */
#define BUFFERS      4          /* ring depth */
#define BUF_FRAMES 512          /* 32 ms at 16 kHz */

typedef struct {
    const unsigned char *pcm;   /* caller-owned, unsigned 8-bit mono */
    int                  frames;
    int                  pos;
    float                gain;
    int                  active;
} voice;

static HWAVEOUT g_dev;
static int      g_open;
static int      g_rate = 16000;
static voice    g_voice[VOICES];
static WAVEHDR  g_hdr[BUFFERS];
static short    g_buf[BUFFERS][BUF_FRAMES];
static int      g_next;         /* the buffer to refill next */
static int      g_music;

int plat_audio_open(int rate)
{
    WAVEFORMATEX wf;
    int i;

    if (g_open)
        return 1;

    g_rate = rate > 0 ? rate : 16000;

    memset(&wf, 0, sizeof wf);
    wf.wFormatTag      = WAVE_FORMAT_PCM;
    wf.nChannels       = 1;
    wf.nSamplesPerSec  = (DWORD)g_rate;
    wf.wBitsPerSample  = 16;
    wf.nBlockAlign     = (WORD)(wf.nChannels * wf.wBitsPerSample / 8);
    wf.nAvgBytesPerSec = wf.nSamplesPerSec * wf.nBlockAlign;

    if (waveOutOpen(&g_dev, WAVE_MAPPER, &wf, 0, 0, CALLBACK_NULL) != MMSYSERR_NOERROR) {
        /* Said once, not once a frame. Silence is a working state. */
        fprintf(stderr, "audio: no output device, running silent\n");
        g_dev = NULL;
        return 0;
    }

    memset(g_hdr, 0, sizeof g_hdr);
    memset(g_buf, 0, sizeof g_buf);
    for (i = 0; i < BUFFERS; i++) {
        g_hdr[i].lpData         = (LPSTR)g_buf[i];
        g_hdr[i].dwBufferLength = (DWORD)(BUF_FRAMES * sizeof(short));
        waveOutPrepareHeader(g_dev, &g_hdr[i], sizeof g_hdr[i]);
        /* Mark them done so the first update fills every one. */
        g_hdr[i].dwFlags |= WHDR_DONE;
    }

    memset(g_voice, 0, sizeof g_voice);
    g_next = 0;
    g_open = 1;
    return 1;
}

void plat_audio_close(void)
{
    int i;

    if (!g_open)
        return;
    plat_music_stop();
    waveOutReset(g_dev);
    for (i = 0; i < BUFFERS; i++)
        waveOutUnprepareHeader(g_dev, &g_hdr[i], sizeof g_hdr[i]);
    waveOutClose(g_dev);
    g_dev  = NULL;
    g_open = 0;
}

int plat_audio_play(const unsigned char *pcm, int frames, float gain)
{
    int i, quietest = -1;
    float lowest = 1e30f;

    if (!g_open || pcm == NULL || frames <= 0)
        return 0;

    for (i = 0; i < VOICES; i++) {
        if (!g_voice[i].active) {
            g_voice[i].pcm    = pcm;
            g_voice[i].frames = frames;
            g_voice[i].pos    = 0;
            g_voice[i].gain   = gain;
            g_voice[i].active = 1;
            return 1;
        }
        if (g_voice[i].gain < lowest) {
            lowest = g_voice[i].gain;
            quietest = i;
        }
    }

    /* Every voice busy. Steal the quietest only if the newcomer is louder --
     * so a burst of hits never silences the one the player is listening for,
     * and a background footstep never evicts a punch. */
    if (quietest >= 0 && gain > lowest) {
        g_voice[quietest].pcm    = pcm;
        g_voice[quietest].frames = frames;
        g_voice[quietest].pos    = 0;
        g_voice[quietest].gain   = gain;
        g_voice[quietest].active = 1;
        return 1;
    }
    return 0;
}

static void fill(short *out)
{
    int i, n;

    memset(out, 0, BUF_FRAMES * sizeof(short));

    for (i = 0; i < VOICES; i++) {
        voice *v = &g_voice[i];
        int    left, take;

        if (!v->active)
            continue;

        left = v->frames - v->pos;
        take = left < BUF_FRAMES ? left : BUF_FRAMES;

        for (n = 0; n < take; n++) {
            /* unsigned 8-bit, 128 is silence */
            int s = ((int)v->pcm[v->pos + n] - 128) << 8;
            int m = out[n] + (int)((float)s * v->gain);
            if (m >  32767) m =  32767;
            if (m < -32768) m = -32768;
            out[n] = (short)m;
        }

        v->pos += take;
        if (v->pos >= v->frames)
            v->active = 0;
    }
}

void plat_audio_update(void)
{
    int spun = 0;

    if (!g_open)
        return;

    /* Refill and re-queue every buffer the device has finished with. The cap
     * stops a long stall from queueing the whole ring at once and then
     * starving. */
    while (spun < BUFFERS) {
        WAVEHDR *h = &g_hdr[g_next];

        if (!(h->dwFlags & WHDR_DONE))
            break;

        fill((short *)h->lpData);
        h->dwFlags &= ~WHDR_DONE;
        if (waveOutWrite(g_dev, h, sizeof *h) != MMSYSERR_NOERROR) {
            h->dwFlags |= WHDR_DONE;
            break;
        }
        g_next = (g_next + 1) % BUFFERS;
        spun++;
    }
}

/* ------------------------------------------------------------------- music
 *
 * Through MCI, which decodes MP3 itself. The alternative is an MP3 decoder in
 * this repository to play a stage loop, which would be a great deal of code
 * for no recovered knowledge.
 */
void plat_music_play(const char *path, int loop)
{
    char cmd[1024];

    plat_music_stop();

    _snprintf(cmd, sizeof cmd, "open \"%s\" type mpegvideo alias umk3bgm", path);
    cmd[sizeof cmd - 1] = 0;
    if (mciSendStringA(cmd, NULL, 0, NULL) != 0)
        return;                         /* no decoder, or no such file */

    g_music = 1;
    mciSendStringA(loop ? "play umk3bgm repeat" : "play umk3bgm", NULL, 0, NULL);
}

void plat_music_stop(void)
{
    if (!g_music)
        return;
    mciSendStringA("stop umk3bgm", NULL, 0, NULL);
    mciSendStringA("close umk3bgm", NULL, 0, NULL);
    g_music = 0;
}
