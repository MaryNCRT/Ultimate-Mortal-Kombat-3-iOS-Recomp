========================================================================
t_r_kano_roll  0x00042a34  224 bytes   mkreact.c
========================================================================

00042a34  push    {r4, r5, r7, lr}
00042a36  add     r7, sp, #8
00042a38  ldr.w   r2, [r0, #0xa4]
00042a3c  mov     r4, r0
00042a3e  ldr.w   r5, [r0, #0x108]
00042a42  adds    r3, r2, #1
00042a44  movw    r1, #0xef9
00042a48  ldr.w   r0, [r0, r3, lsl #3]
00042a4c  cmp     r0, r1
00042a4e  beq     #0x42aac
00042a50  movw    r3, #0xf06
00042a54  cmp     r0, r3
00042a56  beq     #0x42a92
00042a58  cbz     r0, #0x42a60
00042a5a  mvn     r0, #2
00042a5e  pop     {r4, r5, r7, pc}
00042a60  str     r0, [r5, #0x30]
00042a62  str     r0, [r5, #0x38]
00042a64  movs    r3, #3
00042a66  str     r3, [r5, #0x34]
00042a68  ldr.w   r3, [r4, #0xa4]
00042a6c  ldr     r2, [pc, #0x98]
00042a6e  adds    r3, #1
00042a70  add     r2, pc ; -> 0x00044b85  t_reaction_start
00042a72  str.w   r1, [r4, r3, lsl #3]
00042a76  ldr.w   r3, [r4, #0xa4]
00042a7a  adds    r3, #1
00042a7c  str.w   r3, [r4, #0xa4]
00042a80  lsls    r3, r3, #3
00042a82  adds    r3, r3, r4
00042a84  str     r2, [r3, #4]
00042a86  ldr.w   r3, [r4, #0xa4]
00042a8a  adds    r3, #1
00042a8c  str.w   r0, [r4, r3, lsl #3]
00042a90  b       #0x42a5e
00042a92  ldr.w   r1, [pc, #0x78]
00042a96  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00042a98  lsls    r3, r2, #3
00042a9a  adds    r3, r3, r4
00042a9c  movs    r0, #0
00042a9e  str     r1, [r3, #4]
00042aa0  ldr.w   r3, [r4, #0xa4]
00042aa4  adds    r3, #1
00042aa6  str.w   r0, [r4, r3, lsl #3]
00042aaa  b       #0x42a5e
00042aac  mov     r0, r5
00042aae  mov.w   r3, #0x60006
00042ab2  str     r3, [r5, #0x48]
00042ab4  bl      #0x581e0 ; -> shake_a11
00042ab8  mov     r0, r5
00042aba  movs    r3, #2
00042abc  str     r3, [r5, #0x1c]
00042abe  bl      #0x580a4 ; -> group_sound
00042ac2  movs    r1, #0xa
00042ac4  mov     r0, r5
00042ac6  bl      #0x57dbc ; -> rsnd_func
00042aca  mov.w   r3, #0x40000
00042ace  str     r3, [r5, #0x1c]
00042ad0  sub.w   r3, r3, #0x80000
00042ad4  str     r3, [r5, #0x20]
00042ad6  add.w   r3, r3, #0x44000
00042ada  str     r3, [r5, #0x24]
00042adc  movs    r3, #5
00042ade  str     r3, [r5, #0x28]
00042ae0  adds    r3, #0x19
00042ae2  str     r3, [r5, #0x40]
00042ae4  ldr.w   r3, [r4, #0xa4]
00042ae8  movw    r2, #0xf06
00042aec  adds    r3, #1
00042aee  str.w   r2, [r4, r3, lsl #3]
00042af2  ldr.w   r3, [r4, #0xa4]
00042af6  adds    r2, r3, #1
00042af8  ldr.w   r3, [pc, #0x14]
00042afc  str.w   r2, [r4, #0xa4]
00042b00  add     r3, pc ; -> 0x000f3720  t_flight
00042b02  ldr     r1, [r3]
00042b04  b       #0x42a98
00042b06  nop     
00042b08  movs    r1, #0x11
00042b0a  movs    r0, r0
