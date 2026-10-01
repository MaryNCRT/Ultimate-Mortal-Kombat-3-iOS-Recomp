========================================================================
t_r_tusk_zap  0x00046324  152 bytes   mkreact.c
========================================================================

00046324  push    {r4, r5, r6, r7, lr}
00046326  add     r7, sp, #0xc
00046328  ldr.w   r3, [r0, #0xa4]
0004632c  mov     r4, r0
0004632e  ldr.w   r5, [r0, #0x108]
00046332  adds    r3, #1
00046334  ldr.w   r6, [r0, r3, lsl #3]
00046338  cmp     r6, #0
0004633a  bne     #0x46384
0004633c  mov     r0, r5
0004633e  mov.w   r3, #0x60006
00046342  str     r3, [r5, #0x48]
00046344  bl      #0x581e0 ; -> shake_a11
00046348  ldr     r3, [pc, #0x64]
0004634a  str     r6, [r5, #0x38]
0004634c  movw    r2, #0x10cd
00046350  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00046352  str     r3, [r5, #0x30]
00046354  movs    r3, #1
00046356  str     r3, [r5, #0x34]
00046358  ldr.w   r3, [r4, #0xa4]
0004635c  adds    r3, #1
0004635e  str.w   r2, [r4, r3, lsl #3]
00046362  ldr     r2, [pc, #0x50]
00046364  ldr.w   r3, [r4, #0xa4]
00046368  add     r2, pc ; -> 0x00044b85  t_reaction_start
0004636a  adds    r3, #1
0004636c  str.w   r3, [r4, #0xa4]
00046370  lsls    r3, r3, #3
00046372  adds    r3, r3, r4
00046374  mov     r0, r6
00046376  str     r2, [r3, #4]
00046378  ldr.w   r3, [r4, #0xa4]
0004637c  adds    r3, #1
0004637e  str.w   r6, [r4, r3, lsl #3]
00046382  pop     {r4, r5, r6, r7, pc}
00046384  movw    r3, #0x10cd
00046388  cmp     r6, r3
0004638a  it      ne
0004638c  mvnne   r0, #2
00046390  bne     #0x46382
00046392  mov     r0, r5
00046394  movs    r6, #0
00046396  str     r6, [r5, #0x1c]
00046398  bl      #0x57b94 ; -> his_ochar_sound
0004639c  ldr.w   r2, [pc, #0x18]
000463a0  mov.w   r3, #0x40000
000463a4  str     r3, [r5, #0x1c]
000463a6  ldr.w   r3, [r4, #0xa4]
000463aa  add     r2, pc ; -> 0x00043df5  t_stumble_back_vel
000463ac  b       #0x46370
000463ae  nop     
000463b0  stm     r4!, {r0, r2, r3, r4, r5, r6, r7}
