========================================================================
t_r_robo_tele  0x000488b0  272 bytes   mkreact.c
========================================================================

000488b0  push    {r4, r5, r6, r7, lr}
000488b2  add     r7, sp, #0xc
000488b4  str     r8, [sp, #-0x4]!
000488b8  ldr.w   r2, [r0, #0xa4]
000488bc  movw    r8, #0x6bb
000488c0  mov     r5, r0
000488c2  adds    r3, r2, #1
000488c4  ldr.w   r4, [r0, #0x108]
000488c8  ldr.w   r6, [r0, r3, lsl #3]
000488cc  cmp     r6, r8
000488ce  beq     #0x4896a
000488d0  movw    r3, #0x6c4
000488d4  cmp     r6, r3
000488d6  beq     #0x48950
000488d8  cbz     r6, #0x488e4
000488da  mvn     r0, #2
000488de  ldr     r8, [sp], #4
000488e2  pop     {r4, r5, r6, r7, pc}
000488e4  mov     r0, r4
000488e6  movs    r3, #2
000488e8  str     r3, [r4, #0x1c]
000488ea  bl      #0x580a4 ; -> group_sound
000488ee  movs    r1, #0xa
000488f0  mov     r0, r4
000488f2  bl      #0x57dbc ; -> rsnd_func
000488f6  mov     r0, r4
000488f8  mov.w   r3, #0x60006
000488fc  str     r3, [r4, #0x48]
000488fe  bl      #0x581e0 ; -> shake_a11
00048902  ldr     r3, [pc, #0xac]
00048904  mov     r0, r4
00048906  add     r3, pc ; -> 0x000f3748  zero_turbo_bar
00048908  ldr     r3, [r3]
0004890a  str     r3, [r4, #0x1c]
0004890c  bl      #0x5710c ; -> call_a0_for_him
00048910  ldr     r2, [r4]
00048912  mov.w   r3, #0x208
00048916  str     r3, [r4, #0x20]
00048918  mov     r0, r6
0004891a  str     r3, [r2, #0x48]
0004891c  str     r6, [r4, #0x30]
0004891e  str     r6, [r4, #0x38]
00048920  sub.w   r3, r3, #0x204
00048924  str     r3, [r4, #0x34]
00048926  ldr.w   r3, [r5, #0xa4]
0004892a  ldr     r2, [pc, #0x88]
0004892c  adds    r3, #1
0004892e  add     r2, pc ; -> 0x00044b85  t_reaction_start
00048930  str.w   r8, [r5, r3, lsl #3]
00048934  ldr.w   r3, [r5, #0xa4]
00048938  adds    r3, #1
0004893a  str.w   r3, [r5, #0xa4]
0004893e  lsls    r3, r3, #3
00048940  adds    r3, r3, r5
00048942  str     r2, [r3, #4]
00048944  ldr.w   r3, [r5, #0xa4]
00048948  adds    r3, #1
0004894a  str.w   r6, [r5, r3, lsl #3]
0004894e  b       #0x488de
00048950  ldr.w   r1, [pc, #0x64]
00048954  add     r1, pc ; -> 0x000425b9  t_reaction_land
00048956  lsls    r3, r2, #3
00048958  adds    r3, r3, r5
0004895a  movs    r0, #0
0004895c  str     r1, [r3, #4]
0004895e  ldr.w   r3, [r5, #0xa4]
00048962  adds    r3, #1
00048964  str.w   r0, [r5, r3, lsl #3]
00048968  b       #0x488de
0004896a  ldr     r2, [r4]
0004896c  movw    r3, #0x616
00048970  str     r3, [r2, #0x18]
00048972  mov.w   r3, #0x10000
00048976  str     r3, [r4, #0x1c]
00048978  sub.w   r3, r3, #0xc0000
0004897c  str     r3, [r4, #0x20]
0004897e  add.w   r3, r3, #0xb6000
00048982  str     r3, [r4, #0x24]
00048984  movs    r3, #5
00048986  str     r3, [r4, #0x28]
00048988  adds    r3, #0x19
0004898a  str     r3, [r4, #0x40]
0004898c  ldr.w   r3, [r0, #0xa4]
00048990  movw    r2, #0x6c4
00048994  adds    r3, #1
00048996  str.w   r2, [r0, r3, lsl #3]
0004899a  ldr.w   r3, [r0, #0xa4]
0004899e  adds    r2, r3, #1
000489a0  ldr.w   r3, [pc, #0x18]
000489a4  str.w   r2, [r0, #0xa4]
000489a8  add     r3, pc ; -> 0x000f3720  t_flight
000489aa  ldr     r1, [r3]
000489ac  b       #0x48956
000489ae  nop     
000489b0  add     r6, sp, #0xf8
000489b2  movs    r2, r1
000489b4  stm     r2!, {r0, r1, r4, r6}
