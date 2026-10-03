/*
 * test_menu_boot.c -- boot the decompiled front end with no window.
 *
 * Compile this file with all C sources in decomp/gamecode/, decomp/lime/,
 * runtime/lime/, plus runtime/gamecode_globals.c, runtime/gamecode_stubs.c,
 * runtime/lime_menu.c, and runtime/lime_platform.c.
 *   ./menu_boot <path to the extracted UMK3.app/res>
 *
 * Exit 0 means the whole boot ran: general data, both publisher splash
 * screens, the incremental front-end loader, and sixty ticks of the main menu.
 * The counts are what the transcribed screens ASKED to draw.
 *
 * Runs the boot sequence in the task dispatcher -- splash, front-end init,
 * then the front-end task function for a fixed number of frames.
 * Nothing draws: the platform layer counts sprites, fills and fonts instead, so
 * this reports what the menus *asked* for. That is the part that tests the
 * transcription; a window would only test the GL code.
 *
 * Between loader steps it checks the guarded heap. An overrun reported at the
 * step that caused it, with the tag of the allocation it ran past, is worth far
 * more than the SIGTRAP Windows raises several allocations later.
 */

#include <stdio.h>

void lime_platform_set_asset_root(const char *path);
long lime_platform_sprite_count(void);
long lime_menu_fill_count(void);
long lime_menu_sounds_played(void);
int  lime_menu_in_2d(void);
void lime_menu_touch_idle(void);

long lime_heap_check(const char *where);
long lime_heap_live(void);

void Task_LoadGeneralData(void);
void Task_LoadSplashScreen(void);
void Task_FEInit(void);
void Task_FEMain(void);

extern int FE_CurrentTask;
extern int FE_TaskStackPointer;
extern int CurrentTask;
extern long SplashCount;

int main(int argc, char **argv)
{
    const char *root = (argc > 1) ? argv[1] : ".";
    long frame;
    long sprites0, fills0;
    char where[64];

    setvbuf(stdout, NULL, _IONBF, 0);   /* so a crash keeps what came before */
    setvbuf(stderr, NULL, _IONBF, 0);   /* the heap reports come out here */

    lime_platform_set_asset_root(root);
    lime_menu_touch_idle();

    /* The boot sequence runs this before the front end: it builds the fonts,
     * loads the sound handles, and reads the language text table that every
     * menu caption comes from. Without it DrawMainMenu asks GameText for
     * string 4 and reads through a table nothing filled. */
    printf("== general data ==\n");
    Task_LoadGeneralData();
    printf("   loaded, %ld allocations live\n", lime_heap_live());

    printf("== publisher splash sequence ==\n");
    sprites0 = lime_platform_sprite_count();
    for (frame = 0; CurrentTask == 8 && frame < 500; frame++) {
        Task_LoadSplashScreen();
        if (frame % 30 == 29) {
            sprintf(where, "splash frame %ld", frame);
            if (lime_heap_check(where))
                printf("   ^^ damaged during %s\n", where);
        }
    }
    if (CurrentTask != 1 || SplashCount != 492 ||
        lime_platform_sprite_count() - sprites0 != 479) {
        printf("   FAIL: CurrentTask=%d SplashCount=%ld sprites=%ld\n",
               CurrentTask, SplashCount,
               lime_platform_sprite_count() - sprites0);
        return 1;
    }
    printf("   %ld frames, 479 sprite draws, CurrentTask=%d\n",
           frame, CurrentTask);

    printf("== incremental front-end loader ==\n");
    for (frame = 0; CurrentTask != 3 && frame < 100; frame++) {
        Task_FEInit();
        if (frame % 10 == 9) {
            sprintf(where, "FE init frame %ld", frame);
            if (lime_heap_check(where))
                printf("   ^^ damaged during %s\n", where);
        }
    }
    if (CurrentTask != 3) {
        printf("   FAIL: loader did not hand off (CurrentTask=%d)\n",
               CurrentTask);
        return 1;
    }
    printf("   live allocations   %ld\n", lime_heap_live());

    printf("== after load ==\n");
    printf("   FE_CurrentTask      %d\n", FE_CurrentTask);
    printf("   FE_TaskStackPointer %d\n", FE_TaskStackPointer);
    printf("   sprites requested   %ld\n", lime_platform_sprite_count());

    sprites0 = lime_platform_sprite_count();
    fills0   = lime_menu_fill_count();

    printf("== ticking Task_FEMain x60 ==\n");
    for (frame = 0; frame < 60; frame++)
        Task_FEMain();

    printf("   sprites this second %ld\n",
           lime_platform_sprite_count() - sprites0);
    printf("   fills this second   %ld\n", lime_menu_fill_count() - fills0);
    printf("   sounds played       %ld\n", lime_menu_sounds_played());
    printf("   2D mode             %d\n", lime_menu_in_2d());
    printf("   FE_CurrentTask      %d\n", FE_CurrentTask);
    lime_heap_check("at exit");
    return 0;
}
