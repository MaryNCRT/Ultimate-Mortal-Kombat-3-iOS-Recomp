========================================================================
t_combo43  0x00045ddc  248 bytes   mkreact.c
========================================================================

00045ddc  push    {r4, r5, r7, lr}
00045dde  add     r7, sp, #8
00045de0  ldr.w   r2, [r0, #0xa4]
00045de4  mov     r5, r0
00045de6  ldr.w   r4, [r0, #0x108]
00045dea  adds    r3, r2, #1
00045dec  movw    r1, #0xce8
00045df0  ldr.w   r0, [r0, r3, lsl #3]
00045df4  cmp     r0, r1
00045df6  beq     #0x45e54
00045df8  movw    r3, #0xcfb
00045dfc  cmp     r0, r3
00045dfe  beq     #0x45e3a
00045e00  cbz     r0, #0x45e08
00045e02  mvn     r0, #2
00045e06  pop     {r4, r5, r7, pc}
00045e08  str     r0, [r4, #0x30]
00045e0a  str     r0, [r4, #0x38]
00045e0c  movs    r3, #9
00045e0e  str     r3, [r4, #0x34]
00045e10  ldr.w   r3, [r5, #0xa4]
00045e14  ldr     r2, [pc, #0xb0]
00045e16  adds    r3, #1
00045e18  add     r2, pc ; -> 0x00044b85  t_reaction_start
00045e1a  str.w   r1, [r5, r3, lsl #3]
00045e1e  ldr.w   r3, [r5, #0xa4]
00045e22  adds    r3, #1
00045e24  str.w   r3, [r5, #0xa4]
00045e28  lsls    r3, r3, #3
00045e2a  adds    r3, r3, r5
00045e2c  str     r2, [r3, #4]
00045e2e  ldr.w   r3, [r5, #0xa4]
00045e32  adds    r3, #1
00045e34  str.w   r0, [r5, r3, lsl #3]
00045e38  b       #0x45e06
00045e3a  ldr.w   r1, [pc, #0x90]
00045e3e  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00045e40  lsls    r3, r2, #3
00045e42  adds    r3, r3, r5
00045e44  movs    r0, #0
00045e46  str     r1, [r3, #4]
00045e48  ldr.w   r3, [r5, #0xa4]
00045e4c  adds    r3, #1
00045e4e  str.w   r0, [r5, r3, lsl #3]
00045e52  b       #0x45e06
00045e54  mov     r0, r4
00045e56  bl      #0x54f20 ; -> set_no_block
00045e5a  mov     r0, r4
00045e5c  movs    r3, #4
00045e5e  str     r3, [r4, #0x1c]
00045e60  bl      #0x5877c ; -> create_blood_proc
00045e64  mov     r0, r4
00045e66  movs    r3, #2
00045e68  str     r3, [r4, #0x1c]
00045e6a  bl      #0x580a4 ; -> group_sound
00045e6e  movs    r1, #0xa
00045e70  mov     r0, r4
00045e72  bl      #0x57dbc ; -> rsnd_func
00045e76  mov     r0, r4
00045e78  movs    r3, #0xe
00045e7a  str     r3, [r4, #0x1c]
00045e7c  bl      #0x58d70 ; -> create_fx
00045e80  mov     r0, r4
00045e82  mov.w   r3, #0xa000a
00045e86  str     r3, [r4, #0x48]
00045e88  bl      #0x581e0 ; -> shake_a11
00045e8c  mov.w   r3, #0xa0000
00045e90  str     r3, [r4, #0x1c]
00045e92  sub.w   r3, r3, #0x120000
00045e96  str     r3, [r4, #0x20]
00045e98  add.w   r3, r3, #0x88000
00045e9c  str     r3, [r4, #0x24]
00045e9e  movs    r3, #5
00045ea0  str     r3, [r4, #0x28]
00045ea2  adds    r3, #0x19
00045ea4  str     r3, [r4, #0x40]
00045ea6  ldr.w   r3, [r5, #0xa4]
00045eaa  movw    r2, #0xcfb
00045eae  adds    r3, #1
00045eb0  str.w   r2, [r5, r3, lsl #3]
00045eb4  ldr.w   r3, [r5, #0xa4]
00045eb8  adds    r2, r3, #1
00045eba  ldr.w   r3, [pc, #0x14]
00045ebe  str.w   r2, [r5, #0xa4]
00045ec2  add     r3, pc ; -> 0x000f3720  t_flight
00045ec4  ldr     r1, [r3]
00045ec6  b       #0x45e40
00045ec8  stcl    p15, c15, [sb, #-0x3fc]!
00045ecc  stm     r6!, {r0, r1, r2, r4, r6, r7}
00045ece  vqrshrun.s64 d29, q5, #1
00045ed2  movs    r2, r1
