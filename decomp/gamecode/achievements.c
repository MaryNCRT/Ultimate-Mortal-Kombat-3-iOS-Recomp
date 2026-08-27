/*
 * achievements.c — src/gamecode/achievements.cpp
 *
 * Twelve functions in the original. Verified against the oracle by
 * tests/test_gamecode3_diff.c.
 */

#include <stdint.h>

/* **Twenty-four entries, bounded by the symbol table.**
 *
 * This said twenty, honestly labelled as "as far as this function reaches":
 * areAchievementsViewing's loop runs while the byte cursor is not 0x50, which
 * is 20 words, and that is a lower bound rather than a size.
 *
 * achievementsIncreaseSubzeroXerox reaches `[r2, #0x5c]` -- index 23 -- and the
 * compiler caught the contradiction at -Wextra as soon as it was written. The
 * real bound is in the symbol table: `_achievementTracker` sits at 0x00379c60
 * and the next symbol, `_SceneEvents`, at 0x00379cc0, so the block is 96 bytes,
 * 24 words, and index 23 is its last slot exactly.
 *
 * Nothing here says what an entry means, only that 1 is the value being counted
 * and that slot 23 counts Sub-Zero's clones. */
#define ACHIEVEMENT_SLOTS 24

extern int achievementTracker[ACHIEVEMENT_SLOTS];   /* 0x00379c60 */

int areAchievementsViewing(void);


/* -------------------------------------------------- areAchievementsViewing
 *
 * armv7 0x000a02ac, 32 bytes.
 *
 *      movs r0, #0 ; mov r2, r0
 *  L:  mov  r3, r1 ; add r3, pc ; ldr r3, [r2, r3]
 *      cmp  r3, #1 ; it eq ; addeq r0, #1
 *      adds r2, #4 ; cmp r2, #0x50 ; bne L
 *
 * **It returns a COUNT, not a boolean**, despite the name. Every slot equal to
 * exactly 1 adds one to the total, so a caller writing
 * `if (areAchievementsViewing())` gets the right answer by accident and a
 * caller comparing it against 1 does not.
 *
 * Equal to 1, not non-zero. Whatever other values a slot can hold are not
 * counted, which is the difference between "how many are in this state" and
 * "how many are set".
 *
 * The base address is recomputed inside the loop from a register the compiler
 * loaded once -- `mov r3, r1 ; add r3, pc`. That is the one shape
 * `tools/annotate.py` documents as its gap, so 0x00379c60 was resolved by
 * hand: 0x002d99a8 + 0x000a02b8.
 *
 * Another `it eq`, so another check that the IT-block flag fix holds.
 */
int areAchievementsViewing(void)
{
    int count = 0;
    int i;

    for (i = 0; i < ACHIEVEMENT_SLOTS; i++) {
        if (achievementTracker[i] == 1)
            count++;
    }
    return count;
}


/* Returns non-zero when the caller should pop a banner -- see the definition
 * below. This was declared `void` before that function was read. */
int achievementsUnlock(int id);


/* ------------------------------------------ achievementsIncreaseSubzeroXerox
 *
 * armv7 0x000a08dc, 32 bytes.  **Complete.**
 *
 *      ldr  r3, [r2, #0x5c]
 *      adds r3, #1
 *      cmp  r3, #0x63              <- 99
 *      str  r3, [r2, #0x5c]        <- stored BEFORE the branch
 *      ble  out
 *      movs r0, #0x12              <- achievement 18
 *      bl   _achievementsUnlock
 *
 * The counter is written back whether or not the threshold is crossed, and the
 * comparison is `> 99`, so the unlock fires on the hundredth and on every one
 * after it. That is not a bug to tidy: achievementsUnlock is idempotent for an
 * already-unlocked id everywhere else in this file, and a port that fires it
 * only once would differ on a reset save.
 *
 * "Xerox" is Sub-Zero's clone move. Field 0x5c of the tracker counts them.
 */
void achievementsIncreaseSubzeroXerox(void)
{
    achievementTracker[0x5c / 4]++;
    if (achievementTracker[0x5c / 4] > 99)
        achievementsUnlock(0x12);
}


/* --------------------------------------------------------- achievementsReset
 *
 * armv7 0x000a0280, 40 bytes.  **Complete.**
 *
 * Zeroes the whole tracker: `[+0]`, then a loop from `+4` to `+0x4c`, then four
 * unrolled stores at `+0x50`, `+0x54`, `+0x58` and `+0x5c`.
 *
 * **That last store is an independent confirmation of the array's size.** The
 * bound came from the symbol table -- `_achievementTracker` at 0x00379c60 and
 * `_SceneEvents` at 0x00379cc0, so 96 bytes -- and this function clears exactly
 * 0x00 through 0x5c and stops. Twenty-four words, from a completely different
 * direction, agreeing to the word.
 */
void achievementsReset(void)
{
    int i;

    for (i = 0; i < ACHIEVEMENT_SLOTS; i++)
        achievementTracker[i] = 0;
}


/* ------------------------------------------- achievementsIncreaseMatchesWon
 *
 * armv7 0x000a08fc, 44 bytes.  **Complete.**
 *
 *      ldr  r3, [r2, #0x50]
 *      adds r3, #1
 *      cmp  r3, #0xa
 *      str  r3, [r2, #0x50]
 *      beq  unlock 7
 *      cmp  r3, #0x64
 *      beq  unlock 8
 *
 * **Exact equality, where achievementsIncreaseSubzeroXerox uses `>`.** These
 * two fire once each, on the tenth win and the hundredth; the Xerox one fires
 * on the hundredth and on every clone after it. Both are transcribed as
 * written -- the difference is in the original and a port that normalises them
 * to one style changes one of the two.
 *
 * Ten wins is achievement 7, a hundred is 8. Slot 0x50 counts matches won.
 */
void achievementsIncreaseMatchesWon(void)
{
    int n = ++achievementTracker[0x50 / 4];

    if (n == 10)
        achievementsUnlock(7);
    else if (n == 100)
        achievementsUnlock(8);
}


/* --------------------------------------------------------------- getLayoutName
 *
 * armv7 0x000a0234, 48 bytes.  **Complete.**
 *
 * Six strings from two arguments: the button count picks 4, 5 or anything else
 * (which means 6), and the flag picks CUSTOM or PRESET.
 *
 * The default is SIX, not an error -- `cmp 4 / cmp 5 / fall through` -- so a
 * count of 7 returns the six-button name. Transcribed as written; validating
 * the count here would reject inputs the original accepts.
 */
const char *getLayoutName(int buttons, int custom)
{
    if (buttons == 4)
        return custom ? "CUSTOM_LAYOUT_4_BUTTONS" : "PRESET_LAYOUT_4_BUTTONS";
    if (buttons == 5)
        return custom ? "CUSTOM_LAYOUT_5_BUTTONS" : "PRESET_LAYOUT_5_BUTTONS";
    return custom ? "CUSTOM_LAYOUT_6_BUTTONS" : "PRESET_LAYOUT_6_BUTTONS";
}


extern short *H;                        /* pointer slot -> 0x0038c674 */
extern int   *theKode;                  /* pointer slot -> 0x0010ded0 */


/* ------------------------------------------------------ preprocessPostloadKode
 *
 * armv7 0x000a02cc, 56 bytes.  **Complete.**
 *
 * Clears three HALFWORDS in `H` -- +0x18, +0x1a and +0x1c -- and then sets
 * exactly one of them from the active kode:
 *
 *      kode == 2     -> +0x18
 *      kode == 0x12  -> +0x1a
 *      kode == 0     -> +0x1c
 *      anything else -> none of them
 *
 * **Zero is a kode, not the absence of one.** The `cbnz r3` at the end returns
 * without setting anything for any value other than 0, 2 and 0x12, so kode 0
 * has its own flag rather than meaning "no kode selected". A port that treats 0
 * as empty loses whatever +0x1c enables.
 *
 * The clear order is +0x18, +0x1c, +0x1a -- not sequential. It makes no
 * difference and it is transcribed as written.
 */
void preprocessPostloadKode(void)
{
    int kode;

    H[0x18 / 2] = 0;
    H[0x1c / 2] = 0;
    H[0x1a / 2] = 0;

    kode = *theKode;
    if (kode == 2)
        H[0x18 / 2] = 1;
    else if (kode == 0x12)
        H[0x1a / 2] = 1;
    else if (kode == 0)
        H[0x1c / 2] = 1;
}


int puts(const char *s);


extern const char *DestinationNovice[];      /* 0x001769f0 */
extern const char *DestinationWarrior[];     /* 0x00176a80 */
extern const char *DestinationMaster[];      /* 0x00176b20 */
extern const char *DestinationGrandMaster[]; /* 0x00176bd8 */


/* --------------------------------------------------------------- getStageName
 *
 * armv7 0x000a0440, 92 bytes.  **Complete.**
 *
 * Four tables, one per tier, selected by a `tbb` jump table:
 *
 *      0  DestinationNovice
 *      1  DestinationWarrior
 *      2  DestinationMaster
 *      3  DestinationGrandMaster
 *
 * **The default is not an error path even though it prints like one.** A tier
 * above 3 puts "DEFAULT @getStageName!!!" and then reads DestinationNovice --
 * the same table case 0 uses, reached by different code. So an out-of-range
 * tier returns a valid name, loudly.
 *
 * The message ships. Three exclamation marks, like PushFETaskDeferred's: the
 * house style for "this should not happen but here is a sane answer".
 */
const char *getStageName(int tier, int index)
{
    switch (tier) {
        case 0: return DestinationNovice[index];
        case 1: return DestinationWarrior[index];
        case 2: return DestinationMaster[index];
        case 3: return DestinationGrandMaster[index];
        default: break;
    }
    puts("DEFAULT @getStageName!!!");
    return DestinationNovice[index];    /* the same table as case 0 */
}


extern int Settings[10];                /* 0x00100e34 */

/* `_achievementsDescr` -- 0x0017684c, sixteen bytes an entry. Only +0xc is
 * touched here and it is cleared on every unlock; what it holds is not
 * established by this function. */
typedef struct ACHIEVEMENTDESCR {
    long pad[3];                        /* 0x00 .. 0x08 */
    long timer;                         /* 0x0c, zeroed on unlock */
} ACHIEVEMENTDESCR;

extern ACHIEVEMENTDESCR achievementsDescr[];    /* 0x0017684c */


/* -------------------------------------------------------- achievementsUnlock
 *
 * armv7 0x000a0854, 136 bytes.  **Complete.**
 *
 * Marks achievement `id` unlocked. The value written into the tracker is
 * **not a boolean -- it is one of three**, and which one depends on
 * `Settings[7]` and on whether the achievements screen is open right now:
 *
 *      Settings[7] == 0                  ->  tracker = 2, return 0
 *      Settings[7] != 0, screen open     ->  tracker = 4, return 1
 *      Settings[7] != 0, screen closed   ->  tracker = 1, return 1
 *
 * The return value is what the caller uses to decide whether to pop a banner,
 * and it is zero in the first case -- so `Settings[7]` is the notifications
 * toggle, unlocking silently when it is off.
 *
 * **1 is the value areAchievementsViewing counts.** That function scans the
 * tracker for entries equal to 1, so an achievement unlocked while the screen
 * is already open gets 4 instead, deliberately keeping it out of that count.
 * The two functions only make sense read together.
 *
 * Every path clears `achievementsDescr[id].timer`, and an id above 0x13 (19) is
 * rejected -- four short of the 24 slots the tracker really has, which is the
 * gap slot 23 Sub-Zero clone counter lives in. So the tail of the tracker is
 * not reachable through this function.
 *
 * An already-unlocked achievement returns 0 and changes nothing.
 */
int achievementsUnlock(int id)
{
    if (Settings[7] == 0) {
        if (id > 0x13 || achievementTracker[id] != 0)
            return 0;

        achievementTracker[id]      = 2;
        achievementsDescr[id].timer = 0;
        return 0;
    }

    if (id > 0x13 || achievementTracker[id] != 0)
        return 0;

    achievementTracker[id]      = areAchievementsViewing() ? 4 : 1;
    achievementsDescr[id].timer = 0;
    return 1;
}


/* `_kodes` -- 0x00176c04, 32 bytes an entry, terminated by -1 in word 0.
 * Six words compared, word 6 unread here, word 7 the payload. */
typedef struct KODE {
    long seq[6];                        /* 0x00 .. 0x14 */
    long unused;                        /* 0x18, never read by checkIfKode */
    long value;                         /* 0x1c */
} KODE;

extern KODE  kodes[];                   /* 0x00176c04 */
extern int   KodeSelector[10];          /* 0x000ff8f8 */
/* `theKode` is already declared above as the pointer-slot idiom this file uses:
 * the slot holds 0x0010ded0 and the value lives behind it. */

int  puts(const char *s);
int  printf(const char *fmt, ...);


/* --------------------------------------------------------------- checkIfKode
 *
 * armv7 0x000a04a8, 136 bytes.  **Complete.**
 *
 * Walks `_kodes` comparing each entry six words against the player dial
 * positions, and on a match publishes that entry payload in `_theKode`.
 *
 * **The six words it reads are KodeSelector[0..2] and KodeSelector[7..9]** --
 * indices 0, 1, 2, 7, 8, 9, skipping four in the middle. Those are exactly the
 * six words `resetKodeSelector` clears, and that function comment had the gap
 * recorded as an open question. It is answered: the six that are reset are the
 * six that are compared, and the four in between are not part of a kode.
 *
 * Three functions now agree on this array. InitKodeScreen clears ten words,
 * resetKodeSelector clears six of them, and this one reads those same six.
 *
 * **It does not stop at the first match.** The loop runs to the terminator
 * either way, so with two entries sharing a sequence the LAST one wins. It also
 * prints on every hit:
 *
 *      CHECKING KODE
 *      KODE OK:%d
 *
 * Both survive in the retail binary.
 */
void checkIfKode(void)
{
    KODE *k = kodes;

    puts("CHECKING KODE");

    while (k->seq[0] != -1) {
        if (k->seq[0] == KodeSelector[0] &&
            k->seq[1] == KodeSelector[1] &&
            k->seq[2] == KodeSelector[2] &&
            k->seq[3] == KodeSelector[7] &&
            k->seq[4] == KodeSelector[8] &&
            k->seq[5] == KodeSelector[9]) {
            *theKode = k->value;
            printf("KODE OK:%d\n", (int)*theKode);
        }
        k++;                            /* ldr r3, [r4, #0x20]! */
    }
}
