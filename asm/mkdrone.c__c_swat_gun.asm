========================================================================
c_swat_gun  0x0006d350  112 bytes   mkdrone.c
========================================================================

0006d350  push    {r4, r5, r6, r7, lr}
0006d352  add     r7, sp, #0xc
0006d354  ldr.w   r3, [r0, #0xa4]
0006d358  mov     r4, r0
0006d35a  ldr.w   r5, [r0, #0x108]
0006d35e  adds    r3, #1
0006d360  ldr.w   r6, [r0, r3, lsl #3]
0006d364  cbnz    r6, #0x6d392
0006d366  ldr     r3, [pc, #0x48]
0006d368  mov     r0, r5
0006d36a  add     r3, pc ; -> 0x00171fa8  rpt_counter
0006d36c  str     r3, [r5, #0x1c]
0006d36e  bl      #0x6c9c8 ; -> ask_mr_diff
0006d372  ldr     r3, [r5, #0x5c]
0006d374  cbnz    r3, #0x6d398
0006d376  ldr     r2, [pc, #0x3c]
0006d378  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006d37a  ldr.w   r3, [r4, #0xa4]
0006d37e  mov     r0, r6
0006d380  lsls    r3, r3, #3
0006d382  adds    r3, r3, r4
0006d384  str     r2, [r3, #4]
0006d386  ldr.w   r3, [r4, #0xa4]
0006d38a  adds    r3, #1
0006d38c  str.w   r6, [r4, r3, lsl #3]
0006d390  b       #0x6d396
0006d392  mvn     r0, #2
0006d396  pop     {r4, r5, r6, r7, pc}
0006d398  mov     r0, r5
0006d39a  bl      #0x2f3a0 ; -> get_x_dist
0006d39e  ldr     r0, [r5, #0x28]
0006d3a0  cmp     r0, #0xd0
0006d3a2  ble     #0x6d3aa
0006d3a4  ldr     r2, [pc, #0x10]
0006d3a6  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
0006d3a8  b       #0x6d37a
0006d3aa  ldr     r2, [pc, #0x10]
0006d3ac  add     r2, pc ; -> 0x0006fa21  t_d_block
0006d3ae  b       #0x6d37a
0006d3b0  ldr     r4, [pc, #0xe8]
0006d3b2  movs    r0, r2
0006d3b4  mcr     p15, #0, pc, c9, c15, #7
0006d3b8  add     r4, sp, #0xdc
