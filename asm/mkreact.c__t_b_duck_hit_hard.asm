========================================================================
t_b_duck_hit_hard  0x000433f8  168 bytes   mkreact.c
========================================================================

000433f8  push    {r4, r5, r7, lr}
000433fa  add     r7, sp, #8
000433fc  ldr.w   r3, [r0, #0xa4]
00043400  mov     r4, r0
00043402  ldr.w   r5, [r0, #0x108]
00043406  adds    r3, #1
00043408  ldr.w   r0, [r0, r3, lsl #3]
0004340c  cbnz    r0, #0x4344a
0004340e  ldr     r3, [pc, #0x80]
00043410  str     r0, [r5, #0x34]
00043412  movw    r2, #0x136f
00043416  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00043418  str     r3, [r5, #0x30]
0004341a  ldr     r3, [pc, #0x78]
0004341c  add     r3, pc ; -> 0x00041645  t_cc_block_avoid_corner
0004341e  str     r3, [r5, #0x38]
00043420  ldr.w   r3, [r4, #0xa4]
00043424  adds    r3, #1
00043426  str.w   r2, [r4, r3, lsl #3]
0004342a  ldr.w   r3, [r4, #0xa4]
0004342e  ldr     r2, [pc, #0x68]
00043430  adds    r3, #1
00043432  str.w   r3, [r4, #0xa4]
00043436  lsls    r3, r3, #3
00043438  adds    r3, r3, r4
0004343a  add     r2, pc ; -> 0x000475a1  t_blocked_start
0004343c  str     r2, [r3, #4]
0004343e  ldr.w   r3, [r4, #0xa4]
00043442  adds    r3, #1
00043444  str.w   r0, [r4, r3, lsl #3]
00043448  pop     {r4, r5, r7, pc}
0004344a  movw    r3, #0x136f
0004344e  cmp     r0, r3
00043450  it      ne
00043452  mvnne   r0, #2
00043456  bne     #0x43448
00043458  mov     r0, r5
0004345a  movs    r1, #5
0004345c  bl      #0x57dbc ; -> rsnd_func
00043460  mov     r0, r5
00043462  mov.w   r3, #0x50000
00043466  str     r3, [r5, #0x1c]
00043468  bl      #0x55ab0 ; -> away_x_vel
0004346c  movs    r3, #2
0004346e  str     r3, [r5, #0x48]
00043470  adds    r3, #1
00043472  str     r3, [r5, #0x44]
00043474  ldr.w   r3, [r4, #0xa4]
00043478  ldr     r2, [pc, #0x20]
0004347a  movs    r0, #0
0004347c  lsls    r3, r3, #3
0004347e  adds    r3, r3, r4
00043480  add     r2, pc ; -> 0x00044865  t_block_shake_n_exit
00043482  str     r2, [r3, #4]
00043484  ldr.w   r3, [r4, #0xa4]
00043488  adds    r3, #1
0004348a  str.w   r0, [r4, r3, lsl #3]
0004348e  b       #0x43448
00043490  bl      #0xffc7b492
00043494  b       #0x438e2
