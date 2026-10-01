========================================================================
t_joy_roundhouse  0x0002f148  108 bytes   joy.c
========================================================================

0002f148  ldr.w   r1, [r0, #0xa4]
0002f14c  adds    r3, r1, #1
0002f14e  ldr.w   r2, [r0, r3, lsl #3]
0002f152  cbnz    r2, #0x2f184
0002f154  mov.w   r1, #0x210
0002f158  str.w   r1, [r0, r3, lsl #3]
0002f15c  ldr.w   r3, [r0, #0xa4]
0002f160  adds    r1, r3, #1
0002f162  ldr     r3, [pc, #0x48]
0002f164  str.w   r1, [r0, #0xa4]
0002f168  add     r3, pc ; -> 0x000f37f0  t_stat_do_roundhouse
0002f16a  ldr.w   ip, [r3]
0002f16e  lsls    r3, r1, #3
0002f170  adds    r3, r3, r0
0002f172  str.w   ip, [r3, #4]
0002f176  ldr.w   r3, [r0, #0xa4]
0002f17a  adds    r3, #1
0002f17c  str.w   r2, [r0, r3, lsl #3]
0002f180  mov     r0, r2
0002f182  bx      lr
0002f184  cmp.w   r2, #0x210
0002f188  it      ne
0002f18a  mvnne   r0, #2
0002f18e  bne     #0x2f182
0002f190  ldr     r2, [pc, #0x1c]
0002f192  lsls    r3, r1, #3
0002f194  adds    r3, r3, r0
0002f196  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002f198  str     r2, [r3, #4]
0002f19a  ldr.w   r3, [r0, #0xa4]
0002f19e  movs    r2, #0
0002f1a0  adds    r3, #1
0002f1a2  str.w   r2, [r0, r3, lsl #3]
0002f1a6  mov     r0, r2
0002f1a8  b       #0x2f182
0002f1aa  nop     
0002f1ac  mov     ip, r0
0002f1ae  movs    r4, r1
0002f1b0  lsrs    r7, r0, #0x1b
0002f1b2  movs    r0, r0
