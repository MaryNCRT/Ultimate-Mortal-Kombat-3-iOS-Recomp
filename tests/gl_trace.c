/*
 * gl_trace.c -- the two faces of the recorder. See gl_trace.h for the argument.
 *
 * The clean side calls plain `glScalef(x, y, z)`; the oracle calls
 * `stub_auto_glScalef(ctx)` and the three floats arrive as raw words in r0-r3
 * because the ABI is soft-float. Both land in the same record shape, so the
 * comparison never has to know which side produced it.
 *
 * None of the GL entry points this engine uses takes more than four arguments,
 * so r0-r3 is the whole story and no stack reading is needed here.
 */
#include "gl_trace.h"
#include "arm_runtime.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

glt_log  glt_clean;
glt_log  glt_oracle;
glt_log *glt_active = &glt_clean;

void glt_reset(void)
{
    glt_clean.n = glt_clean.overflow = 0;
    glt_oracle.n = glt_oracle.overflow = 0;
}

void glt_select(glt_log *dst) { glt_active = dst; }

static uint32_t f2u(float f) { uint32_t u; memcpy(&u, &f, 4); return u; }

static glt_rec *push(const char *fn, int nargs)
{
    glt_log *L = glt_active;
    glt_rec *r;
    if (L->n >= GLT_MAX_CALLS) { L->overflow++; return NULL; }
    r = &L->rec[L->n++];
    memset(r, 0, sizeof(*r));
    r->fn = fn;
    r->nargs = nargs;
    return r;
}

static void set(glt_rec *r, int i, uint32_t v, int kind)
{
    if (r == NULL || i < 0 || i > 3) return;
    /* A GLT_PTR is recorded as NULLNESS on both sides. The clean side passes a
     * host pointer and the oracle a guest address, so the raw values can never
     * agree -- recording them verbatim on one side and a 0/1 on the other
     * manufactured a divergence for every array pointer in every draw. The
     * comparison has to be symmetric or it is not a comparison. */
    r->arg[i] = (kind == GLT_PTR) ? (v != 0u) : v;
    r->kind[i] = (uint8_t)kind;
}

/* A matrix argument: copy the sixteen floats so the POINTED-AT value is what
 * gets compared, not the pointer. `host` selects which memory to read. */
/* Two entry points on purpose. An earlier single function took the address as
 * a uint32_t for both sides, which TRUNCATED the clean side 64-bit host
 * pointer and then dereferenced the result -- a segfault, not a divergence,
 * and it cost a debugging round. A guest address is four bytes and a host
 * pointer is eight; one parameter cannot be both. */
static void set_mat_host(glt_rec *r, int i, const float *p)
{
    int k;
    if (r == NULL) return;
    r->arg[i] = (p != NULL);
    r->kind[i] = GLT_MAT4;
    if (p == NULL) return;
    for (k = 0; k < 16; k++) r->mat[k] = p[k];
}

static void set_mat_guest(glt_rec *r, int i, uint32_t p)
{
    int k;
    if (r == NULL) return;
    r->arg[i] = (p != 0u);
    r->kind[i] = GLT_MAT4;
    if (p == 0u) return;
    for (k = 0; k < 16; k++) {
        uint32_t bits = MEM_LD32(p + 4u * (uint32_t)k);
        memcpy(&r->mat[k], &bits, 4);
    }
}


/* ===================================================================== */
/* clean side -- the prototypes lime.h declares                           */
/* ===================================================================== */

void glPushMatrix(void)   { push("glPushMatrix", 0); }
void glPopMatrix(void)    { push("glPopMatrix", 0); }
void glLoadIdentity(void) { push("glLoadIdentity", 0); }
void glFlush(void)        { push("glFlush", 0); }

void glEnable(unsigned c)             { set(push("glEnable", 1), 0, c, GLT_SCALAR); }
void glDisable(unsigned c)            { set(push("glDisable", 1), 0, c, GLT_SCALAR); }
void glEnableClientState(unsigned a)  { set(push("glEnableClientState", 1), 0, a, GLT_SCALAR); }
void glDisableClientState(unsigned a) { set(push("glDisableClientState", 1), 0, a, GLT_SCALAR); }
void glClientActiveTexture(unsigned u){ set(push("glClientActiveTexture", 1), 0, u, GLT_SCALAR); }
void glActiveTexture(unsigned u)      { set(push("glActiveTexture", 1), 0, u, GLT_SCALAR); }
void glMatrixMode(unsigned m)         { set(push("glMatrixMode", 1), 0, m, GLT_SCALAR); }
void glShadeModel(unsigned m)         { set(push("glShadeModel", 1), 0, m, GLT_SCALAR); }
void glCullFace(unsigned m)           { set(push("glCullFace", 1), 0, m, GLT_SCALAR); }
void glDepthMask(int f)               { set(push("glDepthMask", 1), 0, (uint32_t)f, GLT_SCALAR); }

void glBindTexture(unsigned t, unsigned n)
{
    glt_rec *r = push("glBindTexture", 2);
    set(r, 0, t, GLT_SCALAR); set(r, 1, n, GLT_SCALAR);
}

void glBlendFunc(unsigned s, unsigned d)
{
    glt_rec *r = push("glBlendFunc", 2);
    set(r, 0, s, GLT_SCALAR); set(r, 1, d, GLT_SCALAR);
}

void glAlphaFunc(unsigned f, float ref)
{
    glt_rec *r = push("glAlphaFunc", 2);
    set(r, 0, f, GLT_SCALAR); set(r, 1, f2u(ref), GLT_SCALAR);
}

void glTexEnvf(unsigned t, unsigned p, float v)
{
    glt_rec *r = push("glTexEnvf", 3);
    set(r, 0, t, GLT_SCALAR); set(r, 1, p, GLT_SCALAR); set(r, 2, f2u(v), GLT_SCALAR);
}

void glScalef(float x, float y, float z)
{
    glt_rec *r = push("glScalef", 3);
    set(r, 0, f2u(x), GLT_SCALAR); set(r, 1, f2u(y), GLT_SCALAR); set(r, 2, f2u(z), GLT_SCALAR);
}

void glTranslatef(float x, float y, float z)
{
    glt_rec *r = push("glTranslatef", 3);
    set(r, 0, f2u(x), GLT_SCALAR); set(r, 1, f2u(y), GLT_SCALAR); set(r, 2, f2u(z), GLT_SCALAR);
}

void glColor4f(float a, float b, float c, float d)
{
    glt_rec *r = push("glColor4f", 4);
    set(r, 0, f2u(a), GLT_SCALAR); set(r, 1, f2u(b), GLT_SCALAR);
    set(r, 2, f2u(c), GLT_SCALAR); set(r, 3, f2u(d), GLT_SCALAR);
}

void glMultMatrixf(const float *m)
{
    set_mat_host(push("glMultMatrixf", 1), 0, m);
}

static void ptr_call(const char *fn, int size, unsigned type, int stride, const void *p)
{
    glt_rec *r = push(fn, 4);
    set(r, 0, (uint32_t)size, GLT_SCALAR);
    set(r, 1, type, GLT_SCALAR);
    set(r, 2, (uint32_t)stride, GLT_SCALAR);
    set(r, 3, (p != NULL), GLT_PTR);
}

void glVertexPointer(int s, unsigned t, int st, const void *p)   { ptr_call("glVertexPointer", s, t, st, p); }
void glTexCoordPointer(int s, unsigned t, int st, const void *p) { ptr_call("glTexCoordPointer", s, t, st, p); }
void glColorPointer(int s, unsigned t, int st, const void *p)    { ptr_call("glColorPointer", s, t, st, p); }

void glDrawElements(unsigned mode, int count, unsigned type, const void *idx)
{
    glt_rec *r = push("glDrawElements", 4);
    set(r, 0, mode, GLT_SCALAR);
    set(r, 1, (uint32_t)count, GLT_SCALAR);
    set(r, 2, type, GLT_SCALAR);
    set(r, 3, (idx != NULL), GLT_PTR);
}

void glDeleteTextures(int n, const unsigned *t)
{
    glt_rec *r = push("glDeleteTextures", 2);
    set(r, 0, (uint32_t)n, GLT_SCALAR);
    set(r, 1, (t != NULL), GLT_PTR);
}


/* ===================================================================== */
/* oracle side -- the same calls, arriving as a register file             */
/* ===================================================================== */

#define R(n) (ctx->r[n])

#define GL0(name) \
    void stub_auto_##name(arm_ctx *ctx) { (void)ctx; push(#name, 0); }

#define GL1(name, k0) \
    void stub_auto_##name(arm_ctx *ctx) { set(push(#name, 1), 0, R(0), k0); }

#define GL2(name, k0, k1) \
    void stub_auto_##name(arm_ctx *ctx) { \
        glt_rec *r = push(#name, 2); \
        set(r, 0, R(0), k0); set(r, 1, R(1), k1); }

#define GL3(name, k0, k1, k2) \
    void stub_auto_##name(arm_ctx *ctx) { \
        glt_rec *r = push(#name, 3); \
        set(r, 0, R(0), k0); set(r, 1, R(1), k1); set(r, 2, R(2), k2); }

#define GL4(name, k0, k1, k2, k3) \
    void stub_auto_##name(arm_ctx *ctx) { \
        glt_rec *r = push(#name, 4); \
        set(r, 0, R(0), k0); set(r, 1, R(1), k1); \
        set(r, 2, R(2), k2); set(r, 3, R(3), k3); }

GL0(glPushMatrix)
GL0(glPopMatrix)
GL0(glFlush)

GL1(glEnable, GLT_SCALAR)
GL1(glDisable, GLT_SCALAR)
GL1(glEnableClientState, GLT_SCALAR)
GL1(glDisableClientState, GLT_SCALAR)
GL1(glClientActiveTexture, GLT_SCALAR)
GL1(glActiveTexture, GLT_SCALAR)
GL1(glDepthMask, GLT_SCALAR)

GL2(glBindTexture, GLT_SCALAR, GLT_SCALAR)
GL2(glBlendFunc, GLT_SCALAR, GLT_SCALAR)
GL2(glAlphaFunc, GLT_SCALAR, GLT_SCALAR)
GL2(glDeleteTextures, GLT_SCALAR, GLT_PTR)

GL3(glTexEnvf, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR)
GL3(glScalef, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR)
GL3(glTranslatef, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR)

GL4(glColor4f, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR)
GL4(glVertexPointer, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR, GLT_PTR)
GL4(glTexCoordPointer, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR, GLT_PTR)
GL4(glColorPointer, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR, GLT_PTR)
GL4(glDrawElements, GLT_SCALAR, GLT_SCALAR, GLT_SCALAR, GLT_PTR)

/* The pointer args above are recorded as nullness on both sides, so the
 * comparison stays symmetric. */
void stub_auto_glMultMatrixf(arm_ctx *ctx)
{
    set_mat_guest(push("glMultMatrixf", 1), 0, R(0));
}

/* Integer modulo. Real code, not a stub: the frame walk depends on it and a
 * wrong remainder would move every key lookup. */
void stub_auto_modsi3(arm_ctx *ctx)
{
    int32_t a = (int32_t)R(0), b = (int32_t)R(1);
    ctx->r[0] = (uint32_t)(b == 0 ? 0 : a % b);
}

/* Neither should be reached by the scene renderers. If one is, say so rather
 * than continuing quietly with a wrong trace. */
void stub_auto_objc_msgSend(arm_ctx *ctx)
{
    arm_unimplemented("stub_auto_objc_msgSend", 0u,
                      "objc_msgSend reached from a scene renderer");
    (void)ctx;
}

void stub_auto_sprintf_chk(arm_ctx *ctx)
{
    if (R(0)) MEM_ST8(R(0), 0u);        /* leave a valid empty string */
    ctx->r[0] = 0u;
}


/* ===================================================================== */

static int arg_eq(const glt_rec *a, const glt_rec *b, int i, int *ptr_only)
{
    if (a->kind[i] != b->kind[i]) return 0;
    if (a->kind[i] == GLT_PTR) { (*ptr_only)++; return a->arg[i] == b->arg[i]; }
    if (a->kind[i] == GLT_MAT4) {
        if (a->arg[i] != b->arg[i]) return 0;
        return a->arg[i] == 0u || memcmp(a->mat, b->mat, sizeof(a->mat)) == 0;
    }
    return a->arg[i] == b->arg[i];
}

int glt_compare(const char *what, int *ptr_only)
{
    int n = glt_clean.n < glt_oracle.n ? glt_clean.n : glt_oracle.n;
    int bad = 0, i, k, po = 0;

    if (glt_clean.overflow || glt_oracle.overflow) {
        printf("  DIVERGE %s: trace overflowed (clean=%d oracle=%d)\n",
               what, glt_clean.overflow, glt_oracle.overflow);
        bad++;
    }

    if (glt_clean.n != glt_oracle.n) {
        printf("  DIVERGE %s: %d GL calls clean vs %d oracle\n",
               what, glt_clean.n, glt_oracle.n);
        bad++;
    }

    for (i = 0; i < n; i++) {
        const glt_rec *c = &glt_clean.rec[i], *o = &glt_oracle.rec[i];
        if (strcmp(c->fn, o->fn) != 0) {
            printf("  DIVERGE %s call %d: clean=%s  oracle=%s\n", what, i, c->fn, o->fn);
            bad++;
            break;                      /* out of step: later calls are noise */
        }
        for (k = 0; k < c->nargs; k++) {
            if (!arg_eq(c, o, k, &po)) {
                printf("  DIVERGE %s call %d %s arg%d: clean=0x%08x  oracle=0x%08x\n",
                       what, i, c->fn, k, c->arg[k], o->arg[k]);
                bad++;
            }
        }
    }

    if (bad && getenv("GLT_DUMP")) {
        glt_dump(&glt_clean,  "clean",  64);
        glt_dump(&glt_oracle, "oracle", 64);
    }

    if (ptr_only) *ptr_only += po;
    return bad;
}

void glt_dump(const glt_log *log, const char *label, int limit)
{
    int i, k;
    printf("  --- %s: %d calls ---\n", label, log->n);
    for (i = 0; i < log->n && i < limit; i++) {
        const glt_rec *r = &log->rec[i];
        printf("    %3d  %-22s", i, r->fn);
        for (k = 0; k < r->nargs; k++) printf(" 0x%08x", r->arg[k]);
        printf("\n");
    }
}
