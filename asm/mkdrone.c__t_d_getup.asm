========================================================================
t_d_getup  0x00071618  192 bytes   mkdrone.c
========================================================================

00071618  push    {r4, r5, r7, lr}
0007161a  add     r7, sp, #8
0007161c  ldr.w   r3, [r0, #0xa4]
00071620  movw    r2, #0x7cc
00071624  mov     r4, r0
00071626  adds    r1, r3, #1
00071628  ldr.w   r5, [r0, #0x108]
0007162c  ldr.w   r3, [r0, r1, lsl #3]
00071630  cmp     r3, r2
00071632  beq     #0x716a6
00071634  adds    r2, #1
00071636  cmp     r3, r2
00071638  beq     #0x7167a
0007163a  cbnz    r3, #0x71674
0007163c  ldr     r1, [r5]
0007163e  movw    r2, #0x309
00071642  mov     r0, r5
00071644  str     r2, [r1, #0x18]
00071646  ldr     r2, [r5]
00071648  str     r3, [r5, #0x1c]
0007164a  str     r3, [r2, #0x5c]
0007164c  movs    r3, #0x21
0007164e  str     r3, [r5, #0x40]
00071650  bl      #0x5520c ; -> get_char_ani
00071654  mov     r0, r5
00071656  movs    r3, #4
00071658  str     r3, [r5, #0x1c]
0007165a  bl      #0x553a0 ; -> init_anirate
0007165e  ldr.w   r3, [r4, #0xa4]
00071662  movs    r0, #1
00071664  movw    r2, #0x7cc
00071668  adds    r3, #1
0007166a  str.w   r2, [r4, r3, lsl #3]
0007166e  str.w   r0, [r4, #0xfc]
00071672  b       #0x71678
00071674  mvn     r0, #2
00071678  pop     {r4, r5, r7, pc}
0007167a  mov     r0, r5
0007167c  bl      #0x5a680 ; -> next_anirate
00071680  ldr     r3, [r5, #0x40]
00071682  ldr     r0, [r3]
00071684  str     r0, [r5, #0x1c]
00071686  cmp     r0, #0
00071688  bne     #0x7165e
0007168a  ldr     r3, [pc, #0x44]
0007168c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007168e  ldr     r2, [r3]
00071690  ldr.w   r3, [r4, #0xa4]
00071694  lsls    r3, r3, #3
00071696  adds    r3, r3, r4
00071698  str     r2, [r3, #4]
0007169a  ldr.w   r3, [r4, #0xa4]
0007169e  adds    r3, #1
000716a0  str.w   r0, [r4, r3, lsl #3]
000716a4  b       #0x71678
000716a6  movw    r3, #0x7cd
000716aa  str.w   r3, [r0, r1, lsl #3]
000716ae  ldr.w   r3, [r0, #0xa4]
000716b2  ldr     r2, [pc, #0x20]
000716b4  adds    r3, #1
000716b6  str.w   r3, [r0, #0xa4]
000716ba  lsls    r3, r3, #3
000716bc  adds    r3, r3, r0
000716be  add     r2, pc ; -> 0x0006c40d  t_d_beware
000716c0  str     r2, [r3, #4]
000716c2  ldr.w   r3, [r0, #0xa4]
000716c6  movs    r0, #0
000716c8  adds    r3, #1
000716ca  str.w   r0, [r4, r3, lsl #3]
000716ce  b       #0x71678
000716d0  movs    r0, #0x78
000716d2  movs    r0, r1
000716d4  add     r5, sp, #0x12c
