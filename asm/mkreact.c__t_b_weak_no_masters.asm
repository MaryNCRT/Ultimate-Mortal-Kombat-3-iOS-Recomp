========================================================================
t_b_weak_no_masters  0x000426f4  132 bytes   mkreact.c
========================================================================

000426f4  push    {r4, r5, r6, r7, lr}
000426f6  add     r7, sp, #0xc
000426f8  ldr.w   r2, [r0, #0xa4]
000426fc  mov     r4, r0
000426fe  ldr.w   r6, [r0, #0x108]
00042702  adds    r3, r2, #1
00042704  ldr.w   r5, [r0, r3, lsl #3]
00042708  cbnz    r5, #0x42748
0004270a  mov     r0, r6
0004270c  movs    r1, #6
0004270e  bl      #0x57dbc ; -> rsnd_func
00042712  str     r5, [r6, #0x30]
00042714  str     r5, [r6, #0x34]
00042716  str     r5, [r6, #0x38]
00042718  ldr.w   r3, [r4, #0xa4]
0004271c  movw    r2, #0x13ca
00042720  mov     r0, r5
00042722  adds    r3, #1
00042724  str.w   r2, [r4, r3, lsl #3]
00042728  ldr.w   r3, [r4, #0xa4]
0004272c  ldr     r2, [pc, #0x40]
0004272e  adds    r3, #1
00042730  str.w   r3, [r4, #0xa4]
00042734  lsls    r3, r3, #3
00042736  adds    r3, r3, r4
00042738  add     r2, pc ; -> 0x000475a1  t_blocked_start
0004273a  str     r2, [r3, #4]
0004273c  ldr.w   r3, [r4, #0xa4]
00042740  adds    r3, #1
00042742  str.w   r5, [r4, r3, lsl #3]
00042746  pop     {r4, r5, r6, r7, pc}
00042748  movw    r3, #0x13ca
0004274c  cmp     r5, r3
0004274e  it      ne
00042750  mvnne   r0, #2
00042754  bne     #0x42746
00042756  ldr     r1, [pc, #0x1c]
00042758  lsls    r3, r2, #3
0004275a  adds    r3, r3, r4
0004275c  add     r1, pc ; -> 0x00041dc5  t_weak3
0004275e  str     r1, [r3, #4]
00042760  ldr.w   r3, [r4, #0xa4]
00042764  movs    r0, #0
00042766  adds    r3, #1
00042768  str.w   r0, [r4, r3, lsl #3]
0004276c  b       #0x42746
0004276e  nop     
00042770  ldr     r6, [pc, #0x194]
00042772  movs    r0, r0
00042774  bl      #0xffea8776
