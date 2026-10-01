========================================================================
t_d_sweep_kick  0x0006c820  192 bytes   mkdrone.c
========================================================================

0006c820  push    {r4, r5, r7, lr}
0006c822  add     r7, sp, #8
0006c824  ldr.w   r3, [r0, #0xa4]
0006c828  mov     r4, r0
0006c82a  ldr.w   r5, [r0, #0x108]
0006c82e  adds    r3, #1
0006c830  ldr.w   r0, [r0, r3, lsl #3]
0006c834  cbnz    r0, #0x6c860
0006c836  movw    r2, #0x271
0006c83a  str.w   r2, [r4, r3, lsl #3]
0006c83e  ldr.w   r3, [r4, #0xa4]
0006c842  adds    r2, r3, #1
0006c844  ldr     r3, [pc, #0x88]
0006c846  str.w   r2, [r4, #0xa4]
0006c84a  add     r3, pc ; -> 0x000f37dc  t_stat_do_sweep_kick
0006c84c  ldr     r1, [r3]
0006c84e  lsls    r3, r2, #3
0006c850  adds    r3, r3, r4
0006c852  str     r1, [r3, #4]
0006c854  ldr.w   r3, [r4, #0xa4]
0006c858  adds    r3, #1
0006c85a  str.w   r0, [r4, r3, lsl #3]
0006c85e  pop     {r4, r5, r7, pc}
0006c860  movw    r3, #0x271
0006c864  cmp     r0, r3
0006c866  it      ne
0006c868  mvnne   r0, #2
0006c86c  bne     #0x6c85e
0006c86e  mov     r0, r5
0006c870  bl      #0x6c7fc ; -> q_is_he_reacting
0006c874  cbnz    r0, #0x6c894
0006c876  ldr.w   r3, [pc, #0x5c]
0006c87a  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006c87c  ldr     r2, [r3]
0006c87e  ldr.w   r3, [r4, #0xa4]
0006c882  lsls    r3, r3, #3
0006c884  adds    r3, r3, r4
0006c886  str     r2, [r3, #4]
0006c888  ldr.w   r3, [r4, #0xa4]
0006c88c  adds    r3, #1
0006c88e  str.w   r0, [r4, r3, lsl #3]
0006c892  b       #0x6c85e
0006c894  ldr     r3, [pc, #0x40]
0006c896  mov.w   r2, #0x278
0006c89a  movs    r0, #0
0006c89c  add     r3, pc ; -> 0x00172508  funcs.7789
0006c89e  str     r3, [r5, #0x68]
0006c8a0  movs    r3, #2
0006c8a2  str     r3, [r5, #0x64]
0006c8a4  ldr.w   r3, [r4, #0xa4]
0006c8a8  adds    r3, #1
0006c8aa  str.w   r2, [r4, r3, lsl #3]
0006c8ae  ldr.w   r3, [r4, #0xa4]
0006c8b2  ldr     r2, [pc, #0x28]
0006c8b4  adds    r3, #1
0006c8b6  str.w   r3, [r4, #0xa4]
0006c8ba  lsls    r3, r3, #3
0006c8bc  adds    r3, r3, r4
0006c8be  add     r2, pc ; -> 0x00072e4d  t_random_do
0006c8c0  str     r2, [r3, #4]
0006c8c2  ldr.w   r3, [r4, #0xa4]
0006c8c6  adds    r3, #1
0006c8c8  str.w   r0, [r4, r3, lsl #3]
0006c8cc  b       #0x6c85e
0006c8ce  nop     
0006c8d0  ldr     r6, [r1, #0x78]
0006c8d2  movs    r0, r1
0006c8d4  ldr     r2, [r1, #0x68]
0006c8d6  movs    r0, r1
0006c8d8  ldrb    r0, [r5, r1]
0006c8da  movs    r0, r2
0006c8dc  str     r3, [r1, #0x58]
0006c8de  movs    r0, r0
