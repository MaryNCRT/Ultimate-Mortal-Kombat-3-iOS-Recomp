========================================================================
q_run_then_flipk  0x0006de48  32 bytes   mkdrone.c
========================================================================

0006de48  push    {r4, r7, lr}
0006de4a  add     r7, sp, #4
0006de4c  mov     r4, r0
0006de4e  bl      #0x2f3a0 ; -> get_x_dist
0006de52  ldr     r3, [r4, #0x28]
0006de54  cmp     r3, #0xef
0006de56  bgt     #0x6de60
0006de58  mov     r0, r4
0006de5a  bl      #0x6751c ; -> vq_yes
0006de5e  pop     {r4, r7, pc}
0006de60  mov     r0, r4
0006de62  bl      #0x67514 ; -> vq_no
0006de66  b       #0x6de5e
