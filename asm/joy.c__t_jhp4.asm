========================================================================
t_jhp4  0x00030d68  388 bytes   joy.c
========================================================================

00030d68  push    {r4, r5, r6, r7, lr}
00030d6a  add     r7, sp, #0xc
00030d6c  str     r8, [sp, #-0x4]!
00030d70  ldr.w   r2, [r0, #0xa4]
00030d74  movw    r8, #0x744
00030d78  mov     r5, r0
00030d7a  adds    r3, r2, #1
00030d7c  ldr.w   r4, [r0, #0x108]
00030d80  ldr.w   r6, [r0, r3, lsl #3]
00030d84  cmp     r6, r8
00030d86  beq     #0x30e0c
00030d88  movw    r3, #0x751
00030d8c  cmp     r6, r3
00030d8e  beq     #0x30df4
00030d90  cbz     r6, #0x30d9c
00030d92  mvn     r0, #2
00030d96  ldr     r8, [sp], #4
00030d9a  pop     {r4, r5, r6, r7, pc}
00030d9c  mov     r0, r4
00030d9e  bl      #0x308c4 ; -> get_last_button
00030da2  ldr     r3, [r4, #0x1c]
00030da4  ldr     r2, [r4]
00030da6  mov     r0, r4
00030da8  str     r3, [r2, #0x30]
00030daa  ldr     r2, [r4]
00030dac  movs    r3, #2
00030dae  str     r3, [r2, #0x58]
00030db0  str     r6, [r4, #0x1c]
00030db2  bl      #0x580a4 ; -> group_sound
00030db6  mov     r0, r4
00030db8  movs    r1, #0xe
00030dba  bl      #0x57dbc ; -> rsnd_func
00030dbe  movs    r3, #3
00030dc0  str     r3, [r4, #0x1c]
00030dc2  adds    r3, #0xfe
00030dc4  str     r3, [r4, #0x20]
00030dc6  ldr.w   r3, [r5, #0xa4]
00030dca  mov     r0, r6
00030dcc  adds    r3, #1
00030dce  str.w   r8, [r5, r3, lsl #3]
00030dd2  ldr.w   r3, [r5, #0xa4]
00030dd6  adds    r2, r3, #1
00030dd8  ldr     r3, [pc, #0xf0]
00030dda  str.w   r2, [r5, #0xa4]
00030dde  add     r3, pc ; -> 0x000f37e8  t_act_mframew
00030de0  ldr     r1, [r3]
00030de2  lsls    r3, r2, #3
00030de4  adds    r3, r3, r5
00030de6  str     r1, [r3, #4]
00030de8  ldr.w   r3, [r5, #0xa4]
00030dec  adds    r3, #1
00030dee  str.w   r6, [r5, r3, lsl #3]
00030df2  b       #0x30d96
00030df4  ldr     r0, [r4, #0x5c]
00030df6  cbz     r0, #0x30e38
00030df8  ldr     r3, [r4, #0x1c]
00030dfa  lsrs    r0, r3, #0x10
00030dfc  cmp     r0, #1
00030dfe  str     r0, [r4, #0x1c]
00030e00  beq     #0x30eae
00030e02  cmp     r0, #0
00030e04  beq     #0x30e92
00030e06  ldr     r2, [pc, #0xc8]
00030e08  add     r2, pc ; -> 0x0002f4e5  t_joy_un_hi_punch1
00030e0a  b       #0x30e20
00030e0c  ldr     r3, [pc, #0xc4]
00030e0e  add     r3, pc ; -> 0x0016564c  bt_jump+0x28
00030e10  ldr     r3, [r3]
00030e12  ldrh.w  r6, [r3, #0x452]
00030e16  sxth    r3, r6
00030e18  str     r3, [r4, #0x1c]
00030e1a  cbz     r6, #0x30e50
00030e1c  ldr     r2, [pc, #0xb8]
00030e1e  add     r2, pc ; -> 0x0002f4e5  t_joy_un_hi_punch1
00030e20  ldr.w   r3, [r5, #0xa4]
00030e24  movs    r0, #0
00030e26  lsls    r3, r3, #3
00030e28  adds    r3, r3, r5
00030e2a  str     r2, [r3, #4]
00030e2c  ldr.w   r3, [r5, #0xa4]
00030e30  adds    r3, #1
00030e32  str.w   r0, [r5, r3, lsl #3]
00030e36  b       #0x30d96
00030e38  ldr.w   r1, [pc, #0xa0]
00030e3c  lsls    r3, r2, #3
00030e3e  adds    r3, r3, r5
00030e40  add     r1, pc ; -> 0x0002f4e5  t_joy_un_hi_punch1
00030e42  str     r1, [r3, #4]
00030e44  ldr.w   r3, [r5, #0xa4]
00030e48  adds    r3, #1
00030e4a  str.w   r0, [r5, r3, lsl #3]
00030e4e  b       #0x30d96
00030e50  movs    r3, #2
00030e52  mov     r0, r4
00030e54  str     r3, [r4, #0x48]
00030e56  str     r3, [r4, #0x1c]
00030e58  str     r6, [r4, #0x44]
00030e5a  bl      #0x2f7d8 ; -> punch_strike_check
00030e5e  movs    r3, #5
00030e60  str     r3, [r4, #0x44]
00030e62  ldr.w   r3, [r5, #0xa4]
00030e66  movw    r2, #0x751
00030e6a  mov     r0, r6
00030e6c  adds    r3, #1
00030e6e  str.w   r2, [r5, r3, lsl #3]
00030e72  ldr.w   r3, [r5, #0xa4]
00030e76  ldr     r2, [pc, #0x68]
00030e78  adds    r3, #1
00030e7a  str.w   r3, [r5, #0xa4]
00030e7e  lsls    r3, r3, #3
00030e80  adds    r3, r3, r5
00030e82  add     r2, pc ; -> 0x00030eed  t_punch_sleep
00030e84  str     r2, [r3, #4]
00030e86  ldr.w   r3, [r5, #0xa4]
00030e8a  adds    r3, #1
00030e8c  str.w   r6, [r5, r3, lsl #3]
00030e90  b       #0x30d96
00030e92  ldr.w   r3, [r5, #0xa4]
00030e96  ldr.w   r2, [pc, #0x4c]
00030e9a  lsls    r3, r3, #3
00030e9c  adds    r3, r3, r5
00030e9e  add     r2, pc ; -> 0x00030be5  t_jhp5
00030ea0  str     r2, [r3, #4]
00030ea2  ldr.w   r3, [r5, #0xa4]
00030ea6  adds    r3, #1
00030ea8  str.w   r0, [r5, r3, lsl #3]
00030eac  b       #0x30d96
00030eae  ldr.w   r3, [r5, #0xa4]
00030eb2  ldr.w   r2, [pc, #0x34]
00030eb6  subs    r0, #1
00030eb8  lsls    r3, r3, #3
00030eba  adds    r3, r3, r5
00030ebc  add     r2, pc ; -> 0x0002f591  t_joy_punch_htm1
00030ebe  str     r2, [r3, #4]
00030ec0  ldr.w   r3, [r5, #0xa4]
00030ec4  adds    r3, #1
00030ec6  str.w   r0, [r5, r3, lsl #3]
00030eca  b       #0x30d96
00030ecc  cmp     r2, #6
00030ece  movs    r4, r1
00030ed0  b       #0x30c86
00030ed2  vqshrun.s64 d20, q13, #1
00030ed6  movs    r3, r2
00030ed8  b       #0x30c62
