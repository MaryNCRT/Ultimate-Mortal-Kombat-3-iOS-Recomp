========================================================================
t_caj_towards_me  0x0006e5c0  220 bytes   mkdrone.c
========================================================================

0006e5c0  push    {r4, r5, r6, r7, lr}
0006e5c2  add     r7, sp, #0xc
0006e5c4  ldr.w   r3, [r0, #0xa4]
0006e5c8  mov     r4, r0
0006e5ca  ldr.w   r5, [r0, #0x108]
0006e5ce  adds    r3, #1
0006e5d0  ldr.w   r6, [r0, r3, lsl #3]
0006e5d4  cbnz    r6, #0x6e5fe
0006e5d6  mov     r0, r5
0006e5d8  bl      #0x68dd8 ; -> get_his_y_vel
0006e5dc  ldr     r3, [r5, #0x1c]
0006e5de  cmp     r3, #0
0006e5e0  blt     #0x6e604
0006e5e2  ldr     r2, [pc, #0xa4]
0006e5e4  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006e5e6  ldr.w   r3, [r4, #0xa4]
0006e5ea  mov     r0, r6
0006e5ec  lsls    r3, r3, #3
0006e5ee  adds    r3, r3, r4
0006e5f0  str     r2, [r3, #4]
0006e5f2  ldr.w   r3, [r4, #0xa4]
0006e5f6  adds    r3, #1
0006e5f8  str.w   r6, [r4, r3, lsl #3]
0006e5fc  b       #0x6e602
0006e5fe  mvn     r0, #2
0006e602  pop     {r4, r5, r6, r7, pc}
0006e604  mov     r0, r5
0006e606  bl      #0x2f3a0 ; -> get_x_dist
0006e60a  ldr     r1, [r5, #8]
0006e60c  ldr     r3, [r1, #0x24]
0006e60e  cmp     r3, #0xd
0006e610  str     r3, [r5, #0x1c]
0006e612  beq     #0x6e620
0006e614  ldr     r3, [r5, #0x28]
0006e616  cmp     r3, #0x7f
0006e618  bgt     #0x6e622
0006e61a  ldr     r2, [pc, #0x70]
0006e61c  add     r2, pc ; -> 0x0006770d  t_d_hi_kick
0006e61e  b       #0x6e5e6
0006e620  ldr     r3, [r5, #0x28]
0006e622  cmp     r3, #0x8f
0006e624  bgt     #0x6e642
0006e626  ldr.w   r3, [r4, #0xa4]
0006e62a  ldr     r2, [pc, #0x64]
0006e62c  movs    r0, #0
0006e62e  lsls    r3, r3, #3
0006e630  adds    r3, r3, r4
0006e632  add     r2, pc ; -> 0x000675b1  t_d_jump_up_kick
0006e634  str     r2, [r3, #4]
0006e636  ldr.w   r3, [r4, #0xa4]
0006e63a  adds    r3, #1
0006e63c  str.w   r0, [r4, r3, lsl #3]
0006e640  b       #0x6e602
0006e642  ldr.w   r2, [pc, #0x50]
0006e646  ldr     r3, [r1, #0x24]
0006e648  add     r2, pc ; -> 0x00171ed0  ochar_towards_counters
0006e64a  ldr.w   r0, [r2, r3, lsl #2]
0006e64e  str     r0, [r5, #0x1c]
0006e650  cbnz    r0, #0x6e66e
0006e652  ldr.w   r3, [r4, #0xa4]
0006e656  ldr.w   r2, [pc, #0x40]
0006e65a  lsls    r3, r3, #3
0006e65c  adds    r3, r3, r4
0006e65e  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006e660  str     r2, [r3, #4]
0006e662  ldr.w   r3, [r4, #0xa4]
0006e666  adds    r3, #1
0006e668  str.w   r0, [r4, r3, lsl #3]
0006e66c  b       #0x6e602
0006e66e  ldr.w   r3, [r4, #0xa4]
0006e672  lsls    r3, r3, #3
0006e674  adds    r3, r3, r4
0006e676  str     r0, [r3, #4]
0006e678  ldr.w   r3, [r4, #0xa4]
0006e67c  movs    r0, #0
0006e67e  adds    r3, #1
0006e680  str.w   r0, [r4, r3, lsl #3]
0006e684  b       #0x6e602
0006e686  nop     
0006e688  blt     #0x6e5c6
