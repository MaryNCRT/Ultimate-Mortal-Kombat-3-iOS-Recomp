========================================================================
t_joy_punch_htm2  0x0002f528  104 bytes   joy.c
========================================================================

0002f528  push    {r4, r5, r6, r7, lr}
0002f52a  add     r7, sp, #0xc
0002f52c  ldr.w   r3, [r0, #0xa4]
0002f530  mov     r5, r0
0002f532  ldr.w   r4, [r0, #0x108]
0002f536  adds    r3, #1
0002f538  ldr.w   r6, [r0, r3, lsl #3]
0002f53c  cmp     r6, #0
0002f53e  bne     #0x2f584
0002f540  mov     r0, r4
0002f542  movs    r3, #0xe
0002f544  str     r3, [r4, #0x40]
0002f546  bl      #0x55474 ; -> find_ani_part2
0002f54a  mov     r0, r4
0002f54c  bl      #0x55450 ; -> find_part2
0002f550  mov     r0, r4
0002f552  bl      #0x55450 ; -> find_part2
0002f556  mov     r0, r4
0002f558  bl      #0x55450 ; -> find_part2
0002f55c  mov     r0, r4
0002f55e  bl      #0x55450 ; -> find_part2
0002f562  mov     r0, r4
0002f564  bl      #0x55450 ; -> find_part2
0002f568  ldr.w   r3, [r5, #0xa4]
0002f56c  ldr     r2, [pc, #0x1c]
0002f56e  mov     r0, r6
0002f570  lsls    r3, r3, #3
0002f572  adds    r3, r3, r5
0002f574  add     r2, pc ; -> 0x00030a61  t_jmp4
0002f576  str     r2, [r3, #4]
0002f578  ldr.w   r3, [r5, #0xa4]
0002f57c  adds    r3, #1
0002f57e  str.w   r6, [r5, r3, lsl #3]
0002f582  pop     {r4, r5, r6, r7, pc}
0002f584  mvn     r0, #2
0002f588  b       #0x2f582
0002f58a  nop     
0002f58c  asrs    r1, r5, #0x13
0002f58e  movs    r0, r0
