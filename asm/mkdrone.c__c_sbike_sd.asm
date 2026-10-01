========================================================================
c_sbike_sd  0x0006d9a8  136 bytes   mkdrone.c
========================================================================

0006d9a8  push    {r4, r5, r7, lr}
0006d9aa  add     r7, sp, #8
0006d9ac  ldr.w   r3, [r0, #0xa4]
0006d9b0  mov     r4, r0
0006d9b2  ldr.w   r5, [r0, #0x108]
0006d9b6  adds    r3, #1
0006d9b8  ldr.w   r0, [r0, r3, lsl #3]
0006d9bc  cbnz    r0, #0x6d9e6
0006d9be  movw    r2, #0x1082
0006d9c2  str.w   r2, [r4, r3, lsl #3]
0006d9c6  ldr.w   r3, [r4, #0xa4]
0006d9ca  ldr     r2, [pc, #0x58]
0006d9cc  adds    r3, #1
0006d9ce  str.w   r3, [r4, #0xa4]
0006d9d2  lsls    r3, r3, #3
0006d9d4  adds    r3, r3, r4
0006d9d6  add     r2, pc ; -> 0x0006ca09  t_nr_attack_sd
0006d9d8  str     r2, [r3, #4]
0006d9da  ldr.w   r3, [r4, #0xa4]
0006d9de  adds    r3, #1
0006d9e0  str.w   r0, [r4, r3, lsl #3]
0006d9e4  pop     {r4, r5, r7, pc}
0006d9e6  movw    r3, #0x1082
0006d9ea  cmp     r0, r3
0006d9ec  it      ne
0006d9ee  mvnne   r0, #2
0006d9f2  bne     #0x6d9e4
0006d9f4  mov     r0, r5
0006d9f6  bl      #0x2f3a0 ; -> get_x_dist
0006d9fa  ldr     r0, [r5, #0x28]
0006d9fc  cmp     r0, #0xd0
0006d9fe  bgt     #0x6da1e
0006da00  ldr.w   r2, [pc, #0x24]
0006da04  add     r2, pc ; -> 0x00068745  t_d_fflip_kick_jump
0006da06  ldr.w   r3, [r4, #0xa4]
0006da0a  movs    r0, #0
0006da0c  lsls    r3, r3, #3
0006da0e  adds    r3, r3, r4
0006da10  str     r2, [r3, #4]
0006da12  ldr.w   r3, [r4, #0xa4]
0006da16  adds    r3, #1
0006da18  str.w   r0, [r4, r3, lsl #3]
0006da1c  b       #0x6d9e4
0006da1e  ldr     r2, [pc, #0xc]
0006da20  add     r2, pc ; -> 0x00067f91  t_d_zap
0006da22  b       #0x6da06
0006da24  bl      #0x9da26
0006da28  add     r5, sp, #0xf4
