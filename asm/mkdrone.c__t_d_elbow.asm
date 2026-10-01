========================================================================
t_d_elbow  0x000723cc  216 bytes   mkdrone.c
========================================================================

000723cc  push    {r4, r5, r6, r7, lr}
000723ce  add     r7, sp, #0xc
000723d0  str     r8, [sp, #-0x4]!
000723d4  ldr.w   r2, [r0, #0xa4]
000723d8  mov     r4, r0
000723da  ldr.w   r5, [r0, #0x108]
000723de  adds    r3, r2, #1
000723e0  ldr.w   r6, [r0, r3, lsl #3]
000723e4  cbnz    r6, #0x72416
000723e6  mov     r0, r5
000723e8  bl      #0x55060 ; -> is_he_airborn
000723ec  ldr.w   r8, [r5, #0x5c]
000723f0  cmp.w   r8, #0
000723f4  beq     #0x7243e
000723f6  ldr.w   r3, [r4, #0xa4]
000723fa  ldr     r2, [pc, #0x98]
000723fc  mov     r0, r6
000723fe  lsls    r3, r3, #3
00072400  adds    r3, r3, r4
00072402  add     r2, pc ; -> 0x000687ad  t_d_rapid_lo
00072404  str     r2, [r3, #4]
00072406  ldr.w   r3, [r4, #0xa4]
0007240a  adds    r3, #1
0007240c  str.w   r6, [r4, r3, lsl #3]
00072410  ldr     r8, [sp], #4
00072414  pop     {r4, r5, r6, r7, pc}
00072416  cmp.w   r6, #0x164
0007241a  it      ne
0007241c  mvnne   r0, #2
00072420  bne     #0x72410
00072422  ldr.w   r3, [pc, #0x74]
00072426  movs    r0, #0
00072428  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007242a  ldr     r1, [r3]
0007242c  lsls    r3, r2, #3
0007242e  adds    r3, r3, r4
00072430  str     r1, [r3, #4]
00072432  ldr.w   r3, [r4, #0xa4]
00072436  adds    r3, #1
00072438  str.w   r0, [r4, r3, lsl #3]
0007243c  b       #0x72410
0007243e  mov     r0, r5
00072440  bl      #0x557cc ; -> is_he_short
00072444  cbz     r0, #0x72462
00072446  ldr.w   r3, [r4, #0xa4]
0007244a  ldr     r2, [pc, #0x50]
0007244c  mov     r0, r8
0007244e  lsls    r3, r3, #3
00072450  adds    r3, r3, r4
00072452  add     r2, pc ; -> 0x0006f5c1  t_d_knee
00072454  str     r2, [r3, #4]
00072456  ldr.w   r3, [r4, #0xa4]
0007245a  adds    r3, #1
0007245c  str.w   r8, [r4, r3, lsl #3]
00072460  b       #0x72410
00072462  ldr.w   r3, [r4, #0xa4]
00072466  mov.w   r2, #0x164
0007246a  adds    r3, #1
0007246c  str.w   r2, [r4, r3, lsl #3]
00072470  ldr.w   r3, [r4, #0xa4]
00072474  adds    r2, r3, #1
00072476  ldr     r3, [pc, #0x28]
00072478  str.w   r2, [r4, #0xa4]
0007247c  add     r3, pc ; -> 0x000f3888  t_do_elbow
0007247e  ldr     r1, [r3]
00072480  lsls    r3, r2, #3
00072482  adds    r3, r3, r4
00072484  str     r1, [r3, #4]
00072486  ldr.w   r3, [r4, #0xa4]
0007248a  adds    r3, #1
0007248c  str.w   r0, [r4, r3, lsl #3]
00072490  b       #0x72410
00072492  nop     
00072494  str     r7, [r4, #0x38]
