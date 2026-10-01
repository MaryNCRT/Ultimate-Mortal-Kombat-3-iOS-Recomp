========================================================================
t_r_jax_zap  0x00042358  168 bytes   mkreact.c
========================================================================

00042358  push    {r4, r5, r6, r7, lr}
0004235a  add     r7, sp, #0xc
0004235c  ldr.w   r3, [r0, #0xa4]
00042360  mov     r4, r0
00042362  ldr.w   r5, [r0, #0x108]
00042366  adds    r3, #1
00042368  ldr.w   r6, [r0, r3, lsl #3]
0004236c  cmp     r6, #0
0004236e  bne     #0x423c2
00042370  mov     r0, r5
00042372  movs    r3, #2
00042374  str     r3, [r5, #0x1c]
00042376  bl      #0x580a4 ; -> group_sound
0004237a  mov     r0, r5
0004237c  mov.w   r3, #0x60006
00042380  str     r3, [r5, #0x48]
00042382  bl      #0x581e0 ; -> shake_a11
00042386  ldr     r3, [pc, #0x6c]
00042388  str     r6, [r5, #0x38]
0004238a  movw    r2, #0x116b
0004238e  add     r3, pc ; -> 0x0004176d  t_airborn_hit_no_sound
00042390  str     r3, [r5, #0x30]
00042392  movs    r3, #1
00042394  str     r3, [r5, #0x34]
00042396  ldr.w   r3, [r4, #0xa4]
0004239a  mov     r0, r6
0004239c  adds    r3, #1
0004239e  str.w   r2, [r4, r3, lsl #3]
000423a2  ldr.w   r3, [r4, #0xa4]
000423a6  ldr     r2, [pc, #0x50]
000423a8  adds    r3, #1
000423aa  str.w   r3, [r4, #0xa4]
000423ae  lsls    r3, r3, #3
000423b0  adds    r3, r3, r4
000423b2  add     r2, pc ; -> 0x00044b85  t_reaction_start
000423b4  str     r2, [r3, #4]
000423b6  ldr.w   r3, [r4, #0xa4]
000423ba  adds    r3, #1
000423bc  str.w   r6, [r4, r3, lsl #3]
000423c0  pop     {r4, r5, r6, r7, pc}
000423c2  movw    r3, #0x116b
000423c6  cmp     r6, r3
000423c8  it      ne
000423ca  mvnne   r0, #2
000423ce  bne     #0x423c0
000423d0  mov.w   r3, #0x40000
000423d4  str     r3, [r5, #0x1c]
000423d6  ldr.w   r3, [r4, #0xa4]
000423da  ldr     r2, [pc, #0x20]
000423dc  movs    r0, #0
000423de  lsls    r3, r3, #3
000423e0  adds    r3, r3, r4
000423e2  add     r2, pc ; -> 0x00043df5  t_stumble_back_vel
000423e4  str     r2, [r3, #4]
000423e6  ldr.w   r3, [r4, #0xa4]
000423ea  adds    r3, #1
000423ec  str.w   r0, [r4, r3, lsl #3]
000423f0  b       #0x423c0
000423f2  nop     
000423f4  bl      #0x41e3f6
000423f8  movs    r7, #0xcf
000423fa  movs    r0, r0
000423fc  subs    r7, r1, r0
000423fe  movs    r0, r0
