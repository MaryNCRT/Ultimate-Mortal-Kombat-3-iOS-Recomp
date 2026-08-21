/*
 * lime/common — the engine's own global state.
 *
 * Every object here has a real symbol in the retail binary. They are gathered
 * into one translation unit because the original spread them across the .cpp
 * files that used them, and a decompilation that mirrors that would need each
 * file to both declare and define them — which is how you end up with two
 * definitions and a link error nobody can place.
 *
 * **These are engine data, not runtime data.** Anything the platform provides
 * (limeLoadFile, limeMalloc, the GL entry points) is deliberately NOT here;
 * those belong to runtime/ and are only declared in lime.h.
 *
 * Sizes and initial values are stated only where the disassembly gives them.
 * Where it does not, the object is defined at its natural size and left zeroed,
 * which is what __DATA,__common means anyway.
 */

#include "lime.h"


/* ---------------------------------------------------------------- events
 *
 * A fixed pool: 192 slots of 248 bytes, 47,616 bytes total. Confirmed three
 * ways — the allocator, FindEventOffsets stepping 0xf8, and LIME_UpdateEvents
 * ending at a sentinel of base + 0xb900 + 8, which is exactly 0xBA00 minus one
 * slot. Never grown, never reallocated.
 */
EVENT            g_events[EVENT_SLOTS];

/* The scratch track LIME_PlayFBXAtPos overwrites on every call. Static in the
 * original too, which is what makes that function non-reentrant. */
SCENEEVENTTRACK  g_fbxScratchTrack;
limeMATRIX44     g_fbxScratchMatrix;

/* Walked as raw bytes by FindIdInMasterOffsets. The record layout is not
 * established, so this is a byte pointer rather than a typed array. */
const char      *g_masterOffsets;
int              g_masterOffsetCount;

/* The scene cache. AddScene and LIME_GetSceneFromFilename both walk it through
 * SCENEINFO+0x90, so it is a singly linked list with this as its head. */
struct SCENEINFO *g_sceneList;


/* ------------------------------------------------------ transparent meshes
 *
 * 255 entries of 48 bytes. `_NumTranspMeshes` is the counter's name in the
 * symbol table, and ClearTranspMeshList resets it rather than touching the
 * array — the slots are overwritten in place on the next frame.
 *
 * Overflowing this hangs the game. See docs/GAME-BUGS.md.
 */
TRANSPMESH       g_transpMeshList[TRANSPMESH_MAX];
int              g_transpMeshCount;


/* ------------------------------------------------------------ debug overlay
 *
 * The window array LIME_InitDebugWindow walks and ClearDebugWindow indexes,
 * with -1 meaning "no window". Sliders occupy slots 10 through 15.
 */
DEBUGWINDOW      g_debugWindows[DEBUG_WINDOWS];
int              g_debugWindowEnabled;

/* RenderDebugCube's lazily loaded scene, and the flag that gates it. */
int              g_debugEnabled;
struct SCENEINFO *g_debugCubeScene;


/* ---------------------------------------------------------------- lighting
 *
 * Two directional lights, monochrome, no ambient term. Held as bare float[3]
 * because NormaliseLDirs indexes them with [0], [1], [2].
 *
 * The initial values are not recovered — the game sets them per scene — so they
 * start zeroed. NormaliseLDirs divides by the length, and a zero-length vector
 * would produce a division by zero here where the original never sees one, so a
 * caller must set them before the first normalise.
 */
float            g_lightDir0[3];
float            g_lightDir1[3];
float            g_lightPower0, g_lightPower1;
float            g_lightExp0,   g_lightExp1;

/* Scales the lit value into a 0..255 grey byte. The literal sits in a pool this
 * pass did not resolve; 255.0f is the value that makes the surrounding clamp
 * (`s < 0 ? 0 : (unsigned char)s`) cover the full range, and it is marked here
 * as the assumption it is rather than presented as recovered. */
const float      LIGHT_SCALE = 255.0f;


/* --------------------------------------------------------------- skinning
 *
 * CreateMatrixPaletteRecurse2 walks the skeleton depth-first and consumes these
 * as it goes: one animation frame per bone in tree order, one 48-byte matrix
 * written per bone. The traversal is stateful rather than parameterised, so
 * these are genuinely globals and not locals hoisted out by the compiler.
 */
const uint8_t   *g_animFrameCursor;
const uint8_t   *g_animFrameCursor2;
SKINMATRIX43    *g_paletteCursor;
SKINMATRIX43    *g_matrixPalette;
int              g_boneCounter;
float            g_rootPosition[3];


/* ----------------------------------------------------------- full-bright
 *
 * The table IsTextureFullBright searches, and the flag that makes the parse
 * happen once. 4100 bytes in __DATA,__common — the distance to the next symbol
 * — which is exactly 4 + 64 * 64.
 */
FULLBRIGHTINFO   TheFullBrightInfo;
int              FullBrightLoaded;

/* CreateFadedLookupTable's [levels][256] byte table and its one-time flag. */
int              g_fadeTableBuilt;
uint8_t         *g_fadeTable;


/* -------------------------------------------------------- gamecode bridge
 *
 * KillIllegalWhirlwinds dereferences these (`*g_stateA`), so they are pointers
 * into state that lives in gamecode rather than in the engine. lime/common only
 * reads through them; nothing here owns the storage.
 */
int             *g_stateA;
int             *g_stateB;
int              g_whirlwindFirstFrame;
