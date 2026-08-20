#ifndef UMK3_CHARACTER_H
#define UMK3_CHARACTER_H

#include <stdbool.h>
#include <stddef.h>

/* Strips .skin, .bones or .skinanim off a path. The three files of a
 * character share a stem, so naming any one of them names the character. */
bool character_stem(const char *path, char *stem, size_t n);

/* The skinned-character viewer. Loads <stem>.bones/.skinanim/.skin, poses and
 * draws. Returns a process exit code. */
int character_main(const char *stem, int argc, char **argv);

#endif
