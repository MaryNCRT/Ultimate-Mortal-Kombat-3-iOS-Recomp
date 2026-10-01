========================================================================
t_angle_jump_call  0x00030788  152 bytes   joy.c
========================================================================

00030788  push    {r4, r5, r7, lr}
0003078a  add     r7, sp, #8
0003078c  ldr.w   r2, [r0, #0xa4]
00030790  movw    r1, #0x335
00030794  mov     r4, r0
00030796  adds    r3, r2, #1
00030798  ldr.w   r5, [r0, #0x108]
0003079c  ldr.w   r3, [r0, r3, lsl #3]
000307a0  cmp     r3, r1
000307a2  beq     #0x307b6
000307a4  adds    r1, #0x14
000307a6  cmp     r3, r1
000307a8  beq     #0x307e0
000307aa  cmp     r3, #0
000307ac  bne     #0x307ee
000307ae  mov     r0, r5
000307b0  bl      #0x54ce0 ; -> am_i_joy
000307b4  cbz     r0, #0x307dc
000307b6  ldr     r2, [r5, #8]
000307b8  ldr     r3, [r2, #0x1c]
000307ba  cmp     r3, #0
000307bc  str     r3, [r5, #0x1c]
000307be  blt     #0x307dc
000307c0  ldrsh.w r2, [r2, #0x12]
000307c4  ldr     r3, [r5]
000307c6  str     r2, [r5, #0x24]
000307c8  ldr     r3, [r3, #0x40]
000307ca  subs    r3, r3, r2
000307cc  cmp     r3, #0
000307ce  str     r3, [r5, #0x1c]
000307d0  itt     lt
000307d2  rsblt   r3, r3, #0
000307d4  strlt   r3, [r5, #0x1c]
000307d6  ldr     r3, [r5, #0x1c]
000307d8  cmp     r3, #0x14
000307da  ble     #0x307f4
000307dc  ldr.w   r2, [r4, #0xa4]
000307e0  cmp     r2, #0
000307e2  ble     #0x30804
000307e4  movs    r0, #0
000307e6  subs    r3, r2, #1
000307e8  str.w   r3, [r4, #0xa4]
000307ec  pop     {r4, r5, r7, pc}
000307ee  mvn     r0, #2
000307f2  b       #0x307ec
000307f4  mov     r0, r5
000307f6  bl      #0x2ec68 ; -> disable_all_buttons
000307fa  ldr     r0, [r5]
000307fc  movs    r3, #0
000307fe  str     r3, [r5, #0x34]
00030800  str     r3, [r0, #0x34]
00030802  b       #0x307dc
00030804  ldr     r1, [pc, #0x14]
00030806  lsls    r3, r2, #3
00030808  adds    r3, r3, r4
0003080a  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0003080c  str     r1, [r3, #4]
0003080e  ldr.w   r3, [r4, #0xa4]
00030812  movs    r0, #0
00030814  adds    r3, #1
00030816  str.w   r0, [r4, r3, lsl #3]
0003081a  b       #0x307ec
0003081c  ldr     pc, [r3, #0xff]!
