========================================================================
t_lia_forward_proc  0x0007c1e4  436 bytes   mkzap.c
========================================================================

0007c1e4  push    {r4, r5, r6, r7, lr}
0007c1e6  add     r7, sp, #0xc
0007c1e8  str     r8, [sp, #-0x4]!
0007c1ec  ldr.w   r2, [r0, #0xa4]
0007c1f0  movw    r8, #0x7a4
0007c1f4  mov     r5, r0
0007c1f6  adds    r3, r2, #1
0007c1f8  ldr.w   r4, [r0, #0x108]
0007c1fc  ldr.w   r6, [r0, r3, lsl #3]
0007c200  cmp     r6, r8
0007c202  beq     #0x7c288
0007c204  ble     #0x7c21e
0007c206  movw    r3, #0x7b2
0007c20a  cmp     r6, r3
0007c20c  beq     #0x7c2a6
0007c20e  adds    r3, #0x19
0007c210  cmp     r6, r3
0007c212  beq     #0x7c270
0007c214  mvn     r0, #2
0007c218  ldr     r8, [sp], #4
0007c21c  pop     {r4, r5, r6, r7, pc}
0007c21e  cmp     r6, #0
0007c220  bne     #0x7c214
0007c222  movs    r3, #8
0007c224  mov     r0, r4
0007c226  str     r3, [r4, #0x1c]
0007c228  adds    r3, #0x18
0007c22a  str     r3, [r4, #0x20]
0007c22c  bl      #0x570ac ; -> multi_adjust_xy
0007c230  ldr     r3, [pc, #0x140]
0007c232  str     r3, [r4, #0x1c]
0007c234  ldr     r3, [r4, #0x48]
0007c236  cmp.w   r3, #0x80000
0007c23a  itt     ne
0007c23c  movne.w r3, #0x10001
0007c240  strne   r3, [r4, #0x1c]
0007c242  ldr.w   r3, [r5, #0xa4]
0007c246  adds    r3, #1
0007c248  str.w   r8, [r5, r3, lsl #3]
0007c24c  ldr.w   r3, [r5, #0xa4]
0007c250  adds    r2, r3, #1
0007c252  ldr     r3, [pc, #0x124]
0007c254  str.w   r2, [r5, #0xa4]
0007c258  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
0007c25a  ldr     r1, [r3]
0007c25c  lsls    r3, r2, #3
0007c25e  adds    r3, r3, r5
0007c260  mov     r0, r6
0007c262  str     r1, [r3, #4]
0007c264  ldr.w   r3, [r5, #0xa4]
0007c268  adds    r3, #1
0007c26a  str.w   r6, [r5, r3, lsl #3]
0007c26e  b       #0x7c218
0007c270  ldr     r1, [pc, #0x108]
0007c272  lsls    r3, r2, #3
0007c274  adds    r3, r3, r0
0007c276  add     r1, pc ; -> 0x00075665  tl_delete_proj_and_die
0007c278  str     r1, [r3, #4]
0007c27a  ldr.w   r3, [r0, #0xa4]
0007c27e  movs    r0, #0
0007c280  adds    r3, #1
0007c282  str.w   r0, [r5, r3, lsl #3]
0007c286  b       #0x7c218
0007c288  ldr     r3, [pc, #0xf4]
0007c28a  mov.w   r8, #0x15
0007c28e  mov     r0, r4
0007c290  str.w   r8, [r4, #0x1c]
0007c294  str     r3, [r4, #0x20]
0007c296  ldr.w   r3, [pc, #0xec]
0007c29a  str     r3, [r4, #0x24]
0007c29c  bl      #0x75f1c ; -> local_strike_check_box
0007c2a0  ldr     r6, [r4, #0x5c]
0007c2a2  cmp     r6, #0
0007c2a4  beq     #0x7c32c
0007c2a6  mov     r0, r4
0007c2a8  movs    r3, #3
0007c2aa  str     r3, [r4, #0x1c]
0007c2ac  bl      #0x57be4 ; -> ochar_sound
0007c2b0  ldr     r3, [r4]
0007c2b2  mov     r0, r4
0007c2b4  movs    r6, #0
0007c2b6  ldr     r3, [r3, #4]
0007c2b8  str     r3, [r4, #0x20]
0007c2ba  ldr     r3, [r4, #8]
0007c2bc  str     r3, [r4, #0x1c]
0007c2be  bl      #0x57214 ; -> lineup_a0_onto_a1
0007c2c2  mov     r0, r4
0007c2c4  bl      #0x55394 ; -> flip_multi
0007c2c8  mov     r0, r4
0007c2ca  mvn     r3, #0x7f
0007c2ce  str     r6, [r4, #0x20]
0007c2d0  str     r3, [r4, #0x1c]
0007c2d2  bl      #0x570ac ; -> multi_adjust_xy
0007c2d6  ldr     r3, [pc, #0xb0]
0007c2d8  ldr     r2, [r4, #8]
0007c2da  mov     r0, r4
0007c2dc  add     r3, pc ; -> 0x000f357c  G
0007c2de  ldr     r3, [r3]
0007c2e0  ldr.w   r3, [r3, #0xac]
0007c2e4  subs    r3, #0xe0
0007c2e6  str     r3, [r4, #0x1c]
0007c2e8  strh    r3, [r2, #0x12]
0007c2ea  ldr     r3, [pc, #0xa0]
0007c2ec  str     r3, [r4, #0x48]
0007c2ee  bl      #0x581e0 ; -> shake_a11
0007c2f2  ldr     r0, [r4, #8]
0007c2f4  bl      #0x55a60 ; -> stop_a8
0007c2f8  mov     r0, r4
0007c2fa  movs    r3, #0x3f
0007c2fc  str     r3, [r4, #0x40]
0007c2fe  bl      #0x55474 ; -> find_ani_part2
0007c302  ldr     r3, [r4, #0x40]
0007c304  movw    r2, #0x7cb
0007c308  adds    r3, #0xc
0007c30a  str     r3, [r4, #0x40]
0007c30c  movs    r3, #2
0007c30e  str     r3, [r4, #0x1c]
0007c310  ldr.w   r3, [r5, #0xa4]
0007c314  adds    r3, #1
0007c316  str.w   r2, [r5, r3, lsl #3]
0007c31a  ldr.w   r3, [r5, #0xa4]
0007c31e  adds    r2, r3, #1
0007c320  ldr.w   r3, [pc, #0x6c]
0007c324  str.w   r2, [r5, #0xa4]
0007c328  add     r3, pc ; -> 0x000f37cc  t_mframew
0007c32a  b       #0x7c25a
0007c32c  mov     r0, r4
0007c32e  movs    r3, #4
0007c330  str     r3, [r4, #0x1c]
0007c332  bl      #0x553a0 ; -> init_anirate
0007c336  ldr     r3, [r4, #0x48]
0007c338  mov     r0, r4
0007c33a  str     r3, [r4, #0x1c]
0007c33c  bl      #0x75d6c ; -> set_proj_vel
0007c340  str.w   r8, [r4, #0x48]
0007c344  ldr.w   r3, [r5, #0xa4]
0007c348  movw    r2, #0x7b2
0007c34c  mov     r0, r6
0007c34e  adds    r3, #1
0007c350  str.w   r2, [r5, r3, lsl #3]
0007c354  ldr.w   r3, [r5, #0xa4]
0007c358  ldr     r2, [pc, #0x38]
0007c35a  adds    r3, #1
0007c35c  str.w   r3, [r5, #0xa4]
0007c360  lsls    r3, r3, #3
0007c362  adds    r3, r3, r5
0007c364  add     r2, pc ; -> 0x0007562d  tl_projectile_flight
0007c366  str     r2, [r3, #4]
0007c368  ldr.w   r3, [r5, #0xa4]
0007c36c  adds    r3, #1
0007c36e  str.w   r6, [r5, r3, lsl #3]
0007c372  b       #0x7c218
0007c374  movs    r1, r0
0007c376  movs    r3, r0
0007c378  strb    r4, [r3, #0x11]
0007c37a  movs    r7, r0
0007c37c  str     r3, [sp, #0x3ac]
