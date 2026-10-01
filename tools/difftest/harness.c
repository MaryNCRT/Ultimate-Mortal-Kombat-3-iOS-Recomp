/*
 * harness.c -- run the recompiled ARM oracle and the decompiled C on the same
 * memory, many times, and compare what each leaves behind.
 *
 * A 32-bit process, so the decompiled structs have the binary's layout and a
 * native pointer IS an ARM address. The binary's data image is mapped at its
 * own addresses (g_ram = 0), the globals the code reads (G, Plyr, Pp, GrObj,
 * mytc ...) are the real arrays at their real addresses, and both sides
 * work on them.
 *
 * Per scenario: randomise the state, snapshot, run the oracle, keep its result,
 * restore the snapshot, run the C, compare the return value and every byte of
 * the data image. Functions the C calls but does not define are shims that run
 * the oracle's version, so only the function under test differs between sides.
 */
#include <windows.h>
#include <setjmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "difftest.h"

#define IMG_LO    0x10000u
#define IMG_HI    0x500000u
#define IMG_SZ    (IMG_HI - IMG_LO)
static uint32_t ARENA;
#define ARENA_SZ  0x40000u
#define STK_ORACLE (ARENA + 0x3c000u)
#define STK_SHIM   (ARENA + 0x3f000u)
#define GLOB_LO   0x380000u         /* where handler addresses are translated */
#define GLOB_HI   0x3a0000u

/* the globals, at the binary's addresses */
#define A_G        0x0038c1fcu
#define A_H        0x0038c674u
#define A_GROBJ    0x0038c698u
#define A_PLYR     0x0038cff4u
#define A_PP       0x0038dc9cu
#define A_RP       0x0038ed04u
#define A_MYTC     0x0038ef3cu

static uint8_t snapI[IMG_SZ], snapA[ARENA_SZ];
static uint8_t resI[IMG_SZ],  resA[ARENA_SZ];
static uint8_t orcI[IMG_SZ],  orcA[ARENA_SZ];

static jmp_buf g_jb;
static volatile int g_in_run;
static volatile DWORD g_t0;
static const char *volatile g_cur;

static uint32_t g_fault_addr, g_fault_pc;
static unsigned long g_fault_code;

static LONG WINAPI crash_filter(EXCEPTION_POINTERS *ep)
{
    g_fault_addr = ep->ExceptionRecord->NumberParameters > 1 ? (uint32_t)ep->ExceptionRecord->ExceptionInformation[1] : 0;
    g_fault_code = ep->ExceptionRecord->ExceptionCode;
    g_fault_pc = (uint32_t)(uintptr_t)ep->ExceptionRecord->ExceptionAddress;
    if (g_in_run)
        longjmp(g_jb, 1);
    return EXCEPTION_CONTINUE_SEARCH;
}

static DWORD WINAPI watchdog(LPVOID p)
{
    (void)p;
    for (;;) {
        Sleep(200);
        if (g_in_run && GetTickCount() - g_t0 > 4000) {
            fprintf(stderr, "HANG %s\n", g_cur ? g_cur : "?");
            fflush(stderr);
            ExitProcess(3);
        }
    }
}

/* ------------------------------------------------------------------ rng */
static uint64_t rs = 0x9e3779b97f4a7c15ull;
static uint32_t rnd(void)
{
    rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17;
    return (uint32_t)(rs >> 16);
}

static const uint32_t interesting[] = {
    0, 0, 0, 0, 1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 0x10, 0x14, 0x18, 0x20, 0x28, 0x30, 0x40, 0x44,
    0x48, 0x50, 0x60, 0x70, 0x80, 0x90, 0xa0, 0xb0, 0xc0, 0xd0, 0xe0, 0xf0, 0x100, 0x110,
    0x1000, 0x2000, 0x10000, 0x20000, 0x30000, 0x40000, 0x70000,
    0xffffffffu, 0xfffffffeu, 0xffffff00u, 0xfffc0000u, 0xfff80000u, 0xffff0000u,
};

static const Test *g_t;
static int g_ptrmode;           /* this scenario: most words are valid addresses */

static uint32_t pick(void)
{
    uint32_t r = rnd();
    uint32_t v;
    /* now and then a valid address, so a field the code uses as a pointer
     * (a table, a script) reads real memory instead of killing the scenario */
    if (g_ptrmode ? ((r >> 20) % 10 < 6) : (((r >> 20) & 7) == 0))
        return 0x100000u + ((r >> 3) & 0x1fffffu & ~3u);
    switch (r % 8) {
    case 0: case 1: case 2:
        v = interesting[(r >> 3) % (sizeof interesting / sizeof interesting[0])];
        break;
    case 3: case 4:
        if (g_t->nimm) {
            v = g_t->imm[(r >> 3) % g_t->nimm] + ((r >> 12) % 3) - 1;
            break;
        }
        v = r & 0xff;
        break;
    case 5:
        v = r & 0xff;
        break;
    case 6:
        v = (r >> 3) & 0x3ff;
        break;
    default:
        v = (r >> 3) & 0x1ff;
        if (rnd() & 1) v |= 0xfffffe00u;      /* a small negative */
        break;
    }
    return v;
}

static void fill(uint32_t addr, uint32_t nbytes)
{
    uint32_t *w = (uint32_t *)(uintptr_t)addr;
    for (uint32_t i = 0; i < nbytes / 4; i++)
        w[i] = pick();
}

#define W(a) (*(uint32_t *)(uintptr_t)(a))

static uint32_t plyr(int n) { return A_PLYR + (uint32_t)n * 0x6c; }
static uint32_t pp(int n)   { return A_PP + (uint32_t)n * 0x8c; }
static uint32_t grobj(int n){ return A_GROBJ + (uint32_t)n * 0x4c; }
static uint32_t mytc(int n) { return A_MYTC + (uint32_t)n * 0x10c; }

static uint32_t arm_handlers[64];
static int      n_handlers;

/* a plausible, valid state, then randomised */
static void scenario(const Test *t, uint32_t token)
{
    g_t = t;
    g_ptrmode = (int)(rnd() & 1);
    memset((void *)(uintptr_t)ARENA, 0, ARENA_SZ);
    fill(A_G, 0x478);
    fill(A_H, 0x24);
    fill(A_RP, 0x44);
    fill(A_GROBJ, 30 * 0x4c);
    fill(A_PLYR, 30 * 0x6c);
    fill(A_PP, 30 * 0x8c);

    /* the round clock halfword the AI reads, mostly in range */
    *(int16_t *)(uintptr_t)(A_G + 0x44c) = (int16_t)(rnd() % 14);
    *(int16_t *)(uintptr_t)(A_G + 0x45e) = (int16_t)(rnd() % 3);
    *(int16_t *)(uintptr_t)(A_G + 0x460) = (int16_t)(rnd() % 3);
    W(A_G + 0x448) = rnd() % 4;
    W(A_RP + 0x40) = rnd() & 1;

    for (int n = 0; n < 2; n++) {
        W(plyr(n) + 0x00) = pp(n);
        W(plyr(n) + 0x04) = mytc(n);
        W(plyr(n) + 0x08) = grobj(n);
        W(plyr(n) + 0x3c) = grobj(n);
        W(pp(n) + 0x00)   = plyr(1 - n);
        W(pp(n) + 0x04)   = grobj(1 - n);
        W(pp(n) + 0x08)   = (uint32_t)n;
        W(grobj(n) + 0x00) = pp(n);
        W(grobj(n) + 0x04) = 0;
        W(grobj(n) + 0x08) = plyr(n);
        /* the animation-rate / script fields stay small */
        W(plyr(n) + 0x24) = rnd() % 40;
        W(grobj(n) + 0x24) = rnd() % 40;
    }

    /* the thread */
    uint32_t T = mytc(0);
    memset((void *)(uintptr_t)T, 0, 0x10c);
    fill(T + 0x08, 4);
    uint32_t F = rnd() % 3;
    for (int i = 0; i < 20; i++) {
        W(T + (uint32_t)i * 8) = (rnd() & 1) ? 0 : pick();
        W(T + (uint32_t)i * 8 + 4) = n_handlers ? arm_handlers[rnd() % n_handlers] : 0;
    }
    W(T + 0xa4) = F;
    W(T + (F + 1) * 8) = token;
    W(T + 0xf8) = rnd() % 5;
    for (int i = 0; i < 20; i++)
        W(T + 0xa8 + (uint32_t)i * 4) = pick();
    W(T + 0xfc) = 0;
    W(T + 0x100) = 0;
    W(T + 0x104) = 0;
    W(T + 0x108) = plyr(0);

    /* his thread */
    W(mytc(1) + 0xa4) = rnd() % 3;
    W(mytc(1) + 0x108) = plyr(1);
}

/* ------------------------------------------------------- translation */
static int map_cmp(const void *a, const void *b)
{
    uint32_t x = ((const AddrMap *)a)->native, y = ((const AddrMap *)b)->native;
    return x < y ? -1 : x > y;
}
static AddrMap *by_native;

static void init_handlers(void)
{
    by_native = (AddrMap *)malloc(sizeof(AddrMap) * (size_t)g_naddr);
    memcpy(by_native, g_addrmap, sizeof(AddrMap) * (size_t)g_naddr);
    qsort(by_native, (size_t)g_naddr, sizeof(AddrMap), map_cmp);
    for (int i = 0; i < g_naddr && n_handlers < 64; i += (g_naddr / 40 + 1))
        arm_handlers[n_handlers++] = g_addrmap[i].arm;
}

static const AddrMap *find_native(uint32_t v)
{
    int lo = 0, hi = g_naddr - 1;
    while (lo <= hi) {
        int m = (lo + hi) / 2;
        if (by_native[m].native == v) return &by_native[m];
        if (by_native[m].native < v) lo = m + 1; else hi = m - 1;
    }
    return 0;
}

static const AddrMap *find_arm(uint32_t v)
{
    for (int i = 0; i < g_naddr; i++)
        if (g_addrmap[i].arm == v) return &g_addrmap[i];
    return 0;
}

static void arm_to_native(void)
{
    for (uint32_t a = GLOB_LO; a < GLOB_HI; a += 4) {
        uint32_t v = W(a);
        if ((v & 1) && v > 0x10000 && v < 0x100000) {
            const AddrMap *m = find_arm(v);
            if (m) W(a) = m->native;
        }
    }
}

static void native_to_arm(uint8_t *img)
{
    for (uint32_t a = GLOB_LO; a < GLOB_HI; a += 4) {
        uint32_t v;
        memcpy(&v, img + (a - IMG_LO), 4);
        if (v > 0x400000u) {
            const AddrMap *m = find_native(v);
            if (m) memcpy(img + (a - IMG_LO), &m->arm, 4);
        }
    }
}

/* ------------------------------------------------------------- calls */
static arm_ctx g_shim_ctx;

uint32_t oracle_call(void (*fn)(arm_ctx *), uint32_t a, uint32_t b, uint32_t c, uint32_t d)
{
    arm_ctx save = g_shim_ctx;
    memset(&g_shim_ctx, 0, sizeof g_shim_ctx);
    g_shim_ctx.r[SP] = STK_SHIM;
    g_shim_ctx.r[0] = a; g_shim_ctx.r[1] = b; g_shim_ctx.r[2] = c; g_shim_ctx.r[3] = d;
    fn(&g_shim_ctx);
    uint32_t r = g_shim_ctx.r[0];
    g_shim_ctx = save;
    return r;
}

static void snapshot(void)
{
    memcpy(snapI, (void *)(uintptr_t)IMG_LO, IMG_SZ);
    memcpy(snapA, (void *)(uintptr_t)ARENA, ARENA_SZ);
}
static void restore(void)
{
    memcpy((void *)(uintptr_t)IMG_LO, snapI, IMG_SZ);
    memcpy((void *)(uintptr_t)ARENA, snapA, ARENA_SZ);
}
static void capture(uint8_t *i, uint8_t *a)
{
    memcpy(i, (void *)(uintptr_t)IMG_LO, IMG_SZ);
    memcpy(a, (void *)(uintptr_t)ARENA, ARENA_SZ);
}

typedef long (*thread_fn)(void *);
typedef void (*obj_fn)(void *);

void stubs_reseed(uint32_t seed);
static uint32_t g_seed;

static int run_oracle(const Test *t, uint32_t arg, int32_t *ret)
{
    stubs_reseed(g_seed);
    arm_ctx ctx;
    memset(&ctx, 0, sizeof ctx);
    ctx.r[SP] = STK_ORACLE;
    ctx.r[0] = arg;
    g_in_run = 1; g_t0 = GetTickCount(); g_cur = t->name;
    if (setjmp(g_jb) == 0) {
        t->oracle(&ctx);
        g_in_run = 0;
        *ret = (int32_t)ctx.r[0];
        return 1;
    }
    g_in_run = 0;
    return 0;
}

static int run_native(const Test *t, uint32_t arg, int32_t *ret)
{
    stubs_reseed(g_seed);
    g_in_run = 1; g_t0 = GetTickCount(); g_cur = t->name;
    if (setjmp(g_jb) == 0) {
        if (t->kind == 0)
            *ret = (int32_t)((thread_fn)t->native)((void *)(uintptr_t)arg);
        else {
            ((obj_fn)t->native)((void *)(uintptr_t)arg);
            *ret = 0;
        }
        g_in_run = 0;
        return 1;
    }
    g_in_run = 0;
    return 0;
}

static int g_verbose, g_debug;

/* An instruction the recompiler could not translate (an indirect call, say)
 * ends THIS scenario, not the run: the oracle cannot answer, so it is skipped.
 * Defined here, ahead of arm_runtime.c in the link, so it wins. */
void arm_unimplemented(const char *func, uint32_t addr, const char *text)
{
    (void)func; (void)addr; (void)text;
    if (g_in_run)
        longjmp(g_jb, 1);
    fprintf(stderr, "unimplemented outside a run: %s %s\n", func, text);
    exit(2);
}

static int compare(const Test *t, uint32_t token, int32_t ro, int32_t rn)
{
    int bad = 0;
    if (t->kind == 0 && ro != rn) {
        printf("  %-28s token %#x: return oracle %d, C %d\n", t->name, token, ro, rn);
        bad++;
    }
    /* image */
    for (uint32_t i = 0; i < IMG_SZ && bad < 8; i += 4) {
        if (memcmp(orcI + i, resI + i, 4) != 0) {
            uint32_t a = IMG_LO + i, vo, vn;
            memcpy(&vo, orcI + i, 4); memcpy(&vn, resI + i, 4);
            const char *where = "";
            if (a >= mytc(0) && a < mytc(0) + 0x10c) where = " (thread 0)";
            else if (a >= plyr(0) && a < plyr(0) + 0x6c) where = " (Plyr[0])";
            else if (a >= pp(0) && a < pp(0) + 0x8c) where = " (Pp[0])";
            else if (a >= grobj(0) && a < grobj(0) + 0x4c) where = " (GrObj[0])";
            else if (a >= A_G && a < A_G + 0x478) where = " (G)";
            printf("  %-28s token %#x: word %#x%s oracle %#x, C %#x\n", t->name, token, a, where, vo, vn);
            bad++;
        }
    }
    return bad;
}

static int test_one(const Test *t, int nsc, int *skipped, int *failed_scen)
{
    uint32_t toks[16];
    int nt = 0;
    toks[nt++] = 0;
    for (int i = 0; i < t->ntok && nt < 15; i++) toks[nt++] = t->tok[i];
    toks[nt++] = 0x7777;
    int fails = 0;
    for (int ti = 0; ti < (t->kind == 0 ? nt : 1); ti++) {
        for (int s = 0; s < nsc; s++) {
            uint32_t token = t->kind == 0 ? toks[ti] : 0;
            scenario(t, token);
            g_seed = rnd();
            snapshot();
            int32_t ro = 0, rn = 0;
            uint32_t arg = t->kind == 0 ? mytc(0) : plyr(0);
            int ok_o = run_oracle(t, arg, &ro);
            if (!ok_o) {
                if (g_debug && *skipped < 4)
                    printf("    skipped: code %lx at pc %#x, address %#x\n", g_fault_code, g_fault_pc, g_fault_addr);
                (*skipped)++;
                continue;
            }
            capture(orcI, orcA);
            restore();
            arm_to_native();
            int ok_n = run_native(t, arg, &rn);
            if (!ok_n) {
                printf("  %-28s token %#x: the C crashed where the oracle did not\n", t->name, token);
                fails++; (*failed_scen)++;
                if (fails >= 3) return fails;
                continue;
            }
            capture(resI, resA);
            native_to_arm(resI);
            int bad = compare(t, token, ro, rn);
            if (bad && g_debug && fails == 0) {
                /* Plyr[0] (the object) before / oracle / C, 27 words */
                printf("    Plyr[0] words: before | oracle | C\n");
                for (uint32_t o = 0; o < 0x6c; o += 4) {
                    uint32_t b, a, c;
                    memcpy(&b, snapI + (plyr(0) + o - IMG_LO), 4);
                    memcpy(&a, orcI + (plyr(0) + o - IMG_LO), 4);
                    memcpy(&c, resI + (plyr(0) + o - IMG_LO), 4);
                    printf("      +%02x  %08x | %08x | %08x%s\n", o, b, a, c, a != c ? "   <--" : "");
                }
                printf("    G halfword 0x44c = %d\n", *(int16_t *)(uintptr_t)(A_G + 0x44c));
            }
            if (bad) {
                fails++; (*failed_scen)++;
                if (fails >= 3) return fails;
            }
        }
    }
    return fails;
}

int main(int argc, char **argv)
{
    const char *slice = getenv("UMK3_SLICE");
    int nsc = 150;
    const char *only = 0;
    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "-n") && i + 1 < argc) nsc = atoi(argv[++i]);
        else if (!strcmp(argv[i], "-v")) g_verbose = 1;
        else if (!strcmp(argv[i], "-d")) g_debug = 1;
        else only = argv[i];
    }
    if (!slice) { fprintf(stderr, "UMK3_SLICE not set\n"); return 2; }

    if (!VirtualAlloc((void *)(uintptr_t)IMG_LO, IMG_SZ, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE)) {
        /* the process heap can land inside the range; where it lands changes
         * from launch to launch, so try again in a fresh process */
        const char *t = getenv("DT_TRY");
        int tries = t ? atoi(t) : 0;
        if (tries < 12) {
            char nb[16];
            snprintf(nb, sizeof nb, "%d", tries + 1);
            SetEnvironmentVariableA("DT_TRY", nb);
            STARTUPINFOA si; PROCESS_INFORMATION pi; DWORD code = 2;
            memset(&si, 0, sizeof si); si.cb = sizeof si;
            if (CreateProcessA(0, GetCommandLineA(), 0, 0, TRUE, 0, 0, 0, &si, &pi)) {
                WaitForSingleObject(pi.hProcess, INFINITE);
                GetExitCodeProcess(pi.hProcess, &code);
                return (int)code;
            }
        }
        fprintf(stderr, "cannot map the image range at %#x (%lu)\n", IMG_LO, GetLastError());
        return 2;
    }
    {   static const uint32_t cand[] = { 0x02000000u, 0x03000000u, 0x04000000u, 0x05000000u, 0x06000000u, 0x00800000u };
        for (unsigned ci = 0; ci < sizeof cand / sizeof cand[0] && !ARENA; ci++)
            if (VirtualAlloc((void *)(uintptr_t)cand[ci], ARENA_SZ, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE)) ARENA = cand[ci]; }
    if (!ARENA) {
        MEMORY_BASIC_INFORMATION mbi;
        VirtualQuery((void *)(uintptr_t)ARENA, &mbi, sizeof mbi);
        fprintf(stderr, "cannot map the arena at %#x (%lu); region base %p size %#lx state %#lx\n",
                ARENA, GetLastError(), mbi.BaseAddress, (unsigned long)mbi.RegionSize, mbi.State);
        return 2;
    }
    FILE *f = fopen(slice, "rb");
    if (!f) { fprintf(stderr, "cannot open %s\n", slice); return 2; }
    fseek(f, 0, SEEK_END); long n = ftell(f); fseek(f, 0, SEEK_SET);
    uint32_t skip = IMG_LO - 0x1000;               /* the slice starts at vm 0x1000 */
    long want = (long)IMG_SZ;
    if (n - (long)skip < want) want = n - (long)skip;
    fseek(f, (long)skip, SEEK_SET);
    if (fread((void *)(uintptr_t)IMG_LO, 1, (size_t)want, f) != (size_t)want) { fprintf(stderr, "short read\n"); return 2; }
    fclose(f);

    g_ram = 0;
    g_ram_size = 0xffffffffu;
    SetUnhandledExceptionFilter(crash_filter);
    CreateThread(0, 0, watchdog, 0, 0, 0);
    init_handlers();

    int total = 0, failed = 0, skipped_all = 0;
    for (int i = 0; i < g_ntests; i++) {
        const Test *t = &g_tests[i];
        if (only && strcmp(only, t->name)) continue;
        int skipped = 0, fs = 0;
        rs = 0x9e3779b97f4a7c15ull ^ ((uint64_t)i * 0x100000001b3ull);
        int fails = test_one(t, nsc, &skipped, &fs);
        total++;
        skipped_all += skipped;
        if (fails) { failed++; printf("FAIL %s\n", t->name); }
        else if (g_verbose) printf("ok   %s (skipped %d)\n", t->name, skipped);
        fflush(stdout);
    }
    printf("%d functions, %d failed, %d scenarios skipped (the oracle itself crashed)\n", total, failed, skipped_all);
    return failed ? 1 : 0;
}
