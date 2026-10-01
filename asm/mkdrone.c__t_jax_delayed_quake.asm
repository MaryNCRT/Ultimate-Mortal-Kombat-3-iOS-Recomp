========================================================================
t_jax_delayed_quake  0x0006e384  156 bytes   mkdrone.c
========================================================================

0006e384  push    {r4, r5, r7, lr}
0006e386  add     r7, sp, #8
0006e388  ldr.w   r3, [r0, #0xa4]
0006e38c  mov     r4, r0
0006e38e  ldr.w   r5, [r0, #0x108]
0006e392  adds    r3, #1
0006e394  ldr.w   r0, [r0, r3, lsl #3]
0006e398  cbnz    r0, #0x6e3d2
0006e39a  movs    r3, #0x40
0006e39c  str     r3, [r5, #0x44]
0006e39e  ldr     r3, [pc, #0x70]
0006e3a0  movw    r2, #0xd38
0006e3a4  add     r3, pc ; -> 0x00069925  q_jax_smash
0006e3a6  str     r3, [r5, #0x48]
0006e3a8  ldr.w   r3, [r4, #0xa4]
0006e3ac  adds    r3, #1
0006e3ae  str.w   r2, [r4, r3, lsl #3]
0006e3b2  ldr.w   r3, [r4, #0xa4]
0006e3b6  ldr     r2, [pc, #0x5c]
0006e3b8  adds    r3, #1
0006e3ba  str.w   r3, [r4, #0xa4]
0006e3be  lsls    r3, r3, #3
0006e3c0  adds    r3, r3, r4
0006e3c2  add     r2, pc ; -> 0x000726e9  t_retreat_wait_yes
0006e3c4  str     r2, [r3, #4]
0006e3c6  ldr.w   r3, [r4, #0xa4]
0006e3ca  adds    r3, #1
0006e3cc  str.w   r0, [r4, r3, lsl #3]
0006e3d0  pop     {r4, r5, r7, pc}
0006e3d2  movw    r3, #0xd38
0006e3d6  cmp     r0, r3
0006e3d8  it      ne
0006e3da  mvnne   r0, #2
0006e3de  bne     #0x6e3d0
0006e3e0  mov     r0, r5
0006e3e2  bl      #0x2f3a0 ; -> get_x_dist
0006e3e6  ldr     r0, [r5, #0x28]
0006e3e8  cmp     r0, #0xaf
0006e3ea  ble     #0x6e408
0006e3ec  ldr     r2, [pc, #0x28]
0006e3ee  add     r2, pc ; -> 0x00069dc9  t_d_quake
0006e3f0  ldr.w   r3, [r4, #0xa4]
0006e3f4  movs    r0, #0
0006e3f6  lsls    r3, r3, #3
0006e3f8  adds    r3, r3, r4
0006e3fa  str     r2, [r3, #4]
0006e3fc  ldr.w   r3, [r4, #0xa4]
0006e400  adds    r3, #1
0006e402  str.w   r0, [r4, r3, lsl #3]
0006e406  b       #0x6e3d0
0006e408  ldr     r3, [pc, #0x10]
0006e40a  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006e40c  ldr     r2, [r3]
0006e40e  b       #0x6e3f0
0006e410  push    {r0, r2, r3, r4, r5, r6, lr}
