========================================================================
q_willy_uppercut  0x0006ef04  32 bytes   mkdrone.c
========================================================================

0006ef04  push    {r4, r7, lr}
0006ef06  add     r7, sp, #4
0006ef08  mov     r4, r0
0006ef0a  bl      #0x57828 ; -> get_his_dog
0006ef0e  ldr     r3, [r4, #0x1c]
0006ef10  cmp     r3, #0x40
0006ef12  ble     #0x6ef1c
0006ef14  mov     r0, r4
0006ef16  bl      #0x67514 ; -> vq_no
0006ef1a  pop     {r4, r7, pc}
0006ef1c  mov     r0, r4
0006ef1e  bl      #0x6751c ; -> vq_yes
0006ef22  b       #0x6ef1a
