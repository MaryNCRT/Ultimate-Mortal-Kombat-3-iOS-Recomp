========================================================================
t_sg_delayed_quake  0x0006e460  160 bytes   mkdrone.c
========================================================================

0006e460  push    {r4, r5, r7, lr}
0006e462  add     r7, sp, #8
0006e464  ldr.w   r3, [r0, #0xa4]
0006e468  mov     r4, r0
0006e46a  ldr.w   r5, [r0, #0x108]
0006e46e  adds    r3, #1
0006e470  ldr.w   r0, [r0, r3, lsl #3]
0006e474  cbnz    r0, #0x6e4ae
0006e476  movs    r3, #0x40
0006e478  str     r3, [r5, #0x44]
0006e47a  ldr     r3, [pc, #0x74]
0006e47c  movw    r2, #0xcb6
0006e480  add     r3, pc ; -> 0x00069925  q_jax_smash
0006e482  str     r3, [r5, #0x48]
0006e484  ldr.w   r3, [r4, #0xa4]
0006e488  adds    r3, #1
0006e48a  str.w   r2, [r4, r3, lsl #3]
0006e48e  ldr.w   r3, [r4, #0xa4]
0006e492  ldr     r2, [pc, #0x60]
0006e494  adds    r3, #1
0006e496  str.w   r3, [r4, #0xa4]
0006e49a  lsls    r3, r3, #3
0006e49c  adds    r3, r3, r4
0006e49e  add     r2, pc ; -> 0x000726e9  t_retreat_wait_yes
0006e4a0  str     r2, [r3, #4]
0006e4a2  ldr.w   r3, [r4, #0xa4]
0006e4a6  adds    r3, #1
0006e4a8  str.w   r0, [r4, r3, lsl #3]
0006e4ac  pop     {r4, r5, r7, pc}
0006e4ae  movw    r3, #0xcb6
0006e4b2  cmp     r0, r3
0006e4b4  it      ne
0006e4b6  mvnne   r0, #2
0006e4ba  bne     #0x6e4ac
0006e4bc  mov     r0, r5
0006e4be  bl      #0x2f3a0 ; -> get_x_dist
0006e4c2  ldr     r3, [r5, #0x28]
0006e4c4  cmp     r3, #0xbf
0006e4c6  ble     #0x6e4ea
0006e4c8  movs    r3, #0x14
0006e4ca  str     r3, [r5, #0x1c]
0006e4cc  ldr     r3, [pc, #0x28]
0006e4ce  add     r3, pc ; -> 0x000f31a0  t_do_body_propell
0006e4d0  ldr     r2, [r3]
0006e4d2  ldr.w   r3, [r4, #0xa4]
0006e4d6  movs    r0, #0
0006e4d8  lsls    r3, r3, #3
0006e4da  adds    r3, r3, r4
0006e4dc  str     r2, [r3, #4]
0006e4de  ldr.w   r3, [r4, #0xa4]
0006e4e2  adds    r3, #1
0006e4e4  str.w   r0, [r4, r3, lsl #3]
0006e4e8  b       #0x6e4ac
0006e4ea  ldr     r2, [pc, #0x10]
0006e4ec  add     r2, pc ; -> 0x0007113d  t_sq_quake_abort
0006e4ee  b       #0x6e4d2
0006e4f0  push    {r0, r5, r7}
