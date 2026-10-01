========================================================================
t_r_combo1_stab  0x00045be8  156 bytes   mkreact.c
========================================================================

00045be8  push    {r4, r5, r6, r7, lr}
00045bea  add     r7, sp, #0xc
00045bec  ldr.w   r3, [r0, #0xa4]
00045bf0  mov     r4, r0
00045bf2  ldr.w   r5, [r0, #0x108]
00045bf6  adds    r3, #1
00045bf8  ldr.w   r6, [r0, r3, lsl #3]
00045bfc  cbnz    r6, #0x45c40
00045bfe  mov     r0, r5
00045c00  bl      #0x424e0 ; -> combo_setup
00045c04  ldr     r3, [pc, #0x70]
00045c06  str     r6, [r5, #0x38]
00045c08  movw    r2, #0xc4d
00045c0c  add     r3, pc ; -> 0x0004289d  t_combo_airborn_hit
00045c0e  str     r3, [r5, #0x30]
00045c10  movs    r3, #5
00045c12  str     r3, [r5, #0x34]
00045c14  ldr.w   r3, [r4, #0xa4]
00045c18  mov     r0, r6
00045c1a  adds    r3, #1
00045c1c  str.w   r2, [r4, r3, lsl #3]
00045c20  ldr.w   r3, [r4, #0xa4]
00045c24  ldr     r2, [pc, #0x54]
00045c26  adds    r3, #1
00045c28  str.w   r3, [r4, #0xa4]
00045c2c  lsls    r3, r3, #3
00045c2e  adds    r3, r3, r4
00045c30  add     r2, pc ; -> 0x00044b85  t_reaction_start
00045c32  str     r2, [r3, #4]
00045c34  ldr.w   r3, [r4, #0xa4]
00045c38  adds    r3, #1
00045c3a  str.w   r6, [r4, r3, lsl #3]
00045c3e  pop     {r4, r5, r6, r7, pc}
00045c40  movw    r3, #0xc4d
00045c44  cmp     r6, r3
00045c46  it      ne
00045c48  mvnne   r0, #2
00045c4c  bne     #0x45c3e
00045c4e  mov     r0, r5
00045c50  bl      #0x54f20 ; -> set_no_block
00045c54  mov     r0, r5
00045c56  movs    r1, #3
00045c58  bl      #0x57dbc ; -> rsnd_func
00045c5c  ldr.w   r3, [r4, #0xa4]
00045c60  ldr     r2, [pc, #0x1c]
00045c62  movs    r0, #0
00045c64  lsls    r3, r3, #3
00045c66  adds    r3, r3, r4
00045c68  add     r2, pc ; -> 0x00045281  t_combo1
00045c6a  str     r2, [r3, #4]
00045c6c  ldr.w   r3, [r4, #0xa4]
00045c70  adds    r3, #1
00045c72  str.w   r0, [r4, r3, lsl #3]
00045c76  b       #0x45c3e
00045c78  ldm     r4!, {r0, r2, r3, r7}
