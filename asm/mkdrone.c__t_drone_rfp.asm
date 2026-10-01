========================================================================
t_drone_rfp  0x00071d64  168 bytes   mkdrone.c
========================================================================

00071d64  push    {r4, r5, r6, r7, lr}
00071d66  add     r7, sp, #0xc
00071d68  ldr.w   r3, [r0, #0xa4]
00071d6c  mov     r4, r0
00071d6e  ldr.w   r5, [r0, #0x108]
00071d72  adds    r3, #1
00071d74  ldr.w   r6, [r0, r3, lsl #3]
00071d78  cmp     r6, #0
00071d7a  bne     #0x71e02
00071d7c  ldr.w   r1, [r0, #0xf8]
00071d80  ldr     r2, [r5, #0x24]
00071d82  lsls    r3, r1, #2
00071d84  adds    r3, r3, r0
00071d86  str.w   r2, [r3, #0xa8]
00071d8a  adds    r3, r1, #1
00071d8c  str.w   r3, [r0, #0xf8]
00071d90  ldr     r1, [r5, #0x28]
00071d92  lsls    r2, r3, #2
00071d94  adds    r2, r2, r0
00071d96  adds    r3, #1
00071d98  str.w   r1, [r2, #0xa8]
00071d9c  str.w   r3, [r0, #0xf8]
00071da0  ldr     r1, [r5, #0x2c]
00071da2  lsls    r2, r3, #2
00071da4  adds    r2, r2, r0
00071da6  adds    r3, #1
00071da8  str.w   r1, [r2, #0xa8]
00071dac  str.w   r3, [r0, #0xf8]
00071db0  ldr     r1, [r5, #0x40]
00071db2  lsls    r2, r3, #2
00071db4  adds    r2, r2, r0
00071db6  adds    r3, #1
00071db8  str.w   r1, [r2, #0xa8]
00071dbc  str.w   r3, [r0, #0xf8]
00071dc0  ldr     r2, [r5]
00071dc2  ldr     r3, [r5, #0x1c]
00071dc4  mov     r0, r5
00071dc6  str     r3, [r2, #0x60]
00071dc8  ldr     r2, [r5]
00071dca  ldr     r3, [r5, #0x20]
00071dcc  str     r3, [r2, #0x1c]
00071dce  bl      #0x587c8 ; -> init_special
00071dd2  ldr.w   r3, [r4, #0xf8]
00071dd6  mov     r0, r5
00071dd8  lsls    r3, r3, #2
00071dda  adds    r3, r3, r4
00071ddc  ldr.w   r3, [r3, #0xa4]
00071de0  str     r3, [r5, #0x40]
00071de2  bl      #0x5520c ; -> get_char_ani
00071de6  ldr.w   r3, [r4, #0xa4]
00071dea  ldr     r2, [pc, #0x1c]
00071dec  mov     r0, r6
00071dee  lsls    r3, r3, #3
00071df0  adds    r3, r3, r4
00071df2  add     r2, pc ; -> 0x00071be9  t_drfp1
00071df4  str     r2, [r3, #4]
00071df6  ldr.w   r3, [r4, #0xa4]
00071dfa  adds    r3, #1
00071dfc  str.w   r6, [r4, r3, lsl #3]
00071e00  pop     {r4, r5, r6, r7, pc}
00071e02  mvn     r0, #2
00071e06  b       #0x71e00
00071e08  ldc2l   p15, c15, [r3, #0x3fc]!
