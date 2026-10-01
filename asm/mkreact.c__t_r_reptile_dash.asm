========================================================================
t_r_reptile_dash  0x000494e4  232 bytes   mkreact.c
========================================================================

000494e4  push    {r4, r5, r6, r7, lr}
000494e6  add     r7, sp, #0xc
000494e8  str     r8, [sp, #-0x4]!
000494ec  ldr.w   r3, [r0, #0xa4]
000494f0  movw    r8, #0x306
000494f4  mov     r4, r0
000494f6  adds    r3, #1
000494f8  ldr.w   r5, [r0, #0x108]
000494fc  ldr.w   r6, [r0, r3, lsl #3]
00049500  cmp     r6, r8
00049502  beq     #0x49564
00049504  movw    r3, #0x30d
00049508  cmp     r6, r3
0004950a  beq     #0x4953e
0004950c  cbz     r6, #0x49518
0004950e  mvn     r0, #2
00049512  ldr     r8, [sp], #4
00049516  pop     {r4, r5, r6, r7, pc}
00049518  mov     r0, r5
0004951a  bl      #0x55070 ; -> am_i_airborn
0004951e  cbz     r0, #0x49570
00049520  ldr     r3, [pc, #0x9c]
00049522  mov     r0, r6
00049524  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00049526  ldr     r2, [r3]
00049528  ldr.w   r3, [r4, #0xa4]
0004952c  lsls    r3, r3, #3
0004952e  adds    r3, r3, r4
00049530  str     r2, [r3, #4]
00049532  ldr.w   r3, [r4, #0xa4]
00049536  adds    r3, #1
00049538  str.w   r6, [r4, r3, lsl #3]
0004953c  b       #0x49512
0004953e  mov     r0, r5
00049540  bl      #0x5a680 ; -> next_anirate
00049544  ldr     r3, [r5, #0x44]
00049546  subs    r3, #1
00049548  cmp     r3, #0
0004954a  str     r3, [r5, #0x44]
0004954c  blt     #0x495a0
0004954e  ldr.w   r3, [r4, #0xa4]
00049552  movs    r0, #1
00049554  movw    r2, #0x30d
00049558  adds    r3, #1
0004955a  str.w   r2, [r4, r3, lsl #3]
0004955e  str.w   r0, [r4, #0xfc]
00049562  b       #0x49512
00049564  mov     r0, r5
00049566  bl      #0x553c4 ; -> stance_setup
0004956a  movs    r3, #0x14
0004956c  str     r3, [r5, #0x44]
0004956e  b       #0x4954e
00049570  str     r0, [r5, #0x30]
00049572  str     r0, [r5, #0x34]
00049574  str     r0, [r5, #0x38]
00049576  ldr.w   r3, [r4, #0xa4]
0004957a  ldr     r2, [pc, #0x48]
0004957c  adds    r3, #1
0004957e  add     r2, pc ; -> 0x00044b85  t_reaction_start
00049580  str.w   r8, [r4, r3, lsl #3]
00049584  ldr.w   r3, [r4, #0xa4]
00049588  adds    r3, #1
0004958a  str.w   r3, [r4, #0xa4]
0004958e  lsls    r3, r3, #3
00049590  adds    r3, r3, r4
00049592  str     r2, [r3, #4]
00049594  ldr.w   r3, [r4, #0xa4]
00049598  adds    r3, #1
0004959a  str.w   r0, [r4, r3, lsl #3]
0004959e  b       #0x49512
000495a0  ldr.w   r3, [pc, #0x24]
000495a4  movs    r0, #0
000495a6  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000495a8  ldr     r2, [r3]
000495aa  ldr.w   r3, [r4, #0xa4]
000495ae  lsls    r3, r3, #3
000495b0  adds    r3, r3, r4
000495b2  str     r2, [r3, #4]
000495b4  ldr.w   r3, [r4, #0xa4]
000495b8  adds    r3, #1
000495ba  str.w   r0, [r4, r3, lsl #3]
000495be  b       #0x49512
000495c0  adr     r1, #0x380
000495c2  movs    r2, r1
