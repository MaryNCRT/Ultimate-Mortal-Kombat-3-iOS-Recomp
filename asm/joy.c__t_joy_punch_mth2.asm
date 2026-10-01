========================================================================
t_joy_punch_mth2  0x0002f5f0  104 bytes   joy.c
========================================================================

0002f5f0  push    {r4, r5, r6, r7, lr}
0002f5f2  add     r7, sp, #0xc
0002f5f4  ldr.w   r3, [r0, #0xa4]
0002f5f8  mov     r5, r0
0002f5fa  ldr.w   r4, [r0, #0x108]
0002f5fe  adds    r3, #1
0002f600  ldr.w   r6, [r0, r3, lsl #3]
0002f604  cmp     r6, #0
0002f606  bne     #0x2f64c
0002f608  mov     r0, r4
0002f60a  movs    r3, #0xf
0002f60c  str     r3, [r4, #0x40]
0002f60e  bl      #0x55474 ; -> find_ani_part2
0002f612  mov     r0, r4
0002f614  bl      #0x55450 ; -> find_part2
0002f618  mov     r0, r4
0002f61a  bl      #0x55450 ; -> find_part2
0002f61e  mov     r0, r4
0002f620  bl      #0x55450 ; -> find_part2
0002f624  mov     r0, r4
0002f626  bl      #0x55450 ; -> find_part2
0002f62a  mov     r0, r4
0002f62c  bl      #0x55450 ; -> find_part2
0002f630  ldr.w   r3, [r5, #0xa4]
0002f634  ldr     r2, [pc, #0x1c]
0002f636  mov     r0, r6
0002f638  lsls    r3, r3, #3
0002f63a  adds    r3, r3, r5
0002f63c  add     r2, pc ; -> 0x00030d69  t_jhp4
0002f63e  str     r2, [r3, #4]
0002f640  ldr.w   r3, [r5, #0xa4]
0002f644  adds    r3, #1
0002f646  str.w   r6, [r5, r3, lsl #3]
0002f64a  pop     {r4, r5, r6, r7, pc}
0002f64c  mvn     r0, #2
0002f650  b       #0x2f64a
0002f652  nop     
0002f654  asrs    r1, r5, #0x1c
0002f656  movs    r0, r0
