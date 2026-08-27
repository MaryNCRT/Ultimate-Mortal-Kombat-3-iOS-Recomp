/*
 * Players.c — src/gamecode/Players.cpp
 *
 * 28 functions in the original. Verified against the oracle by
 * tests/test_gamecode2_diff.c.
 */

#include <stdint.h>

typedef struct TEXTURE TEXTURE;
void limeDeleteTexture(TEXTURE *tex);

/* Only the one field this file touches is named. */
typedef struct PLAYER {
    uint8_t  _pad000[0x530];
    TEXTURE *altCostume;         /* 0x530 */
} PLAYER;

void DumpAltCostume(PLAYER *p);


/* ----------------------------------------------------------- DumpAltCostume
 *
 * armv7 0x0005bef0, 24 bytes.
 *
 * Frees the alternate-costume texture and clears the pointer. The clear is
 * inside the guard, so a player who never had one is left alone rather than
 * written to -- and a second call after the first is a no-op rather than a
 * double free. Both of those fall out of `cbz` skipping the store as well as
 * the call, which is easy to lose when the guard is rewritten as an early
 * return.
 */
void DumpAltCostume(PLAYER *p)
{
    if (p->altCostume != NULL) {
        limeDeleteTexture(p->altCostume);
        p->altCostume = NULL;
    }
}


/* Declared here rather than pulled from a header gamecode does not have. */
extern long WantedFrames[];             /* 0x00295cd4, terminated by -1 */
int printf(const char *fmt, ...);


/* --------------------------------------------------------------------- Error
 *
 * armv7 0x0005c334, 20 bytes.  **Complete.**
 *
 *      mov r1, r0
 *      ldr r0, ="!!!!! FATAL ERROR: %s\n"
 *      blx _printf
 *      b   .                       <- 0x5c342 branches to ITSELF
 *
 * **It does not return, and it does not exit.** The last instruction is a
 * branch to its own address: a deliberate hang, with the message already
 * printed. On a 2011 iPhone that is a frozen screen and a watchdog kill, which
 * is a reasonable thing to do when there is no console to read.
 *
 * A port must not quietly turn this into a return. Anything calling Error()
 * has decided the process is finished, and callers are written on that
 * assumption -- there is no error path after the call because the original
 * never comes back from it.
 */
void Error(const char *msg)
{
    printf("!!!!! FATAL ERROR: %s\n", msg);
    for (;;)
        ;                           /* b 0x5c342 -- the branch is to itself */
}


/* ------------------------------------------------------------- WantThisFrame
 *
 * armv7 0x0005b9b4, 40 bytes.  **Complete.**
 *
 * Linear search of `_WantedFrames` for `frame`, with -1 ending the list.
 * Returns 1 on a hit and 0 otherwise.
 *
 * The disassembly reads oddly because the compiler peeled the first iteration:
 * the entry test loads [r2] and jumps straight into the comparison, and only
 * the loop body advances by 4 and re-checks for the terminator. Written as a
 * plain loop below, which is the same thing.
 */
int WantThisFrame(long frame)
{
    long i;

    for (i = 0; WantedFrames[i] != -1; i++)
        if (WantedFrames[i] == frame)
            return 1;
    return 0;
}


/* ----------------------------------------------------------- IsOstrichProblem
 *
 * armv7 0x0005bb1c, 40 bytes.  **Complete.**
 *
 *      ldr  r3, [r0]
 *      cmp  r3, #0xc               <- character 12 and no other
 *      bne  return 0
 *      ldr  r3, [r0, #0x51c]
 *      movw r2, #0x127             <- 295
 *      cmp  r3, r2
 *      beq  return 1
 *      ldr  r0, [r0, #0x520]
 *      cmp  r0, r2
 *      -> r0 = (equal)
 *
 * Character 12 with either of two adjacent fields equal to 295. The name is the
 * developers': something about that character's animation misbehaves and this
 * is the test that spots it. Which character 12 is, and what 295 indexes, are
 * not established here -- the shape of the test is, and inventing names for the
 * two fields would be inventing the finding.
 */
int IsOstrichProblem(PLAYER *p)
{
    const long *w = (const long *)p;

    if (w[0] != 12)
        return 0;
    if (w[0x51c / 4] == 295)
        return 1;
    return w[0x520 / 4] == 295;
}


/* `_FrameRemapTable` — 0x002003d4. Pairs of words, and the loop below gives its
 * length: it runs from the base to base + 0xe268 in steps of 8, so 7,245
 * entries of two words. */
#define FRAME_REMAP_ENTRIES  7245

extern long FrameRemapTable[FRAME_REMAP_ENTRIES][2];    /* 0x002003d4 */


/* ------------------------------------------------------- ClearAnimRemapTables
 *
 * armv7 0x0005b8dc, 40 bytes.  **Complete.**
 *
 *      movs r3, #0
 *      str  r3, [r2, #-0x8]        <- first word: 0
 *      subs r3, #1
 *      str  r3, [r2, #-0x4]        <- second word: -1
 *      adds r2, #8
 *
 * **The two words are cleared to different values**, and that is the point: 0
 * in the first and -1 in the second. `subs r3, #1` on a register holding zero
 * is how the compiler produced the -1 without a second literal, which is easy
 * to read past.
 *
 * A memset would put zero in both and quietly change what an empty entry means.
 */
void ClearAnimRemapTables(void)
{
    int i;

    for (i = 0; i < FRAME_REMAP_ENTRIES; i++) {
        FrameRemapTable[i][0] = 0;
        FrameRemapTable[i][1] = -1;
    }
}


typedef int EPLAYER;
typedef struct FRONTEND_CHARACTER FRONTEND_CHARACTER;
void Preload1Character(EPLAYER who, FRONTEND_CHARACTER *fe, long a, long b);


/* ------------------------------------------------------ PreloadGameCharacters
 *
 * armv7 0x0005ce74, 40 bytes.  **Complete.**
 *
 * Walks a -1 terminated list of player ids and preloads each one, passing NULL
 * for the front-end character and 0 for the third argument, with the caller's
 * argument going through unchanged as the fourth.
 *
 * `ldr r0, [r4, #4]!` is the advance: pre-indexed with writeback, so the
 * terminator check at the bottom sees the NEXT entry and the loop needs no
 * separate increment.
 */
void PreloadGameCharacters(const EPLAYER *list, long arg)
{
    long i;

    for (i = 0; list[i] != -1; i++)
        Preload1Character(list[i], 0, 0, arg);
}


#define FE_CHARACTER_SLOTS  25
#define FE_CHARACTER_STRIDE 0x668

typedef struct ANIMATEDCHARACTER ANIMATEDCHARACTER;
int  FreeAnimatedCharacter(ANIMATEDCHARACTER *c);
void LIME_FreeScene(void *scene);

extern char TheFECharacters[FE_CHARACTER_SLOTS][FE_CHARACTER_STRIDE];  /* 0x0020e634 */


/* ------------------------------------------------------ FreeFrontEndCharacters
 *
 * armv7 0x0005bff8, 60 bytes.  **Complete.**
 *
 * Twenty-five slots of 0x668 bytes -- the loop runs from the base to base +
 * 0xa028 in steps of 0x668, which is where both numbers come from.
 *
 * Per slot, the character pointer lives at +4:
 *
 *      if (!c) continue
 *      if (c->scene) { LIME_FreeScene(c->scene); c->scene = 0; }
 *      FreeAnimatedCharacter(c)
 *
 * **The pointer is re-read from the slot after the scene is freed** (`ldr r2,
 * [r4, #4]` and again `ldr r0, [r4, #4]`), rather than being kept in a
 * register across the call. Transcribed as written: LIME_FreeScene taking a
 * path that could touch the slot is not something this function assumes it
 * cannot.
 */
void FreeFrontEndCharacters(void)
{
    int i;

    for (i = 0; i < FE_CHARACTER_SLOTS; i++) {
        void **slot = (void **)(TheFECharacters[i] + 4);
        void **c = (void **)*slot;

        if (c == 0)
            continue;

        if (c[0x10 / 4] != 0) {
            LIME_FreeScene(c[0x10 / 4]);
            ((void **)*slot)[0x10 / 4] = 0;
        }
        FreeAnimatedCharacter((ANIMATEDCHARACTER *)*slot);
    }
}


typedef struct PLAYERDEF PLAYERDEF;
void Load1Character(PLAYER *p, EPLAYER who, FRONTEND_CHARACTER *fe, long a, long b);


/* ---------------------------------------------------------- LoadGameCharacter
 *
 * armv7 0x0005cd70, 48 bytes.  **Complete.**
 *
 *      Load1Character(p, def[0], fe, 0, arg)
 *      p->[0x5e8] = 0
 *      p->[0]     = def[0]
 *      p->[0x5ec] = -1
 *      p->[0x530] = 0
 *
 * **`def[0]` is re-read from memory after the call** rather than kept in a
 * register, so Load1Character is allowed to change it and the value stored into
 * the player is whatever it holds afterwards. Caching it would be a different
 * program.
 *
 * +0x5ec starts at -1, the same "nobody" sentinel GameCodeInit uses for the
 * camera. +0x530 is the alt-costume texture DumpAltCostume frees, cleared here
 * so a freshly loaded character never inherits the previous one's.
 */
void LoadGameCharacter(PLAYER *p, PLAYERDEF *def, FRONTEND_CHARACTER *fe,
                       long arg)
{
    long *pw = (long *)p;
    const long *dw = (const long *)def;

    Load1Character(p, (EPLAYER)dw[0], fe, 0, arg);

    pw[0x5e8 / 4] = 0;
    pw[0]         = dw[0];          /* re-read, not cached across the call */
    pw[0x5ec / 4] = -1;
    pw[0x530 / 4] = 0;              /* the alt costume DumpAltCostume frees */
}


#define PRELOAD_STRIDE 0x5f4

extern int  NumPreloadedCharacters;     /* 0x00171358 */
extern char PreloadedCharacters[][PRELOAD_STRIDE];  /* 0x0028bc10 */
int IsAFrameVisible(ANIMATEDCHARACTER *c, long frame);


/* -------------------------------------------------------------- IsFrameVisible
 *
 * armv7 0x0005ba54, 68 bytes.  **Complete.**
 *
 *      if (c->field8 == 12 && (a == 295 || b == 295))
 *          return 0
 *      return IsAFrameVisible(c, b) | IsAFrameVisible(c, a)
 *
 * **The same 12 and 295 that IsOstrichProblem tests**, in a different file and
 * for a different purpose: that one asks whether a player is in the broken
 * state, this one refuses to draw the frame. Two functions independently
 * special-casing the same character and the same id says 295 is a real frame
 * that character 12 must not show, not a coincidence of constants.
 *
 * Note the argument order in the tail call: `b` is tested first, then `a`. The
 * OR makes it irrelevant to the result and it is transcribed as written.
 */
int IsFrameVisible(ANIMATEDCHARACTER *c, long a, long b)
{
    if (((const long *)c)[2] == 12 && (a == 295 || b == 295))
        return 0;

    return IsAFrameVisible(c, b) | IsAFrameVisible(c, a);
}


/* ------------------------------------------------- FreePreloadedCharacters
 *
 * armv7 0x0005c038, 56 bytes.  **Complete.**
 *
 * Frees the character at +8 of each of `NumPreloadedCharacters` slots, stride
 * 0x5f4, then zeroes the count.
 *
 * **The count is re-read from memory every iteration** (`mov r3, r6; add r3,
 * pc; ldr r3, [r3]`) rather than held in a register, so FreeAnimatedCharacter
 * is allowed to change it and the loop would notice. Hoisting it is the obvious
 * optimisation and it is a different program.
 */
void FreePreloadedCharacters(void)
{
    int i;

    if (NumPreloadedCharacters == 0)
        return;

    for (i = 0; i != NumPreloadedCharacters; i++)
        FreeAnimatedCharacter(*(ANIMATEDCHARACTER **)
                              (PreloadedCharacters[i] + 8));

    NumPreloadedCharacters = 0;
}


/* --------------------------------------------------- HavePreloadedCharacter
 *
 * armv7 0x0005b90c, 84 bytes.  **Complete.**
 *
 * Linear search of the preloaded slots for one whose first word is `who`,
 * returning the ANIMATEDCHARACTER at +8 of that slot, or NULL.
 *
 * The stride is built out of shifts rather than a multiply: `i*12`, then
 * `(i*12) << 7` for `i*1536`, then a subtract for `i*1524` -- 0x5f4, the same
 * stride FreePreloadedCharacters walks.
 *
 * The compiler peeled the first comparison, which is why slot 0 is tested
 * before the loop and the loop body starts at slot 1.
 */
ANIMATEDCHARACTER *HavePreloadedCharacter(EPLAYER who)
{
    int i;

    for (i = 0; i < NumPreloadedCharacters; i++)
        if (*(const long *)PreloadedCharacters[i] == (long)who)
            return *(ANIMATEDCHARACTER **)(PreloadedCharacters[i] + 8);

    return 0;
}


#define PLAYER_STRIDE  0x5f0

extern ANIMATEDCHARACTER *OrigLoadedPlayers[2];  /* 0x00295ccc */
extern char Players[];                           /* 0x001fa4d4 */


/* --------------------------------------------------------- FreeLevelCharacters
 *
 * armv7 0x0005c080, 68 bytes.  **Complete.**
 *
 *      FreePreloadedCharacters()
 *      if (OrigLoadedPlayers[0]) FreeAnimatedCharacter(it)
 *      if (OrigLoadedPlayers[1]) FreeAnimatedCharacter(it)
 *      OrigLoadedPlayers[1] = 0
 *      OrigLoadedPlayers[0] = 0                <- cleared in that order
 *      if (Players[0xb20]) DumpAltCostume(&Players[0x5f0])
 *
 * **The last test cross-checks two numbers from elsewhere in the file.** It
 * reads `Players + 0xb20` and, if set, calls DumpAltCostume on `Players +
 * 0x5f0`. 0xb20 - 0x5f0 = 0x530, which is exactly the field LoadGameCharacter
 * clears and DumpAltCostume frees. So the PLAYER stride is 0x5f0 and the alt
 * costume lives at +0x530 -- three functions in agreement, none of which
 * mentions the other.
 *
 * Only player TWO is checked. Player one's alt costume is not dumped here.
 */
void FreeLevelCharacters(void)
{
    FreePreloadedCharacters();

    if (OrigLoadedPlayers[0])
        FreeAnimatedCharacter(OrigLoadedPlayers[0]);
    if (OrigLoadedPlayers[1])
        FreeAnimatedCharacter(OrigLoadedPlayers[1]);

    OrigLoadedPlayers[1] = 0;
    OrigLoadedPlayers[0] = 0;

    /* player two only: 0x5f0 + 0x530 = 0xb20 */
    if (*(const long *)(Players + PLAYER_STRIDE + 0x530) != 0)
        DumpAltCostume((PLAYER *)(Players + PLAYER_STRIDE));
}


extern int *DoIntroPtr;                 /* pointer slot -> 0x0014e1c0 */
extern int *CurrentTaskPtr;             /* pointer slot -> 0x00150590 */


/* ------------------------------------------------------------- IsLiaProblem
 *
 * armv7 0x0005ba98, 132 bytes.  **Complete.**
 *
 *      if (DoIntro)          return 0
 *      if (CurrentTask == 3) return 0
 *      if (p->field00 != 6)  return 0
 *      return  p->field51c is one of {0xf1, 0x101, 0x105, 0xf8, 0xf9}
 *           || p->field520 is one of the same five
 *
 * **The same shape as IsOstrichProblem, one character over.** That one tests
 * character 12 against a single id; this tests character 6 against five, in the
 * same two adjacent fields at +0x51c and +0x520, and IsFrameVisible tests the
 * pair again from a third file. Four functions, three files, one pattern: a
 * character id plus an animation id, checked in two neighbouring slots.
 *
 * The two extra guards are this one's own. It gives up during the intro and
 * during task 3, so whatever "the Lia problem" is, it is a fight-time artefact
 * and the code that asks about it runs in both places.
 *
 * The compiler built each set of comparisons as `ite` pairs OR-ed together
 * rather than a switch, which is why the disassembly reads as arithmetic.
 */
int IsLiaProblem(PLAYER *p)
{
    const long *w = (const long *)p;
    long a, b;

    if (*DoIntroPtr != 0)
        return 0;
    if (*CurrentTaskPtr == 3)
        return 0;
    if (w[0] != 6)
        return 0;

    a = w[0x51c / 4];
    if (a == 0xf1 || a == 0x105 || a == 0xf8 || a == 0xf9 || a == 0x101)
        return 1;

    b = w[0x520 / 4];
    return (b == 0xf1 || b == 0x105 || b == 0xf8 || b == 0xf9 || b == 0x101);
}


/* ---------------------------------------------------- CreateFramesWeWantFromFIDs
 *
 * armv7 0x0005b960, 84 bytes.  **Complete.**
 *
 *      n = 0
 *      while (fids[n] != -1) {
 *          v = 0
 *          if (FrameRemapTable[fids[n]][0] == who
 *              && FrameRemapTable[fids[n]][1] != -1)
 *              v = FrameRemapTable[fids[n]][1]
 *          out[n] = v
 *          n++
 *      }
 *      out[n] = -1
 *      return n
 *
 * Translates a -1 terminated list of frame IDs into the frames THIS character
 * actually has, writing 0 where it has none.
 *
 * **Both halves of the remap pair are checked, and 0 is the miss value while -1
 * is the terminator.** ClearAnimRemapTables fills the table with exactly that
 * pair -- 0 in the first word, -1 in the second -- so an entry nobody has
 * claimed fails the first test and an entry claimed but not resolved fails the
 * second. Two functions in two files agreeing on what an empty slot looks like.
 *
 * The output list is always terminated, including when the input was empty:
 * the -1 store is past the loop, not inside it.
 */
long CreateFramesWeWantFromFIDs(long *out, EPLAYER who, const long *fids)
{
    long n = 0;

    while (fids[n] != -1) {
        long fid = fids[n];
        long v = 0;

        if (FrameRemapTable[fid][0] == (long)who &&
            FrameRemapTable[fid][1] != -1)
            v = FrameRemapTable[fid][1];

        out[n] = v;
        n++;
    }
    out[n] = -1;                        /* always, even for an empty input */
    return n;
}


typedef struct limeVECTOR3 limeVECTOR3;


typedef struct limeVECTOR2 limeVECTOR2;
typedef struct SKININFO SKININFO;
typedef struct BONESINFO BONESINFO;

extern limeVECTOR2   *RenderUVs;        /* slot -> 0x003498c8 */
extern unsigned char *RenderRGBs;       /* slot -> 0x00366d88 */

void GenerateMatrices(char *dst, BONESINFO *bones, long a, long b, float t,
                      long arg);
void DrawSkinnedMesh2(SKININFO *skin, unsigned a, unsigned b, long c,
                      limeVECTOR3 *out, limeVECTOR2 *uv, unsigned char *rgb,
                      long d, long e);


/* ------------------------------------- GenerateFrameVertsBySkinning / ...SKIN2
 *
 * armv7 0x0005c118 and 0x0005c0d8, 84 and 64 bytes.  **Complete.**
 *
 * Two thin wrappers over DrawSkinnedMesh2, sharing the same three globals --
 * `_RenderUVs` and `_RenderRGBs` for the output arrays -- and differing in one
 * thing: **the plain version poses the skeleton first and SKIN2 does not.**
 *
 *      GenerateFrameVertsBySkinning:
 *          GenerateMatrices(c->[0x3c], c->[0x34], a, b, t, c->[0x40])
 *          DrawSkinnedMesh2(c->[0x30], 0, 0, 0, out, RenderUVs, RenderRGBs,
 *                           c->[4][0], 0)
 *
 *      GenerateFrameVertsBySkinningSKIN2:
 *          DrawSkinnedMesh2(*(c->[0x30]), 0, 0, 0, out, RenderUVs, RenderRGBs,
 *                           c->[4][2], 0)
 *
 * Two differences beyond that, and both are easy to read past:
 *
 *  - SKIN2 **dereferences** +0x30 one level further (`ldr r3, [r0,#0x30]` then
 *    `ldr r2, [r3]`) where the plain one passes it straight through. So +0x30
 *    holds a pointer to a pointer for the second skin and a pointer for the
 *    first, or the two skins live at different depths of the same field.
 *
 *  - the eighth argument comes from `c->[4][0]` in one and `c->[4][2]` in the
 *    other -- offsets 0 and 8 of the same sub-structure.
 *
 * A port that shares one body between them has to keep both differences, and
 * neither is visible from the names.
 */
void GenerateFrameVertsBySkinning(ANIMATEDCHARACTER *c, long a, long b,
                                  float t, limeVECTOR3 *out)
{
    char **w = (char **)c;
    const long *n = (const long *)c;

    GenerateMatrices(w[0x3c / 4], (BONESINFO *)w[0x34 / 4], a, b, t,
                     n[0x40 / 4]);

    DrawSkinnedMesh2((SKININFO *)w[0x30 / 4], 0, 0, 0, out,
                     RenderUVs, RenderRGBs,
                     ((const long *)w[4 / 4])[0], 0);
}

void GenerateFrameVertsBySkinningSKIN2(ANIMATEDCHARACTER *c, long a, long b,
                                       float t, limeVECTOR3 *out)
{
    char **w = (char **)c;

    (void)a;
    (void)b;
    (void)t;                            /* no pose: SKIN2 skips GenerateMatrices */

    DrawSkinnedMesh2(*(SKININFO **)w[0x30 / 4], 0, 0, 0, out,
                     RenderUVs, RenderRGBs,
                     ((const long *)w[4 / 4])[2], 0);
}


void limeFree(void *p);


#define ANIM_ENTRY_STRIDE 0x58

void  LIME_FreeSkin(void *skin);
void  LIME_FreeBones(void *bones);
void  LIME_FreeMeshSetTextures(void *set);
void  LIME_FreeScene(void *scene);
int   LIME_SceneExists(void *scene);


/* ------------------------------------------------------- FreeAnimatedCharacter
 *
 * armv7 0x0005bf08, 240 bytes.  **Complete.**
 *
 * Two loops' worth of frees, and three details make it worth reading rather
 * than skimming.
 *
 * **The per-entry loop runs n-1 times, not n.** `subs r3, #1; cmp r3, r6; bne`
 * -- so the LAST entry of the array is never processed, and when n == 1 the
 * loop is skipped entirely by the `cmp r3, #1; beq` at the top. Whatever the
 * final entry is, it is not owned by this character.
 *
 * **Four of the six per-entry frees happen only on entry ZERO.** +0x1c, +0x20,
 * +0x2c and +0x30 are guarded by `cbnz r6` on the loop index; +0x24 and +0x34
 * are freed for every entry. So two of the pointers are shared across entries
 * and only the first one owns them.
 *
 * **The entry base is re-read from `c->[4]` after every free.** Not cached in a
 * register across the calls, which is transcribed as written: limeFree is
 * allowed to move it.
 *
 * The scene is freed only if LIME_SceneExists agrees -- reference counting, the
 * same the loader does on the way in -- and its meshset textures go first.
 *
 * Returns 1 unconditionally. No caller in this tree checks it.
 */
int FreeAnimatedCharacter(ANIMATEDCHARACTER *c)
{
    char  *base = (char *)c;
    long   n    = *(const long *)base;
    long   i;

    for (i = 0; n != 1 && i < n - 1; i++) {
        char *e;

        e = *(char **)(base + 4) + i * ANIM_ENTRY_STRIDE;
        if (*(void **)(e + 0x24)) limeFree(*(void **)(e + 0x24));

        if (i == 0) {                   /* entry zero owns these two */
            e = *(char **)(base + 4) + i * ANIM_ENTRY_STRIDE;
            if (*(void **)(e + 0x1c)) limeFree(*(void **)(e + 0x1c));
            e = *(char **)(base + 4) + i * ANIM_ENTRY_STRIDE;
            if (*(void **)(e + 0x20)) limeFree(*(void **)(e + 0x20));
        }

        e = *(char **)(base + 4) + i * ANIM_ENTRY_STRIDE;
        if (*(void **)(e + 0x34)) limeFree(*(void **)(e + 0x34));

        if (i == 0) {                   /* and these two */
            e = *(char **)(base + 4) + i * ANIM_ENTRY_STRIDE;
            if (*(void **)(e + 0x2c)) limeFree(*(void **)(e + 0x2c));
            e = *(char **)(base + 4) + i * ANIM_ENTRY_STRIDE;
            if (*(void **)(e + 0x30)) limeFree(*(void **)(e + 0x30));
        }
    }

    if (*(void **)(base + 0x2c)) limeFree(*(void **)(base + 0x2c));
    LIME_FreeSkin(*(void **)(base + 0x30));
    LIME_FreeBones(*(void **)(base + 0x34));
    limeFree(*(void **)(base + 0x38));
    limeFree(*(void **)(base + 4));

    /* six textures, each only if present */
    if (*(TEXTURE **)(base + 0x14)) limeDeleteTexture(*(TEXTURE **)(base + 0x14));
    if (*(TEXTURE **)(base + 0x18)) limeDeleteTexture(*(TEXTURE **)(base + 0x18));
    if (*(TEXTURE **)(base + 0x1c)) limeDeleteTexture(*(TEXTURE **)(base + 0x1c));
    if (*(TEXTURE **)(base + 0x20)) limeDeleteTexture(*(TEXTURE **)(base + 0x20));
    if (*(TEXTURE **)(base + 0x24)) limeDeleteTexture(*(TEXTURE **)(base + 0x24));
    if (*(TEXTURE **)(base + 0x28)) limeDeleteTexture(*(TEXTURE **)(base + 0x28));

    if (LIME_SceneExists(*(void **)(base + 0x10))) {
        LIME_FreeMeshSetTextures(
            *(void **)(*(char **)(base + 0x10) + 0x80));
        LIME_FreeScene(*(void **)(base + 0x10));
    }

    limeFree(c);
    return 1;                           /* always; nothing checks it */
}


/* An ANIMATEDCHARACTER as far as IsAFrameVisible reaches. The frame stride is
 * 88 bytes and the compiler spells it out rather than multiplying:
 * `r1*12 - r1` shifted left three, which is 88. */
#define ANIMCHAR_FRAME_STRIDE  88

/* ----------------------------------------------------------- IsAFrameVisible
 *
 * armv7 0x0005b9dc, 120 bytes.  **Complete.**
 *
 * Whether one frame of one character may be drawn. Three things decide it, and
 * two of them are hardcoded per-character hacks:
 *
 *      character 3, frame 290   ->  NEVER visible
 *      character 6, frame 365   ->  ALWAYS visible
 *      otherwise                ->  read the frame own flags
 *
 * `c[2]` -- offset +8 -- is the character id. That was already established by
 * IsFrameVisible above, which special-cases character 12 and frame 295 for a
 * different purpose. **Three separate per-character frame exceptions across the
 * two functions**: 3/290, 6/365 and 12/295. None of them is derivable from
 * data; they are patches somebody made late and they have to be carried across.
 *
 * The general path clamps the frame id twice over: negatives to zero
 * (`bic r3, r1, r1, asr #31`), and anything past `c[0] - 2` down to that. Note
 * **minus two**, not minus one -- the last frame is not reachable here at all.
 *
 * Then, of the frame record at `c[1] + idx * 88`:
 *
 *      +0x18 == 1                          ->  visible
 *      else if *(void**)c[0x30/4] == NULL  ->  not visible
 *      else                                ->  visible if +0x28 == 1
 *
 * So the second flag is only consulted when the pointer at +0x30 has something
 * behind it -- a second table that may not be loaded.
 */
int IsAFrameVisible(ANIMATEDCHARACTER *c, long frame)
{
    const long *a = (const long *)c;
    long count = a[0];
    /* The fields at +4 and +0x30 are POINTERS in a 32-bit image, and `long` is
     * how the rest of this file reaches a record it has no struct for. The
     * uintptr_t hop is what keeps that honest on a 64-bit host; it is not a
     * reinterpretation of the data. */
    const char *frames = (const char *)(uintptr_t)(unsigned long)a[1];
    long id = a[2];
    long idx;
    const long *f;

    if (frame == 290 && id == 3)
        return 0;                       /* the hack, first */
    if (frame == 365 && id == 6)
        return 1;

    idx = (frame < 0) ? 0 : frame;      /* bic rN, rN, rN asr #31 */
    if (idx >= count - 2)
        idx = count - 2;

    f = (const long *)(frames + idx * ANIMCHAR_FRAME_STRIDE);

    if (f[0x18 / 4] == 1)
        return 1;

    if (*(void **)(uintptr_t)(unsigned long)a[0x30 / 4] == 0)
        return 0;

    return f[0x28 / 4] == 1;
}


/* `_PlayerDefs` -- 0x00170950, **52 bytes** an entry. Three functions now spell
 * that stride out the same way, `(n*16 - n*4 + n) << 2`, which is 13 << 2.
 *
 * Word 0 is the character id. The seven words from +0x18 to +0x30 are asset
 * name pointers; Load1Character passes all seven on and the ORDER it passes
 * them in is not the order they sit in. */
extern char *PlayerDefs;                /* 0x00170950 */
#define PLAYERDEF_STRIDE  52

/* `_Players` -- 0x001fa4d4, and the second player is at +0x5f0. */
#define PLAYER_STRIDE  0x5f0

ANIMATEDCHARACTER *LoadAnimatedCharacter(char *a, char *b, char *c, char *d,
                                         char *e, char *f, char *g,
                                         EPLAYER who, FRONTEND_CHARACTER *fe,
                                         long p, long q, long r);


/* ------------------------------------------------------------ Load1Character
 *
 * armv7 0x0005ccec, 132 bytes.  **Complete.**
 *
 * Unpacks one PLAYERDEF into the twelve-argument LoadAnimatedCharacter call and
 * hangs the result off the player.
 *
 * **The seven asset names are not passed in memory order.** The def holds them
 * at +0x18 through +0x30 and they go out as
 *
 *      +0x30, +0x24, +0x20, +0x18, +0x28, +0x2c, +0x1c
 *
 * There is no pattern to recover and no way to guess it back; it is transcribed
 * from the register assignments and it has to stay exactly this.
 *
 * **The EPLAYER handed to LoadAnimatedCharacter is `def[0]`, not the `who` this
 * function was called with.** The caller argument is used only to index the
 * table and then to stamp the loaded character. Normally the two agree -- but
 * nothing here makes them, and the code goes out of its way to read the def.
 *
 * The tenth argument is a hardcoded 1; only the fifth argument of this function
 * reaches the twelfth.
 *
 * Afterwards:
 *
 *      p->anim   = result          (+0x04)
 *      result[8] = who             (+0x08)
 *
 * **That +0x08 store is where the character id in an ANIMATEDCHARACTER comes
 * from** -- the same field IsAFrameVisible and IsFrameVisible read to decide
 * their per-character frame exceptions. Written here, read there.
 */
void Load1Character(PLAYER *p, EPLAYER who, FRONTEND_CHARACTER *fe,
                    long a, long b)
{
    char **def = (char **)(PlayerDefs + who * PLAYERDEF_STRIDE);
    const long *defw = (const long *)def;
    ANIMATEDCHARACTER *c;

    c = LoadAnimatedCharacter(def[0x30 / 4], def[0x24 / 4], def[0x20 / 4],
                              def[0x18 / 4], def[0x28 / 4], def[0x2c / 4],
                              def[0x1c / 4],
                              (EPLAYER)defw[0], fe, a, 1, b);

    ((long *)p)[1] = (long)(uintptr_t)c;    /* p->anim, +0x04 */
    ((long *)c)[2] = who;                   /* the character id, +0x08 */
}


void LoadGameCharacterCheckCache(PLAYER *p, PLAYERDEF *def,
                                 FRONTEND_CHARACTER *fe);
int  puts(const char *s);
void LoadAllFramesTXT(void);


/* ------------------------------------------------ LoadGameCharacterCheckCache
 *
 * armv7 0x0005ce9c, 136 bytes.  **Complete.**
 *
 * LoadGameCharacter with two cache lookups in front of it:
 *
 *      printf("loading character %s...\n", def->name)
 *
 *      1. if OrigLoadedPlayers[1] is live and its id matches, reuse it
 *         OUTRIGHT -- p->anim points at the other player character and the
 *         function returns without touching anything else.
 *      2. otherwise ask HavePreloadedCharacter; on a hit, puts("Found in
 *         cache!") and take it.
 *      3. otherwise Load1Character, then **ask HavePreloadedCharacter again**
 *         and store THAT as p->anim.
 *
 * Case 1 returning early is the one that matters: it is the only path that does
 * not stamp `p->id`, `p->[0x5e8]` and `p->[0x5ec]`. A mirror match leaves those
 * three fields holding whatever the previous character left there.
 *
 * The second HavePreloadedCharacter in case 3 overwrites the pointer
 * Load1Character has already written into p->anim. The two agree in practice,
 * but the code asks rather than assuming, and that is transcribed.
 *
 * Note it checks `OrigLoadedPlayers[1]` only -- slot 0 is never consulted.
 */
void LoadGameCharacterCheckCache(PLAYER *p, PLAYERDEF *def,
                                 FRONTEND_CHARACTER *fe)
{
    long *pw = (long *)p;
    const long *dw = (const long *)def;
    ANIMATEDCHARACTER *c;

    printf("loading character %s...\n", ((char *const *)def)[0x18 / 4]);

    if (OrigLoadedPlayers[1] != 0 &&
        dw[0] == ((const long *)OrigLoadedPlayers[1])[2]) {
        pw[1] = (long)(uintptr_t)OrigLoadedPlayers[1];
        return;                         /* the three fields below are NOT set */
    }

    c = HavePreloadedCharacter((EPLAYER)dw[0]);
    if (c != 0) {
        puts("Found in cache!");
        pw[1] = (long)(uintptr_t)c;
    } else {
        Load1Character(p, (EPLAYER)dw[0], fe, 0, 1);
        c = HavePreloadedCharacter((EPLAYER)dw[0]);
        pw[1] = (long)(uintptr_t)c;     /* asked again, not reused */
    }

    pw[0x5e8 / 4] = 0;
    pw[0]         = dw[0];
    pw[0x5ec / 4] = -1;
}


/* ------------------------------------------------------- LoadLevelCharacters
 *
 * armv7 0x0005d078, 160 bytes.  **Complete.**
 *
 *      printf("Loading characters... (%s vs %s)...\n", nameA, nameB)
 *      ClearAnimRemapTables()
 *      LoadAllFramesTXT()
 *      LoadGameCharacter(&Players[0], &PlayerDefs[a], NULL, 0)
 *      LoadGameCharacter(&Players[1], &PlayerDefs[b], NULL, a == b)
 *      Players[0].altCostume = 0
 *      Players[1].altCostume = 0
 *      OrigLoadedPlayers[0] = Players[0].anim
 *      OrigLoadedPlayers[1] = Players[1].anim
 *
 * **The fourth argument to the second load is `a == b`** -- the mirror-match
 * flag, computed right there from the two ids. That is what tells the loader
 * the second fighter is the same character as the first, and it is the only
 * place the flag comes from.
 *
 * The two `altCostume` stores are redundant: LoadGameCharacter clears +0x530
 * for each player already, and these clear the same two words a second time
 * (0xb20 being 0x5f0 + 0x530, player two's copy of the field). Transcribed
 * because they are there, not because they do anything.
 *
 * The remap tables are cleared and the frame text reloaded BEFORE either
 * character is touched, so a level load always starts from a blank remap.
 */
void LoadLevelCharacters(EPLAYER a, EPLAYER b)
{
    PLAYER *p0 = (PLAYER *)Players;
    PLAYER *p1 = (PLAYER *)(Players + PLAYER_STRIDE);
    PLAYERDEF *da = (PLAYERDEF *)(PlayerDefs + a * PLAYERDEF_STRIDE);
    PLAYERDEF *db = (PLAYERDEF *)(PlayerDefs + b * PLAYERDEF_STRIDE);

    printf("Loading characters... (%s vs %s)...\n",
           ((char *const *)da)[0x18 / 4], ((char *const *)db)[0x18 / 4]);

    ClearAnimRemapTables();
    LoadAllFramesTXT();

    LoadGameCharacter(p0, da, 0, 0);
    LoadGameCharacter(p1, db, 0, (a == b) ? 1 : 0);

    p0->altCostume = 0;                 /* already cleared, twice over */
    p1->altCostume = 0;

    OrigLoadedPlayers[0] = (ANIMATEDCHARACTER *)(uintptr_t)((long *)p0)[1];
    OrigLoadedPlayers[1] = (ANIMATEDCHARACTER *)(uintptr_t)((long *)p1)[1];
}


/* `_AllFramesTable` -- 0x00218cc4, **65 bytes** an entry: one byte at +0 that
 * nothing here writes, then a 64-byte name. The compiler spells the stride as
 * `i*64 + i`. */
#define ALLFRAMES_STRIDE  65
#define ALLFRAMES_COUNT   0x1c4c        /* 7244 */

extern char *AllFramesTable;            /* 0x00218cc4 */

void *limeLoadFile(const char *name);
void  limeFree(void *p);
int   sscanf(const char *s, const char *fmt, ...);
size_t strlen(const char *s);


/* ---------------------------------------------------------- LoadAllFramesTXT
 *
 * armv7 0x0005cf24, 176 bytes.  **Complete.**
 *
 * Reads `framelists/allframes.txt` into `_AllFramesTable`, one whitespace-
 * delimited name per entry, with `sscanf(p, "%32s", entry + 1)`.
 *
 * **7244 entries, and that is the third place this number turns up.**
 * FrameID_GetBBox rejects a frame id above 7244 and ClearAnimRemapTables walks
 * 7245. So the table holds 7245 slots and this fills the first 7244 of them --
 * the numbers do not quite meet, and the difference is recorded rather than
 * smoothed: one slot is left as it was.
 *
 * The name field is 64 bytes but `%32s` caps a name at 32 characters plus its
 * terminator, so half the field is unreachable through this loader.
 *
 * After each successful token the cursor advances by `strlen` of what was
 * written -- not by what sscanf consumed -- and then any run of `\n` and
 * `\r` is skipped. A line that does not scan leaves the cursor where it
 * was, so the loop spends the rest of its 7244 iterations reading the same
 * bytes. It is bounded, so it terminates; it just stops making progress.
 *
 * ### The failure path only looks like it falls through
 *
 * If limeLoadFile returns NULL it calls
 *
 *      Error("Couldn't load master frames list!!\n")
 *
 * and then branches back into the parse loop with the null pointer still in
 * hand -- which reads like a crash waiting to happen. It is not: `Error` above
 * ends in a branch to its own address and never comes back. The loop head is
 * simply where the compiler pointed the unreachable edge.
 */
void LoadAllFramesTXT(void)
{
    char *buf = (char *)limeLoadFile("framelists/allframes.txt");
    char *p;
    long i;

    if (buf == 0)
        Error("Couldn't load master frames list!!\n");   /* never returns */

    p = buf;
    for (i = 0; i != ALLFRAMES_COUNT; i++) {
        char *dst = AllFramesTable + i * ALLFRAMES_STRIDE + 1;

        if (sscanf(p, "%32s", dst) == 1)
            p += strlen(dst);

        while (*p == 10 || *p == 13)    /* newline, carriage return */
            p++;
    }

    limeFree(buf);
}


/* `_IdlesPerPlayer` -- 0x00171288, two words an entry. */
/* `_TheFECharacters` is already declared above as [25][0x668]; slot 23 is the
 * one this function loads as character 0. */
extern long *IdlesPerPlayer[];          /* 0x00171288, {value, list} pairs */


/* ----------------------------------------------------- LoadFrontEndCharacters
 *
 * armv7 0x0005cfd4, 164 bytes.  **Complete.**
 *
 * Sets up one front-end character slot and loads its model.
 *
 * **Character 0 gets a preamble nobody else gets**: ClearAnimRemapTables and
 * LoadAllFramesTXT run first, then it falls into the same body. So the frame
 * tables are rebuilt on the first character of a front-end load and not again.
 *
 * The body clears +4 and +0x65c, copies `IdlesPerPlayer[who][0]` into +0x660,
 * and then copies that entry second word -- a **-1-terminated list** -- into
 * the slot at +0x5f4, terminating it with its own -1.
 *
 * **Character 23 is loaded as character 0.** `(who == 0x17) ? 0 : who` is the
 * id handed to Load1Character, while the destination slot and the id stamped
 * into +0 afterwards stay 23. So slot 23 holds character 0 geometry under its
 * own name.
 *
 * The same pointer is passed as both the PLAYER and the FRONTEND_CHARACTER
 * argument -- one struct playing both parts.
 */
void LoadFrontEndCharacters(long who)
{
    char *fc;
    long *dst;
    const long *src;

    if (who == 0) {
        ClearAnimRemapTables();
        LoadAllFramesTXT();
    }

    fc = TheFECharacters[who];

    ((long *)fc)[1]            = 0;             /* +0x04 */
    *(long *)(fc + 0x650 + 0xc) = 0;            /* +0x65c */
    *(long *)(fc + 0x660)       = IdlesPerPlayer[who * 2][0];

    src = IdlesPerPlayer[who * 2 + 1];
    dst = (long *)(fc + 0x5f0 + 4);
    while (*src != -1)
        *dst++ = *src++;
    *dst = -1;

    Load1Character((PLAYER *)fc, (EPLAYER)((who == 0x17) ? 0 : who),
                   (FRONTEND_CHARACTER *)fc, 0, 0);

    ((long *)fc)[0] = who;              /* stamped AFTER the load */
}
