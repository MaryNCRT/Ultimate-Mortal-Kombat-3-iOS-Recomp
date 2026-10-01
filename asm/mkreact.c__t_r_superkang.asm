========================================================================
t_r_superkang  0x000430c4  224 bytes   mkreact.c
========================================================================

000430c4  push    {r4, r5, r7, lr}
000430c6  add     r7, sp, #8
000430c8  ldr.w   r2, [r0, #0xa4]
000430cc  mov     r4, r0
000430ce  ldr.w   r5, [r0, #0x108]
000430d2  adds    r3, r2, #1
000430d4  movw    r1, #0x4aa
000430d8  ldr.w   r0, [r0, r3, lsl #3]
000430dc  cmp     r0, r1
000430de  beq     #0x4313c
000430e0  movw    r3, #0x4b7
000430e4  cmp     r0, r3
000430e6  beq     #0x43122
000430e8  cbz     r0, #0x430f0
000430ea  mvn     r0, #2
000430ee  pop     {r4, r5, r7, pc}
000430f0  str     r0, [r5, #0x30]
000430f2  str     r0, [r5, #0x38]
000430f4  movs    r3, #1
000430f6  str     r3, [r5, #0x34]
000430f8  ldr.w   r3, [r4, #0xa4]
000430fc  ldr     r2, [pc, #0x98]
000430fe  adds    r3, #1
00043100  add     r2, pc ; -> 0x00044b85  t_reaction_start
00043102  str.w   r1, [r4, r3, lsl #3]
00043106  ldr.w   r3, [r4, #0xa4]
0004310a  adds    r3, #1
0004310c  str.w   r3, [r4, #0xa4]
00043110  lsls    r3, r3, #3
00043112  adds    r3, r3, r4
00043114  str     r2, [r3, #4]
00043116  ldr.w   r3, [r4, #0xa4]
0004311a  adds    r3, #1
0004311c  str.w   r0, [r4, r3, lsl #3]
00043120  b       #0x430ee
00043122  ldr.w   r1, [pc, #0x78]
00043126  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00043128  lsls    r3, r2, #3
0004312a  adds    r3, r3, r4
0004312c  movs    r0, #0
0004312e  str     r1, [r3, #4]
00043130  ldr.w   r3, [r4, #0xa4]
00043134  adds    r3, #1
00043136  str.w   r0, [r4, r3, lsl #3]
0004313a  b       #0x430ee
0004313c  movs    r1, #8
0004313e  mov     r0, r5
00043140  bl      #0x57dbc ; -> rsnd_func
00043144  mov     r0, r5
00043146  movs    r3, #2
00043148  str     r3, [r5, #0x1c]
0004314a  bl      #0x580a4 ; -> group_sound
0004314e  mov     r0, r5
00043150  mov.w   r3, #0x50005
00043154  str     r3, [r5, #0x48]
00043156  bl      #0x581e0 ; -> shake_a11
0004315a  mov.w   r3, #0x60000
0004315e  str     r3, [r5, #0x1c]
00043160  sub.w   r3, r3, #0x90000
00043164  str     r3, [r5, #0x20]
00043166  add.w   r3, r3, #0x34000
0004316a  str     r3, [r5, #0x24]
0004316c  movs    r3, #5
0004316e  str     r3, [r5, #0x28]
00043170  adds    r3, #0x19
00043172  str     r3, [r5, #0x40]
00043174  ldr.w   r3, [r4, #0xa4]
00043178  movw    r2, #0x4b7
0004317c  adds    r3, #1
0004317e  str.w   r2, [r4, r3, lsl #3]
00043182  ldr.w   r3, [r4, #0xa4]
00043186  adds    r2, r3, #1
00043188  ldr.w   r3, [pc, #0x14]
0004318c  str.w   r2, [r4, #0xa4]
00043190  add     r3, pc ; -> 0x000f3720  t_flight
00043192  ldr     r1, [r3]
00043194  b       #0x43128
00043196  nop     
00043198  subs    r1, r0, r2
0004319a  movs    r0, r0
0004319c  bl      #0x43319e
000431a0  lsls    r4, r1, #0x16
000431a2  movs    r3, r1
