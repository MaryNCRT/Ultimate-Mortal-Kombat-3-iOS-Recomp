========================================================================
t_stumble_back_vel  0x00043df4  292 bytes   mkreact.c
========================================================================

00043df4  push    {r4, r5, r6, r7, lr}
00043df6  add     r7, sp, #0xc
00043df8  push.w  {r8, sl}
00043dfc  ldr.w   r2, [r0, #0xa4]
00043e00  movw    r8, #0x120a
00043e04  mov     r4, r0
00043e06  adds    r3, r2, #1
00043e08  ldr.w   r5, [r0, #0x108]
00043e0c  ldr.w   r6, [r0, r3, lsl #3]
00043e10  cmp     r6, r8
00043e12  beq     #0x43e90
00043e14  ble     #0x43e2e
00043e16  movw    r3, #0x1211
00043e1a  cmp     r6, r3
00043e1c  beq     #0x43e96
00043e1e  adds    r3, #3
00043e20  cmp     r6, r3
00043e22  beq     #0x43e76
00043e24  mvn     r0, #2
00043e28  pop.w   {r8, sl}
00043e2c  pop     {r4, r5, r6, r7, pc}
00043e2e  cmp     r6, #0
00043e30  bne     #0x43e24
00043e32  mov     r0, r5
00043e34  bl      #0x55ab0 ; -> away_x_vel
00043e38  mov     r0, r5
00043e3a  bl      #0x54ce0 ; -> am_i_joy
00043e3e  mov     sl, r0
00043e40  cmp     r0, #0
00043e42  beq     #0x43eba
00043e44  ldr     r3, [pc, #0xb4]
00043e46  mov     r0, r6
00043e48  str     r3, [r5, #0x40]
00043e4a  ldr.w   r3, [r4, #0xa4]
00043e4e  adds    r3, #1
00043e50  str.w   r8, [r4, r3, lsl #3]
00043e54  ldr.w   r3, [r4, #0xa4]
00043e58  adds    r2, r3, #1
00043e5a  ldr     r3, [pc, #0xa4]
00043e5c  str.w   r2, [r4, #0xa4]
00043e60  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00043e62  ldr     r1, [r3]
00043e64  lsls    r3, r2, #3
00043e66  adds    r3, r3, r4
00043e68  str     r1, [r3, #4]
00043e6a  ldr.w   r3, [r4, #0xa4]
00043e6e  adds    r3, #1
00043e70  str.w   r6, [r4, r3, lsl #3]
00043e74  b       #0x43e28
00043e76  ldr     r3, [pc, #0x8c]
00043e78  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00043e7a  ldr     r1, [r3]
00043e7c  lsls    r3, r2, #3
00043e7e  adds    r3, r3, r4
00043e80  movs    r0, #0
00043e82  str     r1, [r3, #4]
00043e84  ldr.w   r3, [r4, #0xa4]
00043e88  adds    r3, #1
00043e8a  str.w   r0, [r4, r3, lsl #3]
00043e8e  b       #0x43e28
00043e90  ldr     r3, [pc, #0x74]
00043e92  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00043e94  b       #0x43e7a
00043e96  movs    r3, #4
00043e98  str     r3, [r5, #0x1c]
00043e9a  ldr.w   r3, [r0, #0xa4]
00043e9e  movw    r2, #0x1214
00043ea2  adds    r3, #1
00043ea4  str.w   r2, [r0, r3, lsl #3]
00043ea8  ldr.w   r3, [r0, #0xa4]
00043eac  adds    r2, r3, #1
00043eae  ldr.w   r3, [pc, #0x5c]
00043eb2  str.w   r2, [r0, #0xa4]
00043eb6  add     r3, pc ; -> 0x000f37ac  t_d_beware_mframew
00043eb8  b       #0x43e7a
00043eba  mov     r0, r5
00043ebc  movs    r3, #0x20
00043ebe  str     r3, [r5, #0x40]
00043ec0  bl      #0x5520c ; -> get_char_ani
00043ec4  ldr     r3, [pc, #0x48]
00043ec6  movw    r2, #0x1211
00043eca  mov     r0, sl
00043ecc  str     r3, [r5, #0x1c]
00043ece  ldr.w   r3, [r4, #0xa4]
00043ed2  adds    r3, #1
00043ed4  str.w   r2, [r4, r3, lsl #3]
00043ed8  ldr.w   r3, [r4, #0xa4]
00043edc  adds    r2, r3, #1
00043ede  ldr.w   r3, [pc, #0x34]
00043ee2  str.w   r2, [r4, #0xa4]
00043ee6  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
00043ee8  ldr     r1, [r3]
00043eea  lsls    r3, r2, #3
00043eec  adds    r3, r3, r4
00043eee  str     r1, [r3, #4]
00043ef0  ldr.w   r3, [r4, #0xa4]
00043ef4  adds    r3, #1
00043ef6  str.w   sl, [r4, r3, lsl #3]
00043efa  b       #0x43e28
00043efc  movs    r0, r4
00043efe  movs    r4, r0
