/*
 * test_switchqueue_diff.c — clean SwitchQueue against the oracle.
 *
 * First function of gamecode/logic to be verified, so it is worth saying what
 * makes it verifiable at all: SwitchQueue is pure data manipulation over a
 * ring buffer plus one read of a global. No function pointers, no indirect
 * branches — the recompiler handles it exactly, which most of the fight
 * engine's dispatch code will not allow.
 *
 * The test drives both implementations through many pushes so the ring wraps
 * repeatedly, and compares the whole buffer plus the head pointer after each
 * one. Wrap-around is where an off-by-one would hide.
 */

#include "arm_runtime.h"
#include "switchqueue.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define RAM_SIZE    (64u << 20)
#define STACK_TOP   0x03F00000u
#define QUEUE_ADDR  0x00700000u

#define SLOTS 20

/* ---- the clean implementation, with its global supplied by the test ---- */

typedef struct SWITCHQUEUE {
    uint32_t *head;
    uint32_t  slots[SLOTS];
} SWITCHQUEUE;

static uint16_t g_counter;

uint16_t proc_switch_counter(void)
{
    return g_counter;
}

void SwitchQueue(uint16_t value, SWITCHQUEUE *q);

/* ---- oracle side ---- */

/*
 * The original reads the counter from PROC+0xa8, reached through a global
 * pointer held in the binary's data. The literal pool resolves it at
 * recompile time, so the test writes the counter where the code will look
 * for it: *(global) + 0xa8.
 */
static uint32_t g_proc_ptr_slot;   /* address of the global pointer itself */
static uint32_t g_proc_addr;       /* the PROC the pointer refers to */

static void oracle_push(uint32_t qaddr, uint16_t value, uint16_t counter)
{
    arm_ctx ctx;
    memset(&ctx, 0, sizeof(ctx));
    ctx.r[SP] = STACK_TOP;
    MEM_ST16(g_proc_addr + 0xa8, counter);
    ctx.r[0] = value;
    ctx.r[1] = qaddr;
    func_00055ed4_SwitchQueue(&ctx);
}

static int g_fail = 0;
static long g_cases = 0;

static void compare(const SWITCHQUEUE *clean, uint32_t qaddr, int step)
{
    g_cases++;

    uint32_t ohead = MEM_LD32(qaddr);
    uint32_t chead = (uint32_t)(QUEUE_ADDR + 4
                     + (uint32_t)((const char *)clean->head
                                  - (const char *)&clean->slots[0]));
    if (ohead != chead) {
        printf("  DIVERGES step %d: head oracle=0x%08x clean=0x%08x\n",
               step, ohead, chead);
        g_fail++;
        return;
    }
    for (int i = 0; i < SLOTS; i++) {
        uint32_t o = MEM_LD32(qaddr + 4 + 4u * (uint32_t)i);
        if (o != clean->slots[i]) {
            printf("  DIVERGES step %d slot %d: oracle=0x%08x clean=0x%08x\n",
                   step, i, o, clean->slots[i]);
            g_fail++;
            return;
        }
    }
}

int main(int argc, char **argv)
{
    const char *image = (argc >= 2) ? argv[1]
                                    : "E:/MK3 PROJECT/OUTPUT/armv7/UMK3.armv7";

    arm_mem_init(RAM_SIZE);
    if (arm_load_image(image) != 0) {
        printf("could not map the binary image: %s\n", image);
        return 2;
    }

    /*
     * Point the binary's global at a PROC we control. The pointer slot sits
     * in __DATA; the recompiled code dereferences it, so it has to hold a
     * usable address before the first call.
     */
    /* The literal at 0x00055ef8 is 0x0009d6a0, and `add r2, pc` at 0x00055ed8
     * makes it absolute: 0x0009d6a0 + 0x00055edc = 0x000f357c, in __DATA. */
    g_proc_ptr_slot = 0x000f357cu;
    g_proc_addr     = 0x00790000u;
    MEM_ST32(g_proc_ptr_slot, g_proc_addr);

    printf("=== clean SwitchQueue vs the recompiled original ===\n\n");

    /* Both start with head at the first slot. */
    SWITCHQUEUE clean;
    memset(&clean, 0, sizeof(clean));
    clean.head = &clean.slots[0];

    memset(g_ram + QUEUE_ADDR, 0, 4 + 4 * SLOTS);
    MEM_ST32(QUEUE_ADDR, QUEUE_ADDR + 4);

    /* Push well past the ring size so it wraps several times. */
    uint32_t seed = 0xC0FFEEu;
    for (int step = 0; step < 500; step++) {
        seed = seed * 1664525u + 1013904223u;
        uint16_t value   = (uint16_t)(seed >> 16);
        uint16_t counter = (uint16_t)(seed & 0xFFFF);

        g_counter = counter;
        SwitchQueue(value, &clean);
        oracle_push(QUEUE_ADDR, value, counter);

        compare(&clean, QUEUE_ADDR, step);
        if (g_fail) {
            break;
        }
    }

    printf("pushes compared: %ld    divergences: %d\n", g_cases, g_fail);
    printf("%s\n", g_fail ? "RESULT: FAIL"
                          : "RESULT: the clean queue matches the original");
    arm_mem_free();
    return g_fail ? 1 : 0;
}
