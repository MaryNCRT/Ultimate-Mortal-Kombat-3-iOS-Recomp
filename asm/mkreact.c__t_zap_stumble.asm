========================================================================
t_zap_stumble  0x00042448  152 bytes   mkreact.c
========================================================================

00042448  push    {r4, r5, r7, lr}
0004244a  add     r7, sp, #8
0004244c  ldr.w   r3, [r0, #0xa4]
00042450  mov     r4, r0
00042452  ldr.w   r5, [r0, #0x108]
00042456  adds    r3, #1
00042458  ldr.w   r0, [r0, r3, lsl #3]
0004245c  cbnz    r0, #0x42498
0004245e  ldr     r3, [pc, #0x74]
00042460  str     r0, [r5, #0x38]
00042462  movw    r2, #0x10fd
00042466  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00042468  str     r3, [r5, #0x30]
0004246a  movs    r3, #6
0004246c  str     r3, [r5, #0x34]
0004246e  ldr.w   r3, [r4, #0xa4]
00042472  adds    r3, #1
00042474  str.w   r2, [r4, r3, lsl #3]
00042478  ldr.w   r3, [r4, #0xa4]
0004247c  ldr     r2, [pc, #0x58]
0004247e  adds    r3, #1
00042480  str.w   r3, [r4, #0xa4]
00042484  lsls    r3, r3, #3
00042486  adds    r3, r3, r4
00042488  add     r2, pc ; -> 0x00044b85  t_reaction_start
0004248a  str     r2, [r3, #4]
0004248c  ldr.w   r3, [r4, #0xa4]
00042490  adds    r3, #1
00042492  str.w   r0, [r4, r3, lsl #3]
00042496  pop     {r4, r5, r7, pc}
00042498  movw    r3, #0x10fd
0004249c  cmp     r0, r3
0004249e  it      ne
000424a0  mvnne   r0, #2
000424a4  bne     #0x42496
000424a6  mov     r0, r5
000424a8  mov.w   r3, #0x60006
000424ac  str     r3, [r5, #0x48]
000424ae  bl      #0x581e0 ; -> shake_a11
000424b2  mov.w   r3, #0x40000
000424b6  str     r3, [r5, #0x1c]
000424b8  ldr.w   r3, [r4, #0xa4]
000424bc  ldr     r2, [pc, #0x1c]
000424be  movs    r0, #0
000424c0  lsls    r3, r3, #3
000424c2  adds    r3, r3, r4
000424c4  add     r2, pc ; -> 0x00043df5  t_stumble_back_vel
000424c6  str     r2, [r3, #4]
000424c8  ldr.w   r3, [r4, #0xa4]
000424cc  adds    r3, #1
000424ce  str.w   r0, [r4, r3, lsl #3]
000424d2  b       #0x42496
000424d4  lsls    r7, r4, #0xf
000424d6  movs    r0, r0
000424d8  movs    r6, #0xf9
000424da  movs    r0, r0
000424dc  adds    r5, r5, r4
000424de  movs    r0, r0
