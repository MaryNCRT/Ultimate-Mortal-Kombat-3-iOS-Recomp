========================================================================
t_d_get_close_2_u  0x0006e69c  140 bytes   mkdrone.c
========================================================================

0006e69c  push    {r4, r5, r6, r7, lr}
0006e69e  add     r7, sp, #0xc
0006e6a0  ldr.w   r3, [r0, #0xa4]
0006e6a4  mov     r4, r0
0006e6a6  ldr.w   r5, [r0, #0x108]
0006e6aa  adds    r3, #1
0006e6ac  ldr.w   r6, [r0, r3, lsl #3]
0006e6b0  cbnz    r6, #0x6e6de
0006e6b2  mov     r0, r5
0006e6b4  bl      #0x2f3a0 ; -> get_x_dist
0006e6b8  ldr     r3, [r5, #0x28]
0006e6ba  cmp     r3, #0xff
0006e6bc  bgt     #0x6e6ee
0006e6be  movs    r3, #0x40
0006e6c0  str     r3, [r5, #0x48]
0006e6c2  ldr.w   r3, [r4, #0xa4]
0006e6c6  ldr     r2, [pc, #0x58]
0006e6c8  movs    r0, #0
0006e6ca  lsls    r3, r3, #3
0006e6cc  adds    r3, r3, r4
0006e6ce  add     r2, pc ; -> 0x0006777d  t_d_stalk_a11_ntl
0006e6d0  str     r2, [r3, #4]
0006e6d2  ldr.w   r3, [r4, #0xa4]
0006e6d6  adds    r3, #1
0006e6d8  str.w   r0, [r4, r3, lsl #3]
0006e6dc  pop     {r4, r5, r6, r7, pc}
0006e6de  movw    r3, #0xa82
0006e6e2  cmp     r6, r3
0006e6e4  it      ne
0006e6e6  mvnne   r0, #2
0006e6ea  bne     #0x6e6dc
0006e6ec  b       #0x6e6be
0006e6ee  ldr.w   r3, [r4, #0xa4]
0006e6f2  movw    r2, #0xa82
0006e6f6  mov     r0, r6
0006e6f8  adds    r3, #1
0006e6fa  str.w   r2, [r4, r3, lsl #3]
0006e6fe  ldr.w   r3, [r4, #0xa4]
0006e702  ldr.w   r2, [pc, #0x20]
0006e706  adds    r3, #1
0006e708  str.w   r3, [r4, #0xa4]
0006e70c  lsls    r3, r3, #3
0006e70e  adds    r3, r3, r4
0006e710  add     r2, pc ; -> 0x00070de1  t_d_fflip_jsrp
0006e712  str     r2, [r3, #4]
0006e714  ldr.w   r3, [r4, #0xa4]
0006e718  adds    r3, #1
0006e71a  str.w   r6, [r4, r3, lsl #3]
0006e71e  b       #0x6e6dc
0006e720  str     r0, [sp, #0x2ac]
