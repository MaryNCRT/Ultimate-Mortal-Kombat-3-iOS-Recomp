========================================================================
t_avoid_corner_trap_b  0x00041c74  204 bytes   mkreact.c
========================================================================

00041c74  push    {r4}
00041c76  ldr.w   r3, [r0, #0xa4]
00041c7a  ldr.w   r2, [r0, #0x108]
00041c7e  adds    r3, #1
00041c80  ldr.w   r4, [r0, r3, lsl #3]
00041c84  cmp     r4, #0
00041c86  bne     #0x41ce2
00041c88  ldr     r3, [r2]
00041c8a  ldr     r1, [r3, #0x44]
00041c8c  str     r1, [r2, #0x1c]
00041c8e  ldr.w   ip, [r0, #0xf8]
00041c92  lsl.w   r3, ip, #2
00041c96  adds    r3, r3, r0
00041c98  str.w   r1, [r3, #0xa8]
00041c9c  add.w   r3, ip, #1
00041ca0  str.w   r3, [r0, #0xf8]
00041ca4  ldr     r1, [r2]
00041ca6  ldr     r3, [r2, #0x1c]
00041ca8  str     r3, [r1, #0x4c]
00041caa  ldr     r3, [r2, #0x1c]
00041cac  ldr     r1, [r2]
00041cae  movw    r2, #0x13ad
00041cb2  str     r3, [r1, #0x44]
00041cb4  ldr.w   r3, [r0, #0xa4]
00041cb8  adds    r3, #1
00041cba  str.w   r2, [r0, r3, lsl #3]
00041cbe  ldr.w   r3, [r0, #0xa4]
00041cc2  ldr     r2, [pc, #0x74]
00041cc4  adds    r3, #1
00041cc6  str.w   r3, [r0, #0xa4]
00041cca  lsls    r3, r3, #3
00041ccc  adds    r3, r3, r0
00041cce  add     r2, pc ; -> 0x00047b51  t_avoid_corner_trap
00041cd0  str     r2, [r3, #4]
00041cd2  ldr.w   r3, [r0, #0xa4]
00041cd6  adds    r3, #1
00041cd8  str.w   r4, [r0, r3, lsl #3]
00041cdc  mov     r0, r4
00041cde  pop     {r4}
00041ce0  bx      lr
00041ce2  movw    r3, #0x13ad
00041ce6  cmp     r4, r3
00041ce8  it      ne
00041cea  mvnne   r0, #2
00041cee  bne     #0x41cde
00041cf0  ldr.w   r3, [r0, #0xf8]
00041cf4  subs    r3, #1
00041cf6  str.w   r3, [r0, #0xf8]
00041cfa  lsls    r3, r3, #2
00041cfc  adds    r3, r3, r0
00041cfe  ldr.w   r1, [r3, #0xa8]
00041d02  ldr     r3, [r2]
00041d04  str     r1, [r2, #0x1c]
00041d06  str     r1, [r3, #0x44]
00041d08  ldr.w   r3, [r0, #0xa4]
00041d0c  cmp     r3, #0
00041d0e  ble     #0x41d1a
00041d10  subs    r3, #1
00041d12  str.w   r3, [r0, #0xa4]
00041d16  movs    r0, #0
00041d18  b       #0x41cde
00041d1a  ldr     r2, [pc, #0x20]
00041d1c  lsls    r3, r3, #3
00041d1e  adds    r3, r3, r0
00041d20  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00041d22  mov.w   ip, #0
00041d26  ldr     r2, [r2]
00041d28  str     r2, [r3, #4]
00041d2a  ldr.w   r3, [r0, #0xa4]
00041d2e  adds    r3, #1
00041d30  str.w   ip, [r0, r3, lsl #3]
00041d34  mov     r0, ip
00041d36  b       #0x41cde
00041d38  ldrsh   r7, [r7, r1]
00041d3a  movs    r0, r0
00041d3c  adds    r4, r4, r7
00041d3e  movs    r3, r1
