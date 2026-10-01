========================================================================
t_r_last_noogy  0x00042db0  140 bytes   mkreact.c
========================================================================

00042db0  push    {r4, r5, r6, r7, lr}
00042db2  add     r7, sp, #0xc
00042db4  ldr.w   r2, [r0, #0xa4]
00042db8  mov     r4, r0
00042dba  ldr.w   r5, [r0, #0x108]
00042dbe  adds    r3, r2, #1
00042dc0  ldr.w   r6, [r0, r3, lsl #3]
00042dc4  cbnz    r6, #0x42e0a
00042dc6  mov     r0, r5
00042dc8  movs    r1, #8
00042dca  bl      #0x57dbc ; -> rsnd_func
00042dce  ldr     r3, [pc, #0x60]
00042dd0  str     r6, [r5, #0x38]
00042dd2  movw    r2, #0xe35
00042dd6  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00042dd8  str     r3, [r5, #0x30]
00042dda  movs    r3, #1
00042ddc  str     r3, [r5, #0x34]
00042dde  ldr.w   r3, [r4, #0xa4]
00042de2  mov     r0, r6
00042de4  adds    r3, #1
00042de6  str.w   r2, [r4, r3, lsl #3]
00042dea  ldr.w   r3, [r4, #0xa4]
00042dee  ldr     r2, [pc, #0x44]
00042df0  adds    r3, #1
00042df2  str.w   r3, [r4, #0xa4]
00042df6  lsls    r3, r3, #3
00042df8  adds    r3, r3, r4
00042dfa  add     r2, pc ; -> 0x00044b85  t_reaction_start
00042dfc  str     r2, [r3, #4]
00042dfe  ldr.w   r3, [r4, #0xa4]
00042e02  adds    r3, #1
00042e04  str.w   r6, [r4, r3, lsl #3]
00042e08  pop     {r4, r5, r6, r7, pc}
00042e0a  movw    r3, #0xe35
00042e0e  cmp     r6, r3
00042e10  it      ne
00042e12  mvnne   r0, #2
00042e16  bne     #0x42e08
00042e18  ldr     r1, [pc, #0x1c]
00042e1a  lsls    r3, r2, #3
00042e1c  adds    r3, r3, r4
00042e1e  add     r1, pc ; -> 0x00044d55  t_onback3
00042e20  str     r1, [r3, #4]
00042e22  ldr.w   r3, [r4, #0xa4]
00042e26  movs    r0, #0
00042e28  adds    r3, #1
00042e2a  str.w   r0, [r4, r3, lsl #3]
00042e2e  b       #0x42e08
