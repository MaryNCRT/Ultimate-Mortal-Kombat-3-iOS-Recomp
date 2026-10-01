========================================================================
t_b_uppercut  0x000437c8  176 bytes   mkreact.c
========================================================================

000437c8  push    {r4, r5, r6, r7, lr}
000437ca  add     r7, sp, #0xc
000437cc  ldr.w   r3, [r0, #0xa4]
000437d0  mov     r5, r0
000437d2  ldr.w   r4, [r0, #0x108]
000437d6  adds    r3, #1
000437d8  ldr.w   r6, [r0, r3, lsl #3]
000437dc  cmp     r6, #0
000437de  bne     #0x4382e
000437e0  mov     r0, r4
000437e2  movs    r1, #5
000437e4  bl      #0x57dbc ; -> rsnd_func
000437e8  mov     r0, r4
000437ea  mov.w   r3, #0x40004
000437ee  str     r3, [r4, #0x48]
000437f0  bl      #0x581e0 ; -> shake_a11
000437f4  ldr     r3, [pc, #0x74]
000437f6  str     r6, [r4, #0x30]
000437f8  str     r6, [r4, #0x34]
000437fa  add     r3, pc ; -> 0x000416bd  t_cc_block_upcut
000437fc  str     r3, [r4, #0x38]
000437fe  ldr.w   r3, [r5, #0xa4]
00043802  movw    r2, #0x12f6
00043806  mov     r0, r6
00043808  adds    r3, #1
0004380a  str.w   r2, [r5, r3, lsl #3]
0004380e  ldr.w   r3, [r5, #0xa4]
00043812  ldr     r2, [pc, #0x5c]
00043814  adds    r3, #1
00043816  str.w   r3, [r5, #0xa4]
0004381a  lsls    r3, r3, #3
0004381c  adds    r3, r3, r5
0004381e  add     r2, pc ; -> 0x000475a1  t_blocked_start
00043820  str     r2, [r3, #4]
00043822  ldr.w   r3, [r5, #0xa4]
00043826  adds    r3, #1
00043828  str.w   r6, [r5, r3, lsl #3]
0004382c  pop     {r4, r5, r6, r7, pc}
0004382e  movw    r3, #0x12f6
00043832  cmp     r6, r3
00043834  it      ne
00043836  mvnne   r0, #2
0004383a  bne     #0x4382c
0004383c  mov     r0, r4
0004383e  mov.w   r3, #0x40000
00043842  str     r3, [r4, #0x1c]
00043844  bl      #0x55ab0 ; -> away_x_vel
00043848  movs    r3, #2
0004384a  str     r3, [r4, #0x48]
0004384c  adds    r3, r3, r3
0004384e  str     r3, [r4, #0x44]
00043850  ldr.w   r3, [r5, #0xa4]
00043854  ldr     r2, [pc, #0x1c]
00043856  movs    r0, #0
00043858  lsls    r3, r3, #3
0004385a  adds    r3, r3, r5
0004385c  add     r2, pc ; -> 0x00044865  t_block_shake_n_exit
0004385e  str     r2, [r3, #4]
00043860  ldr.w   r3, [r5, #0xa4]
00043864  adds    r3, #1
00043866  str.w   r0, [r5, r3, lsl #3]
0004386a  b       #0x4382c
0004386c  udf     #0xbf
