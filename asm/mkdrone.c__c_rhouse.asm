========================================================================
c_rhouse  0x0006ecd8  204 bytes   mkdrone.c
========================================================================

0006ecd8  push    {r4, r5, r6, r7, lr}
0006ecda  add     r7, sp, #0xc
0006ecdc  str     r8, [sp, #-0x4]!
0006ece0  ldr.w   r2, [r0, #0xa4]
0006ece4  mov     r4, r0
0006ece6  ldr.w   r5, [r0, #0x108]
0006ecea  adds    r3, r2, #1
0006ecec  ldr.w   r6, [r0, r3, lsl #3]
0006ecf0  cbnz    r6, #0x6ed1e
0006ecf2  mov     r0, r5
0006ecf4  bl      #0x2f3a0 ; -> get_x_dist
0006ecf8  ldr     r3, [r5, #0x28]
0006ecfa  cmp     r3, #0xd0
0006ecfc  ble     #0x6ed44
0006ecfe  ldr     r2, [pc, #0x94]
0006ed00  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006ed02  ldr.w   r3, [r4, #0xa4]
0006ed06  mov     r0, r6
0006ed08  lsls    r3, r3, #3
0006ed0a  adds    r3, r3, r4
0006ed0c  str     r2, [r3, #4]
0006ed0e  ldr.w   r3, [r4, #0xa4]
0006ed12  adds    r3, #1
0006ed14  str.w   r6, [r4, r3, lsl #3]
0006ed18  ldr     r8, [sp], #4
0006ed1c  pop     {r4, r5, r6, r7, pc}
0006ed1e  movw    r3, #0x13f7
0006ed22  cmp     r6, r3
0006ed24  it      ne
0006ed26  mvnne   r0, #2
0006ed2a  bne     #0x6ed18
0006ed2c  ldr     r1, [pc, #0x68]
0006ed2e  lsls    r3, r2, #3
0006ed30  adds    r3, r3, r4
0006ed32  add     r1, pc ; -> 0x00067f91  t_d_zap
0006ed34  str     r1, [r3, #4]
0006ed36  ldr.w   r3, [r4, #0xa4]
0006ed3a  movs    r0, #0
0006ed3c  adds    r3, #1
0006ed3e  str.w   r0, [r4, r3, lsl #3]
0006ed42  b       #0x6ed18
0006ed44  mov     r0, r5
0006ed46  bl      #0x6e9c4 ; -> q_will_he_reach_me
0006ed4a  ldr.w   r8, [r5, #0x5c]
0006ed4e  cmp.w   r8, #0
0006ed52  beq     #0x6ed5a
0006ed54  ldr     r2, [pc, #0x44]
0006ed56  add     r2, pc ; -> 0x0006e941  t_ct_kicks
0006ed58  b       #0x6ed02
0006ed5a  mov     r0, r5
0006ed5c  bl      #0x55c04 ; -> stop_me_player
0006ed60  ldr.w   r3, [r4, #0xa4]
0006ed64  movw    r2, #0x13f7
0006ed68  mov     r0, r8
0006ed6a  adds    r3, #1
0006ed6c  str.w   r2, [r4, r3, lsl #3]
0006ed70  ldr.w   r3, [r4, #0xa4]
0006ed74  ldr.w   r2, [pc, #0x28]
0006ed78  adds    r3, #1
0006ed7a  str.w   r3, [r4, #0xa4]
0006ed7e  lsls    r3, r3, #3
0006ed80  adds    r3, r3, r4
0006ed82  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006ed84  str     r2, [r3, #4]
0006ed86  ldr.w   r3, [r4, #0xa4]
0006ed8a  adds    r3, #1
0006ed8c  str.w   r8, [r4, r3, lsl #3]
0006ed90  b       #0x6ed18
0006ed92  nop     
0006ed94  bmi     #0x6ec9a
