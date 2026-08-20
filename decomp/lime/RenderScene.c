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
    g_transpMeshList = 0;
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
    SCENEINFO *scene = LIME_LoadScene(filename, 0, 0);

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

    index = LIME_FindMeshByName(name, set);
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
