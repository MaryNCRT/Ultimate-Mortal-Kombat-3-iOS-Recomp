========================================================================
t_drfp2  0x00071b84  100 bytes   mkdrone.c
========================================================================

00071b84  push    {r4, r5, r6, r7, lr}
00071b86  add     r7, sp, #0xc
00071b88  ldr.w   r3, [r0, #0xa4]
00071b8c  mov     r4, r0
00071b8e  ldr.w   r5, [r0, #0x108]
00071b92  adds    r3, #1
00071b94  ldr.w   r6, [r0, r3, lsl #3]
00071b98  cbnz    r6, #0x71bdc
00071b9a  ldr.w   r3, [r0, #0xf8]
00071b9e  lsls    r3, r3, #2
00071ba0  adds    r3, r3, r0
00071ba2  mov     r0, r5
00071ba4  ldr.w   r3, [r3, #0xa4]
00071ba8  str     r3, [r5, #0x40]
00071baa  bl      #0x55474 ; -> find_ani_part2
00071bae  mov     r0, r5
00071bb0  bl      #0x55450 ; -> find_part2
00071bb4  mov     r0, r5
00071bb6  bl      #0x55450 ; -> find_part2
00071bba  mov     r0, r5
00071bbc  bl      #0x55450 ; -> find_part2
00071bc0  ldr.w   r3, [r4, #0xa4]
00071bc4  ldr     r2, [pc, #0x1c]
00071bc6  mov     r0, r6
00071bc8  lsls    r3, r3, #3
00071bca  adds    r3, r3, r4
00071bcc  add     r2, pc ; -> 0x000688a1  t_drfp4
00071bce  str     r2, [r3, #4]
00071bd0  ldr.w   r3, [r4, #0xa4]
00071bd4  adds    r3, #1
00071bd6  str.w   r6, [r4, r3, lsl #3]
00071bda  pop     {r4, r5, r6, r7, pc}
00071bdc  mvn     r0, #2
00071be0  b       #0x71bda
00071be2  nop     
00071be4  ldr     r1, [r2, #0x4c]
