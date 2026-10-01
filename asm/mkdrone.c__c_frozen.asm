========================================================================
c_frozen  0x0006d884  84 bytes   mkdrone.c
========================================================================

0006d884  push    {r4, r5, r6, r7, lr}
0006d886  add     r7, sp, #0xc
0006d888  ldr.w   r3, [r0, #0xa4]
0006d88c  mov     r4, r0
0006d88e  ldr.w   r5, [r0, #0x108]
0006d892  adds    r3, #1
0006d894  ldr.w   r6, [r0, r3, lsl #3]
0006d898  cbnz    r6, #0x6d8c2
0006d89a  mov     r0, r5
0006d89c  bl      #0x2f3a0 ; -> get_x_dist
0006d8a0  ldr     r0, [r5, #0x28]
0006d8a2  cmp     r0, #0x6f
0006d8a4  ble     #0x6d8c8
0006d8a6  ldr     r2, [pc, #0x28]
0006d8a8  add     r2, pc ; -> 0x000722c9  t_run_in_close_now
0006d8aa  ldr.w   r3, [r4, #0xa4]
0006d8ae  mov     r0, r6
0006d8b0  lsls    r3, r3, #3
0006d8b2  adds    r3, r3, r4
0006d8b4  str     r2, [r3, #4]
0006d8b6  ldr.w   r3, [r4, #0xa4]
0006d8ba  adds    r3, #1
0006d8bc  str.w   r6, [r4, r3, lsl #3]
0006d8c0  b       #0x6d8c6
0006d8c2  mvn     r0, #2
0006d8c6  pop     {r4, r5, r6, r7, pc}
0006d8c8  ldr     r2, [pc, #8]
0006d8ca  add     r2, pc ; -> 0x0006f36d  c_froze_closer
0006d8cc  b       #0x6d8aa
0006d8ce  nop     
0006d8d0  ldr     r2, [pc, #0x74]
0006d8d2  movs    r0, r0
0006d8d4  subs    r7, r3, r2
0006d8d6  movs    r0, r0
