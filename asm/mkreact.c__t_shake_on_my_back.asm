========================================================================
t_shake_on_my_back  0x00042218  248 bytes   mkreact.c
========================================================================

00042218  push    {r4, r5, r7, lr}
0004221a  add     r7, sp, #8
0004221c  ldr.w   r3, [r0, #0xa4]
00042220  mov     r4, r0
00042222  ldr.w   r5, [r0, #0x108]
00042226  adds    r3, #1
00042228  ldr.w   r3, [r0, r3, lsl #3]
0004222c  cmp     r3, #0
0004222e  bne     #0x422ae
00042230  ldr.w   r1, [r0, #0xf8]
00042234  ldr     r2, [r5, #0x1c]
00042236  lsls    r3, r1, #2
00042238  adds    r3, r3, r0
0004223a  str.w   r2, [r3, #0xa8]
0004223e  adds    r3, r1, #1
00042240  str.w   r3, [r0, #0xf8]
00042244  mov     r0, r5
00042246  movs    r3, #0x1e
00042248  str     r3, [r5, #0x40]
0004224a  bl      #0x55474 ; -> find_ani_part2
0004224e  ldr     r3, [r5, #0x40]
00042250  str     r3, [r5, #0x48]
00042252  ldr     r3, [r5, #0x48]
00042254  movs    r0, #0
00042256  str     r3, [r5, #0x40]
00042258  ldr.w   r3, [r4, #0xf8]
0004225c  subs    r3, #1
0004225e  str.w   r3, [r4, #0xf8]
00042262  lsls    r3, r3, #2
00042264  adds    r3, r3, r4
00042266  ldr.w   r2, [r3, #0xa8]
0004226a  str     r2, [r5, #0x1c]
0004226c  ldr.w   r1, [r4, #0xf8]
00042270  lsls    r3, r1, #2
00042272  adds    r3, r3, r4
00042274  str.w   r2, [r3, #0xa8]
00042278  adds    r3, r1, #1
0004227a  str.w   r3, [r4, #0xf8]
0004227e  ldr.w   r3, [r4, #0xa4]
00042282  movw    r2, #0x158a
00042286  adds    r3, #1
00042288  str.w   r2, [r4, r3, lsl #3]
0004228c  ldr.w   r3, [r4, #0xa4]
00042290  adds    r2, r3, #1
00042292  ldr     r3, [pc, #0x74]
00042294  str.w   r2, [r4, #0xa4]
00042298  add     r3, pc ; -> 0x000f37cc  t_mframew
0004229a  ldr     r1, [r3]
0004229c  lsls    r3, r2, #3
0004229e  adds    r3, r3, r4
000422a0  str     r1, [r3, #4]
000422a2  ldr.w   r3, [r4, #0xa4]
000422a6  adds    r3, #1
000422a8  str.w   r0, [r4, r3, lsl #3]
000422ac  pop     {r4, r5, r7, pc}
000422ae  movw    r2, #0x158a
000422b2  cmp     r3, r2
000422b4  it      ne
000422b6  mvnne   r0, #2
000422ba  bne     #0x422ac
000422bc  ldr     r3, [r5, #0x44]
000422be  subs    r3, #1
000422c0  cmp     r3, #0
000422c2  str     r3, [r5, #0x44]
000422c4  bgt     #0x42252
000422c6  ldr.w   r3, [r4, #0xf8]
000422ca  subs    r3, #1
000422cc  str.w   r3, [r4, #0xf8]
000422d0  lsls    r3, r3, #2
000422d2  adds    r3, r3, r4
000422d4  ldr.w   r3, [r3, #0xa8]
000422d8  str     r3, [r5, #0x1c]
000422da  ldr.w   r3, [r4, #0xa4]
000422de  cmp     r3, #0
000422e0  ble     #0x422ec
000422e2  subs    r3, #1
000422e4  movs    r0, #0
000422e6  str.w   r3, [r4, #0xa4]
000422ea  b       #0x422ac
000422ec  ldr.w   r2, [pc, #0x1c]
000422f0  lsls    r3, r3, #3
000422f2  adds    r3, r3, r4
000422f4  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000422f6  movs    r0, #0
000422f8  ldr     r2, [r2]
000422fa  str     r2, [r3, #4]
000422fc  ldr.w   r3, [r4, #0xa4]
00042300  adds    r3, #1
00042302  str.w   r0, [r4, r3, lsl #3]
00042306  b       #0x422ac
00042308  asrs    r0, r6, #0x14
0004230a  movs    r3, r1
0004230c  asrs    r0, r2, #0x10
0004230e  movs    r3, r1
