========================================================================
t_block2  0x00041b78  116 bytes   mkreact.c
========================================================================

00041b78  ldr.w   r1, [r0, #0xa4]
00041b7c  ldr.w   r2, [r0, #0x108]
00041b80  adds    r3, r1, #1
00041b82  ldr.w   r3, [r0, r3, lsl #3]
00041b86  cbnz    r3, #0x41bbc
00041b88  str     r3, [r2, #0x30]
00041b8a  str     r3, [r2, #0x34]
00041b8c  ldr.w   r2, [r0, #0xa4]
00041b90  movw    r1, #0x1322
00041b94  adds    r2, #1
00041b96  str.w   r1, [r0, r2, lsl #3]
00041b9a  ldr.w   r2, [r0, #0xa4]
00041b9e  ldr     r1, [pc, #0x44]
00041ba0  adds    r2, #1
00041ba2  str.w   r2, [r0, #0xa4]
00041ba6  lsls    r2, r2, #3
00041ba8  adds    r2, r2, r0
00041baa  add     r1, pc ; -> 0x000475a1  t_blocked_start
00041bac  str     r1, [r2, #4]
00041bae  ldr.w   r2, [r0, #0xa4]
00041bb2  adds    r2, #1
00041bb4  str.w   r3, [r0, r2, lsl #3]
00041bb8  mov     r0, r3
00041bba  bx      lr
00041bbc  movw    r2, #0x1322
00041bc0  cmp     r3, r2
00041bc2  it      ne
00041bc4  mvnne   r0, #2
00041bc8  bne     #0x41bba
00041bca  ldr     r2, [pc, #0x1c]
00041bcc  lsls    r3, r1, #3
00041bce  adds    r3, r3, r0
00041bd0  add     r2, pc ; -> 0x00043699  t_block3
00041bd2  str     r2, [r3, #4]
00041bd4  ldr.w   r3, [r0, #0xa4]
00041bd8  adds    r2, r3, #1
00041bda  movs    r3, #0
00041bdc  str.w   r3, [r0, r2, lsl #3]
00041be0  mov     r0, r3
00041be2  b       #0x41bba
00041be4  ldr     r3, [r6, r7]
00041be6  movs    r0, r0
00041be8  subs    r5, r0, r3
00041bea  movs    r0, r0
