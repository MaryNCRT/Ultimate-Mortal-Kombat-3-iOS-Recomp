/* debug_menu.h -- the in-game debug menu (F2); see debug_menu.c. */
#ifndef UMK3_DEBUG_MENU_H
#define UMK3_DEBUG_MENU_H

#define DBG_SCREENS 51                  /* FETaskFunctionList's screens */

enum { DBG_NONE, DBG_FIGHT, DBG_SCREEN, DBG_FIGHT_KEY };

struct dbg_request {
    int what;                           /* DBG_* */
    int a, b, c;                        /* fight: p1, p2, stage; screen: n;
                                           fight key: 0..3 as F9..F12 */
};

int  dbg_menu_is_open(void);
void dbg_menu_toggle(void);
/* After GameCodeMain: a pending open grabs the frame just drawn. */
void dbg_menu_after_frame(int vx, int vy, int vw, int vh, int task, int fe);
/* While open, instead of the game's tick: 1 and *rq filled when a pick
 * closes the menu. */
int  dbg_menu_tick(struct dbg_request *rq);
void dbg_menu_draw(void);

int  dbg_keys_on(void);                /* the menu's DIRECT KEYS row */
int  dbg_info_on(void);
void dbg_info_toggle(void);
void dbg_info_draw(const char *line);

#endif
