========================================================================
t_block_shake_ani  0x0004445c  100 bytes   mkreact.c
========================================================================

0004445c  push    {r4, r5, r7, lr}
0004445e  add     r7, sp, #8
00044460  ldr.w   r1, [r0, #0xa4]
00044464  mov     r4, r0
00044466  ldr.w   r5, [r0, #0x108]
0004446a  adds    r3, r1, #1
0004446c  ldr.w   r3, [r0, r3, lsl #3]
00044470  cbnz    r3, #0x44494
00044472  mov     r0, r5
00044474  bl      #0x59e24 ; -> do_next_a9_frame
00044478  ldr     r3, [r5, #0x48]
0004447a  movw    r2, #0x1436
0004447e  str     r3, [r5, #0x1c]
00044480  ldr.w   r3, [r4, #0xa4]
00044484  adds    r3, #1
00044486  str.w   r2, [r4, r3, lsl #3]
0004448a  ldr     r3, [r5, #0x1c]
0004448c  str.w   r3, [r4, #0xfc]
00044490  ldr     r0, [r5, #0x1c]
00044492  pop     {r4, r5, r7, pc}
00044494  movw    r2, #0x1436
00044498  cmp     r3, r2
0004449a  it      ne
0004449c  mvnne   r0, #2
000444a0  bne     #0x44492
000444a2  ldr     r2, [pc, #0x18]
000444a4  lsls    r3, r1, #3
000444a6  adds    r3, r3, r4
000444a8  add     r2, pc ; -> 0x00041e05  t_block_shake_wake
000444aa  str     r2, [r3, #4]
000444ac  ldr.w   r3, [r4, #0xa4]
000444b0  movs    r0, #0
000444b2  adds    r3, #1
000444b4  str.w   r0, [r4, r3, lsl #3]
000444b8  b       #0x44492
000444ba  nop     
000444bc  bls     #0x44572
