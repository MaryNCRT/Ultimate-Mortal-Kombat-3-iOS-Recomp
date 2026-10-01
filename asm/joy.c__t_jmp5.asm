========================================================================
t_jmp5  0x000308dc  388 bytes   joy.c
========================================================================

000308dc  push    {r4, r5, r6, r7, lr}
000308de  add     r7, sp, #0xc
000308e0  push.w  {r8, sl}
000308e4  ldr.w   r2, [r0, #0xa4]
000308e8  movw    r8, #0x826
000308ec  mov     r5, r0
000308ee  adds    r3, r2, #1
000308f0  ldr.w   r4, [r0, #0x108]
000308f4  ldr.w   r6, [r0, r3, lsl #3]
000308f8  cmp     r6, r8
000308fa  beq     #0x30998
000308fc  movw    r3, #0x837
00030900  cmp     r6, r3
00030902  beq     #0x30970
00030904  cbz     r6, #0x30910
00030906  mvn     r0, #2
0003090a  pop.w   {r8, sl}
0003090e  pop     {r4, r5, r6, r7, pc}
00030910  mov     r0, r4
00030912  bl      #0x308c4 ; -> get_last_button
00030916  ldr     r2, [r4]
00030918  ldr     r3, [r4, #0x1c]
0003091a  mov     r0, r4
0003091c  mov.w   sl, #3
00030920  str     r3, [r2, #0x30]
00030922  ldr     r3, [r4]
00030924  str.w   sl, [r3, #0x58]
00030928  str     r6, [r4, #0x1c]
0003092a  bl      #0x580a4 ; -> group_sound
0003092e  mov     r0, r4
00030930  movs    r1, #0xe
00030932  bl      #0x57dbc ; -> rsnd_func
00030936  str.w   sl, [r4, #0x1c]
0003093a  mov.w   r3, #0x102
0003093e  str     r3, [r4, #0x20]
00030940  ldr.w   r3, [r5, #0xa4]
00030944  mov     r0, r6
00030946  adds    r3, #1
00030948  str.w   r8, [r5, r3, lsl #3]
0003094c  ldr.w   r3, [r5, #0xa4]
00030950  adds    r2, r3, #1
00030952  ldr     r3, [pc, #0xec]
00030954  str.w   r2, [r5, #0xa4]
00030958  add     r3, pc ; -> 0x000f37e8  t_act_mframew
0003095a  ldr     r1, [r3]
0003095c  lsl.w   r3, r2, sl
00030960  adds    r3, r3, r5
00030962  str     r1, [r3, #4]
00030964  ldr.w   r3, [r5, #0xa4]
00030968  adds    r3, #1
0003096a  str.w   r6, [r5, r3, lsl #3]
0003096e  b       #0x3090a
00030970  ldr     r0, [r4, #0x5c]
00030972  cbnz    r0, #0x309c4
00030974  ldr     r3, [r4, #0x1c]
00030976  lsrs    r3, r3, #0x10
00030978  str     r3, [r4, #0x1c]
0003097a  cmp     r3, #0
0003097c  bne     #0x30a26
0003097e  ldr     r2, [pc, #0xc4]
00030980  add     r2, pc ; -> 0x0002f5f1  t_joy_punch_mth2
00030982  ldr.w   r3, [r5, #0xa4]
00030986  lsls    r3, r3, #3
00030988  adds    r3, r3, r5
0003098a  str     r2, [r3, #4]
0003098c  ldr.w   r3, [r5, #0xa4]
00030990  adds    r3, #1
00030992  str.w   r0, [r5, r3, lsl #3]
00030996  b       #0x3090a
00030998  ldr     r3, [pc, #0xac]
0003099a  add     r3, pc ; -> 0x0016564c  bt_jump+0x28
0003099c  ldr     r3, [r3]
0003099e  ldrh.w  r6, [r3, #0x452]
000309a2  sxth    r3, r6
000309a4  str     r3, [r4, #0x1c]
000309a6  cbz     r6, #0x309dc
000309a8  ldr.w   r3, [r0, #0xa4]
000309ac  ldr     r2, [pc, #0x9c]
000309ae  lsls    r3, r3, #3
000309b0  adds    r3, r3, r0
000309b2  add     r2, pc ; -> 0x0002f6b9  t_joy_un_lo_punch2
000309b4  str     r2, [r3, #4]
000309b6  ldr.w   r3, [r0, #0xa4]
000309ba  movs    r0, #0
000309bc  adds    r3, #1
000309be  str.w   r0, [r5, r3, lsl #3]
000309c2  b       #0x3090a
000309c4  ldr     r1, [pc, #0x88]
000309c6  lsls    r3, r2, #3
000309c8  adds    r3, r3, r5
000309ca  add     r1, pc ; -> 0x0002f6b9  t_joy_un_lo_punch2
000309cc  str     r1, [r3, #4]
000309ce  ldr.w   r3, [r5, #0xa4]
000309d2  movs    r0, #0
000309d4  adds    r3, #1
000309d6  str.w   r0, [r5, r3, lsl #3]
000309da  b       #0x3090a
000309dc  movs    r3, #1
000309de  mov     r0, r4
000309e0  str     r3, [r4, #0x44]
000309e2  adds    r3, #2
000309e4  str     r3, [r4, #0x48]
000309e6  str     r3, [r4, #0x1c]
000309e8  bl      #0x594c8 ; -> strike_check_a0
000309ec  ldr     r3, [r4, #0x5c]
000309ee  cbz     r3, #0x30a32
000309f0  movs    r3, #5
000309f2  str     r3, [r4, #0x44]
000309f4  ldr.w   r3, [r5, #0xa4]
000309f8  movw    r2, #0x837
000309fc  mov     r0, r6
000309fe  adds    r3, #1
00030a00  str.w   r2, [r5, r3, lsl #3]
00030a04  ldr.w   r3, [r5, #0xa4]
00030a08  ldr.w   r2, [pc, #0x48]
00030a0c  adds    r3, #1
00030a0e  str.w   r3, [r5, #0xa4]
00030a12  lsls    r3, r3, #3
00030a14  adds    r3, r3, r5
00030a16  add     r2, pc ; -> 0x00030eed  t_punch_sleep
00030a18  str     r2, [r3, #4]
00030a1a  ldr.w   r3, [r5, #0xa4]
00030a1e  adds    r3, #1
00030a20  str.w   r6, [r5, r3, lsl #3]
00030a24  b       #0x3090a
00030a26  cmp     r3, #1
00030a28  beq     #0x30a38
00030a2a  ldr.w   r2, [pc, #0x2c]
00030a2e  add     r2, pc ; -> 0x0002f6b9  t_joy_un_lo_punch2
00030a30  b       #0x30982
00030a32  subs    r3, #1
00030a34  str     r3, [r4, #0x48]
00030a36  b       #0x309f0
00030a38  ldr     r2, [pc, #0x20]
00030a3a  add     r2, pc ; -> 0x00030a61  t_jmp4
00030a3c  b       #0x30982
00030a3e  nop     
00030a40  cmp     r6, #0x8c
00030a42  movs    r4, r1
00030a44  stcl    p15, c15, [sp], #-0x3fc
00030a48  ldr     r4, [pc, #0x2b8]
00030a4a  movs    r3, r2
00030a4c  stc     p15, c15, [r3, #-0x3fc]
00030a50  stcl    p15, c15, [fp], #0x3fc
00030a54  lsls    r3, r2, #0x13
00030a56  movs    r0, r0
00030a58  stc     p15, c15, [r7], {0xff}
00030a5c  movs    r3, r4
00030a5e  movs    r0, r0
