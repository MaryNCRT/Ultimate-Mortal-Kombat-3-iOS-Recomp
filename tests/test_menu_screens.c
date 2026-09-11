/*
 * test_menu_screens.c -- run one front-end screen and report what it did.
 *
 *   gcc -std=c99 -O0 -I runtime -I decomp/lime -o menu_screens \
 *       tests/test_menu_screens.c decomp/gamecode/*.c decomp/lime/*.c \
 *       runtime/gamecode_globals.c runtime/gamecode_stubs.c \
 *       runtime/lime_menu.c runtime/lime_platform.c runtime/lime/*.c -lm
 *   ./menu_screens <res> <index>
 *
 * Boots the front end the way `test_menu_boot.c` does, then puts one task index
 * into `FE_CurrentTask` and ticks `Task_FEMain` sixty times.
 *
 * **One screen per process, on purpose.** A screen that crashes takes the
 * process with it, and running all fifty-one in one run would stop at the first
 * casualty and say nothing about the rest. A shell loop around this finds every
 * one of them in a single pass; `tools/menu_sweep.sh` is that loop.
 *
 * Exit 0 means the sixty frames ran. It does not mean the screen is CORRECT --
 * nothing here looks at pixels. It means the screen did not fault, did not
 * damage the heap, and asked the platform layer for something to draw. A screen
 * that returns 0 sprites is suspicious and is reported as such.
 *
 * `FE_CurrentTask` is written directly rather than pushed. `PushFETaskDeferred`
 * only takes effect at the bottom of a fade, which would need the fade driven
 * first and would test the transition rather than the screen. Setting the index
 * is what `Task_FEMain` itself reads.
 */

#include <stdio.h>
#include <stdlib.h>

void lime_platform_set_asset_root(const char *path);
long lime_platform_sprite_count(void);
long lime_menu_fill_count(void);
long lime_menu_sounds_played(void);
void lime_menu_touch_idle(void);

long lime_heap_check(const char *where);
long lime_heap_live(void);

void Task_LoadGeneralData(void);
int  FEInit_LoadABit(long step);
void Task_FEMain(void);

extern int FE_CurrentTask;
extern int FE_TaskStackPointer;

#define FRAMES 60

int main(int argc, char **argv)
{
    const char *root = (argc > 1) ? argv[1] : ".";
    int   want = (argc > 2) ? atoi(argv[2]) : 0;
    long  step, sprites0, fills0, sounds0;
    int   frame;

    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);

    lime_platform_set_asset_root(root);
    lime_menu_touch_idle();

    Task_LoadGeneralData();
    for (step = 0; step < 200; step++)
        if (FEInit_LoadABit(step))
            break;

    if (lime_heap_check("after load"))
        printf("HEAP DAMAGED BEFORE THE SCREEN RAN\n");

    sprites0 = lime_platform_sprite_count();
    fills0   = lime_menu_fill_count();
    sounds0  = lime_menu_sounds_played();

    /* Everything above this line is the same for every index. Everything that
     * goes wrong below it belongs to the screen being asked about. */
    printf("### screen %d\n", want);
    FE_CurrentTask = want;

    for (frame = 0; frame < FRAMES; frame++)
        Task_FEMain();

    printf("### ok %d  sprites %ld  fills %ld  sounds %ld  task %d  sp %d\n",
           want,
           lime_platform_sprite_count() - sprites0,
           lime_menu_fill_count() - fills0,
           lime_menu_sounds_played() - sounds0,
           FE_CurrentTask,
           FE_TaskStackPointer);

    if (lime_heap_check("at exit"))
        printf("### heap %d DAMAGED\n", want);

    return 0;
}
