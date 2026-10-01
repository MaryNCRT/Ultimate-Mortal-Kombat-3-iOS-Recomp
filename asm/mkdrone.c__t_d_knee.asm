========================================================================
t_d_knee  0x0006f5c0  160 bytes   mkdrone.c
========================================================================

0006f5c0  push    {r4, r5, r6, r7, lr}
0006f5c2  add     r7, sp, #0xc
0006f5c4  ldr.w   r2, [r0, #0xa4]
0006f5c8  mov     r4, r0
0006f5ca  ldr.w   r6, [r0, #0x108]
0006f5ce  adds    r3, r2, #1
0006f5d0  ldr.w   r5, [r0, r3, lsl #3]
0006f5d4  cbnz    r5, #0x6f5fc
0006f5d6  mov     r0, r6
0006f5d8  bl      #0x55060 ; -> is_he_airborn
0006f5dc  ldr     r0, [r6, #0x5c]
0006f5de  cbz     r0, #0x6f624
0006f5e0  ldr.w   r3, [r4, #0xa4]
0006f5e4  ldr     r2, [pc, #0x6c]
0006f5e6  mov     r0, r5
0006f5e8  lsls    r3, r3, #3
0006f5ea  adds    r3, r3, r4
0006f5ec  add     r2, pc ; -> 0x000687ad  t_d_rapid_lo
0006f5ee  str     r2, [r3, #4]
0006f5f0  ldr.w   r3, [r4, #0xa4]
0006f5f4  adds    r3, #1
0006f5f6  str.w   r5, [r4, r3, lsl #3]
0006f5fa  pop     {r4, r5, r6, r7, pc}
0006f5fc  cmp.w   r5, #0x16c
0006f600  it      ne
0006f602  mvnne   r0, #2
0006f606  bne     #0x6f5fa
0006f608  ldr.w   r3, [pc, #0x4c]
0006f60c  movs    r0, #0
0006f60e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006f610  ldr     r1, [r3]
0006f612  lsls    r3, r2, #3
0006f614  adds    r3, r3, r4
0006f616  str     r1, [r3, #4]
0006f618  ldr.w   r3, [r4, #0xa4]
0006f61c  adds    r3, #1
0006f61e  str.w   r0, [r4, r3, lsl #3]
0006f622  b       #0x6f5fa
0006f624  ldr.w   r3, [r4, #0xa4]
0006f628  mov.w   r2, #0x16c
0006f62c  adds    r3, #1
0006f62e  str.w   r2, [r4, r3, lsl #3]
0006f632  ldr.w   r3, [r4, #0xa4]
0006f636  adds    r2, r3, #1
0006f638  ldr     r3, [pc, #0x20]
0006f63a  str.w   r2, [r4, #0xa4]
0006f63e  add     r3, pc ; -> 0x000f38b4  t_do_knee
0006f640  ldr     r1, [r3]
0006f642  lsls    r3, r2, #3
0006f644  adds    r3, r3, r4
0006f646  str     r1, [r3, #4]
0006f648  ldr.w   r3, [r4, #0xa4]
0006f64c  adds    r3, #1
0006f64e  str.w   r0, [r4, r3, lsl #3]
0006f652  b       #0x6f5fa
0006f654  str     r1, [sp, #0x2f4]
0006f656  vshr.u64 q10, q11, #1
0006f65a  movs    r0, r1
0006f65c  rsbs    r2, r6, #0
0006f65e  movs    r0, r1
