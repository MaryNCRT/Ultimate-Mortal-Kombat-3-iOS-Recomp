========================================================================
t_r_square  0x0004294c  232 bytes   mkreact.c
========================================================================

0004294c  push    {r4, r5, r6, r7, lr}
0004294e  add     r7, sp, #0xc
00042950  str     r8, [sp, #-0x4]!
00042954  ldr.w   r2, [r0, #0xa4]
00042958  movw    r8, #0xf36
0004295c  mov     r4, r0
0004295e  adds    r3, r2, #1
00042960  ldr.w   r5, [r0, #0x108]
00042964  ldr.w   r6, [r0, r3, lsl #3]
00042968  cmp     r6, r8
0004296a  beq     #0x429ec
0004296c  movw    r3, #0xf3e
00042970  cmp     r6, r3
00042972  beq     #0x429d2
00042974  cbz     r6, #0x42980
00042976  mvn     r0, #2
0004297a  ldr     r8, [sp], #4
0004297e  pop     {r4, r5, r6, r7, pc}
00042980  mov     r0, r5
00042982  movs    r3, #2
00042984  str     r3, [r5, #0x1c]
00042986  bl      #0x580a4 ; -> group_sound
0004298a  mov     r0, r5
0004298c  movs    r1, #0xa
0004298e  bl      #0x57dbc ; -> rsnd_func
00042992  mov     r0, r5
00042994  mov.w   r3, #0x80008
00042998  str     r3, [r5, #0x48]
0004299a  bl      #0x581e0 ; -> shake_a11
0004299e  str     r6, [r5, #0x30]
000429a0  str     r6, [r5, #0x38]
000429a2  movs    r3, #1
000429a4  str     r3, [r5, #0x34]
000429a6  ldr.w   r3, [r4, #0xa4]
000429aa  ldr     r2, [pc, #0x7c]
000429ac  mov     r0, r6
000429ae  adds    r3, #1
000429b0  add     r2, pc ; -> 0x00044b85  t_reaction_start
000429b2  str.w   r8, [r4, r3, lsl #3]
000429b6  ldr.w   r3, [r4, #0xa4]
000429ba  adds    r3, #1
000429bc  str.w   r3, [r4, #0xa4]
000429c0  lsls    r3, r3, #3
000429c2  adds    r3, r3, r4
000429c4  str     r2, [r3, #4]
000429c6  ldr.w   r3, [r4, #0xa4]
000429ca  adds    r3, #1
000429cc  str.w   r6, [r4, r3, lsl #3]
000429d0  b       #0x4297a
000429d2  ldr.w   r1, [pc, #0x58]
000429d6  add     r1, pc ; -> 0x00042519  t_land_on_my_back
000429d8  lsls    r3, r2, #3
000429da  adds    r3, r3, r4
000429dc  movs    r0, #0
000429de  str     r1, [r3, #4]
000429e0  ldr.w   r3, [r4, #0xa4]
000429e4  adds    r3, #1
000429e6  str.w   r0, [r4, r3, lsl #3]
000429ea  b       #0x4297a
000429ec  mov.w   r3, #0x50000
000429f0  str     r3, [r5, #0x1c]
000429f2  sub.w   r3, r3, #0xa0000
000429f6  str     r3, [r5, #0x20]
000429f8  add.w   r3, r3, #0x58000
000429fc  str     r3, [r5, #0x24]
000429fe  movs    r3, #5
00042a00  str     r3, [r5, #0x28]
00042a02  adds    r3, #0x19
00042a04  str     r3, [r5, #0x40]
00042a06  ldr.w   r3, [r0, #0xa4]
00042a0a  movw    r2, #0xf3e
00042a0e  adds    r3, #1
00042a10  str.w   r2, [r0, r3, lsl #3]
00042a14  ldr.w   r3, [r0, #0xa4]
00042a18  adds    r2, r3, #1
00042a1a  ldr.w   r3, [pc, #0x14]
00042a1e  str.w   r2, [r0, #0xa4]
00042a22  add     r3, pc ; -> 0x000f3720  t_flight
00042a24  ldr     r1, [r3]
00042a26  b       #0x429d8
00042a28  movs    r1, #0xd1
00042a2a  movs    r0, r0
