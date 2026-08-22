/*
 * test_gamecode3_diff.c — thirteen more gamecode functions against the oracle.
 *
 * Three of these return something whose NAME suggests a different type than it
 * has, and that is where the cases are aimed:
 *
 *   getMenuItemNum          counts to a -1 terminator, not to 0. A menu item
 *                           numbered 0 is legal, so a version that stopped on
 *                           zero would truncate any table containing one. The
 *                           empty case is also handled before the loop, which
 *                           is why an empty table is 0 and not 1.
 *
 *   areAchievementsViewing  returns a COUNT, not a boolean, despite the name --
 *                           and counts slots equal to exactly 1, not non-zero.
 *                           The tracker is filled with values around 1 so the
 *                           two readings give different answers.
 *
 *   the nine FE_Task_*      pop the task only on a return of EXACTLY 1. Written
 *                           as `if (BasicMenu(...))` they would close a menu on
 *                           any other outcome, so BasicMenu is stubbed to
 *                           return each of several values in turn.
 *
 * The nine also have to be told apart from each other. They are identical
 * except for the menu table, so the stub records WHICH table it was handed and
 * the test checks all nine are distinct -- a copy-paste error that gave two
 * tasks the same menu would otherwise pass every other check here.
 */

#include "arm_runtime.h"
#include "gamecode3.h"                  /* oracle: tools/armrecomp */

#include <stdio.h>
#include <string.h>

#define RAM_SIZE   (32u << 20)
#define STACK_TOP  0x00FF0000u

#define G_TRACKER  0x00379c60u          /* _achievementTracker */
#define G_TIMESTAMP 0x000ff8d8u         /* _lastTimerTimestamp */
#define G_VSTIMER  0x000ff8dcu          /* _vsScreenTimer */
#define G_TOWER    0x0014fcb4u          /* _OpponentTowerList */
#define G_MENU     0x00900000u          /* the test's own table */

#define SLOTS 20

static int  g_fail  = 0;
static long g_cases = 0;

static void check(const char *what, int ok)
{
    g_cases++;
    if (!ok) { printf("  DIVERGE %s\n", what); g_fail++; }
}

/* ------------------------------------------------- what the clean C needs */

int   achievementTracker[SLOTS];
int   lastTimerTimestamp;
float vsScreenTimer;
char  OpponentTowerList[0xb0];

int Menu_Task_Rematch[4], Menu_Task_Lobby[4], Menu_Task_Wifi_Bluetooth[4];
int Menu_Task_Credits[4], Menu_Task_About_Terms_of_Service[4];
int Menu_Task_About_Privacy_Policy[4], Menu_Task_About_Eula[4];
int Menu_Task_Manage_Profile[4], Menu_Task_Get_More_Games[4];

/* FrontEnd.c and GameCode.c hold more than the functions driven here. */
float FE_WidthScale, FE_HeightScale;
int   KodeSelector[10];
char  Stats[0x98];
int   CurrentTask;
int   LockCamera, AxeTrailDisallowed, RenderSettings[2];
typedef struct TEXTURE TEXTURE;
typedef struct TEXTURETOLOAD { const char *name; TEXTURE **dest; } TEXTURETOLOAD;
TEXTURETOLOAD BloodTexturesToLoad[1];
void LoadSomeTextures(TEXTURETOLOAD *l) { (void)l; }
void FreeSomeTextures(TEXTURETOLOAD *l) { (void)l; }
typedef struct GAMESTATE { uint8_t _pad000[0x44e]; int16_t f; } GAMESTATE;
static GAMESTATE g_state;
GAMESTATE *G = &g_state;

int  getMenuItemNum(const int *menu);
int  BasicMenu(int *menu);
void resetCountersBeforeMP(void);
int  areAchievementsViewing(void);
void Write_Tower(void);

void FE_Task_Rematch(void); void FE_Task_Lobby(void);
void FE_Task_Wifi_Bluetooth(void); void FE_Task_Credits(void);
void FE_Task_About_Terms_of_Service(void); void FE_Task_About_Privacy_Policy(void);
void FE_Task_About_Eula(void); void FE_Task_Manage_Profile(void);
void FE_Task_Get_More_Games(void);

/* the gates the stubs drive, applied identically on both sides */
static int g_menu_result;

static int         g_clean_pops;
static const void *g_clean_menu;
int BasicMenuWithWidth(int *menu, int width)
{
    g_clean_menu = menu;
    check("BasicMenu passes width 0x120", width == 0x120);
    return g_menu_result;
}
void PopFETaskDeferred(void) { g_clean_pops++; }
void PushFETaskDeferred(int t) { (void)t; }

static int         g_clean_writes;
static const void *g_clean_wdata;
static long        g_clean_wsize;
static char        g_clean_wpath[64];
int limeWriteFile(const char *path, const void *data, long size, long flags)
{
    g_clean_writes++;
    g_clean_wdata = data;
    g_clean_wsize = size;
    strncpy(g_clean_wpath, path ? path : "", sizeof(g_clean_wpath) - 1);
    check("clean Write_Tower passes flags 0", flags == 0);
    return 0;
}

/* ------------------------------------------------- what the oracle calls */

static int      g_oracle_pops;
static uint32_t g_oracle_menu;
void func_0000e8d4_Z18BasicMenuWithWidthPii(arm_ctx *ctx)
{
    g_oracle_menu = ctx->r[0];
    check("oracle BasicMenu passes width 0x120", ctx->r[1] == 0x120u);
    ctx->r[0] = (uint32_t)g_menu_result;
}
void func_00002f94_PopFETaskDeferred(arm_ctx *ctx) { (void)ctx; g_oracle_pops++; }

static int      g_oracle_writes;
static uint32_t g_oracle_wdata, g_oracle_wpath;
static long     g_oracle_wsize;
void func_00065d28_limeWriteFile(arm_ctx *ctx)
{
    g_oracle_writes++;
    g_oracle_wpath = ctx->r[0];
    g_oracle_wdata = ctx->r[1];
    g_oracle_wsize = (long)ctx->r[2];
    check("oracle Write_Tower passes flags 0", ctx->r[3] == 0u);
    ctx->r[0] = 0u;
}

/* ---------------------------------------------------------------- helpers */

static uint32_t call0(void (*fn)(arm_ctx *))
{
    arm_ctx c; memset(&c, 0, sizeof(c)); c.r[SP] = STACK_TOP; fn(&c); return c.r[0];
}

static uint32_t call1(void (*fn)(arm_ctx *), uint32_t a0)
{
    arm_ctx c; memset(&c, 0, sizeof(c)); c.r[SP] = STACK_TOP; c.r[0] = a0;
    fn(&c); return c.r[0];
}

int main(int argc, char **argv)
{
    const char *slice = (argc > 1) ? argv[1] : "work/UMK3.armv7";
    int i, k;

    setvbuf(stdout, NULL, _IONBF, 0);
    arm_mem_init(RAM_SIZE);
    if (arm_load_image(slice) != 0) {
        printf("no se pudo cargar %s\n", slice);
        return 2;
    }

    printf("=== thirteen more gamecode functions vs the recompiled original ===\n\n");

    /* ----------------------------------------------- getMenuItemNum ---- */
    {
        /* A table with a legal ZERO in it, so a version stopping on 0 rather
         * than on -1 truncates. And an empty one, which must be 0 and not 1. */
        static const int TABLES[][6] = {
            { -1,  0,  0,  0,  0,  0 },     /* empty            -> 0 */
            {  7, -1,  0,  0,  0,  0 },     /* one              -> 1 */
            {  0, -1,  0,  0,  0,  0 },     /* a legal zero     -> 1 */
            {  1,  0,  2, -1,  0,  0 },     /* zero in the middle -> 3 */
            {  5,  6,  7,  8, -1,  0 },     /* four             -> 4 */
        };
        static const int WANT[] = { 0, 1, 1, 3, 4 };

        for (i = 0; i < 5; i++) {
            int got_c, got_o;
            for (k = 0; k < 6; k++)
                MEM_ST32(G_MENU + 4u * (uint32_t)k, (uint32_t)TABLES[i][k]);

            got_c = getMenuItemNum(TABLES[i]);
            got_o = (int)call1(func_00002fe4_Z14getMenuItemNumPi, G_MENU);

            check("getMenuItemNum: clean and oracle agree", got_c == got_o);
            check("getMenuItemNum: counts to -1, not to 0", got_c == WANT[i]);
        }
    }

    /* ------------------------------------------ resetCountersBeforeMP ---- */
    {
        uint32_t bits;
        lastTimerTimestamp = 0x1234; vsScreenTimer = -1.0f;
        MEM_ST32(G_TIMESTAMP, 0x1234u);
        MEM_ST32(G_VSTIMER, 0xBF800000u);

        resetCountersBeforeMP();
        call0(func_000030a0_Z21resetCountersBeforeMPv);

        memcpy(&bits, &vsScreenTimer, 4);
        check("resetCountersBeforeMP cleared the timestamp",
              lastTimerTimestamp == 0 && MEM_LD32(G_TIMESTAMP) == 0u);
        check("resetCountersBeforeMP set the timer to 600.0f",
              bits == 0x44160000u && MEM_LD32(G_VSTIMER) == 0x44160000u);
        check("and 600.0f is what that literal is", vsScreenTimer == 600.0f);
    }

    /* -------------------------------------------------- BasicMenu ---- */
    {
        g_menu_result = 42;
        MEM_ST32(G_MENU, 0xAAu);
        check("clean BasicMenu returns what the width version returned",
              BasicMenu(Menu_Task_Rematch) == 42);
        check("oracle BasicMenu returns what the width version returned",
              (int)call1(func_0000ebb8_Z9BasicMenuPi, G_MENU) == 42);
    }

    /* -------------------------------------------- the nine menu tasks ---- */
    {
        struct { const char *name; void (*clean)(void);
                 void (*oracle)(arm_ctx *); int *table; } T[] = {
            { "Rematch", FE_Task_Rematch, func_0000ebc8_FE_Task_Rematch, Menu_Task_Rematch },
            { "Lobby", FE_Task_Lobby, func_0000ebe4_FE_Task_Lobby, Menu_Task_Lobby },
            { "Wifi_Bluetooth", FE_Task_Wifi_Bluetooth, func_0000ec00_FE_Task_Wifi_Bluetooth, Menu_Task_Wifi_Bluetooth },
            { "Credits", FE_Task_Credits, func_0000ec74_FE_Task_Credits, Menu_Task_Credits },
            { "About_Terms_of_Service", FE_Task_About_Terms_of_Service, func_0000ec90_FE_Task_About_Terms_of_Service, Menu_Task_About_Terms_of_Service },
            { "About_Privacy_Policy", FE_Task_About_Privacy_Policy, func_0000ecac_FE_Task_About_Privacy_Policy, Menu_Task_About_Privacy_Policy },
            { "About_Eula", FE_Task_About_Eula, func_0000ecc8_FE_Task_About_Eula, Menu_Task_About_Eula },
            { "Manage_Profile", FE_Task_Manage_Profile, func_0000ece4_FE_Task_Manage_Profile, Menu_Task_Manage_Profile },
            { "Get_More_Games", FE_Task_Get_More_Games, func_0000ed00_FE_Task_Get_More_Games, Menu_Task_Get_More_Games },
        };
        /* 1 pops; nothing else does -- including 2 and -1, which an
         * `if (result)` version would treat as a pop. */
        static const int R[] = { 0, 1, 2, -1, 99 };
        uint32_t seen_oracle[9];
        const void *seen_clean[9];
        int n = (int)(sizeof(T) / sizeof(T[0]));

        for (k = 0; k < (int)(sizeof(R) / sizeof(R[0])); k++) {
            g_menu_result = R[k];
            for (i = 0; i < n; i++) {
                char lbl[96];

                g_clean_pops = 0; g_clean_menu = NULL;
                T[i].clean();
                g_oracle_pops = 0; g_oracle_menu = 0u;
                call0(T[i].oracle);

                snprintf(lbl, sizeof(lbl),
                         "FE_Task_%s pops only on exactly 1 (menu=%d)",
                         T[i].name, R[k]);
                check(lbl, g_clean_pops == (R[k] == 1 ? 1 : 0));
                check(lbl, g_oracle_pops == (R[k] == 1 ? 1 : 0));

                snprintf(lbl, sizeof(lbl),
                         "FE_Task_%s passed its own table", T[i].name);
                check(lbl, g_clean_menu == (const void *)T[i].table);

                if (k == 0) { seen_oracle[i] = g_oracle_menu;
                              seen_clean[i] = g_clean_menu; }
            }
        }

        /* nine identical bodies, nine DIFFERENT tables -- a copy-paste error
         * giving two tasks the same menu passes everything above */
        for (i = 0; i < n; i++)
            for (k = i + 1; k < n; k++) {
                check("the nine menu tasks use nine distinct tables (oracle)",
                      seen_oracle[i] != seen_oracle[k]);
                check("the nine menu tasks use nine distinct tables (clean)",
                      seen_clean[i] != seen_clean[k]);
            }
    }

    /* -------------------------------------- areAchievementsViewing ---- */
    {
        /* Values AROUND 1, so "== 1" and "!= 0" give different answers. */
        static const int PAT[SLOTS] = { 0, 1, 2, 1, -1, 0, 1, 3, 1, 0,
                                        1, 1, 0, 7, 1, 0, 0, 1, 2, 1 };
        int want_eq1 = 0, want_nz = 0, got_c, got_o;

        for (i = 0; i < SLOTS; i++) {
            achievementTracker[i] = PAT[i];
            MEM_ST32(G_TRACKER + 4u * (uint32_t)i, (uint32_t)PAT[i]);
            if (PAT[i] == 1) want_eq1++;
            if (PAT[i] != 0) want_nz++;
        }

        got_c = areAchievementsViewing();
        got_o = (int)call0(func_000a02ac_areAchievementsViewing);

        check("areAchievementsViewing: clean and oracle agree", got_c == got_o);
        check("areAchievementsViewing: counts slots equal to 1", got_c == want_eq1);
        check("areAchievementsViewing: NOT slots that are non-zero",
              want_eq1 != want_nz && got_c != want_nz);
        check("areAchievementsViewing: it is a count, not a boolean", got_c > 1);

        /* all zero and all one, the two ends */
        for (i = 0; i < SLOTS; i++) {
            achievementTracker[i] = 0; MEM_ST32(G_TRACKER + 4u * (uint32_t)i, 0u);
        }
        check("all zero -> 0", areAchievementsViewing() == 0 &&
              call0(func_000a02ac_areAchievementsViewing) == 0u);
        for (i = 0; i < SLOTS; i++) {
            achievementTracker[i] = 1; MEM_ST32(G_TRACKER + 4u * (uint32_t)i, 1u);
        }
        check("all one -> 20", areAchievementsViewing() == SLOTS &&
              call0(func_000a02ac_areAchievementsViewing) == (uint32_t)SLOTS);
    }

    /* ------------------------------------------------------ Write_Tower ---- */
    {
        g_clean_writes = 0; g_oracle_writes = 0;
        Write_Tower();
        call0(func_00023818_Write_Tower);

        check("Write_Tower wrote once on each side",
              g_clean_writes == 1 && g_oracle_writes == 1);
        check("Write_Tower wrote 0xb0 bytes",
              g_clean_wsize == 0xb0 && g_oracle_wsize == 0xb0);
        check("clean Write_Tower passed OpponentTowerList",
              g_clean_wdata == (const void *)OpponentTowerList);
        check("oracle Write_Tower passed the tower list",
              g_oracle_wdata == G_TOWER);
        check("Write_Tower named the file towerdata",
              strcmp(g_clean_wpath, "towerdata") == 0);
        {
            char guest[16];
            for (i = 0; i < 15; i++) guest[i] = (char)MEM_LD8(g_oracle_wpath + (uint32_t)i);
            guest[15] = 0;
            check("and the oracle read the same name out of the slice",
                  strcmp(guest, "towerdata") == 0);
        }
    }

    printf("\nchecks: %ld    divergences: %d\n", g_cases, g_fail);
    printf("%s\n", g_fail ? "RESULT: FAIL"
                          : "RESULT: the clean gamecode functions match the original");

    arm_mem_free();
    return g_fail ? 1 : 0;
}
