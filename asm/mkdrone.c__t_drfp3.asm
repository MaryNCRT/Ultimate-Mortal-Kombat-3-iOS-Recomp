========================================================================
t_drfp3  0x00071b28  92 bytes   mkdrone.c
========================================================================

00071b28  push    {r4, r5, r6, r7, lr}
00071b2a  add     r7, sp, #0xc
00071b2c  ldr.w   r3, [r0, #0xa4]
00071b30  mov     r4, r0
00071b32  ldr.w   r5, [r0, #0x108]
00071b36  adds    r3, #1
00071b38  ldr.w   r6, [r0, r3, lsl #3]
00071b3c  cbnz    r6, #0x71b7a
00071b3e  ldr.w   r3, [r0, #0xf8]
00071b42  lsls    r3, r3, #2
00071b44  adds    r3, r3, r0
00071b46  mov     r0, r5
00071b48  ldr.w   r3, [r3, #0xa4]
00071b4c  str     r3, [r5, #0x40]
00071b4e  bl      #0x55474 ; -> find_ani_part2
00071b52  mov     r0, r5
00071b54  bl      #0x55450 ; -> find_part2
00071b58  mov     r0, r5
00071b5a  bl      #0x55450 ; -> find_part2
00071b5e  ldr.w   r3, [r4, #0xa4]
00071b62  ldr     r2, [pc, #0x1c]
00071b64  mov     r0, r6
00071b66  lsls    r3, r3, #3
00071b68  adds    r3, r3, r4
00071b6a  add     r2, pc ; -> 0x000688a1  t_drfp4
00071b6c  str     r2, [r3, #4]
00071b6e  ldr.w   r3, [r4, #0xa4]
00071b72  adds    r3, #1
00071b74  str.w   r6, [r4, r3, lsl #3]
00071b78  pop     {r4, r5, r6, r7, pc}
00071b7a  mvn     r0, #2
00071b7e  b       #0x71b78
00071b80  ldr     r3, [r6, #0x50]
