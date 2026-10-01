========================================================================
t_run_under_flykick  0x0006ba40  132 bytes   mkdrone.c
========================================================================

0006ba40  ldr.w   r1, [r0, #0xa4]
0006ba44  ldr.w   ip, [r0, #0x108]
0006ba48  adds    r3, r1, #1
0006ba4a  ldr.w   r2, [r0, r3, lsl #3]
0006ba4e  cbnz    r2, #0x6ba90
0006ba50  movs    r3, #0x30
0006ba52  str.w   r3, [ip, #0x44]
0006ba56  ldr     r3, [pc, #0x60]
0006ba58  movw    r1, #0x12ef
0006ba5c  add     r3, pc ; -> 0x0006efa5  q_run_under_fk
0006ba5e  str.w   r3, [ip, #0x48]
0006ba62  ldr.w   r3, [r0, #0xa4]
0006ba66  adds    r3, #1
0006ba68  str.w   r1, [r0, r3, lsl #3]
0006ba6c  ldr.w   r3, [r0, #0xa4]
0006ba70  ldr.w   r1, [pc, #0x48]
0006ba74  adds    r3, #1
0006ba76  str.w   r3, [r0, #0xa4]
0006ba7a  lsls    r3, r3, #3
0006ba7c  adds    r3, r3, r0
0006ba7e  add     r1, pc ; -> 0x0006fbc1  t_d_run_till_yes
0006ba80  str     r1, [r3, #4]
0006ba82  ldr.w   r3, [r0, #0xa4]
0006ba86  adds    r3, #1
0006ba88  str.w   r2, [r0, r3, lsl #3]
0006ba8c  mov     r0, r2
0006ba8e  bx      lr
0006ba90  movw    r3, #0x12ef
0006ba94  cmp     r2, r3
0006ba96  it      ne
0006ba98  mvnne   r0, #2
0006ba9c  bne     #0x6ba8e
0006ba9e  ldr     r2, [pc, #0x20]
0006baa0  lsls    r3, r1, #3
0006baa2  adds    r3, r3, r0
0006baa4  add     r2, pc ; -> 0x00070ea1  t_d_flip_punch_jump
0006baa6  str     r2, [r3, #4]
0006baa8  ldr.w   r3, [r0, #0xa4]
0006baac  movs    r2, #0
0006baae  adds    r3, #1
0006bab0  str.w   r2, [r0, r3, lsl #3]
0006bab4  mov     r0, r2
0006bab6  b       #0x6ba8e
0006bab8  adds    r5, #0x45
0006baba  movs    r0, r0
0006babc  asrs    r7, r7
0006babe  movs    r0, r0
0006bac0  strh    r1, [r7, r7]
0006bac2  movs    r0, r0
