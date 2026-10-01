========================================================================
t_run_then_duck_under  0x0006a5d4  132 bytes   mkdrone.c
========================================================================

0006a5d4  ldr.w   r1, [r0, #0xa4]
0006a5d8  ldr.w   ip, [r0, #0x108]
0006a5dc  adds    r3, r1, #1
0006a5de  ldr.w   r2, [r0, r3, lsl #3]
0006a5e2  cbnz    r2, #0x6a624
0006a5e4  movs    r3, #0x30
0006a5e6  str.w   r3, [ip, #0x44]
0006a5ea  ldr     r3, [pc, #0x60]
0006a5ec  movw    r1, #0xecf
0006a5f0  add     r3, pc ; -> 0x000701b9  q_run_then_duck
0006a5f2  str.w   r3, [ip, #0x48]
0006a5f6  ldr.w   r3, [r0, #0xa4]
0006a5fa  adds    r3, #1
0006a5fc  str.w   r1, [r0, r3, lsl #3]
0006a600  ldr.w   r3, [r0, #0xa4]
0006a604  ldr.w   r1, [pc, #0x48]
0006a608  adds    r3, #1
0006a60a  str.w   r3, [r0, #0xa4]
0006a60e  lsls    r3, r3, #3
0006a610  adds    r3, r3, r0
0006a612  add     r1, pc ; -> 0x0006fbc1  t_d_run_till_yes
0006a614  str     r1, [r3, #4]
0006a616  ldr.w   r3, [r0, #0xa4]
0006a61a  adds    r3, #1
0006a61c  str.w   r2, [r0, r3, lsl #3]
0006a620  mov     r0, r2
0006a622  bx      lr
0006a624  movw    r3, #0xecf
0006a628  cmp     r2, r3
0006a62a  it      ne
0006a62c  mvnne   r0, #2
0006a630  bne     #0x6a622
0006a632  ldr     r2, [pc, #0x20]
0006a634  lsls    r3, r1, #3
0006a636  adds    r3, r3, r0
0006a638  add     r2, pc ; -> 0x00070309  t_duck_under_proj
0006a63a  str     r2, [r3, #4]
0006a63c  ldr.w   r3, [r0, #0xa4]
0006a640  movs    r2, #0
0006a642  adds    r3, #1
0006a644  str.w   r2, [r0, r3, lsl #3]
0006a648  mov     r0, r2
0006a64a  b       #0x6a622
0006a64c  ldrh    r5, [r0, r7]
0006a64e  movs    r0, r0
0006a650  strb    r3, [r5, r6]
0006a652  movs    r0, r0
0006a654  ldrb    r5, [r1, r3]
0006a656  movs    r0, r0
