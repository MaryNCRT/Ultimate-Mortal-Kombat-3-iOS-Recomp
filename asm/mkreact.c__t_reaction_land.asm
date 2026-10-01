========================================================================
t_reaction_land  0x000425b8  168 bytes   mkreact.c
========================================================================

000425b8  push    {r4, r5, r6, r7, lr}
000425ba  add     r7, sp, #0xc
000425bc  str     r8, [sp, #-0x4]!
000425c0  ldr.w   r2, [r0, #0xa4]
000425c4  movw    r8, #0x147b
000425c8  mov     r4, r0
000425ca  adds    r3, r2, #1
000425cc  ldr.w   r6, [r0, #0x108]
000425d0  ldr.w   r5, [r0, r3, lsl #3]
000425d4  cmp     r5, r8
000425d6  beq     #0x42646
000425d8  movw    r3, #0x147c
000425dc  cmp     r5, r3
000425de  beq     #0x4262e
000425e0  cbz     r5, #0x425ec
000425e2  mvn     r0, #2
000425e6  ldr     r8, [sp], #4
000425ea  pop     {r4, r5, r6, r7, pc}
000425ec  mov     r0, r6
000425ee  bl      #0x424fc ; -> shake_n_sound
000425f2  mov     r0, r6
000425f4  movs    r3, #0x1e
000425f6  str     r3, [r6, #0x40]
000425f8  bl      #0x55474 ; -> find_ani_part2
000425fc  movs    r3, #4
000425fe  str     r3, [r6, #0x1c]
00042600  ldr.w   r3, [r4, #0xa4]
00042604  mov     r0, r5
00042606  adds    r3, #1
00042608  str.w   r8, [r4, r3, lsl #3]
0004260c  ldr.w   r3, [r4, #0xa4]
00042610  adds    r2, r3, #1
00042612  ldr     r3, [pc, #0x44]
00042614  str.w   r2, [r4, #0xa4]
00042618  add     r3, pc ; -> 0x000f37cc  t_mframew
0004261a  ldr     r1, [r3]
0004261c  lsls    r3, r2, #3
0004261e  adds    r3, r3, r4
00042620  str     r1, [r3, #4]
00042622  ldr.w   r3, [r4, #0xa4]
00042626  adds    r3, #1
00042628  str.w   r5, [r4, r3, lsl #3]
0004262c  b       #0x425e6
0004262e  ldr     r1, [pc, #0x2c]
00042630  lsls    r3, r2, #3
00042632  adds    r3, r3, r0
00042634  add     r1, pc ; -> 0x00041f8d  t_getup_reaction_exit
00042636  str     r1, [r3, #4]
00042638  ldr.w   r3, [r0, #0xa4]
0004263c  movs    r0, #0
0004263e  adds    r3, #1
00042640  str.w   r0, [r4, r3, lsl #3]
00042644  b       #0x425e6
00042646  movw    r2, #0x147c
0004264a  str.w   r2, [r0, r3, lsl #3]
0004264e  movs    r0, #3
00042650  str.w   r0, [r4, #0xfc]
00042654  b       #0x425e6
00042656  nop     
00042658  asrs    r0, r6, #6
0004265a  movs    r3, r1
