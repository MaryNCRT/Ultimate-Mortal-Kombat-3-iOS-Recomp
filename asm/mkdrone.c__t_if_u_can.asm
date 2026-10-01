========================================================================
t_if_u_can  0x0006ec20  184 bytes   mkdrone.c
========================================================================

0006ec20  push    {r4, r5, r6, r7, lr}
0006ec22  add     r7, sp, #0xc
0006ec24  ldr.w   r3, [r0, #0xa4]
0006ec28  mov     r4, r0
0006ec2a  ldr.w   r6, [r0, #0x108]
0006ec2e  adds    r3, #1
0006ec30  ldr.w   r5, [r0, r3, lsl #3]
0006ec34  cbnz    r5, #0x6ec52
0006ec36  mov     r0, r6
0006ec38  bl      #0x595d8 ; -> strike_check_a0_test
0006ec3c  ldr     r3, [r6, #0x5c]
0006ec3e  cbnz    r3, #0x6ec58
0006ec40  ldr.w   r3, [r4, #0xa4]
0006ec44  cmp     r3, #0
0006ec46  ble     #0x6ecb4
0006ec48  subs    r3, #1
0006ec4a  mov     r0, r5
0006ec4c  str.w   r3, [r4, #0xa4]
0006ec50  b       #0x6ec56
0006ec52  mvn     r0, #2
0006ec56  pop     {r4, r5, r6, r7, pc}
0006ec58  ldr.w   r3, [r4, #0xa4]
0006ec5c  cmp     r3, #0
0006ec5e  ble     #0x6ec9c
0006ec60  subs    r3, #1
0006ec62  str.w   r3, [r4, #0xa4]
0006ec66  ldr.w   r1, [r4, #0xa4]
0006ec6a  adds    r3, r1, #1
0006ec6c  lsls    r2, r3, #3
0006ec6e  adds    r2, r2, r4
0006ec70  ldr     r0, [r2, #4]
0006ec72  adds    r2, r3, #1
0006ec74  ldr.w   r2, [r4, r2, lsl #3]
0006ec78  str.w   r2, [r4, r3, lsl #3]
0006ec7c  lsls    r3, r1, #3
0006ec7e  adds    r3, r3, r4
0006ec80  str     r0, [r3, #4]
0006ec82  ldr.w   r3, [r4, #0xa4]
0006ec86  ldr     r0, [r6, #0x44]
0006ec88  lsls    r3, r3, #3
0006ec8a  adds    r3, r3, r4
0006ec8c  str     r0, [r3, #4]
0006ec8e  ldr.w   r3, [r4, #0xa4]
0006ec92  movs    r0, #0
0006ec94  adds    r3, #1
0006ec96  str.w   r0, [r4, r3, lsl #3]
0006ec9a  b       #0x6ec56
0006ec9c  ldr     r2, [pc, #0x30]
0006ec9e  lsls    r3, r3, #3
0006eca0  adds    r3, r3, r4
0006eca2  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006eca4  ldr     r2, [r2]
0006eca6  str     r2, [r3, #4]
0006eca8  ldr.w   r3, [r4, #0xa4]
0006ecac  adds    r3, #1
0006ecae  str.w   r5, [r4, r3, lsl #3]
0006ecb2  b       #0x6ec66
0006ecb4  ldr.w   r2, [pc, #0x1c]
0006ecb8  lsls    r3, r3, #3
0006ecba  adds    r3, r3, r4
0006ecbc  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006ecbe  mov     r0, r5
0006ecc0  ldr     r2, [r2]
0006ecc2  str     r2, [r3, #4]
0006ecc4  ldr.w   r3, [r4, #0xa4]
0006ecc8  adds    r3, #1
0006ecca  str.w   r5, [r4, r3, lsl #3]
0006ecce  b       #0x6ec56
0006ecd0  ldr     r2, [pc, #0x188]
0006ecd2  movs    r0, r1
0006ecd4  ldr     r2, [pc, #0x120]
0006ecd6  movs    r0, r1
