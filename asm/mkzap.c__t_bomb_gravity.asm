========================================================================
t_bomb_gravity  0x0007641c  280 bytes   mkzap.c
========================================================================

0007641c  push    {r4, r5, r7, lr}
0007641e  add     r7, sp, #8
00076420  ldr.w   r2, [r0, #0xa4]
00076424  mov     r5, r0
00076426  ldr.w   r4, [r0, #0x108]
0007642a  adds    r3, r2, #1
0007642c  ldr.w   r3, [r0, r3, lsl #3]
00076430  cmp     r3, #0
00076432  beq     #0x76478
00076434  movw    r2, #0xca3
00076438  cmp     r3, r2
0007643a  it      ne
0007643c  mvnne   r0, #2
00076440  beq     #0x76444
00076442  pop     {r4, r5, r7, pc}
00076444  mov     r0, r4
00076446  bl      #0x5a680 ; -> next_anirate
0007644a  ldr     r2, [r4, #8]
0007644c  ldr     r3, [r4, #0x48]
0007644e  subs    r3, #1
00076450  str     r3, [r4, #0x48]
00076452  ldr     r3, [r2, #0x1c]
00076454  add.w   r3, r3, #0x8000
00076458  str     r3, [r4, #0x1c]
0007645a  str     r3, [r2, #0x1c]
0007645c  ldr     r3, [r4, #0x1c]
0007645e  cmp     r3, #0
00076460  blt     #0x76474
00076462  ldr     r3, [r4, #8]
00076464  ldr     r1, [r4]
00076466  ldrsh.w r2, [r3, #0x12]
0007646a  str     r2, [r4, #0x30]
0007646c  ldr     r3, [r1, #0x40]
0007646e  cmp     r3, r2
00076470  str     r3, [r4, #0x34]
00076472  ble     #0x7648a
00076474  ldr.w   r2, [r5, #0xa4]
00076478  adds    r3, r2, #1
0007647a  movs    r0, #1
0007647c  movw    r2, #0xca3
00076480  str.w   r2, [r5, r3, lsl #3]
00076484  str.w   r0, [r5, #0xfc]
00076488  b       #0x76442
0007648a  movs    r3, #8
0007648c  str     r3, [r4, #0x1c]
0007648e  ldr     r3, [r1, #0x28]
00076490  eor     r3, r3, #1
00076494  str     r3, [r4, #0x24]
00076496  cbz     r3, #0x7649c
00076498  movs    r3, #9
0007649a  str     r3, [r4, #0x1c]
0007649c  ldr     r3, [r4, #0x24]
0007649e  mov     r0, r4
000764a0  str     r3, [r1, #0x28]
000764a2  bl      #0x57be4 ; -> ochar_sound
000764a6  ldr     r3, [r4, #0x48]
000764a8  cmp     r3, #0
000764aa  blt     #0x764be
000764ac  ldr.w   r3, [r5, #0xa4]
000764b0  cmp     r3, #0
000764b2  ble     #0x76504
000764b4  subs    r3, #1
000764b6  movs    r0, #0
000764b8  str.w   r3, [r5, #0xa4]
000764bc  b       #0x76442
000764be  ldr.w   r3, [r5, #0xa4]
000764c2  cmp     r3, #0
000764c4  ble     #0x7650e
000764c6  subs    r2, r3, #1
000764c8  str.w   r2, [r5, #0xa4]
000764cc  ldr.w   r1, [r5, #0xa4]
000764d0  adds    r3, r1, #1
000764d2  lsls    r2, r3, #3
000764d4  adds    r2, r2, r5
000764d6  ldr     r0, [r2, #4]
000764d8  adds    r2, r3, #1
000764da  ldr.w   r2, [r5, r2, lsl #3]
000764de  str.w   r2, [r5, r3, lsl #3]
000764e2  lsls    r3, r1, #3
000764e4  adds    r3, r3, r5
000764e6  ldr     r2, [pc, #0x40]
000764e8  str     r0, [r3, #4]
000764ea  ldr.w   r3, [r5, #0xa4]
000764ee  add     r2, pc ; -> 0x0007905d  t_bgrav9
000764f0  lsls    r3, r3, #3
000764f2  adds    r3, r3, r5
000764f4  movs    r0, #0
000764f6  str     r2, [r3, #4]
000764f8  ldr.w   r3, [r5, #0xa4]
000764fc  adds    r3, #1
000764fe  str.w   r0, [r5, r3, lsl #3]
00076502  b       #0x76442
00076504  ldr.w   r2, [pc, #0x24]
00076508  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0007650a  ldr     r2, [r2]
0007650c  b       #0x764f0
0007650e  ldr     r2, [pc, #0x20]
00076510  lsls    r3, r3, #3
00076512  adds    r3, r3, r5
00076514  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00076516  ldr     r2, [r2]
00076518  str     r2, [r3, #4]
0007651a  ldr.w   r3, [r5, #0xa4]
0007651e  movs    r2, #0
00076520  adds    r3, #1
00076522  str.w   r2, [r5, r3, lsl #3]
00076526  b       #0x764cc
00076528  cmp     r3, #0x6b
0007652a  movs    r0, r0
0007652c  bne     #0x76528
0007652e  movs    r7, r0
00076530  bne     #0x76514
00076532  movs    r7, r0
