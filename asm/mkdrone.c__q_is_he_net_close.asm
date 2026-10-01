========================================================================
q_is_he_net_close  0x00069a34  44 bytes   mkdrone.c
========================================================================

00069a34  push    {r4, r7, lr}
00069a36  add     r7, sp, #4
00069a38  mov     r4, r0
00069a3a  bl      #0x68dd8 ; -> get_his_y_vel
00069a3e  ldr     r3, [r4, #0x1c]
00069a40  cmp     r3, #0
00069a42  itt     lt
00069a44  rsblt   r3, r3, #0
00069a46  strlt   r3, [r4, #0x1c]
00069a48  cmp.w   r3, #0x10000
00069a4c  ble     #0x69a56
00069a4e  mov     r0, r4
00069a50  bl      #0x67514 ; -> vq_no
00069a54  pop     {r4, r7, pc}
00069a56  mov     r0, r4
00069a58  bl      #0x6751c ; -> vq_yes
00069a5c  b       #0x69a54
00069a5e  nop     
