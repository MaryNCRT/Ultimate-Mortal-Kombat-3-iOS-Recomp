========================================================================
is_flyk_close  0x0006d66c  44 bytes   mkdrone.c
========================================================================

0006d66c  push    {r4, r7, lr}
0006d66e  add     r7, sp, #4
0006d670  mov     r4, r0
0006d672  bl      #0x6c5ec ; -> is_he_body_propell
0006d676  ldr     r3, [r4, #0x5c]
0006d678  cbz     r3, #0x6d686
0006d67a  mov     r0, r4
0006d67c  bl      #0x2f3a0 ; -> get_x_dist
0006d680  ldr     r3, [r4, #0x28]
0006d682  cmp     r3, #0x7f
0006d684  bgt     #0x6d68e
0006d686  mov     r0, r4
0006d688  bl      #0x6751c ; -> vq_yes
0006d68c  pop     {r4, r7, pc}
0006d68e  mov     r0, r4
0006d690  bl      #0x67514 ; -> vq_no
0006d694  b       #0x6d68c
0006d696  nop     
