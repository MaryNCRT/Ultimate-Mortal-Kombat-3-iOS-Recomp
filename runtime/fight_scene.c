/*
 * fight_scene.c -- a playable fight scene, driven by the decompiled engine's
 * own input translation and its own physics.
 *
 *   cmake --build build --target umk3-fight
 *   ./build/umk3-fight
 *
 * Keyboard, player one:  W A S D          move / jump / duck
 *                        U I O            HP  LP  BL
 *                        J K L            HK  LK  RUN
 * Player two:            arrow keys, numpad 7 8 9 / 4 5 6
 * A gamepad, if one is plugged in, drives player one instead.
 * F5 resets, Escape quits.
 *
 * ====================================================================
 * WHAT IS REAL HERE, AND WHAT IS NOT
 * ====================================================================
 *
 * This matters more than the scene does, so it is first.
 *
 * ## Really the decompiled engine, called as-is
 *
 *   - `TranslateJoybits` (decomp/gamecode/logic/mk3.c). The two ten-bit words
 *     this file builds from a keyboard or a pad go through the binary's own
 *     translation, and the buttons are read back out of `G + 0x1c` with the
 *     same masks `buttons_in_a2` uses -- 0x00070070 and 0x00707000.
 *
 *   - `gravity_n_bounds` (same file). Gravity and the arena walls are not
 *     reimplemented: the real function runs, on a real 76-byte GrObj, and the
 *     wall-clamp and the velocity-kill are whatever it does.
 *
 * ## Really measured from the binary, transcribed here
 *
 *   - **The arena.** `SetupLevelLimits` in GameCode.c writes `G[0xb0]` and
 *     `G[0xb4]` from the level's player limits; `gravity_n_bounds` adds 0x3a
 *     and 0x15f. `mk3_init_game` supplies -550 and 950 as the defaults before
 *     any level is chosen. So the walls are at -492 and 902.
 *
 *   - **The floor.** `mk3_update` computes `G[0xac] = RoundParam[2] + 0xf7`
 *     every frame, and Blood.c sets `RoundParam[2]` to 0x12c or 0x190.
 *
 *   - **The physics shape.** x and y are 16.16 fixed point in `GrObj + 0x0c`
 *     and `+0x10`, their velocities are `+0x18` and `+0x1c`, and gravity is
 *     `+0x20`. Once a frame: `vy += g`, then `x += vx` and `y += vy`. That is
 *     `gravity_n_bounds` and `DisplayUpdate` between them, and a jump is one
 *     negative `vy` against one positive `g`.
 *
 *   - **The button map.** Ten bits: four directions, then HP, LP, BL, HK, LK,
 *     RUN. Named from three independent measurements -- see "THE INPUT
 *     CONTRACT" at the top of decomp/gamecode/logic/joy.c.
 *
 *   - **The move set.** The five `bt_*` tables at 0x00165584..0x00165624, six
 *     entries each, dumped from the binary. Standing gives five moves, ducking
 *     five, and in the air either punch is one move and either kick another.
 *     `bt_null` is ten zeroes and is how the engine takes input away.
 *
 *   - **The hitbox.** 56 x 72, from the one animation `mk3_getbbox` hard-codes.
 *
 * ## NOT the engine -- written for this scene
 *
 *   - **The state machine.** `plyrthread` is 2,124 bytes and is not yet
 *     decompiled. Its dispatch is mapped (43 tokens over 36 states, by
 *     `tools/dispatch.py`) but its bodies are not read. So what decides that
 *     pressing HP while standing starts a high punch, and how long that punch
 *     lasts, is MINE. The dispatch it performs is the real `bt_*` table; the
 *     timing around it is invented.
 *
 *   - **Every duration and speed.** Walk speed, jump velocity, gravity, how
 *     many frames a punch takes, how far it reaches. These live in the
 *     per-character data tables -- 229 of which are still unextracted -- so
 *     they are chosen to feel right, not measured. They are gathered in one
 *     block below and labelled, so that when the tables are read there is one
 *     place to correct.
 *
 *   - **The animation timing.** Which clip a state plays is a real name out of
 *     `res/framelists/scorpionframes.txt` -- SCSTANCE, SCWALK, SCHIPUNCH and
 *     the rest -- so the mapping from state to animation is the game's own.
 *     How FAST it plays is not: `next_anirate` is the engine's animation clock
 *     and it is not decompiled, so the rate here is chosen.
 *
 * ## The assets
 *
 * Scorpion and the stage are loaded at run time from the path given on the
 * command line, which is the user's own extracted `UMK3.app/res`. **This
 * repository contains no game data**, and the loaders -- .bones, .skin,
 * .skinanim, .meshset, .scene, .lighting, PVRTC -- are this project's own,
 * specified in docs/ and used through `runtime/fight_render.c`.
 *
 * So: the input path and the physics are the real thing. The character's
 * behaviour is a stand-in with the right shape, and it will be replaced by
 * `plyrthread` rather than refined.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <math.h>

#include "platform/platform.h"
#include "platform/gl.h"
#include "fight_render.h"
#include "fight_audio.h"
#include "fight_select.h"

/* ------------------------------------------------------------------ the engine
 *
 * Two functions from decomp/gamecode/logic/mk3.c, declared rather than
 * included, because mk3logic.h drags in the whole object graph and this file
 * only needs a pointer to hand back.
 */
void TranslateJoybits(const long *joy);

/* `gravity_n_bounds` takes an MK3OBJ and works on `obj->field08`. The struct's
 * first three members are pointers, so the only field this file has to agree
 * with the engine about is that one -- and it is reached through the same
 * header the engine was compiled with. `fight_obj` below mirrors its opening
 * layout exactly. */
struct fight_obj;
void gravity_n_bounds(void *obj);

/* `G`. The engine reaches its globals through this pointer and indexes it by
 * byte offset, so a plain buffer is the whole requirement. 0x478 is its size,
 * from `mk3_init`'s `memset(G, 0, 0x478)`.
 *
 * In the SHELL build `runtime/gamecode_globals.c` owns the pointer -- it is
 * the file that transcribes the binary's data section -- and `test_main.c`
 * points it at storage before anything runs. Standalone, this file owns both.
 */
#ifdef UMK3_SHELL
extern void *G;
#else
static char  g_state_store[0x478];
void        *G = g_state_store;
#endif

#define g_state   ((char *)G)
#define G_L(off)  (*(long     *)(void *)(g_state + (off)))
#define G_U(off)  (*(unsigned *)(void *)(g_state + (off)))

/* `repell_func` is in mkrepell.c, which has never been opened. DisplayUpdate
 * calls it and this scene does not call DisplayUpdate, but the linker wants
 * it. Empty, and said out loud rather than hidden: the push-apart that keeps
 * two fighters from overlapping is NOT in this scene. */
void repell_func(void) { }


/* ============================================================ measured data
 *
 * Everything in this section came out of the binary. Nothing here is a choice.
 */

/* mk3_init_game's defaults, before a level overrides them. */
#define ROUNDPARAM_LEFT    (-550)
#define ROUNDPARAM_RIGHT     950
#define ROUNDPARAM_GROUND  0x12c        /* Blood.c writes 0x12c or 0x190 */

/* gravity_n_bounds: left = G[0xb0] + 0x3a, right = G[0xb4] + 0x15c + 3. */
#define WALL_L  (ROUNDPARAM_LEFT  + 0x3a)          /* -492 */
#define WALL_R  (ROUNDPARAM_RIGHT - 399 + 0x15f)   /*  902 */

/* mk3_update: G[0xac] = RoundParam[2] + 0xf7, every frame. */
#define FLOOR_Y (ROUNDPARAM_GROUND + 0xf7)         /*  547 */

/* mk3_getbbox's hard-coded animation: left -0x20, top 0x44, right 0x18,
 * bottom 0x8c -- 56 wide and 72 tall. */
#define BOX_W  56
#define BOX_H  72

/* ============================================ the walk, and it is MEASURED
 *
 * `_walk_forward_info` at 0x0016ef6c and `_walk_backward_info` at 0x0016f03c:
 * eight bytes per character, indexed by `part->field24`, the character number.
 * `decode_walk_table` (0x000552dc) reads both halves:
 *
 *     entry[0]       -> obj->field1c, which `init_anirate` takes as the RATE:
 *                       one animation frame every N game frames
 *     entry[1] << 4  -> obj->field20, the speed, already in 16.16
 *
 * `walk_flip_reverse` then negates the speed when bit 4 of the part's 0x28 is
 * set, and `get_walk_info_b` negates it once more -- which is the whole of what
 * makes backing up go the other way.
 *
 * State 0x45c of `plyrthread` calls the routine, calls `init_anirate`, copies
 * the speed into 0x1c and calls `set_x_vel_player`, which writes it to
 * G + 0xb8 for player one and G + 0x210 for player two -- the same 0x158 stride
 * `repell_func` uses.
 *
 * **Both numbers were guesses here until now**: 4.0 and 3.0 units a frame
 * against a real 3.25 and 2.25, and a walk cycle driven by distance against a
 * real fixed rate of five game frames a frame. The distance drive existed to
 * stop the feet skating at a speed that was itself invented; with the game's
 * own speed and the game's own rate there is nothing to compensate for.
 */
typedef struct { int rate; long speed; } walkinfo;

static const walkinfo WALK_FWD[26] = {
    {5, 229376}, {5, 196608}, {5, 196608}, {5, 212992}, {5, 212992},
    {5, 196608}, {5, 229376}, {5, 212992}, {5, 212992}, {5, 212992},
    {5, 196608}, {5, 196608}, {5, 204800}, {5, 204800}, {5, 212992},
    {5, 212992}, {5, 229376}, {5, 212992}, {5, 212992}, {5, 212992},
    {5, 212992}, {5, 212992}, {5, 262144}, {5, 327680}, {4, 270336},
    {3, 327680}
};

static const walkinfo WALK_BACK[26] = {
    {5, 147456}, {5, 147456}, {5, 147456}, {5, 147456}, {5, 147456},
    {5, 147456}, {5, 147456}, {5, 147456}, {5, 147456}, {5, 147456},
    {5, 147456}, {5, 147456}, {5, 147456}, {5, 147456}, {5, 147456},
    {5, 147456}, {5, 147456}, {5, 147456}, {5, 147456}, {5, 147456},
    {5, 147456}, {5, 147456}, {5, 163840}, {5, 196608}, {4, 262144},
    {4, 262144}
};

/* 18 is SCORPION, from docs/ROSTER.md -- six independent readings agreeing. */
#define CHARACTER 18

/* The ten input bits, and the two button masks buttons_in_a2 picks between. */
enum { IN_UP = 1 << 0, IN_DOWN = 1 << 1, IN_LEFT = 1 << 2, IN_RIGHT = 1 << 3,
       IN_HP = 1 << 4, IN_LP = 1 << 5, IN_BL = 1 << 6,
       IN_HK = 1 << 7, IN_LK = 1 << 8, IN_RUN = 1 << 9 };

#define BTN_MASK_P1  0x00070070u
#define BTN_MASK_P2  0x00707000u

/* Where TranslateJoybits puts each button, per player. Index is the button
 * number -- HP LP BL HK LK RUN -- which is the input bit minus four, which is
 * also the index into the bt_* tables. All three are the same number. */
static const unsigned g_btn_bit[2][6] = {
    { 1u << 4, 1u << 16, 1u << 5,  1u << 6,  1u << 17, 1u << 18 },
    { 1u << 12, 1u << 20, 1u << 13, 1u << 14, 1u << 21, 1u << 22 }
};

/* The five button tables, dumped from 0x00165584..0x00165624. Six entries
 * each; the engine stores a pointer to one of these in MK3OBJ + 0x60 and that
 * pointer IS which moves a fighter has.
 *
 * The move names are the real symbol names the table entries point at. */
enum { MV_NONE = 0,
       MV_HI_PUNCH, MV_LO_PUNCH, MV_BLOCK, MV_HI_KICK, MV_LO_KICK,
       MV_UPPERCUT, MV_DUCK_PUNCH, MV_DUCK_BLOCK, MV_DUCK_KICKH, MV_DUCK_KICKL,
       MV_JUMP_PUNCH, MV_JUMP_KICK, MV_FLIP_PUNCH, MV_FLIP_KICK };

static const unsigned char bt_null[6]       = { 0, 0, 0, 0, 0, 0 };
static const unsigned char bt_stance[6]     = { MV_HI_PUNCH, MV_LO_PUNCH,
                                                MV_BLOCK, MV_HI_KICK,
                                                MV_LO_KICK, MV_NONE };
static const unsigned char bt_duck[6]       = { MV_UPPERCUT, MV_DUCK_PUNCH,
                                                MV_DUCK_BLOCK, MV_DUCK_KICKH,
                                                MV_DUCK_KICKL, MV_NONE };
static const unsigned char bt_jump[6]       = { MV_JUMP_PUNCH, MV_JUMP_PUNCH,
                                                MV_NONE, MV_JUMP_KICK,
                                                MV_JUMP_KICK, MV_NONE };
static const unsigned char bt_angle_jump[6] = { MV_FLIP_PUNCH, MV_FLIP_PUNCH,
                                                MV_NONE, MV_FLIP_KICK,
                                                MV_FLIP_KICK, MV_NONE };

static const char *g_move_name[] = {
    "", "hi punch", "lo punch", "block", "hi kick", "lo kick",
    "uppercut", "duck punch", "duck block", "duck kick h", "duck kick l",
    "jump punch", "jump kick", "flip punch", "flip kick"
};


/* ========================================================== CHOSEN, not measured
 *
 * Every number below lives in a per-character data table that has not been
 * extracted. They are here in one block so that when those tables are read,
 * this is the only place to correct.
 */
#define FX          16                  /* 16.16, the engine's fixed point */
#define FIX(n)      ((long)((n) * (1L << FX)))

#define JUMP_VY      FIX(-10.0)         /* one negative vy ... */
#define GRAVITY      FIX(0.40)          /* ... against one positive g */
#define JUMP_VX      FIX(6.0)           /* an angled jump's horizontal speed */

/* **How long a move lasts is the CLIP's length, not a number picked here.**
 *
 * SCHIPUNCH is seven animation frames, SCUPPERCUT five, SCHIKICK six -- the
 * frame list says so. What is chosen is only the TEMPO: how many 60 Hz game
 * frames one animation frame is held for. So a move's duration is
 * `clip_length * ANIM_HOLD`, and correcting the tempo later corrects every
 * move at once instead of eighteen separate constants.
 *
 * `next_anirate` is the engine's own animation clock and is not decompiled,
 * which is why the tempo is still a choice. Two frames is 30 Hz. */
#define ANIM_HOLD     2

#define T_HIT        16                 /* how long a reaction lasts */


#define REACH_PUNCH  70                 /* how far a move connects */
#define REACH_KICK   86
#define DAMAGE       4
#define START_GAP     55        /* half the gap the round opens with */

/* **The engine runs at a fixed rate and this has to as well.**
 *
 * Every duration in the fight is counted in FRAMES -- `thread->fieldfc` is a
 * frame counter, `mk3_update` is one frame, the velocities in GrObj are units
 * per frame. Running the tick once per rendered frame ties all of that to
 * whatever the display and the driver happen to do, and on a machine with
 * vsync off that was several hundred hertz: every speed in the game came out
 * three or four times too fast.
 *
 * 60 Hz with an accumulator, and a cap so that a long stall (a breakpoint, a
 * window drag) catches up over a few frames instead of simulating a thousand
 * at once. */
#define TICK_HZ        60.0
#define MAX_CATCHUP     4


/* ================================================================ a fighter
 *
 * `part` is a real 76-byte GrObj and the engine writes into it. The offsets
 * are the binary's, not this file's invention:
 *
 *      0x0c  x, 16.16        0x0e  its integer half, a signed halfword
 *      0x10  y, 16.16        0x12  its integer half
 *      0x18  x velocity      0x1c  y velocity        0x20  gravity
 *      0x24  character number
 *      0x28  bit 4 is the facing flag
 *      0x30  flags; bit 10 turns the arena walls off
 */
#define P_X   0x0c
#define P_XI  0x0e
#define P_Y   0x10
#define P_YI  0x12
#define P_VX  0x18
#define P_VY  0x1c
#define P_G   0x20
#define P_CHR 0x24
#define P_FLP 0x28
#define P_FLG 0x30

/* The opening of MK3OBJ, which is all `gravity_n_bounds` touches. Three
 * pointers, and the third is the part. Laid out with the host compiler, the
 * same as the engine's own translation unit, so the two agree. */
typedef struct fight_obj {
    void *field00;                      /* the proc */
    void *thread;
    void *field08;                      /* -> part */
} fight_obj;

typedef enum {
    ST_STANCE, ST_WALK_F, ST_WALK_B, ST_DUCK, ST_BLOCK,
    ST_JUMP, ST_ATTACK, ST_HIT
} state;

typedef struct {
    fight_obj      obj;
    unsigned char  part[76];

    state          st;
    int            timer;               /* frames left in st */
    int            timer_total;         /* what it started at, for the clip */
    int            move;                /* MV_* while ST_ATTACK */
    int            facing;              /* +1 right, -1 left */
    int            health;
    int            connected;           /* this attack already landed */
    int            wins;

    unsigned       prev_buttons;        /* for edge detection */
    const unsigned char *table;         /* MK3OBJ + 0x60 */

    /* Animation phase, in ANIMATION FRAMES rather than seconds.
     *
     * A walk cycle driven by wall-clock slides its feet whenever the walk
     * speed is not exactly what the artist assumed. Driving it by DISTANCE
     * TRAVELLED instead means the contact foot stays put by construction, and
     * it costs one divide. `anim_last` is the integer frame it was on, for
     * spotting the two footfalls in a cycle. */
    /* The engine's animation clock, from `init_anirate` and `next_anirate`:
     * `ani_rate` game frames per animation frame, counted down in `ani_count`. */
    int            ani_rate;
    int            ani_count;
    int            ani_index;
    int            anim_last;
    int            was_airborne;
} fighter;

static fighter g_f[2];
static int     g_frame;
static int     g_pad_seen = -1;

/* ------------------------------------------------------------- part accessors */
static long  p_get(const fighter *f, int off)
{ return *(const long *)(const void *)(f->part + off); }
static void  p_set(fighter *f, int off, long v)
{ *(long *)(void *)(f->part + off) = v; }
static int   p_xi(const fighter *f)
{ return *(const short *)(const void *)(f->part + P_XI); }
static int   p_yi(const fighter *f)
{ return *(const short *)(const void *)(f->part + P_YI); }


/* ------------------------------------------------------------------- the scene */
static void fighter_reset(fighter *f, int which)
{
    memset(f->part, 0, sizeof f->part);
    f->obj.field00 = NULL;
    f->obj.thread  = NULL;
    f->obj.field08 = f->part;

    /* Start them either side of the arena's centre, close enough to reach.
     * The arena is 1,394 units wide and a fighter is 56 across, so starting at
     * the walls would put twenty-four body widths between them. START_GAP is
     * chosen -- the real one lives in the round-start code, which is not
     * decompiled. */
    p_set(f, P_X, (long)((WALL_L + WALL_R) / 2
                         + (which ? START_GAP : -START_GAP)) << FX);
    p_set(f, P_Y, (long)(FLOOR_Y - BOX_H) << FX);
    p_set(f, P_CHR, which ? 0 : 0);

    f->st = ST_STANCE;
    f->timer = f->timer_total = 0;
    f->move = MV_NONE;
    f->facing = which ? -1 : +1;
    f->health = 100;
    f->connected = 0;
    f->prev_buttons = 0;
    f->table = bt_stance;
    f->ani_rate = WALK_FWD[CHARACTER].rate;
    f->ani_count = 1;
    f->ani_index = 0;
    f->anim_last = -1;
    f->was_airborne = 0;
}

static void scene_reset(void)
{
    memset(g_state, 0, sizeof g_state);

    /* What SetupLevelLimits would have written, from mk3_init_game's defaults. */
    G_L(0xb0) = ROUNDPARAM_LEFT;
    G_L(0xb4) = ROUNDPARAM_RIGHT - 399;
    G_L(0xac) = FLOOR_Y;

    fighter_reset(&g_f[0], 0);
    fighter_reset(&g_f[1], 1);
    g_frame = 0;
}


/* ------------------------------------------------------------------ the input
 *
 * Build the ten-bit word the engine wants. This is the whole of what a
 * keyboard or a gamepad has to do.
 */
static long read_player(int which)
{
    static const int key[2][10] = {
        { PK_UP, PK_DOWN, PK_LEFT, PK_RIGHT,
          PK_HP, PK_LP, PK_BL, PK_HK, PK_LK, PK_RUN },
        { PK_P2_UP, PK_P2_DOWN, PK_P2_LEFT, PK_P2_RIGHT,
          PK_P2_HP, PK_P2_LP, PK_P2_BL, PK_P2_HK, PK_P2_LK, PK_P2_RUN }
    };
    long bits = 0;
    int  i;

    for (i = 0; i < 10; i++)
        if (plat_key(key[which][i]))
            bits |= 1L << i;

    if (which == 0) {
        int pad = plat_pad(0);
        if (pad > 0)
            bits |= pad;
        if (pad >= 0 && g_pad_seen < 0)
            g_pad_seen = 1;
    }

    /* Bit 10 is a special-move request and this scene never sets it: it would
     * send the word to seq_lookup, 7,608 bytes of playback.c that nobody has
     * decompiled. Said here because the bit exists and is deliberately unused. */
    return bits;
}


/* ============================================== Scorpion's animation clips
 *
 * Every one of these is a real clip name and a real frame range out of
 * `res/framelists/scorpionframes.txt` -- `python tools/animate.py
 * SCORPION_STANDARD --list` prints all fifty-two. A `.skinanim` is one long
 * stream holding every animation the character has, so a range only means
 * something because the frame list names each frame.
 *
 * **The mapping from state to clip is the game's own**, because the names say
 * what they are: SCHIPUNCH is the high punch, SCDUCKLOKICK is the low kick
 * while ducking. What is chosen is the RATE -- `next_anirate` is the engine's
 * animation clock and it is not decompiled.
 */
typedef struct { int from, to; const char *name; } clip;

static const clip CL_STANCE   = { 216, 224, "SCSTANCE"   };
static const clip CL_WALK     = { 282, 290, "SCWALK"     };
static const clip CL_DUCK     = {  20,  22, "SCDUCK"     };
static const clip CL_BLOCK    = {   1,   3, "SCBLOCK"    };
static const clip CL_JUMP     = {  94,  96, "SCJUMP"     };
static const clip CL_JUMPFLIP = {  97, 104, "SCJUMPFLIP" };
static const clip CL_HIT      = {  71,  73, "SCHIHIT"    };
static const clip CL_DUCKHIT  = {  30,  32, "SCDUCKHIT"  };
static const clip CL_VICTORY  = { 276, 281, "SCVICTORY"  };

static const clip CL_MOVE[] = {
    {   0,   0, ""             },   /* MV_NONE        */
    {  80,  86, "SCHIPUNCH"    },   /* MV_HI_PUNCH    */
    { 136, 141, "SCLOPUNCH"    },   /* MV_LO_PUNCH    */
    {   1,   3, "SCBLOCK"      },   /* MV_BLOCK       */
    {  74,  79, "SCHIKICK"     },   /* MV_HI_KICK     */
    { 130, 135, "SCLOKICK"     },   /* MV_LO_KICK     */
    { 271, 275, "SCUPPERCUT"   },   /* MV_UPPERCUT    */
    {  36,  38, "SCDUCKPUNCH"  },   /* MV_DUCK_PUNCH  */
    {  23,  25, "SCDUCKBLOCK"  },   /* MV_DUCK_BLOCK  */
    {  26,  29, "SCDUCKHIKICK" },   /* MV_DUCK_KICKH  */
    {  33,  35, "SCDUCKLOKICK" },   /* MV_DUCK_KICKL  */
    /* There is no SCJUMPPUNCH in the frame list. The flip punch is the one
     * airborne punch Scorpion has, and it stands in for both -- noted rather
     * than hidden, because it is a substitution and not a reading. */
    {  62,  64, "SCFLIPUNCH"   },   /* MV_JUMP_PUNCH  */
    { 105, 107, "SCJUMPKICK"   },   /* MV_JUMP_KICK   */
    {  62,  64, "SCFLIPUNCH"   },   /* MV_FLIP_PUNCH  */
    {  54,  56, "SCFLIPKICK"   }    /* MV_FLIP_KICK   */
};

/* How fast a LOOPING clip plays.
 *
 * There is exactly one of these left. Action clips are driven by the state's
 * own timer -- their length is the clip's -- and the walk is driven by
 * distance, so the two extra rates this file used to carry (an ACTION_HZ and a
 * separate walk rate) were dead: `clip_for` returned them and `pose_fighter`
 * never looked. Removed rather than left to mislead.
 *
 * 12 Hz for the idle is demo.c's number and its reasoning: ten frames at 12 Hz
 * is a breathing stance. `next_anirate` is the engine's own animation clock
 * and is not decompiled, so this is a chosen tempo -- as is ANIM_HOLD, which
 * paces everything else at 30 Hz. **Those two are the whole animation
 * timing.** */
#define IDLE_HZ    12.0

static const clip *clip_for(const fighter *f, double *hz, int *loop)
{
    *hz = IDLE_HZ;
    *loop = 1;

    switch (f->st) {
    case ST_ATTACK: *loop = 0; return &CL_MOVE[f->move];
    case ST_HIT:    *loop = 0;
                    return (f->table == bt_duck) ? &CL_DUCKHIT : &CL_HIT;
    case ST_BLOCK:  *loop = 0; return &CL_BLOCK;
    case ST_DUCK:   *loop = 0; return &CL_DUCK;
    case ST_JUMP:   *loop = 0;
                    return (f->table == bt_angle_jump) ? &CL_JUMPFLIP : &CL_JUMP;
    case ST_WALK_F:
    case ST_WALK_B: return &CL_WALK;      /* driven by distance, not by hz */
    default:
        if (f->health == 0) { *loop = 0; return &CL_VICTORY; }
        return &CL_STANCE;
    }
}


/* ------------------------------------------------- the stand-in for plyrthread */
/* A move lasts exactly as long as its animation: the clip's length in frames,
 * held ANIM_HOLD game frames each. Nothing here is per-move. */
static int move_frames(int mv)
{
    const clip *c;

    if (mv <= MV_NONE || mv >= (int)(sizeof CL_MOVE / sizeof CL_MOVE[0]))
        return ANIM_HOLD;

    c = &CL_MOVE[mv];
    return (c->to - c->from + 1) * ANIM_HOLD;
}

static int move_reach(int mv)
{
    switch (mv) {
    case MV_HI_KICK: case MV_LO_KICK:
    case MV_JUMP_KICK: case MV_FLIP_KICK:               return REACH_KICK;
    default:                                            return REACH_PUNCH;
    }
}

/* Which button, if any, went down this frame. Returns the button number
 * 0..5 -- the bt_* index -- or -1.
 *
 * The buttons come out of `G + 0x1c`, which `TranslateJoybits` has just
 * written, masked exactly the way `buttons_in_a2` masks them. */
static int pressed_button(fighter *f, int which)
{
    unsigned now  = G_U(0x1c) & (which ? BTN_MASK_P2 : BTN_MASK_P1);
    unsigned went = now & ~f->prev_buttons;
    int      i;

    f->prev_buttons = now;

    for (i = 0; i < 6; i++)
        if (went & g_btn_bit[which][i])
            return i;
    return -1;
}

static void start_attack(fighter *f, int mv)
{
    f->st = ST_ATTACK;
    f->move = mv;
    f->timer = f->timer_total = move_frames(mv);
    f->connected = 0;
    fa_swing(mv == MV_UPPERCUT || mv == MV_HI_KICK || mv == MV_LO_KICK);
}

/* init_anirate: the rate is loaded and the countdown starts at ONE, so the
 * first advance lands on the very next frame rather than `rate` frames later. */
static void start_anirate(fighter *f, int rate)
{
    f->ani_rate = rate > 0 ? rate : 1;
    f->ani_count = 1;
    f->ani_index = 0;
}

/* next_anirate: decrement, and on reaching zero reload and step the frame. */
static void tick_anirate(fighter *f, int span)
{
    if (--f->ani_count > 0)
        return;
    f->ani_count = f->ani_rate;
    f->ani_index = (f->ani_index + 1) % (span > 0 ? span : 1);

    /* Two footfalls in the cycle. WHICH frames they land on is a choice: the
     * clip names them SCWALK1..9 and nothing marks contact. */
    if (f->ani_index == 0 || f->ani_index == span / 2)
        fa_step();
}

static void fighter_think(fighter *f, fighter *other, int which, long raw)
{
    int  dir_f, dir_b;                  /* forward and back, in input bits */
    int  btn;
    long vx = 0;
    int  airborne = (p_yi(f) + BOX_H) < FLOOR_Y;

    /* Face the opponent whenever both feet are down. The engine does this in
     * t_walk_flip_check, which is not decompiled; the rule is the obvious one
     * and is a stand-in. */
    if (!airborne && f->st != ST_ATTACK && f->st != ST_HIT)
        f->facing = (p_xi(other) >= p_xi(f)) ? +1 : -1;

    dir_f = (f->facing > 0) ? IN_RIGHT : IN_LEFT;
    dir_b = (f->facing > 0) ? IN_LEFT  : IN_RIGHT;

    /* The facing flag the engine keeps in the part: bit 4 of 0x28. */
    p_set(f, P_FLP, (f->facing > 0) ? 0 : 0x10);

    if (f->timer > 0)
        f->timer--;

    switch (f->st) {
    case ST_HIT:
        if (f->timer == 0) { f->st = ST_STANCE; f->table = bt_stance; }
        break;

    case ST_ATTACK:
        if (f->timer == 0) {
            f->st = airborne ? ST_JUMP : ST_STANCE;
            f->table = airborne ? bt_jump : bt_stance;
            f->move = MV_NONE;
        }
        break;

    case ST_JUMP:
        /* A jump keeps whatever horizontal velocity it started with, and only
         * gravity acts. gravity_n_bounds does that add; landing is here. */
        if (!airborne) {
            p_set(f, P_VY, 0);
            p_set(f, P_G, 0);
            p_set(f, P_VX, 0);
            p_set(f, P_Y, (long)(FLOOR_Y - BOX_H) << FX);
            f->st = ST_STANCE;
            f->table = bt_stance;
            fa_land();
        } else {
            btn = pressed_button(f, which);
            if (btn >= 0 && f->table[btn])
                start_attack(f, f->table[btn]);
        }
        break;

    default:                            /* on the ground and free to act */
        btn = pressed_button(f, which);

        if (raw & IN_DOWN) {
            f->st = ST_DUCK;
            f->table = bt_duck;
        } else if (raw & IN_UP) {
            /* The jump. One negative vy against one positive gravity -- the
             * whole arc is those two numbers and gravity_n_bounds' single add. */
            p_set(f, P_VY, JUMP_VY);
            p_set(f, P_G,  GRAVITY);
            if (raw & dir_f)      p_set(f, P_VX,  JUMP_VX * f->facing);
            else if (raw & dir_b) p_set(f, P_VX, -JUMP_VX * f->facing);
            else                  p_set(f, P_VX, 0);
            f->st = ST_JUMP;
            /* Straight up and angled are different tables -- that is why the
             * engine has both bt_jump and bt_angle_jump. */
            f->table = (raw & (dir_f | dir_b)) ? bt_angle_jump : bt_jump;
            break;
        } else if (raw & dir_f) {
            f->st = ST_WALK_F;
            f->table = bt_stance;
            if (f->st != ST_WALK_F)
                start_anirate(f, WALK_FWD[CHARACTER].rate);
            vx = WALK_FWD[CHARACTER].speed * f->facing;
        } else if (raw & dir_b) {
            f->st = ST_WALK_B;
            f->table = bt_stance;
            if (f->st != ST_WALK_B)
                start_anirate(f, WALK_BACK[CHARACTER].rate);
            vx = -WALK_BACK[CHARACTER].speed * f->facing;
        } else {
            f->st = ST_STANCE;
            f->table = bt_stance;
        }

        if (btn >= 0 && f->table[btn]) {
            int mv = f->table[btn];
            if (mv == MV_BLOCK || mv == MV_DUCK_BLOCK) {
                f->st = ST_BLOCK;
                f->timer = f->timer_total = 2;
                vx = 0;
            } else {
                start_attack(f, mv);
                vx = 0;
            }
        }
        p_set(f, P_VX, vx);
        break;
    }
}

/* Does an attack in flight reach the other fighter this frame? */
static void resolve_hits(fighter *a, fighter *b)
{
    int reach, dx, dy;

    if (a->st != ST_ATTACK || a->connected)
        return;
    /* The strike lands in the middle of the move, not at its start. */
    if (a->timer != move_frames(a->move) / 2)
        return;

    reach = move_reach(a->move);
    dx = p_xi(b) - p_xi(a);
    dy = p_yi(b) - p_yi(a);

    if (a->facing > 0 ? (dx < 0 || dx > reach) : (dx > 0 || -dx > reach))
        return;
    if (dy < -BOX_H || dy > BOX_H)
        return;

    a->connected = 1;

    if (b->st == ST_BLOCK) {
        b->health -= 1;                 /* chip */
        fa_block();
    } else {
        b->health -= DAMAGE;
        b->st = ST_HIT;
        b->timer = b->timer_total = T_HIT;
        b->table = bt_null;             /* how the engine takes input away */
        fa_hit(a->move == MV_UPPERCUT,
               a->move == MV_HI_PUNCH || a->move == MV_HI_KICK);
    }
    if (b->health <= 0) {
        b->health = 0;
        a->wins++;
        fa_voice();
    }
}


/* ------------------------------------------------------------------ one frame */
static void scene_tick(void)
{
    long joy[2];
    int  i;

    joy[0] = read_player(0);
    joy[1] = read_player(1);

    /* THE ENGINE'S OWN INPUT TRANSLATION. Two raw words in, the buttons
     * spread into G + 0x1c, exactly as the fight engine reads them. */
    TranslateJoybits(joy);
    G_L(0x00) = joy[0];
    G_L(0x04) = joy[1];

    for (i = 0; i < 2; i++)
        fighter_think(&g_f[i], &g_f[1 - i], i, joy[i]);

    /* The animation clock runs on the GAME's tick, not the renderer's. */
    for (i = 0; i < 2; i++)
        if (g_f[i].st == ST_WALK_F || g_f[i].st == ST_WALK_B)
            tick_anirate(&g_f[i], CL_WALK.to - CL_WALK.from + 1);

    resolve_hits(&g_f[0], &g_f[1]);
    resolve_hits(&g_f[1], &g_f[0]);

    for (i = 0; i < 2; i++) {
        fighter *f = &g_f[i];

        /* THE ENGINE'S OWN GRAVITY AND WALLS. gravity_n_bounds adds 0x20 into
         * 0x1c and clamps 0x0e against G[0xb0]+0x3a and G[0xb4]+0x15f. */
        gravity_n_bounds(&f->obj);

        /* And DisplayUpdate's two integrations, which are the other half of
         * the same physics: x += vx, y += vy, both 16.16. */
        p_set(f, P_X, p_get(f, P_X) + p_get(f, P_VX));
        p_set(f, P_Y, p_get(f, P_Y) + p_get(f, P_VY));

        /* The floor. gravity_n_bounds knows about walls, not about the ground;
         * the engine grounds a fighter elsewhere, in code not yet read. */
        if (p_yi(f) + BOX_H > FLOOR_Y) {
            p_set(f, P_Y, (long)(FLOOR_Y - BOX_H) << FX);
            if (p_get(f, P_VY) > 0)
                p_set(f, P_VY, 0);
        }
    }

    if (g_f[0].health == 0 || g_f[1].health == 0) {
        if (++g_frame > 120)
            scene_reset();
    }
    g_frame++;
}


/* ------------------------------------------------------------------ drawing
 *
 * The engine's world is two-dimensional and measured in its own units: x runs
 * -492..902, y grows DOWNWARD from the top of the screen, and the floor is at
 * 547. The stage and the character are three-dimensional and measured in
 * whatever the assets use. One number joins them, and it is derived from the
 * character rather than picked: the engine says a fighter is 72 units tall and
 * the model says how tall it is in scene units.
 */
/* ===========================================================================
 * SETTLED -- DO NOT CHANGE. The facing is yaw 0 plus a MIRROR.
 *
 * Decided by the person who can see the screen, against a retail frame, after
 * this was got wrong twice in one day. If a future reading of the data seems
 * to argue otherwise, the data is not the authority here -- the retail frame
 * is. Change it only if the USER reports that the fighters look wrong.
 * ===========================================================================
 *
 * The model's authored facing, in degrees about Y, for a fighter facing RIGHT.
 *
 * **Zero, and the other side is a MIRROR rather than a turn.**
 *
 * These models are sculpted in three-quarter view, the same stance the arcade's
 * digitised actors were photographed in: at yaw 0 a fighter is already angled
 * toward the opponent with his front half toward the camera. That is why the
 * number is 0 and not 90 -- a 90 turns him fully side-on, showing an edge the
 * game never shows.
 *
 * And the fighter on the other side is not this model rotated 180 degrees,
 * which would show his BACK. He is this model MIRRORED: the same pose, flipped
 * across X, exactly as a 2D fighter flips a sprite. Look at any retail frame --
 * both fighters face the camera three-quarters on, and neither is seen from
 * behind.
 *
 * Recorded because I broke this twice in one day. First by reasoning from an
 * extent (78.5 wide against 50.4 deep) instead of looking at the frame I had
 * already rendered; then by "fixing" the working 0 to 90 when the real fault
 * was the 180 on the other fighter. The width is the span of his ARMS.
 */
static float g_yaw = 0.0f;
static int   g_debug;

/* The debug selector's state. `g_stage_i` is the one the scene is showing;
 * `g_pick` is what the panel is pointing at, so browsing does not disturb the
 * fight behind it until Enter. */
static int         g_menu;
static int         g_stage_i;
static int         g_pick;
static const char *g_res;
static const char *g_chr;
static char        g_note[128];

static float g_scale;        /* engine units -> scene units */
static float g_feet;         /* the character's feet in its own model space */
static float g_height;       /* and how tall it is, in scene units */
static float g_width;        /* and how wide, for framing the camera */

static float scene_x(const fighter *f)
{
    return (float)p_xi(f) * g_scale;
}

static float scene_y(const fighter *f)
{
    /* The engine's y is the TOP of the box and grows downward, so the height
     * above the floor is the floor minus where the feet are.
     *
     * **No correction for where the model's feet sit.** `character_draw` in
     * fight_render.c records that the skinned character's lowest vertex is at
     * y = -3.9 and Graveyard's cobbles are a plane at exactly y = 0 -- so the
     * model already stands on the floor when drawn at the origin, and lifting
     * it by -lo[1] would push it 3.9 units into the air for no reason. */
    float above = (float)(FLOOR_Y - (p_yi(f) + BOX_H));
    return above * g_scale;
}

static void pose_fighter(fighter *f, double now)
{
    double      hz, pos;
    int         loop, span, fa, fb;
    const clip *c = clip_for(f, &hz, &loop);

    span = c->to - c->from + 1;
    if (span < 1) span = 1;

    /* **The walk runs on the engine's own clock**: one animation frame every
     * `ani_rate` game frames, and that rate is the other half of the same eight
     * bytes of the walk table the speed came from. See WALK_FWD.
     *
     * It used to advance with DISTANCE, to stop the feet skating at a speed
     * that was itself invented. With the real speed and the real rate there is
     * nothing left to compensate for. */
    if (f->st == ST_WALK_F || f->st == ST_WALK_B) {
        float frac = 1.0f - (float)f->ani_count / (float)(f->ani_rate > 0
                                                          ? f->ani_rate : 1);
        fa = c->from + f->ani_index;
        fb = c->from + ((f->ani_index + 1) % span);
        fr_char_pose(fa, fb, frac);
        return;
    }
    f->anim_last = -1;

    if (loop) {
        pos = now * hz;
        fa  = c->from + (int)fmod(pos, (double)span);
        fb  = c->from + (int)fmod(pos + 1.0, (double)span);
        fr_char_pose(fa, fb, (float)(pos - floor(pos)));
        return;
    }

    /* A one-shot clip is played across the state's own timer, so a punch that
     * lasts fourteen frames shows its whole animation in fourteen frames
     * however many frames the clip happens to have. */
    {
        int total = f->timer_total > 0 ? f->timer_total : 1;
        int done  = total - f->timer;
        if (done < 0) done = 0;
        pos = (double)done * (double)span / (double)total;
        if (pos > (double)(span - 1)) pos = (double)(span - 1);
        fa = c->from + (int)pos;
        fb = (fa + 1 <= c->to) ? fa + 1 : c->to;
        fr_char_pose(fa, fb, (float)(pos - floor(pos)));
    }
}

static void scene_draw(double now, int w, int h)
{
    float mid = (scene_x(&g_f[0]) + scene_x(&g_f[1])) * 0.5f;
    float sep = scene_x(&g_f[0]) - scene_x(&g_f[1]);
    float dist, zfar;
    int   i;

    if (sep < 0) sep = -sep;

    /* demo.c's framing: a LEVEL camera -- no pitch, because tilting it down is
     * what makes a render look like a model viewer instead of a match --
     * distance off the fighter's own height, eye two thirds of the way up.
     * Widened when the two separate so both stay in frame, which is what the
     * engine's camera limits at G + 0x468 and G + 0x470 are for. */
    /* To fit a horizontal span S at this field of view:
     *      S/2 <= dist * tan(fov/2) * aspect
     * With a 25 degree vertical fov that is dist >= S / (2 * 0.2217 * aspect).
     * The span has to include the two bodies, not just the gap between their
     * centres, or a fighter at the edge is cut in half -- which is what the
     * first version did. */
    {
        float aspect = (float)w / (float)h;
        float span   = sep + 2.2f * g_width;
        float need   = span / (2.0f * 0.2217f * aspect);

        dist = g_height * 4.48f;
        if (need > dist) dist = need;
    }

    zfar = fr_stage_reach() * 1.2f;
    if (zfar < dist * 4.0f) zfar = dist * 4.0f;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glMatrixMode(GL_PROJECTION);
    fr_perspective(fr_fov(), (float)w / (float)h, g_height * 0.15f, zfar);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glTranslatef(0.0f, 0.0f, -dist);
    glTranslatef(-mid, -(g_height * 0.66f), 0.0f);

    fr_stage_draw(0);

    /* Pose, draw, pose, draw. The skinning buffers are single-instance, so a
     * draw has to follow its own pose -- see runtime/fight_render.c. */
    for (i = 0; i < 2; i++) {
        fighter *f = &g_f[i];
        pose_fighter(f, now);
        /* Mirrored, not turned around. See g_yaw. */
        int mirror = f->facing < 0;
        fr_char_draw(scene_x(f), scene_y(f), 0.0f, g_yaw, mirror, 1);
        fr_char_draw(scene_x(f), scene_y(f), 0.0f, g_yaw, mirror, 0);
    }
}


/* Swap the stage without restarting. `fr_stage_free` exists for exactly this;
 * without it every switch would leak a whole stage and its textures. */
static int load_stage(int idx)
{
    g_note[0] = 0;

    fr_stage_free();
    if (!fr_stage_load(g_res, fs_stage(idx))) {
        _snprintf(g_note, sizeof g_note, "COULD NOT LOAD %s", fs_stage(idx));
        g_note[sizeof g_note - 1] = 0;
        /* Fall back to the one that was working, so a bad pick leaves a usable
         * tool rather than a black screen. */
        fr_stage_free();
        fr_stage_load(g_res, fs_stage(g_stage_i));
        return 0;
    }
    g_stage_i = idx;
    fa_music(g_res, fs_music(idx));
    printf("stage: %s   music: %s\n", fs_stage(idx), fs_music(idx));
    return 1;
}


/* ===================================================== the scene as a module
 *
 * `umk3-fight` still has its own `main` below and behaves exactly as before.
 * These three entry points exist so `runtime/test_main.c` can run the real
 * front end and this scene in one process, switching between them -- which is
 * what "integrate the menu" means when the menu must not be modified.
 *
 * The split is: setup owns the loading, `fight_frame` owns ONE displayed frame
 * including its own fixed 60 Hz ticks, and shutdown owns the freeing. Nothing
 * about the simulation changed.
 */
static double g_t0, g_prev, g_accum;
static int    g_frames;

int fight_setup(const char *res, const char *chr, int stage_idx)
{
    float lo[3], hi[3];

    g_res    = res;
    g_chr    = chr;
    g_stage_i = stage_idx;
    g_pick    = stage_idx;

    printf("loading from %s\n", res);
    if (!fr_stage_load(res, fs_stage(stage_idx))) {
        fprintf(stderr, "could not load the stage %s\n", fs_stage(stage_idx));
        return 0;
    }
    if (!fr_char_load(res, chr)) {
        fprintf(stderr, "could not load the character %s\n", chr);
        return 0;
    }

    /* One pose up front, to measure the character and derive the single number
     * that joins the engine's world to the stage's. */
    fr_char_pose(CL_STANCE.from, CL_STANCE.from, 0.0f);
    fr_char_extent(lo, hi);
    g_height = hi[1] - lo[1];
    g_width  = hi[0] - lo[0];
    g_feet   = lo[1];
    g_scale  = g_height / (float)BOX_H;

    printf("  %s extent: x %.1f..%.1f (%.1f wide)  y %.1f..%.1f (%.1f tall)\n",
           chr, lo[0], hi[0], g_width, lo[1], hi[1], g_height);
    printf("  arena %d..%d, floor %d   (measured from the binary)\n",
           WALL_L, WALL_R, FLOOR_Y);

    fa_open(res);
    fa_music(res, fs_music(stage_idx));

    scene_reset();
    g_t0 = plat_time();
    g_prev = 0.0;
    g_accum = 0.0;
    return 1;
}

/* One displayed frame. Returns 0 when the player asked to leave the scene. */
int fight_frame(int w, int h)
{
    double now = plat_time() - g_t0;
    int    steps = 0;
    static int was_menu, was_ok, was_next, was_prev, was_reset, was_back;
    int    k;

    if (h <= 0)
        h = 1;

    k = plat_key(PK_MENU);
    if (k && !was_menu) { g_menu = !g_menu; g_pick = g_stage_i; }
    was_menu = k;

    k = plat_key(PK_RESET);
    if (k && !was_reset) scene_reset();
    was_reset = k;

    /* **Every edge is tracked unconditionally, and only ACTED on while the
     * panel is open.** Clearing these in an else branch was a real bug:
     * closing the panel with Enter still held cleared `was_ok`, so the key
     * looked freshly pressed the moment the panel reopened and loaded a stage
     * nobody asked for. A held key is not a new press, whatever mode the
     * program is in. */
    {
        int next = plat_key(PK_NEXT);
        int prev = plat_key(PK_PREV);
        int ok   = plat_key(PK_OK);

        if (g_menu) {
            if (next && !was_next) g_pick++;
            if (prev && !was_prev) g_pick--;
            if (ok && !was_ok) {
                int want = ((g_pick % fs_stage_count())
                            + fs_stage_count()) % fs_stage_count();
                if (load_stage(want)) {
                    scene_reset();
                    g_menu = 0;
                }
            }
        }
        was_next = next;
        was_prev = prev;
        was_ok   = ok;
    }

    g_accum += now - g_prev;
    g_prev = now;
    if (g_accum > (double)MAX_CATCHUP / TICK_HZ)
        g_accum = (double)MAX_CATCHUP / TICK_HZ;
    while (g_accum >= 1.0 / TICK_HZ && steps < MAX_CATCHUP) {
        if (!g_menu)                    /* the panel pauses the fight */
            scene_tick();
        g_accum -= 1.0 / TICK_HZ;
        steps++;
    }

    glViewport(0, 0, w, h);
    scene_draw(now, w, h);

    if (g_menu)
        fs_draw(w, h, 0,
                ((g_pick % fs_stage_count()) + fs_stage_count())
                    % fs_stage_count(),
                0, 0, g_note);

    fa_update();

    if (++g_frames % 30 == 0 && g_debug) {
        static const char *sn[] = { "stance", "walk-f", "walk-b", "duck",
                                    "block", "jump", "attack", "hit" };
        int j;
        for (j = 0; j < 2; j++) {
            fighter *f = &g_f[j];
            printf("p%d %-6s ex=%5d ey=%4d vx=%8ld  face=%+d  %s\n",
                   j + 1, sn[f->st], p_xi(f), p_yi(f),
                   (long)p_get(f, P_VX), f->facing, g_move_name[f->move]);
        }
    }

    /* F3 leaves the scene. Only the shell has anywhere to go, so standalone
     * ignores what this returns. */
    k = plat_key(PK_BACK);
    if (k && !was_back) { was_back = k; return 0; }
    was_back = k;
    return 1;
}

void fight_shutdown(void)
{
    fa_close();
    fr_char_free();
    fr_stage_free();
}


#ifndef UMK3_SHELL
int main(int argc, char **argv)
{
    const char *res   = NULL;
    const char *chr   = "SCORPION_STANDARD";
    const char *stage = NULL;
    int    i, pos = 0;
    const char *shot = NULL;
    float  lo[3], hi[3];
    double t0, prev = 0.0, accum = 0.0;
    int    frames = 0;

    setvbuf(stdout, NULL, _IONBF, 0);

    /* Flags and positionals interleave, so they are separated here rather than
     * taken by index. Taking argv[2] blindly made `umk3-fight <res> --debug`
     * look for a character called "--debug"; demo.c's own argument loop
     * carries a note about the identical mistake. */
    for (i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--yaw") && i + 1 < argc)
            g_yaw = (float)atof(argv[++i]);
        /* `--shot out.ppm` renders one frame and exits, the same as demo.c.
         *
         * This scene did not have it, and that is how it shipped with the
         * fighters facing the camera: the orientation was argued from an
         * extent instead of checked against a picture, because checking meant
         * looking at a window by hand. A program that photographs itself is
         * the only honest way to verify a renderer. */
        else if (!strcmp(argv[i], "--shot") && i + 1 < argc)
            shot = argv[++i];
        else if (!strcmp(argv[i], "--debug"))
            g_debug = 1;
        else if (argv[i][0] == '-')
            fprintf(stderr, "unknown flag %s, ignored\n", argv[i]);
        else if (pos == 0) { res   = argv[i]; pos++; }
        else if (pos == 1) { chr   = argv[i]; pos++; }
        else if (pos == 2) { stage = argv[i]; pos++; }
    }

    /* Default to the first entry of the selector's own catalogue, so the
     * command line and the panel agree about what stage 1 is. */
    if (stage == NULL)
        stage = fs_stage(0);
    g_chr = chr;
    {
        int s;
        for (s = 0; s < fs_stage_count(); s++)
            if (!strcmp(stage, fs_stage(s))) { g_stage_i = s; break; }
        g_pick = g_stage_i;
    }

    /* With no path given, look for a `res` folder beside the executable. That
     * is what the packaged build ships as: the user drops their own extracted
     * `UMK3.app/res` in next to the .exe and double-clicks it.
     *
     * **No game data is in this repository or in that package.** The folder
     * has to come from the user's own copy of the app. The probe is for a file
     * deep inside it rather than for the directory, so a half-copied `res`
     * fails here with a clear message instead of failing later with "no
     * .bones". */
    if (res == NULL) {
        static char beside[1024];
        char *slash;
        FILE *probe;
        char  test[1200];

        _snprintf(beside, sizeof beside, "%s", argv[0]);
        beside[sizeof beside - 1] = 0;
        slash = strrchr(beside, '\\');
        if (!slash)
            slash = strrchr(beside, '/');
        if (slash)
            slash[1] = 0;
        else
            beside[0] = 0;
        strncat(beside, "res", sizeof beside - strlen(beside) - 1);

        _snprintf(test, sizeof test, "%s/framelists/scorpionframes.txt", beside);
        test[sizeof test - 1] = 0;
        probe = fopen(test, "rb");
        if (probe) {
            fclose(probe);
            res = beside;
        }
    }

    if (res == NULL) {
        printf("usage: %s <path to UMK3.app/res> [character] [stage]\n"
               "\n"
               "No path was given and there is no usable `res` folder next to\n"
               "this executable.\n"
               "\n"
               "This build ships NO GAME DATA. Copy the `res` folder out of\n"
               "your own extracted UMK3.app and put it beside this .exe, or\n"
               "pass its path on the command line.\n", argv[0]);
        return 2;
    }

    if (!plat_open("UMK3 -- fight scene", 1280, 720)) {
        fprintf(stderr, "could not open a window\n");
        return 1;
    }

    g_res = res;
    printf("loading from %s\n", res);
    if (!fr_stage_load(res, stage)) {
        fprintf(stderr, "could not load the stage %s\n", stage);
        return 1;
    }
    if (!fr_char_load(res, chr)) {
        fprintf(stderr, "could not load the character %s\n", chr);
        return 1;
    }

    /* One pose up front, to measure the character and derive the single number
     * that joins the engine's world to the stage's. */
    fr_char_pose(CL_STANCE.from, CL_STANCE.from, 0.0f);
    fr_char_extent(lo, hi);
    g_height = hi[1] - lo[1];
    g_width  = hi[0] - lo[0];
    g_feet   = lo[1];

    /* **Height, not width.** The two ratios disagree by 39 per cent -- 1.946
     * by height against 1.401 by width -- because `mk3_getbbox`'s hard-coded
     * 56 x 72 is a HITBOX for one animation and not the model's outline. The
     * height is the one both systems describe the same way: the engine's floor
     * is at 547 and a fighter's head is 72 above it, and the model's head is
     * 140 scene units above its feet. */
    g_scale  = g_height / (float)BOX_H;

    printf("  %s extent: x %.1f..%.1f (%.1f wide)  y %.1f..%.1f (%.1f tall)"
           "  z %.1f..%.1f\n",
           chr, lo[0], hi[0], hi[0] - lo[0], lo[1], hi[1], g_height,
           lo[2], hi[2]);
    printf("  the engine calls that %d wide and %d tall, so one engine unit\n"
           "  is %.4f scene units by height and %.4f by width\n",
           BOX_W, BOX_H, g_height / (float)BOX_H,
           (hi[0] - lo[0]) / (float)BOX_W);
    printf("  arena %d..%d, floor %d   (measured from the binary)\n",
           WALL_L, WALL_R, FLOOR_Y);
    printf("\n  P1  W A S D   U I O = HP LP BL   J K L = HK LK RUN\n");
    printf("  P2  arrows    numpad 7 8 9 / 4 5 6\n");
    printf("  F1 opens the stage selector, F5 resets, Escape quits.\n\n");

    fa_open(res);
    fa_music(res, fs_music(g_stage_i));

    scene_reset();

    glEnable(GL_DEPTH_TEST);
    glDisable(GL_CULL_FACE);
    glClearColor(0.05f, 0.05f, 0.07f, 1.0f);

    t0 = plat_time();

    while (plat_poll()) {
        int    w, h, steps = 0;
        double now = plat_time() - t0;
        static int was_menu, was_ok, was_next, was_prev, was_reset;
        int    k;

        /* Edge-triggered, because these are commands and not held inputs.
         * The fight's own buttons go through TranslateJoybits and get their
         * edges from G + 0x1c; these never touch it. */
        k = plat_key(PK_MENU);
        if (k && !was_menu) { g_menu = !g_menu; g_pick = g_stage_i; }
        was_menu = k;

        k = plat_key(PK_RESET);
        if (k && !was_reset) scene_reset();
        was_reset = k;

        /* **Every edge is tracked unconditionally, and only ACTED on while the
         * panel is open.** Clearing these in an else branch was a real bug:
         * closing the panel with Enter still held cleared `was_ok`, so the key
         * looked freshly pressed the moment the panel reopened and loaded a
         * stage nobody asked for. A held key is not a new press, whatever mode
         * the program is in. */
        {
            int next = plat_key(PK_NEXT);
            int prev = plat_key(PK_PREV);
            int ok   = plat_key(PK_OK);

            if (g_menu) {
                if (next && !was_next) g_pick++;
                if (prev && !was_prev) g_pick--;
                if (ok && !was_ok) {
                    int want = ((g_pick % fs_stage_count())
                                + fs_stage_count()) % fs_stage_count();
                    if (load_stage(want)) {
                        scene_reset();
                        g_menu = 0;
                    }
                }
            }
            was_next = next;
            was_prev = prev;
            was_ok   = ok;
        }

        /* Fixed 60 Hz, however fast the display is running. */
        accum += now - prev;
        prev = now;
        if (accum > (double)MAX_CATCHUP / TICK_HZ)
            accum = (double)MAX_CATCHUP / TICK_HZ;
        while (accum >= 1.0 / TICK_HZ && steps < MAX_CATCHUP) {
            if (!g_menu)                /* the panel pauses the fight */
                scene_tick();
            accum -= 1.0 / TICK_HZ;
            steps++;
        }

        plat_size(&w, &h);
        if (h <= 0) h = 1;
        glViewport(0, 0, w, h);

        scene_draw(now, w, h);

        if (g_menu)
            fs_draw(w, h, 0,
                    ((g_pick % fs_stage_count()) + fs_stage_count())
                        % fs_stage_count(),
                    0, 0, g_note);

        fa_update();

        if (shot) {
            int sw, sh;
            plat_size(&sw, &sh);
            fr_screenshot(shot, sw, sh);
            plat_swap();
            break;
        }

        if (!plat_swap())
            break;

        if (++frames % 30 == 0) {
            if (g_debug) {
                static const char *sn[] = { "stance", "walk-f", "walk-b",
                                            "duck", "block", "jump",
                                            "attack", "hit" };
                int k;
                for (k = 0; k < 2; k++) {
                    fighter *f = &g_f[k];
                    printf("p%d %-6s ex=%5d ey=%4d vx=%8ld  face=%+d  "
                           "sx=%8.1f sy=%7.1f  %s\n",
                           k + 1, sn[f->st], p_xi(f), p_yi(f),
                           (long)p_get(f, P_VX), f->facing,
                           scene_x(f), scene_y(f), g_move_name[f->move]);
                }
                printf("   G+0x1c=%08lx  yaw=%.0f  scale=%.4f\n\n",
                       (unsigned long)G_U(0x1c), g_yaw, g_scale);
            } else if (frames % 60 == 0) {
                printf("G+0x1c = %08lx   p1 %-12s hp %3d   p2 %-12s hp %3d%s\n",
                       (unsigned long)G_U(0x1c),
                       g_move_name[g_f[0].move], g_f[0].health,
                       g_move_name[g_f[1].move], g_f[1].health,
                       g_pad_seen > 0 ? "   [pad]" : "");
            }
        }
    }

    fa_close();
    plat_close();
    return 0;
}
#endif /* UMK3_SHELL -- test_main.c supplies its own */
