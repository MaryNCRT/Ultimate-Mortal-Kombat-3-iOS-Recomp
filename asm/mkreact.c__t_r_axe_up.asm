========================================================================
t_r_axe_up  0x00046bec  252 bytes   mkreact.c
========================================================================

00046bec  push    {r4, r5, r6, r7, lr}
00046bee  add     r7, sp, #0xc
00046bf0  push.w  {r8, sl}
00046bf4  ldr.w   r2, [r0, #0xa4]
00046bf8  movw    r8, #0x5be
00046bfc  mov     r5, r0
00046bfe  adds    r3, r2, #1
00046c00  ldr.w   r4, [r0, #0x108]
00046c04  ldr.w   r6, [r0, r3, lsl #3]
00046c08  cmp     r6, r8
00046c0a  beq     #0x46c90
00046c0c  cmp.w   r6, #0x5c8
00046c10  beq     #0x46c76
00046c12  cbz     r6, #0x46c1e
00046c14  mvn     r0, #2
00046c18  pop.w   {r8, sl}
00046c1c  pop     {r4, r5, r6, r7, pc}
00046c1e  mov     r0, r4
00046c20  mov.w   sl, #1
00046c24  str.w   sl, [r4, #0x1c]
00046c28  bl      #0x5877c ; -> create_blood_proc
00046c2c  mov     r0, r4
00046c2e  movs    r3, #9
00046c30  str     r3, [r4, #0x1c]
00046c32  bl      #0x57b94 ; -> his_ochar_sound
00046c36  mov     r0, r4
00046c38  bl      #0x54f40 ; -> set_half_damage
00046c3c  ldr     r3, [pc, #0x98]
00046c3e  str     r6, [r4, #0x30]
00046c40  str.w   sl, [r4, #0x34]
00046c44  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
00046c46  str     r3, [r4, #0x38]
00046c48  ldr.w   r3, [r5, #0xa4]
00046c4c  ldr.w   r2, [pc, #0x8c]
00046c50  mov     r0, r6
00046c52  add     r3, sl
00046c54  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046c56  str.w   r8, [r5, r3, lsl #3]
00046c5a  ldr.w   r3, [r5, #0xa4]
00046c5e  add     r3, sl
00046c60  str.w   r3, [r5, #0xa4]
00046c64  lsls    r3, r3, #3
00046c66  adds    r3, r3, r5
00046c68  str     r2, [r3, #4]
00046c6a  ldr.w   r3, [r5, #0xa4]
00046c6e  add     r3, sl
00046c70  str.w   r6, [r5, r3, lsl #3]
00046c74  b       #0x46c18
00046c76  ldr.w   r1, [pc, #0x68]
00046c7a  add     r1, pc ; -> 0x000425b9  t_reaction_land
00046c7c  lsls    r3, r2, #3
00046c7e  adds    r3, r3, r5
00046c80  movs    r0, #0
00046c82  str     r1, [r3, #4]
00046c84  ldr.w   r3, [r5, #0xa4]
00046c88  adds    r3, #1
00046c8a  str.w   r0, [r5, r3, lsl #3]
00046c8e  b       #0x46c18
00046c90  mov     r0, r4
00046c92  movs    r3, #2
00046c94  str     r3, [r4, #0x1c]
00046c96  bl      #0x580a4 ; -> group_sound
00046c9a  mov.w   r3, #0x10000
00046c9e  str     r3, [r4, #0x1c]
00046ca0  sub.w   r3, r3, #0x90000
00046ca4  str     r3, [r4, #0x20]
00046ca6  add.w   r3, r3, #0x86000
00046caa  str     r3, [r4, #0x24]
00046cac  movs    r3, #5
00046cae  str     r3, [r4, #0x28]
00046cb0  adds    r3, #0x19
00046cb2  str     r3, [r4, #0x40]
00046cb4  ldr.w   r3, [r5, #0xa4]
00046cb8  mov.w   r2, #0x5c8
00046cbc  adds    r3, #1
00046cbe  str.w   r2, [r5, r3, lsl #3]
00046cc2  ldr.w   r3, [r5, #0xa4]
00046cc6  adds    r2, r3, #1
00046cc8  ldr.w   r3, [pc, #0x18]
00046ccc  str.w   r2, [r5, #0xa4]
00046cd0  add     r3, pc ; -> 0x000f3720  t_flight
00046cd2  ldr     r1, [r3]
00046cd4  b       #0x46c7c
00046cd6  nop     
00046cd8  add     r2, sp, #0xe4
