========================================================================
t_d_attack_close  0x0006f774  208 bytes   mkdrone.c
========================================================================

0006f774  push    {r4, r5, r6, r7, lr}
0006f776  add     r7, sp, #0xc
0006f778  ldr.w   r2, [r0, #0xa4]
0006f77c  mov     r4, r0
0006f77e  ldr.w   r6, [r0, #0x108]
0006f782  adds    r3, r2, #1
0006f784  ldr.w   r5, [r0, r3, lsl #3]
0006f788  cbnz    r5, #0x6f7c0
0006f78a  mov     r0, r6
0006f78c  bl      #0x6f660 ; -> q_airborn_counter
0006f790  ldr     r0, [r6, #0x5c]
0006f792  cmp     r0, #0
0006f794  bne     #0x6f7e6
0006f796  ldr     r3, [pc, #0x94]
0006f798  add     r3, pc ; -> 0x000f357c  G
0006f79a  ldr     r3, [r3]
0006f79c  ldrsh.w r3, [r3, #0x44c]
0006f7a0  cmp     r3, #4
0006f7a2  str     r3, [r6, #0x1c]
0006f7a4  ble     #0x6f802
0006f7a6  ldr     r2, [pc, #0x88]
0006f7a8  ldr.w   r3, [r4, #0xa4]
0006f7ac  add     r2, pc ; -> 0x00067da5  t_attack_close_hard
0006f7ae  lsls    r3, r3, #3
0006f7b0  adds    r3, r3, r4
0006f7b2  str     r2, [r3, #4]
0006f7b4  ldr.w   r3, [r4, #0xa4]
0006f7b8  adds    r3, #1
0006f7ba  str.w   r0, [r4, r3, lsl #3]
0006f7be  pop     {r4, r5, r6, r7, pc}
0006f7c0  movw    r3, #0x3f9
0006f7c4  cmp     r5, r3
0006f7c6  it      ne
0006f7c8  mvnne   r0, #2
0006f7cc  bne     #0x6f7be
0006f7ce  ldr     r1, [pc, #0x64]
0006f7d0  lsls    r3, r2, #3
0006f7d2  adds    r3, r3, r4
0006f7d4  add     r1, pc ; -> 0x00067da5  t_attack_close_hard
0006f7d6  str     r1, [r3, #4]
0006f7d8  ldr.w   r3, [r4, #0xa4]
0006f7dc  movs    r0, #0
0006f7de  adds    r3, #1
0006f7e0  str.w   r0, [r4, r3, lsl #3]
0006f7e4  b       #0x6f7be
0006f7e6  ldr.w   r3, [r4, #0xa4]
0006f7ea  ldr     r2, [pc, #0x4c]
0006f7ec  mov     r0, r5
0006f7ee  lsls    r3, r3, #3
0006f7f0  adds    r3, r3, r4
0006f7f2  add     r2, pc ; -> 0x00070b8d  t_close_airborn
0006f7f4  str     r2, [r3, #4]
0006f7f6  ldr.w   r3, [r4, #0xa4]
0006f7fa  adds    r3, #1
0006f7fc  str.w   r5, [r4, r3, lsl #3]
0006f800  b       #0x6f7be
0006f802  ldr     r3, [pc, #0x38]
0006f804  movw    r2, #0x3f9
0006f808  add     r3, pc ; -> 0x001724c0  funcs.8198
0006f80a  str     r3, [r6, #0x68]
0006f80c  movs    r3, #6
0006f80e  str     r3, [r6, #0x64]
0006f810  ldr.w   r3, [r4, #0xa4]
0006f814  adds    r3, #1
0006f816  str.w   r2, [r4, r3, lsl #3]
0006f81a  ldr.w   r2, [pc, #0x24]
0006f81e  ldr.w   r3, [r4, #0xa4]
0006f822  add     r2, pc ; -> 0x00072e4d  t_random_do
0006f824  adds    r3, #1
0006f826  str.w   r3, [r4, #0xa4]
0006f82a  b       #0x6f7ae
0006f82c  subs    r5, #0xe0
0006f82e  movs    r0, r1
0006f830  strh    r5, [r6, #0x2e]
