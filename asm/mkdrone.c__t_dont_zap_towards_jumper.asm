========================================================================
t_dont_zap_towards_jumper  0x00067bac  216 bytes   mkdrone.c
========================================================================

00067bac  push    {lr}
00067bae  ldr.w   ip, [r0, #0xa4]
00067bb2  ldr.w   lr, [r0, #0x108]
00067bb6  add.w   r1, ip, #1
00067bba  ldr.w   r2, [r0, r1, lsl #3]
00067bbe  cmp.w   r2, #0x3ac
00067bc2  beq     #0x67c1a
00067bc4  movw    r3, #0x3b6
00067bc8  cmp     r2, r3
00067bca  beq     #0x67bfe
00067bcc  cbz     r2, #0x67bd4
00067bce  mvn     r0, #2
00067bd2  pop     {pc}
00067bd4  mov.w   r3, #0x3ac
00067bd8  str.w   r3, [r0, r1, lsl #3]
00067bdc  ldr.w   r3, [r0, #0xa4]
00067be0  ldr     r1, [pc, #0x88]
00067be2  adds    r3, #1
00067be4  str.w   r3, [r0, #0xa4]
00067be8  lsls    r3, r3, #3
00067bea  adds    r3, r3, r0
00067bec  add     r1, pc ; -> 0x0006cdad  t_nr_drone_zone
00067bee  str     r1, [r3, #4]
00067bf0  ldr.w   r3, [r0, #0xa4]
00067bf4  adds    r3, #1
00067bf6  str.w   r2, [r0, r3, lsl #3]
00067bfa  mov     r0, r2
00067bfc  b       #0x67bd2
00067bfe  ldr     r2, [pc, #0x70]
00067c00  lsl.w   r3, ip, #3
00067c04  add     r2, pc ; -> 0x00067c85  t_attack_very_far_hard
00067c06  adds    r3, r3, r0
00067c08  str     r2, [r3, #4]
00067c0a  ldr.w   r3, [r0, #0xa4]
00067c0e  movs    r2, #0
00067c10  adds    r3, #1
00067c12  str.w   r2, [r0, r3, lsl #3]
00067c16  mov     r0, r2
00067c18  b       #0x67bd2
00067c1a  ldr     r3, [pc, #0x58]
00067c1c  add     r3, pc ; -> 0x000f357c  G
00067c1e  ldr     r3, [r3]
00067c20  ldrsh.w r3, [r3, #0x44c]
00067c24  cmp     r3, #5
00067c26  str.w   r3, [lr, #0x1c]
00067c2a  ble     #0x67c3a
00067c2c  ldr.w   r3, [r0, #0xa4]
00067c30  ldr.w   r2, [pc, #0x44]
00067c34  lsls    r3, r3, #3
00067c36  add     r2, pc ; -> 0x00067c85  t_attack_very_far_hard
00067c38  b       #0x67c06
00067c3a  ldr.w   r3, [pc, #0x40]
00067c3e  movw    r2, #0x3b6
00067c42  add     r3, pc ; -> 0x001724f8  funcs.8089
00067c44  str.w   r3, [lr, #0x68]
00067c48  movs    r3, #4
00067c4a  str.w   r3, [lr, #0x64]
00067c4e  ldr.w   r3, [r0, #0xa4]
00067c52  adds    r3, #1
00067c54  str.w   r2, [r0, r3, lsl #3]
00067c58  ldr.w   r3, [r0, #0xa4]
00067c5c  ldr     r2, [pc, #0x20]
00067c5e  adds    r3, #1
00067c60  add     r2, pc ; -> 0x00072e4d  t_random_do
00067c62  str.w   r3, [r0, #0xa4]
00067c66  lsls    r3, r3, #3
00067c68  b       #0x67c06
00067c6a  nop     
00067c6c  str     r5, [r7, r6]
00067c6e  movs    r0, r0
00067c70  lsls    r5, r7, #1
00067c72  movs    r0, r0
00067c74  cbnz    r4, #0x67c8e
00067c76  movs    r0, r1
00067c78  lsls    r3, r1, #1
00067c7a  movs    r0, r0
00067c7c  add     r0, sp, #0x2c8
00067c7e  movs    r0, r2
00067c80  cbz     r1, #0x67cbe
00067c82  movs    r0, r0
