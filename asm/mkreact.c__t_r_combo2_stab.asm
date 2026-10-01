========================================================================
t_r_combo2_stab  0x00045a14  156 bytes   mkreact.c
========================================================================

00045a14  push    {r4, r5, r6, r7, lr}
00045a16  add     r7, sp, #0xc
00045a18  ldr.w   r3, [r0, #0xa4]
00045a1c  mov     r4, r0
00045a1e  ldr.w   r5, [r0, #0x108]
00045a22  adds    r3, #1
00045a24  ldr.w   r6, [r0, r3, lsl #3]
00045a28  cbnz    r6, #0x45a6c
00045a2a  mov     r0, r5
00045a2c  bl      #0x424e0 ; -> combo_setup
00045a30  ldr     r3, [pc, #0x70]
00045a32  str     r6, [r5, #0x38]
00045a34  movw    r2, #0xc88
00045a38  add     r3, pc ; -> 0x0004289d  t_combo_airborn_hit
00045a3a  str     r3, [r5, #0x30]
00045a3c  movs    r3, #9
00045a3e  str     r3, [r5, #0x34]
00045a40  ldr.w   r3, [r4, #0xa4]
00045a44  mov     r0, r6
00045a46  adds    r3, #1
00045a48  str.w   r2, [r4, r3, lsl #3]
00045a4c  ldr.w   r3, [r4, #0xa4]
00045a50  ldr     r2, [pc, #0x54]
00045a52  adds    r3, #1
00045a54  str.w   r3, [r4, #0xa4]
00045a58  lsls    r3, r3, #3
00045a5a  adds    r3, r3, r4
00045a5c  add     r2, pc ; -> 0x00044b85  t_reaction_start
00045a5e  str     r2, [r3, #4]
00045a60  ldr.w   r3, [r4, #0xa4]
00045a64  adds    r3, #1
00045a66  str.w   r6, [r4, r3, lsl #3]
00045a6a  pop     {r4, r5, r6, r7, pc}
00045a6c  movw    r3, #0xc88
00045a70  cmp     r6, r3
00045a72  it      ne
00045a74  mvnne   r0, #2
00045a78  bne     #0x45a6a
00045a7a  mov     r0, r5
00045a7c  bl      #0x54f20 ; -> set_no_block
00045a80  mov     r0, r5
00045a82  movs    r1, #3
00045a84  bl      #0x57dbc ; -> rsnd_func
00045a88  ldr.w   r3, [r4, #0xa4]
00045a8c  ldr     r2, [pc, #0x1c]
00045a8e  movs    r0, #0
00045a90  lsls    r3, r3, #3
00045a92  adds    r3, r3, r4
00045a94  add     r2, pc ; -> 0x00046945  t_combo2
00045a96  str     r2, [r3, #4]
00045a98  ldr.w   r3, [r4, #0xa4]
00045a9c  adds    r3, #1
00045a9e  str.w   r0, [r4, r3, lsl #3]
00045aa2  b       #0x45a6a
00045aa4  ldm     r6, {r0, r5, r6}
