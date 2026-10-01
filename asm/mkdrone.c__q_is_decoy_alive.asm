========================================================================
q_is_decoy_alive  0x0006fe1c  40 bytes   mkdrone.c
========================================================================

0006fe1c  push    {r4, r7, lr}
0006fe1e  add     r7, sp, #4
0006fe20  ldr     r3, [r0]
0006fe22  mov     r4, r0
0006fe24  ldr     r0, [r3, #8]
0006fe26  rsb.w   r0, r0, #0x200
0006fe2a  adds    r0, #5
0006fe2c  bl      #0x575e8 ; -> CountThreads
0006fe30  cbnz    r0, #0x6fe3a
0006fe32  mov     r0, r4
0006fe34  bl      #0x67514 ; -> vq_no
0006fe38  pop     {r4, r7, pc}
0006fe3a  mov     r0, r4
0006fe3c  bl      #0x6751c ; -> vq_yes
0006fe40  b       #0x6fe38
0006fe42  nop     
