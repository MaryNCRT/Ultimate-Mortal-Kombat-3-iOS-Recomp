========================================================================
t_block_shake_wake  0x00041e04  68 bytes   mkreact.c
========================================================================

00041e04  ldr.w   r2, [r0, #0xa4]
00041e08  adds    r3, r2, #1
00041e0a  ldr.w   r1, [r0, r3, lsl #3]
00041e0e  cbz     r1, #0x41e16
00041e10  mvn     r0, #2
00041e14  bx      lr
00041e16  cmp     r2, #0
00041e18  ble     #0x41e24
00041e1a  subs    r3, r2, #1
00041e1c  str.w   r3, [r0, #0xa4]
00041e20  mov     r0, r1
00041e22  b       #0x41e14
00041e24  ldr     r3, [pc, #0x1c]
00041e26  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00041e28  ldr.w   ip, [r3]
00041e2c  lsls    r3, r2, #3
00041e2e  adds    r3, r3, r0
00041e30  str.w   ip, [r3, #4]
00041e34  ldr.w   r3, [r0, #0xa4]
00041e38  adds    r3, #1
00041e3a  str.w   r1, [r0, r3, lsl #3]
00041e3e  mov     r0, r1
00041e40  b       #0x41e14
00041e42  nop     
00041e44  adds    r6, r3, r3
00041e46  movs    r3, r1
