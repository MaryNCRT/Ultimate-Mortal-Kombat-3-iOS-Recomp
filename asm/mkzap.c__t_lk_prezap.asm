========================================================================
t_lk_prezap  0x000770bc  340 bytes   mkzap.c
========================================================================

000770bc  push    {r4, r5, r6, r7, lr}
000770be  add     r7, sp, #0xc
000770c0  ldr.w   r3, [r0, #0xa4]
000770c4  mov     r4, r0
000770c6  ldr.w   r5, [r0, #0x108]
000770ca  adds    r3, #1
000770cc  ldr.w   r3, [r0, r3, lsl #3]
000770d0  cmp     r3, #0
000770d2  bne     #0x77124
000770d4  ldr.w   r1, [r0, #0xf8]
000770d8  ldr     r2, [r5, #0x4c]
000770da  lsls    r3, r1, #2
000770dc  adds    r3, r3, r0
000770de  str.w   r2, [r3, #0xa8]
000770e2  adds    r3, r1, #1
000770e4  str.w   r3, [r0, #0xf8]
000770e8  ldr     r1, [r5, #0x20]
000770ea  lsls    r2, r3, #2
000770ec  adds    r2, r2, r0
000770ee  adds    r3, #1
000770f0  str.w   r1, [r2, #0xa8]
000770f4  str.w   r3, [r0, #0xf8]
000770f8  ldr     r1, [r5, #0x24]
000770fa  lsls    r2, r3, #2
000770fc  adds    r2, r2, r0
000770fe  adds    r3, #1
00077100  str.w   r3, [r0, #0xf8]
00077104  mov     r0, r5
00077106  str.w   r1, [r2, #0xa8]
0007710a  bl      #0x59e24 ; -> do_next_a9_frame
0007710e  ldr.w   r3, [r4, #0xa4]
00077112  movw    r2, #0x9ef
00077116  movs    r0, #4
00077118  adds    r3, #1
0007711a  str.w   r2, [r4, r3, lsl #3]
0007711e  str.w   r0, [r4, #0xfc]
00077122  pop     {r4, r5, r6, r7, pc}
00077124  movw    r2, #0x9ef
00077128  cmp     r3, r2
0007712a  it      ne
0007712c  mvnne   r0, #2
00077130  bne     #0x77122
00077132  ldr.w   r3, [r4, #0xf8]
00077136  subs    r3, #1
00077138  str.w   r3, [r4, #0xf8]
0007713c  lsls    r3, r3, #2
0007713e  adds    r3, r3, r4
00077140  ldr.w   r3, [r3, #0xa8]
00077144  str     r3, [r5, #0x24]
00077146  ldr.w   r3, [r4, #0xf8]
0007714a  subs    r3, #1
0007714c  str.w   r3, [r4, #0xf8]
00077150  lsls    r3, r3, #2
00077152  adds    r3, r3, r4
00077154  ldr.w   r3, [r3, #0xa8]
00077158  str     r3, [r5, #0x20]
0007715a  ldr.w   r3, [r4, #0xf8]
0007715e  subs    r3, #1
00077160  str.w   r3, [r4, #0xf8]
00077164  lsls    r3, r3, #2
00077166  adds    r3, r3, r4
00077168  ldr.w   r3, [r3, #0xa8]
0007716c  str     r3, [r5, #0x4c]
0007716e  ldr     r3, [r5]
00077170  ldr     r3, [r3, #0x68]
00077172  cbz     r3, #0x771ce
00077174  ldr     r6, [r5, #8]
00077176  mov     r0, r5
00077178  str     r3, [r5, #8]
0007717a  movs    r3, #0x11
0007717c  str     r3, [r5, #0x1c]
0007717e  bl      #0x75f1c ; -> local_strike_check_box
00077182  ldr     r0, [r5, #0x5c]
00077184  str     r6, [r5, #8]
00077186  cbz     r0, #0x771ce
00077188  ldr.w   r3, [r4, #0xa4]
0007718c  cmp     r3, #0
0007718e  ble     #0x771ea
00077190  subs    r3, #1
00077192  str.w   r3, [r4, #0xa4]
00077196  ldr.w   r1, [r4, #0xa4]
0007719a  adds    r3, r1, #1
0007719c  lsls    r2, r3, #3
0007719e  adds    r2, r2, r4
000771a0  ldr     r0, [r2, #4]
000771a2  adds    r2, r3, #1
000771a4  ldr.w   r2, [r4, r2, lsl #3]
000771a8  str.w   r2, [r4, r3, lsl #3]
000771ac  lsls    r3, r1, #3
000771ae  adds    r3, r3, r4
000771b0  ldr     r2, [pc, #0x50]
000771b2  str     r0, [r3, #4]
000771b4  ldr.w   r3, [r4, #0xa4]
000771b8  add     r2, pc ; -> 0x00077a41  t_lk_prezap_hit
000771ba  lsls    r3, r3, #3
000771bc  adds    r3, r3, r4
000771be  movs    r0, #0
000771c0  str     r2, [r3, #4]
000771c2  ldr.w   r3, [r4, #0xa4]
000771c6  adds    r3, #1
000771c8  str.w   r0, [r4, r3, lsl #3]
000771cc  b       #0x77122
000771ce  ldr.w   r3, [r4, #0xa4]
000771d2  cmp     r3, #0
000771d4  ble     #0x771e0
000771d6  subs    r3, #1
000771d8  movs    r0, #0
000771da  str.w   r3, [r4, #0xa4]
000771de  b       #0x77122
000771e0  ldr.w   r2, [pc, #0x24]
000771e4  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000771e6  ldr     r2, [r2]
000771e8  b       #0x771ba
000771ea  ldr     r2, [pc, #0x20]
000771ec  lsls    r3, r3, #3
000771ee  adds    r3, r3, r4
000771f0  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000771f2  ldr     r2, [r2]
000771f4  str     r2, [r3, #4]
000771f6  ldr.w   r3, [r4, #0xa4]
000771fa  movs    r2, #0
000771fc  adds    r3, #1
000771fe  str.w   r2, [r4, r3, lsl #3]
00077202  b       #0x77196
00077204  lsrs    r5, r0, #2
00077206  movs    r0, r0
00077208  stm     r5!, {r5}
0007720a  movs    r7, r0
0007720c  stm     r5!, {r2, r4}
0007720e  movs    r7, r0
