========================================================================
q_drone_zone  0x000714a4  52 bytes   mkdrone.c
========================================================================

000714a4  push    {r4, r7, lr}
000714a6  add     r7, sp, #4
000714a8  mov     r4, r0
000714aa  bl      #0x71328 ; -> d_either_edge_a5
000714ae  ldr     r3, [r4, #0x30]
000714b0  cmp     r3, #0x4f
000714b2  ble     #0x714c6
000714b4  mov     r0, r4
000714b6  bl      #0x2f3a0 ; -> get_x_dist
000714ba  ldr     r3, [r4, #0x28]
000714bc  cmp     r3, #0xcf
000714be  ble     #0x714c6
000714c0  cmp.w   r3, #0x100
000714c4  ble     #0x714ce
000714c6  mov     r0, r4
000714c8  bl      #0x6751c ; -> vq_yes
000714cc  pop     {r4, r7, pc}
000714ce  mov     r0, r4
000714d0  bl      #0x67514 ; -> vq_no
000714d4  b       #0x714cc
000714d6  nop     
