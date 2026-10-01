========================================================================
t_r_combo2  0x00045978  156 bytes   mkreact.c
========================================================================

00045978  push    {r4, r5, r6, r7, lr}
0004597a  add     r7, sp, #0xc
0004597c  ldr.w   r3, [r0, #0xa4]
00045980  mov     r4, r0
00045982  ldr.w   r5, [r0, #0x108]
00045986  adds    r3, #1
00045988  ldr.w   r6, [r0, r3, lsl #3]
0004598c  cbnz    r6, #0x459d0
0004598e  mov     r0, r5
00045990  bl      #0x424e0 ; -> combo_setup
00045994  ldr     r3, [pc, #0x70]
00045996  str     r6, [r5, #0x38]
00045998  movw    r2, #0xc96
0004599c  add     r3, pc ; -> 0x0004289d  t_combo_airborn_hit
0004599e  str     r3, [r5, #0x30]
000459a0  movs    r3, #9
000459a2  str     r3, [r5, #0x34]
000459a4  ldr.w   r3, [r4, #0xa4]
000459a8  mov     r0, r6
000459aa  adds    r3, #1
000459ac  str.w   r2, [r4, r3, lsl #3]
000459b0  ldr.w   r3, [r4, #0xa4]
000459b4  ldr     r2, [pc, #0x54]
000459b6  adds    r3, #1
000459b8  str.w   r3, [r4, #0xa4]
000459bc  lsls    r3, r3, #3
000459be  adds    r3, r3, r4
000459c0  add     r2, pc ; -> 0x00044b85  t_reaction_start
000459c2  str     r2, [r3, #4]
000459c4  ldr.w   r3, [r4, #0xa4]
000459c8  adds    r3, #1
000459ca  str.w   r6, [r4, r3, lsl #3]
000459ce  pop     {r4, r5, r6, r7, pc}
000459d0  movw    r3, #0xc96
000459d4  cmp     r6, r3
000459d6  it      ne
000459d8  mvnne   r0, #2
000459dc  bne     #0x459ce
000459de  mov     r0, r5
000459e0  bl      #0x54f20 ; -> set_no_block
000459e4  mov     r0, r5
000459e6  movs    r1, #0xa
000459e8  bl      #0x57dbc ; -> rsnd_func
000459ec  ldr.w   r3, [r4, #0xa4]
000459f0  ldr     r2, [pc, #0x1c]
000459f2  movs    r0, #0
000459f4  lsls    r3, r3, #3
000459f6  adds    r3, r3, r4
000459f8  add     r2, pc ; -> 0x00046945  t_combo2
000459fa  str     r2, [r3, #4]
000459fc  ldr.w   r3, [r4, #0xa4]
00045a00  adds    r3, #1
00045a02  str.w   r0, [r4, r3, lsl #3]
00045a06  b       #0x459ce
00045a08  ldm     r6, {r0, r2, r3, r4, r5, r6, r7}
