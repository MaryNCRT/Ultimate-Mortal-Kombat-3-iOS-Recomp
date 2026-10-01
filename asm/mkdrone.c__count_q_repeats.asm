========================================================================
count_q_repeats  0x0006c8e0  56 bytes   mkdrone.c
========================================================================

0006c8e0  push    {r4, r5, r7, lr}
0006c8e2  add     r7, sp, #8
0006c8e4  mov     r4, r0
0006c8e6  ldr     r5, [r0, #0x24]
0006c8e8  bl      #0x41ac0 ; -> get_my_hitq
0006c8ec  movs    r3, #0
0006c8ee  mov     r0, r4
0006c8f0  str     r3, [r4, #0x28]
0006c8f2  bl      #0x6c24c ; -> scan_1_entry
0006c8f6  mov     r0, r4
0006c8f8  bl      #0x6c24c ; -> scan_1_entry
0006c8fc  mov     r0, r4
0006c8fe  bl      #0x6c24c ; -> scan_1_entry
0006c902  mov     r0, r4
0006c904  bl      #0x6c24c ; -> scan_1_entry
0006c908  mov     r0, r4
0006c90a  bl      #0x6c24c ; -> scan_1_entry
0006c90e  mov     r0, r4
0006c910  bl      #0x6c24c ; -> scan_1_entry
0006c914  str     r5, [r4, #0x24]
0006c916  pop     {r4, r5, r7, pc}
