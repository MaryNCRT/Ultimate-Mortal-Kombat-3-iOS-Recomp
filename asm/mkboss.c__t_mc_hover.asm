========================================================================
t_mc_hover  0x000ab890  88 bytes   mkboss.c
========================================================================

000ab890  push    {r4, r5, r6, r7, lr}
000ab892  add     r7, sp, #0xc
000ab894  ldr.w   r3, [r0, #0xa4]
000ab898  mov     r4, r0
000ab89a  ldr.w   r5, [r0, #0x108]
000ab89e  adds    r3, #1
000ab8a0  ldr.w   r6, [r0, r3, lsl #3]
000ab8a4  cbnz    r6, #0xab8d4
000ab8a6  mov     r0, r5
000ab8a8  bl      #0xab804 ; -> motaro_randper
000ab8ac  mov     r0, r5
000ab8ae  bl      #0x2f3a0 ; -> get_x_dist
000ab8b2  ldr     r0, [r5, #0x28]
000ab8b4  cmp     r0, #0x6f
000ab8b6  ble     #0xab8da
000ab8b8  ldr     r2, [pc, #0x24]
000ab8ba  add     r2, pc ; -> 0x000aa131  t_motaro_hop
000ab8bc  ldr.w   r3, [r4, #0xa4]
000ab8c0  mov     r0, r6
000ab8c2  lsls    r3, r3, #3
000ab8c4  adds    r3, r3, r4
000ab8c6  str     r2, [r3, #4]
000ab8c8  ldr.w   r3, [r4, #0xa4]
000ab8cc  adds    r3, #1
000ab8ce  str.w   r6, [r4, r3, lsl #3]
000ab8d2  b       #0xab8d8
000ab8d4  mvn     r0, #2
000ab8d8  pop     {r4, r5, r6, r7, pc}
000ab8da  ldr     r2, [pc, #8]
000ab8dc  add     r2, pc ; -> 0x000aa051  t_motaro_punch
000ab8de  b       #0xab8bc
000ab8e0  ldrd    pc, pc, [r3], #-0x3fc
000ab8e4  b       #0xab7ca
