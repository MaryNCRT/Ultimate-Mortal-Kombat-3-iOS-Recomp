========================================================================
t_d_slam  0x0006f4e4  220 bytes   mkdrone.c
========================================================================

0006f4e4  push    {r4, r5, r6, r7, lr}
0006f4e6  add     r7, sp, #0xc
0006f4e8  str     r8, [sp, #-0x4]!
0006f4ec  ldr.w   r2, [r0, #0xa4]
0006f4f0  mov     r4, r0
0006f4f2  ldr.w   r6, [r0, #0x108]
0006f4f6  adds    r3, r2, #1
0006f4f8  ldr.w   r5, [r0, r3, lsl #3]
0006f4fc  cbnz    r5, #0x6f52e
0006f4fe  mov     r0, r6
0006f500  bl      #0x68e20 ; -> q_is_he_a_boss
0006f504  ldr.w   r8, [r6, #0x5c]
0006f508  cmp.w   r8, #0
0006f50c  beq     #0x6f558
0006f50e  ldr.w   r3, [r4, #0xa4]
0006f512  ldr     r2, [pc, #0x9c]
0006f514  mov     r0, r5
0006f516  lsls    r3, r3, #3
0006f518  adds    r3, r3, r4
0006f51a  add     r2, pc ; -> 0x000687f5  t_d_rapid_hi
0006f51c  str     r2, [r3, #4]
0006f51e  ldr.w   r3, [r4, #0xa4]
0006f522  adds    r3, #1
0006f524  str.w   r5, [r4, r3, lsl #3]
0006f528  ldr     r8, [sp], #4
0006f52c  pop     {r4, r5, r6, r7, pc}
0006f52e  movw    r3, #0x17f
0006f532  cmp     r5, r3
0006f534  it      ne
0006f536  mvnne   r0, #2
0006f53a  bne     #0x6f528
0006f53c  ldr.w   r3, [pc, #0x74]
0006f540  movs    r0, #0
0006f542  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006f544  ldr     r1, [r3]
0006f546  lsls    r3, r2, #3
0006f548  adds    r3, r3, r4
0006f54a  str     r1, [r3, #4]
0006f54c  ldr.w   r3, [r4, #0xa4]
0006f550  adds    r3, #1
0006f552  str.w   r0, [r4, r3, lsl #3]
0006f556  b       #0x6f528
0006f558  mov     r0, r6
0006f55a  bl      #0x55060 ; -> is_he_airborn
0006f55e  ldr     r0, [r6, #0x5c]
0006f560  cbz     r0, #0x6f580
0006f562  ldr.w   r3, [r4, #0xa4]
0006f566  ldr.w   r2, [pc, #0x50]
0006f56a  mov     r0, r8
0006f56c  lsls    r3, r3, #3
0006f56e  adds    r3, r3, r4
0006f570  add     r2, pc ; -> 0x000687f5  t_d_rapid_hi
0006f572  str     r2, [r3, #4]
0006f574  ldr.w   r3, [r4, #0xa4]
0006f578  adds    r3, #1
0006f57a  str.w   r8, [r4, r3, lsl #3]
0006f57e  b       #0x6f528
0006f580  ldr.w   r3, [r4, #0xa4]
0006f584  movw    r2, #0x17f
0006f588  adds    r3, #1
0006f58a  str.w   r2, [r4, r3, lsl #3]
0006f58e  ldr.w   r3, [r4, #0xa4]
0006f592  adds    r2, r3, #1
0006f594  ldr     r3, [pc, #0x24]
0006f596  str.w   r2, [r4, #0xa4]
0006f59a  add     r3, pc ; -> 0x000f37c8  t_do_body_slam
0006f59c  ldr     r1, [r3]
0006f59e  lsls    r3, r2, #3
0006f5a0  adds    r3, r3, r4
0006f5a2  str     r1, [r3, #4]
0006f5a4  ldr.w   r3, [r4, #0xa4]
0006f5a8  adds    r3, #1
0006f5aa  str.w   r0, [r4, r3, lsl #3]
0006f5ae  b       #0x6f528
0006f5b0  str     r2, [sp, #0x35c]
