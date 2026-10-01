/*
 * gl_trace.h -- record the GL call stream from both sides and compare them.
 *
 * ## Why this exists
 *
 * docs/ENCARGO.md said closing RenderScene.cpp needed "pairing each GL enum
 * with the call that consumes it", and that doing so "means tracking register
 * liveness, not reading more literals". That is true of STATIC analysis: the
 * compiler interleaves the loads, so a `GL_VERTEX_ARRAY` sitting directly
 * before a `glClientActiveTexture` belongs to some later call and reading it
 * in place gets it wrong.
 *
 * But the oracle does not read the code, it RUNS it. recomp.py emits every
 * import as `stub_auto_glXxx(arm_ctx *ctx)`, handing us the full register file
 * at the instant of the call. Whatever value actually reaches r0 is simply
 * there. No liveness analysis is required -- the pairing is measured, not
 * inferred, and it is measured from the shipped instruction sequence.
 *
 * That is the same move that settled the debug-window stride: where one
 * decoding of the bytes is blind, the other sometimes is not.
 *
 * ## What is compared, and how honestly
 *
 * Each argument carries a kind, because not all of them can be compared:
 *
 *   GLT_SCALAR  enums, counts, sizes, strides, booleans, and floats by their
 *               BIT PATTERN. Compared exactly. This is the part that answers
 *               the pairing question.
 *
 *   GLT_MAT4    a `const float *` to sixteen floats. The pointer values differ
 *               (guest address vs host pointer) so the POINTED-AT MATRIX is
 *               compared instead, bit for bit. This is the strongest check
 *               here -- it is the actual transform handed to GL.
 *
 *   GLT_PTR     a pointer whose length is not known from the call alone
 *               (vertex and texcoord arrays). Compared only as null vs
 *               non-null, and that limit is reported in the summary rather
 *               than hidden. A divergence in the DATA behind these pointers
 *               would not be caught here.
 *
 * Order matters: the traces are compared call by call, so a missing, extra or
 * reordered GL call fails.
 */
#ifndef UMK3_GL_TRACE_H
#define UMK3_GL_TRACE_H

#include <stdint.h>

#define GLT_MAX_CALLS 4096

enum { GLT_SCALAR = 0, GLT_PTR = 1, GLT_MAT4 = 2 };

typedef struct {
    const char *fn;
    int         nargs;
    uint32_t    arg[4];
    uint8_t     kind[4];
    float       mat[16];        /* filled when a kind is GLT_MAT4 */
} glt_rec;

typedef struct {
    glt_rec rec[GLT_MAX_CALLS];
    int     n;
    int     overflow;
} glt_log;

/* Which log the next recorded call lands in. The clean C calls plain glXxx();
 * the oracle calls stub_auto_glXxx(). Both funnel here. */
extern glt_log *glt_active;
extern glt_log  glt_clean;
extern glt_log  glt_oracle;

void glt_reset(void);
void glt_select(glt_log *dst);

/* Compare the two logs. Prints every divergence. Returns the number found, and
 * reports through *ptr_only how many arguments could only be checked for
 * nullness, so a clean result never overstates itself. */
int  glt_compare(const char *what, int *ptr_only);

/* A one-line dump, for reading a call stream by eye when it does diverge. */
void glt_dump(const glt_log *log, const char *label, int limit);

/* GL entry points this recorder defines that lime.h does not declare, because
 * the clean engine never calls them directly -- they arrive from the iOS layer
 * that a test has to supply for itself. */
void glBlendFunc(unsigned sfactor, unsigned dfactor);
void glAlphaFunc(unsigned func, float ref);
void glDeleteTextures(int n, const unsigned *textures);
void glFlush(void);

#endif /* UMK3_GL_TRACE_H */
