/*
 * test_text_diff.c — the UTF-16 primitives and the two task switchers.
 *
 * ## The one that matters
 *
 * `strLenUnicode` stops on a pair of zero BYTES, not on one. So a plain ASCII
 * string stored as UTF-16 -- `41 00 42 00 00 00` -- is two characters long and
 * `strlen(s) / 2` returns 0 for it, because `strlen` stops at the first byte.
 *
 * Every ASCII character has a zero high byte, which means that mistake is not
 * an edge case: it is wrong for almost every string the game holds. The sweep
 * is built out of exactly those, plus the ones where the mistake would
 * accidentally be right.
 *
 * ## And the two that look interchangeable
 *
 * `decodeLHWord` and `putUnicodeChar` are inverses, so a test that only ever
 * round-trips them would pass with both byte orders swapped. They are driven
 * separately against fixed byte patterns, and only then round-tripped.
 *
 * Both also read and write BYTE AT A TIME on purpose, which is what makes them
 * safe on unaligned pointers. The test drives them at odd offsets so a version
 * that reached for a halfword load would be doing something different from the
 * original even where it happens to give the same answer.
 */

#include "arm_runtime.h"
#include "text.h"                       /* oracle: tools/armrecomp */

#include <stdio.h>
#include <string.h>

#define RAM_SIZE   (8u << 20)
#define STACK_TOP  0x007F0000u

#define G_BUF      0x00800000u
#define G_TASKPTR  0x00150590u          /* _CurrentTask */

static int  g_fail  = 0;
static long g_cases = 0;

static void check(const char *what, int ok)
{
    g_cases++;
    if (!ok) { printf("  DIVERGE %s\n", what); g_fail++; }
}

/* ---- the clean side ---- */
uint32_t decodeLHWord(const char *p);
int      putUnicodeChar(char *dst, uint32_t ch);
long     strLenUnicode(const char *s);
void     switchToTask(int task);
void     switchToFETask(int task);

int CurrentTask;

static int g_clean_pushes, g_clean_pushed;
void PushFETaskDeferred(int task) { g_clean_pushes++; g_clean_pushed = task; }

/* FrontEnd.c holds more than the two functions driven here, and it keeps
 * growing; linking the translation unit means resolving all of it. */
float FE_WidthScale, FE_HeightScale;
int   KodeSelector[10];
char  Stats[0x98];
int   Menu_Task_Rematch[1], Menu_Task_Lobby[1], Menu_Task_Wifi_Bluetooth[1];
int   Menu_Task_Credits[1], Menu_Task_About_Terms_of_Service[1];
int   Menu_Task_About_Privacy_Policy[1], Menu_Task_About_Eula[1];
int   Menu_Task_Manage_Profile[1], Menu_Task_Get_More_Games[1];
int   lastTimerTimestamp;
float vsScreenTimer;
int   BasicMenuWithWidth(int *m, int w) { (void)m; (void)w; return 0; }
void  PopFETaskDeferred(void) { }

/* ---- the oracle side ---- */
static int      g_oracle_pushes;
static uint32_t g_oracle_pushed;
void func_0000386c_PushFETaskDeferred(arm_ctx *ctx)
{ g_oracle_pushes++; g_oracle_pushed = ctx->r[0]; }

/* ---------------------------------------------------------------- helpers */

static uint32_t call1(void (*fn)(arm_ctx *), uint32_t a0)
{
    arm_ctx c; memset(&c, 0, sizeof(c)); c.r[SP] = STACK_TOP; c.r[0] = a0;
    fn(&c); return c.r[0];
}

static uint32_t call2(void (*fn)(arm_ctx *), uint32_t a0, uint32_t a1)
{
    arm_ctx c; memset(&c, 0, sizeof(c)); c.r[SP] = STACK_TOP;
    c.r[0] = a0; c.r[1] = a1; fn(&c); return c.r[0];
}

static void put(uint32_t at, const uint8_t *b, size_t n)
{
    size_t i;
    for (i = 0; i < n; i++) MEM_ST8(at + (uint32_t)i, b[i]);
}

int main(int argc, char **argv)
{
    const char *slice = (argc > 1) ? argv[1] : "work/UMK3.armv7";
    size_t k;

    setvbuf(stdout, NULL, _IONBF, 0);
    arm_mem_init(RAM_SIZE);
    if (arm_load_image(slice) != 0) {
        printf("no se pudo cargar %s\n", slice);
        return 2;
    }

    printf("=== the UTF-16 primitives and the task switchers ===\n\n");

    /* ------------------------------------------------- decodeLHWord ---- */
    {
        static const uint8_t P[][2] = {
            {0x00,0x00}, {0x41,0x00}, {0x00,0x41}, {0xFF,0x00}, {0x00,0xFF},
            {0xFF,0xFF}, {0x80,0x80}, {0x12,0x34}, {0xAB,0xCD}
        };
        /* odd offsets too: these read byte at a time on purpose */
        static const uint32_t OFF[] = { 0u, 1u, 2u, 3u };
        size_t o;

        for (k = 0; k < sizeof(P)/sizeof(P[0]); k++)
            for (o = 0; o < sizeof(OFF)/sizeof(OFF[0]); o++) {
                char     host[4];
                uint32_t at = G_BUF + OFF[o];
                uint32_t c, ocl;

                host[0] = (char)P[k][0]; host[1] = (char)P[k][1];
                put(at, P[k], 2);

                c   = decodeLHWord(host);
                ocl = call1(func_000a72f8_Z12decodeLHWordPKc, at);

                check("decodeLHWord: clean and oracle agree", c == ocl);
                check("decodeLHWord: low byte first, neither sign-extended",
                      c == ((uint32_t)P[k][0] | ((uint32_t)P[k][1] << 8)));
            }
    }

    /* ----------------------------------------------- putUnicodeChar ---- */
    {
        static const uint32_t CH[] = { 0u, 0x41u, 0x4100u, 0xFFFFu, 0x1234u,
                                       0xABCDu, 0x10041u /* above 16 bits */ };
        size_t o;
        for (k = 0; k < sizeof(CH)/sizeof(CH[0]); k++)
            for (o = 0; o < 4u; o++) {
                char     host[8];
                uint32_t at = G_BUF + 0x100u + (uint32_t)o;
                int      rc_c;
                uint32_t rc_o;

                memset(host, 0x5A, sizeof(host));
                for (rc_c = 0; rc_c < 8; rc_c++) MEM_ST8(at - (uint32_t)o + (uint32_t)rc_c, 0x5Au);

                rc_c = putUnicodeChar(host + o, CH[k]);
                rc_o = call2(func_000a7304_putUnicodeChar, at, CH[k]);

                check("putUnicodeChar returns 2", rc_c == 2 && rc_o == 2u);
                check("putUnicodeChar: low byte first",
                      (uint8_t)host[o] == (uint8_t)(CH[k] & 0xFFu) &&
                      MEM_LD8(at) == (uint8_t)(CH[k] & 0xFFu));
                check("putUnicodeChar: high byte second",
                      (uint8_t)host[o+1] == (uint8_t)((CH[k] >> 8) & 0xFFu) &&
                      MEM_LD8(at + 1u) == (uint8_t)((CH[k] >> 8) & 0xFFu));
                check("putUnicodeChar wrote exactly two bytes",
                      (uint8_t)host[o+2] == 0x5Au && MEM_LD8(at + 2u) == 0x5Au);
            }
    }

    /* ------------------------------------------------ strLenUnicode ---- */
    {
        /* Every one of these has a zero high byte in each unit, which is what
         * makes strlen()/2 wrong for all of them. The last two are the cases
         * where a naive version would accidentally agree. */
        static const uint8_t S1[] = { 0x00, 0x00 };                          /* 0 */
        static const uint8_t S2[] = { 0x41, 0x00, 0x00, 0x00 };              /* 1 */
        static const uint8_t S3[] = { 0x41, 0x00, 0x42, 0x00, 0x43, 0x00,
                                      0x00, 0x00 };                          /* 3 */
        static const uint8_t S4[] = { 0x00, 0x41, 0x00, 0x00 };              /* 1 */
        static const uint8_t S5[] = { 0xFF, 0xFF, 0x01, 0x02, 0x00, 0x00 };  /* 2 */
        static const uint8_t S6[] = { 0x41, 0x41, 0x00, 0x00 };              /* 1 */
        static const struct { const uint8_t *b; size_t n; long want; } T[] = {
            { S1, sizeof(S1), 0 }, { S2, sizeof(S2), 1 }, { S3, sizeof(S3), 3 },
            { S4, sizeof(S4), 1 }, { S5, sizeof(S5), 2 }, { S6, sizeof(S6), 1 }
        };

        for (k = 0; k < sizeof(T)/sizeof(T[0]); k++) {
            char host[16];
            long c;
            uint32_t o;

            memset(host, 0, sizeof(host));
            memcpy(host, T[k].b, T[k].n);
            put(G_BUF + 0x200u, T[k].b, T[k].n);

            c = strLenUnicode(host);
            o = call1(func_000a7440_strLenUnicode, G_BUF + 0x200u);

            check("strLenUnicode: clean and oracle agree", c == (long)o);
            check("strLenUnicode: counts code units, not bytes", c == T[k].want);
        }

        /* and the trap, stated directly */
        {
            char host[8];
            memset(host, 0, sizeof(host));
            memcpy(host, S3, sizeof(S3));
            check("strLenUnicode is NOT strlen()/2 for ASCII-in-UTF16",
                  strLenUnicode(host) == 3 && (long)(strlen(host) / 2) == 0);
        }
    }

    /* ------------------------------------------------- switchToTask ---- */
    {
        static const int T[] = { 0, 1, 3, 4, 5, -1, 0x7FFFFFFF };
        for (k = 0; k < sizeof(T)/sizeof(T[0]); k++) {
            static const int START[] = { 0, 3, 4, 9 };
            size_t s;
            for (s = 0; s < sizeof(START)/sizeof(START[0]); s++) {
                int want = (T[k] == 4 && START[s] != 4) ? 4 : START[s];

                CurrentTask = START[s];
                switchToTask(T[k]);

                MEM_ST32(G_TASKPTR, (uint32_t)START[s]);
                call1(func_0000312c_switchToTask, (uint32_t)T[k]);

                check("switchToTask: clean and oracle agree",
                      (uint32_t)CurrentTask == MEM_LD32(G_TASKPTR));
                check("switchToTask: only task 4 ever writes",
                      CurrentTask == want);
            }
        }
    }

    /* ----------------------------------------------- switchToFETask ---- */
    {
        static const int T[] = { 0, 1, 4, 99, -7 };
        for (k = 0; k < sizeof(T)/sizeof(T[0]); k++) {
            g_clean_pushes = 0; g_clean_pushed = -1;
            switchToFETask(T[k]);
            check("clean switchToFETask deferred once", g_clean_pushes == 1);
            check("clean switchToFETask passed the task through",
                  g_clean_pushed == T[k]);

            g_oracle_pushes = 0; g_oracle_pushed = 0u;
            call1(func_000038bc_switchToFETask, (uint32_t)T[k]);
            check("oracle switchToFETask deferred once", g_oracle_pushes == 1);
            check("oracle switchToFETask passed the task through",
                  g_oracle_pushed == (uint32_t)T[k]);
        }
    }

    printf("\nchecks: %ld    divergences: %d\n", g_cases, g_fail);
    printf("%s\n", g_fail ? "RESULT: FAIL"
                          : "RESULT: the clean text and task functions match the original");

    arm_mem_free();
    return g_fail ? 1 : 0;
}
