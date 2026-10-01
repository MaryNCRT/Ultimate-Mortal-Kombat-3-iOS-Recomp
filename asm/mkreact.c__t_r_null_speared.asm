========================================================================
t_r_null_speared  0x00041144  128 bytes   mkreact.c
========================================================================

00041144  ldr.w   r3, [r0, #0xa4]
00041148  ldr.w   r2, [r0, #0x108]
0004114c  adds    r3, #1
0004114e  ldr.w   r3, [r0, r3, lsl #3]
00041152  cbnz    r3, #0x4118a
00041154  str     r3, [r2, #0x30]
00041156  str     r3, [r2, #0x34]
00041158  str     r3, [r2, #0x38]
0004115a  ldr.w   r2, [r0, #0xa4]
0004115e  mov.w   r1, #0x3f4
00041162  adds    r2, #1
00041164  str.w   r1, [r0, r2, lsl #3]
00041168  ldr.w   r2, [r0, #0xa4]
0004116c  ldr     r1, [pc, #0x4c]
0004116e  adds    r2, #1
00041170  str.w   r2, [r0, #0xa4]
00041174  lsls    r2, r2, #3
00041176  adds    r2, r2, r0
00041178  add     r1, pc ; -> 0x00044b85  t_reaction_start
0004117a  str     r1, [r2, #4]
0004117c  ldr.w   r2, [r0, #0xa4]
00041180  adds    r2, #1
00041182  str.w   r3, [r0, r2, lsl #3]
00041186  mov     r0, r3
00041188  bx      lr
0004118a  cmp.w   r3, #0x3f4
0004118e  it      ne
00041190  mvnne   r0, #2
00041194  bne     #0x41188
00041196  mov.w   r3, #0x40000
0004119a  str     r3, [r2, #0x1c]
0004119c  ldr.w   r3, [r0, #0xa4]
000411a0  ldr     r2, [pc, #0x1c]
000411a2  lsls    r3, r3, #3
000411a4  adds    r3, r3, r0
000411a6  add     r2, pc ; -> 0x00043df5  t_stumble_back_vel
000411a8  str     r2, [r3, #4]
000411aa  ldr.w   r3, [r0, #0xa4]
000411ae  adds    r2, r3, #1
000411b0  movs    r3, #0
000411b2  str.w   r3, [r0, r2, lsl #3]
000411b6  mov     r0, r3
000411b8  b       #0x41188
000411ba  nop     
000411bc  subs    r2, #9
000411be  movs    r0, r0
000411c0  cmp     r4, #0x4b
000411c2  movs    r0, r0
