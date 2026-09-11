/*
 * fight_audio.h -- the fight's sounds.
 *
 * The sound GROUPS are recovered from the binary by `tools/sounds.py` and
 * transcribed in fight_audio.c with their addresses. Which group fires for
 * which event is NOT recovered -- see that file's header.
 *
 * Every call is safe with no audio device: they do nothing.
 */
#ifndef UMK3_FIGHT_AUDIO_H
#define UMK3_FIGHT_AUDIO_H

/* Load the sounds from `<res_dir>/audio` and open the mixer at whatever rate
 * the files actually declare. Returns 0 if the game will run silent. */
int  fa_open(const char *res_dir);
void fa_close(void);

/* Feed the device. Once a frame. */
void fa_update(void);

void fa_swing(int heavy);          /* an attack starts and cuts the air */
void fa_hit(int heavy, int high);  /* and connects */
void fa_block(void);
void fa_step(void);                /* a footfall while walking */
void fa_land(void);                /* feet back on the ground after a jump */
void fa_fall(void);
void fa_voice(void);               /* the character's own group */

/* Stage music, straight from `<res_dir>/audio/<stem>.mp3`. */
void fa_music(const char *res_dir, const char *stem);

#endif
