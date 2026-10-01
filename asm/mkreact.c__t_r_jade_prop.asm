========================================================================
t_r_jade_prop  0x00042bf4  224 bytes   mkreact.c
========================================================================

00042bf4  push    {r4, r5, r7, lr}
00042bf6  add     r7, sp, #8
00042bf8  ldr.w   r2, [r0, #0xa4]
00042bfc  mov     r4, r0
00042bfe  ldr.w   r5, [r0, #0x108]
00042c02  adds    r3, r2, #1
00042c04  movw    r1, #0xece
00042c08  ldr.w   r0, [r0, r3, lsl #3]
00042c0c  cmp     r0, r1
00042c0e  beq     #0x42c6c
00042c10  movw    r3, #0xedb
00042c14  cmp     r0, r3
00042c16  beq     #0x42c52
00042c18  cbz     r0, #0x42c20
00042c1a  mvn     r0, #2
00042c1e  pop     {r4, r5, r7, pc}
00042c20  str     r0, [r5, #0x30]
00042c22  str     r0, [r5, #0x38]
00042c24  movs    r3, #3
00042c26  str     r3, [r5, #0x34]
00042c28  ldr.w   r3, [r4, #0xa4]
00042c2c  ldr     r2, [pc, #0x98]
00042c2e  adds    r3, #1
00042c30  add     r2, pc ; -> 0x00044b85  t_reaction_start
00042c32  str.w   r1, [r4, r3, lsl #3]
00042c36  ldr.w   r3, [r4, #0xa4]
00042c3a  adds    r3, #1
00042c3c  str.w   r3, [r4, #0xa4]
00042c40  lsls    r3, r3, #3
00042c42  adds    r3, r3, r4
00042c44  str     r2, [r3, #4]
00042c46  ldr.w   r3, [r4, #0xa4]
00042c4a  adds    r3, #1
00042c4c  str.w   r0, [r4, r3, lsl #3]
00042c50  b       #0x42c1e
00042c52  ldr.w   r1, [pc, #0x78]
00042c56  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00042c58  lsls    r3, r2, #3
00042c5a  adds    r3, r3, r4
00042c5c  movs    r0, #0
00042c5e  str     r1, [r3, #4]
00042c60  ldr.w   r3, [r4, #0xa4]
00042c64  adds    r3, #1
00042c66  str.w   r0, [r4, r3, lsl #3]
00042c6a  b       #0x42c1e
00042c6c  mov     r0, r5
00042c6e  mov.w   r3, #0x60006
00042c72  str     r3, [r5, #0x48]
00042c74  bl      #0x581e0 ; -> shake_a11
00042c78  mov     r0, r5
00042c7a  movs    r3, #2
00042c7c  str     r3, [r5, #0x1c]
00042c7e  bl      #0x580a4 ; -> group_sound
00042c82  movs    r1, #0xa
00042c84  mov     r0, r5
00042c86  bl      #0x57dbc ; -> rsnd_func
00042c8a  mov.w   r3, #0x60000
00042c8e  str     r3, [r5, #0x1c]
00042c90  sub.w   r3, r3, #0xa0000
00042c94  str     r3, [r5, #0x20]
00042c96  add.w   r3, r3, #0x46000
00042c9a  str     r3, [r5, #0x24]
00042c9c  movs    r3, #5
00042c9e  str     r3, [r5, #0x28]
00042ca0  adds    r3, #0x19
00042ca2  str     r3, [r5, #0x40]
00042ca4  ldr.w   r3, [r4, #0xa4]
00042ca8  movw    r2, #0xedb
00042cac  adds    r3, #1
00042cae  str.w   r2, [r4, r3, lsl #3]
00042cb2  ldr.w   r3, [r4, #0xa4]
00042cb6  adds    r2, r3, #1
00042cb8  ldr.w   r3, [pc, #0x14]
00042cbc  str.w   r2, [r4, #0xa4]
00042cc0  add     r3, pc ; -> 0x000f3720  t_flight
00042cc2  ldr     r1, [r3]
00042cc4  b       #0x42c58
00042cc6  nop     
00042cc8  subs    r1, r2, #5
00042cca  movs    r0, r0
