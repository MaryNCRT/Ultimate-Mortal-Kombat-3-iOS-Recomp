========================================================================
t_attack_very_far_hard  0x00067c84  132 bytes   mkdrone.c
========================================================================

00067c84  ldr.w   r1, [r0, #0xa4]
00067c88  ldr.w   ip, [r0, #0x108]
00067c8c  adds    r3, r1, #1
00067c8e  ldr.w   r2, [r0, r3, lsl #3]
00067c92  cbnz    r2, #0x67cd4
00067c94  ldr     r3, [pc, #0x64]
00067c96  mov.w   r1, #0x3c0
00067c9a  add     r3, pc ; -> 0x001724ec  funcs.8113
00067c9c  str.w   r3, [ip, #0x68]
00067ca0  movs    r3, #3
00067ca2  str.w   r3, [ip, #0x64]
00067ca6  ldr.w   r3, [r0, #0xa4]
00067caa  adds    r3, #1
00067cac  str.w   r1, [r0, r3, lsl #3]
00067cb0  ldr.w   r3, [r0, #0xa4]
00067cb4  ldr.w   r1, [pc, #0x48]
00067cb8  adds    r3, #1
00067cba  str.w   r3, [r0, #0xa4]
00067cbe  lsls    r3, r3, #3
00067cc0  adds    r3, r3, r0
00067cc2  add     r1, pc ; -> 0x00072e4d  t_random_do
00067cc4  str     r1, [r3, #4]
00067cc6  ldr.w   r3, [r0, #0xa4]
00067cca  adds    r3, #1
00067ccc  str.w   r2, [r0, r3, lsl #3]
00067cd0  mov     r0, r2
00067cd2  bx      lr
00067cd4  cmp.w   r2, #0x3c0
00067cd8  it      ne
00067cda  mvnne   r0, #2
00067cde  bne     #0x67cd2
00067ce0  ldr     r2, [pc, #0x20]
00067ce2  lsls    r3, r1, #3
00067ce4  adds    r3, r3, r0
00067ce6  add     r2, pc ; -> 0x00067d09  t_very_far_airborn
00067ce8  str     r2, [r3, #4]
00067cea  ldr.w   r3, [r0, #0xa4]
00067cee  movs    r2, #0
00067cf0  adds    r3, #1
00067cf2  str.w   r2, [r0, r3, lsl #3]
00067cf6  mov     r0, r2
00067cf8  b       #0x67cd2
00067cfa  nop     
00067cfc  add     r0, sp, #0x138
00067cfe  movs    r0, r2
00067d00  cbz     r7, #0x67d24
00067d02  movs    r0, r0
00067d04  movs    r7, r3
00067d06  movs    r0, r0
