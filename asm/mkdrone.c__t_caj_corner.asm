========================================================================
t_caj_corner  0x0006e500  192 bytes   mkdrone.c
========================================================================

0006e500  push    {r4, r5, r6, r7, lr}
0006e502  add     r7, sp, #0xc
0006e504  ldr.w   r2, [r0, #0xa4]
0006e508  mov     r4, r0
0006e50a  ldr.w   r5, [r0, #0x108]
0006e50e  adds    r3, r2, #1
0006e510  ldr.w   r6, [r0, r3, lsl #3]
0006e514  cbnz    r6, #0x6e542
0006e516  mov     r0, r5
0006e518  bl      #0x2f3a0 ; -> get_x_dist
0006e51c  ldr     r3, [r5, #0x28]
0006e51e  cmp     r3, #0x47
0006e520  ble     #0x6e568
0006e522  cmp     r3, #0x87
0006e524  bgt     #0x6e56e
0006e526  ldr     r2, [pc, #0x80]
0006e528  add     r2, pc ; -> 0x00070ea1  t_d_flip_punch_jump
0006e52a  ldr.w   r3, [r4, #0xa4]
0006e52e  lsls    r3, r3, #3
0006e530  adds    r3, r3, r4
0006e532  mov     r0, r6
0006e534  str     r2, [r3, #4]
0006e536  ldr.w   r3, [r4, #0xa4]
0006e53a  adds    r3, #1
0006e53c  str.w   r6, [r4, r3, lsl #3]
0006e540  pop     {r4, r5, r6, r7, pc}
0006e542  movw    r3, #0xc7f
0006e546  cmp     r6, r3
0006e548  it      ne
0006e54a  mvnne   r0, #2
0006e54e  bne     #0x6e540
0006e550  ldr     r1, [pc, #0x58]
0006e552  lsls    r3, r2, #3
0006e554  adds    r3, r3, r4
0006e556  add     r1, pc ; -> 0x00067f91  t_d_zap
0006e558  str     r1, [r3, #4]
0006e55a  ldr.w   r3, [r4, #0xa4]
0006e55e  movs    r0, #0
0006e560  adds    r3, #1
0006e562  str.w   r0, [r4, r3, lsl #3]
0006e566  b       #0x6e540
0006e568  ldr     r2, [pc, #0x44]
0006e56a  add     r2, pc ; -> 0x000676a1  t_d_uppercut
0006e56c  b       #0x6e52a
0006e56e  cmp     r3, #0xc0
0006e570  ble     #0x6e57e
0006e572  ldr.w   r2, [pc, #0x40]
0006e576  ldr.w   r3, [r4, #0xa4]
0006e57a  add     r2, pc ; -> 0x0006c919  t_caj_corner_far
0006e57c  b       #0x6e52e
0006e57e  movs    r3, #0x40
0006e580  str     r3, [r5, #0x44]
0006e582  ldr     r3, [pc, #0x34]
0006e584  movw    r2, #0xc7f
0006e588  add     r3, pc ; -> 0x000698f9  q_corner_backf_land
0006e58a  str     r3, [r5, #0x48]
0006e58c  ldr.w   r3, [r4, #0xa4]
0006e590  adds    r3, #1
0006e592  str.w   r2, [r4, r3, lsl #3]
0006e596  ldr.w   r2, [pc, #0x24]
0006e59a  ldr.w   r3, [r4, #0xa4]
0006e59e  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006e5a0  adds    r3, #1
0006e5a2  str.w   r3, [r4, #0xa4]
0006e5a6  b       #0x6e52e
0006e5a8  cmp     r1, #0x75
0006e5aa  movs    r0, r0
0006e5ac  ldr     r2, [sp, #0xdc]
0006e5ae  vsra.u32 d25, d19, #1
0006e5b2  vrsra.u64 d30, d11, #1
