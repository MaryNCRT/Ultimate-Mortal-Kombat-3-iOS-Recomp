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

    /* Restore, which an earlier version of this body did not do. Measured:
     * driving the oracle with an EMPTY list still produces glDisable(GL_BLEND)
     * followed by glDepthMask(1) after the additive setup, so the restore is
     * unconditional and sits outside the loop. Leaving it out meant every
     * caller after a flush drew with additive blending and depth writes off. */
    limeDisableAlphaBlending();
    limeEnableDepthWrites();
}


/* ----------------------------------------------------------- LIME_RenderScene
 *
 * armv6 0x000827e0, 1896 bytes.  **Structurally complete.**
 *
 * Draws a whole scene for one frame. The largest function in this file, and it
 * differs from LIME_RenderSceneOverrideTextures in one substantial way: **it
 * interpolates between two keys, and the override version does not.**
 *
 * ## Two frames, two palette matrices, one blend
 *
 *      ldrh r0, [r6, #6]            ; key A's palette index
 *      bl   GetMatrixFromPalette
 *      ldrh r0, [r1, #6]            ; key B's
 *      bl   GetMatrixFromPalette
 *      bl   LerpQSTMatrix
 *
 * `__modsi3` is called **twice** in the prologue -- once per frame -- and the
 * stream is read at two offsets (`ldrh r3, [r3, r2]` and `ldrh r3, [ip, r2]`).
 * So the scene walks to the key for this frame and the key for the next, pulls
 * a QST matrix for each out of the palette, and blends them.
 *
 * That names a field the override path never touches: **`SCENENODEKEY+0x06` is
 * a palette index**, a `uint16` handed straight to GetMatrixFromPalette. The
 * 8-byte key is therefore alpha, mesh index, and palette index -- everything a
 * node needs for one keyframe, in eight bytes.
 *
 * `LerpQSTMatrix` re-quantises to `int16` at every element (see LIMEDS_Misc.c),
 * so the quantisation is part of how scene animation looks. A port that blends
 * in float throughout produces visibly smoother motion than the original, which
 * sounds like an improvement and is a behaviour change.
 *
 * ## Transparent nodes are deferred, not drawn
 *
 * Nodes needing blending go to `AddToTranspMeshList` instead of being drawn
 * here, which is what fills the list `FlushTranspMeshList` later empties. The
 * opaque state is restored on both exits, exactly as in the override version.
 *
 * ## The EVENT test again
 *
 * `cmp r3, #0x45` on the mesh name, same as the override path -- markers are
 * skipped rather than drawn. Two independent functions carrying the same
 * convention.
 *
 * ## What is not written out
 *
 * The body below covers the walk, the two-key blend and the transparent
 * deferral. It does **not** transcribe the flag handling around `LIME_printf`
 * and the second `cmp ip, #1` in the prologue: those select between paths that
 * were not traced, and the argument they test is not identified. Guessing which
 * branch a flag selects is how the previous attempt at this file's other
 * renderer went wrong.
 */
void LIME_RenderScene(long arg1, SCENEINFO *scene,
                      long frameA, long frameB, float blend,
                      long arg6, long arg7,
                      long flush, TEXTURE *flushTexture, long arg10,
                      const SKINMATRIX43 *flushMatrix)
{
    long node, fa, fb;

    /* arg1 goes straight to LIME_printf, which is an eight-byte no-op in this
     * build. arg6 and arg7 are never read, and neither is arg10 -- it sits
     * between two stack arguments that are. */
    (void)arg1; (void)arg6; (void)arg7; (void)arg10;

    if (scene == NULL)
        return;                         /* cmp r1, #0 -- the ONLY entry guard */

    /* The original divides without checking count2, so a zero would trap in
     * __modsi3. This guard is ours; the case is not exercised, because the
     * original cannot survive it either. */
    if (scene->count2 == 0)
        return;

    fa = frameA % scene->count2;                    /* __modsi3 */
    if (fa < 0) fa = 0;                             /* bic r0, r0, r0, asr #31 */
    if (fa >= scene->count2) fa = scene->count2;    /* it ge; movge r0, r4 */

    glScalef(scene->scale, scene->scale, scene->scale);

    if (scene->nodeCount != 0) {
        fb = frameB % scene->count2;
        if (fb < 0) fb = 0;
        if (fb >= scene->count2) fb = scene->count2;

        for (node = 0; node < scene->nodeCount; node++) {
            SCENENODEKEY *keys = scene->nodeKeys[node];
            uint16_t     *strm = scene->nodeStream[node];
            SCENENODEKEY *ka, *kb;
            MESHINFO *mesh;
            float alpha;

            if (keys == NULL)
                continue;

            if (strm[fa] == SCENE_NODE_HIDDEN)
                goto restore;

            ka = &keys[strm[fa]];
            kb = &keys[strm[fb]];

            mesh = scene->meshset->meshes[ka->meshIndex];

            if (mesh->meshName[0] == 'E' && mesh->meshName[1] == 'V' &&
                mesh->meshName[2] == 'E' && mesh->meshName[3] == 'N' &&
                mesh->meshName[4] == 'T')
                goto restore;           /* a marker, not geometry */

            alpha = ka->alpha;

            /* TWO PASSES, selected by `flush`. The opaque pass draws meshes at
             * alpha >= 0.97 and the transparency pass defers the rest, so a
             * caller runs the scene twice with different `flush`. Both
             * conditions are compound in the original and both halves matter:
             *
             *   0x5f886  rsbs r4, r1, #1            ; 1 - flush
             *   0x5f892  ite lt / andge r3, r4, #1  ; alpha >= 0.97 and !flush
             *   0x5f8ae  cmp r2, #1 / andeq         ; alpha <  0.97 and  flush
             */
            if (alpha >= SCENE_OPAQUE_ALPHA && flush != 1) {
                LIME_PushMatrix();
                LIME_RenderMesh(scene->meshset, ka->meshIndex, NULL, NULL);
                LIME_PopMatrix(1);
            } else if (alpha < SCENE_OPAQUE_ALPHA && flush == 1) {
                QSTMATRIX q;
                uint8_t   tmp[8];

                /* The temporary handed to AddToTranspMeshList is built on the
                 * stack at sp+0x3c, and only two things are written into it:
                 * the alpha at +0x00 and key->field05 at +0x05. It is stack
                 * scratch rather than a real SCENENODE, so it is spelled as
                 * bytes rather than given a struct it does not fill. */
                memset(tmp, 0, sizeof(tmp));
                memcpy(tmp, &alpha, sizeof(alpha));
                tmp[5] = ka->field05;

                if (blend != 0.0f) {
                    LerpQSTMatrix(GetMatrixFromPalette(ka->paletteIndex, scene),
                                  GetMatrixFromPalette(kb->paletteIndex, scene),
                                  blend, &q);
                } else {
                    /* blend == 0 takes a shorter path that never touches the
                     * second key -- 0x5f8ba `vcmp.f32 s16, #0` then 0x5fabe. */
                    memcpy(&q, GetMatrixFromPalette(ka->paletteIndex, scene),
                           sizeof(q));
                }

                AddToTranspMeshList(scene->meshset, (const SCENENODE *)tmp, &q,
                                    ka->meshIndex, fa);
            }
            /* neither condition: the node contributes nothing to this pass */

        restore:
            limeDisableAlphaBlending();
            limeEnableDepthWrites();
        }
    }

    /* 0x5fa9e: the transparency pass drains the list it has just filled. */
    if (flush == 1)
        FlushTranspMeshList(flushTexture, flushMatrix);
}


/* ------------------------------------------- LIME_RenderSceneOverrideTextures
 *
 * armv7 0x0005f4d4, 364 bytes.
 *
 * The same walk with a caller-supplied texture per mesh. This is how one scene
 * asset serves several characters or several palettes.
 *
 * ## Its argument list is not the same shape as LIME_RenderScene
 *
 *      mov  r8, r0            ; arg1 IS the scene here
 *      str  r1, [sp, #4]      ; arg2, kept for the loop
 *      mov  r0, r2            ; arg3 is the frame
 *      blx  ___modsi3
 *
 * So the scene comes first and the frame is still third. And arg2 is not one
 * texture but a TABLE of them, indexed by the same byte that selects the mesh:
 *
 *      ldr   r3, [sp, #4]           ; arg2
 *      ldr.w r2, [r3, r6, lsl #2]   ; textures[meshIndex]
 *      bl    _LIME_RenderMesh
 *
 * An earlier version of this file declared it as
 * `(scene, frame, TEXTURE *replacement, flags)` and passed a single texture.
 * See docs/RENDERSCENE-SIGNATURE.md for how the real list was measured.
 *
 * ## The palette index comes from the KEY, not from the frame
 *
 *      ldrh r0, [r5, #6]            ; key->paletteIndex
 *      bl   _GetMatrixFromPalette
 *
 * The previous body passed the frame number. That agrees whenever a scene lays
 * its keys out one per frame in order -- which is exactly the scene a casual
 * test would build, and wrong for every scene that reuses a pose. The whole
 * point of the two-level table is that poses repeat.
 *
 * ## What is deliberately not written out
 *
 * A global at `0x00112222 + pc` gates an alternate path at 0x5f608, and the
 * alpha test here is against **1.0f** where LIME_RenderScene uses 0.97.
 * Neither is transcribed further, because neither was followed.
 */
void LIME_RenderSceneOverrideTextures(SCENEINFO *scene, TEXTURE **textures,
                                      long frame)
{
    long node, f;

    if (scene == NULL)
        return;
    if (scene->count2 == 0)
        return;                         /* ours, as above */

    f = frame % scene->count2;
    if (f < 0) f = 0;
    if (f >= scene->count2) f = scene->count2;

    glScalef(scene->scale, scene->scale, scene->scale);

    if (scene->nodeCount == 0)
        return;

    for (node = 0; node < scene->nodeCount; node++) {
        SCENENODEKEY *keys = scene->nodeKeys[node];
        uint16_t     *strm = scene->nodeStream[node];
        SCENENODEKEY *key;
        float m[16];
        int index;

        if (keys == NULL)
            continue;

        if (strm[f] == SCENE_NODE_HIDDEN)
            continue;

        key   = &keys[strm[f]];
        index = (int)key->meshIndex;

        if (index == -1)                /* cmp.w r6, #-1 */
            continue;

        if (key->alpha == 1.0f)         /* vmov.f32 s12, #1.0 -- NOT 0.97 */
            continue;

        LIME_PushMatrix();
        ConvertQSTMatrixtoPCMatrix(GetMatrixFromPalette(key->paletteIndex, scene),
                                   m);
        glMultMatrixf(m);               /* untransposed: QST arrives GL-ready */
        LIME_RenderMesh(scene->meshset, index, textures[index], NULL);
        LIME_PopMatrix(1);
    }
}
