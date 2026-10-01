========================================================================
c_stsw_sd  0x0006da98  220 bytes   mkdrone.c
========================================================================

0006da98  push    {r4, r5, r7, lr}
0006da9a  add     r7, sp, #8
0006da9c  ldr.w   r3, [r0, #0xa4]
0006daa0  mov     r4, r0
0006daa2  ldr.w   r5, [r0, #0x108]
0006daa6  adds    r3, #1
0006daa8  movw    r2, #0x1054
0006daac  ldr.w   r0, [r0, r3, lsl #3]
0006dab0  cmp     r0, r2
0006dab2  beq     #0x6db0c
0006dab4  ble     #0x6dacc
0006dab6  movw    r2, #0x1055
0006daba  cmp     r0, r2
0006dabc  beq     #0x6db36
0006dabe  movw    r3, #0x1056
0006dac2  cmp     r0, r3
0006dac4  beq     #0x6daf4
0006dac6  mvn     r0, #2
0006daca  pop     {r4, r5, r7, pc}
0006dacc  cmp     r0, #0
0006dace  bne     #0x6dac6
0006dad0  str.w   r2, [r4, r3, lsl #3]
0006dad4  ldr.w   r3, [r4, #0xa4]
0006dad8  ldr     r2, [pc, #0x84]
0006dada  adds    r3, #1
0006dadc  str.w   r3, [r4, #0xa4]
0006dae0  lsls    r3, r3, #3
0006dae2  adds    r3, r3, r4
0006dae4  add     r2, pc ; -> 0x0006ca09  t_nr_attack_sd
0006dae6  str     r2, [r3, #4]
0006dae8  ldr.w   r3, [r4, #0xa4]
0006daec  adds    r3, #1
0006daee  str.w   r0, [r4, r3, lsl #3]
0006daf2  b       #0x6daca
0006daf4  mov     r0, r5
0006daf6  bl      #0x2f3a0 ; -> get_x_dist
0006dafa  ldr     r0, [r5, #0x28]
0006dafc  cmp     r0, #0x90
0006dafe  ble     #0x6db50
0006db00  ldr.w   r2, [pc, #0x60]
0006db04  ldr.w   r3, [r4, #0xa4]
0006db08  add     r2, pc ; -> 0x00067f91  t_d_zap
0006db0a  b       #0x6db22
0006db0c  movw    r2, #0x1055
0006db10  str.w   r2, [r4, r3, lsl #3]
0006db14  ldr     r2, [pc, #0x50]
0006db16  ldr.w   r3, [r4, #0xa4]
0006db1a  add     r2, pc ; -> 0x00068c89  t_nr_uppercut_if_u_can
0006db1c  adds    r3, #1
0006db1e  str.w   r3, [r4, #0xa4]
0006db22  lsls    r3, r3, #3
0006db24  adds    r3, r3, r4
0006db26  movs    r0, #0
0006db28  str     r2, [r3, #4]
0006db2a  ldr.w   r3, [r4, #0xa4]
0006db2e  adds    r3, #1
0006db30  str.w   r0, [r4, r3, lsl #3]
0006db34  b       #0x6daca
0006db36  movw    r2, #0x1056
0006db3a  str.w   r2, [r4, r3, lsl #3]
0006db3e  ldr.w   r2, [pc, #0x2c]
0006db42  ldr.w   r3, [r4, #0xa4]
0006db46  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006db48  adds    r3, #1
0006db4a  str.w   r3, [r4, #0xa4]
0006db4e  b       #0x6db22
0006db50  ldr.w   r3, [pc, #0x1c]
0006db54  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006db56  ldr     r2, [r3]
0006db58  ldr.w   r3, [r4, #0xa4]
0006db5c  b       #0x6db22
0006db5e  nop     
