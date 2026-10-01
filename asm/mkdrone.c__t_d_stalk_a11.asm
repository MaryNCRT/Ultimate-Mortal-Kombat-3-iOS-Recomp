========================================================================
t_d_stalk_a11  0x00072b94  292 bytes   mkdrone.c
========================================================================

00072b94  push    {r4, r5, r7, lr}
00072b96  add     r7, sp, #8
00072b98  ldr.w   r3, [r0, #0xa4]
00072b9c  mov     r4, r0
00072b9e  ldr.w   r5, [r0, #0x108]
00072ba2  adds    r2, r3, #1
00072ba4  ldr.w   r3, [r0, r2, lsl #3]
00072ba8  cmp.w   r3, #0x1f0
00072bac  beq     #0x72c12
00072bae  ble     #0x72bc4
00072bb0  movw    r2, #0x1f1
00072bb4  cmp     r3, r2
00072bb6  beq     #0x72c40
00072bb8  cmp.w   r3, #0x1f4
00072bbc  beq     #0x72bf8
00072bbe  mvn     r0, #2
00072bc2  pop     {r4, r5, r7, pc}
00072bc4  cmp     r3, #0
00072bc6  bne     #0x72bbe
00072bc8  mov     r0, r5
00072bca  bl      #0x55388 ; -> face_opponent
00072bce  mov     r0, r5
00072bd0  bl      #0x72928 ; -> d_walkf_setup
00072bd4  mov     r0, r5
00072bd6  bl      #0x551f0 ; -> am_i_facing_him
00072bda  cmp     r0, #0
00072bdc  bne     #0x72c76
00072bde  ldr.w   r3, [r4, #0xa4]
00072be2  ldr     r2, [pc, #0xc0]
00072be4  lsls    r3, r3, #3
00072be6  adds    r3, r3, r4
00072be8  add     r2, pc ; -> 0x00070675  t_d_turnaround
00072bea  str     r2, [r3, #4]
00072bec  ldr.w   r3, [r4, #0xa4]
00072bf0  adds    r3, #1
00072bf2  str.w   r0, [r4, r3, lsl #3]
00072bf6  b       #0x72bc2
00072bf8  mov     r0, r5
00072bfa  bl      #0x2f3a0 ; -> get_x_dist
00072bfe  ldr     r2, [r5, #0x28]
00072c00  ldr     r3, [r5, #0x48]
00072c02  cmp     r2, r3
00072c04  bge     #0x72c8c
00072c06  ldr.w   r2, [pc, #0xa0]
00072c0a  ldr.w   r3, [r4, #0xa4]
00072c0e  add     r2, pc ; -> 0x0006eda5  t_dist_retp
00072c10  b       #0x72c62
00072c12  movw    r3, #0x1f1
00072c16  str.w   r3, [r0, r2, lsl #3]
00072c1a  ldr.w   r3, [r0, #0xa4]
00072c1e  adds    r2, r3, #1
00072c20  ldr.w   r3, [pc, #0x88]
00072c24  str.w   r2, [r0, #0xa4]
00072c28  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
00072c2a  ldr     r1, [r3]
00072c2c  lsls    r3, r2, #3
00072c2e  adds    r3, r3, r0
00072c30  str     r1, [r3, #4]
00072c32  ldr.w   r3, [r0, #0xa4]
00072c36  movs    r0, #0
00072c38  adds    r3, #1
00072c3a  str.w   r0, [r4, r3, lsl #3]
00072c3e  b       #0x72bc2
00072c40  mov     r0, r5
00072c42  bl      #0x5a680 ; -> next_anirate
00072c46  ldr.w   r3, [r4, #0xa4]
00072c4a  mov.w   r2, #0x1f4
00072c4e  adds    r3, #1
00072c50  str.w   r2, [r4, r3, lsl #3]
00072c54  ldr     r2, [pc, #0x58]
00072c56  ldr.w   r3, [r4, #0xa4]
00072c5a  add     r2, pc ; -> 0x0006c40d  t_d_beware
00072c5c  adds    r3, #1
00072c5e  str.w   r3, [r4, #0xa4]
00072c62  lsls    r3, r3, #3
00072c64  adds    r3, r3, r4
00072c66  movs    r0, #0
00072c68  str     r2, [r3, #4]
00072c6a  ldr.w   r3, [r4, #0xa4]
00072c6e  adds    r3, #1
00072c70  str.w   r0, [r4, r3, lsl #3]
00072c74  b       #0x72bc2
00072c76  ldr.w   r3, [r4, #0xa4]
00072c7a  movs    r0, #1
00072c7c  mov.w   r2, #0x1f0
00072c80  adds    r3, #1
00072c82  str.w   r2, [r4, r3, lsl #3]
00072c86  str.w   r0, [r4, #0xfc]
00072c8a  b       #0x72bc2
00072c8c  ldr     r3, [r5, #0x44]
00072c8e  subs    r3, #1
00072c90  cmp     r3, #0
00072c92  str     r3, [r5, #0x44]
00072c94  bgt     #0x72bd4
00072c96  ldr.w   r2, [pc, #0x1c]
00072c9a  ldr.w   r3, [r4, #0xa4]
00072c9e  add     r2, pc ; -> 0x0006eda5  t_dist_retp
00072ca0  b       #0x72c62
00072ca2  nop     
00072ca4  bge     #0x72bba
00072ca6  vsra.u64 d28, d3, #1
