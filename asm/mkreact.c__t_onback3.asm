========================================================================
t_onback3  0x00044d54  316 bytes   mkreact.c
========================================================================

00044d54  push    {r4, r5, r6, r7, lr}
00044d56  add     r7, sp, #0xc
00044d58  str     r8, [sp, #-0x4]!
00044d5c  ldr.w   r1, [r0, #0xa4]
00044d60  movw    r8, #0xe42
00044d64  mov     r4, r0
00044d66  adds    r3, r1, #1
00044d68  ldr.w   r5, [r0, #0x108]
00044d6c  ldr.w   r6, [r0, r3, lsl #3]
00044d70  cmp     r6, r8
00044d72  beq     #0x44e04
00044d74  ble     #0x44d90
00044d76  movw    r2, #0xe4d
00044d7a  cmp     r6, r2
00044d7c  beq     #0x44e38
00044d7e  movw    r3, #0xe4e
00044d82  cmp     r6, r3
00044d84  beq     #0x44dec
00044d86  mvn     r0, #2
00044d8a  ldr     r8, [sp], #4
00044d8e  pop     {r4, r5, r6, r7, pc}
00044d90  cmp     r6, #0
00044d92  bne     #0x44d86
00044d94  mov     r0, r5
00044d96  bl      #0x420e4 ; -> rsnd_react_voice
00044d9a  mov     r0, r5
00044d9c  movs    r3, #2
00044d9e  str     r3, [r5, #0x1c]
00044da0  bl      #0x5877c ; -> create_blood_proc
00044da4  mov.w   r3, #0x30000
00044da8  str     r3, [r5, #0x1c]
00044daa  sub.w   r3, r3, #0xb0000
00044dae  str     r3, [r5, #0x20]
00044db0  add.w   r3, r3, #0x88000
00044db4  str     r3, [r5, #0x24]
00044db6  movs    r3, #5
00044db8  str     r3, [r5, #0x28]
00044dba  adds    r3, #0x19
00044dbc  str     r3, [r5, #0x40]
00044dbe  ldr.w   r3, [r4, #0xa4]
00044dc2  mov     r0, r6
00044dc4  adds    r3, #1
00044dc6  str.w   r8, [r4, r3, lsl #3]
00044dca  ldr.w   r3, [r4, #0xa4]
00044dce  adds    r2, r3, #1
00044dd0  ldr     r3, [pc, #0xac]
00044dd2  str.w   r2, [r4, #0xa4]
00044dd6  add     r3, pc ; -> 0x000f3720  t_flight
00044dd8  ldr     r1, [r3]
00044dda  lsls    r3, r2, #3
00044ddc  adds    r3, r3, r4
00044dde  str     r1, [r3, #4]
00044de0  ldr.w   r3, [r4, #0xa4]
00044de4  adds    r3, #1
00044de6  str.w   r6, [r4, r3, lsl #3]
00044dea  b       #0x44d8a
00044dec  ldr     r2, [pc, #0x94]
00044dee  lsls    r3, r1, #3
00044df0  adds    r3, r3, r0
00044df2  add     r2, pc ; -> 0x00041f8d  t_getup_reaction_exit
00044df4  str     r2, [r3, #4]
00044df6  ldr.w   r3, [r0, #0xa4]
00044dfa  movs    r0, #0
00044dfc  adds    r3, #1
00044dfe  str.w   r0, [r4, r3, lsl #3]
00044e02  b       #0x44d8a
00044e04  mov     r0, r5
00044e06  bl      #0x424fc ; -> shake_n_sound
00044e0a  mov     r0, r5
00044e0c  movs    r3, #0x1e
00044e0e  str     r3, [r5, #0x40]
00044e10  bl      #0x55474 ; -> find_ani_part2
00044e14  mov     r0, r5
00044e16  bl      #0x54ce0 ; -> am_i_joy
00044e1a  ldr     r0, [r5, #0x5c]
00044e1c  cbnz    r0, #0x44e48
00044e1e  ldr.w   r3, [r4, #0xa4]
00044e22  ldr     r2, [pc, #0x64]
00044e24  lsls    r3, r3, #3
00044e26  adds    r3, r3, r4
00044e28  add     r2, pc ; -> 0x00041411  t_drone_flipk_getup
00044e2a  str     r2, [r3, #4]
00044e2c  ldr.w   r3, [r4, #0xa4]
00044e30  adds    r3, #1
00044e32  str.w   r0, [r4, r3, lsl #3]
00044e36  b       #0x44d8a
00044e38  movw    r2, #0xe4e
00044e3c  str.w   r2, [r0, r3, lsl #3]
00044e40  movs    r0, #4
00044e42  str.w   r0, [r4, #0xfc]
00044e46  b       #0x44d8a
00044e48  movs    r3, #5
00044e4a  str     r3, [r5, #0x1c]
00044e4c  ldr.w   r3, [r4, #0xa4]
00044e50  movw    r2, #0xe4d
00044e54  movs    r0, #0
00044e56  adds    r3, #1
00044e58  str.w   r2, [r4, r3, lsl #3]
00044e5c  ldr.w   r3, [r4, #0xa4]
00044e60  adds    r2, r3, #1
00044e62  ldr     r3, [pc, #0x28]
00044e64  str.w   r2, [r4, #0xa4]
00044e68  add     r3, pc ; -> 0x000f37cc  t_mframew
00044e6a  ldr     r1, [r3]
00044e6c  lsls    r3, r2, #3
00044e6e  adds    r3, r3, r4
00044e70  str     r1, [r3, #4]
00044e72  ldr.w   r3, [r4, #0xa4]
00044e76  adds    r3, #1
00044e78  str.w   r0, [r4, r3, lsl #3]
00044e7c  b       #0x44d8a
00044e7e  nop     
00044e80  strd    r0, r0, [r6, #-0x28]
00044e84  bne     #0x44db6
