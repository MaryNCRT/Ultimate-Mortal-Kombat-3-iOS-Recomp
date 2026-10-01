========================================================================
t_r_orb  0x00046dac  244 bytes   mkreact.c
========================================================================

00046dac  push    {r4, r5, r7, lr}
00046dae  add     r7, sp, #8
00046db0  ldr.w   r3, [r0, #0xa4]
00046db4  mov     r4, r0
00046db6  ldr.w   r5, [r0, #0x108]
00046dba  adds    r3, #1
00046dbc  movw    r1, #0x345
00046dc0  ldr.w   r0, [r0, r3, lsl #3]
00046dc4  cmp     r0, r1
00046dc6  beq     #0x46e36
00046dc8  movw    r3, #0x351
00046dcc  cmp     r0, r3
00046dce  beq     #0x46e12
00046dd0  cbz     r0, #0x46dd8
00046dd2  mvn     r0, #2
00046dd6  pop     {r4, r5, r7, pc}
00046dd8  ldr     r3, [r5]
00046dda  movw    r2, #0x625
00046dde  str     r2, [r5, #0x20]
00046de0  str     r2, [r3, #0x48]
00046de2  str     r0, [r5, #0x30]
00046de4  str     r0, [r5, #0x34]
00046de6  str     r0, [r5, #0x38]
00046de8  ldr.w   r3, [r4, #0xa4]
00046dec  ldr     r2, [pc, #0xa0]
00046dee  adds    r3, #1
00046df0  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046df2  str.w   r1, [r4, r3, lsl #3]
00046df6  ldr.w   r3, [r4, #0xa4]
00046dfa  adds    r3, #1
00046dfc  str.w   r3, [r4, #0xa4]
00046e00  lsls    r3, r3, #3
00046e02  adds    r3, r3, r4
00046e04  str     r2, [r3, #4]
00046e06  ldr.w   r3, [r4, #0xa4]
00046e0a  adds    r3, #1
00046e0c  str.w   r0, [r4, r3, lsl #3]
00046e10  b       #0x46dd6
00046e12  mov     r0, r5
00046e14  bl      #0x55c04 ; -> stop_me_player
00046e18  ldr.w   r3, [r4, #0xa4]
00046e1c  ldr.w   r2, [pc, #0x74]
00046e20  movs    r0, #0
00046e22  lsls    r3, r3, #3
00046e24  adds    r3, r3, r4
00046e26  add     r2, pc ; -> 0x00042519  t_land_on_my_back
00046e28  str     r2, [r3, #4]
00046e2a  ldr.w   r3, [r4, #0xa4]
00046e2e  adds    r3, #1
00046e30  str.w   r0, [r4, r3, lsl #3]
00046e34  b       #0x46dd6
00046e36  mov     r0, r5
00046e38  bl      #0x420e4 ; -> rsnd_react_voice
00046e3c  mov     r0, r5
00046e3e  bl      #0x54f40 ; -> set_half_damage
00046e42  ldr     r3, [pc, #0x54]
00046e44  movs    r0, #0
00046e46  str     r0, [r5, #0x34]
00046e48  movw    r2, #0x351
00046e4c  str     r3, [r5, #0x1c]
00046e4e  sub.w   r3, r3, #0x48000
00046e52  str     r3, [r5, #0x20]
00046e54  add.w   r3, r3, #0x86000
00046e58  str     r3, [r5, #0x24]
00046e5a  movs    r3, #4
00046e5c  str     r3, [r5, #0x28]
00046e5e  adds    r3, #0x3f
00046e60  str     r3, [r5, #0x40]
00046e62  ldr.w   r3, [r4, #0xa4]
00046e66  adds    r3, #1
00046e68  str.w   r2, [r4, r3, lsl #3]
00046e6c  ldr.w   r3, [r4, #0xa4]
00046e70  adds    r2, r3, #1
00046e72  ldr.w   r3, [pc, #0x28]
00046e76  str.w   r2, [r4, #0xa4]
00046e7a  add     r3, pc ; -> 0x000f3720  t_flight
00046e7c  ldr     r1, [r3]
00046e7e  lsls    r3, r2, #3
00046e80  adds    r3, r3, r4
00046e82  str     r1, [r3, #4]
00046e84  ldr.w   r3, [r4, #0xa4]
00046e88  adds    r3, #1
00046e8a  str.w   r0, [r4, r3, lsl #3]
00046e8e  b       #0x46dd6
00046e90  ble     #0x46db6
