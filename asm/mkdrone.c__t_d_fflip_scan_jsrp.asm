========================================================================
t_d_fflip_scan_jsrp  0x00070e4c  84 bytes   mkdrone.c
========================================================================

00070e4c  push    {r4, r5, r7, lr}
00070e4e  add     r7, sp, #8
00070e50  mov     r4, r0
00070e52  ldr.w   r3, [r4, #0xa4]
00070e56  ldr.w   r0, [r0, #0x108]
00070e5a  adds    r3, #1
00070e5c  ldr.w   r5, [r4, r3, lsl #3]
00070e60  cbnz    r5, #0x70e96
00070e62  ldr.w   r1, [r4, #0xf8]
00070e66  ldr     r2, [r0, #0x34]
00070e68  lsls    r3, r1, #2
00070e6a  adds    r3, r3, r4
00070e6c  str.w   r2, [r3, #0xa8]
00070e70  adds    r3, r1, #1
00070e72  str.w   r3, [r4, #0xf8]
00070e76  bl      #0x70cf8 ; -> frontflip_setup
00070e7a  ldr.w   r3, [r4, #0xa4]
00070e7e  ldr     r2, [pc, #0x1c]
00070e80  mov     r0, r5
00070e82  lsls    r3, r3, #3
00070e84  adds    r3, r3, r4
00070e86  add     r2, pc ; -> 0x000682e1  t_dflip3
00070e88  str     r2, [r3, #4]
00070e8a  ldr.w   r3, [r4, #0xa4]
00070e8e  adds    r3, #1
00070e90  str.w   r5, [r4, r3, lsl #3]
00070e94  pop     {r4, r5, r7, pc}
00070e96  mvn     r0, #2
00070e9a  b       #0x70e94
00070e9c  strb    r7, [r2, #0x11]
