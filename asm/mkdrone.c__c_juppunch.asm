========================================================================
c_juppunch  0x0006d520  92 bytes   mkdrone.c
========================================================================

0006d520  push    {r4, r5, r6, r7, lr}
0006d522  add     r7, sp, #0xc
0006d524  ldr.w   r3, [r0, #0xa4]
0006d528  mov     r4, r0
0006d52a  ldr.w   r5, [r0, #0x108]
0006d52e  adds    r3, #1
0006d530  ldr.w   r6, [r0, r3, lsl #3]
0006d534  cbnz    r6, #0x6d564
0006d536  mov     r0, r5
0006d538  bl      #0x2f3a0 ; -> get_x_dist
0006d53c  ldr     r3, [r5, #0x28]
0006d53e  cmp     r3, #0x60
0006d540  bgt     #0x6d56a
0006d542  ldr     r2, [pc, #0x2c]
0006d544  ldr     r3, [pc, #0x2c]
0006d546  add     r2, pc ; -> 0x0006c5ad  t_react_jump_table_act
0006d548  add     r3, pc ; -> 0x001723b8  funcs.13651
0006d54a  str     r3, [r5, #0x68]
0006d54c  ldr.w   r3, [r4, #0xa4]
0006d550  mov     r0, r6
0006d552  lsls    r3, r3, #3
0006d554  adds    r3, r3, r4
0006d556  str     r2, [r3, #4]
0006d558  ldr.w   r3, [r4, #0xa4]
0006d55c  adds    r3, #1
0006d55e  str.w   r6, [r4, r3, lsl #3]
0006d562  b       #0x6d568
0006d564  mvn     r0, #2
0006d568  pop     {r4, r5, r6, r7, pc}
0006d56a  ldr     r2, [pc, #0xc]
0006d56c  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006d56e  b       #0x6d54c
0006d570  bl      #0xd1572
0006d574  ldr     r6, [pc, #0x1b0]
0006d576  movs    r0, r2
