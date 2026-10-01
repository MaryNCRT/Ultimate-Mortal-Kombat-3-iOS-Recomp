========================================================================
t_r_uppercut  0x00045348  200 bytes   mkreact.c
========================================================================

00045348  push    {r4, r5, r7, lr}
0004534a  add     r7, sp, #8
0004534c  ldr.w   r3, [r0, #0xa4]
00045350  mov     r4, r0
00045352  ldr.w   r5, [r0, #0x108]
00045356  adds    r3, #1
00045358  ldr.w   r0, [r0, r3, lsl #3]
0004535c  cmp     r0, #0
0004535e  bne     #0x453a4
00045360  movs    r3, #4
00045362  str     r3, [r5, #0x34]
00045364  ldr     r3, [pc, #0x94]
00045366  ldr     r2, [r5, #0x44]
00045368  str     r0, [r5, #0x30]
0004536a  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
0004536c  str     r3, [r5, #0x38]
0004536e  ldr     r3, [pc, #0x90]
00045370  cmp     r2, r3
00045372  it      eq
00045374  streq   r0, [r5, #0x38]
00045376  ldr.w   r3, [r4, #0xa4]
0004537a  mov.w   r2, #0x748
0004537e  adds    r3, #1
00045380  str.w   r2, [r4, r3, lsl #3]
00045384  ldr.w   r3, [r4, #0xa4]
00045388  ldr     r2, [pc, #0x78]
0004538a  adds    r3, #1
0004538c  str.w   r3, [r4, #0xa4]
00045390  lsls    r3, r3, #3
00045392  adds    r3, r3, r4
00045394  add     r2, pc ; -> 0x00044b85  t_reaction_start
00045396  str     r2, [r3, #4]
00045398  ldr.w   r3, [r4, #0xa4]
0004539c  adds    r3, #1
0004539e  str.w   r0, [r4, r3, lsl #3]
000453a2  pop     {r4, r5, r7, pc}
000453a4  cmp.w   r0, #0x748
000453a8  it      ne
000453aa  mvnne   r0, #2
000453ae  bne     #0x453a2
000453b0  mov     r0, r5
000453b2  movs    r3, #1
000453b4  str     r3, [r5, #0x1c]
000453b6  bl      #0x5877c ; -> create_blood_proc
000453ba  mov     r0, r5
000453bc  mov.w   r3, #0x60006
000453c0  str     r3, [r5, #0x48]
000453c2  bl      #0x581e0 ; -> shake_a11
000453c6  mov     r0, r5
000453c8  movs    r1, #0xa
000453ca  bl      #0x57dbc ; -> rsnd_func
000453ce  ldr     r0, [r5, #0x44]
000453d0  ldr     r3, [pc, #0x2c]
000453d2  cmp     r0, r3
000453d4  beq     #0x453f4
000453d6  ldr.w   r2, [pc, #0x30]
000453da  add     r2, pc ; -> 0x000421d5  t_pit_abort
000453dc  ldr.w   r3, [r4, #0xa4]
000453e0  movs    r0, #0
000453e2  lsls    r3, r3, #3
000453e4  adds    r3, r3, r4
000453e6  str     r2, [r3, #4]
000453e8  ldr.w   r3, [r4, #0xa4]
000453ec  adds    r3, #1
000453ee  str.w   r0, [r4, r3, lsl #3]
000453f2  b       #0x453a2
000453f4  ldr     r2, [pc, #0x14]
000453f6  add     r2, pc ; -> 0x00041365  t_background_death
000453f8  b       #0x453dc
000453fa  nop     
000453fc  stm     r3!, {r0, r1, r4}
000453fe  vtbl.8  d29, {d15, d16, d17, d18}, d0
00045402  movs    r6, r1
00045404  bl      #0x33406
00045408  ldm     r5, {r0, r1, r2, r4, r5, r6, r7}
