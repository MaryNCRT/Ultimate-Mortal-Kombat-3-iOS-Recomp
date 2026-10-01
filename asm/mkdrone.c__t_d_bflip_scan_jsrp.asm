========================================================================
t_d_bflip_scan_jsrp  0x00070ca4  84 bytes   mkdrone.c
========================================================================

00070ca4  push    {r4, r5, r7, lr}
00070ca6  add     r7, sp, #8
00070ca8  mov     r4, r0
00070caa  ldr.w   r3, [r4, #0xa4]
00070cae  ldr.w   r0, [r0, #0x108]
00070cb2  adds    r3, #1
00070cb4  ldr.w   r5, [r4, r3, lsl #3]
00070cb8  cbnz    r5, #0x70cee
00070cba  ldr.w   r1, [r4, #0xf8]
00070cbe  ldr     r2, [r0, #0x34]
00070cc0  lsls    r3, r1, #2
00070cc2  adds    r3, r3, r4
00070cc4  str.w   r2, [r3, #0xa8]
00070cc8  adds    r3, r1, #1
00070cca  str.w   r3, [r4, #0xf8]
00070cce  bl      #0x70c6c ; -> backflip_setup
00070cd2  ldr.w   r3, [r4, #0xa4]
00070cd6  ldr     r2, [pc, #0x1c]
00070cd8  mov     r0, r5
00070cda  lsls    r3, r3, #3
00070cdc  adds    r3, r3, r4
00070cde  add     r2, pc ; -> 0x000682e1  t_dflip3
00070ce0  str     r2, [r3, #4]
00070ce2  ldr.w   r3, [r4, #0xa4]
00070ce6  adds    r3, #1
00070ce8  str.w   r5, [r4, r3, lsl #3]
00070cec  pop     {r4, r5, r7, pc}
00070cee  mvn     r0, #2
00070cf2  b       #0x70cec
00070cf4  strb    r7, [r7, #0x17]
