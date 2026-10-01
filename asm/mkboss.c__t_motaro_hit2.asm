========================================================================
t_motaro_hit2  0x000a99c4  296 bytes   mkboss.c
========================================================================

000a99c4  push    {r4, r5, r6, r7, lr}
000a99c6  add     r7, sp, #0xc
000a99c8  push.w  {r8, sl}
000a99cc  ldr.w   r2, [r0, #0xa4]
000a99d0  movw    r8, #0x7cc
000a99d4  mov     r4, r0
000a99d6  adds    r3, r2, #1
000a99d8  ldr.w   r6, [r0, #0x108]
000a99dc  ldr.w   r5, [r0, r3, lsl #3]
000a99e0  cmp     r5, r8
000a99e2  beq     #0xa9a4a
000a99e4  ble     #0xa99fe
000a99e6  movw    r3, #0x7cd
000a99ea  cmp     r5, r3
000a99ec  beq     #0xa9a5a
000a99ee  adds    r3, #2
000a99f0  cmp     r5, r3
000a99f2  beq     #0xa9a2e
000a99f4  mvn     r0, #2
000a99f8  pop.w   {r8, sl}
000a99fc  pop     {r4, r5, r6, r7, pc}
000a99fe  cmp     r5, #0
000a9a00  bne     #0xa99f4
000a9a02  mov     r0, r6
000a9a04  bl      #0x55070 ; -> am_i_airborn
000a9a08  ldr.w   sl, [r6, #0x5c]
000a9a0c  cmp.w   sl, #0
000a9a10  beq     #0xa9a7e
000a9a12  ldr.w   r3, [r4, #0xa4]
000a9a16  ldr     r2, [pc, #0xc0]
000a9a18  mov     r0, r5
000a9a1a  lsls    r3, r3, #3
000a9a1c  adds    r3, r3, r4
000a9a1e  add     r2, pc ; -> 0x000a8a6d  t_motaro_hit_flight
000a9a20  str     r2, [r3, #4]
000a9a22  ldr.w   r3, [r4, #0xa4]
000a9a26  adds    r3, #1
000a9a28  str.w   r5, [r4, r3, lsl #3]
000a9a2c  b       #0xa99f8
000a9a2e  ldr.w   r3, [pc, #0xac]
000a9a32  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a9a34  ldr     r1, [r3]
000a9a36  lsls    r3, r2, #3
000a9a38  adds    r3, r3, r4
000a9a3a  movs    r0, #0
000a9a3c  str     r1, [r3, #4]
000a9a3e  ldr.w   r3, [r4, #0xa4]
000a9a42  adds    r3, #1
000a9a44  str.w   r0, [r4, r3, lsl #3]
000a9a48  b       #0xa99f8
000a9a4a  movw    r2, #0x7cd
000a9a4e  str.w   r2, [r0, r3, lsl #3]
000a9a52  movs    r0, #6
000a9a54  str.w   r0, [r4, #0xfc]
000a9a58  b       #0xa99f8
000a9a5a  movs    r3, #3
000a9a5c  str     r3, [r6, #0x1c]
000a9a5e  ldr.w   r3, [r0, #0xa4]
000a9a62  movw    r2, #0x7cf
000a9a66  adds    r3, #1
000a9a68  str.w   r2, [r0, r3, lsl #3]
000a9a6c  ldr.w   r3, [r0, #0xa4]
000a9a70  adds    r2, r3, #1
000a9a72  ldr.w   r3, [pc, #0x6c]
000a9a76  str.w   r2, [r0, #0xa4]
000a9a7a  add     r3, pc ; -> 0x000f37cc  t_mframew
000a9a7c  b       #0xa9a34
000a9a7e  ldr     r5, [pc, #0x64]
000a9a80  movs    r1, #0xa
000a9a82  mov     r0, r6
000a9a84  bl      #0x57dbc ; -> rsnd_func
000a9a88  mov     r0, r6
000a9a8a  str     r5, [r6, #0x1c]
000a9a8c  bl      #0x5873c ; -> rsnd_ochar_sound
000a9a90  mov     r0, r6
000a9a92  mov.w   r3, #0x40000
000a9a96  str     r3, [r6, #0x1c]
000a9a98  bl      #0x55ab0 ; -> away_x_vel
000a9a9c  mov     r0, r6
000a9a9e  movs    r3, #0x1c
000a9aa0  str     r3, [r6, #0x40]
000a9aa2  bl      #0x5520c ; -> get_char_ani
000a9aa6  str     r5, [r6, #0x1c]
000a9aa8  ldr.w   r3, [r4, #0xa4]
000a9aac  mov     r0, sl
000a9aae  adds    r3, #1
000a9ab0  str.w   r8, [r4, r3, lsl #3]
000a9ab4  ldr.w   r3, [r4, #0xa4]
000a9ab8  adds    r2, r3, #1
000a9aba  ldr.w   r3, [pc, #0x2c]
000a9abe  str.w   r2, [r4, #0xa4]
000a9ac2  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
000a9ac4  ldr     r1, [r3]
000a9ac6  lsls    r3, r2, #3
000a9ac8  adds    r3, r3, r4
000a9aca  str     r1, [r3, #4]
000a9acc  ldr.w   r3, [r4, #0xa4]
000a9ad0  adds    r3, #1
000a9ad2  str.w   sl, [r4, r3, lsl #3]
000a9ad6  b       #0xa99f8
000a9ad8  bl      #0xf5ada
000a9adc  ldr     r4, [sp, #0x348]
000a9ade  movs    r4, r0
000a9ae0  ldr     r5, [sp, #0x138]
000a9ae2  movs    r4, r0
000a9ae4  movs    r2, r0
000a9ae6  movs    r3, r0
000a9ae8  ldr     r3, [sp, #0x3c8]
000a9aea  movs    r4, r0
