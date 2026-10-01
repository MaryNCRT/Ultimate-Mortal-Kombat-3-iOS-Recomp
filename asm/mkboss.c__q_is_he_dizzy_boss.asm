========================================================================
q_is_he_dizzy_boss  0x000aa02c  36 bytes   mkboss.c
========================================================================

000aa02c  push    {r4, r7, lr}
000aa02e  add     r7, sp, #4
000aa030  mov     r4, r0
000aa032  bl      #0x54e38 ; -> get_his_action
000aa036  ldr     r3, [r4, #0x20]
000aa038  cmp.w   r3, #0x620
000aa03c  beq     #0xaa046
000aa03e  mov     r0, r4
000aa040  bl      #0xa85d4 ; -> q_no
000aa044  pop     {r4, r7, pc}
000aa046  mov     r0, r4
000aa048  bl      #0xa85cc ; -> q_yes
000aa04c  b       #0xaa044
000aa04e  nop     
