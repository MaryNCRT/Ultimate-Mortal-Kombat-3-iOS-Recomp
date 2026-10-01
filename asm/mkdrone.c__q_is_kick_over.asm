========================================================================
q_is_kick_over  0x0006f1f0  48 bytes   mkdrone.c
========================================================================

0006f1f0  push    {r4, r7, lr}
0006f1f2  add     r7, sp, #4
0006f1f4  mov     r4, r0
0006f1f6  bl      #0x54e38 ; -> get_his_action
0006f1fa  ldr     r2, [r4, #0x20]
0006f1fc  movw    r3, #0x50a
0006f200  cmp     r2, r3
0006f202  beq     #0x6f20e
0006f204  mov     r0, r4
0006f206  bl      #0x55060 ; -> is_he_airborn
0006f20a  ldr     r3, [r4, #0x5c]
0006f20c  cbnz    r3, #0x6f216
0006f20e  mov     r0, r4
0006f210  bl      #0x6751c ; -> vq_yes
0006f214  pop     {r4, r7, pc}
0006f216  mov     r0, r4
0006f218  bl      #0x67514 ; -> vq_no
0006f21c  b       #0x6f214
0006f21e  nop     
