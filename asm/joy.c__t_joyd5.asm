========================================================================
t_joyd5  0x000303f0  200 bytes   joy.c
========================================================================

000303f0  push    {r4, r5, r6, r7, lr}
000303f2  add     r7, sp, #0xc
000303f4  ldr.w   r3, [r0, #0xa4]
000303f8  mov     r4, r0
000303fa  ldr.w   r5, [r0, #0x108]
000303fe  adds    r3, #1
00030400  ldr.w   r6, [r0, r3, lsl #3]
00030404  cbnz    r6, #0x30432
00030406  mov     r0, r5
00030408  bl      #0x2ec94 ; -> inc_downcount
0003040c  mov     r0, r5
0003040e  bl      #0x2eca8 ; -> check_block_bit
00030412  cmp     r0, #0
00030414  beq     #0x30488
00030416  ldr.w   r3, [r4, #0xa4]
0003041a  ldr     r2, [pc, #0x8c]
0003041c  mov     r0, r6
0003041e  lsls    r3, r3, #3
00030420  adds    r3, r3, r4
00030422  add     r2, pc ; -> 0x0002f221  t_joy_duck_block
00030424  str     r2, [r3, #4]
00030426  ldr.w   r3, [r4, #0xa4]
0003042a  adds    r3, #1
0003042c  str.w   r6, [r4, r3, lsl #3]
00030430  pop     {r4, r5, r6, r7, pc}
00030432  movw    r3, #0x16f
00030436  cmp     r6, r3
00030438  it      ne
0003043a  mvnne   r0, #2
0003043e  bne     #0x30430
00030440  mov     r0, r5
00030442  bl      #0x55d94 ; -> joystick_in_a0
00030446  ldr     r0, [r5, #0x1c]
00030448  ands    r0, r0, #2
0003044c  bne     #0x3046a
0003044e  ldr.w   r2, [pc, #0x5c]
00030452  ldr.w   r3, [r4, #0xa4]
00030456  add     r2, pc ; -> 0x000305b1  t_joy_back_up
00030458  lsls    r3, r3, #3
0003045a  adds    r3, r3, r4
0003045c  str     r2, [r3, #4]
0003045e  ldr.w   r3, [r4, #0xa4]
00030462  adds    r3, #1
00030464  str.w   r0, [r4, r3, lsl #3]
00030468  b       #0x30430
0003046a  ldr.w   r3, [r4, #0xa4]
0003046e  ldr.w   r2, [pc, #0x40]
00030472  movs    r0, #0
00030474  lsls    r3, r3, #3
00030476  adds    r3, r3, r4
00030478  add     r2, pc ; -> 0x0002fad5  t_joyd4
0003047a  str     r2, [r3, #4]
0003047c  ldr.w   r3, [r4, #0xa4]
00030480  adds    r3, #1
00030482  str.w   r0, [r4, r3, lsl #3]
00030486  b       #0x30430
00030488  ldr.w   r3, [r4, #0xa4]
0003048c  movw    r2, #0x16f
00030490  adds    r3, #1
00030492  str.w   r2, [r4, r3, lsl #3]
00030496  ldr.w   r2, [pc, #0x1c]
0003049a  ldr.w   r3, [r4, #0xa4]
0003049e  add     r2, pc ; -> 0x0002ecd5  t_check_winner_status
000304a0  adds    r3, #1
000304a2  str.w   r3, [r4, #0xa4]
000304a6  b       #0x30458
000304a8  ldcl    p15, c15, [fp, #0x3fc]!
000304ac  lsls    r7, r2, #5
000304ae  movs    r0, r0
000304b0  bl      #0xffe8a4b2
