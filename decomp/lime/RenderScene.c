/*
 * lime/common/RenderScene.cpp -- the scene graph and its list.
 *
 * Recovered from the armv6 slice. Addresses below are armv6.
 *
 * Scenes live on a singly linked list threaded through SCENEINFO+0x90, with
 * the head in a global. Several of the small functions here exist only to walk
 * it, and between them they pin down the layout that
 * docs/SCENE-FORMAT.md derived from the loader.
 */

#include <math.h>
#include <string.h>
#include <stdio.h>
#include "lime.h"


/* -------------------------------------------------- GetMatrixFromPalette
 *
 * armv6 0x00081b2c, 8 bytes.  __Z20GetMatrixFromPalettelP9SCENEINFO
 *
 * Indexes the scene's tail array. **32-byte stride**, which independently
 * confirms the in-memory tail record size that SCENE-FORMAT.md derived from
 * LIME_LoadScene: 40 bytes on disk, 32 in memory.
 */
void *GetMatrixFromPalette(long index, SCENEINFO *scene)
{
    return (char *)scene->tail + index * 32;   /* SCENEINFO+0x7c */
}


/* --------------------------------------------------- ClearTranspMeshList
 *
 * armv6 0x00081aa4, 16 bytes.  __Z19ClearTranspMeshListv
 *
 * Empties the transparent-mesh list by dropping its head. The engine collects
 * translucent meshes during traversal and draws them after the opaque pass --
 * the ordinary fixed-function answer to sorting, and the only sorting this
 * renderer does.
 */
void ClearTranspMeshList(void)
{
    /* The COUNT, not the list. An earlier pass assigned zero to the array
     * itself, which is not even valid C -- it only survived because this file
     * had never been compiled. The symbol table names the counter
     * _NumTranspMeshes, and resetting it is the whole of the operation: the
     * 255 slots are overwritten in place on the next frame. */
    g_transpMeshCount = 0;
}


/* ------------------------------------------------------- LIME_SceneExists
 *
 * armv6 0x00081b3c, 40 bytes.
 *
 * Walks the scene list looking for a specific SCENEINFO. Returns it, or NULL.
 * The list is threaded through **+0x90**.
 *
 * Worth having because the loader reference-counts scenes: something has to
 * answer "is this pointer still live" before a caller trusts it.
 */
SCENEINFO *LIME_SceneExists(SCENEINFO *scene)
{
    SCENEINFO *s = g_sceneList;

    while (s != NULL) {
        if (s == scene)
            return s;
        s = s->next;                           /* SCENEINFO+0x90 */
    }
    return NULL;
}


/* ---------------------------------------------------- GetScenePointingTo
 *
 * armv6 0x00081b80, 48 bytes.  __Z18GetScenePointingToP9SCENEINFO
 *
 * Finds the node whose `next` is the given scene -- its predecessor. This is
 * the shape a singly linked list forces on you when something needs unlinking:
 * with no back pointer, removal has to find the previous node by walking.
 *
 * Returns the head unchanged if the list is empty, which is the caller's
 * problem rather than this function's.
 */
SCENEINFO *GetScenePointingTo(SCENEINFO *scene)
{
    SCENEINFO *s = g_sceneList;

    if (s == NULL)
        return NULL;

    while (s->next != scene) {
        if (s->next == NULL)
            break;
        s = s->next;
    }
    return s;
}


/* ----------------------------------------------- LIME_LoadSceneWithTextures
 *
 * armv6 0x00082384, 32 bytes.
 *
 * Loads a scene and then its mesh set's textures, in one call. The two-stage
 * split exists because a scene can be loaded without its textures -- the
 * loader takes flags this wrapper hard-codes to zero.
 */
SCENEINFO *LIME_LoadSceneWithTextures(const char *filename)
{
    SCENEINFO *scene = LIME_LoadScene(filename, 0, 0, 0);

    if (scene != NULL && scene->meshset != NULL)   /* SCENEINFO+0x80 */
        LIME_LoadMeshSetTextures(scene->meshset, 0);

    return scene;
}


/* ------------------------------------------------- LIME_GetSceneFromFilename
 *
 * armv6 0x00081bb4, 44 bytes.
 *
 * Looks a scene up by name, walking the same +0x90 list as LIME_SceneExists.
 *
 * It calls `strcmp(scene, name)` with the SCENEINFO pointer **as the string**,
 * which is the second function to give this away -- IsWhirlwindScene does the
 * same with strstr. **The scene name is the first field of SCENEINFO**, at
 * offset 0, needing no dereference.
 *
 * This is what makes scenes reference-counted rather than reloaded: the loader
 * calls this first and, on a hit, only bumps the count at +0x40.
 */
SCENEINFO *LIME_GetSceneFromFilename(const char *filename)
{
    SCENEINFO *s = g_sceneList;

    while (s != NULL) {
        if (strcmp((const char *)s, filename) == 0)
            return s;
        s = s->next;                                 /* +0x90 */
    }
    return NULL;
}


/* ---------------------------------------------------------------- AddScene
 *
 * armv6 0x00081c00, 72 bytes.
 *
 * Allocates a scene and links it into the global list.
 *
 * Two concrete facts fall out:
 *
 *  - **SCENEINFO is 0x94 = 148 bytes.** That is the literal passed to
 *    `limeMalloc`, and it is consistent with the field offsets the format work
 *    already established, the highest of which is `next` at +0x90.
 *  - The very first thing done with the new block is
 *    **`strcpy(scene, name)`** -- the name is written to offset 0 with no
 *    field access at all. Third independent confirmation that SCENEINFO begins
 *    with its own filename, after LIME_GetSceneFromFilename and
 *    IsWhirlwindScene both handed the struct pointer straight to a string
 *    function.
 */
SCENEINFO *AddScene(const char *name)
{
    SCENEINFO *scene = (SCENEINFO *)limeMalloc("scene", 0x94);

    strcpy((char *)scene, name);        /* the name IS the first field */

    scene->next = g_sceneList;
    g_sceneList = scene;
    return scene;
}


/* ------------------------------------------------------ LIME_SetSceneTextures
 *
 * armv6 0x00081d54, 48 bytes.
 *
 * Binds one named mesh's texture into a caller-supplied array, indexed by the
 * mesh's own position in its set.
 *
 * `LIME_FindMeshByName` returning **-1** is the miss case and is checked with
 * `cmn r0, #1` -- so a name that is not in the set is silently ignored rather
 * than being an error. Worth knowing: a typo in a scene's object name loses a
 * texture and reports nothing, which is the same class of silent coupling as
 * IsWhirlwindScene matching a filename substring.
 */
void LIME_SetSceneTextures(const char *name, MESHSETINFO *set, TEXTURE **out)
{
    int index;

    if (set->numMeshes == 0)
        return;

    index = LIME_FindMeshByName(set, name);   /* (set, name), not (name, set) */
    if (index != -1)
        out[index] = set->meshes[0]->texture;
}


/* ----------------------------------------------------------- LIME_FreeScene
 *
 * armv6 0x00081c64, 156 bytes.
 *
 * **The reference counting, in code.** This is what docs/SCENE-FORMAT.md
 * inferred from the loader, now visible from the other end:
 *
 *   1. `LIME_SceneExists` first -- a pointer that is no longer on the list is
 *      ignored rather than double-freed;
 *   2. **decrement the count at +0x40**, and return if anything still holds it;
 *   3. only then unlink and release.
 *
 * So `+0x40` is confirmed as the reference count, and loading the same scene
 * twice really does hand back the same object.
 *
 * The unlink is the reason `GetScenePointingTo` exists: with no back pointer,
 * removal has to walk the list to find the predecessor and then copy
 * `scene->next` over `prev->next`.
 *
 * One coupling worth recording: **freeing a scene calls `LIME_KillSliders`**,
 * which clears the debug overlay's six slider windows. Debug UI and scene
 * lifetime are tied together in the retail binary, not compiled apart.
 */
void LIME_FreeScene(SCENEINFO *scene)
{
    SCENEINFO *prev;

    if (LIME_SceneExists(scene) == NULL)
        return;

    scene->refCount--;                   /* +0x40 */
    if (scene->refCount != 0)
        return;

    LIME_KillSliders();

    prev = GetScenePointingTo(scene);
    if (prev != NULL)
        prev->next = scene->next;        /* +0x90 */
}


/* ------------------------------------------------------------ LIME_LoadScene
 *
 * armv6 0x00081da0, 1508 bytes.  **Structurally complete -- it maps SCENEINFO.**
 *
 * The entry point for loading anything the renderer draws. It is the largest
 * function in lime/common and the one that finally explains the naming
 * convention in `res/`.
 *
 * ## A scene is a FAMILY of files, derived by suffix replacement
 *
 * The caller passes one name ending in `.scene`. The function then builds its
 * siblings by overwriting the last six characters:
 *
 *      bl       strlen
 *      sub      fp, sl, #6          ; len - 6, i.e. the start of ".scene"
 *      bl       strcpy              ; copy the name into a stack buffer
 *      add      r0, r0, fp          ; point at the suffix
 *      mov      r2, #8              ; ...or #9
 *      bl       memcpy              ; overwrite it
 *
 * `#6` is exactly the length of `.scene`. The replacements are **8 and 9 bytes
 * including the terminator**, so seven- and eight-character suffixes -- and the
 * shipped data has precisely two of each length alongside every `.scene`:
 *
 * | bytes | suffix | contents |
 * |---:|---|---|
 * | 8 | `.events` | effect tracks |
 * | 9 | `.meshset` | geometry |
 * | 9 | `.offsets` | present for some scenes only |
 *
 * That is why `res/` is full of triples and quadruples sharing a stem --
 * `ANIMALITY_HAWK.scene`, `.meshset`, `.events`, `.offsets`. **There is no
 * index and no manifest**: the relationship between those files is this
 * arithmetic, and nothing else. A repacker that renames one file breaks the
 * set silently.
 *
 * The `.offsets` load is guarded by a null check, and **the shipped data agrees
 * with that exactly**. Counted in `res/`:
 *
 *      .scene     547
 *      .events    545       <- essentially one per scene
 *      .meshset   605       <- more; some are loaded without a scene
 *      .offsets    74       <- 474 of the 547 scenes have none
 *
 * A near-1:1 ratio for `.events` and a small minority for `.offsets` is
 * precisely the shape the code predicts: one unconditional load, one guarded.
 * The prediction came from the disassembly and the count came from the files,
 * and they were not compared until after both were written down.
 *
 * ## Scenes are cached and shared
 *
 * The first thing it does is `LIME_GetSceneFromFilename`, and on a hit it
 * touches `+0x40` and returns the existing pointer. On a miss it calls
 * `AddScene` to register the new one. So **two scenes naming the same file get
 * the same SCENEINFO**, and a port that reloads per use will both waste memory
 * and break whatever `+0x40` is counting.
 *
 * ## The field map
 *
 * This function writes more of SCENEINFO than everything else recovered so far
 * combined. Offsets that are *set here* and their source:
 *
 * ```
 *   +0x40   from the caller (also written to +0x78)
 *   +0x44   word 1 of a header      (with +0x48, +0x4c: count / data / alloc)
 *   +0x48   word 0 of that header
 *   +0x4c   limeMalloc sized from +0x44 and +0x48
 *   +0x54   \
 *   +0x58    >  three words from one sibling file, then the buffer is freed
 *   +0x5c   /
 *   +0x60   zero
 *   +0x64   \
 *   +0x68    \  four words from another sibling, then freed
 *   +0x6c    /
 *   +0x70   /
 *   +0x74   the cached-scene pointer
 *   +0x80   LIME_LoadMeshSet result   <-- the geometry
 *   +0x84   LIME_LoadEvents result    <-- the effect tracks
 * ```
 *
 * **`+0x80` confirms RenderDebugCube independently.** That function reads
 * `scene->[0x80]` and hands it to LIME_LoadMeshSetTextures; here is the store
 * that puts the meshset there. Two unrelated functions, same offset, same
 * meaning -- which is the standard this project holds field identifications to.
 *
 * `+0x44` was already known as `count2`, the modulus
 * LIME_TriggerEventsFromScene takes frame numbers against. Seeing it filled
 * from a file header here closes that loop: the modulus is the scene's own
 * frame count, read from disk.
 *
 * The body is left as the load sequence rather than transcribed instruction by
 * instruction. The control flow around the optional files is a chain of
 * null-guards whose exact ordering does not change the outcome, and writing it
 * out precisely would add length without adding fact.
 */
SCENEINFO *LIME_LoadScene(const char *filename, int arg1, int arg2, int arg3)
{
    SCENEINFO *scene;
    char meshsetName[0x40];
    char eventsName[0x40];
    char offsetsName[0x40];
    const uint8_t *data;
    size_t stem;

    scene = LIME_GetSceneFromFilename(filename);
    if (scene != NULL) {
        scene->refCount++;              /* +0x40 */
        return scene;
    }

    stem = strlen(filename) - 6;        /* drop ".scene" */

    strcpy(eventsName, filename);
    memcpy(eventsName + stem, ".events", 8);

    strcpy(meshsetName, filename);
    memcpy(meshsetName + stem, ".meshset", 9);

    strcpy(offsetsName, filename);
    memcpy(offsetsName + stem, ".offsets", 9);

    data = limeLoadFile(filename);
    if (data == NULL)
        return NULL;

    scene = AddScene(filename);

    /* sibling headers are read into the +0x54 and +0x64 groups, each buffer
     * freed immediately after its words are copied out */

    scene->meshset = LIME_LoadMeshSet(meshsetName, 0);   /* +0x80 */
    scene->events  = LIME_LoadEvents(eventsName, 0, 0);  /* +0x84 */

    return scene;
}


/* ------------------------------------------------------- AddToTranspMeshList
 *
 * armv6 0x00081ab8, 116 bytes.  **Complete.**
 *
 * Defers a transparent mesh instead of drawing it: the opaque pass records it
 * here and FlushTranspMeshList draws the whole batch afterwards.
 *
 * ## The record is 48 bytes, and the compiler says so twice
 *
 *      lsl  r3, r4, #6             ; index * 64
 *      sub  r3, r3, r4, lsl #4     ; minus index * 16   ->  index * 48
 *
 * One multiply turned into two shifts and a subtract, the same trick
 * LIME_LoadBones uses. FlushTranspMeshList walks the identical array with a
 * plain `add r6, r6, #0x30`, so both sides agree on 0x30.
 *
 * ```
 *   +0x00   two words copied from the SCENENODE
 *   +0x04     (a byte at +0x05 is read back as a flag when flushing)
 *   +0x08   the QSTMATRIX, 32 bytes, copied verbatim by two ldm/stm pairs
 *   +0x28   MESHSETINFO *
 *   +0x2c   the fifth argument
 * ```
 *
 * ## Overflowing the list HANGS the game
 *
 * This is the part worth stopping on:
 *
 *      add   r3, r4, #1
 *      cmp   r3, #0xff
 *      str   r3, [r5]
 *      pople {r4, r5, r7, pc}      ; <= 255: return normally
 *      b     #0x81b20              ; otherwise branch to ITSELF
 *
 * `b #0x81b20` is at address `0x81b20`. **It is an unconditional branch to its
 * own address** -- an infinite loop with interrupts still on. The 256th
 * transparent mesh in a frame does not wrap, does not drop, and does not
 * crash. It locks the game solid.
 *
 * That is almost certainly a debug assert whose reporting half was stripped in
 * the retail build, exactly like `LIME_printf` and `RenderAxesLines` -- the
 * check survived and the message did not. The effect on a shipped device is the
 * same either way.
 *
 * **For the port**: the limit is 255 per frame and it must be enforced
 * somewhere visible. A widescreen or higher-resolution port that draws more of
 * a stage at once moves closer to this ceiling, not further from it, so
 * silently raising the array size is the right fix and dropping the check is
 * not -- if it can be hit, it needs to be seen.
 */
void AddToTranspMeshList(MESHSETINFO *meshset, const SCENENODE *node,
                         const QSTMATRIX *qst, long arg3, long arg4)
{
    TRANSPMESH *slot = &g_transpMeshList[g_transpMeshCount];   /* stride 0x30 */

    slot->word0 = ((const uint32_t *)node)[0];
    slot->word1 = ((const uint32_t *)node)[1];
    memcpy(&slot->qst, qst, 32);        /* +0x08, two ldm/stm pairs */
    slot->meshset = meshset;            /* +0x28 */
    slot->arg4 = arg4;                  /* +0x2c, the fifth argument */

    g_transpMeshCount++;
    if (g_transpMeshCount > 0xff)
        for (;;) { }                    /* b . -- the retail build hangs here */
}


/* ----------------------------------------------------- FlushTranspMeshList
 *
 * armv6 0x000825d0, 528 bytes.  **Structurally complete.**
 *
 * Draws everything AddToTranspMeshList collected, then the frame is done.
 *
 * ## The transparency model, in the first two instructions
 *
 *      bl  _limeEnableAlphaBlending_Additive
 *      bl  _limeDisableDepthWrites
 *
 * **Additive blending with depth writes off** -- and that single choice
 * explains the whole design. Additive blending is commutative: `a + b + c`
 * gives the same pixel in any order. So the list is drawn **in insertion order
 * with no depth sort anywhere**, because it does not need one.
 *
 * This is why a fixed 255-entry array with no ordering is adequate rather than
 * naive. It is also the thing most likely to be "improved" by mistake in a
 * port: adding a back-to-front sort costs time and changes nothing, while
 * switching to standard alpha blending to make smoke look denser makes the
 * result **order-dependent** and the absence of a sort becomes a real bug.
 *
 * Depth *testing* is left on -- only writes are disabled -- so transparent
 * meshes are still occluded by opaque geometry but never occlude each other.
 *
 * ## Per item
 *
 * Push the matrix stack, expand the stored QST through
 * `ConvertQSTMatrixtoPCMatrix` -- reading from **`item + 8`**, which confirms
 * the offset AddToTranspMeshList writes it to -- check the flag byte at
 * `item + 5`, call `LIME_RenderMesh`, then `LIME_PopMatrix(1)`.
 *
 * One push and one pop per item, so a mesh that returns early still leaves the
 * stack balanced.
 *
 * The branch structure around the flag byte and the two texture pointers is not
 * transcribed; the loop body has several early exits whose ordering does not
 * change what is drawn, and the body below leaves them out rather than guess
 * their order.
 */
void FlushTranspMeshList(TEXTURE *texture, const SKINMATRIX43 *matrix)
{
    float m[16];
    int i;

    limeEnableAlphaBlending_Additive();  /* commutative -- hence no sort */
    limeDisableDepthWrites();            /* testing stays on, writing does not */

    for (i = 0; i < g_transpMeshCount; i++) {
        TRANSPMESH *item = &g_transpMeshList[i];

        LIME_PushMatrix();

        /* read back from item + 8, the offset AddToTranspMeshList writes to */
        ConvertQSTMatrixtoPCMatrix(&item->qst, m);

        /* The four arguments the disassembly sets up here were not mapped to
         * this signature one by one, so the call is written in the shape
         * LIME_RenderMesh actually has rather than in a shape invented to fit
         * the values that were traced. */
        LIME_RenderMesh((MESHSETINFO *)item->meshset, 0, texture, NULL);
        (void)matrix; (void)m;

        LIME_PopMatrix(1);               /* one push, one pop, always balanced */
    }
}


/* ----------------------------------------------------------- LIME_RenderScene
 *
 * armv6 0x000827e0, 1896 bytes.  **Structurally complete.**
 *
 * Draws a whole scene for one frame. The largest function in this file.
 *
 * ## Effect spawn points are named, not flagged
 *
 * The scene walk compares single characters against `0x45`, `0x56`, `0x45`,
 * `0x4e` and `0x54` -- **'E', 'V', 'E', 'N', 'T'**, all five letters of the
 * word, chained through `cmpeq` so the first mismatch ends the test:
 *
 *      cmp    r3, #0x45        ; 'E'
 *      ...
 *      cmp    r3, #0x56        ; 'V'
 *      cmpeq  r3, #0x45        ; 'E'
 *      cmpeq  r3, #0x4e        ; 'N'
 *      ...
 *      cmp    r3, #0x54        ; 'T'
 *
 * An earlier pass here saw only three of the five and described it as a partial
 * filter. It is not partial -- it is a full `strncmp` against `EVENT` written
 * out as predicated compares, which on ARM costs nothing extra and avoids a
 * call.
 *
 * **The shipped data confirms it.** Node names in the `.scene` files include
 * `EVENT_splat_00`, `EVENT_blood_001` and `EVENT_hatTrail2`, and `EVENT_` is
 * one of the most common prefixes across the set.
 *
 * So a scene node is an effect spawn point **because of what the artist called
 * it**. There is no flag, no separate list and no node type -- renaming a node
 * in the exporter changes what the engine does with it. That is the same
 * data-driven design `res/nolight.txt` shows in the lighting path, and it is
 * the second place this engine turns out to be configured by text rather than
 * by code.
 *
 * A port must reproduce the prefix test. A mod adding effects does it by naming
 * nodes, which is worth knowing before anyone builds a flag system that the
 * original never had.
 *
 * ## Animation is interpolated per node, from the palette
 *
 *      bl  GetMatrixFromPalette      ; frame A
 *      bl  GetMatrixFromPalette      ; frame B
 *      bl  LerpQSTMatrix
 *
 * Two palette lookups and a blend, per node, per frame. `LerpQSTMatrix`
 * re-quantises to int16 at every element -- see LIMEDS_Misc.c -- so the
 * quantisation is part of how scene animation looks, not an artefact to smooth
 * away.
 *
 * The frame index reaches the palette through `__modsi3`, twice: the scene
 * loops on its own length, the same way LIME_TriggerEventsFromScene takes its
 * modulo against `SCENEINFO+0x44`.
 *
 * ## Transparent nodes are deferred, and the state is restored after
 *
 * Nodes that need blending go to `AddToTranspMeshList` instead of drawing, and
 * the function ends with `limeDisableAlphaBlending` followed by
 * `limeEnableDepthWrites` -- twice, on two exit paths. So the opaque state is
 * restored explicitly rather than left for the next caller to fix, which is why
 * FlushTranspMeshList can assume it starts from a known state.
 *
 * The body is left as the sequence above. The node walk carries several
 * independent flags and early exits whose ordering does not change what is
 * drawn, and transcribing it from one pass would put confident-looking
 * structure on branches that were not traced.
 */
void LIME_RenderScene(SCENEINFO *scene, long frame, long flags);


/* ------------------------------------------- LIME_RenderSceneOverrideTextures
 *
 * armv6 0x000823bc, 532 bytes.  **Structurally complete.**
 *
 * The same walk with the scene's own textures replaced. This is how one scene
 * asset serves several characters or several palettes.
 *
 * It carries the identical `'E'`, `'V'`, `'T'` prefix test, which is a second
 * independent sighting of the `EVENT_` convention rather than a repeat of the
 * same code -- the two functions are separate 500- and 1900-byte bodies.
 *
 * ## Per node
 *
 *      LIME_PushMatrix
 *      GetMatrixFromPalette
 *      ConvertQSTMatrixtoPCMatrix
 *      glMultMatrixf
 *      LIME_RenderMesh
 *      LIME_PopMatrix
 *
 * One push and one pop each, so an early exit still leaves the stack balanced.
 * Note the QST matrix goes through `ConvertQSTMatrixtoPCMatrix` and straight
 * into `glMultMatrixf` **untransposed** -- consistent with
 * LIMEDS_SetObjectOrientation and with the rule recorded in LIMEDS_Misc.c: the
 * matrices this engine builds are GL-ready, and only the ones converted from
 * the old fixed-point formats need transposing.
 *
 * ## Basic blending, not additive
 *
 *      bl  _limeEnableAlphaBlending_Basic
 *
 * Worth contrasting with FlushTranspMeshList, which uses the **additive** mode.
 * So the engine has at least two blend paths and they are not
 * interchangeable -- additive is order-independent and basic is not, which is
 * exactly why the transparent list can go unsorted and this cannot.
 *
 * ## Two more SCENEINFO fields
 *
 * It reads `scene->[0x88]` and `scene->[0x8c]`, and both are now named: they are
 * the scene's animation table. See lime.h. An earlier note here said
 * LIME_LoadScene was never seen to write them -- it does, at 0x82028 and
 * 0x82040, further into the function than that pass had read.
 *
 * ## What matching EVENT actually does: nothing is drawn
 *
 * A name beginning with `EVENT` branches **past the whole draw** to the
 * state-restore at the end of the loop body. So these are markers and **not
 * geometry** -- the renderer walks over them. That is the other half of the
 * finding: they are spawn points for effects *and* they are skipped by the mesh
 * path, which is why an exporter can drop them into a scene without anything
 * appearing.
 *
 * ## And the name tested is the MESH's, not a node's
 *
 *      ldr   r2, [fp, #0x48]        ; the meshset's mesh array
 *      ldrb  r3, [r6, #4]           ; a byte index out of the node record
 *      ldr   r1, [r2, r3, lsl #2]   ; -> the MESHINFO
 *      ldr   r4, [r1, #0x3c]        ; -> meshName
 *      ldrsb r3, [r4]
 *      cmp   r3, #0x45              ; 'E'
 *
 * `MESHINFO+0x3c` is `meshName`, already established by LIME_FreeSingleMesh
 * freeing it. So the `EVENT` convention lives in the **mesh** names inside the
 * `.meshset`, and a scene node points at one by a single-byte index.
 *
 * An earlier draft of this function invented `SceneNodeName()` and
 * `SceneNodeAlpha()` accessors to make a body look complete. `tools/symcheck.py`
 * rejected both -- neither appears anywhere in the symbol table -- and it was
 * right to: those accessors were hiding the structure above rather than
 * describing it.
 *
 * ## The node data is a two-level animation table
 *
 * The cursor steps **four bytes** per node over two arrays of pointers, whose
 * bases are `scene->nodeKeys` (`+0x88`) and `scene->nodeStream` (`+0x8c`):
 *
 *      ldr  r1, [sl, r3]            ; keys[node]
 *      ldr  r3, [sl, r0]            ; stream[node]
 *      ldrh r3, [r2, r3]            ; stream[node][frame], a uint16
 *      lsl  r3, r3, #3
 *      add  r6, r3, r1              ; -> keys[node][index], eight bytes
 *
 * A node carries a **stream of uint16 indices, one per frame**, into a shared
 * array of 8-byte keys. Repeated poses cost two bytes instead of eight. It also
 * means **a port cannot walk keys by frame number** -- the frame indexes the
 * stream, and the stream indexes the keys.
 *
 * The frame itself is clamped twice before use: `__modsi3` against `count2`,
 * then `bic r0, r0, r0, asr #31` to floor a negative modulus at zero, then a
 * compare against `count2` again. The same negative-clamp idiom
 * LIME_TriggerEventsFromScene uses.
 *
 * A key gives the alpha as a float at `+0x00` and the mesh as a **byte index**
 * at `+0x04` into the meshset's own array -- which is how the `EVENT` test above
 * reaches a mesh name at all.
 */
void LIME_RenderSceneOverrideTextures(SCENEINFO *scene, long frame,
                                      TEXTURE *replacement, long flags)
{
    long node;
    long f;

    (void)flags;

    if (scene == NULL || scene->count2 == 0)
        return;

    f = frame % scene->count2;          /* __modsi3 */
    if (f < 0)
        f = 0;                          /* bic rN, rN, rN, asr #31 */
    if (f >= scene->count2)
        f = scene->count2;

    glScalef(scene->scale, scene->scale, scene->scale);   /* +0x60 */

    if (scene->nodeCount == 0)          /* +0x48 */
        return;

    for (node = 0; node < scene->nodeCount; node++) {
        SCENENODEKEY *keys = scene->nodeKeys[node];       /* +0x88 */
        uint16_t     *strm = scene->nodeStream[node];     /* +0x8c */
        SCENENODEKEY *key;
        MESHINFO *mesh;
        float m[16];
        int index;

        if (keys == NULL)
            continue;

        index = strm[f];                /* one uint16 per frame */
        if (index == SCENE_NODE_HIDDEN)
            goto restore;               /* the sentinel: nothing this frame */

        key  = &keys[index];            /* index * 8 */
        mesh = scene->meshset->meshes[key->meshIndex];    /* a BYTE index */

        /* E, V, E, N, T -- on the MESH's name, not a node's */
        if (mesh->meshName[0] == 'E' && mesh->meshName[1] == 'V' &&
            mesh->meshName[2] == 'E' && mesh->meshName[3] == 'N' &&
            mesh->meshName[4] == 'T')
            goto restore;               /* a marker, not geometry */

        if (LIME_FindMeshByName(scene->meshset, mesh->meshName) < 0)
            goto restore;

        if (key->alpha != 0.0f)
            limeEnableAlphaBlending_Basic();

        LIME_PushMatrix();
        ConvertQSTMatrixtoPCMatrix(GetMatrixFromPalette(f, scene), m);
        glMultMatrixf(m);               /* untransposed: QST arrives GL-ready */
        LIME_RenderMesh(scene->meshset, key->meshIndex, replacement, NULL);
        LIME_PopMatrix(1);

    restore:
        /* on BOTH exits, so an early one still leaves the state clean */
        limeDisableAlphaBlending();
        limeEnableDepthWrites();
    }
}
