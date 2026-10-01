========================================================================
t_d_attack_far  0x0006f844  240 bytes   mkdrone.c
========================================================================

0006f844  push    {r4, r5, r6, r7, lr}
0006f846  add     r7, sp, #0xc
0006f848  str     r8, [sp, #-0x4]!
0006f84c  ldr.w   r2, [r0, #0xa4]
0006f850  movw    r8, #0x3d2
0006f854  mov     r4, r0
0006f856  adds    r3, r2, #1
0006f858  ldr.w   r6, [r0, #0x108]
0006f85c  ldr.w   r5, [r0, r3, lsl #3]
0006f860  cmp     r5, r8
0006f862  beq     #0x6f8b6
0006f864  cmp.w   r5, #0x3d8
0006f868  beq     #0x6f89e
0006f86a  cbz     r5, #0x6f876
0006f86c  mvn     r0, #2
0006f870  ldr     r8, [sp], #4
0006f874  pop     {r4, r5, r6, r7, pc}
0006f876  mov     r0, r6
0006f878  bl      #0x6f660 ; -> q_airborn_counter
0006f87c  ldr     r0, [r6, #0x5c]
0006f87e  cmp     r0, #0
0006f880  beq     #0x6f8f4
0006f882  ldr.w   r3, [r4, #0xa4]
0006f886  ldr     r2, [pc, #0x98]
0006f888  mov     r0, r5
0006f88a  lsls    r3, r3, #3
0006f88c  adds    r3, r3, r4
0006f88e  add     r2, pc ; -> 0x00067d71  t_far_airborn
0006f890  str     r2, [r3, #4]
0006f892  ldr.w   r3, [r4, #0xa4]
0006f896  adds    r3, #1
0006f898  str.w   r5, [r4, r3, lsl #3]
0006f89c  b       #0x6f870
0006f89e  ldr     r1, [pc, #0x84]
0006f8a0  lsls    r3, r2, #3
0006f8a2  adds    r3, r3, r0
0006f8a4  add     r1, pc ; -> 0x00067d71  t_far_airborn
0006f8a6  str     r1, [r3, #4]
0006f8a8  ldr.w   r3, [r0, #0xa4]
0006f8ac  movs    r0, #0
0006f8ae  adds    r3, #1
0006f8b0  str.w   r0, [r4, r3, lsl #3]
0006f8b4  b       #0x6f870
0006f8b6  ldr.w   r3, [pc, #0x70]
0006f8ba  mov.w   r2, #0x3d8
0006f8be  add     r3, pc ; -> 0x001724d8  funcs.8157
0006f8c0  str     r3, [r6, #0x68]
0006f8c2  movs    r3, #5
0006f8c4  str     r3, [r6, #0x64]
0006f8c6  ldr.w   r3, [r0, #0xa4]
0006f8ca  adds    r3, #1
0006f8cc  str.w   r2, [r0, r3, lsl #3]
0006f8d0  ldr.w   r3, [r0, #0xa4]
0006f8d4  ldr.w   r2, [pc, #0x54]
0006f8d8  adds    r3, #1
0006f8da  str.w   r3, [r0, #0xa4]
0006f8de  lsls    r3, r3, #3
0006f8e0  adds    r3, r3, r0
0006f8e2  add     r2, pc ; -> 0x00072e4d  t_random_do
0006f8e4  str     r2, [r3, #4]
0006f8e6  ldr.w   r3, [r0, #0xa4]
0006f8ea  movs    r0, #0
0006f8ec  adds    r3, #1
0006f8ee  str.w   r0, [r4, r3, lsl #3]
0006f8f2  b       #0x6f870
0006f8f4  ldr.w   r3, [r4, #0xa4]
0006f8f8  ldr     r2, [pc, #0x34]
0006f8fa  adds    r3, #1
0006f8fc  add     r2, pc ; -> 0x0006cdad  t_nr_drone_zone
0006f8fe  str.w   r8, [r4, r3, lsl #3]
0006f902  ldr.w   r3, [r4, #0xa4]
0006f906  adds    r3, #1
0006f908  str.w   r3, [r4, #0xa4]
0006f90c  lsls    r3, r3, #3
0006f90e  adds    r3, r3, r4
0006f910  str     r2, [r3, #4]
0006f912  ldr.w   r3, [r4, #0xa4]
0006f916  adds    r3, #1
0006f918  str.w   r0, [r4, r3, lsl #3]
0006f91c  b       #0x6f870
0006f91e  nop     
0006f920  strh    r7, [r3, #0x26]
