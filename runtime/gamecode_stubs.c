/*
 * gamecode_stubs.c — the three boundaries the front end calls across.
 *
 * `decomp/gamecode` is complete, but a menu that runs still has to resolve
 * everything it calls *out* to. Three groups, and they are stubbed for three
 * different reasons:
 *
 *   EA_SDK / EASOC   ~27 calls. Store, social, tracking, Facebook, leaderboards.
 *                    These went to EA's servers, some of which no longer exist.
 *                    The project's plan was always to delete this layer rather
 *                    than decompile it, and these are that deletion.
 *
 *   multiplayer      ~30 calls. GKSession peer-to-peer over Bluetooth. A native
 *                    port needs a real transport and it is not this one, so the
 *                    lobby answers "no peers, not connected" -- the state the
 *                    game already handles, because it is what a device with the
 *                    radio off reports.
 *
 *   mk3_*            7 calls into gamecode/logic, the fight engine, which is
 *                    3 of 2,172 written. The front end only reaches these on
 *                    the way *out* of the menus, so a menu build can link
 *                    without them and a fight build cannot.
 *
 * ## Every answer here is a state the original could produce
 *
 * That is the rule this file follows and it is worth stating. `isMPConnected`
 * returns 0 because a device with no peer nearby returns 0; `getNumberOfPeers`
 * returns 0 for the same reason. The front end has real code for both -- the
 * blinking "looking for players" line in FE_Task_Multiplayer is exactly that
 * path -- so the menus behave like the retail game with the radio off, not like
 * a game running against a broken library.
 *
 * Where an answer would be a lie, the call does nothing and returns nothing
 * instead. `EASOC_FBGetFriendName` returns an empty string rather than a name.
 */

#include <stddef.h>

#include "gamecode_globals.h"


/* ---- counters, so a test can assert a call happened without a server ---- */

static long g_ea_events;
static long g_mp_packets;

long gamecode_stub_ea_events(void)  { return g_ea_events; }
long gamecode_stub_mp_packets(void) { return g_mp_packets; }


/* ------------------------------------------------------------- EA_SDK ---- */

void EASDK_LogEvent(long id, long a, const char *s1, long b, const char *s2)
{ (void)id; (void)a; (void)s1; (void)b; (void)s2; g_ea_events++; }

void EASDK_LogEventEnumEnum(long id, long a, long b, long c, long d)
{ (void)id; (void)a; (void)b; (void)c; (void)d; g_ea_events++; }

void EASDK_LogEventEnumEnumString(long id, long a, const char *s1,
                                  long b, const char *s2)
{ (void)id; (void)a; (void)s1; (void)b; (void)s2; g_ea_events++; }

void EASDK_LogEventEnumEnumStringNum(long id, long a, const char *s,
                                     long b, long n)
{ (void)id; (void)a; (void)s; (void)b; (void)n; g_ea_events++; }

void EASDK_SetLoggingDisable(long off) { (void)off; }
void EASDK_ShowMessage(void)           { }
void EASDK_GetMoreGames(const char *language, long a)
{ (void)language; (void)a; }

/* No network: the ticker is empty and nothing is connected. DrawTicker already
 * handles an empty list -- it is what the game shows offline. */
long        EASDK_ConnectedToNetwork(void)      { return 0; }
void       *EASDK_GetLoadedTicker(long i)       { (void)i; return NULL; }
long        EASDK_GetTickerId(void *t)          { (void)t; return 0; }
const char *EASDK_GetTickerMsg(void)            { return ""; }
const char *EASDK_GetTickerUrl(void *t)         { (void)t; return ""; }


/* -------------------------------------------------- EA social / Mayhem ---- */

void  EASOC_debugFunc(void)                     { }
void  EASOC_FBInit(void)                        { }
int   EASOC_FBGetFriendsNum(void)               { return 0; }
char *EASOC_FBGetFriendName(int index)          { (void)index; return ""; }

/* Mayhem is EA's leaderboard service. "Ready, nothing pending, no name needed"
 * is the quiet state: FE_Task_Karnage_Summary's four-state username handshake
 * then completes instead of hanging on a reply that never comes. */
int  EASOC_MayhemIsReady(void)                  { return 1; }
int  EASOC_MayhemIsPending(void)                { return 0; }
int  EASOC_MayhemNeedsUserName(void)            { return 0; }
void EASOC_MayhemReset(void)                    { }
void EASOC_MayhemTest(long a)                   { (void)a; }
void EASOC_MayhemSetUserName(const char *name)  { (void)name; }
void EASOC_MayhemGetUserStat(const char *stat)  { (void)stat; }

void EASOC_MayhemPostStatWithData(const char *key, long value,
                                  const long *data, long size)
{ (void)key; (void)value; (void)data; (void)size; }

void EASOC_MayhemInitLeaderBoard(long board, const char *filter, long period,
                                 long count, const char *stat)
{ (void)board; (void)filter; (void)period; (void)count; (void)stat; }

void EASOC_MayhemReloadLeaderBoard(long board, long period, long page,
                                   long count, const char *stat)
{ (void)board; (void)period; (void)page; (void)count; (void)stat; }

long EASOC_MayhemGetLeaderBoard(long page, long count, long period, void *cb)
{ (void)page; (void)count; (void)period; (void)cb; return 0; }


/* -------------------------------------------------------- multiplayer ---- */

/* No radio. Every one of these is the answer a device gives with Bluetooth off,
 * which is a path the front end already has code for. */
long isMPConnected(void)        { return 0; }
long isParent(void)             { return 0; }
long isParentBasedOnSpeed(void) { return 0; }
long isWorking(void)            { return 0; }
long isHeartbeatOn(void)        { return 0; }
long getNumberOfPeers(void)     { return 0; }

long getPeerNumber(long index, char *out, long size)
{
    (void)index;
    /* An empty name, terminated. The lobby draws whatever is in the row, so a
     * buffer left untouched would draw uninitialised bytes as text. */
    if (out && size > 0)
        out[0] = 0;
    return 0;
}

void startMP(void)                  { }
void endMP(void)                    { }
void restartConnection(void)        { }
void connectToPeer(long index)      { (void)index; }
void updateLobbyHeartBeat(void)     { }
void enableHeartbeat(long mode)     { (void)mode; }
void disableHeartbeat(void)         { }
void heartbeatSetIncoming(long s)   { (void)s; }
void heartbeatSend(void)            { }
void heartbeatUpdate(void)          { }
void doFPSExchange(void)            { }
long syncGame(long frame)           { (void)frame; return frame; }

void sendCharacterPacket(long who)      { (void)who; g_mp_packets++; }
void sendMenuPacket(long which)         { (void)which; g_mp_packets++; }
void sendFEMenuPacket(long item)        { (void)item; g_mp_packets++; }
void sendGenericPacket(long a, long b)  { (void)a; (void)b; g_mp_packets++; }
void sendLevelPacket(void)              { g_mp_packets++; }
void sendPlayPacket(void)               { g_mp_packets++; }
void sendQuit(void)                     { g_mp_packets++; }
void sendPause(long state)              { (void)state; g_mp_packets++; }

void sendKodePacket(const int *digits, long index)
{ (void)digits; (void)index; g_mp_packets++; }

void sendTimerPacket(long timer, long wait)
{ (void)timer; (void)wait; g_mp_packets++; }

void sendJoystickInputPacket(long a, long bits)
{ (void)a; (void)bits; g_mp_packets++; }

void sendSpriteListPacket(void *objects, long a, long b)
{ (void)objects; (void)a; (void)b; g_mp_packets++; }

long setNextSpritesAndEvents(void) { return 0; }


/* ------------------------------------------- gamecode/logic, the fight ---- */

/* 3 of 2,172 written. The menus call into these only on the way out, so a menu
 * build links against these and a fight build must not. */
void mk3_init(long p1model, long p2model, void (*getBBox)(void), long flag)
{ (void)p1model; (void)p2model; (void)getBBox; (void)flag; }

void mk3_init_game(void)                       { }
void mk3_update(const long *joy, void **objects) { (void)joy; (void)objects; }
void mk3_dizzy(void)                           { }
void mk3_set_four_button(long side, long four) { (void)side; (void)four; }
long mk3_who_in_front(void)                    { return 0; }
void no_ai_hack(void)                          { }


/* ------------------------------------------------- compiler support ---- */

/* The ARM EABI's signed-modulo helper. It is in the transcription because the
 * compiler emitted a real call rather than a reciprocal multiply -- which it
 * only does when the divisor is not a constant -- so the call is evidence about
 * the source and was kept. On a host it is just the operator.
 *
 * `long` and not `int`: the transcription declares it that way and on 32-bit
 * ARM the two are the same width. */
long __modsi3(long a, long b)
{
    return a % b;
}

/* The compiler-generated thunk that runs `LocaleManager`'s static destructor.
 * `__GLOBAL__D` registers it with `__cxa_atexit` at startup. There is no
 * LocaleManager here to destroy, so it does nothing, and it is stubbed rather
 * than removed because the registration call is part of the transcription. */
void __tcf_0(void *p)
{
    (void)p;
}


/* --------------------------------------------------------- the one C++ ---- */

/* `LocaleManager` is the only C++ class the front end touches, and the
 * transcription carries its symbols mangled because that is how they appear in
 * the binary: `_ZN13LocaleManagerC1Ev` is the constructor and
 * `_ZN13LocaleManager10s_instanceE` its static instance, both reached from the
 * translation unit's `__GLOBAL__I` static-initialisation thunk.
 *
 * Defining them here in C works because a mangled name is just a name to the
 * linker. The class body is not in the decomp, so the instance gets placeholder
 * storage rather than an invented layout -- nothing in the menus reads it, and
 * the constructor is what would fill it.
 */
struct LocaleManager_placeholder { long words[16]; };
struct LocaleManager_placeholder _ZN13LocaleManager10s_instanceE;

void _ZN13LocaleManagerC1Ev(void *self)
{
    (void)self;
}


/* ------------------------------------------------- two odd declarations ---- */

/* `extern union { float f; long w; } PlayerZPos;` -- an anonymous union, which
 * the generator cannot name a type for. Written out here rather than taught to
 * the generator: it is the only one in the tree.
 *
 * The union is not decoration. RenderLevelPlayers reads the same 32 bits as a
 * float for the world position and as a word for the compare, which is why the
 * transcription kept it. */
union { float f; long w; } PlayerZPos;

/* `TheHud` is a HUD, and HUD embeds a `HUDANIM anim` by value whose layout is
 * not established anywhere in the decomp. Its size is unknown, so the generator
 * skips it and this gives it the smallest storage that lets the tree link,
 * clearly marked. The HUD is a fight-screen structure; nothing in the menus
 * reads it. Whoever decompiles HUDANIM should delete this. */
struct HUD_placeholder { long words[16]; };
struct HUD_placeholder TheHud;
