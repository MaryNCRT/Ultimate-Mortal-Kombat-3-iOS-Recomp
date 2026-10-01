========================================================================
t_r_sw_zap  0x000420f4  156 bytes   mkreact.c
========================================================================

000420f4  push    {r4, r5, r6, r7, lr}
000420f6  add     r7, sp, #0xc
000420f8  ldr.w   r3, [r0, #0xa4]
000420fc  mov     r4, r0
000420fe  ldr.w   r5, [r0, #0x108]
00042102  adds    r3, #1
00042104  ldr.w   r6, [r0, r3, lsl #3]
00042108  cmp     r6, #0
0004210a  bne     #0x42152
0004210c  mov     r0, r5
0004210e  movs    r3, #2
00042110  str     r3, [r5, #0x1c]
00042112  bl      #0x580a4 ; -> group_sound
00042116  ldr     r3, [pc, #0x6c]
00042118  str     r6, [r5, #0x38]
0004211a  movw    r2, #0x1116
0004211e  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00042120  str     r3, [r5, #0x30]
00042122  movs    r3, #1
00042124  str     r3, [r5, #0x34]
00042126  ldr.w   r3, [r4, #0xa4]
0004212a  mov     r0, r6
0004212c  adds    r3, #1
0004212e  str.w   r2, [r4, r3, lsl #3]
00042132  ldr.w   r3, [r4, #0xa4]
00042136  ldr     r2, [pc, #0x50]
00042138  adds    r3, #1
0004213a  str.w   r3, [r4, #0xa4]
0004213e  lsls    r3, r3, #3
00042140  adds    r3, r3, r4
00042142  add     r2, pc ; -> 0x00044b85  t_reaction_start
00042144  str     r2, [r3, #4]
00042146  ldr.w   r3, [r4, #0xa4]
0004214a  adds    r3, #1
0004214c  str.w   r6, [r4, r3, lsl #3]
00042150  pop     {r4, r5, r6, r7, pc}
00042152  movw    r3, #0x1116
00042156  cmp     r6, r3
00042158  it      ne
0004215a  mvnne   r0, #2
0004215e  bne     #0x42150
00042160  mov.w   r3, #0x40000
00042164  str     r3, [r5, #0x1c]
00042166  ldr.w   r3, [r4, #0xa4]
0004216a  ldr     r2, [pc, #0x20]
0004216c  movs    r0, #0
0004216e  lsls    r3, r3, #3
00042170  adds    r3, r3, r4
00042172  add     r2, pc ; -> 0x00043df5  t_stumble_back_vel
00042174  str     r2, [r3, #4]
00042176  ldr.w   r3, [r4, #0xa4]
0004217a  adds    r3, #1
0004217c  str.w   r0, [r4, r3, lsl #3]
00042180  b       #0x42150
00042182  nop     
00042184  lsls    r7, r5, #0x1c
00042186  movs    r0, r0
00042188  cmp     r2, #0x3f
0004218a  movs    r0, r0
0004218c  adds    r7, r7, #1
0004218e  movs    r0, r0
