========================================================================
is_propell_close  0x0006e728  44 bytes   mkdrone.c
========================================================================

0006e728  push    {r4, r7, lr}
0006e72a  add     r7, sp, #4
0006e72c  mov     r4, r0
0006e72e  bl      #0x6c5ec ; -> is_he_body_propell
0006e732  ldr     r3, [r4, #0x5c]
0006e734  cbz     r3, #0x6e742
0006e736  mov     r0, r4
0006e738  bl      #0x2f3a0 ; -> get_x_dist
0006e73c  ldr     r3, [r4, #0x28]
0006e73e  cmp     r3, #0x6f
0006e740  bgt     #0x6e74a
0006e742  mov     r0, r4
0006e744  bl      #0x6751c ; -> vq_yes
0006e748  pop     {r4, r7, pc}
0006e74a  mov     r0, r4
0006e74c  bl      #0x67514 ; -> vq_no
0006e750  b       #0x6e748
0006e752  nop     
