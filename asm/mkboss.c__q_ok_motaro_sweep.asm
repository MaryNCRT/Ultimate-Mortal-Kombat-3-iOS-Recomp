========================================================================
q_ok_motaro_sweep  0x000a8e88  36 bytes   mkboss.c
========================================================================

000a8e88  push    {r4, r7, lr}
000a8e8a  add     r7, sp, #4
000a8e8c  mov     r4, r0
000a8e8e  bl      #0x2f3a0 ; -> get_x_dist
000a8e92  ldr     r3, [r4, #0x28]
000a8e94  cmp     r3, #0xd0
000a8e96  bgt     #0xa8e9c
000a8e98  cmp     r3, #0x7f
000a8e9a  bgt     #0xa8ea4
000a8e9c  mov     r0, r4
000a8e9e  bl      #0xa85d4 ; -> q_no
000a8ea2  pop     {r4, r7, pc}
000a8ea4  mov     r0, r4
000a8ea6  bl      #0x55060 ; -> is_he_airborn
000a8eaa  b       #0xa8e9c
