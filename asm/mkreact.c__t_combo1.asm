========================================================================
t_combo1  0x00045280  200 bytes   mkreact.c
========================================================================

00045280  push    {r4, r5, r6, r7, lr}
00045282  add     r7, sp, #0xc
00045284  ldr.w   r1, [r0, #0xa4]
00045288  movw    r6, #0xc77
0004528c  mov     r4, r0
0004528e  adds    r3, r1, #1
00045290  ldr.w   r5, [r0, #0x108]
00045294  ldr.w   r3, [r0, r3, lsl #3]
00045298  cmp     r3, r6
0004529a  beq     #0x45306
0004529c  movw    r2, #0xc7a
000452a0  cmp     r3, r2
000452a2  beq     #0x452ec
000452a4  cbz     r3, #0x452ac
000452a6  mvn     r0, #2
000452aa  pop     {r4, r5, r6, r7, pc}
000452ac  mov     r0, r5
000452ae  movs    r3, #4
000452b0  str     r3, [r5, #0x1c]
000452b2  bl      #0x5877c ; -> create_blood_proc
000452b6  mov     r0, r5
000452b8  mov.w   r3, #0x20000
000452bc  str     r3, [r5, #0x1c]
000452be  bl      #0x55ab0 ; -> away_x_vel
000452c2  mov     r0, r5
000452c4  movs    r3, #0x1c
000452c6  str     r3, [r5, #0x40]
000452c8  bl      #0x5520c ; -> get_char_ani
000452cc  ldr     r3, [r5, #0x40]
000452ce  mov     r0, r5
000452d0  str     r3, [r5, #0x44]
000452d2  adds    r3, #0xc
000452d4  str     r3, [r5, #0x40]
000452d6  bl      #0x59e24 ; -> do_next_a9_frame
000452da  ldr.w   r3, [r4, #0xa4]
000452de  movs    r0, #3
000452e0  adds    r3, #1
000452e2  str.w   r6, [r4, r3, lsl #3]
000452e6  str.w   r0, [r4, #0xfc]
000452ea  b       #0x452aa
000452ec  ldr     r3, [pc, #0x50]
000452ee  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000452f0  ldr     r2, [r3]
000452f2  lsls    r3, r1, #3
000452f4  adds    r3, r3, r0
000452f6  str     r2, [r3, #4]
000452f8  ldr.w   r3, [r0, #0xa4]
000452fc  movs    r0, #0
000452fe  adds    r3, #1
00045300  str.w   r0, [r4, r3, lsl #3]
00045304  b       #0x452aa
00045306  ldr     r3, [r5, #0x44]
00045308  movw    r2, #0xc7a
0004530c  str     r3, [r5, #0x40]
0004530e  movs    r3, #4
00045310  str     r3, [r5, #0x1c]
00045312  ldr.w   r3, [r0, #0xa4]
00045316  adds    r3, #1
00045318  str.w   r2, [r0, r3, lsl #3]
0004531c  ldr.w   r3, [r0, #0xa4]
00045320  adds    r2, r3, #1
00045322  ldr     r3, [pc, #0x20]
00045324  str.w   r2, [r0, #0xa4]
00045328  add     r3, pc ; -> 0x000f37cc  t_mframew
0004532a  ldr     r1, [r3]
0004532c  lsls    r3, r2, #3
0004532e  adds    r3, r3, r0
00045330  str     r1, [r3, #4]
00045332  ldr.w   r3, [r0, #0xa4]
00045336  movs    r0, #0
00045338  adds    r3, #1
0004533a  str.w   r0, [r4, r3, lsl #3]
0004533e  b       #0x452aa
00045340  b       #0x44b70
00045342  movs    r2, r1
00045344  b       #0x44c88
00045346  movs    r2, r1
