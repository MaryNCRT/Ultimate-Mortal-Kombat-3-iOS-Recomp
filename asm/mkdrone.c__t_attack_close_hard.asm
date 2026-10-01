========================================================================
t_attack_close_hard  0x00067da4  132 bytes   mkdrone.c
========================================================================

00067da4  ldr.w   r1, [r0, #0xa4]
00067da8  ldr.w   ip, [r0, #0x108]
00067dac  adds    r3, r1, #1
00067dae  ldr.w   r2, [r0, r3, lsl #3]
00067db2  cbnz    r2, #0x67df4
00067db4  ldr     r3, [pc, #0x64]
00067db6  movw    r1, #0x403
00067dba  add     r3, pc ; -> 0x001724ac  funcs.8223
00067dbc  str.w   r3, [ip, #0x68]
00067dc0  movs    r3, #5
00067dc2  str.w   r3, [ip, #0x64]
00067dc6  ldr.w   r3, [r0, #0xa4]
00067dca  adds    r3, #1
00067dcc  str.w   r1, [r0, r3, lsl #3]
00067dd0  ldr.w   r3, [r0, #0xa4]
00067dd4  ldr.w   r1, [pc, #0x48]
00067dd8  adds    r3, #1
00067dda  str.w   r3, [r0, #0xa4]
00067dde  lsls    r3, r3, #3
00067de0  adds    r3, r3, r0
00067de2  add     r1, pc ; -> 0x00072e4d  t_random_do
00067de4  str     r1, [r3, #4]
00067de6  ldr.w   r3, [r0, #0xa4]
00067dea  adds    r3, #1
00067dec  str.w   r2, [r0, r3, lsl #3]
00067df0  mov     r0, r2
00067df2  bx      lr
00067df4  movw    r3, #0x403
00067df8  cmp     r2, r3
00067dfa  it      ne
00067dfc  mvnne   r0, #2
00067e00  bne     #0x67df2
00067e02  ldr     r2, [pc, #0x20]
00067e04  lsls    r3, r1, #3
00067e06  adds    r3, r3, r0
00067e08  add     r2, pc ; -> 0x00070b8d  t_close_airborn
00067e0a  str     r2, [r3, #4]
00067e0c  ldr.w   r3, [r0, #0xa4]
00067e10  movs    r2, #0
00067e12  adds    r3, #1
00067e14  str.w   r2, [r0, r3, lsl #3]
00067e18  mov     r0, r2
00067e1a  b       #0x67df2
00067e1c  adr     r6, #0x3b8
00067e1e  movs    r0, r2
00067e20  add     sp, #0x19c
00067e22  movs    r0, r0
00067e24  ldrh    r1, [r0, #0x2c]
00067e26  movs    r0, r0
