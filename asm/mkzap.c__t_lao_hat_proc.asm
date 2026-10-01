========================================================================
t_lao_hat_proc  0x00078a64  512 bytes   mkzap.c
========================================================================

00078a64  push    {r4, r5, r6, r7, lr}
00078a66  add     r7, sp, #0xc
00078a68  push.w  {r8, sl}
00078a6c  ldr.w   r3, [r0, #0xa4]
00078a70  movw    r8, #0xd53
00078a74  mov     r5, r0
00078a76  adds    r3, #1
00078a78  ldr.w   r4, [r0, #0x108]
00078a7c  ldr.w   r6, [r0, r3, lsl #3]
00078a80  cmp     r6, r8
00078a82  beq     #0x78b42
00078a84  ble     #0x78aa0
00078a86  movw    r3, #0xd72
00078a8a  cmp     r6, r3
00078a8c  beq.w   #0x78b96
00078a90  adds    r3, #0x27
00078a92  cmp     r6, r3
00078a94  beq     #0x78b1a
00078a96  mvn     r0, #2
00078a9a  pop.w   {r8, sl}
00078a9e  pop     {r4, r5, r6, r7, pc}
00078aa0  cmp     r6, #0
00078aa2  bne     #0x78a96
00078aa4  mov     r0, r4
00078aa6  movs    r3, #0x24
00078aa8  mov.w   sl, #4
00078aac  str     r3, [r4, #0x40]
00078aae  str.w   sl, [r4, #0x54]
00078ab2  bl      #0x554a8 ; -> find_ani_part_a14
00078ab6  ldr     r3, [r4, #0x40]
00078ab8  mov     r0, r4
00078aba  str     r3, [r4, #0x44]
00078abc  bl      #0x59e24 ; -> do_next_a9_frame
00078ac0  ldr     r3, [r4, #0x44]
00078ac2  ldr     r2, [r4, #8]
00078ac4  mov     r0, r4
00078ac6  str     r3, [r4, #0x40]
00078ac8  ldr.w   r3, [pc, #0x180]
00078acc  str     r3, [r2, #0x1c]
00078ace  add.w   r3, r3, #0xa0000
00078ad2  str.w   sl, [r4, #0x20]
00078ad6  str     r3, [r4, #0x1c]
00078ad8  bl      #0x75d6c ; -> set_proj_vel
00078adc  ldr     r3, [r4]
00078ade  movs    r2, #1
00078ae0  str     r2, [r4, #0x1c]
00078ae2  mov     r0, r6
00078ae4  str     r2, [r3, #0x2c]
00078ae6  movs    r3, #0x11
00078ae8  str     r3, [r4, #0x48]
00078aea  ldr     r3, [pc, #0x164]
00078aec  add     r3, pc ; -> 0x00075465  t_lao_zap_call
00078aee  str     r3, [r4, #0x34]
00078af0  ldr.w   r3, [r5, #0xa4]
00078af4  adds    r3, r3, r2
00078af6  str.w   r8, [r5, r3, lsl #3]
00078afa  ldr.w   r3, [r5, #0xa4]
00078afe  adds    r3, r3, r2
00078b00  ldr     r2, [pc, #0x150]
00078b02  str.w   r3, [r5, #0xa4]
00078b06  lsls    r3, r3, #3
00078b08  adds    r3, r3, r5
00078b0a  add     r2, pc ; -> 0x00075919  tl_projectile_flight_call
00078b0c  str     r2, [r3, #4]
00078b0e  ldr.w   r3, [r5, #0xa4]
00078b12  adds    r3, #1
00078b14  str.w   r6, [r5, r3, lsl #3]
00078b18  b       #0x78a9a
00078b1a  mov     r0, r4
00078b1c  bl      #0x75714 ; -> proj_onscreen_test
00078b20  ldr     r0, [r4, #0x5c]
00078b22  cmp     r0, #0
00078b24  beq     #0x78bba
00078b26  mov     r0, r4
00078b28  bl      #0x5a680 ; -> next_anirate
00078b2c  ldr.w   r3, [r5, #0xa4]
00078b30  movs    r0, #1
00078b32  movw    r2, #0xd99
00078b36  adds    r3, #1
00078b38  str.w   r2, [r5, r3, lsl #3]
00078b3c  str.w   r0, [r5, #0xfc]
00078b40  b       #0x78a9a
00078b42  ldr     r3, [r4, #0x18]
00078b44  cmp     r3, #0
00078b46  beq     #0x78bd4
00078b48  mov     r0, r4
00078b4a  movs    r3, #3
00078b4c  str     r3, [r4, #0x1c]
00078b4e  bl      #0x57be4 ; -> ochar_sound
00078b52  movs    r3, #0x24
00078b54  mov     r0, r4
00078b56  str     r3, [r4, #0x40]
00078b58  subs    r3, #0x1f
00078b5a  str     r3, [r4, #0x54]
00078b5c  bl      #0x554a8 ; -> find_ani_part_a14
00078b60  mov     r0, r4
00078b62  movs    r3, #4
00078b64  str     r3, [r4, #0x1c]
00078b66  bl      #0x553a0 ; -> init_anirate
00078b6a  ldr     r2, [pc, #0xec]
00078b6c  ldr     r3, [r4, #8]
00078b6e  mov     r0, r4
00078b70  str     r2, [r4, #0x20]
00078b72  str     r2, [r3, #0x1c]
00078b74  bl      #0x55394 ; -> flip_multi
00078b78  mov     r0, r4
00078b7a  mvn     r3, #0x9f
00078b7e  str     r3, [r4, #0x1c]
00078b80  adds    r3, #0x98
00078b82  str     r3, [r4, #0x20]
00078b84  bl      #0x570ac ; -> multi_adjust_xy
00078b88  ldr     r2, [r4, #8]
00078b8a  ldr     r3, [r2, #0x18]
00078b8c  rsb.w   r3, r3, #0
00078b90  str     r3, [r4, #0x1c]
00078b92  str     r3, [r2, #0x18]
00078b94  b       #0x78b26
00078b96  ldr     r0, [r4]
00078b98  ldr     r0, [r0]
00078b9a  bl      #0x575cc ; -> GetProcFunc
00078b9e  ldr     r3, [pc, #0xbc]
00078ba0  add     r3, pc ; -> 0x000f33c4  t_rhat_sleep
00078ba2  ldr     r3, [r3]
00078ba4  cmp     r0, r3
00078ba6  beq     #0x78be4
00078ba8  movs    r3, #5
00078baa  mov     r0, r4
00078bac  str     r3, [r4, #0x20]
00078bae  mov.w   r3, #0xb0000
00078bb2  str     r3, [r4, #0x1c]
00078bb4  bl      #0x75d6c ; -> set_proj_vel
00078bb8  b       #0x78b48
00078bba  ldr.w   r3, [r5, #0xa4]
00078bbe  ldr     r2, [pc, #0xa0]
00078bc0  lsls    r3, r3, #3
00078bc2  adds    r3, r3, r5
00078bc4  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
00078bc6  str     r2, [r3, #4]
00078bc8  ldr.w   r3, [r5, #0xa4]
00078bcc  adds    r3, #1
00078bce  str.w   r0, [r5, r3, lsl #3]
00078bd2  b       #0x78a9a
00078bd4  mov     r0, r4
00078bd6  adds    r3, #2
00078bd8  str     r3, [r4, #0x1c]
00078bda  bl      #0x57be4 ; -> ochar_sound
00078bde  ldr     r0, [r4, #8]
00078be0  bl      #0x55a60 ; -> stop_a8
00078be4  ldr     r3, [r4, #8]
00078be6  mov     r0, r4
00078be8  ldrsh.w r2, [r3, #0x12]
00078bec  str     r2, [r4, #0x20]
00078bee  ldr.w   r1, [r5, #0xf8]
00078bf2  lsls    r3, r1, #2
00078bf4  adds    r3, r3, r5
00078bf6  str.w   r2, [r3, #0xa8]
00078bfa  adds    r3, r1, #1
00078bfc  str.w   r3, [r5, #0xf8]
00078c00  bl      #0x570f8 ; -> match_me_with_him
00078c04  mov     r0, r4
00078c06  bl      #0x55394 ; -> flip_multi
00078c0a  ldr.w   r3, [r5, #0xf8]
00078c0e  mov     r0, r4
00078c10  subs    r3, #1
00078c12  str.w   r3, [r5, #0xf8]
00078c16  lsls    r3, r3, #2
00078c18  adds    r3, r3, r5
00078c1a  ldr     r2, [r4, #8]
00078c1c  ldrh.w  r3, [r3, #0xa8]
00078c20  strh    r3, [r2, #0x12]
00078c22  mvn     r3, #0x67
00078c26  str     r3, [r4, #0x1c]
00078c28  adds    r3, #0x68
00078c2a  str     r3, [r4, #0x20]
00078c2c  bl      #0x570ac ; -> multi_adjust_xy
00078c30  mov     r0, r4
00078c32  bl      #0x5a680 ; -> next_anirate
00078c36  ldr.w   r3, [r5, #0xa4]
00078c3a  movs    r0, #1
00078c3c  movw    r2, #0xd72
00078c40  adds    r3, #1
00078c42  str.w   r2, [r5, r3, lsl #3]
00078c46  str.w   r0, [r5, #0xfc]
00078c4a  b       #0x78a9a
00078c4c  movs    r0, r0
