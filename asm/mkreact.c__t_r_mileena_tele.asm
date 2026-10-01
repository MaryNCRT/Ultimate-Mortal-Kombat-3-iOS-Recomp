========================================================================
t_r_mileena_tele  0x000431a4  172 bytes   mkreact.c
========================================================================

000431a4  push    {r4, r5, r6, r7, lr}
000431a6  add     r7, sp, #0xc
000431a8  ldr.w   r3, [r0, #0xa4]
000431ac  mov     r5, r0
000431ae  ldr.w   r4, [r0, #0x108]
000431b2  adds    r3, #1
000431b4  ldr.w   r6, [r0, r3, lsl #3]
000431b8  cmp     r6, #0
000431ba  bne     #0x43208
000431bc  ldr     r3, [r4]
000431be  mov     r0, r4
000431c0  movs    r1, #0xa
000431c2  mov.w   r2, #0x218
000431c6  str     r2, [r4, #0x1c]
000431c8  str     r2, [r3, #0x48]
000431ca  bl      #0x57dbc ; -> rsnd_func
000431ce  ldr     r3, [pc, #0x74]
000431d0  str     r6, [r4, #0x34]
000431d2  str     r6, [r4, #0x38]
000431d4  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
000431d6  str     r3, [r4, #0x30]
000431d8  ldr.w   r3, [r5, #0xa4]
000431dc  movw    r2, #0x2f3
000431e0  mov     r0, r6
000431e2  adds    r3, #1
000431e4  str.w   r2, [r5, r3, lsl #3]
000431e8  ldr.w   r3, [r5, #0xa4]
000431ec  ldr     r2, [pc, #0x58]
000431ee  adds    r3, #1
000431f0  str.w   r3, [r5, #0xa4]
000431f4  lsls    r3, r3, #3
000431f6  adds    r3, r3, r5
000431f8  add     r2, pc ; -> 0x00044b85  t_reaction_start
000431fa  str     r2, [r3, #4]
000431fc  ldr.w   r3, [r5, #0xa4]
00043200  adds    r3, #1
00043202  str.w   r6, [r5, r3, lsl #3]
00043206  pop     {r4, r5, r6, r7, pc}
00043208  movw    r3, #0x2f3
0004320c  cmp     r6, r3
0004320e  it      ne
00043210  mvnne   r0, #2
00043214  bne     #0x43206
00043216  mov     r0, r4
00043218  bl      #0x420e4 ; -> rsnd_react_voice
0004321c  mov     r0, r4
0004321e  mov.w   r3, #0x40004
00043222  str     r3, [r4, #0x48]
00043224  bl      #0x581e0 ; -> shake_a11
00043228  ldr.w   r3, [r5, #0xa4]
0004322c  ldr     r2, [pc, #0x1c]
0004322e  movs    r0, #0
00043230  lsls    r3, r3, #3
00043232  adds    r3, r3, r5
00043234  add     r2, pc ; -> 0x00041a79  t_stumble_back
00043236  str     r2, [r3, #4]
00043238  ldr.w   r3, [r5, #0xa4]
0004323c  adds    r3, #1
0004323e  str.w   r0, [r5, r3, lsl #3]
00043242  b       #0x43206
00043244  bl      #0xffebd246
00043248  adds    r1, r1, r6
0004324a  movs    r0, r0
0004324c  ttat    pc, r1
