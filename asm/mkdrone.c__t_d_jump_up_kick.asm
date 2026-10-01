========================================================================
t_d_jump_up_kick  0x000675b0  132 bytes   mkdrone.c
========================================================================

000675b0  ldr.w   r1, [r0, #0xa4]
000675b4  ldr.w   ip, [r0, #0x108]
000675b8  adds    r3, r1, #1
000675ba  ldr.w   r2, [r0, r3, lsl #3]
000675be  cbnz    r2, #0x67600
000675c0  ldr     r3, [pc, #0x64]
000675c2  mov.w   r1, #0x156
000675c6  add     r3, pc ; -> 0x000706e9  t_jump_up_kick_scan
000675c8  str.w   r3, [ip, #0x48]
000675cc  ldr.w   r3, [r0, #0xa4]
000675d0  adds    r3, #1
000675d2  str.w   r1, [r0, r3, lsl #3]
000675d6  ldr.w   r3, [r0, #0xa4]
000675da  adds    r1, r3, #1
000675dc  ldr.w   r3, [pc, #0x4c]
000675e0  str.w   r1, [r0, #0xa4]
000675e4  add     r3, pc ; -> 0x000f3854  t_do_jump_up
000675e6  ldr.w   ip, [r3]
000675ea  lsls    r3, r1, #3
000675ec  adds    r3, r3, r0
000675ee  str.w   ip, [r3, #4]
000675f2  ldr.w   r3, [r0, #0xa4]
000675f6  adds    r3, #1
000675f8  str.w   r2, [r0, r3, lsl #3]
000675fc  mov     r0, r2
000675fe  bx      lr
00067600  cmp.w   r2, #0x156
00067604  it      ne
00067606  mvnne   r0, #2
0006760a  bne     #0x675fe
0006760c  ldr     r3, [pc, #0x20]
0006760e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00067610  ldr     r2, [r3]
00067612  lsls    r3, r1, #3
00067614  adds    r3, r3, r0
00067616  str     r2, [r3, #4]
00067618  ldr.w   r3, [r0, #0xa4]
0006761c  movs    r2, #0
0006761e  adds    r3, #1
00067620  str.w   r2, [r0, r3, lsl #3]
00067624  mov     r0, r2
00067626  b       #0x675fe
00067628  str     r1, [sp, #0x7c]
0006762a  movs    r0, r0
0006762c  stm     r2!, {r2, r3, r5, r6}
0006762e  movs    r0, r1
00067630  stm     r0!, {r1, r2, r4, r5, r6, r7}
00067632  movs    r0, r1
