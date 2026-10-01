========================================================================
is_he_body_propell  0x0006c5ec  36 bytes   mkdrone.c
========================================================================

0006c5ec  push    {r4, r7, lr}
0006c5ee  add     r7, sp, #4
0006c5f0  mov     r4, r0
0006c5f2  bl      #0x54e38 ; -> get_his_action
0006c5f6  ldr     r3, [r4, #0x20]
0006c5f8  bic     r3, r3, #0xff
0006c5fc  cmp.w   r3, #0x200
0006c600  str     r3, [r4, #0x20]
0006c602  beq     #0x6c60a
0006c604  movs    r3, #0
0006c606  str     r3, [r4, #0x5c]
0006c608  pop     {r4, r7, pc}
0006c60a  movs    r3, #1
0006c60c  str     r3, [r4, #0x5c]
0006c60e  b       #0x6c608
