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
#include <stddef.h>

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
/* Almost opaque. Two functions -- LIME_RenderMeshSingle and
 * LIME_RenderMeshSingleIndexed -- read `+0x40` and hand it to glBindTexture, so
 * that field is the GL texture name and nothing else is established.
 *
 * The struct stays a forward declaration rather than gaining one named field
 * and sixty-four bytes of invented padding: lime/common only ever passes the
 * pointer around, and a layout nobody can check is worse than none. */
typedef struct TEXTURE TEXTURE;

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
    TEXTURE    *texture;         /* 0x44  LIME_FreeMeshSetTextures reads this
                                  *       and passes it to limeDeleteTexture */
    uint8_t     _pad48[8];       /* 0x48 */
    int         fullBright;      /* 0x50  IsTextureFullBright(textureName) */
    int         visible;         /* 0x54  LIME_FreeNonVisibleMeshes tests == 0 */
} MESHINFO;

/* Un archivo .meshset cargado. limeMalloc(tag, 0x4C).
 * El tag que usa el original es literalmente "meshsethandle". */
typedef struct MESHSETINFO {
    char       name[64];         /* 0x00  se copia el nombre del archivo */
    int        texturesLoaded;   /* 0x40 */
    int        numMeshes;        /* 0x44 */
    MESHINFO **meshes;           /* 0x48  tag "meshset_meshes" */
} MESHSETINFO;


/* ==================================================================== */
/* Engine types                                                         */
/*                                                                      */
/* Every offset below is one that docs/SKIN-FORMAT.md, docs/EVENTS-      */
/* FORMAT.md or a comment in decomp/lime/ sources derives from the            */
/* disassembly. Types whose layout is NOT established are declared       */
/* opaque rather than given plausible fields -- the code only passes     */
/* those by pointer, and inventing a field here would corrupt every      */
/* function that touched it.                                            */
/* ==================================================================== */

/* A 4x3 affine matrix: three rows of rotation, one row of translation, all
 * stride 3. Confirmed four independent ways -- MatrixIdentity2 writes 1.0f at
 * m[0], m[4], m[8]; MatrixMul2 walks a row of `a` against a column of `b` at
 * 0, 0xc, 0x18; and MatrixMul2's fourth row ADDS b[9..11] rather than
 * multiplying, which is what makes it a translation. */
typedef struct SKINMATRIX43 {
    float m[9];                  /* rotation, row-major, m[row*3 + col] */
    float t[3];                  /* translation -- the last three floats */
} SKINMATRIX43;

/* Quaternion, Scale, Translation in int16 fixed point (x 1/32767).
 * ConvertQSTMatrixtoPCMatrix reads four int16 at +0x00..+0x06 and immediately
 * squares and cross-multiplies them, which is quaternion-to-matrix and nothing
 * else -- so the Q is literal. The full element count is what LerpQSTMatrix
 * iterates. */
#define QST_ELEMENTS 16
typedef struct QSTMATRIX {
    int16_t q[QST_ELEMENTS];
} QSTMATRIX;

/* One key in a bone animation track. GetSlerpedQ reads four floats at
 * +0x00..+0x0c as the rotation and writes 1.0f at +0x10 of its output. */
typedef struct BONEANIMFRAME {
    float q[4];                  /* 0x00  (x, y, z, w) -- w LAST */
    float field10;               /* 0x10  set to 1.0f unconditionally */
} BONEANIMFRAME;

/* A skeleton bone, 25 bytes on disk and 56 in memory. LIME_LoadBones turns the
 * nine signed child indices into pointers as `bones + index * 56`. */
typedef struct BONE {
    int32_t       numChildren;   /* 0x00 */
    float         x, y, z;       /* 0x04  offset from the parent */
    uint8_t       _pad10[4];     /* 0x10  the disk record holds the indices here */
    struct BONE  *children[9];   /* 0x14  nine slots, NULL where the index was -1 */
} BONE;

typedef struct BONESINFO {
    BONE *bones;                 /* 0x00 */
    int   numBones;              /* 0x04 */
} BONESINFO;

/* A loaded .skin. The six arrays are exactly the six LIME_FreeSkin releases --
 * allocation side and release side agree, which is the standard this project
 * holds field identifications to.
 *
 * Note +0x14 and +0x28: the FIRST matrix of each entry goes to +0x14 and the
 * second to +0x28, but the loader ALLOCATES +0x14 first and +0x28 second.
 * Reading allocation order as storage order gets these backwards. */
typedef struct SKININFO {
    struct SKININFO *next;       /* 0x00  a second block, or NULL */
    int           numMatrices;   /* 0x04  N */
    int           numVerts;      /* 0x08  M */
    uint8_t       _pad0c[8];     /* 0x0c */
    SKINMATRIX43 *matricesA;     /* 0x14  N x 48 */
    void         *vertExtra;     /* 0x18  M x 6 */
    void         *uvs;           /* 0x1c  M x 24 */
    int32_t      *indexes;       /* 0x20  N x 4 */
    float        *weights;       /* 0x24  N x 16 */
    SKINMATRIX43 *matricesB;     /* 0x28  N x 48 */
} SKININFO;

/* One live effect in the runtime pool: 192 slots of 248 bytes, confirmed three
 * ways. State 0 is free, > 0 is live, and NEGATIVE is dying -- LIME_UpdateEvents
 * counts negatives UP to zero, so a killed event at -2 gets a two-frame grace
 * period before the slot is reused. */
#define EVENT_SLOTS      192
#define EVENT_STRIDE     0xF8    /* 248 bytes IN THE BINARY -- see below */

/* **A warning about every stride in this header.**
 *
 * The sizes recorded here are the original's, and the original is 32-bit ARM
 * where a pointer is 4 bytes. Compiled for a 64-bit host every struct holding
 * pointers is larger: EVENT is 248 there and 256 here, BONE is 56 and 96,
 * MESHINFO is 88 and 120.
 *
 * That is fine, and it is not a layout error -- the field ORDER is what these
 * definitions describe, and nothing in the clean C reaches into them by offset.
 * But it means a hard-coded stride is only ever correct for memory the engine
 * treats as raw bytes, such as a loaded file buffer. **Never step an array of
 * host structs by the binary's byte stride.** LIME_UpdateEvents did exactly
 * that, walked off the end of a 192-slot array, and segfaulted with no output
 * because stdout was still buffered. Index the array and let the compiler size
 * the step. */
#define EVENT_KILL_VALUE 0.0f    /* written into +0xa4 and +0xe4 on a kill */

typedef struct SCENEEVENTTRACK SCENEEVENTTRACK;

typedef struct EVENT {
    int              state;      /* 0x00 */
    float            cursor;     /* 0x04 */
    int              frameA;     /* 0x08 */
    int              frameB;     /* 0x0c */
    struct SCENEINFO *scene;     /* 0x10  `ldr ip, [r4, #0x10]` then
                                  *       `ldr r3, [ip, #0x44]` for count2 */
    SCENEEVENTTRACK *track;      /* 0x14 */
    uint8_t          _pad18[0x0c];
    float            step;       /* 0x28  added to the cursor each frame */
    int              repeat;     /* 0x2c  -1 loops forever */
    int              repeat2;    /* 0x30  a second counter, tried after +0x2c */
    uint8_t          _pad34[4];
    int              delay;      /* 0x38  ticks down before the event starts */
    /* int32_t, not long. The binary's field is 4 bytes; `long` is 4 on MinGW
     * and 8 on Linux, so writing `long` here would give the struct a different
     * field order on the two hosts for no reason. `long` stays in the SIGNATURE
     * of KillAlleventsWithGroup, where the mangled name (...Groupl) demands it. */
    int32_t          group;      /* 0x3c */
    int              field40;    /* 0x40  passed to LIME_TriggerEventsFromScene */
    uint8_t          _pad40[0x64];
    float            fadeA;      /* 0xa4 */
    uint8_t          _pada8[0x3c];
    float            fadeB;      /* 0xe4 */
    uint8_t          _pade8[EVENT_STRIDE - 0xe8];
} EVENT;

/* A track loaded from a .events file: 216 bytes, spelled out by LIME_LoadEvents
 * as count*32 - count*8 = count*24, times 8, plus the 24. Names are uppercased
 * in place at load across a 64-byte field, which is why nothing here ever needs
 * a case-insensitive compare. */
#define SCENEEVENTTRACK_STRIDE 216

struct SCENEEVENTTRACK {
    uint8_t _pad00[4];
    struct SCENEINFO *scene;     /* 0x04  read as one by LIME_FreeEvents and by
                                  *       LIME_TriggerEvent -- two functions */
    float   f08, f0c, f10, f14;  /* 0x08  set to 1.0f by LIME_PlayFBXAtPos */
    uint8_t _pad18[4];
    int     v1c, v20, v24;       /* 0x1c  zeroed together */
    uint8_t _pad28[0x48];
    int     f70;                 /* 0x70 */
    uint8_t _pad74[4];
    int     f78;                 /* 0x78 */
    int     flag7c;              /* 0x7c  diverts LIME_TriggerEventFromSceneH */
    uint8_t _pad80[0x1c];
    int     field9c;             /* 0x9c  count for the +0xd4 array */
    uint8_t _pada0[0x24];
    float   fc4;                 /* 0xc4  set to 1.0f */
    uint8_t _padc8[8];
    int     maxInstances;        /* 0xd0  -1 disables the cap */
    void   *arrayD4;             /* 0xd4  field9c x 68 bytes */
    uint8_t _padd8[SCENEEVENTTRACK_STRIDE - 0xd8];
};

typedef struct EVENTSINFO {
    int              count;      /* 0x00 */
    SCENEEVENTTRACK *tracks;     /* 0x04 */
} EVENTSINFO;

/* Deferred transparent draws: 48 bytes, written as index*64 - index*16 and
 * walked back with a plain add #0x30. */
#define TRANSPMESH_MAX 255

typedef struct TRANSPMESH {
    uint32_t     word0, word1;   /* 0x00  copied from the SCENENODE */
    QSTMATRIX    qst;            /* 0x08  32 bytes, copied verbatim */
    void        *meshset;        /* 0x28 */
    long         arg4;           /* 0x2c */
} TRANSPMESH;

/* One debug text window. 50 lines; sliders live in slots 10 through 15, which
 * is why LIME_KillSliders is ClearDebugWindow six times. The record SIZE is not
 * stated: the literal pools disassemble as 0xe12fff1e (bx lr read as data), so
 * it could not be pinned down and is not guessed. */
#define DEBUG_WINDOWS 16
#define DEBUG_LINES   0x31

typedef struct DEBUGWINDOW {
    int      column;             /* 0x00 */
    int      line;               /* 0x04 */
    uint8_t  _pad08[0x10];
    int      field18;            /* 0x18  cleared by ClearDebugWindow */
    uint32_t lines[DEBUG_LINES]; /* the text block DS_ScrollLines moves */
    uint8_t  flag38;             /* 0x38, one byte */
} DEBUGWINDOW;

/* Layout not established -- these are only ever passed by pointer. */
typedef struct SCENENODE     SCENENODE;

/* The .events block as its consumers name it. Same pair EVENTSINFO holds; the
 * two names come from different call sites in the original. */
typedef struct SCENEEVENTS {
    long  numTracks;             /* 0x00 */
    void *tracks;                /* 0x04  numTracks x 216 bytes */
} SCENEEVENTS;

/* A game object. Only the frame number is established here -- IsOnWWFrame reads
 * it at +0x08 and sign-extends from uint16. Everything else is gamecode's and
 * has not been mapped. */
typedef struct Mk3Obj_t {
    uint8_t  _pad00[8];
    uint16_t frame;              /* 0x08 */
} Mk3Obj_t;

/* A declarative texture manifest: a NULL-terminated array of 8-byte entries.
 * A module lists what it needs and where to put it, and one call fills them in.
 * The stride shows up as a pre-indexed load with writeback, `ldr r0, [r4, #8]!`. */
typedef struct TEXTURETOLOAD {
    const char *name;            /* 0x00  NULL ends the list */
    TEXTURE   **dest;            /* 0x04  where the handle goes */
} TEXTURETOLOAD;

/* A font: two texture atlases and a metrics file. See docs/FONT-FORMAT.md --
 * the metric arrays at +0x1c and +0x24 are deliberately unnamed because nothing
 * decompiled so far reads them. limeDrawFONT will settle them. */
typedef struct FONT {
    uint8_t   _pad00[4];
    int       simple;            /* 0x04  stored INVERTED from the file flag */
    int       glyphHeight;       /* 0x08  header byte 2 -- ONE height for every
                                  *       glyph, which is why it is in the
                                  *       header and not in a per-glyph array */
    int       spacing;           /* 0x0c  added once per character by both
                                  *       width routines -- inter-character
                                  *       spacing, set from limeCreateFONT */
    int       fallbackAdvance;   /* 0x10  the constant 8 */
    int       field14;           /* 0x14  the scale applied at measure time */
    int16_t   numGlyphs;         /* 0x18 */
    uint8_t   _pad1a[2];
    /* The atlas rectangle of each glyph. limeDrawFONT settles all three by what
     * it divides them BY on the way to limeDrawSprite: atlasU and glyphWidth are
     * both normalised by +0x34, atlasV by +0x38. Two share a divisor, so two
     * share an axis. */
    int16_t  *atlasU;            /* 0x1c  x position in the atlas */
    int16_t  *atlasV;            /* 0x20  y position in the atlas */
    int16_t  *glyphWidth;        /* 0x24  per-glyph width, and the advance
                                  *       limeGetStringWidth accumulates */
    /* Optional per-glyph kerning, one SIGNED byte each, added to the width when
     * the pointer is non-null. limeGetStringWidth is the only reader:
     *     ldr     r3, [r4, #0x28]
     *     cmp     r3, #0
     *     ldrsbne r3, [r3, r0]
     *     addne   r8, r8, r3
     * Nothing in limeCreateFONT was seen to allocate it, so a font that does not
     * carry kerning leaves it null and every glyph keeps its plain width. */
    int8_t   *kerning;           /* 0x28 */
    int       defaultAdvance;    /* 0x2c  simple fonts only */
    uint8_t   _pad30[4];
    /* The atlas dimensions, and they are the OPPOSITE way round from an earlier
     * naming here. +0x34 divides the horizontal metrics and +0x38 the vertical,
     * which is what fixes them: the divisor names the axis. */
    float     atlasWidth;        /* 0x34 */
    float     atlasHeight;       /* 0x38 */
    uint8_t   _pad3c[12];
    uint8_t  *codes;             /* 0x48  one byte per glyph */
    int16_t  *codesW;            /* 0x4c  the same codes widened to 16 bits */
    TEXTURE  *texture0;          /* 0x50 */
    TEXTURE  *texture1;          /* 0x54 */
} FONT;

/* ------------------------------------------------------------------ */
/* Engine globals                                                       */
/* ------------------------------------------------------------------ */

/* The name is the binary's own: _SceneEvents in __DATA, 0x00379cc0, exactly
 * 47,616 bytes -- 192 * 248. An earlier pass called this g_events, which was an
 * invention sitting next to a symbol table that had the real name all along. */
extern EVENT            SceneEvents[EVENT_SLOTS];
extern SCENEEVENTTRACK  g_fbxScratchTrack;   /* reused every LIME_PlayFBXAtPos */
extern limeMATRIX44     g_fbxScratchMatrix;
/* Walked as raw bytes by FindIdInMasterOffsets, which strcmps at a fixed stride.
 * Typed as bytes rather than as a struct array because the record layout is not
 * established. */
extern const char      *g_masterOffsets;
extern int              g_masterOffsetCount;
/* Declared with the struct tag: the full SCENEINFO definition lives further
 * down, after MESHSETINFO, and this block precedes it. */
struct SCENEINFO;
extern struct SCENEINFO *g_sceneList;

extern TRANSPMESH       g_transpMeshList[TRANSPMESH_MAX];
extern int              g_transpMeshCount;

extern DEBUGWINDOW      g_debugWindows[DEBUG_WINDOWS];
extern int              g_debugWindowEnabled;

/* Lighting: two directional lights, monochrome, no ambient. See LIGHTING.md.
 * Held as bare float[3] rather than limeVECTOR3 -- NormaliseLDirs indexes them
 * with [0], [1], [2]. */
extern float            g_lightDir0[3], g_lightDir1[3];

/* Scales the lit value into a 0..255 grey byte in DrawSkinnedMesh2. The literal
 * is in a pool this pass did not resolve, so the name stands in for it rather
 * than a guessed number. */
extern const float      LIGHT_SCALE;

/* Skinning cursors. CreateMatrixPaletteRecurse2 walks the skeleton depth-first
 * and consumes these as it goes -- one animation frame per bone in tree order,
 * one 48-byte matrix written per bone. The traversal is stateful rather than
 * parameterised, so these are genuinely globals and not locals hoisted out. */
extern const uint8_t   *g_animFrameCursor;
extern const uint8_t   *g_animFrameCursor2;
extern SKINMATRIX43    *g_paletteCursor;
extern SKINMATRIX43    *g_matrixPalette;
extern int              g_boneCounter;
extern float            g_rootPosition[3];

/* The blended root position and the per-bone blended rotations
 * CreateMatrixPaletteForGeneratingMesh produces and
 * CreateMatrixPaletteRecurse2 then consumes. MAX_BONES is not a constant the
 * binary states -- the arrays are sized from BONESINFO.numBones there -- so it
 * is a bound for the host build rather than a recovered figure, chosen well
 * above the largest skeleton in the shipped data. */
#define MAX_BONES 128
extern limeVECTOR3      g_rootPositionV;
extern BONEANIMFRAME    g_animBlended[MAX_BONES];

void   UnpackAnimFrame(const uint8_t *src, BONEANIMFRAME *out,
                       limeVECTOR3 *pos, long numBones);
void   LerpVector3(const limeVECTOR3 *a, const limeVECTOR3 *b, float t,
                   limeVECTOR3 *out);
void   CreateMatrixPaletteRecurse2(BONE *bone, SKINMATRIX43 *parent);
extern float            g_lightPower0, g_lightPower1;
extern float            g_lightExp0, g_lightExp1;


/* GL enums the decompiled code names directly. */
#ifndef GL_MODELVIEW
#define GL_MODELVIEW  0x1700
#endif
#ifndef GL_PROJECTION
#define GL_PROJECTION 0x1701
#endif


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

/* Returns the INDEX of the first mesh whose name CONTAINS `name`, or -1.
 * An index, not a pointer, and a substring match, not an exact one — both
 * are easy to get wrong and both are verified. */
int          LIME_FindMeshByName(const MESHSETINFO *set, const char *name);

/* The second argument is real: RenderDebugCube passes 0 for it, and when it is
 * non-null the function composes three candidate texture names from it. The
 * single-argument form here was stale and only surfaced when the file was
 * first compiled. */
void         LIME_LoadMeshSetTextures(MESHSETINFO *set, const char *suffix);
void         LIME_FreeMeshSetTextures(MESHSETINFO *set);

/* Non-zero if the texture should be drawn without lighting. The original
 * decides by looking the name up in a data file. */
/* The full-bright opt-out list. A literal in the binary, not a variable --
 * see the note on _IsTextureFullBrightPath in RenderMesh.c. */
#define NOLIGHT_FILE "nolight.txt"

/* The master effect-offset registry LIME_LoadMasterEventOffsets reads and
 * FindIdInMasterOffsets searches. The literal is in a pool this pass did not
 * resolve, so the name stands in for it. */
#define MASTER_OFFSETS_FILE "masteroffsets"

/* _TheFullBrightInfo occupies 4100 bytes in __DATA,__common -- the distance to
 * the next symbol, _NumTranspMeshes. That is exactly 4 + 64 * 64, so the table
 * holds **64 entries of 64 bytes** after a leading count, and `names[i]` lands
 * at `base + 4 + i * 64`, which is how the code addresses it.
 *
 * The retail nolight.txt uses 40 of the 64. **The parser has no bounds check**:
 * it copies and increments per accepted line with nothing testing the count, so
 * a modder adding 25 more entries writes straight through the end of the table
 * and into _NumTranspMeshes, the transparent-mesh counter. See docs/LIGHTING.md. */
#define FULLBRIGHT_MAX 64

typedef struct FULLBRIGHTINFO {
    int  count;                        /* +0x00 */
    char names[FULLBRIGHT_MAX][64];    /* +0x04, stride 0x40 */
} FULLBRIGHTINFO;

extern FULLBRIGHTINFO TheFullBrightInfo;
extern int            FullBrightLoaded;

/* RenderMesh.cpp: the fade lookup table CreateFadedLookupTable builds, one row
 * of 256 bytes per fade level. */
extern int      g_fadeTableBuilt;
extern uint8_t *g_fadeTable;
#define FADE_LEVELS 256

/* The debug overlay switch and the lazily loaded debug cube (RenderDebugCube). */
extern int   g_debugEnabled;
/* Built by LIME_LoadScene, which writes more of this structure than everything
 * else recovered so far combined. Fields are named only where two independent
 * functions agree; the rest keep their offsets as names rather than acquire a
 * plausible-sounding label.
 *
 * The leading name[64] is why LIME_LoadScene's first field write lands at 0x40:
 * three separate functions show a SCENEINFO beginning with its own filename. */
typedef struct SCENEINFO {
    char         name[64];       /* 0x00 */
    int          refCount;       /* 0x40  incremented on a cache hit,
                                  *       decremented by LIME_FreeScene */
    int          count2;         /* 0x44  the modulus LIME_TriggerEventsFromScene
                                  *       takes frame numbers against */
    void        *field48;        /* 0x48 */
    void        *field4c;        /* 0x4c  limeMalloc sized from 0x44 and 0x48 */
    uint8_t      _pad50[4];      /* 0x50 */
    float        posX;           /* 0x54  fed straight to glTranslatef by     */
    float        posY;           /* 0x58  LIME_RenderEvents -- the scene origin */
    float        posZ;           /* 0x5c  an effect is placed relative to      */
    int          field60;        /* 0x60  written as zero */
    int          field64;        /* 0x64  four words from another sibling */
    int          field68;        /* 0x68 */
    int          field6c;        /* 0x6c */
    int          field70;        /* 0x70 */
    void        *field74;        /* 0x74 */
    int          field78;        /* 0x78 */
    void        *tail;           /* 0x7c  GetMatrixFromPalette indexes this at
                                  *       32 bytes a step */
    MESHSETINFO *meshset;        /* 0x80  LIME_LoadMeshSet result -- confirmed
                                  *       independently by RenderDebugCube */
    void        *events;         /* 0x84  LIME_LoadEvents result */
    uint8_t      _pad88[8];      /* 0x88 */
    struct SCENEINFO *next;      /* 0x90  the scene cache is a linked list --
                                  *       AddScene and LIME_GetSceneFromFilename
                                  *       both walk this offset */
} SCENEINFO;

extern SCENEINFO *g_debugCubeScene;
#define DEBUG_CUBE_SCENE "debugcube.scene"

SCENEINFO *LIME_LoadScene(const char *filename, int a, int b, int c);
void LIME_RenderMeshSingle(MESHINFO *mesh, TEXTURE *t0, TEXTURE *t1,
                           float alpha, long flags);
void LIME_FreeSingleMesh(MESHSETINFO *set, int index);

int          IsTextureFullBright(const char *textureName);

/* ------------------------------------------------------------------ */
/* Provided by the platform layer                                       */
/* ------------------------------------------------------------------ */

/* Reads a file whole. Returns a buffer the caller owns and must limeFree(), or
 * NULL.
 *
 * **One argument, with the size fetched separately.** This header previously
 * declared `limeLoadFile(path, size_t *out)` -- the shape a PC runtime would
 * prefer -- and that was the only place in the tree using it. The binary has
 * the one-argument form with a separate limeFileSize(), and
 * runtime/arm_runtime.c already implements it that way as stub_limeLoadFile /
 * stub_limeFileSize. The decompiled code describes the original, so the
 * original signature wins and the runtime needs no change. */
void  *limeLoadFile(const char *path);
size_t limeFileSize(const char *path);
void   limeFree(void *p);
void  *limeMalloc(const char *tag, size_t bytes);
TEXTURE *limeLoadTexture(const char *path, int a, int b);
void   MatrixMul2(const SKINMATRIX43 *a, const SKINMATRIX43 *b, SKINMATRIX43 *out);
void   MatrixIdentity2(SKINMATRIX43 *m);
void   GetMFromQuat2(const BONEANIMFRAME *q, SKINMATRIX43 *out);
void   GetSlerpedQ(const BONEANIMFRAME *a, const BONEANIMFRAME *b,
                   float t, BONEANIMFRAME *out);
void   Xform2(const limeVECTOR3 *unused0, const limeVECTOR3 *vin,
              const limeVECTOR3 *unused2, limeVECTOR3 *vout,
              const SKINMATRIX43 *m, float w);
void   NormaliseLDirs(void);
/* The mangled name is __Z9LightVertP11limeVECTOR3S0_ -- two limeVECTOR3* -- but
 * the recovered body writes through a bare float*. Same three floats either
 * way; the definition's shape is kept. */
void   LightVert(const limeVECTOR3 *normal, float *out);
void   DS_ScrollLines(DEBUGWINDOW *win);
void   CreateMatrixPaletteForGeneratingMesh(char *a, long b, long c, long d,
                                            float e, BONESINFO *bones);
void   LIME_LoadSkin1(const char *data, SKININFO *skin);

/* The matrix-stack wrappers and the blend-state helpers the renderers call.
 * All real symbols in the binary; the blend pair is what makes the transparent
 * list order-independent -- see FlushTranspMeshList. */
void   LIME_PushMatrix(void);
void   LIME_PopMatrix(int count);
/* Signature taken from the existing definition in RenderMesh.c, which was
 * recovered from the binary -- an earlier guess here had four different
 * parameters and only the compiler caught it. */
void   LIME_RenderMesh(MESHSETINFO *set, int index, TEXTURE *t0, TEXTURE *t1);
void   ConvertQSTMatrixtoPCMatrix(const int16_t *src, float *dst);
void   limeEnableAlphaBlending_Additive(void);
void   limeEnableAlphaBlending_Basic(void);
void   limeDisableAlphaBlending(void);
void   limeEnableDepthWrites(void);
void   limeDisableDepthWrites(void);
void   LIME_printf(int window, const char *fmt, ...);
int    GetFreeEvent(void);
int    LIME_CountActiveEvents(void);
void   KillAlleventsWithGroup(long group);
void   LIME_UpdateEvents(void);
void   LIME_KillSliders(void);
void   limeDrawSprite(TEXTURE *page, float x, float y, float w, float h,
                      float u, float v, float du, float dv);
int    FindIdInMasterOffsets(const char *name);
struct SCENEINFO *LIME_SceneExists(struct SCENEINFO *scene);
void   LIME_FreeScene(struct SCENEINFO *scene);
EVENTSINFO *LIME_LoadEvents(const char *filename, long a, long b);
int    LIME_TriggerEventFromSceneH(long a0, SCENEEVENTTRACK *track,
                                   limeMATRIX44 *matrix, long a3, long a4,
                                   long a5, long a6, long a7, long a8,
                                   long a9, long a10);

/* The two state words KillIllegalWhirlwinds tests are dereferenced (`*g_stateA`),
 * so they are pointers into gamecode state rather than plain ints. */
extern int *g_stateA, *g_stateB;
extern int  g_whirlwindFirstFrame;

/* GL ES 1.1 fixed function. Declared here rather than pulled from a GL header so
 * the decompiled engine builds standalone; runtime/ supplies the real ones. */
void glPushMatrix(void);
void glPopMatrix(void);
void glLoadIdentity(void);
void glMatrixMode(unsigned mode);
void glTranslatef(float x, float y, float z);
void glMultMatrixf(const float *m);
void   limeDeleteTexture(TEXTURE *tex);

/* GetNextLine copies one line into `dst`, stopping at NUL, CR or LF, handles
 * CRLF, and returns the cursor for the next line. */
const char *GetNextLine(const char *src, char *dst);

#endif /* LIME_H */
