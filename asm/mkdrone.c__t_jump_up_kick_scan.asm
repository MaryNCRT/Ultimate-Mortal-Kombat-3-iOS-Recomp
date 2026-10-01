========================================================================
t_jump_up_kick_scan  0x000706e8  112 bytes   mkdrone.c
========================================================================

000706e8  push    {r4, r5, r6, r7, lr}
000706ea  add     r7, sp, #0xc
000706ec  ldr.w   r3, [r0, #0xa4]
000706f0  mov     r4, r0
000706f2  ldr.w   r5, [r0, #0x108]
000706f6  adds    r3, #1
000706f8  ldr.w   r6, [r0, r3, lsl #3]
000706fc  cbnz    r6, #0x7071c
000706fe  mov     r0, r5
00070700  bl      #0x2f3a0 ; -> get_x_dist
00070704  ldr     r0, [r5, #0x28]
00070706  cmp     r0, #0x90
00070708  ble     #0x70722
0007070a  ldr.w   r3, [r4, #0xa4]
0007070e  cmp     r3, #0
00070710  ble     #0x70746
00070712  subs    r3, #1
00070714  mov     r0, r6
00070716  str.w   r3, [r4, #0xa4]
0007071a  b       #0x70720
0007071c  mvn     r0, #2
00070720  pop     {r4, r5, r6, r7, pc}
00070722  mov     r0, r4
00070724  bl      #0x2ebdc ; -> reset_proc_stack
00070728  ldr     r3, [pc, #0x24]
0007072a  add     r3, pc ; -> 0x000f38b0  t_do_jumpup_kick
0007072c  ldr     r2, [r3]
0007072e  ldr.w   r3, [r4, #0xa4]
00070732  lsls    r3, r3, #3
00070734  adds    r3, r3, r4
00070736  mov     r0, r6
00070738  str     r2, [r3, #4]
0007073a  ldr.w   r3, [r4, #0xa4]
0007073e  adds    r3, #1
00070740  str.w   r6, [r4, r3, lsl #3]
00070744  b       #0x70720
00070746  ldr     r2, [pc, #0xc]
00070748  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0007074a  ldr     r2, [r2]
0007074c  b       #0x70732
0007074e  nop     
00070750  adds    r1, #0x82
00070752  movs    r0, r1
00070754  cmp     r7, #0xbc
00070756  movs    r0, r1
