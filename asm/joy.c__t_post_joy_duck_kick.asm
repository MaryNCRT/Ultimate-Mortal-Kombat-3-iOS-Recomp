========================================================================
t_post_joy_duck_kick  0x000302d4  108 bytes   joy.c
========================================================================

000302d4  push    {r4, r5, r6, r7, lr}
000302d6  add     r7, sp, #0xc
000302d8  ldr.w   r3, [r0, #0xa4]
000302dc  mov     r4, r0
000302de  ldr.w   r6, [r0, #0x108]
000302e2  adds    r3, #1
000302e4  ldr.w   r5, [r0, r3, lsl #3]
000302e8  cbnz    r5, #0x30314
000302ea  mov     r0, r6
000302ec  bl      #0x55d94 ; -> joystick_in_a0
000302f0  ldr     r0, [r6, #0x1c]
000302f2  ands    r0, r0, #2
000302f6  beq     #0x3031a
000302f8  ldr.w   r3, [r4, #0xa4]
000302fc  ldr     r2, [pc, #0x38]
000302fe  mov     r0, r5
00030300  lsls    r3, r3, #3
00030302  adds    r3, r3, r4
00030304  add     r2, pc ; -> 0x0002ee31  t_joyd3
00030306  str     r2, [r3, #4]
00030308  ldr.w   r3, [r4, #0xa4]
0003030c  adds    r3, #1
0003030e  str.w   r5, [r4, r3, lsl #3]
00030312  b       #0x30318
00030314  mvn     r0, #2
00030318  pop     {r4, r5, r6, r7, pc}
0003031a  ldr.w   r3, [r4, #0xa4]
0003031e  ldr.w   r2, [pc, #0x1c]
00030322  lsls    r3, r3, #3
00030324  adds    r3, r3, r4
00030326  add     r2, pc ; -> 0x000305b1  t_joy_back_up
00030328  str     r2, [r3, #4]
0003032a  ldr.w   r3, [r4, #0xa4]
0003032e  adds    r3, #1
00030330  str.w   r0, [r4, r3, lsl #3]
00030334  b       #0x30318
00030336  nop     
