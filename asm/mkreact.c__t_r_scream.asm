========================================================================
t_r_scream  0x00048d38  400 bytes   mkreact.c
========================================================================

00048d38  push    {r4, r5, r6, r7, lr}
00048d3a  add     r7, sp, #0xc
00048d3c  ldr.w   r3, [r0, #0xa4]
00048d40  mov     r5, r0
00048d42  ldr.w   r4, [r0, #0x108]
00048d46  adds    r3, #1
00048d48  movw    r2, #0x531
00048d4c  ldr.w   r0, [r0, r3, lsl #3]
00048d50  cmp     r0, r2
00048d52  beq     #0x48dee
00048d54  movw    r3, #0x565
00048d58  cmp     r0, r3
00048d5a  beq     #0x48d94
00048d5c  cbnz    r0, #0x48d8e
00048d5e  str     r0, [r4, #0x34]
00048d60  str     r0, [r4, #0x30]
00048d62  str     r0, [r4, #0x38]
00048d64  ldr.w   r3, [r5, #0xa4]
00048d68  adds    r3, #1
00048d6a  str.w   r2, [r5, r3, lsl #3]
00048d6e  ldr     r2, [pc, #0x14c]
00048d70  ldr.w   r3, [r5, #0xa4]
00048d74  add     r2, pc ; -> 0x00044b85  t_reaction_start
00048d76  adds    r3, #1
00048d78  str.w   r3, [r5, #0xa4]
00048d7c  lsls    r3, r3, #3
00048d7e  adds    r3, r3, r5
00048d80  str     r2, [r3, #4]
00048d82  ldr.w   r3, [r5, #0xa4]
00048d86  adds    r3, #1
00048d88  str.w   r0, [r5, r3, lsl #3]
00048d8c  b       #0x48d92
00048d8e  mvn     r0, #2
00048d92  pop     {r4, r5, r6, r7, pc}
00048d94  mov     r0, r4
00048d96  bl      #0x55060 ; -> is_he_airborn
00048d9a  ldr     r6, [r4, #0x5c]
00048d9c  cmp     r6, #0
00048d9e  bne     #0x48e44
00048da0  mov     r0, r4
00048da2  bl      #0x54e38 ; -> get_his_action
00048da6  ldr     r2, [r4, #0x20]
00048da8  movw    r3, #0x615
00048dac  cmp     r2, r3
00048dae  beq     #0x48e44
00048db0  ldr     r1, [r4, #8]
00048db2  ldr     r2, [r4, #0x48]
00048db4  ldrsh.w r3, [r1, #0xe]
00048db8  adds    r3, r3, r2
00048dba  str     r3, [r4, #0x1c]
00048dbc  strh    r3, [r1, #0xe]
00048dbe  ldr     r1, [r4, #8]
00048dc0  ldr     r3, [r4, #0x48]
00048dc2  rsb.w   r3, r3, #0
00048dc6  str     r3, [r4, #0x48]
00048dc8  ldr     r3, [r4]
00048dca  ldrsh.w r2, [r1, #0x12]
00048dce  str     r2, [r4, #0x1c]
00048dd0  ldr     r3, [r3, #0x40]
00048dd2  cmp     r3, r2
00048dd4  str     r3, [r4, #0x20]
00048dd6  ble     #0x48e7c
00048dd8  ldr     r3, [r4, #0x44]
00048dda  subs    r0, r3, #1
00048ddc  str     r0, [r4, #0x44]
00048dde  cbnz    r0, #0x48e2e
00048de0  ldr.w   r3, [pc, #0xdc]
00048de4  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00048de6  ldr     r2, [r3]
00048de8  ldr.w   r3, [r5, #0xa4]
00048dec  b       #0x48d7c
00048dee  mov     r0, r4
00048df0  bl      #0x54f20 ; -> set_no_block
00048df4  ldr     r3, [r4]
00048df6  mov     r0, r4
00048df8  movw    r2, #0x615
00048dfc  str     r2, [r4, #0x1c]
00048dfe  str     r2, [r3, #0x18]
00048e00  bl      #0x54dec ; -> dec_my_p_hit
00048e04  ldr     r3, [r4]
00048e06  mov     r0, r4
00048e08  movs    r2, #0
00048e0a  str     r2, [r4, #0x1c]
00048e0c  str     r2, [r3, #0x28]
00048e0e  bl      #0x55c04 ; -> stop_me_player
00048e12  mov     r0, r4
00048e14  movs    r3, #0x20
00048e16  str     r3, [r4, #0x40]
00048e18  bl      #0x5a028 ; -> pose_a9_manual
00048e1c  mov     r0, r4
00048e1e  bl      #0x55070 ; -> am_i_airborn
00048e22  ldr     r3, [r4, #0x5c]
00048e24  cbnz    r3, #0x48e70
00048e26  movs    r3, #4
00048e28  str     r3, [r4, #0x48]
00048e2a  adds    r3, #0x26
00048e2c  str     r3, [r4, #0x44]
00048e2e  ldr.w   r3, [r5, #0xa4]
00048e32  movs    r0, #3
00048e34  movw    r2, #0x565
00048e38  adds    r3, #1
00048e3a  str.w   r2, [r5, r3, lsl #3]
00048e3e  str.w   r0, [r5, #0xfc]
00048e42  b       #0x48d92
00048e44  mov     r0, r4
00048e46  bl      #0x55c04 ; -> stop_me_player
00048e4a  mov     r0, r4
00048e4c  bl      #0x5533c ; -> ground_player
00048e50  ldr.w   r3, [pc, #0x70]
00048e54  movs    r0, #0
00048e56  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00048e58  ldr     r2, [r3]
00048e5a  ldr.w   r3, [r5, #0xa4]
00048e5e  lsls    r3, r3, #3
00048e60  adds    r3, r3, r5
00048e62  str     r2, [r3, #4]
00048e64  ldr.w   r3, [r5, #0xa4]
00048e68  adds    r3, #1
00048e6a  str.w   r0, [r5, r3, lsl #3]
00048e6e  b       #0x48d92
00048e70  ldr     r3, [r4, #8]
00048e72  mov.w   r2, #0x10000
00048e76  str     r2, [r4, #0x1c]
00048e78  str     r2, [r3, #0x1c]
00048e7a  b       #0x48e26
00048e7c  mov     r0, r4
00048e7e  str     r6, [r4, #0x1c]
00048e80  str     r6, [r1, #0x1c]
00048e82  bl      #0x5533c ; -> ground_player
00048e86  mov     r0, r4
00048e88  bl      #0x2f3a0 ; -> get_x_dist
00048e8c  ldr     r3, [r4, #0x28]
00048e8e  cmp     r3, #0x50
00048e90  ble     #0x48eaa
00048e92  ldr     r3, [r4]
00048e94  ldr     r3, [r3, #0x28]
00048e96  str     r3, [r4, #0x1c]
00048e98  cmp     r3, #0
00048e9a  bne     #0x48dd8
00048e9c  mov     r0, r4
00048e9e  add.w   r3, r3, #0x20000
00048ea2  str     r3, [r4, #0x1c]
00048ea4  bl      #0x55a94 ; -> towards_x_vel
00048ea8  b       #0x48dd8
00048eaa  ldr     r3, [r4]
00048eac  mov     r0, r4
00048eae  movs    r2, #1
00048eb0  str     r2, [r4, #0x1c]
00048eb2  str     r2, [r3, #0x28]
00048eb4  bl      #0x55c04 ; -> stop_me_player
00048eb8  b       #0x48dd8
00048eba  nop     
00048ebc  bkpt    #0xd
00048ebe  vtbl.8  d26, {d15, d16}, d16
00048ec2  movs    r2, r1
00048ec4  add     r0, sp, #0x2b8
00048ec6  movs    r2, r1
