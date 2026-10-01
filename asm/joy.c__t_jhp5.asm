========================================================================
t_jhp5  0x00030be4  388 bytes   joy.c
========================================================================

00030be4  push    {r4, r5, r6, r7, lr}
00030be6  add     r7, sp, #0xc
00030be8  str     r8, [sp, #-0x4]!
00030bec  ldr.w   r2, [r0, #0xa4]
00030bf0  movw    r8, #0x771
00030bf4  mov     r5, r0
00030bf6  adds    r3, r2, #1
00030bf8  ldr.w   r4, [r0, #0x108]
00030bfc  ldr.w   r6, [r0, r3, lsl #3]
00030c00  cmp     r6, r8
00030c02  beq     #0x30c88
00030c04  movw    r3, #0x77d
00030c08  cmp     r6, r3
00030c0a  beq     #0x30c70
00030c0c  cbz     r6, #0x30c18
00030c0e  mvn     r0, #2
00030c12  ldr     r8, [sp], #4
00030c16  pop     {r4, r5, r6, r7, pc}
00030c18  mov     r0, r4
00030c1a  bl      #0x308c4 ; -> get_last_button
00030c1e  ldr     r3, [r4, #0x1c]
00030c20  ldr     r2, [r4]
00030c22  mov     r0, r4
00030c24  str     r3, [r2, #0x30]
00030c26  str     r6, [r4, #0x1c]
00030c28  bl      #0x580a4 ; -> group_sound
00030c2c  mov     r0, r4
00030c2e  movs    r1, #0xe
00030c30  bl      #0x57dbc ; -> rsnd_func
00030c34  ldr     r2, [r4]
00030c36  movs    r3, #2
00030c38  mov     r0, r6
00030c3a  str     r3, [r2, #0x58]
00030c3c  adds    r3, #1
00030c3e  str     r3, [r4, #0x1c]
00030c40  adds    r3, #0xfe
00030c42  str     r3, [r4, #0x20]
00030c44  ldr.w   r3, [r5, #0xa4]
00030c48  adds    r3, #1
00030c4a  str.w   r8, [r5, r3, lsl #3]
00030c4e  ldr.w   r3, [r5, #0xa4]
00030c52  adds    r2, r3, #1
00030c54  ldr     r3, [pc, #0xf0]
00030c56  str.w   r2, [r5, #0xa4]
00030c5a  add     r3, pc ; -> 0x000f37e8  t_act_mframew
00030c5c  ldr     r1, [r3]
00030c5e  lsls    r3, r2, #3
00030c60  adds    r3, r3, r5
00030c62  str     r1, [r3, #4]
00030c64  ldr.w   r3, [r5, #0xa4]
00030c68  adds    r3, #1
00030c6a  str.w   r6, [r5, r3, lsl #3]
00030c6e  b       #0x30c12
00030c70  ldr     r0, [r4, #0x5c]
00030c72  cbz     r0, #0x30cb4
00030c74  ldr     r3, [r4, #0x1c]
00030c76  lsrs    r0, r3, #0x10
00030c78  cmp     r0, #1
00030c7a  str     r0, [r4, #0x1c]
00030c7c  beq     #0x30d2a
00030c7e  cmp     r0, #0
00030c80  beq     #0x30d0e
00030c82  ldr     r2, [pc, #0xc8]
00030c84  add     r2, pc ; -> 0x0002f78d  t_joy_un_hi_punch2
00030c86  b       #0x30c9c
00030c88  ldr     r3, [pc, #0xc4]
00030c8a  add     r3, pc ; -> 0x0016564c  bt_jump+0x28
00030c8c  ldr     r3, [r3]
00030c8e  ldrh.w  r6, [r3, #0x452]
00030c92  sxth    r3, r6
00030c94  str     r3, [r4, #0x1c]
00030c96  cbz     r6, #0x30ccc
00030c98  ldr     r2, [pc, #0xb8]
00030c9a  add     r2, pc ; -> 0x0002f78d  t_joy_un_hi_punch2
00030c9c  ldr.w   r3, [r5, #0xa4]
00030ca0  movs    r0, #0
00030ca2  lsls    r3, r3, #3
00030ca4  adds    r3, r3, r5
00030ca6  str     r2, [r3, #4]
00030ca8  ldr.w   r3, [r5, #0xa4]
00030cac  adds    r3, #1
00030cae  str.w   r0, [r5, r3, lsl #3]
00030cb2  b       #0x30c12
00030cb4  ldr.w   r1, [pc, #0xa0]
00030cb8  lsls    r3, r2, #3
00030cba  adds    r3, r3, r5
00030cbc  add     r1, pc ; -> 0x0002f78d  t_joy_un_hi_punch2
00030cbe  str     r1, [r3, #4]
00030cc0  ldr.w   r3, [r5, #0xa4]
00030cc4  adds    r3, #1
00030cc6  str.w   r0, [r5, r3, lsl #3]
00030cca  b       #0x30c12
00030ccc  movs    r3, #2
00030cce  mov     r0, r4
00030cd0  str     r3, [r4, #0x48]
00030cd2  str     r3, [r4, #0x1c]
00030cd4  str     r6, [r4, #0x44]
00030cd6  bl      #0x2f7d8 ; -> punch_strike_check
00030cda  movs    r3, #5
00030cdc  str     r3, [r4, #0x44]
00030cde  ldr.w   r3, [r5, #0xa4]
00030ce2  movw    r2, #0x77d
00030ce6  mov     r0, r6
00030ce8  adds    r3, #1
00030cea  str.w   r2, [r5, r3, lsl #3]
00030cee  ldr.w   r3, [r5, #0xa4]
00030cf2  ldr     r2, [pc, #0x68]
00030cf4  adds    r3, #1
00030cf6  str.w   r3, [r5, #0xa4]
00030cfa  lsls    r3, r3, #3
00030cfc  adds    r3, r3, r5
00030cfe  add     r2, pc ; -> 0x00030eed  t_punch_sleep
00030d00  str     r2, [r3, #4]
00030d02  ldr.w   r3, [r5, #0xa4]
00030d06  adds    r3, #1
00030d08  str.w   r6, [r5, r3, lsl #3]
00030d0c  b       #0x30c12
00030d0e  ldr.w   r3, [r5, #0xa4]
00030d12  ldr.w   r2, [pc, #0x4c]
00030d16  lsls    r3, r3, #3
00030d18  adds    r3, r3, r5
00030d1a  add     r2, pc ; -> 0x00030d69  t_jhp4
00030d1c  str     r2, [r3, #4]
00030d1e  ldr.w   r3, [r5, #0xa4]
00030d22  adds    r3, #1
00030d24  str.w   r0, [r5, r3, lsl #3]
00030d28  b       #0x30c12
00030d2a  ldr.w   r3, [r5, #0xa4]
00030d2e  ldr.w   r2, [pc, #0x34]
00030d32  subs    r0, #1
00030d34  lsls    r3, r3, #3
00030d36  adds    r3, r3, r5
00030d38  add     r2, pc ; -> 0x0002f529  t_joy_punch_htm2
00030d3a  str     r2, [r3, #4]
00030d3c  ldr.w   r3, [r5, #0xa4]
00030d40  adds    r3, #1
00030d42  str.w   r0, [r5, r3, lsl #3]
00030d46  b       #0x30c12
00030d48  cmp     r3, #0x8a
00030d4a  movs    r4, r1
00030d4c  add.w   pc, r5, pc, ror #31
00030d50  ldr     r1, [pc, #0x2f8]
00030d52  movs    r3, r2
