========================================================================
t_r_robo_bomb  0x000486ec  232 bytes   mkreact.c
========================================================================

000486ec  push    {r4, r5, r7, lr}
000486ee  add     r7, sp, #8
000486f0  ldr.w   r2, [r0, #0xa4]
000486f4  mov     r4, r0
000486f6  ldr.w   r5, [r0, #0x108]
000486fa  adds    r3, r2, #1
000486fc  movw    r1, #0x6cc
00048700  ldr.w   r0, [r0, r3, lsl #3]
00048704  cmp     r0, r1
00048706  beq     #0x48764
00048708  movw    r3, #0x6dc
0004870c  cmp     r0, r3
0004870e  beq     #0x4874a
00048710  cbz     r0, #0x48718
00048712  mvn     r0, #2
00048716  pop     {r4, r5, r7, pc}
00048718  str     r0, [r5, #0x30]
0004871a  str     r0, [r5, #0x38]
0004871c  movs    r3, #1
0004871e  str     r3, [r5, #0x34]
00048720  ldr.w   r3, [r4, #0xa4]
00048724  ldr     r2, [pc, #0x9c]
00048726  adds    r3, #1
00048728  add     r2, pc ; -> 0x00044b85  t_reaction_start
0004872a  str.w   r1, [r4, r3, lsl #3]
0004872e  ldr.w   r3, [r4, #0xa4]
00048732  adds    r3, #1
00048734  str.w   r3, [r4, #0xa4]
00048738  lsls    r3, r3, #3
0004873a  adds    r3, r3, r4
0004873c  str     r2, [r3, #4]
0004873e  ldr.w   r3, [r4, #0xa4]
00048742  adds    r3, #1
00048744  str.w   r0, [r4, r3, lsl #3]
00048748  b       #0x48716
0004874a  ldr.w   r1, [pc, #0x7c]
0004874e  add     r1, pc ; -> 0x000425b9  t_reaction_land
00048750  lsls    r3, r2, #3
00048752  adds    r3, r3, r4
00048754  movs    r0, #0
00048756  str     r1, [r3, #4]
00048758  ldr.w   r3, [r4, #0xa4]
0004875c  adds    r3, #1
0004875e  str.w   r0, [r4, r3, lsl #3]
00048762  b       #0x48716
00048764  mov     r0, r5
00048766  movs    r3, #2
00048768  str     r3, [r5, #0x1c]
0004876a  bl      #0x580a4 ; -> group_sound
0004876e  mov     r0, r5
00048770  movw    r3, #0x6006
00048774  str     r3, [r5, #0x48]
00048776  bl      #0x581e0 ; -> shake_a11
0004877a  mov     r0, r5
0004877c  bl      #0x55388 ; -> face_opponent
00048780  mov     r0, r5
00048782  bl      #0x55394 ; -> flip_multi
00048786  ldr.w   r3, [pc, #0x44]
0004878a  movw    r2, #0x6dc
0004878e  str     r3, [r5, #0x1c]
00048790  sub.w   r3, r3, #0x90000
00048794  str     r3, [r5, #0x20]
00048796  add.w   r3, r3, #0xc6000
0004879a  str     r3, [r5, #0x24]
0004879c  movs    r3, #5
0004879e  str     r3, [r5, #0x28]
000487a0  adds    r3, #0x19
000487a2  str     r3, [r5, #0x40]
000487a4  ldr.w   r3, [r4, #0xa4]
000487a8  adds    r3, #1
000487aa  str.w   r2, [r4, r3, lsl #3]
000487ae  ldr.w   r3, [r4, #0xa4]
000487b2  adds    r2, r3, #1
000487b4  ldr.w   r3, [pc, #0x18]
000487b8  str.w   r2, [r4, #0xa4]
000487bc  add     r3, pc ; -> 0x000f3720  t_flight
000487be  ldr     r1, [r3]
000487c0  b       #0x48750
000487c2  nop     
000487c4  stm     r4!, {r0, r3, r4, r6}
