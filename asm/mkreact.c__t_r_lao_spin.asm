========================================================================
t_r_lao_spin  0x000469f0  244 bytes   mkreact.c
========================================================================

000469f0  push    {r4, r5, r7, lr}
000469f2  add     r7, sp, #8
000469f4  ldr.w   r2, [r0, #0xa4]
000469f8  mov     r5, r0
000469fa  ldr.w   r4, [r0, #0x108]
000469fe  adds    r3, r2, #1
00046a00  movw    r1, #0x725
00046a04  ldr.w   r0, [r0, r3, lsl #3]
00046a08  cmp     r0, r1
00046a0a  beq     #0x46a64
00046a0c  cmp.w   r0, #0x738
00046a10  beq     #0x46a4c
00046a12  cbz     r0, #0x46a1a
00046a14  mvn     r0, #2
00046a18  pop     {r4, r5, r7, pc}
00046a1a  str     r0, [r4, #0x30]
00046a1c  str     r0, [r4, #0x38]
00046a1e  movs    r3, #4
00046a20  str     r3, [r4, #0x34]
00046a22  ldr.w   r3, [r5, #0xa4]
00046a26  ldr     r2, [pc, #0xb0]
00046a28  adds    r3, #1
00046a2a  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046a2c  str.w   r1, [r5, r3, lsl #3]
00046a30  ldr.w   r3, [r5, #0xa4]
00046a34  adds    r3, #1
00046a36  str.w   r3, [r5, #0xa4]
00046a3a  lsls    r3, r3, #3
00046a3c  adds    r3, r3, r5
00046a3e  str     r2, [r3, #4]
00046a40  ldr.w   r3, [r5, #0xa4]
00046a44  adds    r3, #1
00046a46  str.w   r0, [r5, r3, lsl #3]
00046a4a  b       #0x46a18
00046a4c  ldr     r1, [pc, #0x8c]
00046a4e  add     r1, pc ; -> 0x000425b9  t_reaction_land
00046a50  lsls    r3, r2, #3
00046a52  adds    r3, r3, r5
00046a54  movs    r0, #0
00046a56  str     r1, [r3, #4]
00046a58  ldr.w   r3, [r5, #0xa4]
00046a5c  adds    r3, #1
00046a5e  str.w   r0, [r5, r3, lsl #3]
00046a62  b       #0x46a18
00046a64  mov     r0, r4
00046a66  bl      #0x54f40 ; -> set_half_damage
00046a6a  ldr     r2, [r4]
00046a6c  mov     r0, r4
00046a6e  movw    r3, #0x62b
00046a72  str     r3, [r2, #0x18]
00046a74  movs    r3, #1
00046a76  str     r3, [r4, #0x1c]
00046a78  bl      #0x5877c ; -> create_blood_proc
00046a7c  mov     r0, r4
00046a7e  mov.w   r3, #0x60006
00046a82  str     r3, [r4, #0x48]
00046a84  bl      #0x581e0 ; -> shake_a11
00046a88  movs    r1, #0xa
00046a8a  mov     r0, r4
00046a8c  bl      #0x57dbc ; -> rsnd_func
00046a90  mov     r0, r4
00046a92  movs    r3, #2
00046a94  str     r3, [r4, #0x1c]
00046a96  bl      #0x580a4 ; -> group_sound
00046a9a  mov.w   r3, #0x20000
00046a9e  str     r3, [r4, #0x1c]
00046aa0  sub.w   r3, r3, #0xe0000
00046aa4  str     r3, [r4, #0x20]
00046aa6  add.w   r3, r3, #0xc6000
00046aaa  str     r3, [r4, #0x24]
00046aac  movs    r3, #5
00046aae  str     r3, [r4, #0x28]
00046ab0  adds    r3, #0x19
00046ab2  str     r3, [r4, #0x40]
00046ab4  ldr.w   r3, [r5, #0xa4]
00046ab8  mov.w   r2, #0x738
00046abc  adds    r3, #1
00046abe  str.w   r2, [r5, r3, lsl #3]
00046ac2  ldr.w   r3, [r5, #0xa4]
00046ac6  adds    r2, r3, #1
00046ac8  ldr.w   r3, [pc, #0x14]
00046acc  str.w   r2, [r5, #0xa4]
00046ad0  add     r3, pc ; -> 0x000f3720  t_flight
00046ad2  ldr     r1, [r3]
00046ad4  b       #0x46a50
00046ad6  nop     
00046ad8  b       #0x46d8a
00046ada  vtbx.8  d27, {d15, d16, d17, d18}, d23
00046ade  vdup.8  q14, d12[7]
00046ae2  movs    r2, r1
