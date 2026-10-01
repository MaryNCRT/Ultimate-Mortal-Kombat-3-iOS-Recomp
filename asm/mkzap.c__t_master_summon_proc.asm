========================================================================
t_master_summon_proc  0x00077934  268 bytes   mkzap.c
========================================================================

00077934  push    {r4, r5, r6, r7, lr}
00077936  add     r7, sp, #0xc
00077938  str     r8, [sp, #-0x4]!
0007793c  ldr.w   r3, [r0, #0xa4]
00077940  movw    r8, #0xb7a
00077944  mov     r4, r0
00077946  adds    r3, #1
00077948  ldr.w   r5, [r0, #0x108]
0007794c  ldr.w   r6, [r0, r3, lsl #3]
00077950  cmp     r6, r8
00077952  beq     #0x779e6
00077954  ble     #0x7796e
00077956  movw    r2, #0xb7b
0007795a  cmp     r6, r2
0007795c  beq     #0x77a12
0007795e  adds    r2, #1
00077960  cmp     r6, r2
00077962  beq     #0x779d4
00077964  mvn     r0, #2
00077968  ldr     r8, [sp], #4
0007796c  pop     {r4, r5, r6, r7, pc}
0007796e  cmp     r6, #0
00077970  bne     #0x77964
00077972  ldr     r3, [r5, #8]
00077974  mov     r0, r5
00077976  ldrsh.w r3, [r3, #0xe]
0007797a  str     r3, [r5, #0x48]
0007797c  mvn     r3, #0x5f
00077980  str     r3, [r5, #0x44]
00077982  movw    r3, #0x11f
00077986  str     r3, [r5, #0x34]
00077988  bl      #0x5517c ; -> is_he_right
0007798c  ldr     r3, [r5, #0x5c]
0007798e  cmp     r3, #0
00077990  bne     #0x77a2c
00077992  ldr     r3, [r5, #0x44]
00077994  rsb.w   r3, r3, #0
00077998  str     r3, [r5, #0x44]
0007799a  ldr     r3, [r5, #0x34]
0007799c  rsb.w   r3, r3, #0
000779a0  str     r3, [r5, #0x34]
000779a2  ldr     r2, [r5, #0x48]
000779a4  mov     r0, r6
000779a6  add     r3, r2
000779a8  str     r3, [r5, #0x48]
000779aa  ldr.w   r3, [r4, #0xa4]
000779ae  ldr     r2, [pc, #0x80]
000779b0  adds    r3, #1
000779b2  add     r2, pc ; -> 0x00077aa1  t_summon_spawn
000779b4  str.w   r8, [r4, r3, lsl #3]
000779b8  ldr.w   r3, [r4, #0xa4]
000779bc  adds    r3, #1
000779be  str.w   r3, [r4, #0xa4]
000779c2  lsls    r3, r3, #3
000779c4  adds    r3, r3, r4
000779c6  str     r2, [r3, #4]
000779c8  ldr.w   r3, [r4, #0xa4]
000779cc  adds    r3, #1
000779ce  str.w   r6, [r4, r3, lsl #3]
000779d2  b       #0x77968
000779d4  movw    r2, #0xb7d
000779d8  str.w   r2, [r0, r3, lsl #3]
000779dc  ldr.w   r0, [pc, #0x54]
000779e0  str.w   r0, [r4, #0xfc]
000779e4  b       #0x77968
000779e6  movw    r2, #0xb7b
000779ea  str.w   r2, [r0, r3, lsl #3]
000779ee  ldr.w   r2, [pc, #0x48]
000779f2  ldr.w   r3, [r0, #0xa4]
000779f6  add     r2, pc ; -> 0x00077aa1  t_summon_spawn
000779f8  adds    r3, #1
000779fa  str.w   r3, [r0, #0xa4]
000779fe  lsls    r3, r3, #3
00077a00  adds    r3, r3, r4
00077a02  movs    r0, #0
00077a04  str     r2, [r3, #4]
00077a06  ldr.w   r3, [r4, #0xa4]
00077a0a  adds    r3, #1
00077a0c  str.w   r0, [r4, r3, lsl #3]
00077a10  b       #0x77968
00077a12  movw    r2, #0xb7c
00077a16  str.w   r2, [r0, r3, lsl #3]
00077a1a  ldr.w   r2, [pc, #0x20]
00077a1e  ldr.w   r3, [r0, #0xa4]
00077a22  add     r2, pc ; -> 0x00077aa1  t_summon_spawn
00077a24  adds    r3, #1
00077a26  str.w   r3, [r0, #0xa4]
00077a2a  b       #0x779fe
00077a2c  ldr     r3, [r5, #0x34]
00077a2e  b       #0x779a2
00077a30  lsls    r3, r5, #3
00077a32  movs    r0, r0
00077a34  str     r2, [r4, #0x44]
00077a36  movs    r1, r0
00077a38  lsls    r7, r4, #2
00077a3a  movs    r0, r0
00077a3c  lsls    r3, r7, #1
00077a3e  movs    r0, r0
