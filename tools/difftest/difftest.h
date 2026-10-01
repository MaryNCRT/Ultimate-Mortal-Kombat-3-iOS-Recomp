#ifndef DIFFTEST_H
#define DIFFTEST_H

#include <stdint.h>
#include "arm_runtime.h"

typedef struct {
    const char *name;
    void       *native;             /* the decompiled C                        */
    void      (*oracle)(arm_ctx *); /* the recompiled ARM                      */
    int         kind;               /* 0 = thread handler, 1 = object routine  */
    int         ntok;
    uint32_t    tok[12];            /* resume tokens seen in the ARM code      */
    int         nimm;
    uint32_t    imm[40];            /* comparison constants seen in the ARM    */
} Test;

typedef struct {
    uint32_t    native;
    uint32_t    arm;                /* thumb address, bit 0 set                */
    const char *name;
} AddrMap;

extern const Test    g_tests[];
extern const int     g_ntests;
extern const AddrMap g_addrmap[];
extern const int     g_naddr;

/* run an oracle function from a decomp shim: r0..r3 in, r0 out */
uint32_t oracle_call(void (*fn)(arm_ctx *), uint32_t a, uint32_t b, uint32_t c, uint32_t d);

#endif
