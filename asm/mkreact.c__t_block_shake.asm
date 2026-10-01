========================================================================
t_block_shake  0x00044750  208 bytes   mkreact.c
========================================================================

00044750  push    {r4, r5, r6, r7, lr}
00044752  add     r7, sp, #0xc
00044754  ldr.w   r3, [r0, #0xa4]
00044758  mov     r4, r0
0004475a  ldr.w   r5, [r0, #0x108]
0004475e  adds    r2, r3, #1
00044760  ldr.w   r3, [r0, r2, lsl #3]
00044764  cmp.w   r3, #0x1440
00044768  beq     #0x447de
0004476a  movw    r2, #0x1441
0004476e  cmp     r3, r2
00044770  beq     #0x447b6
00044772  cbnz    r3, #0x447b0
00044774  mov     r0, r5
00044776  bl      #0x5520c ; -> get_char_ani
0004477a  ldr     r3, [r5, #0x40]
0004477c  adds    r3, #4
0004477e  str     r3, [r5, #0x40]
00044780  ldr.w   r3, [r4, #0xa4]
00044784  mov.w   r2, #0x1440
00044788  adds    r3, #1
0004478a  str.w   r2, [r4, r3, lsl #3]
0004478e  ldr     r2, [pc, #0x84]
00044790  ldr.w   r3, [r4, #0xa4]
00044794  add     r2, pc ; -> 0x0004445d  t_block_shake_ani
00044796  adds    r3, #1
00044798  str.w   r3, [r4, #0xa4]
0004479c  lsls    r3, r3, #3
0004479e  adds    r3, r3, r4
000447a0  movs    r0, #0
000447a2  str     r2, [r3, #4]
000447a4  ldr.w   r3, [r4, #0xa4]
000447a8  adds    r3, #1
000447aa  str.w   r0, [r4, r3, lsl #3]
000447ae  b       #0x447b4
000447b0  mvn     r0, #2
000447b4  pop     {r4, r5, r6, r7, pc}
000447b6  ldr     r3, [r5, #0x40]
000447b8  subs    r3, #8
000447ba  str     r3, [r5, #0x40]
000447bc  ldr     r3, [r5, #0x44]
000447be  subs    r6, r3, #1
000447c0  str     r6, [r5, #0x44]
000447c2  cmp     r6, #0
000447c4  bne     #0x44780
000447c6  mov     r0, r5
000447c8  bl      #0x55c04 ; -> stop_me_player
000447cc  ldr.w   r3, [r4, #0xa4]
000447d0  cmp     r3, #0
000447d2  ble     #0x447f6
000447d4  subs    r3, #1
000447d6  mov     r0, r6
000447d8  str.w   r3, [r4, #0xa4]
000447dc  b       #0x447b4
000447de  movw    r3, #0x1441
000447e2  str.w   r3, [r0, r2, lsl #3]
000447e6  ldr     r2, [pc, #0x30]
000447e8  ldr.w   r3, [r0, #0xa4]
000447ec  add     r2, pc ; -> 0x0004445d  t_block_shake_ani
000447ee  adds    r3, #1
000447f0  str.w   r3, [r0, #0xa4]
000447f4  b       #0x4479c
000447f6  ldr.w   r2, [pc, #0x24]
000447fa  lsls    r3, r3, #3
000447fc  adds    r3, r3, r4
000447fe  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00044800  mov     r0, r6
00044802  ldr     r2, [r2]
00044804  str     r2, [r3, #4]
00044806  ldr.w   r3, [r4, #0xa4]
0004480a  adds    r3, #1
0004480c  str.w   r6, [r4, r3, lsl #3]
00044810  b       #0x447b4
00044812  nop     
00044814  stc2l   p15, c15, [r5], {0xff}
00044818  stc2l   p15, c15, [sp], #-0x3fc
0004481c  vhadd.s8 d0, d6, d10
