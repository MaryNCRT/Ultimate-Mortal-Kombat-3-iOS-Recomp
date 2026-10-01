========================================================================
t_motaro_hop  0x000aa130  224 bytes   mkboss.c
========================================================================

000aa130  push    {r4, r5, r6, r7, lr}
000aa132  add     r7, sp, #0xc
000aa134  ldr.w   r3, [r0, #0xa4]
000aa138  mov     r4, r0
000aa13a  ldr.w   r5, [r0, #0x108]
000aa13e  adds    r3, #1
000aa140  ldr.w   r6, [r0, r3, lsl #3]
000aa144  cmp     r6, #0
000aa146  bne     #0xaa188
000aa148  mov     r0, r5
000aa14a  movs    r3, #2
000aa14c  str     r3, [r5, #0x1c]
000aa14e  bl      #0x57be4 ; -> ochar_sound
000aa152  mov     r0, r5
000aa154  bl      #0x2f3a0 ; -> get_x_dist
000aa158  movs    r3, #0x1a
000aa15a  str     r3, [r5, #0x40]
000aa15c  ldr     r3, [r5, #0x1c]
000aa15e  cmp     r3, #0xdf
000aa160  ble     #0xaa1bc
000aa162  ldr     r3, [pc, #0x94]
000aa164  ldr     r2, [pc, #0x94]
000aa166  mov     r0, r6
000aa168  str     r3, [r5, #0x1c]
000aa16a  add.w   r3, r3, #0x30000
000aa16e  str     r3, [r5, #0x20]
000aa170  ldr.w   r3, [r4, #0xa4]
000aa174  add     r2, pc ; -> 0x000aa435  t_mhop7
000aa176  lsls    r3, r3, #3
000aa178  adds    r3, r3, r4
000aa17a  str     r2, [r3, #4]
000aa17c  ldr.w   r3, [r4, #0xa4]
000aa180  adds    r3, #1
000aa182  str.w   r6, [r4, r3, lsl #3]
000aa186  pop     {r4, r5, r6, r7, pc}
000aa188  movw    r3, #0x48a
000aa18c  cmp     r6, r3
000aa18e  it      ne
000aa190  mvnne   r0, #2
000aa194  bne     #0xaa186
000aa196  ldr     r3, [pc, #0x68]
000aa198  ldr     r2, [pc, #0x68]
000aa19a  movs    r0, #0
000aa19c  str     r3, [r5, #0x20]
000aa19e  sub.w   r3, r3, #0x70000
000aa1a2  str     r3, [r5, #0x1c]
000aa1a4  ldr.w   r3, [r4, #0xa4]
000aa1a8  add     r2, pc ; -> 0x000aa435  t_mhop7
000aa1aa  lsls    r3, r3, #3
000aa1ac  adds    r3, r3, r4
000aa1ae  str     r2, [r3, #4]
000aa1b0  ldr.w   r3, [r4, #0xa4]
000aa1b4  adds    r3, #1
000aa1b6  str.w   r0, [r4, r3, lsl #3]
000aa1ba  b       #0xaa186
000aa1bc  mov     r0, r5
000aa1be  bl      #0x5520c ; -> get_char_ani
000aa1c2  ldr     r3, [pc, #0x44]
000aa1c4  movw    r2, #0x48a
000aa1c8  mov     r0, r6
000aa1ca  str     r3, [r5, #0x1c]
000aa1cc  ldr.w   r3, [r4, #0xa4]
000aa1d0  adds    r3, #1
000aa1d2  str.w   r2, [r4, r3, lsl #3]
000aa1d6  ldr.w   r3, [r4, #0xa4]
000aa1da  adds    r2, r3, #1
000aa1dc  ldr     r3, [pc, #0x2c]
000aa1de  str.w   r2, [r4, #0xa4]
000aa1e2  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
000aa1e4  ldr     r1, [r3]
000aa1e6  lsls    r3, r2, #3
000aa1e8  adds    r3, r3, r4
000aa1ea  str     r1, [r3, #4]
000aa1ec  ldr.w   r3, [r4, #0xa4]
000aa1f0  adds    r3, #1
000aa1f2  str.w   r6, [r4, r3, lsl #3]
000aa1f6  b       #0xaa186
000aa1f8  movs    r0, r0
000aa1fa  vrshr.u64 d16, d29, #0xa
000aa1fe  movs    r0, r0
000aa200  movs    r0, r0
