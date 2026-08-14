/*
 * test_matrix.c — verificacion diferencial del codigo recompilado de Matrix.cpp.
 *
 * Estrategia: no basta con que el C generado compile; hay que demostrar que
 * calcula lo mismo que el original. Se usan dos clases de prueba:
 *
 *   1. Comparacion contra una implementacion de referencia escrita a mano
 *      (identidad, copia, rotaciones, escalado).
 *   2. Invariantes matematicas que deben cumplirse sea cual sea la convencion
 *      interna de la matriz (fila/columna): A*I == A, R(a)*R(b) == R(a+b),
 *      R(t)*R(-t) == I, ortonormalidad y determinante 1.
 *
 * Las invariantes son las pruebas fuertes: pasan solo si la aritmetica es
 * correcta, y no dependen de que hayamos adivinado bien el layout.
 */

#include "arm_runtime.h"
#include "matrix.h"

#include <math.h>
#include <stdio.h>
#include <string.h>

/* ---- disposicion de la memoria del invitado ---- */
#define RAM_SIZE   (1u << 20)
#define STACK_TOP  0x000F0000u
#define MAT_A      0x00001000u
#define MAT_B      0x00001100u
#define MAT_C      0x00001200u
#define MAT_D      0x00001300u

static int g_fail = 0;
static int g_checks = 0;

/* ---- utilidades ---- */

static void ctx_reset(arm_ctx *ctx)
{
    memset(ctx, 0, sizeof(*ctx));
    ctx->r[SP] = STACK_TOP;
}

static void mat_write(uint32_t addr, const float *m)
{
    for (int i = 0; i < 16; i++) MEM_ST32(addr + 4u * i, F32_U32(m[i]));
}

static void mat_read(uint32_t addr, float *m)
{
    for (int i = 0; i < 16; i++) m[i] = U32_F32(MEM_LD32(addr + 4u * i));
}

static int close_enough(float a, float b, float tol)
{
    float d = a - b;
    if (d < 0) d = -d;
    return d <= tol;
}

static void check_mat(const char *what, const float *got, const float *want, float tol)
{
    g_checks++;
    for (int i = 0; i < 16; i++) {
        if (!close_enough(got[i], want[i], tol)) {
            printf("  FALLO %-42s  elemento %2d: obtenido %+.7f, esperado %+.7f\n",
                   what, i, got[i], want[i]);
            printf("     obtenido:");
            for (int k = 0; k < 16; k++) printf(" %+.4f", got[k]);
            printf("\n     esperado:");
            for (int k = 0; k < 16; k++) printf(" %+.4f", want[k]);
            printf("\n");
            g_fail++;
            return;
        }
    }
    printf("  ok    %s\n", what);
}

static void check_true(const char *what, int cond)
{
    g_checks++;
    if (cond) {
        printf("  ok    %s\n", what);
    } else {
        printf("  FALLO %s\n", what);
        g_fail++;
    }
}

/* ---- referencias escritas a mano ---- */

static void ref_identity(float *m)
{
    memset(m, 0, 16 * sizeof(float));
    m[0] = m[5] = m[10] = m[15] = 1.0f;
}

/* Derivada del desensamblado de _RotMatrixZ:
 *   m[0] = cos, m[1] = sin, m[4] = -sin, m[5] = cos, resto identidad. */
static void ref_rot_z(float *m, float t)
{
    ref_identity(m);
    m[0] = cosf(t); m[1] = sinf(t);
    m[4] = -sinf(t); m[5] = cosf(t);
}

/* Multiplicacion de referencia en la convencion "fila por columna"
 * out[i][j] = sum_k A[i][k] * B[k][j], con indices lineales fila-mayor. */
static void ref_mul(float *out, const float *a, const float *b)
{
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++) {
            float s = 0.0f;
            for (int k = 0; k < 4; k++) s += a[i * 4 + k] * b[k * 4 + j];
            out[i * 4 + j] = s;
        }
}

/* ---- envoltorios de llamada ---- */

static void call_identity(uint32_t mat)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = mat;
    func_0005dfe8_limeMatrixLoadIdentity(&ctx);
}

static void call_copy(uint32_t src, uint32_t dst)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = src; ctx.r[1] = dst;
    func_0005dfbc_limeMatrixCopy(&ctx);
}

static void call_rot_z(uint32_t mat, float t)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = mat; ctx.r[1] = F32_U32(t);
    func_0005e010_RotMatrixZ(&ctx);
}

static void call_rot_y(uint32_t mat, float t)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = mat; ctx.r[1] = F32_U32(t);
    func_0005e040_RotMatrixY(&ctx);
}

static void call_rot_x(uint32_t mat, float t)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = mat; ctx.r[1] = F32_U32(t);
    func_0005e070_RotMatrixX(&ctx);
}

static void call_scale(uint32_t mat, float s)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = mat; ctx.r[1] = F32_U32(s);
    func_0005daac_limeScaleMatrix(&ctx);
}

static void call_scale_xyz(uint32_t mat, float x, float y, float z)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = mat;
    ctx.r[1] = F32_U32(x); ctx.r[2] = F32_U32(y); ctx.r[3] = F32_U32(z);
    func_0005db20_limeScaleMatrixXYZ(&ctx);
}

static void call_mul(uint32_t a, uint32_t b, uint32_t out)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = a; ctx.r[1] = b; ctx.r[2] = out;
    func_0005db9c_limeMatrixMult(&ctx);
}

/* ---- pruebas ---- */

static void test_identity(void)
{
    printf("\n[1] limeMatrixLoadIdentity\n");
    float got[16], want[16];
    memset(got, 0xAA, sizeof(got));
    mat_write(MAT_A, got);
    call_identity(MAT_A);
    mat_read(MAT_A, got);
    ref_identity(want);
    check_mat("identidad == I", got, want, 0.0f);
}

static void test_copy(void)
{
    printf("\n[2] limeMatrixCopy\n");
    float src[16], got[16];
    for (int i = 0; i < 16; i++) src[i] = (float)(i + 1) * 1.5f;
    mat_write(MAT_A, src);
    memset(got, 0, sizeof(got));
    mat_write(MAT_B, got);
    call_copy(MAT_A, MAT_B);
    mat_read(MAT_B, got);
    check_mat("copia(A -> B), B == A", got, src, 0.0f);
}

static void test_rotations(void)
{
    printf("\n[3] RotMatrixZ / Y / X\n");
    float got[16], want[16];
    const float t = 0.7f;

    call_rot_z(MAT_A, t);
    mat_read(MAT_A, got);
    ref_rot_z(want, t);
    check_mat("RotMatrixZ(0.7) contra referencia", got, want, 1e-6f);

    /* Para X e Y no asumimos la formula: comprobamos que son rotaciones
     * validas (ortonormales, determinante +1). */
    void (*rots[2])(uint32_t, float) = { call_rot_y, call_rot_x };
    const char *names[2] = { "RotMatrixY", "RotMatrixX" };
    for (int r = 0; r < 2; r++) {
        rots[r](MAT_A, t);
        mat_read(MAT_A, got);
        int ortho = 1;
        for (int i = 0; i < 3 && ortho; i++)
            for (int j = 0; j < 3; j++) {
                float d = 0.0f;
                for (int k = 0; k < 3; k++) d += got[i * 4 + k] * got[j * 4 + k];
                if (!close_enough(d, i == j ? 1.0f : 0.0f, 1e-5f)) { ortho = 0; break; }
            }
        char buf[96];
        snprintf(buf, sizeof(buf), "%s(0.7): la 3x3 es ortonormal", names[r]);
        check_true(buf, ortho);

        float det = got[0] * (got[5] * got[10] - got[6] * got[9])
                  - got[1] * (got[4] * got[10] - got[6] * got[8])
                  + got[2] * (got[4] * got[9]  - got[5] * got[8]);
        snprintf(buf, sizeof(buf), "%s(0.7): determinante == +1 (%.6f)", names[r], det);
        check_true(buf, close_enough(det, 1.0f, 1e-5f));
    }
}

static void test_scale(void)
{
    printf("\n[4] limeScaleMatrix / limeScaleMatrixXYZ\n");
    float got[16], want[16];

    call_identity(MAT_A);
    call_scale(MAT_A, 3.0f);
    mat_read(MAT_A, got);
    ref_identity(want);
    want[0] = want[5] = want[10] = 3.0f;
    check_mat("escalar I por 3 -> diag(3,3,3,1)", got, want, 1e-6f);

    call_identity(MAT_A);
    call_scale_xyz(MAT_A, 2.0f, 4.0f, 8.0f);
    mat_read(MAT_A, got);
    ref_identity(want);
    want[0] = 2.0f; want[5] = 4.0f; want[10] = 8.0f;
    check_mat("escalarXYZ I por (2,4,8)", got, want, 1e-6f);
}

static void test_mult(void)
{
    printf("\n[5] limeMatrixMult\n");
    float a[16], b[16], got[16], want[16];

    /* A * I == A  — invariante, independiente de la convencion */
    for (int i = 0; i < 16; i++) a[i] = (float)(i * 7 % 13) - 6.0f;
    mat_write(MAT_A, a);
    call_identity(MAT_B);
    call_mul(MAT_A, MAT_B, MAT_C);
    mat_read(MAT_C, got);
    check_mat("A * I == A", got, a, 1e-5f);

    /* I * A == A */
    call_identity(MAT_B);
    call_mul(MAT_B, MAT_A, MAT_C);
    mat_read(MAT_C, got);
    check_mat("I * A == A", got, a, 1e-5f);

    /* RotZ(a) * RotZ(b) == RotZ(a+b) — invariante fuerte */
    call_rot_z(MAT_A, 0.3f);
    call_rot_z(MAT_B, 0.4f);
    call_mul(MAT_A, MAT_B, MAT_C);
    mat_read(MAT_C, got);
    call_rot_z(MAT_D, 0.7f);
    mat_read(MAT_D, want);
    check_mat("RotZ(0.3) * RotZ(0.4) == RotZ(0.7)", got, want, 1e-5f);

    /* RotZ(t) * RotZ(-t) == I */
    call_rot_z(MAT_A, 1.1f);
    call_rot_z(MAT_B, -1.1f);
    call_mul(MAT_A, MAT_B, MAT_C);
    mat_read(MAT_C, got);
    ref_identity(want);
    check_mat("RotZ(1.1) * RotZ(-1.1) == I", got, want, 1e-5f);

    /* Contra la multiplicacion de referencia fila-por-columna */
    for (int i = 0; i < 16; i++) {
        a[i] = (float)((i * 3) % 7) - 3.0f;
        b[i] = (float)((i * 5) % 11) - 5.0f;
    }
    mat_write(MAT_A, a);
    mat_write(MAT_B, b);
    call_mul(MAT_A, MAT_B, MAT_C);
    mat_read(MAT_C, got);
    ref_mul(want, a, b);
    check_mat("A * B contra referencia fila-por-columna", got, want, 1e-4f);
}

/*
 * CreatePerspectiveMatrix(float *mat, float fov, float aspect,
 *                         float zNear, float zFar)
 * Los cuatro primeros argumentos van en r0-r3; el quinto, en la pila.
 * Es el punto de enganche para widescreen: `aspect` divide el termino X.
 */
static void call_perspective(uint32_t mat, float fov, float aspect,
                             float znear, float zfar)
{
    arm_ctx ctx; ctx_reset(&ctx);
    ctx.r[0] = mat;
    ctx.r[1] = F32_U32(fov);
    ctx.r[2] = F32_U32(aspect);
    ctx.r[3] = F32_U32(znear);
    /* quinto argumento en [sp] segun AAPCS */
    ctx.r[SP] -= 16;
    MEM_ST32(ctx.r[SP], F32_U32(zfar));
    func_0005e0a0_CreatePerspectiveMatrix(&ctx);
}

static void test_perspective(void)
{
    printf("\n[6] CreatePerspectiveMatrix (gancho de widescreen)\n");
    float m[16], m2[16];
    const float fov = 0.6f, znear = 1.0f, zfar = 1000.0f;

    call_perspective(MAT_A, fov, 4.0f / 3.0f, znear, zfar);
    mat_read(MAT_A, m);

    check_true("m[14] == -1 (proyeccion perspectiva)", close_enough(m[14], -1.0f, 1e-6f));
    check_true("m[15] == 0", close_enough(m[15], 0.0f, 1e-6f));

    /* Terminos de profundidad estandar de una perspectiva OpenGL */
    float want10 = (zfar + znear) / (znear - zfar);
    float want11 = 2.0f * zfar * znear / (znear - zfar);
    char buf[128];
    snprintf(buf, sizeof(buf), "m[10] == (f+n)/(n-f)  (%.6f vs %.6f)", m[10], want10);
    check_true(buf, close_enough(m[10], want10, 1e-4f));
    snprintf(buf, sizeof(buf), "m[11] == 2fn/(n-f)    (%.4f vs %.4f)", m[11], want11);
    check_true(buf, close_enough(m[11], want11, 1e-2f));

    /* Relacion clave para widescreen: m[0] = m[5] / aspect */
    check_true("m[0] == m[5] / aspect  (4:3)",
               close_enough(m[0], m[5] / (4.0f / 3.0f), 1e-5f));

    /* Cambiar solo el aspect debe alterar X y dejar Y intacto: es exactamente
     * lo que necesita el parche de widescreen. */
    call_perspective(MAT_B, fov, 16.0f / 9.0f, znear, zfar);
    mat_read(MAT_B, m2);
    check_true("con 16:9, m[5] no cambia", close_enough(m2[5], m[5], 1e-6f));
    check_true("con 16:9, m[0] == m[5]/(16/9)",
               close_enough(m2[0], m[5] / (16.0f / 9.0f), 1e-5f));
    check_true("con 16:9, el campo de vision horizontal es mayor", m2[0] < m[0]);
}

int main(void)
{
    arm_mem_init(RAM_SIZE);
    printf("=== verificacion del codigo recompilado de Matrix.cpp ===\n");

    test_identity();
    test_copy();
    test_rotations();
    test_scale();
    test_mult();
    test_perspective();

    printf("\n=====================================================\n");
    printf("comprobaciones: %d    fallos: %d\n", g_checks, g_fail);
    printf("%s\n", g_fail ? "RESULTADO: FALLO" : "RESULTADO: TODO CORRECTO");
    arm_mem_free();
    return g_fail ? 1 : 0;
}
