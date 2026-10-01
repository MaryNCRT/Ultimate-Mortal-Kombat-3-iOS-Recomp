/*
 * fight_render.h -- the stage and the character, for the fight scene.
 *
 * The implementation is `runtime/demo.c`'s rendering half, moved into
 * `runtime/fight_render.c`. See that file's header for what is shared and why
 * the duplication is there.
 *
 * Nothing here loads an asset the caller did not name: every path is built
 * under the `res_dir` the caller passes, which is the user's own extracted
 * `UMK3.app/res`. This repository ships no game data.
 */
#ifndef UMK3_FIGHT_RENDER_H
#define UMK3_FIGHT_RENDER_H

/* Load a stage by file stem, e.g. "GRAVEYARD_LEVEL_SCENE". Returns 0 on
 * failure, having said on stdout which file it could not read. */
int   fr_stage_load(const char *res_dir, const char *name);

/* Draw it. `frame` picks the scene-graph keyframe; 0 is the resting pose. */
void  fr_stage_draw(int frame);

/* How far the stage reaches, in world units, measured at load. The far plane
 * has to come from this and not from the fighter: Graveyard's moon is 27,483
 * units away and a frustum sized to a character simply does not contain it. */
float fr_stage_reach(void);

/* Load a character by file stem, e.g. "SUBZERO_STANDARD" -- its .bones, .skin,
 * .skinanim and the body texture named by mesh 0 of its .meshset. */
int   fr_char_load(const char *res_dir, const char *name);

/* How many animation frames that character has. */
int   fr_char_frames(void);

/* Pose the skeleton between two frames and skin it. The result lives in shared
 * buffers, so the matching `fr_char_draw` must follow before the next pose --
 * which is how two fighters share one set of buffers. */
void  fr_char_pose(int fa, int fb, float frac);

/* Draw the last pose at a place, turned `yaw` degrees about Y. `shadow` draws
 * the flattened black pass instead of the body.
 *
 * The yaw is a number rather than a facing flag because the model's authored
 * direction is not known a priori and has to be measured. It is 0: these models
 * are sculpted three-quarters on.
 *
 * `mirror` flips the model across X, which is how the fighter on the other side
 * is drawn -- the same pose reflected, exactly as a 2D fighter flips a sprite,
 * and never a 180-degree turn. A turn shows his back; the game never does. */
void  fr_char_draw(float x, float y, float z, float yaw, int mirror, int shadow);

/* The built pose's extent in scene units: the fight scene derives the
 * engine-to-scene scale from the height, and the feet from lo[1]. */
void  fr_char_extent(float *lo, float *hi);

/* Release a stage or a character so another can be loaded in its place.
 * Needed by the debug selector; demo.c never switched. */
void  fr_stage_free(void);
void  fr_char_free(void);

void  fr_perspective(float fovy, float aspect, float zn, float zf);
float fr_fov(void);
float fr_player_scale(void);

/* One frame of the framebuffer to a PPM. See fight_render.c. */
void fr_screenshot(const char *path, int w, int h);

#endif
