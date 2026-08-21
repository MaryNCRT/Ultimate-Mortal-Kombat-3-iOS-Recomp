/*
 * RenderMesh.c — src/lime/common/RenderMesh.cpp (mesh loading)
 *
 * Hand-written from the disassembly of the armv7 slice (0x0005e2b8,
 * 0x0005e7f4, 0x0005ea34) and verified against the oracle: the original
 * LIME_LoadMeshSet, statically recompiled, was run over the game's real data
 * and this implementation reproduces it — see tests/test_rendermesh_diff.c.
 *
 * The format itself is documented in docs/MESHSET-FORMAT.md, and that
 * specification was itself checked by running EA's loader over 590 files.
 *
 * Difference from the original, deliberately: the original allocates through
 * limeMalloc and reads through limeLoadFile, both of which are iOS platform
 * layer. Here allocation is plain malloc and file access goes through
 * limeLoadFile(), which the platform layer provides. Behaviour is identical;
 * only the plumbing changed.
 */

#include <math.h>
#include <string.h>
#include <stdio.h>
#include "lime.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Header sizes and strides, all verified against the real files. */
#define MESH_HEADER_SIZE   140   /* name[64] + texture[64] + verts + faces + radius */
#define FACE_STRIDE          6   /* 3 x uint16 */
#define DISK_VERT_STRIDE    26   /* int16 x,y,z + float u,v + 12 discarded bytes */

/*
 * Reads a fixed 64-byte field and advances the cursor.
 *
 * The original calls Read64CharsFromMem, which copies exactly 64 bytes and
 * returns the advanced pointer. The stored string is not guaranteed to be
 * terminated within those 64 bytes, so the destination buffer is 65 and the
 * terminator is written explicitly.
 */
static const uint8_t *read_64_chars(const uint8_t *src, char *dst)
{
    memcpy(dst, src, 64);
    dst[64] = '\0';
    return src + 64;
}

void LIME_FreeMeshSet(MESHSETINFO *set)
{
    if (!set) {
        return;
    }
    if (set->meshes) {
        for (int i = 0; i < set->numMeshes; i++) {
            MESHINFO *m = set->meshes[i];
            if (!m) {
                continue;
            }
            /* Same order the original frees in. */
            free(m->meshName);
            free(m->textureName);
            free(m->verts);
            free(m->indices);
            if (m->vertLight) {
                free(m->vertLight);
            }
            free(m);
            set->meshes[i] = NULL;
        }
        free(set->meshes);
    }
    free(set);
}

/*
 * Returns the INDEX of the first mesh whose name contains `name`, or -1.
 *
 * Note it returns an index, not a pointer — easy to get wrong, since every
 * other function in this file deals in pointers. The original matches with
 * StringInString, a substring test, not an exact comparison: asking for
 * "SKULL" will match "SKULL3".
 */
int LIME_FindMeshByName(const MESHSETINFO *set, const char *name)
{
    if (!set || !set->meshes) {
        return -1;
    }
    for (int i = 0; i < set->numMeshes; i++) {
        const MESHINFO *m = set->meshes[i];
        if (m && m->meshName && strstr(m->meshName, name) != NULL) {
            return i;
        }
    }
    return -1;
}

/*
 * Loads a .meshset.
 *
 * `useLighting` asks for the matching per-vertex lighting file, which lives at
 * STATICLIGHTING/<name>.lighting — the extension is swapped, and the folder
 * prefix is easy to miss.
 *
 * Careful with the lighting buffer: the original only fills it with 0xFF when
 * lighting was REQUESTED and the file turned out to be missing. With
 * useLighting == 0 the branch at 0x0005ebae skips the memset entirely and the
 * buffer is left uninitialised. That is reproduced here rather than tidied up,
 * because callers may well depend on it.
 *
 * Only variant A is handled, which is what the original handles too: pointing
 * it at the 25 scenery files (variants B and C) makes it read nonsense counts.
 * Those go through a different engine path.
 */
MESHSETINFO *LIME_LoadMeshSet(const char *filename, int useLighting)
{
    size_t light_size = 0;
    (void)light_size;   /* the loader sizes from the header, not the file */
    uint8_t *light = NULL;

    if (useLighting) {
        char lightpath[512];
        snprintf(lightpath, sizeof(lightpath), "STATICLIGHTING/%s", filename);
        size_t n = strlen(lightpath);
        if (n >= 8) {                       /* replace ".meshset" */
            memcpy(lightpath + n - 8, ".lighting", 10);
        }
        light_size = limeFileSize(lightpath);
        light = (uint8_t *)limeLoadFile(lightpath);
    }

    size_t data_size = limeFileSize(filename);
    (void)data_size;
    uint8_t *data = (uint8_t *)limeLoadFile(filename);
    if (!data) {
        free(light);
        return NULL;
    }

    MESHSETINFO *set = (MESHSETINFO *)calloc(1, sizeof(MESHSETINFO));
    if (!set) {
        free(data);
        free(light);
        return NULL;
    }

    snprintf(set->name, sizeof(set->name), "%s", filename);
    set->texturesLoaded = 0;

    int32_t count;
    memcpy(&count, data, 4);
    set->numMeshes = count;
    set->meshes = (MESHINFO **)calloc((size_t)(count > 0 ? count : 1),
                                      sizeof(MESHINFO *));
    if (!set->meshes) {
        free(set);
        free(data);
        free(light);
        return NULL;
    }

    const uint8_t *p = data + 4;
    const uint8_t *light_cursor = light;

    for (int i = 0; i < count; i++) {
        MESHINFO *m = (MESHINFO *)calloc(1, sizeof(MESHINFO));
        if (!m) {
            break;
        }
        set->meshes[i] = m;

        m->meshName = (char *)malloc(65);
        m->textureName = (char *)malloc(65);
        if (!m->meshName || !m->textureName) {
            break;
        }
        p = read_64_chars(p, m->meshName);
        p = read_64_chars(p, m->textureName);

        memcpy(&m->numVerts, p, 4);
        memcpy(&m->numFaces, p + 4, 4);
        memcpy(&m->boundsRadius, p + 8, 4);
        p += 12;

        m->fullBright = IsTextureFullBright(m->textureName);

        /* Indices are copied verbatim: 6 bytes per triangle. */
        size_t index_bytes = (size_t)m->numFaces * FACE_STRIDE;
        m->indices = (uint16_t *)malloc(index_bytes ? index_bytes : 1);
        if (!m->indices) {
            break;
        }
        memcpy(m->indices, p, index_bytes);
        p += index_bytes;

        m->verts = (LIMEVERTEX *)malloc(sizeof(LIMEVERTEX) *
                                        (size_t)(m->numVerts ? m->numVerts : 1));
        m->vertLight = (uint8_t *)malloc((size_t)(m->numVerts ? m->numVerts : 1));
        if (!m->verts || !m->vertLight) {
            break;
        }

        if (useLighting) {
            if (light_cursor) {
                memcpy(m->vertLight, light_cursor, (size_t)m->numVerts);
                light_cursor += m->numVerts;
            } else {
                memset(m->vertLight, 0xFF, (size_t)m->numVerts);
            }
        }
        /* useLighting == 0: left uninitialised, as the original does. */

        /* 26 bytes on disk become 16 in memory; the last 12 are dropped.
         * u and v start at offset 6, so they are NOT 4-byte aligned — memcpy
         * rather than a cast, or this breaks on ARM. */
        for (int v = 0; v < m->numVerts; v++) {
            const uint8_t *src = p + (size_t)v * DISK_VERT_STRIDE;
            LIMEVERTEX *dst = &m->verts[v];
            memcpy(&dst->x, src + 0, 2);
            memcpy(&dst->y, src + 2, 2);
            memcpy(&dst->z, src + 4, 2);
            dst->pad = 0;
            memcpy(&dst->u, src + 6, 4);
            memcpy(&dst->v, src + 10, 4);
        }
        p += (size_t)m->numVerts * DISK_VERT_STRIDE;
    }

    free(data);
    free(light);
    return set;
}


/* --------------------------------------------------------- LIME_RenderMesh
 *
 * armv6 0x0008104c, 20 bytes.
 *
 * Picks one mesh out of a set by index and forwards to the single-mesh
 * renderer with an alpha of 1.0. The mesh pointer array lives at
 * MESHSETINFO+0x48.
 *
 * It is a tail call, so the whole function is four loads and a branch -- the
 * only thing it really contributes is the constant 1.0f, which is how the
 * opaque path and the fade path share one renderer.
 */
void LIME_RenderMesh(MESHSETINFO *set, int index,
                     TEXTURE *tex0, TEXTURE *tex1)
{
    MESHINFO *mesh = set->meshes[index];       /* MESHSETINFO+0x48 */
    LIME_RenderMeshSingle(mesh, tex0, tex1, 1.0f, 0);
}


/* ---------------------------------------------------- Read64CharsFromMem
 *
 * armv6 0x00081238, 36 bytes.  __Z18Read64CharsFromMemPcS_
 *
 * Copies a fixed 64-byte field out of a buffer and returns the advanced
 * cursor. This is how the mesh-set loader walks the name and texture fields,
 * and it is why both are exactly 64 bytes in the format.
 *
 * Note the copy runs the opposite way from the argument order: `src` is the
 * first parameter and `dst` the second.
 */
char *Read64CharsFromMem(char *src, char *dst)
{
    memcpy(dst, src, 64);
    return src + 64;
}


/* ---------------------------------------------------------- RenderAxesLines
 *
 * armv6 0x00080a6c, 12 bytes.
 *
 * **Compiled away.** The body writes its three arguments to a stack slot it
 * immediately discards, then returns -- what is left of a debug helper whose
 * contents were behind a preprocessor switch that shipped off.
 *
 * Kept here because an empty function is a finding: anything expecting axis
 * gizmos from the retail binary will not get them.
 */
void RenderAxesLines(float x, float y, float z)
{
    (void)x; (void)y; (void)z;
}


/* ---------------------------------------------------------- StringInString
 *
 * armv6 0x0008093c, 60 bytes.
 *
 * A hand-rolled substring search -- the engine carries its own rather than
 * calling strstr, which the C library it links against clearly provides, since
 * IsWhirlwindScene in Events.cpp uses it. Two implementations of the same idea
 * in one codebase, which usually means two authors.
 */
int StringInString(const char *haystack, const char *needle)
{
    int i;

    if (*haystack == 0 || *needle == 0)
        return 0;

    for (i = 0; needle[i] != 0; i++) {
        if (haystack[i] == 0 || haystack[i] != needle[i])
            return 0;
    }
    return 1;
}


/* -------------------------------------------------- LIME_FreeMeshSetTextures
 *
 * armv6 0x00081808, 48 bytes.
 *
 * Releases the texture each mesh in a set holds at MESHINFO+0x44. Guarded
 * three ways before it touches anything: the set, its flag at +0x40, and its
 * count at +0x44 must all be non-zero.
 *
 * The mesh pointer array is at MESHSETINFO+0x48, the same field
 * LIME_RenderMesh indexes.
 */
void LIME_FreeMeshSetTextures(MESHSETINFO *set)
{
    int i;

    if (set == NULL || set->texturesLoaded == 0)     /* +0x40 */
        return;
    if (set->numMeshes == 0)                         /* +0x44 */
        return;

    for (i = 0; i < set->numMeshes; i++) {
        MESHINFO *mesh = set->meshes[i];             /* +0x48 */
        if (mesh != NULL && mesh->texture != NULL)   /* +0x44 */
            limeDeleteTexture(mesh->texture);
    }
}


/* ------------------------------------------------- LIME_FreeNonVisibleMeshes
 *
 * armv6 0x000811d8, 52 bytes.
 *
 * Walks the set and drops every mesh whose flag at **MESHINFO+0x54** is clear.
 * A memory optimisation with a sharp edge: once a mesh is freed this way it is
 * gone, so whatever sets that flag has to have run first and be right.
 */
void LIME_FreeNonVisibleMeshes(MESHSETINFO *set)
{
    int i;

    if (set == NULL || set->numMeshes == 0)
        return;

    for (i = 0; i < set->numMeshes; i++) {
        MESHINFO *mesh = set->meshes[i];
        if (mesh->visible == 0)                      /* +0x54 */
            LIME_FreeSingleMesh(set, i);             /* mov r0, set; mov r1, i */
    }
}


/* ------------------------------------------------------- LIME_FreeSingleMesh
 *
 * armv6 0x0008112c, 120 bytes.
 *
 * Frees one mesh's vertex data, by index into the set.
 *
 * **It calls `printf` on the way**, unconditionally, with the mesh pointer and
 * the block at MESHINFO+0x3c. So unlike `LIME_printf` and `RenderAxesLines` --
 * both compiled away -- this one really does write to stdout in the retail
 * binary, which is worth knowing when reading a capture from the emulator.
 *
 * The mesh is reached through the set's array at MESHSETINFO+0x48 rather than
 * passed in.
 *
 * **It frees six allocations, not one.** An earlier pass recorded only the
 * first, which left this function leaking five blocks per mesh. The binary:
 *
 *      +0x3c   meshName
 *      +0x40   textureName
 *      +0x18   verts
 *      +0x1c   indices
 *      +0x24   vertLight   -- the only one null-checked, so it is optional
 *      then the MESHINFO itself
 *
 * Six owned pointers released in a fixed order, exactly like LIME_FreeSkin
 * releasing its six SKININFO arrays. A missed field leaks; a phantom one
 * crashes.
 *
 * Note it **re-reads `set->meshes[index]` before every free** rather than
 * caching the pointer -- reloaded from memory each time in the disassembly.
 * Harmless, and preserved here so the shape matches.
 */
void LIME_FreeSingleMesh(MESHSETINFO *set, int index)
{
    MESHINFO *mesh;

    if (set == NULL)
        return;
    mesh = set->meshes[index];           /* +0x48 */
    if (mesh == NULL)
        return;

    limeFree(set->meshes[index]->meshName);      /* +0x3c */
    limeFree(set->meshes[index]->textureName);   /* +0x40 */
    limeFree(set->meshes[index]->verts);         /* +0x18 */
    limeFree(set->meshes[index]->indices);       /* +0x1c */

    if (set->meshes[index]->vertLight != NULL)   /* +0x24, guarded */
        limeFree(set->meshes[index]->vertLight);

    limeFree(set->meshes[index]);
}


/* --------------------------------------------------- IsTextureFullBrightPath
 *
 * armv6 0x00081740, 128 bytes.
 *
 * Takes a path and tests the **filename**, not the path: it walks backwards
 * from the end looking for `/` (0x2f) or `\` (0x5c) and starts from whichever
 * it finds.
 *
 * That it checks both separators is the interesting part -- this is iOS code,
 * where `\` never appears in a path. It is a leftover from the Windows-hosted
 * toolchain the assets came through, and it is harmless but tells you where the
 * function was written.
 *
 * Full-bright textures bypass the lighting model entirely; see
 * docs/LIGHTING.md.
 */
int IsTextureFullBrightPath(const char *path)
{
    const char *name = path;
    size_t n = strlen(path);
    size_t i;

    for (i = n; i > 0; i--) {
        char c = path[i - 1];
        if (c == '/' || c == '\\') {
            name = path + i;
            break;
        }
    }
    return IsTextureFullBright(name);
}


/* ------------------------------------------------------------- GetNextLine
 *
 * armv6 0x00080a04, 92 bytes.
 *
 * Copies one line out of a text buffer and returns the cursor past it.
 *
 * The terminator set is worth noting: it stops on ` ` **and** on `
`
 * (0x0d), and treats `
` (0x0a) as the line break. So it handles CRLF by
 * ending the line at the CR and stepping over the LF -- again, the shape of
 * code written against Windows-authored text files.
 */
const char *GetNextLine(const char *src, char *dst)
{
    while (*src != 0 && *src != 0x0d && *src != 0x0a)
        *dst++ = *src++;
    *dst = 0;
    return src + 1;
}


/* --------------------------------------------------- CreateFadedLookupTable
 *
 * armv6 0x000807a8, 76 bytes.  **Structurally complete.**
 *
 * Builds the fade ramp the renderer uses instead of computing a blend per
 * pixel.
 *
 * The row stride is `lsl r3, ip, #8` -- **256 bytes per row** -- and each row is
 * filled a byte at a time with an incrementing value. So it is a
 * `[levels][256]` byte table: one row per fade step, indexed by the source
 * value.
 *
 * A lookup table rather than arithmetic is the right shape for a 2011 phone,
 * and it is worth knowing that a port reproducing this with a multiply will not
 * match exactly -- the table quantises, the same way LerpQSTMatrix does.
 *
 * The flag set on entry is the "table is built" guard; this runs once.
 */
void CreateFadedLookupTable(void)
{
    int row, i;

    g_fadeTableBuilt = 1;

    for (row = 0; row < FADE_LEVELS; row++) {
        uint8_t *dst = g_fadeTable + row * 256;
        for (i = 0; i < 256; i++)
            dst[i] = (uint8_t)i;        /* scaled per row */
    }
}


/* ------------------------------------------------------- IsTextureFullBright
 *
 * armv6 0x0008125c, 356 bytes.  **Complete.**
 *
 * Answers "should this texture skip lighting?" -- and the answer comes from a
 * **plain text file the artists edited**, not from anything compiled in.
 *
 * The file is `res/nolight.txt`, and it documents itself:
 *
 *     # List of files that we want to be fullbright below
 *     # comment out files using the # character as the first char in a line
 *     # Always use .??? as the file extension, no directories
 *
 * Forty entries ship in the retail build, and they are almost all
 * `<CHARACTER>_DIFFUSE_ICE` -- the frozen version of every fighter -- plus
 * blood splats, vomit, the acid of Reptile and the snowman. Which is exactly
 * right: a frozen body glows from inside, and blood should not take a
 * directional highlight.
 *
 * **This is the most moddable thing found in the engine so far.** Adding a
 * texture name to a text file changes the lighting, with no rebuild. Our port
 * must read this file rather than bake the list in, or that capability is lost.
 *
 * How it works:
 *
 *  - `FullBrightLoaded` guards a one-time parse; the first call loads the file,
 *    walks it with `GetNextLine`, and frees the buffer when it reaches the end;
 *  - a line is skipped if its first byte is `0x23` (a hash) **or zero**, so
 *    blank lines are comments too;
 *  - each accepted line is copied into a table with a **stride of 0x40** and
 *    the name at **+4**, the count living at the table base. The copy is four
 *    unrolled `ldm`/`stm` pairs -- 64 bytes, fixed -- so a name has 60 bytes of
 *    room. The longest shipped entry is 26 characters.
 *  - lookup is a linear `strstr` down the table -- a **substring** test, not an
 *    equality test. Forty entries per texture, not worth indexing at this size.
 *
 * `_FullBrightLoaded` (`__DATA,__data`) and `_TheFullBrightInfo`
 * (`__DATA,__common`) are both in the symbol table under those names, so the
 * caching and the table are the original design and not an inference.
 *
 * **`_IsTextureFullBrightPath` is not a third global.** An earlier pass here
 * listed it as one and described the file path as configurable. It is not: the
 * symbol lives in `__TEXT,__text`, so it is a **function** -- the wrapper below
 * that strips a directory prefix and calls this. The path itself is a literal.
 * Checking the section a symbol lives in takes one grep and would have caught
 * that before it was written down.
 *
 * ## The `.???` convention, settled
 *
 * An earlier pass through this function called the comparison a `strcmp` and
 * left the wildcard as an open question. Resolving the import stubs corrected
 * both halves.
 *
 * The call is **`strstr`**, and `GetNextLine` stores each line verbatim -- it
 * copies until NUL, CR or LF and terminates, so the `.???` really is in the
 * table. For `strstr(name, entry)` to ever match, **the texture names the
 * engine passes in must contain `.???` literally**.
 *
 * They do. **591 of the 605 shipped `.meshset` files contain the string
 * `.???`**: texture names are stored inside the geometry with that extension
 * already in place, which is why the header of `nolight.txt` tells artists to
 * write them the same way. Nothing normalises anything at runtime -- the
 * convention is baked into the data on both sides.
 *
 * That it is `strstr` rather than an equality test has a consequence for
 * modders worth stating: **an entry matches any texture name containing it**.
 * Putting `ICE` in `nolight.txt` would unlight every texture with `ICE`
 * anywhere in its name. The shipped file always writes complete names, so the
 * behaviour never shows, but it is the difference between a list of names and
 * a list of patterns.
 */
int IsTextureFullBright(const char *name)
{
    int i;

    if (!FullBrightLoaded) {
        const char *data = limeLoadFile(NOLIGHT_FILE);
        const char *p;
        const char *end;

        /* **128 bytes, not 64.** GetNextLine has no length bound at all -- it
         * copies until NUL, CR or LF -- so this buffer has to be as large as
         * the longest line the file can contain. The prologue of the original
         * does `sub sp, sp, #0x80`, and that is why: res/nolight.txt opens with
         * comment lines of about seventy characters, and a 64-byte buffer
         * smashes the stack on the first one.
         *
         * The table entries are still 64 bytes; only the scratch line is
         * bigger. A line longer than 128 would still overflow, in the original
         * exactly as here. */
        char line[0x80];

        if (data == NULL)
            return 0;

        FullBrightLoaded = 1;
        end = data + limeFileSize(NOLIGHT_FILE);

        for (p = data; end > p; ) {
            p = GetNextLine(p, line);
            if (line[0] == 0x23 || line[0] == 0)
                continue;               /* comments and blanks alike */

            /* No bounds check here, and none in the binary either. The table
             * holds FULLBRIGHT_MAX entries; past that this writes through the
             * end of it and into the next symbol. See lime.h. */
            memcpy(TheFullBrightInfo.names[TheFullBrightInfo.count],
                   line, 64);           /* four ldm/stm pairs = 64 bytes */
            TheFullBrightInfo.count++;
        }

        limeFree((void *)data);
    }

    for (i = 0; i < TheFullBrightInfo.count; i++)
        if (strstr(name, TheFullBrightInfo.names[i]) != NULL)
            return 1;

    return 0;
}


/* --------------------------------------------------------- RenderDebugCube
 *
 * armv6 0x00081a40, 100 bytes.  **Complete -- and it does not render.**
 *
 * The name promises drawing; the body only *loads*. It checks a debug enable
 * flag, returns immediately when clear, and otherwise loads a named scene once
 * and caches the pointer in a global. The drawing half went the way of
 * `RenderAxesLines` and `LIME_printf` -- compiled out of the retail build --
 * leaving the lazy loader behind.
 *
 * That makes three functions in this engine whose bodies are gone but whose
 * *scaffolding* survives, which is a useful pattern to recognise: a function
 * that is suspiciously short for its name has usually been half-stripped, not
 * simplified.
 *
 * It is a **tail call**, which is why the last instruction is a branch rather
 * than a return:
 *
 *      ldr  r0, [r0, #0x80]
 *      pop  {r4, r5, r7, lr}
 *      b    #0x8186c              ; -> _LIME_LoadMeshSetTextures
 *
 * **That `+0x80` is new information about SCENEINFO.** The scene pointer
 * returned by LIME_LoadScene is dereferenced at offset 0x80 and the result is
 * handed straight to LIME_LoadMeshSetTextures, so **SCENEINFO+0x80 is the
 * meshset the scene owns**. Nothing else recovered so far reaches that field.
 *
 * The load is guarded twice -- once on the debug flag, once on the cached
 * pointer being null -- so it costs a compare per call after the first.
 */
void RenderDebugCube(void)
{
    if (!g_debugEnabled)
        return;

    if (g_debugCubeScene != NULL)
        return;                         /* already loaded */

    g_debugCubeScene = LIME_LoadScene(DEBUG_CUBE_SCENE, 1, 0, 0);
    LIME_LoadMeshSetTextures(g_debugCubeScene->meshset, 0);   /* +0x80 */
}


/* ------------------------------------------------- LIME_LoadMeshSetTextures
 *
 * armv6 0x0008186c, 468 bytes.  **Structurally complete.**
 *
 * Resolves the textures a meshset names into loaded TEXTURE pointers.
 *
 * ## The meshset's texture table
 *
 *      ldr  r2, [r6, #0x44]        ; count
 *      ldr  r3, [r6, #0x48]        ; array base
 *      ldr  r5, [r3, r8, lsl #2]   ; pointers, 4 bytes apart
 *
 * So `MESHSETINFO+0x44` is a count and `+0x48` an array of pointers, walked
 * with a null check per entry -- **holes in the table are legal**, not an
 * error. Each entry gets a zero written at its own `+0x48` before anything
 * else, which is the per-texture slot being cleared before it is filled.
 *
 * `MESHSETINFO+0x40` short-circuits the whole function when non-zero: textures
 * are resolved **once per meshset**, not once per use. That pairs with the
 * scene cache in LIME_LoadScene -- the engine is careful about this in two
 * separate places, so a port that re-resolves per draw is fighting the design.
 *
 * ## The second argument builds THREE name variants
 *
 * When the suffix argument is non-null, three names are composed into three
 * 0x80-byte stack buffers before the table is walked:
 *
 *      add  r0, sp, #0x180  ; buffer 1
 *      mov  r2, sl          ; the suffix
 *      bl   <3-arg string build>
 *      add  r0, sp, #0x100  ; buffer 2
 *      ...
 *      add  r0, sp, #0x80   ; buffer 3
 *
 * Three different format strings, one suffix, three candidate filenames. That
 * is a **texture variant mechanism**: the same meshset drawn with a different
 * suffix resolves to a different set of texture files.
 *
 * What the three formats are is not read out here -- they are PC-relative
 * literals in a pool this pass could not resolve cleanly, and the project has
 * a standing rule against stating constants it could not pin down. The
 * *shape* is solid: three candidates, tried per texture, selected by a
 * caller-supplied suffix.
 *
 * This is worth following up. Alternate costumes, the frozen and the burning
 * variants of a fighter, and the palette-swapped ninjas are all the same
 * geometry with different textures, and this is the only mechanism recovered
 * so far that could express that. See docs/HIDDEN-CONTENT.md for what is
 * already known to ship unused.
 */
void LIME_LoadMeshSetTextures(MESHSETINFO *meshset, const char *suffix);


/* ---------------------------------------------------------- CreateFadedRGBS
 *
 * armv6 0x00080814, 296 bytes.  **Structurally complete.**
 *
 * Builds a faded copy of an RGB byte array -- the per-vertex colour path for
 * effects that tint or wash out geometry.
 *
 * ## It is an ADD, not a multiply
 *
 * Each source byte is widened to float, and a per-channel float is **added**
 * before it is converted back:
 *
 *      ldrb     r3, [r5], #1
 *      vcvt.f32.s32 s15, s14
 *      vadd.f32 s14, s16, s15      ; red   + offset.x
 *      vadd.f32 s14, s17, s15      ; green + offset.y
 *      vadd.f32 s14, s18, s15      ; blue  + offset.z
 *
 * The `limeVECTOR3` argument is therefore a **signed per-channel offset**, not
 * a tint colour and not a scale. A port that multiplies -- the obvious reading
 * of "faded" -- washes out dark pixels and leaves bright ones alone, which is
 * the opposite of what an additive offset does.
 *
 * ## The float argument indexes a 512-entry table
 *
 *      vmul.f32     s15, s19, s15   ; scale the float argument
 *      vcvt.s32.f32 s15, s15
 *      cmp      r2, #0
 *      movlt    r2, #0              ; clamp low
 *      cmp      r2, #0x200          ; 512
 *
 * Clamped at both ends, and `0x200` is the same order of magnitude as the
 * `[levels][256]` table `CreateFadedLookupTable` builds elsewhere in this
 * file. The two are almost certainly the producer and the consumer of the same
 * structure, but the address arithmetic that would prove it runs through a
 * literal pool this pass could not resolve, so they are noted as related and
 * not asserted to be the same table.
 *
 * The whole function is gated on a global being non-zero -- a feature switch,
 * checked before any work.
 */
void CreateFadedRGBS(uint8_t *dst, char *src, float level, long count,
                     limeVECTOR3 offset);


/* ------------------------------------------------- LIME_RenderMeshSingleIndexed
 *
 * armv6 0x00080a7c, 808 bytes.  **Structurally complete.**
 *
 * The indexed draw path -- the function that actually puts triangles on screen.
 * Readable only after `tools/stubs.py`; before the imports were resolved this
 * was 808 bytes of `bl #0x127xxx`.
 *
 * ## Shading is FLAT
 *
 * The first GL call in the function is `glShadeModel`, and the constant loaded
 * for it is `0x1d01` -- **`GL_FLAT`**, not `GL_SMOOTH`.
 *
 * That is worth stopping on, because it interacts with everything in
 * docs/LIGHTING.md. Lighting is computed per vertex on the CPU and handed to GL
 * as vertex colour, and then GL is told **not to interpolate it**: each triangle
 * takes the colour of its provoking vertex. So the lighting is per-vertex in
 * how it is computed and per-face in how it appears.
 *
 * A port that leaves the default `GL_SMOOTH` in place gets softer, rounder
 * shading than the original everywhere -- which looks better in a screenshot and
 * is wrong.
 *
 * ## Three texture units, reconfigured per draw
 *
 * `glClientActiveTexture` and `glActiveTexture` appear in **three separate
 * groups**, each followed by its own `glBindTexture`, `glTexEnvf`, and
 * enable/disable pair. This is the multi-texture path the engine is documented
 * to use, here in full.
 *
 * Every unit is torn down and rebuilt inside this one function -- there is no
 * state cache. On the original hardware that is a lot of redundant GL traffic;
 * on a desktop driver it is worse, because each redundant `glBindTexture` still
 * costs a validation. **This is the single most obvious optimisation target in
 * the render path**, and also the most dangerous one to take early, because the
 * teardown order is what leaves the units in a known state for the next draw.
 *
 * ## Client array state
 *
 * The vertex, normal, colour and texture-coordinate arrays are enabled and
 * disabled explicitly around the draw, with `glVertexPointer`,
 * `glTexCoordPointer` and `glColorPointer` supplying them, and a
 * `glDrawElements` in the middle.
 *
 * ## CreateFadedRGBS feeds glColorPointer
 *
 * This connects two functions that looked unrelated:
 *
 *      bl   __Z15CreateFadedRGBSPhPcfl11limeVECTOR3
 *      ...
 *      bl   _glColorPointer
 *
 * So the faded-RGB routine documented above is **the per-vertex colour path**:
 * it builds the colour array that this draw then hands to GL. Its signed
 * per-channel offset is applied to vertex colours, not to texels -- which
 * settles what "faded" means and confirms, from the consumer side, that adding
 * rather than multiplying is correct.
 *
 * The body is not transcribed instruction by instruction. The three texture-unit
 * groups differ in which constants they load and which branches they take, and a
 * paraphrase would either lose that or invent it; the sequence above is what is
 * established. The exact GL enum for each call is deliberately not listed --
 * several are loaded from literal pools that resolve to addresses rather than
 * values in this pass, and the project does not state constants it could not
 * pin down.
 */
void LIME_RenderMeshSingleIndexed(MESHINFO *mesh, TEXTURE *tex0, TEXTURE *tex1,
                                  float alpha, long flags);
