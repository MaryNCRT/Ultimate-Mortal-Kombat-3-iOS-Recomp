========================================================================
t_r_combo5  0x00048620  204 bytes   mkreact.c
========================================================================

00048620  push    {r4, r5, r7, lr}
00048622  add     r7, sp, #8
00048624  ldr.w   r3, [r0, #0xa4]
00048628  mov     r5, r0
0004862a  ldr.w   r4, [r0, #0x108]
0004862e  adds    r3, #1
00048630  ldr.w   r3, [r0, r3, lsl #3]
00048634  cmp     r3, #0
00048636  bne     #0x48686
00048638  ldr     r3, [r4]
0004863a  ldr     r3, [r3, #4]
0004863c  ldr     r3, [r3, #0x24]
0004863e  cmp     r3, #0xd
00048640  str     r3, [r4, #0x1c]
00048642  beq     #0x486d8
00048644  mov     r0, r4
00048646  bl      #0x54f40 ; -> set_half_damage
0004864a  movs    r3, #4
0004864c  str     r3, [r4, #0x34]
0004864e  ldr     r3, [pc, #0x90]
00048650  movs    r0, #0
00048652  str     r0, [r4, #0x30]
00048654  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
00048656  str     r3, [r4, #0x38]
00048658  ldr.w   r3, [r5, #0xa4]
0004865c  movw    r2, #0x712
00048660  adds    r3, #1
00048662  str.w   r2, [r5, r3, lsl #3]
00048666  ldr.w   r3, [r5, #0xa4]
0004866a  ldr     r2, [pc, #0x78]
0004866c  adds    r3, #1
0004866e  str.w   r3, [r5, #0xa4]
00048672  lsls    r3, r3, #3
00048674  adds    r3, r3, r5
00048676  add     r2, pc ; -> 0x00044b85  t_reaction_start
00048678  str     r2, [r3, #4]
0004867a  ldr.w   r3, [r5, #0xa4]
0004867e  adds    r3, #1
00048680  str.w   r0, [r5, r3, lsl #3]
00048684  pop     {r4, r5, r7, pc}
00048686  movw    r2, #0x712
0004868a  cmp     r3, r2
0004868c  it      ne
0004868e  mvnne   r0, #2
00048692  bne     #0x48684
00048694  mov     r0, r4
00048696  movs    r3, #1
00048698  str     r3, [r4, #0x1c]
0004869a  bl      #0x5877c ; -> create_blood_proc
0004869e  mov     r0, r4
000486a0  mov.w   r3, #0x60006
000486a4  str     r3, [r4, #0x48]
000486a6  bl      #0x581e0 ; -> shake_a11
000486aa  mov     r0, r4
000486ac  movs    r1, #0xa
000486ae  bl      #0x57dbc ; -> rsnd_func
000486b2  mov     r0, r4
000486b4  movs    r3, #2
000486b6  str     r3, [r4, #0x1c]
000486b8  bl      #0x580a4 ; -> group_sound
000486bc  ldr.w   r3, [r5, #0xa4]
000486c0  ldr     r2, [pc, #0x24]
000486c2  movs    r0, #0
000486c4  lsls    r3, r3, #3
000486c6  adds    r3, r3, r5
000486c8  add     r2, pc ; -> 0x00045ed5  t_rup3
000486ca  str     r2, [r3, #4]
000486cc  ldr.w   r3, [r5, #0xa4]
000486d0  adds    r3, #1
000486d2  str.w   r0, [r5, r3, lsl #3]
000486d6  b       #0x48684
000486d8  mov     r0, r4
000486da  bl      #0x54f50 ; -> set_quarter_damage
000486de  b       #0x4864a
000486e0  str     r0, [sp, #0xa4]
