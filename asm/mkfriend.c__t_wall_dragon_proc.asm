========================================================================
t_wall_dragon_proc  0x000a614c  224 bytes   mkfriend.c
========================================================================

000a614c  push    {r4, r5, r6, r7, lr}
000a614e  add     r7, sp, #0xc
000a6150  str     r8, [sp, #-0x4]!
000a6154  ldr.w   r2, [r0, #0xa4]
000a6158  movw    r8, #0x599
000a615c  mov     r4, r0
000a615e  adds    r3, r2, #1
000a6160  ldr.w   r6, [r0, #0x108]
000a6164  ldr.w   r5, [r0, r3, lsl #3]
000a6168  cmp     r5, r8
000a616a  beq     #0xa61ea
000a616c  ble     #0xa6186
000a616e  movw    r3, #0x59a
000a6172  cmp     r5, r3
000a6174  beq     #0xa61fa
000a6176  adds    r3, #2
000a6178  cmp     r5, r3
000a617a  beq     #0xa61d0
000a617c  mvn     r0, #2
000a6180  ldr     r8, [sp], #4
000a6184  pop     {r4, r5, r6, r7, pc}
000a6186  cmp     r5, #0
000a6188  bne     #0xa617c
000a618a  ldr     r3, [pc, #0x90]
000a618c  mov     r0, r6
000a618e  str     r5, [r6, #0x1c]
000a6190  add     r3, pc ; -> 0x00177e68  a_wall_dragon
000a6192  str     r3, [r6, #0x40]
000a6194  mvn     r3, #0x2f
000a6198  str     r3, [r6, #0x20]
000a619a  bl      #0x570ac ; -> multi_adjust_xy
000a619e  movs    r3, #5
000a61a0  str     r3, [r6, #0x1c]
000a61a2  ldr.w   r3, [r4, #0xa4]
000a61a6  mov     r0, r5
000a61a8  adds    r3, #1
000a61aa  str.w   r8, [r4, r3, lsl #3]
000a61ae  ldr.w   r3, [r4, #0xa4]
000a61b2  adds    r2, r3, #1
000a61b4  ldr     r3, [pc, #0x68]
000a61b6  str.w   r2, [r4, #0xa4]
000a61ba  add     r3, pc ; -> 0x000f37cc  t_mframew
000a61bc  ldr     r1, [r3]
000a61be  lsls    r3, r2, #3
000a61c0  adds    r3, r3, r4
000a61c2  str     r1, [r3, #4]
000a61c4  ldr.w   r3, [r4, #0xa4]
000a61c8  adds    r3, #1
000a61ca  str.w   r5, [r4, r3, lsl #3]
000a61ce  b       #0xa6180
000a61d0  ldr     r3, [pc, #0x50]
000a61d2  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a61d4  ldr     r1, [r3]
000a61d6  lsls    r3, r2, #3
000a61d8  adds    r3, r3, r4
000a61da  movs    r0, #0
000a61dc  str     r1, [r3, #4]
000a61de  ldr.w   r3, [r4, #0xa4]
000a61e2  adds    r3, #1
000a61e4  str.w   r0, [r4, r3, lsl #3]
000a61e8  b       #0xa6180
000a61ea  movw    r2, #0x59a
000a61ee  str.w   r2, [r0, r3, lsl #3]
000a61f2  movs    r0, #0x20
000a61f4  str.w   r0, [r4, #0xfc]
000a61f8  b       #0xa6180
000a61fa  movs    r3, #4
000a61fc  str     r3, [r6, #0x1c]
000a61fe  ldr.w   r3, [r0, #0xa4]
000a6202  movw    r2, #0x59c
000a6206  adds    r3, #1
000a6208  str.w   r2, [r0, r3, lsl #3]
000a620c  ldr.w   r3, [r0, #0xa4]
000a6210  adds    r2, r3, #1
000a6212  ldr     r3, [pc, #0x14]
000a6214  str.w   r2, [r0, #0xa4]
000a6218  add     r3, pc ; -> 0x000f37cc  t_mframew
000a621a  b       #0xa61d4
000a621c  adds    r4, r2, #3
000a621e  movs    r5, r1
000a6220  bvs     #0xa6240
000a6222  movs    r4, r0
000a6224  bpl     #0xa62c4
000a6226  movs    r4, r0
000a6228  bpl     #0xa618c
000a622a  movs    r4, r0
