========================================================================
c_ssd  0x0006fe44  212 bytes   mkdrone.c
========================================================================

0006fe44  push    {r4, r7, lr}
0006fe46  add     r7, sp, #4
0006fe48  ldr.w   r3, [r0, #0xa4]
0006fe4c  mov     r4, r0
0006fe4e  movw    r2, #0x106f
0006fe52  adds    r3, #1
0006fe54  ldr.w   r0, [r0, r3, lsl #3]
0006fe58  cmp     r0, r2
0006fe5a  beq     #0x6feb2
0006fe5c  ble     #0x6fe74
0006fe5e  movw    r2, #0x1070
0006fe62  cmp     r0, r2
0006fe64  beq     #0x6fede
0006fe66  movw    r3, #0x1071
0006fe6a  cmp     r0, r3
0006fe6c  beq     #0x6fe9c
0006fe6e  mvn     r0, #2
0006fe72  pop     {r4, r7, pc}
0006fe74  cmp     r0, #0
0006fe76  bne     #0x6fe6e
0006fe78  str.w   r2, [r4, r3, lsl #3]
0006fe7c  ldr     r2, [pc, #0x84]
0006fe7e  ldr.w   r3, [r4, #0xa4]
0006fe82  add     r2, pc ; -> 0x0006ca09  t_nr_attack_sd
0006fe84  adds    r3, #1
0006fe86  str.w   r3, [r4, #0xa4]
0006fe8a  lsls    r3, r3, #3
0006fe8c  adds    r3, r3, r4
0006fe8e  str     r2, [r3, #4]
0006fe90  ldr.w   r3, [r4, #0xa4]
0006fe94  adds    r3, #1
0006fe96  str.w   r0, [r4, r3, lsl #3]
0006fe9a  b       #0x6fe72
0006fe9c  bl      #0x586b0 ; -> random32
0006fea0  ands    r0, r0, #0x800
0006fea4  beq     #0x6fef8
0006fea6  ldr.w   r2, [pc, #0x60]
0006feaa  ldr.w   r3, [r4, #0xa4]
0006feae  add     r2, pc ; -> 0x00067f91  t_d_zap
0006feb0  b       #0x6feca
0006feb2  movw    r2, #0x1070
0006feb6  str.w   r2, [r4, r3, lsl #3]
0006feba  ldr.w   r2, [pc, #0x50]
0006febe  ldr.w   r3, [r4, #0xa4]
0006fec2  add     r2, pc ; -> 0x00068c89  t_nr_uppercut_if_u_can
0006fec4  adds    r3, #1
0006fec6  str.w   r3, [r4, #0xa4]
0006feca  lsls    r3, r3, #3
0006fecc  adds    r3, r3, r4
0006fece  movs    r0, #0
0006fed0  str     r2, [r3, #4]
0006fed2  ldr.w   r3, [r4, #0xa4]
0006fed6  adds    r3, #1
0006fed8  str.w   r0, [r4, r3, lsl #3]
0006fedc  b       #0x6fe72
0006fede  movw    r2, #0x1071
0006fee2  str.w   r2, [r4, r3, lsl #3]
0006fee6  ldr.w   r2, [pc, #0x28]
0006feea  ldr.w   r3, [r4, #0xa4]
0006feee  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006fef0  adds    r3, #1
0006fef2  str.w   r3, [r4, #0xa4]
0006fef6  b       #0x6feca
0006fef8  ldr.w   r2, [pc, #0x18]
0006fefc  ldr.w   r3, [r4, #0xa4]
0006ff00  add     r2, pc ; -> 0x00067ec5  t_d_propell_attack
0006ff02  b       #0x6fe8a
0006ff04  ldm     r3!, {r0, r1, r7}
