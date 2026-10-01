========================================================================
is_he_attacking  0x0006c6b0  44 bytes   mkdrone.c
========================================================================

0006c6b0  push    {r4, r7, lr}
0006c6b2  add     r7, sp, #4
0006c6b4  mov     r4, r0
0006c6b6  bl      #0x54e38 ; -> get_his_action
0006c6ba  ldr     r3, [r4, #0x20]
0006c6bc  bic     r3, r3, #0xff
0006c6c0  cmp.w   r3, #0x200
0006c6c4  ite     ne
0006c6c6  movne   r2, #0
0006c6c8  moveq   r2, #1
0006c6ca  str     r3, [r4, #0x20]
0006c6cc  cmp.w   r3, #0x100
0006c6d0  ite     ne
0006c6d2  movne   r3, r2
0006c6d4  orreq   r3, r2, #1
0006c6d8  str     r3, [r4, #0x5c]
0006c6da  pop     {r4, r7, pc}
