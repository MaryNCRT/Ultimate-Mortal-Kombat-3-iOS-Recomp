========================================================================
t_land_on_my_back  0x00042518  160 bytes   mkreact.c
========================================================================

00042518  push    {r4, r5, r6, r7, lr}
0004251a  add     r7, sp, #0xc
0004251c  str     r8, [sp, #-0x4]!
00042520  ldr.w   r2, [r0, #0xa4]
00042524  movw    r8, #0x1485
00042528  mov     r4, r0
0004252a  adds    r3, r2, #1
0004252c  ldr.w   r6, [r0, #0x108]
00042530  ldr.w   r5, [r0, r3, lsl #3]
00042534  cmp     r5, r8
00042536  beq     #0x425a0
00042538  movw    r3, #0x1486
0004253c  cmp     r5, r3
0004253e  beq     #0x42586
00042540  cbz     r5, #0x4254c
00042542  mvn     r0, #2
00042546  ldr     r8, [sp], #4
0004254a  pop     {r4, r5, r6, r7, pc}
0004254c  mov     r0, r6
0004254e  bl      #0x424fc ; -> shake_n_sound
00042552  movs    r3, #3
00042554  str     r3, [r6, #0x1c]
00042556  subs    r3, #2
00042558  str     r3, [r6, #0x44]
0004255a  ldr.w   r3, [r4, #0xa4]
0004255e  ldr     r2, [pc, #0x50]
00042560  mov     r0, r5
00042562  adds    r3, #1
00042564  add     r2, pc ; -> 0x00042219  t_shake_on_my_back
00042566  str.w   r8, [r4, r3, lsl #3]
0004256a  ldr.w   r3, [r4, #0xa4]
0004256e  adds    r3, #1
00042570  str.w   r3, [r4, #0xa4]
00042574  lsls    r3, r3, #3
00042576  adds    r3, r3, r4
00042578  str     r2, [r3, #4]
0004257a  ldr.w   r3, [r4, #0xa4]
0004257e  adds    r3, #1
00042580  str.w   r5, [r4, r3, lsl #3]
00042584  b       #0x42546
00042586  ldr.w   r1, [pc, #0x2c]
0004258a  lsls    r3, r2, #3
0004258c  adds    r3, r3, r0
0004258e  add     r1, pc ; -> 0x00041f8d  t_getup_reaction_exit
00042590  str     r1, [r3, #4]
00042592  ldr.w   r3, [r0, #0xa4]
00042596  movs    r0, #0
00042598  adds    r3, #1
0004259a  str.w   r0, [r4, r3, lsl #3]
0004259e  b       #0x42546
000425a0  movw    r2, #0x1486
000425a4  str.w   r2, [r0, r3, lsl #3]
000425a8  movs    r0, #4
000425aa  str.w   r0, [r4, #0xfc]
000425ae  b       #0x42546
000425b0  ldc2    p15, c15, [r1], #0x3fc
