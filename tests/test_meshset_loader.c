/*
 * test_meshset_loader.c — el cargador ORIGINAL contra nuestro parser.
 *
 * Ejecuta el _LIME_LoadMeshSet recompilado (fiel por construccion) sobre los
 * archivos .meshset reales del juego y comprueba que lo que deja en memoria
 * coincide con lo que OUTPUT/meshset-format.md dice que deberia dejar.
 *
 * Es la validacion mas fuerte que se puede hacer del formato: no compara dos
 * lecturas nuestras, compara NUESTRO entendimiento contra EL CODIGO DE EA
 * ejecutandose sobre los datos de EA.
 *
 * Uso:  test_meshset_loader.exe <dir_res> [archivo.meshset]
 *       sin segundo argumento recorre todos los .meshset del directorio.
 */

#include "arm_runtime.h"
#include "rendermesh.h"

#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define RAM_SIZE   (64u << 20)
#define STACK_TOP  0x03F00000u
#define PATH_BUF   0x00700000u   /* entre la imagen y el monton */

/* Offsets verificados de MESHSETINFO (0x4C) y MESHINFO (0x58). */
#define MS_NAME        0x00
#define MS_TEXLOADED   0x40
#define MS_NUMMESHES   0x44
#define MS_MESHES      0x48

#define MI_NUMVERTS    0x00
#define MI_NUMFACES    0x04
#define MI_RADIUS      0x10
#define MI_VERTS       0x18
#define MI_INDICES     0x1C
#define MI_VERTLIGHT   0x24
#define MI_MESHNAME    0x3C
#define MI_TEXNAME     0x40
#define MI_FULLBRIGHT  0x50

static int g_fail = 0;
static int  g_short_light_warned = 0;
static long g_short_light = 0;
static long g_files = 0, g_meshes = 0, g_verts = 0, g_tris = 0, g_skipped = 0;

/*
 * ¿Encaja el archivo en la variante A (cabecera 140 B, vertice 26 B)?
 *
 * Hace falta comprobarlo antes de invocar al cargador: _LIME_LoadMeshSet
 * asume SIEMPRE la variante A, asi que con los 25 archivos de escenario
 * (variantes B y C) lee conteos disparatados e intenta reservar cientos de
 * megabytes. Esos los carga otra ruta del motor, no esta.
 */
static int is_variant_a(const unsigned char *raw, long fsz)
{
    if (fsz < 4) return 0;
    int32_t num;
    memcpy(&num, raw, 4);
    if (num <= 0 || num > 4096) return 0;

    size_t off = 4;
    for (int i = 0; i < num; i++) {
        if (off + 140 > (size_t)fsz) return 0;
        int32_t nv, nf;
        memcpy(&nv, raw + off + 128, 4);
        memcpy(&nf, raw + off + 132, 4);
        if (nv < 0 || nf < 0 || nv > 4000000 || nf > 4000000) return 0;
        off += 140 + (size_t)nf * 6 + (size_t)nv * 26;
        if (off > (size_t)fsz) return 0;
    }
    return 1;
}

static void fail(const char *file, const char *what)
{
    printf("  FALLO %-38s %s\n", file, what);
    g_fail++;
}

/* Ejecuta el cargador original y devuelve el puntero invitado a MESHSETINFO. */
static uint32_t run_loader(const char *relpath, int useLighting)
{
    arm_ctx ctx;
    memset(&ctx, 0, sizeof(ctx));
    ctx.r[SP] = STACK_TOP;

    size_t n = strlen(relpath) + 1;
    memcpy(g_ram + PATH_BUF, relpath, n);

    ctx.r[0] = PATH_BUF;
    ctx.r[1] = (uint32_t)useLighting;
    func_0005ea34_LIME_LoadMeshSet(&ctx);
    return ctx.r[0];
}

/* Relee el archivo por nuestra cuenta y contrasta con lo que dejo el cargador. */
static void check_file(const char *root, const char *fname)
{
    char full[1024];
    snprintf(full, sizeof(full), "%s/%s", root, fname);

    FILE *f = fopen(full, "rb");
    if (!f) {
        return;
    }
    fseek(f, 0, SEEK_END);
    long fsz = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (fsz <= 0) {
        fclose(f);
        return;   /* LAVALEVEL0.meshset esta vacio */
    }
    unsigned char *raw = (unsigned char *)malloc((size_t)fsz);
    if (fread(raw, 1, (size_t)fsz, f) != (size_t)fsz) {
        fclose(f); free(raw); return;
    }
    fclose(f);

    if (!is_variant_a(raw, fsz)) {
        g_skipped++;
        free(raw);
        return;
    }

    /* Se pide CON iluminacion: es el camino que rellena vertLight y por tanto
     * el que se puede verificar. Con useLighting=0 el original salta el memset
     * y deja el buffer sin inicializar (ver nota en meshset-format.md). */
    guest_heap_init();
    uint32_t set = run_loader(fname, 1);

    /* ¿existe el .lighting que le corresponde? */
    char lightpath[1024];
    snprintf(lightpath, sizeof(lightpath), "%s/STATICLIGHTING/%.*s.lighting",
             root, (int)(strlen(fname) - 8), fname);
    FILE *lf = fopen(lightpath, "rb");
    unsigned char *light = NULL;
    long lightsz = 0;
    if (lf) {
        fseek(lf, 0, SEEK_END); lightsz = ftell(lf); fseek(lf, 0, SEEK_SET);
        if (lightsz > 0) {
            light = (unsigned char *)malloc((size_t)lightsz);
            if (fread(light, 1, (size_t)lightsz, lf) != (size_t)lightsz) {
                free(light); light = NULL;
            }
        }
        fclose(lf);
    }
    size_t light_off = 0;
    if (!set) {
        fail(fname, "el cargador devolvio NULL");
        free(raw);
        return;
    }
    g_files++;

    int32_t num_file = 0;
    memcpy(&num_file, raw, 4);
    int32_t num_mem = (int32_t)MEM_LD32(set + MS_NUMMESHES);
    if (num_file != num_mem) {
        char msg[128];
        snprintf(msg, sizeof(msg), "numMeshes: archivo=%d memoria=%d", num_file, num_mem);
        fail(fname, msg);
        free(raw);
        return;
    }

    /* El cargador copia el nombre del archivo al principio del struct. */
    char nm[80];
    guest_read_cstr(set + MS_NAME, nm, sizeof(nm));
    if (strcmp(nm, fname) != 0) {
        fail(fname, "MESHSETINFO.name no coincide con el nombre del archivo");
    }

    uint32_t meshes = MEM_LD32(set + MS_MESHES);
    size_t off = 4;

    for (int i = 0; i < num_mem; i++) {
        uint32_t mi = MEM_LD32(meshes + 4u * (uint32_t)i);
        if (!mi) {
            fail(fname, "puntero a MESHINFO nulo");
            break;
        }

        /* Cabecera segun nuestra documentacion: 140 bytes (variante A). */
        char fname_mesh[80], fname_tex[80];
        memcpy(fname_mesh, raw + off, 64);        fname_mesh[64] = 0;
        memcpy(fname_tex,  raw + off + 64, 64);   fname_tex[64]  = 0;
        int32_t nv, nf; float rad;
        memcpy(&nv,  raw + off + 128, 4);
        memcpy(&nf,  raw + off + 132, 4);
        memcpy(&rad, raw + off + 136, 4);
        off += 140;

        if ((int32_t)MEM_LD32(mi + MI_NUMVERTS) != nv) { fail(fname, "numVerts"); break; }
        if ((int32_t)MEM_LD32(mi + MI_NUMFACES) != nf) { fail(fname, "numFaces"); break; }
        float grad = U32_F32(MEM_LD32(mi + MI_RADIUS));
        if (memcmp(&grad, &rad, 4) != 0) {
            char msg[160];
            snprintf(msg, sizeof(msg),
                     "boundsRadius: archivo=%.6f (0x%08x) memoria=%.6f (0x%08x)",
                     rad, F32_U32(rad), grad, MEM_LD32(mi + MI_RADIUS));
            fail(fname, msg);
            break;
        }

        char gm[80], gt[80];
        guest_read_cstr(MEM_LD32(mi + MI_MESHNAME), gm, sizeof(gm));
        guest_read_cstr(MEM_LD32(mi + MI_TEXNAME),  gt, sizeof(gt));
        if (strcmp(gm, fname_mesh) != 0) { fail(fname, "meshName"); break; }
        if (strcmp(gt, fname_tex)  != 0) { fail(fname, "textureName"); break; }

        /* Indices: 6 bytes por triangulo, copiados tal cual. */
        uint32_t gi = MEM_LD32(mi + MI_INDICES);
        if (memcmp(g_ram + gi, raw + off, (size_t)nf * 6) != 0) {
            fail(fname, "los indices no son copia exacta del archivo");
            break;
        }
        off += (size_t)nf * 6;

        /* Vertices: 26 bytes en disco -> 16 en memoria, descartando 12. */
        uint32_t gv = MEM_LD32(mi + MI_VERTS);
        int bad = 0;
        for (int v = 0; v < nv && !bad; v++) {
            const unsigned char *src = raw + off + (size_t)v * 26;
            uint32_t dst = gv + 16u * (uint32_t)v;
            int16_t x, y, z; float u, vv;
            memcpy(&x, src + 0, 2);
            memcpy(&y, src + 2, 2);
            memcpy(&z, src + 4, 2);
            memcpy(&u,  src + 6, 4);
            memcpy(&vv, src + 10, 4);
            if ((int16_t)MEM_LD16(dst + 0) != x ||
                (int16_t)MEM_LD16(dst + 2) != y ||
                (int16_t)MEM_LD16(dst + 4) != z) { bad = 1; break; }
            float gu = U32_F32(MEM_LD32(dst + 8));
            float gvv = U32_F32(MEM_LD32(dst + 12));
            if (memcmp(&gu, &u, 4) != 0 || memcmp(&gvv, &vv, 4) != 0) { bad = 1; }
        }
        if (bad) { fail(fname, "los vertices no coinciden"); break; }
        off += (size_t)nv * 26;

        /*
         * Luz por vertice: si hay .lighting se copian numVerts bytes desde el
         * archivo, de forma consecutiva entre mallas; si no lo hay, se rellena
         * todo a 0xFF.
         */
        uint32_t gl = MEM_LD32(mi + MI_VERTLIGHT);
        int lbad = 0;
        for (int v = 0; v < nv && !lbad; v++) {
            if (light == NULL) {
                /* No .lighting at all: the original memsets 0xFF, and that IS
                 * defined behaviour worth asserting. 308 of the 605 meshsets
                 * take this path. */
                if (g_ram[gl + v] != 0xFF) lbad = 1;
            } else if (light_off + (size_t)v < (size_t)lightsz) {
                if (g_ram[gl + v] != light[light_off + (size_t)v]) lbad = 1;
            } else {
                /* **A .lighting that is SHORTER than the header's vertex
                 * count.** The loader sizes the buffer from the header and
                 * copies from the file, so the tail is whatever the allocator
                 * left -- undefined on both sides, and different on each.
                 *
                 * Asserting 0xFF here was wrong: that value belongs to the
                 * missing-file path, not to a short one. It made
                 * KANO_STANDARD.lighting (42,867 bytes, one byte short of its
                 * mesh) look like a loader divergence for as long as this test
                 * has existed. tests/test_rendermesh_diff.c already got this
                 * right and counts the file instead.
                 *
                 * Exactly one asset in res/ is affected. */
                if (!g_short_light_warned) {
                    printf("  nota: %s -- el .lighting se queda corto para el "
                           "recuento de la cabecera; el resto no se compara\n",
                           fname);
                    g_short_light_warned = 1;
                }
                g_short_light++;
            }
        }
        if (lbad) { fail(fname, light ? "vertLight no coincide con el .lighting"
                                      : "vertLight != 0xFF sin .lighting"); break; }
        light_off += (size_t)nv;

        g_meshes++;
        g_verts += nv;
        g_tris  += nf;
    }

    free(raw);
    free(light);
}

int main(int argc, char **argv)
{
    if (argc < 2) {
        printf("uso: %s <dir_res> [archivo.meshset] [slice_armv7]\n", argv[0]);
        return 2;
    }
    const char *root = argv[1];
    const char *image = (argc >= 4) ? argv[3]
                                    : "E:/MK3 PROJECT/OUTPUT/armv7/UMK3.armv7";

    arm_mem_init(RAM_SIZE);
    arm_set_asset_root(root);

    /* Sin la imagen mapeada, las cadenas literales que usa el cargador
     * ("STATICLIGHTING/%s", ".lighting", los tags de limeMalloc) se leen como
     * ceros y todo lo demas sale mal. */
    if (arm_load_image(image) != 0) {
        printf("no se pudo cargar la imagen del binario: %s\n", image);
        return 2;
    }

    printf("=== el cargador original de EA contra nuestro parser ===\n");
    printf("assets: %s\n\n", root);

    if (argc >= 3) {
        check_file(root, argv[2]);
    } else {
        DIR *d = opendir(root);
        if (!d) {
            printf("no se pudo abrir %s\n", root);
            return 2;
        }
        struct dirent *e;
        while ((e = readdir(d)) != NULL) {
            const char *n = e->d_name;
            size_t L = strlen(n);
            if (L > 8 && strcmp(n + L - 8, ".meshset") == 0) {
                check_file(root, n);
            }
        }
        closedir(d);
    }

    printf("\narchivos cargados:  %ld\n", g_files);
    printf("omitidos (variante B/C, otra ruta del motor): %ld\n", g_skipped);
    printf("mallas comprobadas: %ld\n", g_meshes);
    printf("vertices:           %ld\n", g_verts);
    printf("triangulos:         %ld\n", g_tris);
    printf("discrepancias:      %d\n", g_fail);
    printf("%s\n", g_fail ? "RESULTADO: FALLO"
                          : "RESULTADO: el formato documentado coincide con el cargador de EA");
    arm_mem_free();
    return g_fail ? 1 : 0;
}
