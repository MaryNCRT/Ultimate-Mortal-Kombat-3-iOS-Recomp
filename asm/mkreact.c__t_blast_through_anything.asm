========================================================================
t_blast_through_anything  0x00047cec  504 bytes   mkreact.c
========================================================================

00047cec  push    {r4, r5, r6, r7, lr}
00047cee  add     r7, sp, #0xc
00047cf0  str     r8, [sp, #-0x4]!
00047cf4  mov     r5, r0
00047cf6  ldr.w   r4, [r0, #0x108]
00047cfa  ldr.w   r0, [r0, #0xa4]
00047cfe  movw    r8, #0xb82
00047d02  adds    r3, r0, #1
00047d04  ldr.w   r2, [r5, r3, lsl #3]
00047d08  cmp     r2, r8
00047d0a  beq.w   #0x47e50
00047d0e  ble     #0x47d2c
00047d10  movw    r1, #0xb8e
00047d14  cmp     r2, r1
00047d16  beq.w   #0x47eb4
00047d1a  cmp.w   r2, #0xb90
00047d1e  beq.w   #0x47e38
00047d22  mvn     r0, #2
00047d26  ldr     r8, [sp], #4
00047d2a  pop     {r4, r5, r6, r7, pc}
00047d2c  cmp     r2, #0
00047d2e  beq     #0x47dd2
00047d30  movw    r3, #0xb6b
00047d34  cmp     r2, r3
00047d36  bne     #0x47d22
00047d38  mov     r0, r4
00047d3a  bl      #0x5a680 ; -> next_anirate
00047d3e  ldr     r3, [r4, #8]
00047d40  ldr     r3, [r3, #0x1c]
00047d42  cmp     r3, #0
00047d44  str     r3, [r4, #0x1c]
00047d46  blt     #0x47e22
00047d48  ldr     r3, [pc, #0x178]
00047d4a  ldr     r1, [r4]
00047d4c  movs    r6, #0
00047d4e  add     r3, pc ; -> 0x000f3534  RoundParam
00047d50  ldr     r0, [r3]
00047d52  ldr     r2, [r1, #0x40]
00047d54  ldr     r3, [r0, #8]
00047d56  rsb     r3, r3, r2
00047d5a  str     r3, [r1, #0x40]
00047d5c  ldr     r3, [r4]
00047d5e  ldr     r3, [r3]
00047d60  ldr     r2, [r3]
00047d62  ldr     r3, [r0, #8]
00047d64  ldr     r1, [r2, #0x40]
00047d66  rsb     r3, r3, r1
00047d6a  str     r3, [r2, #0x40]
00047d6c  ldr     r3, [pc, #0x158]
00047d6e  strb.w  r6, [r0, #0x30]
00047d72  add     r3, pc ; -> 0x000f357c  G
00047d74  ldr     r1, [r3]
00047d76  ldr     r3, [r0, #8]
00047d78  str     r6, [r0, #8]
00047d7a  movs    r0, #4
00047d7c  ldr.w   r2, [r1, #0xac]
00047d80  rsb     r3, r3, r2
00047d84  str.w   r3, [r1, #0xac]
00047d88  ldr     r3, [r4]
00047d8a  movs    r1, #0x37
00047d8c  mov     r2, r6
00047d8e  ldr     r3, [r3, #8]
00047d90  bl      #0x31a28 ; -> MKEvent_Add
00047d94  movs    r3, #0xd
00047d96  str     r3, [r4, #0x1c]
00047d98  str     r3, [r4, #0x20]
00047d9a  mov.w   r3, #0x8000
00047d9e  str     r3, [r4, #0x24]
00047da0  movs    r3, #5
00047da2  str     r3, [r4, #0x28]
00047da4  ldr.w   r3, [r5, #0xa4]
00047da8  mov     r0, r6
00047daa  adds    r3, #1
00047dac  str.w   r8, [r5, r3, lsl #3]
00047db0  ldr.w   r3, [r5, #0xa4]
00047db4  adds    r2, r3, #1
00047db6  ldr     r3, [pc, #0x114]
00047db8  str.w   r2, [r5, #0xa4]
00047dbc  add     r3, pc ; -> 0x000f3720  t_flight
00047dbe  ldr     r1, [r3]
00047dc0  lsls    r3, r2, #3
00047dc2  adds    r3, r3, r5
00047dc4  str     r1, [r3, #4]
00047dc6  ldr.w   r3, [r5, #0xa4]
00047dca  adds    r3, #1
00047dcc  str.w   r6, [r5, r3, lsl #3]
00047dd0  b       #0x47d26
00047dd2  ldr     r3, [r4]
00047dd4  movs    r1, #0x36
00047dd6  movs    r0, #4
00047dd8  ldr     r3, [r3, #8]
00047dda  bl      #0x31a28 ; -> MKEvent_Add
00047dde  ldr.w   r3, [pc, #0xf0]
00047de2  mov     r0, r4
00047de4  add     r3, pc ; -> 0x000f3724  t_wait_forever
00047de6  ldr     r3, [r3]
00047de8  str     r3, [r4, #0x38]
00047dea  bl      #0x55130 ; -> xfer_otherguy
00047dee  mov     r0, r4
00047df0  mov.w   r3, #0x10000
00047df4  str     r3, [r4, #0x1c]
00047df6  bl      #0x55ab0 ; -> away_x_vel
00047dfa  ldr     r2, [pc, #0xd8]
00047dfc  mov.w   r3, #0x5000
00047e00  str     r3, [r4, #0x24]
00047e02  ldr     r3, [r4, #8]
00047e04  str     r2, [r4, #0x20]
00047e06  mov     r0, r4
00047e08  str     r2, [r3, #0x1c]
00047e0a  ldr     r3, [r4, #0x24]
00047e0c  ldr     r2, [r4, #8]
00047e0e  str     r3, [r2, #0x20]
00047e10  movs    r3, #0x1e
00047e12  str     r3, [r4, #0x40]
00047e14  bl      #0x5520c ; -> get_char_ani
00047e18  mov     r0, r4
00047e1a  movs    r3, #0xf
00047e1c  str     r3, [r4, #0x1c]
00047e1e  bl      #0x553a0 ; -> init_anirate
00047e22  ldr.w   r3, [r5, #0xa4]
00047e26  movs    r0, #1
00047e28  movw    r2, #0xb6b
00047e2c  adds    r3, #1
00047e2e  str.w   r2, [r5, r3, lsl #3]
00047e32  str.w   r0, [r5, #0xfc]
00047e36  b       #0x47d26
00047e38  lsls    r3, r0, #3
00047e3a  ldr     r2, [pc, #0x9c]
00047e3c  adds    r3, r3, r5
00047e3e  movs    r0, #0
00047e40  add     r2, pc ; -> 0x00041f8d  t_getup_reaction_exit
00047e42  str     r2, [r3, #4]
00047e44  ldr.w   r3, [r5, #0xa4]
00047e48  adds    r3, #1
00047e4a  str.w   r0, [r5, r3, lsl #3]
00047e4e  b       #0x47d26
00047e50  mov     r0, r4
00047e52  bl      #0x552a0 ; -> ground_ochar
00047e56  ldr     r3, [r4, #8]
00047e58  ldr     r2, [r4]
00047e5a  mov     r0, r4
00047e5c  ldrsh.w r3, [r3, #0x12]
00047e60  str     r3, [r2, #0x40]
00047e62  ldr     r3, [pc, #0x78]
00047e64  add     r3, pc ; -> 0x00047bc5  t_back_to_the_fight
00047e66  str     r3, [r4, #0x38]
00047e68  bl      #0x55130 ; -> xfer_otherguy
00047e6c  mov     r0, r4
00047e6e  bl      #0x424fc ; -> shake_n_sound
00047e72  mov     r0, r4
00047e74  movs    r3, #0x1e
00047e76  str     r3, [r4, #0x40]
00047e78  bl      #0x55474 ; -> find_ani_part2
00047e7c  movs    r3, #4
00047e7e  str     r3, [r4, #0x1c]
00047e80  ldr.w   r3, [r5, #0xa4]
00047e84  movw    r2, #0xb8e
00047e88  movs    r0, #0
00047e8a  adds    r3, #1
00047e8c  str.w   r2, [r5, r3, lsl #3]
00047e90  ldr.w   r3, [r5, #0xa4]
00047e94  adds    r2, r3, #1
00047e96  ldr.w   r3, [pc, #0x48]
00047e9a  str.w   r2, [r5, #0xa4]
00047e9e  add     r3, pc ; -> 0x000f37cc  t_mframew
00047ea0  ldr     r1, [r3]
00047ea2  lsls    r3, r2, #3
00047ea4  adds    r3, r3, r5
00047ea6  str     r1, [r3, #4]
00047ea8  ldr.w   r3, [r5, #0xa4]
00047eac  adds    r3, #1
00047eae  str.w   r0, [r5, r3, lsl #3]
00047eb2  b       #0x47d26
00047eb4  movs    r0, #0x20
00047eb6  mov.w   r2, #0xb90
00047eba  str.w   r2, [r5, r3, lsl #3]
00047ebe  str.w   r0, [r5, #0xfc]
00047ec2  b       #0x47d26
