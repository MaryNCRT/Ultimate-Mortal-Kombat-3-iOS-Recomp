========================================================================
t_b_duck_hit_soft  0x000434a0  168 bytes   mkreact.c
========================================================================

000434a0  push    {r4, r5, r7, lr}
000434a2  add     r7, sp, #8
000434a4  ldr.w   r3, [r0, #0xa4]
000434a8  mov     r4, r0
000434aa  ldr.w   r5, [r0, #0x108]
000434ae  adds    r3, #1
000434b0  ldr.w   r0, [r0, r3, lsl #3]
000434b4  cbnz    r0, #0x434f2
000434b6  ldr     r3, [pc, #0x80]
000434b8  str     r0, [r5, #0x34]
000434ba  movw    r2, #0x135f
000434be  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
000434c0  str     r3, [r5, #0x30]
000434c2  ldr     r3, [pc, #0x78]
000434c4  add     r3, pc ; -> 0x00041645  t_cc_block_avoid_corner
000434c6  str     r3, [r5, #0x38]
000434c8  ldr.w   r3, [r4, #0xa4]
000434cc  adds    r3, #1
000434ce  str.w   r2, [r4, r3, lsl #3]
000434d2  ldr.w   r3, [r4, #0xa4]
000434d6  ldr     r2, [pc, #0x68]
000434d8  adds    r3, #1
000434da  str.w   r3, [r4, #0xa4]
000434de  lsls    r3, r3, #3
000434e0  adds    r3, r3, r4
000434e2  add     r2, pc ; -> 0x000475a1  t_blocked_start
000434e4  str     r2, [r3, #4]
000434e6  ldr.w   r3, [r4, #0xa4]
000434ea  adds    r3, #1
000434ec  str.w   r0, [r4, r3, lsl #3]
000434f0  pop     {r4, r5, r7, pc}
000434f2  movw    r3, #0x135f
000434f6  cmp     r0, r3
000434f8  it      ne
000434fa  mvnne   r0, #2
000434fe  bne     #0x434f0
00043500  mov     r0, r5
00043502  movs    r1, #6
00043504  bl      #0x57dbc ; -> rsnd_func
00043508  mov     r0, r5
0004350a  mov.w   r3, #0x20000
0004350e  str     r3, [r5, #0x1c]
00043510  bl      #0x55ab0 ; -> away_x_vel
00043514  movs    r3, #2
00043516  str     r3, [r5, #0x48]
00043518  adds    r3, #1
0004351a  str     r3, [r5, #0x44]
0004351c  ldr.w   r3, [r4, #0xa4]
00043520  ldr     r2, [pc, #0x20]
00043522  movs    r0, #0
00043524  lsls    r3, r3, #3
00043526  adds    r3, r3, r4
00043528  add     r2, pc ; -> 0x00044865  t_block_shake_n_exit
0004352a  str     r2, [r3, #4]
0004352c  ldr.w   r3, [r4, #0xa4]
00043530  adds    r3, #1
00043532  str.w   r0, [r4, r3, lsl #3]
00043536  b       #0x434f0
00043538  bl      #0x3d353a
0004353c  b       #0x4383a
0004353e  vshr.u64 d20, d27, #1
00043542  movs    r0, r0
00043544  asrs    r1, r7, #0xc
00043546  movs    r0, r0
