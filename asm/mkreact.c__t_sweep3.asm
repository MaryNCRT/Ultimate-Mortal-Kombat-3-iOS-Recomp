========================================================================
t_sweep3  0x00043c08  492 bytes   mkreact.c
========================================================================

00043c08  push    {r4, r5, r6, r7, lr}
00043c0a  add     r7, sp, #0xc
00043c0c  ldr.w   r2, [r0, #0xa4]
00043c10  mov     r4, r0
00043c12  ldr.w   r5, [r0, #0x108]
00043c16  adds    r3, r2, #1
00043c18  movw    r1, #0xdf8
00043c1c  ldr.w   r0, [r0, r3, lsl #3]
00043c20  cmp     r0, r1
00043c22  beq.w   #0x43d40
00043c26  ble     #0x43c4c
00043c28  movw    r1, #0xdfb
00043c2c  cmp     r0, r1
00043c2e  beq.w   #0x43d60
00043c32  bgt     #0x43c8e
00043c34  movw    r2, #0xdf9
00043c38  cmp     r0, r2
00043c3a  beq.w   #0x43d96
00043c3e  adds    r2, #1
00043c40  cmp     r0, r2
00043c42  beq.w   #0x43d8a
00043c46  mvn     r0, #2
00043c4a  pop     {r4, r5, r6, r7, pc}
00043c4c  movw    r6, #0xdf2
00043c50  cmp     r0, r6
00043c52  beq     #0x43d1a
00043c54  ble     #0x43ca4
00043c56  movw    r2, #0xdf6
00043c5a  cmp     r0, r2
00043c5c  beq     #0x43d50
00043c5e  adds    r2, #1
00043c60  cmp     r0, r2
00043c62  bne     #0x43c46
00043c64  str.w   r1, [r4, r3, lsl #3]
00043c68  ldr.w   r3, [r4, #0xa4]
00043c6c  adds    r2, r3, #1
00043c6e  ldr.w   r3, [pc, #0x160]
00043c72  str.w   r2, [r4, #0xa4]
00043c76  add     r3, pc ; -> 0x000f373c  t_d_beware
00043c78  ldr     r1, [r3]
00043c7a  lsls    r3, r2, #3
00043c7c  adds    r3, r3, r4
00043c7e  movs    r0, #0
00043c80  str     r1, [r3, #4]
00043c82  ldr.w   r3, [r4, #0xa4]
00043c86  adds    r3, #1
00043c88  str.w   r0, [r4, r3, lsl #3]
00043c8c  b       #0x43c4a
00043c8e  movw    r1, #0xe01
00043c92  cmp     r0, r1
00043c94  beq     #0x43d60
00043c96  movw    r3, #0xe05
00043c9a  cmp     r0, r3
00043c9c  bne     #0x43c46
00043c9e  ldr     r1, [pc, #0x134]
00043ca0  add     r1, pc ; -> 0x00041fc9  t_sweepup_local_reaction_exit
00043ca2  b       #0x43c7a
00043ca4  cbz     r0, #0x43ce4
00043ca6  movw    r3, #0xdea
00043caa  cmp     r0, r3
00043cac  bne     #0x43c46
00043cae  mov     r0, r5
00043cb0  bl      #0x424fc ; -> shake_n_sound
00043cb4  mov     r0, r5
00043cb6  bl      #0x54ce0 ; -> am_i_joy
00043cba  ldr     r0, [r5, #0x5c]
00043cbc  cmp     r0, #0
00043cbe  beq     #0x43db0
00043cc0  movs    r3, #4
00043cc2  str     r3, [r5, #0x1c]
00043cc4  ldr.w   r3, [r4, #0xa4]
00043cc8  movw    r2, #0xe01
00043ccc  adds    r3, #1
00043cce  str.w   r2, [r4, r3, lsl #3]
00043cd2  ldr.w   r3, [r4, #0xa4]
00043cd6  adds    r2, r3, #1
00043cd8  ldr     r3, [pc, #0xfc]
00043cda  str.w   r2, [r4, #0xa4]
00043cde  add     r3, pc ; -> 0x000f37cc  t_mframew
00043ce0  ldr     r1, [r3]
00043ce2  b       #0x43c7a
00043ce4  ldr     r3, [pc, #0xf4]
00043ce6  movw    r2, #0xdea
00043cea  str     r3, [r5, #0x40]
00043cec  ldr.w   r3, [r4, #0xa4]
00043cf0  adds    r3, #1
00043cf2  str.w   r2, [r4, r3, lsl #3]
00043cf6  ldr.w   r3, [r4, #0xa4]
00043cfa  adds    r2, r3, #1
00043cfc  ldr.w   r3, [pc, #0xe0]
00043d00  str.w   r2, [r4, #0xa4]
00043d04  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00043d06  ldr     r1, [r3]
00043d08  lsls    r3, r2, #3
00043d0a  adds    r3, r3, r4
00043d0c  str     r1, [r3, #4]
00043d0e  ldr.w   r3, [r4, #0xa4]
00043d12  adds    r3, #1
00043d14  str.w   r0, [r4, r3, lsl #3]
00043d18  b       #0x43c4a
00043d1a  ldr     r3, [r5]
00043d1c  movs    r0, #0
00043d1e  str     r0, [r5, #0x1c]
00043d20  movw    r2, #0xdf6
00043d24  str     r0, [r3, #0x5c]
00043d26  ldr.w   r3, [r4, #0xa4]
00043d2a  adds    r3, #1
00043d2c  str.w   r2, [r4, r3, lsl #3]
00043d30  ldr.w   r3, [r4, #0xa4]
00043d34  adds    r2, r3, #1
00043d36  ldr     r3, [pc, #0xac]
00043d38  str.w   r2, [r4, #0xa4]
00043d3c  add     r3, pc ; -> 0x000f373c  t_d_beware
00043d3e  b       #0x43d06
00043d40  movs    r0, #1
00043d42  movw    r2, #0xdf9
00043d46  str.w   r2, [r4, r3, lsl #3]
00043d4a  str.w   r0, [r4, #0xfc]
00043d4e  b       #0x43c4a
00043d50  movs    r0, #1
00043d52  movw    r2, #0xdf7
00043d56  str.w   r2, [r4, r3, lsl #3]
00043d5a  str.w   r0, [r4, #0xfc]
00043d5e  b       #0x43c4a
00043d60  movw    r2, #0xe05
00043d64  str.w   r2, [r4, r3, lsl #3]
00043d68  ldr.w   r3, [r4, #0xa4]
00043d6c  ldr     r2, [pc, #0x78]
00043d6e  movs    r0, #0
00043d70  adds    r3, #1
00043d72  str.w   r3, [r4, #0xa4]
00043d76  lsls    r3, r3, #3
00043d78  adds    r3, r3, r4
00043d7a  add     r2, pc ; -> 0x00042005  t_check_stay_down
00043d7c  str     r2, [r3, #4]
00043d7e  ldr.w   r3, [r4, #0xa4]
00043d82  adds    r3, #1
00043d84  str.w   r0, [r4, r3, lsl #3]
00043d88  b       #0x43c4a
00043d8a  movs    r0, #1
00043d8c  str.w   r1, [r4, r3, lsl #3]
00043d90  str.w   r0, [r4, #0xfc]
00043d94  b       #0x43c4a
00043d96  movw    r2, #0xdfa
00043d9a  str.w   r2, [r4, r3, lsl #3]
00043d9e  ldr.w   r3, [r4, #0xa4]
00043da2  adds    r2, r3, #1
00043da4  ldr     r3, [pc, #0x44]
00043da6  str.w   r2, [r4, #0xa4]
00043daa  add     r3, pc ; -> 0x000f373c  t_d_beware
00043dac  ldr     r1, [r3]
00043dae  b       #0x43c7a
00043db0  movs    r3, #4
00043db2  str     r3, [r5, #0x1c]
00043db4  ldr.w   r3, [r4, #0xa4]
00043db8  adds    r3, #1
00043dba  str.w   r6, [r4, r3, lsl #3]
00043dbe  ldr.w   r3, [r4, #0xa4]
00043dc2  adds    r2, r3, #1
00043dc4  ldr     r3, [pc, #0x28]
00043dc6  str.w   r2, [r4, #0xa4]
00043dca  add     r3, pc ; -> 0x000f37ac  t_d_beware_mframew
00043dcc  b       #0x43d06
00043dce  nop     
