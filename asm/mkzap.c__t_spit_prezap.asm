========================================================================
t_spit_prezap  0x00077210  232 bytes   mkzap.c
========================================================================

00077210  push    {r4, r5, r7, lr}
00077212  add     r7, sp, #8
00077214  ldr.w   r3, [r0, #0xa4]
00077218  mov     r4, r0
0007721a  ldr.w   r5, [r0, #0x108]
0007721e  adds    r3, #1
00077220  ldr.w   r3, [r0, r3, lsl #3]
00077224  cbnz    r3, #0x77266
00077226  ldr.w   r1, [r0, #0xf8]
0007722a  ldr     r2, [r5, #0x20]
0007722c  lsls    r3, r1, #2
0007722e  adds    r3, r3, r0
00077230  str.w   r2, [r3, #0xa8]
00077234  adds    r3, r1, #1
00077236  str.w   r3, [r0, #0xf8]
0007723a  ldr     r1, [r5, #0x24]
0007723c  lsls    r2, r3, #2
0007723e  adds    r2, r2, r0
00077240  adds    r3, #1
00077242  str.w   r3, [r0, #0xf8]
00077246  mov     r0, r5
00077248  str.w   r1, [r2, #0xa8]
0007724c  bl      #0x59e24 ; -> do_next_a9_frame
00077250  ldr.w   r3, [r4, #0xa4]
00077254  movw    r2, #0x477
00077258  movs    r0, #2
0007725a  adds    r3, #1
0007725c  str.w   r2, [r4, r3, lsl #3]
00077260  str.w   r0, [r4, #0xfc]
00077264  pop     {r4, r5, r7, pc}
00077266  movw    r2, #0x477
0007726a  cmp     r3, r2
0007726c  it      ne
0007726e  mvnne   r0, #2
00077272  bne     #0x77264
00077274  ldr.w   r3, [r4, #0xf8]
00077278  mov     r0, r5
0007727a  subs    r3, #1
0007727c  str.w   r3, [r4, #0xf8]
00077280  lsls    r3, r3, #2
00077282  adds    r3, r3, r4
00077284  ldr.w   r3, [r3, #0xa8]
00077288  str     r3, [r5, #0x24]
0007728a  ldr.w   r3, [r4, #0xf8]
0007728e  subs    r3, #1
00077290  str.w   r3, [r4, #0xf8]
00077294  lsls    r3, r3, #2
00077296  adds    r3, r3, r4
00077298  ldr.w   r3, [r3, #0xa8]
0007729c  str     r3, [r5, #0x20]
0007729e  movs    r3, #0x12
000772a0  str     r3, [r5, #0x1c]
000772a2  bl      #0x75f1c ; -> local_strike_check_box
000772a6  ldr     r0, [r5, #0x5c]
000772a8  cbnz    r0, #0x772ba
000772aa  ldr.w   r3, [r4, #0xa4]
000772ae  cmp     r3, #0
000772b0  ble     #0x772d6
000772b2  subs    r3, #1
000772b4  str.w   r3, [r4, #0xa4]
000772b8  b       #0x77264
000772ba  ldr.w   r3, [r4, #0xa4]
000772be  ldr     r2, [pc, #0x30]
000772c0  movs    r0, #0
000772c2  lsls    r3, r3, #3
000772c4  adds    r3, r3, r4
000772c6  add     r2, pc ; -> 0x0007bb09  spit_prezap_hit
000772c8  str     r2, [r3, #4]
000772ca  ldr.w   r3, [r4, #0xa4]
000772ce  adds    r3, #1
000772d0  str.w   r0, [r4, r3, lsl #3]
000772d4  b       #0x77264
000772d6  ldr     r2, [pc, #0x1c]
000772d8  lsls    r3, r3, #3
000772da  adds    r3, r3, r4
000772dc  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000772de  ldr     r2, [r2]
000772e0  str     r2, [r3, #4]
000772e2  ldr.w   r3, [r4, #0xa4]
000772e6  adds    r3, #1
000772e8  str.w   r0, [r4, r3, lsl #3]
000772ec  b       #0x77264
000772ee  nop     
000772f0  ldr     r0, [pc, #0xfc]
000772f2  movs    r0, r0
000772f4  stm     r4!, {r3, r5}
000772f6  movs    r7, r0
