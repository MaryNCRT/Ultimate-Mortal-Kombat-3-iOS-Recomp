========================================================================
t_diff_no_propell  0x0006e7bc  84 bytes   mkdrone.c
========================================================================

0006e7bc  push    {r4, r5, r6, r7, lr}
0006e7be  add     r7, sp, #0xc
0006e7c0  ldr.w   r3, [r0, #0xa4]
0006e7c4  mov     r4, r0
0006e7c6  ldr.w   r5, [r0, #0x108]
0006e7ca  adds    r3, #1
0006e7cc  ldr.w   r6, [r0, r3, lsl #3]
0006e7d0  cbnz    r6, #0x6e7fa
0006e7d2  mov     r0, r5
0006e7d4  bl      #0x2f3a0 ; -> get_x_dist
0006e7d8  ldr     r0, [r5, #0x28]
0006e7da  cmp     r0, #0x47
0006e7dc  ble     #0x6e800
0006e7de  ldr     r2, [pc, #0x28]
0006e7e0  add     r2, pc ; -> 0x000677b9  t_stalk_in_close
0006e7e2  ldr.w   r3, [r4, #0xa4]
0006e7e6  mov     r0, r6
0006e7e8  lsls    r3, r3, #3
0006e7ea  adds    r3, r3, r4
0006e7ec  str     r2, [r3, #4]
0006e7ee  ldr.w   r3, [r4, #0xa4]
0006e7f2  adds    r3, #1
0006e7f4  str.w   r6, [r4, r3, lsl #3]
0006e7f8  b       #0x6e7fe
0006e7fa  mvn     r0, #2
0006e7fe  pop     {r4, r5, r6, r7, pc}
0006e800  ldr     r2, [pc, #8]
0006e802  add     r2, pc ; -> 0x00067635  t_d_lo_kick
0006e804  b       #0x6e7e2
0006e806  nop     
0006e808  ldrh    r5, [r2, #0x3e]
