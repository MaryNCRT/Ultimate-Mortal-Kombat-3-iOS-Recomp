========================================================================
t_ct_square  0x00071340  356 bytes   mkdrone.c
========================================================================

00071340  push    {r4, r5, r6, r7, lr}
00071342  add     r7, sp, #0xc
00071344  ldr.w   r3, [r0, #0xa4]
00071348  movw    r2, #0x1243
0007134c  mov     r4, r0
0007134e  adds    r3, #1
00071350  ldr.w   r6, [r0, #0x108]
00071354  ldr.w   r5, [r0, r3, lsl #3]
00071358  cmp     r5, r2
0007135a  beq     #0x713bc
0007135c  ble     #0x71372
0007135e  movw    r3, #0x1248
00071362  cmp     r5, r3
00071364  beq     #0x7142c
00071366  adds    r3, #0xa
00071368  cmp     r5, r3
0007136a  beq     #0x71414
0007136c  mvn     r0, #2
00071370  b       #0x713f4
00071372  cmp     r5, #0
00071374  bne     #0x713f6
00071376  mov     r0, r6
00071378  bl      #0x2f3a0 ; -> get_x_dist
0007137c  ldr     r3, [r6, #0x28]
0007137e  cmp     r3, #0xfc
00071380  bgt     #0x713bc
00071382  movs    r3, #0x40
00071384  str     r3, [r6, #0x44]
00071386  ldr     r3, [pc, #0xf4]
00071388  movw    r2, #0x1241
0007138c  mov     r0, r5
0007138e  add     r3, pc ; -> 0x0006f1d9  q_my_back_to_him
00071390  str     r3, [r6, #0x48]
00071392  ldr.w   r3, [r4, #0xa4]
00071396  adds    r3, #1
00071398  str.w   r2, [r4, r3, lsl #3]
0007139c  ldr.w   r3, [r4, #0xa4]
000713a0  ldr     r2, [pc, #0xdc]
000713a2  adds    r3, #1
000713a4  str.w   r3, [r4, #0xa4]
000713a8  lsls    r3, r3, #3
000713aa  adds    r3, r3, r4
000713ac  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
000713ae  str     r2, [r3, #4]
000713b0  ldr.w   r3, [r4, #0xa4]
000713b4  adds    r3, #1
000713b6  str.w   r5, [r4, r3, lsl #3]
000713ba  b       #0x713f4
000713bc  movs    r3, #0x40
000713be  str     r3, [r6, #0x44]
000713c0  ldr     r3, [pc, #0xc0]
000713c2  movw    r2, #0x1248
000713c6  add     r3, pc ; -> 0x00068de5  q_is_he_dropping
000713c8  str     r3, [r6, #0x48]
000713ca  ldr.w   r3, [r4, #0xa4]
000713ce  adds    r3, #1
000713d0  str.w   r2, [r4, r3, lsl #3]
000713d4  ldr     r2, [pc, #0xb0]
000713d6  ldr.w   r3, [r4, #0xa4]
000713da  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
000713dc  adds    r3, #1
000713de  str.w   r3, [r4, #0xa4]
000713e2  lsls    r3, r3, #3
000713e4  adds    r3, r3, r4
000713e6  movs    r0, #0
000713e8  str     r2, [r3, #4]
000713ea  ldr.w   r3, [r4, #0xa4]
000713ee  adds    r3, #1
000713f0  str.w   r0, [r4, r3, lsl #3]
000713f4  pop     {r4, r5, r6, r7, pc}
000713f6  movw    r1, #0x1241
000713fa  cmp     r5, r1
000713fc  bne     #0x7136c
000713fe  str.w   r2, [r0, r3, lsl #3]
00071402  ldr.w   r2, [pc, #0x88]
00071406  ldr.w   r3, [r0, #0xa4]
0007140a  add     r2, pc ; -> 0x000716d9  t_d_turnaround_jsrp
0007140c  adds    r3, #1
0007140e  str.w   r3, [r0, #0xa4]
00071412  b       #0x713e2
00071414  mov     r0, r6
00071416  bl      #0x71328 ; -> d_either_edge_a5
0007141a  ldr     r0, [r6, #0x30]
0007141c  cmp     r0, #0x4f
0007141e  bgt     #0x71442
00071420  ldr.w   r2, [pc, #0x6c]
00071424  ldr.w   r3, [r4, #0xa4]
00071428  add     r2, pc ; -> 0x000676a1  t_d_uppercut
0007142a  b       #0x713e2
0007142c  mov     r0, r6
0007142e  bl      #0x2f3a0 ; -> get_x_dist
00071432  ldr     r3, [r6, #0x28]
00071434  cmp     r3, #0x4f
00071436  ble     #0x7144e
00071438  ldr     r2, [pc, #0x58]
0007143a  ldr.w   r3, [r4, #0xa4]
0007143e  add     r2, pc ; -> 0x00067f91  t_d_zap
00071440  b       #0x713e2
00071442  ldr.w   r2, [pc, #0x54]
00071446  ldr.w   r3, [r4, #0xa4]
0007144a  add     r2, pc ; -> 0x0006770d  t_d_hi_kick
0007144c  b       #0x713e2
0007144e  ldr.w   r3, [pc, #0x4c]
00071452  movw    r2, #0x1252
00071456  add     r3, pc ; -> 0x00068e65  q_square_lower
00071458  str     r3, [r6, #0x48]
0007145a  movs    r3, #0x40
0007145c  str     r3, [r6, #0x44]
0007145e  ldr.w   r3, [r4, #0xa4]
00071462  adds    r3, #1
00071464  str.w   r2, [r4, r3, lsl #3]
00071468  ldr.w   r2, [pc, #0x34]
0007146c  ldr.w   r3, [r4, #0xa4]
00071470  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
00071472  adds    r3, #1
00071474  str.w   r3, [r4, #0xa4]
00071478  b       #0x713e2
0007147a  nop     
0007147c  udf     #0x47
0007147e  vcvt.f16.u16 d16, d21, #1
00071482  movs    r0, r0
00071484  ldrb    r3, [r3, #8]
00071486  vdup.8  d16, d7[7]
0007148a  movs    r0, r0
0007148c  lsls    r3, r1, #0xb
0007148e  movs    r0, r0
00071490  str     r5, [r6, #0x24]
00071492  vtbx.8  d22, {d15, d16, d17, d18}, d15
00071496  vrshr.u64 d22, d31, #1
0007149a  vtbl.8  d23, {d15, d16, d17}, d11
