========================================================================
t_r_roundhouse  0x00044c60  244 bytes   mkreact.c
========================================================================

00044c60  push    {r4, r5, r6, r7, lr}
00044c62  add     r7, sp, #0xc
00044c64  str     r8, [sp, #-0x4]!
00044c68  ldr.w   r2, [r0, #0xa4]
00044c6c  movw    r8, #0xf1c
00044c70  mov     r5, r0
00044c72  adds    r3, r2, #1
00044c74  ldr.w   r4, [r0, #0x108]
00044c78  ldr.w   r6, [r0, r3, lsl #3]
00044c7c  cmp     r6, r8
00044c7e  beq     #0x44d0a
00044c80  movw    r3, #0xf23
00044c84  cmp     r6, r3
00044c86  beq     #0x44cf2
00044c88  cbz     r6, #0x44c94
00044c8a  mvn     r0, #2
00044c8e  ldr     r8, [sp], #4
00044c92  pop     {r4, r5, r6, r7, pc}
00044c94  mov     r0, r4
00044c96  str     r6, [r4, #0x1c]
00044c98  bl      #0x5877c ; -> create_blood_proc
00044c9c  mov     r0, r4
00044c9e  movs    r3, #2
00044ca0  str     r3, [r4, #0x1c]
00044ca2  bl      #0x580a4 ; -> group_sound
00044ca6  mov     r0, r4
00044ca8  movs    r1, #0xa
00044caa  bl      #0x57dbc ; -> rsnd_func
00044cae  mov     r0, r4
00044cb0  mov.w   r3, #0x60006
00044cb4  str     r3, [r4, #0x48]
00044cb6  bl      #0x581e0 ; -> shake_a11
00044cba  movs    r3, #1
00044cbc  str     r3, [r4, #0x34]
00044cbe  ldr     r3, [pc, #0x84]
00044cc0  str     r6, [r4, #0x30]
00044cc2  ldr     r2, [pc, #0x84]
00044cc4  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
00044cc6  str     r3, [r4, #0x38]
00044cc8  ldr.w   r3, [r5, #0xa4]
00044ccc  add     r2, pc ; -> 0x00044b85  t_reaction_start
00044cce  mov     r0, r6
00044cd0  adds    r3, #1
00044cd2  str.w   r8, [r5, r3, lsl #3]
00044cd6  ldr.w   r3, [r5, #0xa4]
00044cda  adds    r3, #1
00044cdc  str.w   r3, [r5, #0xa4]
00044ce0  lsls    r3, r3, #3
00044ce2  adds    r3, r3, r5
00044ce4  str     r2, [r3, #4]
00044ce6  ldr.w   r3, [r5, #0xa4]
00044cea  adds    r3, #1
00044cec  str.w   r6, [r5, r3, lsl #3]
00044cf0  b       #0x44c8e
00044cf2  ldr     r1, [pc, #0x58]
00044cf4  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00044cf6  lsls    r3, r2, #3
00044cf8  adds    r3, r3, r5
00044cfa  movs    r0, #0
00044cfc  str     r1, [r3, #4]
00044cfe  ldr.w   r3, [r5, #0xa4]
00044d02  adds    r3, #1
00044d04  str.w   r0, [r5, r3, lsl #3]
00044d08  b       #0x44c8e
00044d0a  mov.w   r3, #0x60000
00044d0e  str     r3, [r4, #0x1c]
00044d10  sub.w   r3, r3, #0xe0000
00044d14  str     r3, [r4, #0x20]
00044d16  add.w   r3, r3, #0x88000
00044d1a  str     r3, [r4, #0x24]
00044d1c  movs    r3, #5
00044d1e  str     r3, [r4, #0x28]
00044d20  adds    r3, #0x19
00044d22  str     r3, [r4, #0x40]
00044d24  ldr.w   r3, [r0, #0xa4]
00044d28  movw    r2, #0xf23
00044d2c  adds    r3, #1
00044d2e  str.w   r2, [r0, r3, lsl #3]
00044d32  ldr.w   r3, [r0, #0xa4]
00044d36  adds    r2, r3, #1
00044d38  ldr     r3, [pc, #0x14]
00044d3a  str.w   r2, [r0, #0xa4]
00044d3e  add     r3, pc ; -> 0x000f3720  t_flight
00044d40  ldr     r1, [r3]
00044d42  b       #0x44cf6
00044d44  ldm     r1!, {r0, r3, r4, r5, r7}
