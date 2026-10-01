========================================================================
q_backup_zap  0x0006ef78  44 bytes   mkdrone.c
========================================================================

0006ef78  push    {r4, r7, lr}
0006ef7a  add     r7, sp, #4
0006ef7c  mov     r4, r0
0006ef7e  bl      #0x68dd8 ; -> get_his_y_vel
0006ef82  ldr     r3, [r4, #0x1c]
0006ef84  cmp     r3, #0
0006ef86  blt     #0x6ef94
0006ef88  mov     r0, r4
0006ef8a  bl      #0x57828 ; -> get_his_dog
0006ef8e  ldr     r3, [r4, #0x1c]
0006ef90  cmp     r3, #0x70
0006ef92  ble     #0x6ef9c
0006ef94  mov     r0, r4
0006ef96  bl      #0x67514 ; -> vq_no
0006ef9a  pop     {r4, r7, pc}
0006ef9c  mov     r0, r4
0006ef9e  bl      #0x6751c ; -> vq_yes
0006efa2  b       #0x6ef9a
