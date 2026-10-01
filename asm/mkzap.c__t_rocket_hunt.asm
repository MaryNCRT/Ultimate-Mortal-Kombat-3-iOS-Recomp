========================================================================
t_rocket_hunt  0x000783fc  468 bytes   mkzap.c
========================================================================

000783fc  push    {r4, r5, r6, r7, lr}
000783fe  add     r7, sp, #0xc
00078400  str     r8, [sp, #-0x4]!
00078404  ldr.w   r2, [r0, #0xa4]
00078408  mov     r5, r0
0007840a  ldr.w   r4, [r0, #0x108]
0007840e  adds    r3, r2, #1
00078410  ldr.w   r3, [r0, r3, lsl #3]
00078414  cmp     r3, #0
00078416  bne     #0x7849e
00078418  cmp     r2, #0
0007841a  ble     #0x784f2
0007841c  subs    r3, r2, #1
0007841e  str.w   r3, [r0, #0xa4]
00078422  ldr.w   r1, [r5, #0xa4]
00078426  adds    r3, r1, #1
00078428  lsls    r2, r3, #3
0007842a  adds    r2, r2, r5
0007842c  ldr     r0, [r2, #4]
0007842e  adds    r2, r3, #1
00078430  ldr.w   r2, [r5, r2, lsl #3]
00078434  str.w   r2, [r5, r3, lsl #3]
00078438  lsls    r3, r1, #3
0007843a  adds    r3, r3, r5
0007843c  str     r0, [r3, #4]
0007843e  ldr     r2, [r4]
00078440  ldr     r3, [r2, #4]
00078442  str     r3, [r4, #0x38]
00078444  ldr     r3, [r4, #8]
00078446  ldrsh.w r0, [r3, #0xe]
0007844a  str     r0, [r4, #0x24]
0007844c  ldrsh.w ip, [r3, #0x12]
00078450  str.w   ip, [r4, #0x2c]
00078454  ldr     r3, [r2, #4]
00078456  ldrsh.w r1, [r3, #0xe]
0007845a  str     r1, [r4, #0x20]
0007845c  ldr     r3, [r2, #4]
0007845e  subs    r1, r1, r0
00078460  mov     r0, r4
00078462  ldrsh.w r2, [r3, #0x12]
00078466  str     r1, [r4, #0x20]
00078468  str     r1, [r4, #0x38]
0007846a  adds    r2, #0x40
0007846c  rsb     r2, ip, r2
00078470  str     r2, [r4, #0x28]
00078472  str     r2, [r4, #0x54]
00078474  bl      #0x571e8 ; -> get_rough_hypotenuse_of
00078478  ldr     r3, [r4, #0x54]
0007847a  cmp     r3, #9
0007847c  bhi     #0x7850c
0007847e  ldr     r2, [pc, #0x13c]
00078480  add     r2, pc ; -> 0x00077ccd  t_rocket_explode
00078482  ldr.w   r3, [r5, #0xa4]
00078486  movs    r0, #0
00078488  lsls    r3, r3, #3
0007848a  adds    r3, r3, r5
0007848c  str     r2, [r3, #4]
0007848e  ldr.w   r3, [r5, #0xa4]
00078492  adds    r3, #1
00078494  str.w   r0, [r5, r3, lsl #3]
00078498  ldr     r8, [sp], #4
0007849c  pop     {r4, r5, r6, r7, pc}
0007849e  movw    r2, #0x1076
000784a2  cmp     r3, r2
000784a4  it      ne
000784a6  mvnne   r0, #2
000784aa  bne     #0x78498
000784ac  mov     r0, r4
000784ae  bl      #0x782e0 ; -> point_rocket
000784b2  mov     r0, r4
000784b4  bl      #0x5a680 ; -> next_anirate
000784b8  ldr     r3, [pc, #0x104]
000784ba  add     r3, pc ; -> 0x000f357c  G
000784bc  ldr     r3, [r3]
000784be  ldrsh.w r3, [r3, #0x450]
000784c2  cbnz    r3, #0x784ea
000784c4  ldr     r2, [r4]
000784c6  ldr     r3, [r2, #0x34]
000784c8  subs    r0, r3, #1
000784ca  str     r0, [r4, #0x1c]
000784cc  cmp     r0, #0
000784ce  bne     #0x785b6
000784d0  ldr.w   r3, [r5, #0xa4]
000784d4  ldr     r2, [pc, #0xec]
000784d6  lsls    r3, r3, #3
000784d8  adds    r3, r3, r5
000784da  add     r2, pc ; -> 0x00077ccd  t_rocket_explode
000784dc  str     r2, [r3, #4]
000784de  ldr.w   r3, [r5, #0xa4]
000784e2  adds    r3, #1
000784e4  str.w   r0, [r5, r3, lsl #3]
000784e8  b       #0x78498
000784ea  ldr.w   r2, [pc, #0xdc]
000784ee  add     r2, pc ; -> 0x00077ccd  t_rocket_explode
000784f0  b       #0x78482
000784f2  ldr.w   r1, [pc, #0xd8]
000784f6  lsls    r2, r2, #3
000784f8  adds    r2, r2, r0
000784fa  add     r1, pc ; -> 0x000f3708  t_local_reaction_exit
000784fc  ldr     r1, [r1]
000784fe  str     r1, [r2, #4]
00078500  ldr.w   r2, [r0, #0xa4]
00078504  adds    r2, #1
00078506  str.w   r3, [r0, r2, lsl #3]
0007850a  b       #0x78422
0007850c  ldr     r3, [r4, #0x20]
0007850e  mov     r0, r4
00078510  lsls    r2, r3, #0x12
00078512  ldr     r3, [r4, #0x28]
00078514  str     r2, [r4, #0x20]
00078516  str     r2, [r4, #0x38]
00078518  lsls    r3, r3, #0x12
0007851a  str     r3, [r4, #0x28]
0007851c  str     r3, [r4, #0x54]
0007851e  bl      #0x571bc ; -> get_rough_hypotenuse
00078522  ldr     r1, [r4, #0x54]
00078524  ldr     r0, [r4, #0x20]
00078526  lsrs    r6, r1, #0x10
00078528  str     r6, [r4, #0x54]
0007852a  mov     r1, r6
0007852c  blx     #0xdd608 ; -> divsi3
00078530  mov     r1, r6
00078532  mov     r8, r0
00078534  str     r0, [r4, #0x20]
00078536  ldr     r0, [r4, #0x28]
00078538  blx     #0xdd608 ; -> divsi3
0007853c  ldr     r3, [r4, #8]
0007853e  str     r0, [r4, #0x28]
00078540  ldr     r1, [r3, #0x18]
00078542  str     r1, [r4, #0x30]
00078544  ldr     r2, [r3, #0x1c]
00078546  asr.w   ip, r1, #4
0007854a  rsb     r1, ip, r1
0007854e  add     r1, r8
00078550  asrs    r3, r2, #4
00078552  subs    r2, r2, r3
00078554  adds    r2, r2, r0
00078556  mov     r0, r4
00078558  str     r3, [r4, #0x24]
0007855a  str     r2, [r4, #0x38]
0007855c  str     r2, [r4, #0x28]
0007855e  str.w   ip, [r4, #0x1c]
00078562  str     r1, [r4, #0x30]
00078564  str     r1, [r4, #0x20]
00078566  bl      #0x571e8 ; -> get_rough_hypotenuse_of
0007856a  ldr     r1, [r4, #0x54]
0007856c  ldr     r0, [r4, #0x20]
0007856e  lsrs    r6, r1, #0x10
00078570  str     r6, [r4, #0x54]
00078572  mov     r1, r6
00078574  blx     #0xdd608 ; -> divsi3
00078578  mov     r1, r6
0007857a  mov     r8, r0
0007857c  str     r0, [r4, #0x20]
0007857e  ldr     r0, [r4, #0x28]
00078580  blx     #0xdd608 ; -> divsi3
00078584  movs    r2, #5
00078586  str     r2, [r4, #0x54]
00078588  lsl.w   r3, r8, #2
0007858c  add     r3, r8
0007858e  str     r3, [r4, #0x20]
00078590  mul     r0, r0, r2
00078594  ldr     r2, [r4, #8]
00078596  str     r0, [r4, #0x28]
00078598  str     r3, [r2, #0x18]
0007859a  ldr     r3, [r4, #8]
0007859c  ldr     r0, [r4, #0x28]
0007859e  movw    r2, #0x1076
000785a2  str     r0, [r3, #0x1c]
000785a4  ldr.w   r3, [r5, #0xa4]
000785a8  movs    r0, #1
000785aa  adds    r3, #1
000785ac  str.w   r2, [r5, r3, lsl #3]
000785b0  str.w   r0, [r5, #0xfc]
000785b4  b       #0x78498
000785b6  str     r0, [r2, #0x34]
000785b8  b       #0x7843e
000785ba  nop     
000785bc  str     pc, [sb, #0xff]!
000785c0  sub     sp, #0xf8
000785c2  movs    r7, r0
000785c4  bl      #0x685c6
000785c8  bl      #0x545ca
000785cc  sxth    r2, r1
000785ce  movs    r7, r0
