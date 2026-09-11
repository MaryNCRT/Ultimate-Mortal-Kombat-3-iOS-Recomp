/*
 * fight_audio.c -- the fight's sounds, from the engine's own sound groups.
 *
 * ## Where the groups come from
 *
 * Not from a list someone assembled by ear. `tools/sounds.py` recovers them
 * from the binary: the .wav names are stored inline in `__cstring` as a run of
 * NUL-terminated strings with a literal `end_of_list` ending each group, and
 * `group_sound`, `ochar_sound`, `tsound_func` and `rsnd_func` all take a group
 * number and play one of its members.
 *
 * The reading is checked against something it cannot control -- **401 of the
 * 402 names are real files in `res/audio`** -- and the groups below are
 * transcribed from that tool's output with their addresses, so they can be
 * re-derived rather than trusted.
 *
 * This is the first of the 229 data tables `docs/PROGRESS.md` records as
 * uncounted.
 *
 * ## What is still a choice
 *
 * **Which group goes with which move.** That mapping lives in the per-move
 * code -- every `ochar_sound(obj)` call site passes an index in `obj->field24`
 * -- and those call sites are spread through files that are not decompiled. So
 * the group CONTENTS are the game's and the ASSIGNMENT is mine, and the two
 * are kept visibly apart below.
 *
 * The group numbering is relative to the start of the run. `group_sound` is
 * not decompiled, so where the engine starts counting is unknown; the
 * addresses are the thing to trust.
 *
 * ## No asset ships here
 *
 * Every file is loaded at run time from the `res/audio` the caller names,
 * which is the user's own extracted copy.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform/platform.h"
#include "fight_audio.h"

#define MAX_SOUNDS 64

typedef struct {
    char           name[32];
    unsigned char *pcm;         /* unsigned 8-bit mono */
    int            frames;
    int            rate;
} sound;

static sound g_snd[MAX_SOUNDS];
static int   g_count;
static int   g_ready;

/* ===================================================== the recovered groups
 *
 * Transcribed from `python tools/sounds.py <res/audio>`, with the address each
 * group starts at so it can be checked against the binary.
 */
static const char *const GRP_FOOT[]   = { "Foot1", "Foot2", "Foot3", "Foot4", 0 };   /* @0017a070 */
static const char *const GRP_BLOCK[]  = { "Block1", 0 };                             /* @0017a0c4 */
static const char *const GRP_FACE[]   = { "Face2", 0 };                              /* @0017a12c */
static const char *const GRP_BIG3[]   = { "Bighit3", 0 };                            /* @0017a160 */
static const char *const GRP_BIG12[]  = { "Bighit1", "Bighit2", 0 };                 /* @0017a1e0 */
static const char *const GRP_BODY[]   = { "Body1", "Body2", 0 };                     /* @0017a278 */
static const char *const GRP_WHOOSH[] = { "Whoosh1", "Whoosh2", "Whoosh3",
                                          "Bwhoosh2", 0 };                           /* @0017a310 */
static const char *const GRP_BWHOOSH[]= { "Bwhoosh1", "Bwhoosh3", 0 };               /* @0017a368 */
static const char *const GRP_FALL[]   = { "Gudfall1", "Gudfall2", "Gudfall3",
                                          "Gudfall4", 0 };                           /* @0017a2ac */
/* Scorpion's own group, @0017b028. The first two are the voice lines -- the
 * names say which: "Scorcome" and "Scorget" are "come here" and "get over
 * here". */
static const char *const GRP_SCORP[]  = { "Scorcome", "Scorget", "Scormask",
                                          "Scortele", 0 };

/* ------------------------------------------------------------ the wav loader
 *
 * RIFF/WAVE, and only the shape the game actually uses: PCM, one channel,
 * 8 bits. Anything else is refused by name rather than mis-decoded -- a
 * 16-bit file read as 8-bit is not a quiet bug, it is a scream.
 */
static int wav_load(const char *path, sound *out)
{
    unsigned char hdr[64];
    FILE *f = fopen(path, "rb");
    long  size;
    unsigned char *d;
    int   fmt_ch, fmt_bits, fmt_rate;
    long  pos, data_off = 0, data_len = 0;

    if (!f)
        return 0;

    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (size < 44) { fclose(f); return 0; }

    d = (unsigned char *)malloc((size_t)size);
    if (!d) { fclose(f); return 0; }
    if (fread(d, 1, (size_t)size, f) != (size_t)size) {
        fclose(f); free(d); return 0;
    }
    fclose(f);
    (void)hdr;

    if (memcmp(d, "RIFF", 4) || memcmp(d + 8, "WAVE", 4)) {
        fprintf(stderr, "audio: %s is not RIFF/WAVE\n", path);
        free(d); return 0;
    }

    fmt_ch = fmt_bits = fmt_rate = 0;
    pos = 12;
    while (pos + 8 <= size) {
        long clen = (long)d[pos+4] | ((long)d[pos+5] << 8)
                  | ((long)d[pos+6] << 16) | ((long)d[pos+7] << 24);
        if (!memcmp(d + pos, "fmt ", 4) && clen >= 16) {
            int tag  = d[pos+8]  | (d[pos+9]  << 8);
            fmt_ch   = d[pos+10] | (d[pos+11] << 8);
            fmt_rate = (int)(d[pos+12] | (d[pos+13] << 8)
                             | (d[pos+14] << 16) | ((long)d[pos+15] << 24));
            fmt_bits = d[pos+22] | (d[pos+23] << 8);
            if (tag != 1) {
                fprintf(stderr, "audio: %s is compressed (tag %d)\n", path, tag);
                free(d); return 0;
            }
        } else if (!memcmp(d + pos, "data", 4)) {
            data_off = pos + 8;
            data_len = clen;
            if (data_off + data_len > size)
                data_len = size - data_off;
        }
        pos += 8 + clen + (clen & 1);
    }

    if (!data_len || fmt_ch != 1 || fmt_bits != 8) {
        fprintf(stderr, "audio: %s is %d ch %d bit -- expected mono 8\n",
                path, fmt_ch, fmt_bits);
        free(d); return 0;
    }

    out->pcm    = (unsigned char *)malloc((size_t)data_len);
    if (!out->pcm) { free(d); return 0; }
    memcpy(out->pcm, d + data_off, (size_t)data_len);
    out->frames = (int)data_len;
    out->rate   = fmt_rate;
    free(d);
    return 1;
}

static int find_or_load(const char *res_audio, const char *name)
{
    char path[1024];
    int  i;

    for (i = 0; i < g_count; i++)
        if (!strcmp(g_snd[i].name, name))
            return i;

    if (g_count >= MAX_SOUNDS)
        return -1;

    _snprintf(path, sizeof path, "%s/%s.wav", res_audio, name);
    path[sizeof path - 1] = 0;

    if (!wav_load(path, &g_snd[g_count]))
        return -1;

    _snprintf(g_snd[g_count].name, sizeof g_snd[g_count].name, "%s", name);
    g_snd[g_count].name[sizeof g_snd[g_count].name - 1] = 0;
    return g_count++;
}

static void load_group(const char *res_audio, const char *const *g)
{
    int i;
    for (i = 0; g[i]; i++)
        find_or_load(res_audio, g[i]);
}

int fa_open(const char *res_dir)
{
    char audio[1024];
    int  rate;

    _snprintf(audio, sizeof audio, "%s/audio", res_dir);
    audio[sizeof audio - 1] = 0;

    load_group(audio, GRP_FOOT);
    load_group(audio, GRP_BLOCK);
    load_group(audio, GRP_FACE);
    load_group(audio, GRP_BIG3);
    load_group(audio, GRP_BIG12);
    load_group(audio, GRP_BODY);
    load_group(audio, GRP_WHOOSH);
    load_group(audio, GRP_BWHOOSH);
    load_group(audio, GRP_FALL);
    load_group(audio, GRP_SCORP);

    if (g_count == 0) {
        fprintf(stderr, "audio: nothing loaded from %s, running silent\n", audio);
        return 0;
    }

    /* Every one of these files is 16 kHz; the mixer is opened at whatever the
     * first one actually says rather than at a constant, so a set that turns
     * out to differ is heard rather than silently resampled wrong. */
    rate = g_snd[0].rate;
    g_ready = plat_audio_open(rate);

    printf("  audio: %d sounds at %d Hz%s\n", g_count, rate,
           g_ready ? "" : "  (no device -- silent)");
    return g_ready;
}

/* Pick one member of a group at random, which is what `group_sound` does --
 * it is why a group holds several takes of the same impact. */
static void play_group(const char *const *g, float gain)
{
    const char *pick;
    int n = 0, i;

    if (!g_ready)
        return;

    while (g[n])
        n++;
    if (n == 0)
        return;
    pick = g[rand() % n];

    for (i = 0; i < g_count; i++)
        if (!strcmp(g_snd[i].name, pick)) {
            plat_audio_play(g_snd[i].pcm, g_snd[i].frames, gain);
            return;
        }
}

/* ============================================ the assignment -- CHOSEN, not read
 *
 * Which group fires for which event. The groups above are the game's; this is
 * not. When the `ochar_sound` call sites are decompiled, every one of these
 * becomes a measured index and this block goes away.
 */
void fa_swing(int heavy)
{
    play_group(heavy ? GRP_BWHOOSH : GRP_WHOOSH, 0.55f);
}

void fa_hit(int heavy, int high)
{
    if (heavy)
        play_group(GRP_BIG12, 0.95f);
    else
        play_group(high ? GRP_FACE : GRP_BODY, 0.85f);
}

void fa_block(void)
{
    play_group(GRP_BLOCK, 0.7f);
}

void fa_step(void)
{
    play_group(GRP_FOOT, 0.30f);
}

void fa_land(void)
{
    play_group(GRP_FOOT, 0.55f);
}

void fa_fall(void)
{
    play_group(GRP_FALL, 0.8f);
}

void fa_voice(void)
{
    play_group(GRP_SCORP, 1.0f);
}

void fa_music(const char *res_dir, const char *stem)
{
    char path[1024];

    _snprintf(path, sizeof path, "%s/audio/%s.mp3", res_dir, stem);
    path[sizeof path - 1] = 0;
    plat_music_play(path, 1);
}

void fa_update(void)
{
    plat_audio_update();
}

void fa_close(void)
{
    int i;
    plat_audio_close();
    for (i = 0; i < g_count; i++)
        free(g_snd[i].pcm);
    g_count = 0;
    g_ready = 0;
}
