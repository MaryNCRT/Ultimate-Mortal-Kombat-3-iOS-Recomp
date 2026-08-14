/*
 * lime.h — tipos del motor LIME.
 *
 * Los nombres de struct son los REALES: salen de los simbolos C++ mangled que
 * el binario conserva sin stripping. Por ejemplo
 *
 *   __Z21LIME_RenderMeshSingleP8MESHINFOP7TEXTURES2_fl
 *     -> LIME_RenderMeshSingle(MESHINFO*, TEXTURE*, TEXTURE*, float, long)
 *   __Z6Xform2P11limeVECTOR3S0_S0_S0_P12SKINMATRIX43f
 *     -> Xform2(limeVECTOR3*, ..., SKINMATRIX43*, float)
 *
 * Los offsets de MESHINFO / MESHSETINFO estan verificados contra el
 * desensamblado de _LIME_LoadMeshSet: ver OUTPUT/meshset-format.md seccion 6.
 */

#ifndef LIME_H
#define LIME_H

#include <stdint.h>

/* ------------------------------------------------------------------ */
/* Vectores                                                             */
/* ------------------------------------------------------------------ */

typedef struct {
    float x, y, z;
} limeVECTOR3;

typedef struct {
    float u, v;
} limeVECTOR2;

/* Matriz 4x4 en orden FILA-MAYOR. Verificado, no supuesto: los tests del
 * oraculo comprueban A*I == A y RotZ(a)*RotZ(b) == RotZ(a+b). */
typedef float limeMATRIX44[16];

/* ------------------------------------------------------------------ */
/* Mallas                                                               */
/* ------------------------------------------------------------------ */

/* Vertice tal y como queda en memoria tras cargar: 16 bytes.
 * En disco ocupa 26 y el loader descarta 12 (probablemente la normal). */
typedef struct {
    int16_t x, y, z;    /* posicion, hay que dividir entre 32767.0f */
    int16_t pad;
    float   u, v;
} LIMEVERTEX;

/* Una malla. El original la reserva con limeMalloc(tag, 0x58). */
typedef struct MESHINFO {
    int         numVerts;        /* 0x00 */
    int         numFaces;        /* 0x04 */
    uint8_t     _pad08[8];       /* 0x08 */
    float       boundsRadius;    /* 0x10 */
    uint8_t     _pad14[4];       /* 0x14 */
    LIMEVERTEX *verts;           /* 0x18  numVerts * 16 bytes */
    uint16_t   *indices;         /* 0x1c  numFaces * 3 uint16 */
    uint8_t     _pad20[4];       /* 0x20 */
    uint8_t    *vertLight;       /* 0x24  un byte de luz por vertice */
    uint8_t     _pad28[20];      /* 0x28 */
    char       *meshName;        /* 0x3c  buffer de 64 */
    char       *textureName;     /* 0x40  buffer de 64 */
    uint8_t     _pad44[12];      /* 0x44 */
    int         fullBright;      /* 0x50  IsTextureFullBright(textureName) */
    uint8_t     _pad54[4];       /* 0x54 */
} MESHINFO;

/* Un archivo .meshset cargado. limeMalloc(tag, 0x4C).
 * El tag que usa el original es literalmente "meshsethandle". */
typedef struct MESHSETINFO {
    char       name[64];         /* 0x00  se copia el nombre del archivo */
    int        texturesLoaded;   /* 0x40 */
    int        numMeshes;        /* 0x44 */
    MESHINFO **meshes;           /* 0x48  tag "meshset_meshes" */
} MESHSETINFO;

/* ------------------------------------------------------------------ */
/* limeVector.cpp                                                       */
/* ------------------------------------------------------------------ */

float Len(const limeVECTOR3 *v);
void  Normalise(limeVECTOR3 *v);

/* ------------------------------------------------------------------ */
/* Matrix.cpp                                                           */
/* ------------------------------------------------------------------ */

void limeMatrixLoadIdentity(float *m);
void limeMatrixCopy(const float *src, float *dst);
void limeMatrixMult(const float *a, const float *b, float *out);
void RotMatrixX(float *m, float angle);
void RotMatrixY(float *m, float angle);
void RotMatrixZ(float *m, float angle);
void limeScaleMatrix(float *m, float scale);
void limeScaleMatrixXYZ(float *m, float sx, float sy, float sz);

/* Rota un vector por la 3x3, ignorando la traslacion:
 *   out[j] = suma_i vin[i] * m[i*4 + j] */
void limeMatrix3x4RotateSkin(const float *m, const limeVECTOR3 *vin,
                             limeVECTOR3 *vout);
void RotVector(const float *m, const limeVECTOR3 *vin, limeVECTOR3 *vout);

/* Punto de enganche del widescreen: `aspect` divide el termino X de la
 * proyeccion, asi que cambiarlo ensancha el campo de vision horizontal sin
 * tocar el vertical. Verificado por los tests del oraculo. */
void CreatePerspectiveMatrix(float *m, float fov, float aspect,
                             float zNear, float zFar);

/* ------------------------------------------------------------------ */
/* RenderMesh.cpp                                                       */
/* ------------------------------------------------------------------ */

MESHSETINFO *LIME_LoadMeshSet(const char *filename, int useLighting);
void         LIME_FreeMeshSet(MESHSETINFO *set);
MESHINFO    *LIME_FindMeshByName(MESHSETINFO *set, const char *name);
void         LIME_LoadMeshSetTextures(MESHSETINFO *set);
void         LIME_FreeMeshSetTextures(MESHSETINFO *set);

#endif /* LIME_H */
