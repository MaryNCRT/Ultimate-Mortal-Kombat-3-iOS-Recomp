========================================================================
t_r_quake  0x00043960  216 bytes   mkreact.c
========================================================================

00043960  push    {r4, r5, r7, lr}
00043962  add     r7, sp, #8
00043964  ldr.w   r2, [r0, #0xa4]
00043968  mov     r4, r0
0004396a  ldr.w   r5, [r0, #0x108]
0004396e  adds    r3, r2, #1
00043970  movw    r1, #0x1125
00043974  ldr.w   r0, [r0, r3, lsl #3]
00043978  cmp     r0, r1
0004397a  beq     #0x439e6
0004397c  movw    r3, #0x112e
00043980  cmp     r0, r3
00043982  beq     #0x439cc
00043984  cbz     r0, #0x4398c
00043986  mvn     r0, #2
0004398a  pop     {r4, r5, r7, pc}
0004398c  ldr     r2, [r5]
0004398e  movw    r3, #0x113
00043992  str     r3, [r5, #0x1c]
00043994  str     r3, [r2, #0x48]
00043996  ldr     r3, [pc, #0x8c]
00043998  str     r0, [r5, #0x38]
0004399a  ldr     r2, [pc, #0x8c]
0004399c  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
0004399e  str     r3, [r5, #0x30]
000439a0  movs    r3, #6
000439a2  str     r3, [r5, #0x34]
000439a4  ldr.w   r3, [r4, #0xa4]
000439a8  add     r2, pc ; -> 0x00044b85  t_reaction_start
000439aa  adds    r3, #1
000439ac  str.w   r1, [r4, r3, lsl #3]
000439b0  ldr.w   r3, [r4, #0xa4]
000439b4  adds    r3, #1
000439b6  str.w   r3, [r4, #0xa4]
000439ba  lsls    r3, r3, #3
000439bc  adds    r3, r3, r4
000439be  str     r2, [r3, #4]
000439c0  ldr.w   r3, [r4, #0xa4]
000439c4  adds    r3, #1
000439c6  str.w   r0, [r4, r3, lsl #3]
000439ca  b       #0x4398a
000439cc  ldr     r3, [pc, #0x5c]
000439ce  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000439d0  ldr     r1, [r3]
000439d2  lsls    r3, r2, #3
000439d4  adds    r3, r3, r4
000439d6  movs    r0, #0
000439d8  str     r1, [r3, #4]
000439da  ldr.w   r3, [r4, #0xa4]
000439de  adds    r3, #1
000439e0  str.w   r0, [r4, r3, lsl #3]
000439e4  b       #0x4398a
000439e6  mov     r0, r5
000439e8  movs    r3, #2
000439ea  str     r3, [r5, #0x1c]
000439ec  bl      #0x580a4 ; -> group_sound
000439f0  mov     r0, r5
000439f2  mov.w   r3, #0x28000
000439f6  str     r3, [r5, #0x1c]
000439f8  bl      #0x55ab0 ; -> away_x_vel
000439fc  movs    r3, #0x14
000439fe  str     r3, [r5, #0x44]
00043a00  ldr     r3, [pc, #0x2c]
00043a02  movw    r2, #0x112e
00043a06  str     r3, [r5, #0x40]
00043a08  ldr.w   r3, [r4, #0xa4]
00043a0c  adds    r3, #1
00043a0e  str.w   r2, [r4, r3, lsl #3]
00043a12  ldr.w   r3, [r4, #0xa4]
00043a16  adds    r2, r3, #1
00043a18  ldr.w   r3, [pc, #0x18]
00043a1c  str.w   r2, [r4, #0xa4]
00043a20  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00043a22  b       #0x439d0
00043a24  mrc     p15, #5, apsr_nzcv, c1, c15, #7
00043a28  asrs    r1, r3, #7
00043a2a  movs    r0, r0
00043a2c  ldc2    p0, c0, [r6, #-0x28]!
00043a30  movs    r0, r4
00043a32  movs    r4, r0
00043a34  stc2    p0, c0, [ip], #0x28
