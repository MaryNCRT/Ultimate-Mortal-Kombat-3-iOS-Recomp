/*
 * test_limevector.c — verificacion del codigo recompilado de limeVector.cpp.
 *
 * Interes especial: `_Normalise` usa bloques IT (ejecucion condicional Thumb)
 * para tratar el vector de longitud cero. Ese camino solo se ejercita con la
 * entrada (0,0,0), asi que se prueba explicitamente: es la parte del
 * recompilador con mas riesgo de estar mal.
 */

#include "arm_runtime.h"
#include "limevector.h"

#include <math.h>
#include <stdio.h>
#include <string.h>

#define RAM_SIZE   (1u << 20)
#define STACK_TOP  0x000F0000u
#define VEC_A      0x00002000u

static int g_fail = 0;
static int g_checks = 0;

static void ctx_reset(arm_ctx *ctx)
{
    memset(ctx, 0, sizeof(*ctx));
    ctx->r[SP] = STACK_TOP;
}

static void vec_write(uint32_t a, float x, float y, float z)
{
    MEM_ST32(a + 0, F32_U32(x));
    MEM_ST32(a + 4, F32_U32(y));
    MEM_ST32(a + 8, F32_U32(z));
}

static void vec_read(uint32_t a, float *out)
{
    for (int i = 0; i < 3; i++) out[i] = U32_F32(MEM_LD32(a + 4u * i));
}

static int close_enough(float a, float b, float tol)
{
    float d = a - b;
    return (d < 0 ? -d : d) <= tol;
}

static void check(const char *what, int cond)
{
    g_checks++;
    if (cond) {
        printf("  ok    %s\n", what);
    } else {
        printf("  FALLO %s\n", what);
        g_fail++;
    }
}

static float call_len(float x, float y, float z)
{
    arm_ctx ctx; ctx_reset(&ctx);
    vec_write(VEC_A, x, y, z);
    ctx.r[0] = VEC_A;
    func_00061078_Len(&ctx);
    return U32_F32(ctx.r[0]);   /* AAPCS soft-float: retorno en r0 */
}

static void call_normalise(float x, float y, float z, float *out)
{
    arm_ctx ctx; ctx_reset(&ctx);
    vec_write(VEC_A, x, y, z);
    ctx.r[0] = VEC_A;
    func_000610a4_Normalise(&ctx);
    vec_read(VEC_A, out);
}

int main(void)
{
    arm_mem_init(RAM_SIZE);
    printf("=== verificacion del codigo recompilado de limeVector.cpp ===\n");

    printf("\n[1] _Len\n");
    char buf[128];
    float l;

    l = call_len(3.0f, 4.0f, 0.0f);
    snprintf(buf, sizeof(buf), "Len(3,4,0) == 5  (%.6f)", l);
    check(buf, close_enough(l, 5.0f, 1e-5f));

    l = call_len(1.0f, 2.0f, 2.0f);
    snprintf(buf, sizeof(buf), "Len(1,2,2) == 3  (%.6f)", l);
    check(buf, close_enough(l, 3.0f, 1e-5f));

    l = call_len(0.0f, 0.0f, 0.0f);
    snprintf(buf, sizeof(buf), "Len(0,0,0) == 0  (%.6f)", l);
    check(buf, close_enough(l, 0.0f, 1e-6f));

    l = call_len(-5.0f, 0.0f, 12.0f);
    snprintf(buf, sizeof(buf), "Len(-5,0,12) == 13  (%.6f)", l);
    check(buf, close_enough(l, 13.0f, 1e-4f));

    printf("\n[2] _Normalise\n");
    float v[3];

    call_normalise(3.0f, 4.0f, 0.0f, v);
    snprintf(buf, sizeof(buf), "Normalise(3,4,0) == (0.6, 0.8, 0)  (%.4f, %.4f, %.4f)",
             v[0], v[1], v[2]);
    check(buf, close_enough(v[0], 0.6f, 1e-5f) && close_enough(v[1], 0.8f, 1e-5f)
               && close_enough(v[2], 0.0f, 1e-6f));

    call_normalise(0.0f, 0.0f, 7.0f, v);
    check("Normalise(0,0,7) == (0,0,1)",
          close_enough(v[0], 0.0f, 1e-6f) && close_enough(v[1], 0.0f, 1e-6f)
          && close_enough(v[2], 1.0f, 1e-5f));

    call_normalise(1.0f, 2.0f, 2.0f, v);
    {
        float len = sqrtf(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
        snprintf(buf, sizeof(buf), "Normalise(1,2,2): longitud resultante == 1 (%.6f)", len);
        check(buf, close_enough(len, 1.0f, 1e-5f));
        check("Normalise(1,2,2): direccion preservada",
              close_enough(v[0] * 2.0f, v[1], 1e-5f)
              && close_enough(v[1], v[2], 1e-5f));
    }

    /* Camino del bloque IT: con longitud 0 el factor de escala es 1.0 y el
     * vector debe quedarse como estaba, sin dividir por cero. */
    call_normalise(0.0f, 0.0f, 0.0f, v);
    snprintf(buf, sizeof(buf), "Normalise(0,0,0) no produce NaN  (%.4f, %.4f, %.4f)",
             v[0], v[1], v[2]);
    check(buf, v[0] == v[0] && v[1] == v[1] && v[2] == v[2]);
    check("Normalise(0,0,0) deja el vector en cero (rama del bloque IT)",
          v[0] == 0.0f && v[1] == 0.0f && v[2] == 0.0f);

    printf("\n=====================================================\n");
    printf("comprobaciones: %d    fallos: %d\n", g_checks, g_fail);
    printf("%s\n", g_fail ? "RESULTADO: FALLO" : "RESULTADO: TODO CORRECTO");
    arm_mem_free();
    return g_fail ? 1 : 0;
}
