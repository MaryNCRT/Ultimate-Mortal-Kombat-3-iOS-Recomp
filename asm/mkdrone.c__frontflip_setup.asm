========================================================================
frontflip_setup  0x00070cf8  56 bytes   mkdrone.c
========================================================================

00070cf8  push    {r4, r5, r6, r7, lr}
00070cfa  add     r7, sp, #0xc
00070cfc  mov     r4, r0
00070cfe  mov.w   r3, #0x40000
00070d02  movs    r6, #0x1a
00070d04  str     r3, [r0, #0x48]
00070d06  str     r6, [r0, #0x1c]
00070d08  add.w   r3, r3, #0x30000
00070d0c  movs    r5, #0x1b
00070d0e  str     r3, [r0, #0x34]
00070d10  str     r5, [r0, #0x20]
00070d12  bl      #0x5517c ; -> is_he_right
00070d16  ldr     r3, [r4, #0x5c]
00070d18  cbnz    r3, #0x70d2e
00070d1a  ldr     r3, [r4, #0x48]
00070d1c  str     r6, [r4, #0x20]
00070d1e  str     r5, [r4, #0x1c]
00070d20  rsb.w   r3, r3, #0
00070d24  str     r3, [r4, #0x48]
00070d26  ldr     r3, [r4, #0x34]
00070d28  rsb.w   r3, r3, #0
00070d2c  str     r3, [r4, #0x34]
00070d2e  pop     {r4, r5, r6, r7, pc}
