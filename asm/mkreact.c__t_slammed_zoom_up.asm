========================================================================
t_slammed_zoom_up  0x00044574  152 bytes   mkreact.c
========================================================================

00044574  push    {r4, r5, r7, lr}
00044576  add     r7, sp, #8
00044578  ldr.w   r3, [r0, #0xa4]
0004457c  mov     r5, r0
0004457e  ldr.w   r4, [r0, #0x108]
00044582  adds    r3, #1
00044584  ldr.w   r3, [r0, r3, lsl #3]
00044588  cbnz    r3, #0x445b8
0004458a  ldr     r2, [r4, #8]
0004458c  ldr     r3, [pc, #0x74]
0004458e  str     r3, [r4, #0x20]
00044590  sub.w   r3, r3, #0x10000
00044594  str     r3, [r2, #0x1c]
00044596  ldr     r2, [r4, #8]
00044598  ldr     r3, [r4, #0x20]
0004459a  str     r3, [r2, #0x20]
0004459c  ldr     r3, [r4, #0x44]
0004459e  movw    r2, #0x1c3
000445a2  str     r3, [r4, #0x1c]
000445a4  ldr.w   r3, [r0, #0xa4]
000445a8  adds    r3, #1
000445aa  str.w   r2, [r0, r3, lsl #3]
000445ae  ldr     r3, [r4, #0x1c]
000445b0  str.w   r3, [r0, #0xfc]
000445b4  ldr     r0, [r4, #0x1c]
000445b6  pop     {r4, r5, r7, pc}
000445b8  movw    r2, #0x1c3
000445bc  cmp     r3, r2
000445be  it      ne
000445c0  mvnne   r0, #2
000445c4  bne     #0x445b6
000445c6  mov     r0, r4
000445c8  movs    r3, #0x1e
000445ca  str     r3, [r4, #0x40]
000445cc  bl      #0x55474 ; -> find_ani_part2
000445d0  mov     r0, r4
000445d2  bl      #0x59e24 ; -> do_next_a9_frame
000445d6  ldr.w   r3, [r5, #0xa4]
000445da  cmp     r3, #0
000445dc  ble     #0x445e8
000445de  subs    r3, #1
000445e0  movs    r0, #0
000445e2  str.w   r3, [r5, #0xa4]
000445e6  b       #0x445b6
000445e8  ldr     r2, [pc, #0x1c]
000445ea  lsls    r3, r3, #3
000445ec  adds    r3, r3, r5
000445ee  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000445f0  movs    r0, #0
000445f2  ldr     r2, [r2]
000445f4  str     r2, [r3, #4]
000445f6  ldr.w   r3, [r5, #0xa4]
000445fa  adds    r3, #1
000445fc  str.w   r0, [r5, r3, lsl #3]
00044600  b       #0x445b6
00044602  nop     
00044604  movs    r0, r0
00044606  vsra.u32 d31, d6, #3
0004460a  movs    r2, r1
