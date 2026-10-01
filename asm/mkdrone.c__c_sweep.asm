========================================================================
c_sweep  0x0006eb18  172 bytes   mkdrone.c
========================================================================

0006eb18  push    {r4, r5, r7, lr}
0006eb1a  add     r7, sp, #8
0006eb1c  ldr.w   r3, [r0, #0xa4]
0006eb20  mov     r4, r0
0006eb22  ldr.w   r5, [r0, #0x108]
0006eb26  adds    r3, #1
0006eb28  ldr.w   r0, [r0, r3, lsl #3]
0006eb2c  cbz     r0, #0x6eb34
0006eb2e  mvn     r0, #2
0006eb32  pop     {r4, r5, r7, pc}
0006eb34  ldr     r3, [pc, #0x74]
0006eb36  add     r3, pc ; -> 0x000f357c  G
0006eb38  ldr     r3, [r3]
0006eb3a  ldrsh.w r3, [r3, #0x44c]
0006eb3e  cmp     r3, #2
0006eb40  str     r3, [r5, #0x1c]
0006eb42  ble     #0x6eb5a
0006eb44  ldr     r3, [r5]
0006eb46  movw    r2, #0x507
0006eb4a  ldr     r3, [r3, #0x18]
0006eb4c  cmp     r3, r2
0006eb4e  str     r3, [r5, #0x1c]
0006eb50  beq     #0x6eba0
0006eb52  movw    r2, #0x309
0006eb56  cmp     r3, r2
0006eb58  beq     #0x6eba6
0006eb5a  mov     r0, r5
0006eb5c  bl      #0x6e9c4 ; -> q_will_he_reach_me
0006eb60  ldr     r0, [r5, #0x5c]
0006eb62  cbnz    r0, #0x6eb7e
0006eb64  ldr     r2, [pc, #0x48]
0006eb66  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006eb68  ldr.w   r3, [r4, #0xa4]
0006eb6c  lsls    r3, r3, #3
0006eb6e  adds    r3, r3, r4
0006eb70  str     r2, [r3, #4]
0006eb72  ldr.w   r3, [r4, #0xa4]
0006eb76  adds    r3, #1
0006eb78  str.w   r0, [r4, r3, lsl #3]
0006eb7c  b       #0x6eb32
0006eb7e  ldr     r3, [pc, #0x34]
0006eb80  ldr     r2, [pc, #0x34]
0006eb82  movs    r0, #0
0006eb84  add     r3, pc ; -> 0x001723a0  funcs.13831
0006eb86  str     r3, [r5, #0x68]
0006eb88  ldr.w   r3, [r4, #0xa4]
0006eb8c  add     r2, pc ; -> 0x0006c5ad  t_react_jump_table_act
0006eb8e  lsls    r3, r3, #3
0006eb90  adds    r3, r3, r4
0006eb92  str     r2, [r3, #4]
0006eb94  ldr.w   r3, [r4, #0xa4]
0006eb98  adds    r3, #1
0006eb9a  str.w   r0, [r4, r3, lsl #3]
0006eb9e  b       #0x6eb32
0006eba0  ldr     r2, [pc, #0x18]
0006eba2  add     r2, pc ; -> 0x00070f71  t_av_sweep
0006eba4  b       #0x6eb68
0006eba6  ldr     r2, [pc, #0x18]
0006eba8  add     r2, pc ; -> 0x00070f71  t_av_sweep
0006ebaa  b       #0x6eb68
0006ebac  ldr     r2, [pc, #0x108]
0006ebae  movs    r0, r1
0006ebb0  bvs     #0x6ebea
0006ebb2  vqshrun.s64 d19, q4, #1
0006ebb6  movs    r0, r2
0006ebb8  bge     #0x6ebf6
