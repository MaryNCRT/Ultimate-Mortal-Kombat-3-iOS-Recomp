========================================================================
t_skc_lk_zap_lo  0x000a8de0  84 bytes   mkboss.c
========================================================================

000a8de0  push    {r4, r5, r6, r7, lr}
000a8de2  add     r7, sp, #0xc
000a8de4  ldr.w   r3, [r0, #0xa4]
000a8de8  mov     r4, r0
000a8dea  ldr.w   r5, [r0, #0x108]
000a8dee  adds    r3, #1
000a8df0  ldr.w   r6, [r0, r3, lsl #3]
000a8df4  cbnz    r6, #0xa8e1e
000a8df6  mov     r0, r5
000a8df8  bl      #0x2f3a0 ; -> get_x_dist
000a8dfc  ldr     r0, [r5, #0x28]
000a8dfe  cmp     r0, #0x6f
000a8e00  ble     #0xa8e24
000a8e02  ldr     r2, [pc, #0x28]
000a8e04  add     r2, pc ; -> 0x000ab009  t_sk_air_charge
000a8e06  ldr.w   r3, [r4, #0xa4]
000a8e0a  mov     r0, r6
000a8e0c  lsls    r3, r3, #3
000a8e0e  adds    r3, r3, r4
000a8e10  str     r2, [r3, #4]
000a8e12  ldr.w   r3, [r4, #0xa4]
000a8e16  adds    r3, #1
000a8e18  str.w   r6, [r4, r3, lsl #3]
000a8e1c  b       #0xa8e22
000a8e1e  mvn     r0, #2
000a8e22  pop     {r4, r5, r6, r7, pc}
000a8e24  ldr     r2, [pc, #8]
000a8e26  add     r2, pc ; -> 0x000ab211  t_sk_charge
000a8e28  b       #0xa8e06
000a8e2a  nop     
000a8e2c  movs    r2, #1
000a8e2e  movs    r0, r0
000a8e30  movs    r3, #0xe7
000a8e32  movs    r0, r0
