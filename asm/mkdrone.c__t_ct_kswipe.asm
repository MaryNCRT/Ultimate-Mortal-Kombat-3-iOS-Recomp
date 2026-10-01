========================================================================
t_ct_kswipe  0x0006d050  124 bytes   mkdrone.c
========================================================================

0006d050  push    {r4, r5, r6, r7, lr}
0006d052  add     r7, sp, #0xc
0006d054  ldr.w   r3, [r0, #0xa4]
0006d058  mov     r4, r0
0006d05a  ldr.w   r5, [r0, #0x108]
0006d05e  adds    r3, #1
0006d060  ldr.w   r6, [r0, r3, lsl #3]
0006d064  cbnz    r6, #0x6d08e
0006d066  mov     r0, r5
0006d068  bl      #0x2f3a0 ; -> get_x_dist
0006d06c  ldr     r3, [r5, #0x28]
0006d06e  cmp     r3, #0x8f
0006d070  bgt     #0x6d094
0006d072  ldr     r2, [pc, #0x4c]
0006d074  add     r2, pc ; -> 0x0006fa21  t_d_block
0006d076  ldr.w   r3, [r4, #0xa4]
0006d07a  mov     r0, r6
0006d07c  lsls    r3, r3, #3
0006d07e  adds    r3, r3, r4
0006d080  str     r2, [r3, #4]
0006d082  ldr.w   r3, [r4, #0xa4]
0006d086  adds    r3, #1
0006d088  str.w   r6, [r4, r3, lsl #3]
0006d08c  b       #0x6d092
0006d08e  mvn     r0, #2
0006d092  pop     {r4, r5, r6, r7, pc}
0006d094  mov     r0, r5
0006d096  bl      #0x6c9f4 ; -> should_i_promove
0006d09a  ldr     r0, [r5, #0x5c]
0006d09c  cbz     r0, #0x6d0a4
0006d09e  ldr     r2, [pc, #0x24]
0006d0a0  add     r2, pc ; -> 0x00067f91  t_d_zap
0006d0a2  b       #0x6d076
0006d0a4  ldr.w   r3, [r4, #0xa4]
0006d0a8  ldr     r2, [pc, #0x1c]
0006d0aa  lsls    r3, r3, #3
0006d0ac  adds    r3, r3, r4
0006d0ae  add     r2, pc ; -> 0x0006b309  t_swait_nonattack_jump
0006d0b0  str     r2, [r3, #4]
0006d0b2  ldr.w   r3, [r4, #0xa4]
0006d0b6  adds    r3, #1
0006d0b8  str.w   r0, [r4, r3, lsl #3]
0006d0bc  b       #0x6d092
0006d0be  nop     
0006d0c0  cmp     r1, #0xa9
0006d0c2  movs    r0, r0
0006d0c4  add     r6, sp, #0x3b4
