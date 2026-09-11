/*
 * fight_select.h -- the debug selector.
 *
 * Our own UI, not an entry in the game's front end -- see fight_select.c for
 * why that distinction matters to this project.
 */
#ifndef UMK3_FIGHT_SELECT_H
#define UMK3_FIGHT_SELECT_H

/* The catalogue. Indices wrap, so a caller can add or subtract freely. */
const char *fs_stage(int i);
const char *fs_music(int i);
const char *fs_char(int i);
int         fs_stage_count(void);
int         fs_char_count(void);

/* Draw the panel over the current frame. `row` is 0 stage, 1 player one,
 * 2 player two. `note` is an error line, or NULL. */
void  fs_draw(int w, int h, int row, int stage, int p1, int p2,
              const char *note);

/* The built-in 5x7 font, in case anything else wants it. */
void  fs_text(float x, float y, float px, const char *s,
              float r, float g, float b);
float fs_text_width(float px, const char *s);

#endif
