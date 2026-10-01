========================================================================
q_will_he_reach_me  0x0006e9c4  36 bytes   mkdrone.c
========================================================================

0006e9c4  push    {r4, r5, r6, r7, lr}
0006e9c6  add     r7, sp, #0xc
0006e9c8  ldr     r5, [r0]
0006e9ca  ldr     r6, [r0, #8]
0006e9cc  mov     r4, r0
0006e9ce  ldr     r3, [r5]
0006e9d0  ldr     r2, [r3]
0006e9d2  ldr     r3, [r3, #8]
0006e9d4  str     r2, [r0]
0006e9d6  str     r3, [r0, #8]
0006e9d8  ldr     r3, [r2, #0x58]
0006e9da  str     r3, [r0, #0x1c]
0006e9dc  bl      #0x595d8 ; -> strike_check_a0_test
0006e9e0  str     r6, [r4, #8]
0006e9e2  str     r5, [r4]
0006e9e4  pop     {r4, r5, r6, r7, pc}
0006e9e6  nop     
