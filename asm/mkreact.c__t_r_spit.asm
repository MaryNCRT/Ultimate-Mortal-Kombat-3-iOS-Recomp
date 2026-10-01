========================================================================
t_r_spit  0x0004666c  164 bytes   mkreact.c
========================================================================

0004666c  push    {r4, r5, r6, r7, lr}
0004666e  add     r7, sp, #0xc
00046670  ldr.w   r3, [r0, #0xa4]
00046674  mov     r5, r0
00046676  ldr.w   r4, [r0, #0x108]
0004667a  adds    r3, #1
0004667c  ldr.w   r6, [r0, r3, lsl #3]
00046680  cmp     r6, #0
00046682  bne     #0x466d2
00046684  ldr     r2, [r4]
00046686  mov     r0, r4
00046688  movs    r1, #0x13
0004668a  movw    r3, #0x626
0004668e  str     r3, [r2, #0x48]
00046690  movs    r3, #0x10
00046692  str     r3, [r4, #0x1c]
00046694  bl      #0x57bb0 ; -> ochar_sound_c
00046698  ldr     r3, [pc, #0x68]
0004669a  str     r6, [r4, #0x34]
0004669c  str     r6, [r4, #0x38]
0004669e  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
000466a0  str     r3, [r4, #0x30]
000466a2  ldr.w   r3, [r5, #0xa4]
000466a6  mov.w   r2, #0x334
000466aa  mov     r0, r6
000466ac  adds    r3, #1
000466ae  str.w   r2, [r5, r3, lsl #3]
000466b2  ldr.w   r3, [r5, #0xa4]
000466b6  ldr     r2, [pc, #0x50]
000466b8  adds    r3, #1
000466ba  str.w   r3, [r5, #0xa4]
000466be  lsls    r3, r3, #3
000466c0  adds    r3, r3, r5
000466c2  add     r2, pc ; -> 0x00044b85  t_reaction_start
000466c4  str     r2, [r3, #4]
000466c6  ldr.w   r3, [r5, #0xa4]
000466ca  adds    r3, #1
000466cc  str.w   r6, [r5, r3, lsl #3]
000466d0  pop     {r4, r5, r6, r7, pc}
000466d2  cmp.w   r6, #0x334
000466d6  it      ne
000466d8  mvnne   r0, #2
000466dc  bne     #0x466d0
000466de  mov     r0, r4
000466e0  movs    r3, #2
000466e2  str     r3, [r4, #0x1c]
000466e4  bl      #0x580a4 ; -> group_sound
000466e8  ldr.w   r3, [r5, #0xa4]
000466ec  ldr     r2, [pc, #0x1c]
000466ee  movs    r0, #0
000466f0  lsls    r3, r3, #3
000466f2  adds    r3, r3, r5
000466f4  add     r2, pc ; -> 0x00041a79  t_stumble_back
000466f6  str     r2, [r3, #4]
000466f8  ldr.w   r3, [r5, #0xa4]
000466fc  adds    r3, #1
000466fe  str.w   r0, [r5, r3, lsl #3]
00046702  b       #0x466d0
00046704  stm     r1!, {r0, r1, r2, r3, r5, r7}
00046706  vsri.64 d30, d31, #1
