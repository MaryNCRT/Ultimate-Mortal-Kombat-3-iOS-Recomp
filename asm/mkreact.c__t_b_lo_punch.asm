========================================================================
t_b_lo_punch  0x0004496c  184 bytes   mkreact.c
========================================================================

0004496c  push    {r4, r5, r6, r7, lr}
0004496e  add     r7, sp, #0xc
00044970  ldr.w   r3, [r0, #0xa4]
00044974  mov     r5, r0
00044976  ldr.w   r4, [r0, #0x108]
0004497a  adds    r3, #1
0004497c  ldr.w   r6, [r0, r3, lsl #3]
00044980  cbnz    r6, #0x449c4
00044982  mov     r0, r4
00044984  movs    r1, #6
00044986  bl      #0x57dbc ; -> rsnd_func
0004498a  ldr     r3, [pc, #0x8c]
0004498c  str     r6, [r4, #0x30]
0004498e  str     r6, [r4, #0x34]
00044990  add     r3, pc ; -> 0x00041bed  t_cc_punch
00044992  str     r3, [r4, #0x38]
00044994  ldr.w   r3, [r5, #0xa4]
00044998  movw    r2, #0x1386
0004499c  mov     r0, r6
0004499e  adds    r3, #1
000449a0  str.w   r2, [r5, r3, lsl #3]
000449a4  ldr.w   r3, [r5, #0xa4]
000449a8  ldr     r2, [pc, #0x70]
000449aa  adds    r3, #1
000449ac  str.w   r3, [r5, #0xa4]
000449b0  lsls    r3, r3, #3
000449b2  adds    r3, r3, r5
000449b4  add     r2, pc ; -> 0x000475a1  t_blocked_start
000449b6  str     r2, [r3, #4]
000449b8  ldr.w   r3, [r5, #0xa4]
000449bc  adds    r3, #1
000449be  str.w   r6, [r5, r3, lsl #3]
000449c2  pop     {r4, r5, r6, r7, pc}
000449c4  movw    r3, #0x1386
000449c8  cmp     r6, r3
000449ca  it      ne
000449cc  mvnne   r0, #2
000449d0  bne     #0x449c2
000449d2  mov     r0, r4
000449d4  mov.w   r3, #0x50000
000449d8  str     r3, [r4, #0x54]
000449da  bl      #0x55808 ; -> am_i_short
000449de  ldr     r3, [r4, #0x5c]
000449e0  cbz     r3, #0x44a10
000449e2  ldr     r3, [r4, #0x54]
000449e4  mov     r0, r4
000449e6  str     r3, [r4, #0x1c]
000449e8  bl      #0x55ab0 ; -> away_x_vel
000449ec  movs    r3, #2
000449ee  str     r3, [r4, #0x48]
000449f0  adds    r3, #1
000449f2  str     r3, [r4, #0x44]
000449f4  ldr.w   r3, [r5, #0xa4]
000449f8  ldr     r2, [pc, #0x24]
000449fa  movs    r0, #0
000449fc  lsls    r3, r3, #3
000449fe  adds    r3, r3, r5
00044a00  add     r2, pc ; -> 0x00044865  t_block_shake_n_exit
00044a02  str     r2, [r3, #4]
00044a04  ldr.w   r3, [r5, #0xa4]
00044a08  adds    r3, #1
00044a0a  str.w   r0, [r5, r3, lsl #3]
00044a0e  b       #0x449c2
00044a10  add.w   r3, r3, #0x30000
00044a14  str     r3, [r4, #0x54]
00044a16  b       #0x449e2
00044a18  bhs     #0x44ace
00044a1a  vtbx.8  d18, {d31, fpinst2, mvfr0, mvfr1}, d25
00044a1e  movs    r0, r0
00044a20  mcr2    p15, #3, pc, c1, c15, #7
