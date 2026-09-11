/*
 * fight_stubs.c -- what `runtime/fight_scene.c` does NOT run.
 *
 * The scene calls two functions out of `decomp/gamecode/logic/mk3.c` --
 * `TranslateJoybits` for the input and `gravity_n_bounds` for the physics --
 * but a C translation unit links whole. mk3.c also contains `mk3_init`,
 * `mk3_update` and the rest of the frame, and those reach twenty-eight
 * symbols this scene has no way to provide yet.
 *
 * **So this file is a list of what is missing, written as code.** Each stub is
 * either a function still to be decompiled or storage for a global the fight
 * engine wants. Nothing here is a simplification of something that works: it
 * is the boundary of what has been read, made explicit.
 *
 * ## The functions
 *
 * Every one of these is real code in the binary that nobody has transcribed.
 * `plyrthread` is the important one -- 2,124 bytes, the largest function in
 * the directory, and the reason the scene has its own state machine. The
 * others are the thread loop (`StartThreadAt`, `t_one_on_one`, `t_drone_begin`),
 * the special-move decoder (`seq_lookup`, `Playback_*`, `DoSpecial`) and the
 * switch scanner (`swscan`, `UnstackSwitches`).
 *
 * **If the scene ever calls one, it aborts rather than continuing quietly.**
 * A stub that returns zero and lets the frame carry on would make a missing
 * function look like a working one, which is the single worst failure mode
 * this project has. The scene's own tick calls neither `mk3_init` nor
 * `mk3_update`, so none of these should ever run -- and if one does, that is a
 * bug worth stopping for.
 *
 * ## The globals
 *
 * `Plyr`, `Pp`, `GrObj`, `mytc` and `mo` are the five parallel arrays, thirty
 * entries each, and `runtime/logic_globals.c` allocates them properly. Here
 * they are only pointers the linker needs; the scene owns its fighters
 * directly and never indexes these.
 */

#include <stdio.h>
#include <stdlib.h>

static void missing(const char *who)
{
    fprintf(stderr,
            "\n*** %s is not decompiled and the scene just called it.\n"
            "    This is a bug in the scene, not a missing feature: its tick\n"
            "    calls neither mk3_init nor mk3_update. Stopping rather than\n"
            "    pretending the call worked.\n", who);
    abort();
}

#define STUB(name)      void name(void)          { missing(#name); }
#define STUB_L(name)    long name(void)          { missing(#name); return 0; }

/* still to be decompiled -- joy.c */
STUB_L(plyrthread)
/* other.c, mkdrone.c: the thread loop */
STUB(StartThreadAt)
STUB_L(t_one_on_one)
STUB_L(t_drone_begin)
STUB_L(t_dizzy_dude)
STUB(init_players)
STUB_L(random32)
/* playback.c: the special-move decoder, 7,608 bytes of seq_lookup alone */
STUB_L(seq_lookup)
STUB(Playback_Init)
STUB(Playback_Begin)
STUB(Playback_Update)
STUB(DoSpecial)
/* other.c: the switch scanner and the bars */
STUB(swscan)
STUB(UnstackSwitches)
STUB(RaiseTurboBars)

/* The globals mk3.c names. The scene owns its own fighters and never reads
 * these; they exist so the translation unit links.
 *
 * **Four of them are NOT here**: `G`, `H`, `MKEventQueue` and `RoundParam` are
 * defined by `runtime/gamecode_globals.c`, which the combined build also
 * links. Defining them twice is a link error, and the right owner is the file
 * that transcribes the binary's data section -- not this one, which exists to
 * list what is missing. A standalone fight build gets them from
 * `runtime/logic_globals.c` instead. */
char *Plyr, *Pp, *GrObj, *mo, *Playback;
long  blood[2];
void *TList, *TList_Free;
char  mytc[30 * 268];
void (*mk3_getbbox_cb)(long, int *, int *, int *, int *);

#ifndef UMK3_SHELL
/* Only the standalone fight build owns these; the shell build takes
 * gamecode_globals.c's. */
char *H;
void *MKEventQueue;
long *RoundParam;
#endif
