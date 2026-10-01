========================================================================
t_net_struggle  0x0004416c  80 bytes   mkreact.c
========================================================================

0004416c  push    {r4, r5, r7, lr}
0004416e  add     r7, sp, #8
00044170  mov     r4, r0
00044172  ldr.w   r3, [r4, #0xa4]
00044176  ldr.w   r0, [r0, #0x108]
0004417a  adds    r3, #1
0004417c  ldr.w   r5, [r4, r3, lsl #3]
00044180  cbnz    r5, #0x44198
00044182  bl      #0x5a680 ; -> next_anirate
00044186  ldr.w   r3, [r4, #0xa4]
0004418a  cmp     r3, #0
0004418c  ble     #0x4419e
0004418e  subs    r3, #1
00044190  mov     r0, r5
00044192  str.w   r3, [r4, #0xa4]
00044196  b       #0x4419c
00044198  mvn     r0, #2
0004419c  pop     {r4, r5, r7, pc}
0004419e  ldr     r2, [pc, #0x18]
000441a0  lsls    r3, r3, #3
000441a2  adds    r3, r3, r4
000441a4  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000441a6  mov     r0, r5
000441a8  ldr     r2, [r2]
000441aa  str     r2, [r3, #4]
000441ac  ldr.w   r3, [r4, #0xa4]
000441b0  adds    r3, #1
000441b2  str.w   r5, [r4, r3, lsl #3]
000441b6  b       #0x4419c
000441b8  sbc     r0, r0, #0x8a0000
