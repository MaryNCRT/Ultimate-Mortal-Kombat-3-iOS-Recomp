========================================================================
t_b_boss_hit1  0x000436f4  212 bytes   mkreact.c
========================================================================

000436f4  push    {r4, r5, r7, lr}
000436f6  add     r7, sp, #8
000436f8  ldr.w   r3, [r0, #0xa4]
000436fc  mov     r4, r0
000436fe  ldr.w   r5, [r0, #0x108]
00043702  adds    r3, #1
00043704  movw    r2, #0x1305
00043708  ldr.w   r0, [r0, r3, lsl #3]
0004370c  cmp     r0, r2
0004370e  beq     #0x43772
00043710  movw    r3, #0x1311
00043714  cmp     r0, r3
00043716  beq     #0x43750
00043718  cbz     r0, #0x43720
0004371a  mvn     r0, #2
0004371e  pop     {r4, r5, r7, pc}
00043720  str     r0, [r5, #0x38]
00043722  str     r0, [r5, #0x30]
00043724  str     r0, [r5, #0x34]
00043726  ldr.w   r3, [r4, #0xa4]
0004372a  adds    r3, #1
0004372c  str.w   r2, [r4, r3, lsl #3]
00043730  ldr.w   r3, [r4, #0xa4]
00043734  ldr     r2, [pc, #0x84]
00043736  adds    r3, #1
00043738  str.w   r3, [r4, #0xa4]
0004373c  lsls    r3, r3, #3
0004373e  adds    r3, r3, r4
00043740  add     r2, pc ; -> 0x000475a1  t_blocked_start
00043742  str     r2, [r3, #4]
00043744  ldr.w   r3, [r4, #0xa4]
00043748  adds    r3, #1
0004374a  str.w   r0, [r4, r3, lsl #3]
0004374e  b       #0x4371e
00043750  ldr     r2, [pc, #0x6c]
00043752  mov.w   r3, #0x40000
00043756  str     r3, [r5, #0x1c]
00043758  ldr.w   r3, [r4, #0xa4]
0004375c  add     r2, pc ; -> 0x00043df5  t_stumble_back_vel
0004375e  lsls    r3, r3, #3
00043760  adds    r3, r3, r4
00043762  movs    r0, #0
00043764  str     r2, [r3, #4]
00043766  ldr.w   r3, [r4, #0xa4]
0004376a  adds    r3, #1
0004376c  str.w   r0, [r4, r3, lsl #3]
00043770  b       #0x4371e
00043772  movs    r1, #5
00043774  mov     r0, r5
00043776  bl      #0x57dbc ; -> rsnd_func
0004377a  mov     r0, r5
0004377c  mov.w   r3, #0x60000
00043780  str     r3, [r5, #0x1c]
00043782  bl      #0x55ab0 ; -> away_x_vel
00043786  mov     r0, r5
00043788  mov.w   r3, #0x60006
0004378c  str     r3, [r5, #0x48]
0004378e  bl      #0x581e0 ; -> shake_a11
00043792  movs    r3, #2
00043794  str     r3, [r5, #0x48]
00043796  adds    r3, #1
00043798  str     r3, [r5, #0x44]
0004379a  adds    r3, #9
0004379c  str     r3, [r5, #0x40]
0004379e  ldr.w   r3, [r4, #0xa4]
000437a2  movw    r2, #0x1311
000437a6  adds    r3, #1
000437a8  str.w   r2, [r4, r3, lsl #3]
000437ac  ldr     r2, [pc, #0x14]
000437ae  ldr.w   r3, [r4, #0xa4]
000437b2  add     r2, pc ; -> 0x00044751  t_block_shake
000437b4  adds    r3, #1
000437b6  str.w   r3, [r4, #0xa4]
000437ba  b       #0x4375e
000437bc  subs    r6, #0x5d
000437be  movs    r0, r0
000437c0  lsls    r5, r2, #0x1a
000437c2  movs    r0, r0
000437c4  lsrs    r3, r3, #0x1e
000437c6  movs    r0, r0
