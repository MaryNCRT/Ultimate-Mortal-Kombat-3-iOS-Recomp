========================================================================
tl_do_robo_net  0x00079c6c  332 bytes   mkzap.c
========================================================================

00079c6c  push    {r4, r5, r6, r7, lr}
00079c6e  add     r7, sp, #0xc
00079c70  str     r8, [sp, #-0x4]!
00079c74  ldr.w   r3, [r0, #0xa4]
00079c78  movw    r8, #0xef9
00079c7c  mov     r5, r0
00079c7e  adds    r3, #1
00079c80  ldr.w   r6, [r0, #0x108]
00079c84  ldr.w   r4, [r0, r3, lsl #3]
00079c88  cmp     r4, r8
00079c8a  beq     #0x79cfe
00079c8c  ble     #0x79ca6
00079c8e  movw    r3, #0xf24
00079c92  cmp     r4, r3
00079c94  beq     #0x79d8c
00079c96  adds    r3, #2
00079c98  cmp     r4, r3
00079c9a  beq     #0x79ce2
00079c9c  mvn     r0, #2
00079ca0  ldr     r8, [sp], #4
00079ca4  pop     {r4, r5, r6, r7, pc}
00079ca6  cmp     r4, #0
00079ca8  bne     #0x79c9c
00079caa  movs    r3, #0xa
00079cac  str     r4, [r6, #0x44]
00079cae  str     r3, [r6, #0x20]
00079cb0  mov     r0, r6
00079cb2  bl      #0x79590 ; -> zap_init_special_act
00079cb6  ldr.w   r3, [r5, #0xa4]
00079cba  ldr     r2, [pc, #0xec]
00079cbc  adds    r3, #1
00079cbe  add     r2, pc ; -> 0x00075291  t_robo_open_chest
00079cc0  str.w   r8, [r5, r3, lsl #3]
00079cc4  ldr.w   r3, [r5, #0xa4]
00079cc8  adds    r3, #1
00079cca  str.w   r3, [r5, #0xa4]
00079cce  lsls    r3, r3, #3
00079cd0  adds    r3, r3, r5
00079cd2  mov     r0, r4
00079cd4  str     r2, [r3, #4]
00079cd6  ldr.w   r3, [r5, #0xa4]
00079cda  adds    r3, #1
00079cdc  str.w   r4, [r5, r3, lsl #3]
00079ce0  b       #0x79ca0
00079ce2  mov     r0, r6
00079ce4  movs    r4, #0
00079ce6  str     r4, [r6, #0x40]
00079ce8  bl      #0x55228 ; -> get_char_ani2
00079cec  movs    r3, #4
00079cee  str     r3, [r6, #0x1c]
00079cf0  ldr.w   r3, [pc, #0xb8]
00079cf4  add     r3, pc ; -> 0x000f37c4  t_backwards_ani
00079cf6  ldr     r2, [r3]
00079cf8  ldr.w   r3, [r5, #0xa4]
00079cfc  b       #0x79cce
00079cfe  ldr.w   r3, [pc, #0xb0]
00079d02  mov     r0, r6
00079d04  add     r3, pc ; -> 0x000f357c  G
00079d06  ldr     r3, [r3]
00079d08  add.w   r3, r3, #0x408
00079d0c  str     r3, [r6, #0x1c]
00079d0e  bl      #0x5742c ; -> update_tsl
00079d12  mov     r0, r6
00079d14  movs    r3, #5
00079d16  str     r3, [r6, #0x1c]
00079d18  bl      #0x57be4 ; -> ochar_sound
00079d1c  ldr.w   r1, [r5, #0xf8]
00079d20  ldr     r2, [r6, #0x40]
00079d22  mov     r0, r6
00079d24  lsls    r3, r1, #2
00079d26  adds    r3, r3, r5
00079d28  str.w   r2, [r3, #0xa8]
00079d2c  adds    r3, r1, #1
00079d2e  str.w   r3, [r5, #0xf8]
00079d32  ldr.w   r3, [pc, #0x80]
00079d36  add     r3, pc ; -> 0x000788f5  t_net_proc
00079d38  str     r3, [r6, #0x38]
00079d3a  bl      #0x75964 ; -> create_proj_proc
00079d3e  movs    r3, #1
00079d40  str     r3, [r6, #0x40]
00079d42  mov     r4, r0
00079d44  mov     r0, r6
00079d46  bl      #0x55228 ; -> get_char_ani2
00079d4a  ldr     r0, [r4, #8]
00079d4c  ldr     r3, [r6, #0x40]
00079d4e  str     r0, [r6, #0x30]
00079d50  mov     r0, r6
00079d52  str     r3, [r4, #0x40]
00079d54  mvn     r3, #0x17
00079d58  str     r3, [r6, #0x1c]
00079d5a  adds    r3, #0x48
00079d5c  str     r3, [r6, #0x20]
00079d5e  bl      #0x570bc ; -> adjust_xy_a5
00079d62  ldr.w   r3, [r5, #0xf8]
00079d66  movs    r0, #0xb
00079d68  movw    r2, #0xf24
00079d6c  subs    r3, #1
00079d6e  str.w   r3, [r5, #0xf8]
00079d72  lsls    r3, r3, #2
00079d74  adds    r3, r3, r5
00079d76  ldr.w   r3, [r3, #0xa8]
00079d7a  str     r3, [r6, #0x40]
00079d7c  ldr.w   r3, [r5, #0xa4]
00079d80  adds    r3, #1
00079d82  str.w   r2, [r5, r3, lsl #3]
00079d86  str.w   r0, [r5, #0xfc]
00079d8a  b       #0x79ca0
00079d8c  mov     r0, r6
00079d8e  bl      #0x758b0 ; -> i_am_a_sitting_duck
00079d92  ldr.w   r3, [r5, #0xa4]
00079d96  movs    r0, #0x1a
00079d98  movw    r2, #0xf26
00079d9c  adds    r3, #1
00079d9e  str.w   r2, [r5, r3, lsl #3]
00079da2  str.w   r0, [r5, #0xfc]
00079da6  b       #0x79ca0
00079da8  push    {r0, r1, r2, r3, r6, r7, lr}
00079daa  vtbx.8  d25, {d31, fpinst2, mvfr0}, d12
00079dae  movs    r7, r0
00079db0  ldr     r0, [sp, #0x1d0]
00079db2  movs    r7, r0
00079db4  cmp.w   fp, pc, ror #31
