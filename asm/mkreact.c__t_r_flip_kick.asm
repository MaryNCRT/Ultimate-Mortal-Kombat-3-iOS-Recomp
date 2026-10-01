========================================================================
t_r_flip_kick  0x00046760  168 bytes   mkreact.c
========================================================================

00046760  push    {r4, r5, r6, r7, lr}
00046762  add     r7, sp, #0xc
00046764  ldr.w   r3, [r0, #0xa4]
00046768  mov     r5, r0
0004676a  ldr.w   r4, [r0, #0x108]
0004676e  adds    r3, #1
00046770  ldr.w   r6, [r0, r3, lsl #3]
00046774  cmp     r6, #0
00046776  bne     #0x467c2
00046778  mov     r0, r4
0004677a  movs    r1, #8
0004677c  bl      #0x57dbc ; -> rsnd_func
00046780  ldr     r3, [pc, #0x78]
00046782  mov     r0, r4
00046784  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00046786  str     r3, [r4, #0x30]
00046788  movs    r3, #8
0004678a  str     r3, [r4, #0x34]
0004678c  bl      #0x41354 ; -> if_shao_then_pass
00046790  str     r6, [r4, #0x38]
00046792  ldr.w   r3, [r5, #0xa4]
00046796  movw    r2, #0xe27
0004679a  mov     r0, r6
0004679c  adds    r3, #1
0004679e  str.w   r2, [r5, r3, lsl #3]
000467a2  ldr.w   r3, [r5, #0xa4]
000467a6  ldr     r2, [pc, #0x58]
000467a8  adds    r3, #1
000467aa  str.w   r3, [r5, #0xa4]
000467ae  lsls    r3, r3, #3
000467b0  adds    r3, r3, r5
000467b2  add     r2, pc ; -> 0x00044b85  t_reaction_start
000467b4  str     r2, [r3, #4]
000467b6  ldr.w   r3, [r5, #0xa4]
000467ba  adds    r3, #1
000467bc  str.w   r6, [r5, r3, lsl #3]
000467c0  pop     {r4, r5, r6, r7, pc}
000467c2  movw    r3, #0xe27
000467c6  cmp     r6, r3
000467c8  it      ne
000467ca  mvnne   r0, #2
000467ce  bne     #0x467c0
000467d0  mov     r0, r4
000467d2  bl      #0x54f40 ; -> set_half_damage
000467d6  ldr     r0, [r4]
000467d8  movw    r3, #0x507
000467dc  str     r3, [r4, #0x1c]
000467de  ldr     r2, [pc, #0x24]
000467e0  str     r3, [r0, #0x18]
000467e2  ldr.w   r3, [r5, #0xa4]
000467e6  add     r2, pc ; -> 0x00044d55  t_onback3
000467e8  movs    r0, #0
000467ea  lsls    r3, r3, #3
000467ec  adds    r3, r3, r5
000467ee  str     r2, [r3, #4]
000467f0  ldr.w   r3, [r5, #0xa4]
000467f4  adds    r3, #1
000467f6  str.w   r0, [r5, r3, lsl #3]
000467fa  b       #0x467c0
000467fc  stm     r0!, {r0, r3, r6, r7}
