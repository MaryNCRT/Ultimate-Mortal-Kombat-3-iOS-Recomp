========================================================================
t_mframew_5  0x000a56a0  144 bytes   mkfriend.c
========================================================================

000a56a0  ldr.w   r2, [r0, #0xa4]
000a56a4  ldr.w   ip, [r0, #0x108]
000a56a8  adds    r3, r2, #1
000a56aa  ldr.w   r1, [r0, r3, lsl #3]
000a56ae  cbnz    r1, #0xa56ec
000a56b0  movs    r3, #5
000a56b2  str.w   r3, [ip, #0x1c]
000a56b6  ldr.w   r3, [r0, #0xa4]
000a56ba  movw    r2, #0x7d7
000a56be  adds    r3, #1
000a56c0  str.w   r2, [r0, r3, lsl #3]
000a56c4  ldr.w   r3, [r0, #0xa4]
000a56c8  adds    r2, r3, #1
000a56ca  ldr     r3, [pc, #0x5c]
000a56cc  str.w   r2, [r0, #0xa4]
000a56d0  add     r3, pc ; -> 0x000f37cc  t_mframew
000a56d2  ldr.w   ip, [r3]
000a56d6  lsls    r3, r2, #3
000a56d8  adds    r3, r3, r0
000a56da  str.w   ip, [r3, #4]
000a56de  ldr.w   r3, [r0, #0xa4]
000a56e2  adds    r3, #1
000a56e4  str.w   r1, [r0, r3, lsl #3]
000a56e8  mov     r0, r1
000a56ea  bx      lr
000a56ec  movw    r3, #0x7d7
000a56f0  cmp     r1, r3
000a56f2  it      ne
000a56f4  mvnne   r0, #2
000a56f8  bne     #0xa56ea
000a56fa  cmp     r2, #0
000a56fc  ble     #0xa5708
000a56fe  subs    r3, r2, #1
000a5700  str.w   r3, [r0, #0xa4]
000a5704  movs    r0, #0
000a5706  b       #0xa56ea
000a5708  ldr.w   r3, [pc, #0x20]
000a570c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a570e  ldr     r1, [r3]
000a5710  lsls    r3, r2, #3
000a5712  adds    r3, r3, r0
000a5714  str     r1, [r3, #4]
000a5716  ldr.w   r3, [r0, #0xa4]
000a571a  movs    r1, #0
000a571c  adds    r3, #1
000a571e  str.w   r1, [r0, r3, lsl #3]
000a5722  mov     r0, r1
000a5724  b       #0xa56ea
000a5726  nop     
000a5728  b       #0xa591c
000a572a  movs    r4, r0
000a572c  svc     #0xf8
000a572e  movs    r4, r0
