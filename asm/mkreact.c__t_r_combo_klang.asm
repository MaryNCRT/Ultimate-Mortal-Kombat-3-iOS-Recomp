========================================================================
t_r_combo_klang  0x00045b4c  156 bytes   mkreact.c
========================================================================

00045b4c  push    {r4, r5, r6, r7, lr}
00045b4e  add     r7, sp, #0xc
00045b50  ldr.w   r3, [r0, #0xa4]
00045b54  mov     r4, r0
00045b56  ldr.w   r5, [r0, #0x108]
00045b5a  adds    r3, #1
00045b5c  ldr.w   r6, [r0, r3, lsl #3]
00045b60  cbnz    r6, #0x45ba4
00045b62  mov     r0, r5
00045b64  bl      #0x424e0 ; -> combo_setup
00045b68  ldr     r3, [pc, #0x70]
00045b6a  str     r6, [r5, #0x38]
00045b6c  movw    r2, #0xc5a
00045b70  add     r3, pc ; -> 0x0004289d  t_combo_airborn_hit
00045b72  str     r3, [r5, #0x30]
00045b74  movs    r3, #5
00045b76  str     r3, [r5, #0x34]
00045b78  ldr.w   r3, [r4, #0xa4]
00045b7c  mov     r0, r6
00045b7e  adds    r3, #1
00045b80  str.w   r2, [r4, r3, lsl #3]
00045b84  ldr.w   r3, [r4, #0xa4]
00045b88  ldr     r2, [pc, #0x54]
00045b8a  adds    r3, #1
00045b8c  str.w   r3, [r4, #0xa4]
00045b90  lsls    r3, r3, #3
00045b92  adds    r3, r3, r4
00045b94  add     r2, pc ; -> 0x00044b85  t_reaction_start
00045b96  str     r2, [r3, #4]
00045b98  ldr.w   r3, [r4, #0xa4]
00045b9c  adds    r3, #1
00045b9e  str.w   r6, [r4, r3, lsl #3]
00045ba2  pop     {r4, r5, r6, r7, pc}
00045ba4  movw    r3, #0xc5a
00045ba8  cmp     r6, r3
00045baa  it      ne
00045bac  mvnne   r0, #2
00045bb0  bne     #0x45ba2
00045bb2  mov     r0, r5
00045bb4  bl      #0x54f20 ; -> set_no_block
00045bb8  mov     r0, r5
00045bba  movs    r1, #9
00045bbc  bl      #0x57dbc ; -> rsnd_func
00045bc0  ldr.w   r3, [r4, #0xa4]
00045bc4  ldr     r2, [pc, #0x1c]
00045bc6  movs    r0, #0
00045bc8  lsls    r3, r3, #3
00045bca  adds    r3, r3, r4
00045bcc  add     r2, pc ; -> 0x00045281  t_combo1
00045bce  str     r2, [r3, #4]
00045bd0  ldr.w   r3, [r4, #0xa4]
00045bd4  adds    r3, #1
00045bd6  str.w   r0, [r4, r3, lsl #3]
00045bda  b       #0x45ba2
00045bdc  ldm     r5, {r0, r3, r5}
