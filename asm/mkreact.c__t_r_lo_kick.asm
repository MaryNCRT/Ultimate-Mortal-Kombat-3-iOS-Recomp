========================================================================
t_r_lo_kick  0x00044a24  232 bytes   mkreact.c
========================================================================

00044a24  push    {r4, r5, r6, r7, lr}
00044a26  add     r7, sp, #0xc
00044a28  str     r8, [sp, #-0x4]!
00044a2c  ldr.w   r2, [r0, #0xa4]
00044a30  movw    r8, #0x62d
00044a34  mov     r4, r0
00044a36  adds    r3, r2, #1
00044a38  ldr.w   r5, [r0, #0x108]
00044a3c  ldr.w   r6, [r0, r3, lsl #3]
00044a40  cmp     r6, r8
00044a42  beq     #0x44ab8
00044a44  movw    r3, #0x637
00044a48  cmp     r6, r3
00044a4a  beq     #0x44a9e
00044a4c  cbz     r6, #0x44a58
00044a4e  mvn     r0, #2
00044a52  ldr     r8, [sp], #4
00044a56  pop     {r4, r5, r6, r7, pc}
00044a58  mov     r0, r5
00044a5a  movs    r1, #0xc
00044a5c  bl      #0x57dbc ; -> rsnd_func
00044a60  mov     r0, r5
00044a62  bl      #0x420e4 ; -> rsnd_react_voice
00044a66  ldr     r3, [pc, #0x8c]
00044a68  str     r6, [r5, #0x38]
00044a6a  ldr     r2, [pc, #0x8c]
00044a6c  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00044a6e  str     r3, [r5, #0x30]
00044a70  movs    r3, #1
00044a72  str     r3, [r5, #0x34]
00044a74  ldr.w   r3, [r4, #0xa4]
00044a78  add     r2, pc ; -> 0x00044b85  t_reaction_start
00044a7a  mov     r0, r6
00044a7c  adds    r3, #1
00044a7e  str.w   r8, [r4, r3, lsl #3]
00044a82  ldr.w   r3, [r4, #0xa4]
00044a86  adds    r3, #1
00044a88  str.w   r3, [r4, #0xa4]
00044a8c  lsls    r3, r3, #3
00044a8e  adds    r3, r3, r4
00044a90  str     r2, [r3, #4]
00044a92  ldr.w   r3, [r4, #0xa4]
00044a96  adds    r3, #1
00044a98  str.w   r6, [r4, r3, lsl #3]
00044a9c  b       #0x44a52
00044a9e  ldr     r3, [pc, #0x5c]
00044aa0  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00044aa2  ldr     r1, [r3]
00044aa4  lsls    r3, r2, #3
00044aa6  adds    r3, r3, r4
00044aa8  movs    r0, #0
00044aaa  str     r1, [r3, #4]
00044aac  ldr.w   r3, [r4, #0xa4]
00044ab0  adds    r3, #1
00044ab2  str.w   r0, [r4, r3, lsl #3]
00044ab6  b       #0x44a52
00044ab8  mov     r0, r5
00044aba  mov.w   r3, #0x40000
00044abe  str     r3, [r5, #0x1c]
00044ac0  bl      #0x55ab0 ; -> away_x_vel
00044ac4  ldr     r3, [pc, #0x38]
00044ac6  mov     r0, r5
00044ac8  str     r3, [r5, #0x40]
00044aca  bl      #0x55808 ; -> am_i_short
00044ace  cbz     r0, #0x44ad6
00044ad0  ldr.w   r3, [pc, #0x30]
00044ad4  str     r3, [r5, #0x40]
00044ad6  ldr.w   r3, [r4, #0xa4]
00044ada  movw    r2, #0x637
00044ade  adds    r3, #1
00044ae0  str.w   r2, [r4, r3, lsl #3]
00044ae4  ldr.w   r3, [r4, #0xa4]
00044ae8  adds    r2, r3, #1
00044aea  ldr     r3, [pc, #0x1c]
00044aec  str.w   r2, [r4, #0xa4]
00044af0  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00044af2  b       #0x44aa2
00044af4  ble     #0x44aba
