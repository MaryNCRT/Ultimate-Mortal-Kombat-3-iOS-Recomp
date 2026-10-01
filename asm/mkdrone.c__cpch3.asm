========================================================================
cpch3  0x0006d1dc  132 bytes   mkdrone.c
========================================================================

0006d1dc  push    {r4, r5, r6, r7, lr}
0006d1de  add     r7, sp, #0xc
0006d1e0  ldr.w   r3, [r0, #0xa4]
0006d1e4  mov     r4, r0
0006d1e6  ldr.w   r5, [r0, #0x108]
0006d1ea  adds    r3, #1
0006d1ec  ldr.w   r6, [r0, r3, lsl #3]
0006d1f0  cbnz    r6, #0x6d248
0006d1f2  ldr.w   r1, [r0, #0xf8]
0006d1f6  ldr     r2, [r5, #0x20]
0006d1f8  lsls    r3, r1, #2
0006d1fa  adds    r3, r3, r0
0006d1fc  str.w   r2, [r3, #0xa8]
0006d200  adds    r3, r1, #1
0006d202  str.w   r3, [r0, #0xf8]
0006d206  mov     r0, r5
0006d208  bl      #0x2f3a0 ; -> get_x_dist
0006d20c  ldr.w   r3, [r4, #0xf8]
0006d210  subs    r3, #1
0006d212  str.w   r3, [r4, #0xf8]
0006d216  lsls    r3, r3, #2
0006d218  adds    r3, r3, r4
0006d21a  ldr.w   r3, [r3, #0xa8]
0006d21e  str     r3, [r5, #0x20]
0006d220  ldr     r3, [r5, #0x28]
0006d222  cmp     r3, #0x60
0006d224  bgt     #0x6d24e
0006d226  ldr     r2, [pc, #0x2c]
0006d228  ldr     r3, [pc, #0x2c]
0006d22a  add     r2, pc ; -> 0x0006cbdd  t_react_jump_table
0006d22c  add     r3, pc ; -> 0x00172398  funcs.13934
0006d22e  str     r3, [r5, #0x68]
0006d230  ldr.w   r3, [r4, #0xa4]
0006d234  mov     r0, r6
0006d236  lsls    r3, r3, #3
0006d238  adds    r3, r3, r4
0006d23a  str     r2, [r3, #4]
0006d23c  ldr.w   r3, [r4, #0xa4]
0006d240  adds    r3, #1
0006d242  str.w   r6, [r4, r3, lsl #3]
0006d246  b       #0x6d24c
0006d248  mvn     r0, #2
0006d24c  pop     {r4, r5, r6, r7, pc}
0006d24e  ldr     r2, [pc, #0xc]
0006d250  add     r2, pc ; -> 0x0006c149  t_return_to_beware_4get
0006d252  b       #0x6d230
0006d254  vld4.32 {d15[], d17[], d19[], d21[]}, [pc:0x80]
0006d258  str     r0, [r5, r5]
0006d25a  movs    r0, r2
0006d25c  mrc     p15, #7, apsr_nzcv, c5, c15, #7
