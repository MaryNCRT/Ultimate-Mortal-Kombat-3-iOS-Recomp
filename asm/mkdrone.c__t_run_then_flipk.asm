========================================================================
t_run_then_flipk  0x0006a550  132 bytes   mkdrone.c
========================================================================

0006a550  ldr.w   r1, [r0, #0xa4]
0006a554  ldr.w   ip, [r0, #0x108]
0006a558  adds    r3, r1, #1
0006a55a  ldr.w   r2, [r0, r3, lsl #3]
0006a55e  cbnz    r2, #0x6a5a0
0006a560  movs    r3, #0x30
0006a562  str.w   r3, [ip, #0x44]
0006a566  ldr     r3, [pc, #0x60]
0006a568  movw    r1, #0xeb7
0006a56c  add     r3, pc ; -> 0x0006de49  q_run_then_flipk
0006a56e  str.w   r3, [ip, #0x48]
0006a572  ldr.w   r3, [r0, #0xa4]
0006a576  adds    r3, #1
0006a578  str.w   r1, [r0, r3, lsl #3]
0006a57c  ldr.w   r3, [r0, #0xa4]
0006a580  ldr.w   r1, [pc, #0x48]
0006a584  adds    r3, #1
0006a586  str.w   r3, [r0, #0xa4]
0006a58a  lsls    r3, r3, #3
0006a58c  adds    r3, r3, r0
0006a58e  add     r1, pc ; -> 0x0006fbc1  t_d_run_till_yes
0006a590  str     r1, [r3, #4]
0006a592  ldr.w   r3, [r0, #0xa4]
0006a596  adds    r3, #1
0006a598  str.w   r2, [r0, r3, lsl #3]
0006a59c  mov     r0, r2
0006a59e  bx      lr
0006a5a0  movw    r3, #0xeb7
0006a5a4  cmp     r2, r3
0006a5a6  it      ne
0006a5a8  mvnne   r0, #2
0006a5ac  bne     #0x6a59e
0006a5ae  ldr     r2, [pc, #0x20]
0006a5b0  lsls    r3, r1, #3
0006a5b2  adds    r3, r3, r0
0006a5b4  add     r2, pc ; -> 0x00068745  t_d_fflip_kick_jump
0006a5b6  str     r2, [r3, #4]
0006a5b8  ldr.w   r3, [r0, #0xa4]
0006a5bc  movs    r2, #0
0006a5be  adds    r3, #1
0006a5c0  str.w   r2, [r0, r3, lsl #3]
0006a5c4  mov     r0, r2
0006a5c6  b       #0x6a59e
0006a5c8  subs    r0, #0xd9
0006a5ca  movs    r0, r0
0006a5cc  ldrsb   r7, [r5, r0]
0006a5ce  movs    r0, r0
0006a5d0  b       #0x6a8ee
