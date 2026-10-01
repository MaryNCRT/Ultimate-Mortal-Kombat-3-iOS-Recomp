========================================================================
t_slammed_slam_down  0x000470dc  148 bytes   mkreact.c
========================================================================

000470dc  push    {r4, r5, r7, lr}
000470de  add     r7, sp, #8
000470e0  ldr.w   r3, [r0, #0xa4]
000470e4  mov     r5, r0
000470e6  ldr.w   r4, [r0, #0x108]
000470ea  adds    r3, #1
000470ec  ldr.w   r3, [r0, r3, lsl #3]
000470f0  cbnz    r3, #0x47112
000470f2  ldr     r0, [r4, #8]
000470f4  mov.w   r3, #0x80000
000470f8  str     r3, [r4, #0x20]
000470fa  str     r3, [r0, #0x20]
000470fc  ldr.w   r3, [r5, #0xa4]
00047100  movw    r2, #0x1cf
00047104  movs    r0, #1
00047106  adds    r3, #1
00047108  str.w   r2, [r5, r3, lsl #3]
0004710c  str.w   r0, [r5, #0xfc]
00047110  pop     {r4, r5, r7, pc}
00047112  movw    r2, #0x1cf
00047116  cmp     r3, r2
00047118  it      ne
0004711a  mvnne   r0, #2
0004711e  bne     #0x47110
00047120  ldr     r3, [r4, #8]
00047122  ldrsh.w r2, [r3, #0x12]
00047126  ldr     r3, [r4]
00047128  str     r2, [r4, #0x1c]
0004712a  ldr     r3, [r3, #0x40]
0004712c  cmp     r3, r2
0004712e  str     r3, [r4, #0x20]
00047130  bgt     #0x470fc
00047132  mov     r0, r4
00047134  bl      #0x55c04 ; -> stop_me_player
00047138  mov     r0, r4
0004713a  bl      #0x5533c ; -> ground_player
0004713e  ldr.w   r3, [r5, #0xa4]
00047142  cmp     r3, #0
00047144  ble     #0x47150
00047146  subs    r3, #1
00047148  movs    r0, #0
0004714a  str.w   r3, [r5, #0xa4]
0004714e  b       #0x47110
00047150  ldr     r2, [pc, #0x18]
00047152  lsls    r3, r3, #3
00047154  adds    r3, r3, r5
00047156  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00047158  movs    r0, #0
0004715a  ldr     r2, [r2]
0004715c  str     r2, [r3, #4]
0004715e  ldr.w   r3, [r5, #0xa4]
00047162  adds    r3, #1
00047164  str.w   r0, [r5, r3, lsl #3]
00047168  b       #0x47110
0004716a  nop     
0004716c  stm     r5!, {r1, r2, r3, r5, r7}
0004716e  movs    r2, r1
