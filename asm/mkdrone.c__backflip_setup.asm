========================================================================
backflip_setup  0x00070c6c  56 bytes   mkdrone.c
========================================================================

00070c6c  push    {r4, r5, r6, r7, lr}
00070c6e  add     r7, sp, #0xc
00070c70  mov     r4, r0
00070c72  mov.w   r3, #0x40000
00070c76  movs    r6, #0x1a
00070c78  str     r3, [r0, #0x48]
00070c7a  str     r6, [r0, #0x1c]
00070c7c  add.w   r3, r3, #0x30000
00070c80  movs    r5, #0x1b
00070c82  str     r3, [r0, #0x34]
00070c84  str     r5, [r0, #0x20]
00070c86  bl      #0x5517c ; -> is_he_right
00070c8a  ldr     r3, [r4, #0x5c]
00070c8c  cbz     r3, #0x70ca2
00070c8e  ldr     r3, [r4, #0x48]
00070c90  str     r6, [r4, #0x20]
00070c92  str     r5, [r4, #0x1c]
00070c94  rsb.w   r3, r3, #0
00070c98  str     r3, [r4, #0x48]
00070c9a  ldr     r3, [r4, #0x34]
00070c9c  rsb.w   r3, r3, #0
00070ca0  str     r3, [r4, #0x34]
00070ca2  pop     {r4, r5, r6, r7, pc}
