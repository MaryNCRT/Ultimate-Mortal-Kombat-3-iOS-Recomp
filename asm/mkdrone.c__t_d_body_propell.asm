========================================================================
t_d_body_propell  0x0006c264  104 bytes   mkdrone.c
========================================================================

0006c264  ldr.w   r3, [r0, #0xa4]
0006c268  ldr.w   r2, [r0, #0x108]
0006c26c  adds    r3, #1
0006c26e  ldr.w   r1, [r0, r3, lsl #3]
0006c272  cbz     r1, #0x6c27a
0006c274  mvn     r0, #2
0006c278  bx      lr
0006c27a  ldr     r3, [pc, #0x48]
0006c27c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006c27e  ldr.w   ip, [r3]
0006c282  str.w   ip, [r2, #0x38]
0006c286  ldr.w   r3, [r0, #0xa4]
0006c28a  lsls    r3, r3, #3
0006c28c  adds    r3, r3, r0
0006c28e  str.w   ip, [r3, #4]
0006c292  ldr.w   r3, [r0, #0xa4]
0006c296  adds    r3, #1
0006c298  str.w   r1, [r0, r3, lsl #3]
0006c29c  ldr.w   r3, [r0, #0xa4]
0006c2a0  adds    r2, r3, #1
0006c2a2  ldr     r3, [pc, #0x24]
0006c2a4  str.w   r2, [r0, #0xa4]
0006c2a8  add     r3, pc ; -> 0x000f31a0  t_do_body_propell
0006c2aa  ldr.w   ip, [r3]
0006c2ae  lsls    r3, r2, #3
0006c2b0  adds    r3, r3, r0
0006c2b2  str.w   ip, [r3, #4]
0006c2b6  ldr.w   r3, [r0, #0xa4]
0006c2ba  adds    r3, #1
0006c2bc  str.w   r1, [r0, r3, lsl #3]
0006c2c0  mov     r0, r1
0006c2c2  b       #0x6c278
0006c2c4  strb    r0, [r1, #0x12]
0006c2c6  movs    r0, r1
0006c2c8  ldr     r4, [r6, #0x6c]
0006c2ca  movs    r0, r1
