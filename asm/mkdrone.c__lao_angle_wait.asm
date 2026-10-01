========================================================================
lao_angle_wait  0x0006d698  48 bytes   mkdrone.c
========================================================================

0006d698  push    {r4, r7, lr}
0006d69a  add     r7, sp, #4
0006d69c  mov     r4, r0
0006d69e  bl      #0x54e38 ; -> get_his_action
0006d6a2  ldr     r3, [r4, #0x20]
0006d6a4  cmp.w   r3, #0x20c
0006d6a8  beq     #0x6d6b2
0006d6aa  mov     r0, r4
0006d6ac  bl      #0x6751c ; -> vq_yes
0006d6b0  pop     {r4, r7, pc}
0006d6b2  mov     r0, r4
0006d6b4  bl      #0x2f3a0 ; -> get_x_dist
0006d6b8  ldr     r3, [r4, #0x28]
0006d6ba  cmp     r3, #0x6f
0006d6bc  ble     #0x6d6aa
0006d6be  mov     r0, r4
0006d6c0  bl      #0x67514 ; -> vq_no
0006d6c4  b       #0x6d6b0
0006d6c6  nop     
