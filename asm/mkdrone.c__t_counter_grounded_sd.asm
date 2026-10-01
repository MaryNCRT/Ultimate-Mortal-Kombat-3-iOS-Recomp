========================================================================
t_counter_grounded_sd  0x0006d7fc  136 bytes   mkdrone.c
========================================================================

0006d7fc  push    {r4, r5, r7, lr}
0006d7fe  add     r7, sp, #8
0006d800  ldr.w   r3, [r0, #0xa4]
0006d804  mov     r4, r0
0006d806  ldr.w   r5, [r0, #0x108]
0006d80a  adds    r3, #1
0006d80c  ldr.w   r0, [r0, r3, lsl #3]
0006d810  cbnz    r0, #0x6d83a
0006d812  movw    r2, #0x1130
0006d816  str.w   r2, [r4, r3, lsl #3]
0006d81a  ldr.w   r3, [r4, #0xa4]
0006d81e  ldr     r2, [pc, #0x58]
0006d820  adds    r3, #1
0006d822  str.w   r3, [r4, #0xa4]
0006d826  lsls    r3, r3, #3
0006d828  adds    r3, r3, r4
0006d82a  add     r2, pc ; -> 0x0006ca09  t_nr_attack_sd
0006d82c  str     r2, [r3, #4]
0006d82e  ldr.w   r3, [r4, #0xa4]
0006d832  adds    r3, #1
0006d834  str.w   r0, [r4, r3, lsl #3]
0006d838  pop     {r4, r5, r7, pc}
0006d83a  movw    r3, #0x1130
0006d83e  cmp     r0, r3
0006d840  it      ne
0006d842  mvnne   r0, #2
0006d846  bne     #0x6d838
0006d848  mov     r0, r5
0006d84a  bl      #0x2f3a0 ; -> get_x_dist
0006d84e  ldr     r0, [r5, #0x28]
0006d850  cmp     r0, #0xb0
0006d852  bgt     #0x6d872
0006d854  ldr.w   r2, [pc, #0x24]
0006d858  add     r2, pc ; -> 0x00067ec5  t_d_propell_attack
0006d85a  ldr.w   r3, [r4, #0xa4]
0006d85e  movs    r0, #0
0006d860  lsls    r3, r3, #3
0006d862  adds    r3, r3, r4
0006d864  str     r2, [r3, #4]
0006d866  ldr.w   r3, [r4, #0xa4]
0006d86a  adds    r3, #1
0006d86c  str.w   r0, [r4, r3, lsl #3]
0006d870  b       #0x6d838
0006d872  ldr     r2, [pc, #0xc]
0006d874  add     r2, pc ; -> 0x00067f91  t_d_zap
0006d876  b       #0x6d85a
0006d878  bl      #0x24987a
0006d87c  adr     r6, #0x1a4
0006d87e  vqshl.u32 d26, d9, #0x1f
