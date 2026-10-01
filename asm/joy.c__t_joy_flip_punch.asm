========================================================================
t_joy_flip_punch  0x0002efdc  120 bytes   joy.c
========================================================================

0002efdc  push    {r4, r5, r7, lr}
0002efde  add     r7, sp, #8
0002efe0  mov     r4, r0
0002efe2  ldr.w   r2, [r4, #0xa4]
0002efe6  ldr.w   r0, [r0, #0x108]
0002efea  adds    r3, r2, #1
0002efec  ldr.w   r5, [r4, r3, lsl #3]
0002eff0  cbnz    r5, #0x2f028
0002eff2  bl      #0x2ec68 ; -> disable_all_buttons
0002eff6  ldr.w   r3, [r4, #0xa4]
0002effa  mov.w   r2, #0x1d0
0002effe  mov     r0, r5
0002f000  adds    r3, #1
0002f002  str.w   r2, [r4, r3, lsl #3]
0002f006  ldr.w   r3, [r4, #0xa4]
0002f00a  adds    r2, r3, #1
0002f00c  ldr     r3, [pc, #0x3c]
0002f00e  str.w   r2, [r4, #0xa4]
0002f012  add     r3, pc ; -> 0x000f37e4  t_do_flip_punch
0002f014  ldr     r1, [r3]
0002f016  lsls    r3, r2, #3
0002f018  adds    r3, r3, r4
0002f01a  str     r1, [r3, #4]
0002f01c  ldr.w   r3, [r4, #0xa4]
0002f020  adds    r3, #1
0002f022  str.w   r5, [r4, r3, lsl #3]
0002f026  pop     {r4, r5, r7, pc}
0002f028  cmp.w   r5, #0x1d0
0002f02c  it      ne
0002f02e  mvnne   r0, #2
0002f032  bne     #0x2f026
0002f034  ldr     r1, [pc, #0x18]
0002f036  lsls    r3, r2, #3
0002f038  adds    r3, r3, r4
0002f03a  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0002f03c  str     r1, [r3, #4]
0002f03e  ldr.w   r3, [r4, #0xa4]
0002f042  movs    r0, #0
0002f044  adds    r3, #1
0002f046  str.w   r0, [r4, r3, lsl #3]
0002f04a  b       #0x2f026
0002f04c  blxns   sb
0002f04e  movs    r4, r1
0002f050  asrs    r3, r4, #0x20
0002f052  movs    r0, r0
