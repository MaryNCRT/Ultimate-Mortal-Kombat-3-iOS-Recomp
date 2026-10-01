========================================================================
t_r_duck_airpunch  0x00042f18  204 bytes   mkreact.c
========================================================================

00042f18  push    {r4, r5, r6, r7, lr}
00042f1a  add     r7, sp, #0xc
00042f1c  ldr.w   r2, [r0, #0xa4]
00042f20  mov     r4, r0
00042f22  ldr.w   r5, [r0, #0x108]
00042f26  adds    r3, r2, #1
00042f28  ldr.w   r6, [r0, r3, lsl #3]
00042f2c  cmp.w   r6, #0x660
00042f30  beq     #0x42f9e
00042f32  movw    r3, #0x667
00042f36  cmp     r6, r3
00042f38  beq     #0x42f84
00042f3a  cbz     r6, #0x42f42
00042f3c  mvn     r0, #2
00042f40  pop     {r4, r5, r6, r7, pc}
00042f42  mov     r0, r5
00042f44  movs    r1, #8
00042f46  bl      #0x57dbc ; -> rsnd_func
00042f4a  mov     r0, r5
00042f4c  bl      #0x420e4 ; -> rsnd_react_voice
00042f50  movs    r3, #3
00042f52  str     r3, [r5, #0x20]
00042f54  ldr.w   r3, [r4, #0xa4]
00042f58  mov.w   r2, #0x660
00042f5c  mov     r0, r6
00042f5e  adds    r3, #1
00042f60  str.w   r2, [r4, r3, lsl #3]
00042f64  ldr.w   r3, [r4, #0xa4]
00042f68  ldr     r2, [pc, #0x6c]
00042f6a  adds    r3, #1
00042f6c  str.w   r3, [r4, #0xa4]
00042f70  lsls    r3, r3, #3
00042f72  adds    r3, r3, r4
00042f74  add     r2, pc ; -> 0x00047b51  t_avoid_corner_trap
00042f76  str     r2, [r3, #4]
00042f78  ldr.w   r3, [r4, #0xa4]
00042f7c  adds    r3, #1
00042f7e  str.w   r6, [r4, r3, lsl #3]
00042f82  b       #0x42f40
00042f84  ldr.w   r1, [pc, #0x54]
00042f88  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00042f8a  lsls    r3, r2, #3
00042f8c  adds    r3, r3, r4
00042f8e  movs    r0, #0
00042f90  str     r1, [r3, #4]
00042f92  ldr.w   r3, [r4, #0xa4]
00042f96  adds    r3, #1
00042f98  str.w   r0, [r4, r3, lsl #3]
00042f9c  b       #0x42f40
00042f9e  mov.w   r3, #0x38000
00042fa2  str     r3, [r5, #0x1c]
00042fa4  sub.w   r3, r3, #0x98000
00042fa8  str     r3, [r5, #0x20]
00042faa  add.w   r3, r3, #0x68000
00042fae  str     r3, [r5, #0x24]
00042fb0  movs    r3, #5
00042fb2  str     r3, [r5, #0x28]
00042fb4  adds    r3, #0x19
00042fb6  str     r3, [r5, #0x40]
00042fb8  ldr.w   r3, [r0, #0xa4]
00042fbc  movw    r2, #0x667
00042fc0  adds    r3, #1
00042fc2  str.w   r2, [r0, r3, lsl #3]
00042fc6  ldr.w   r3, [r0, #0xa4]
00042fca  adds    r2, r3, #1
00042fcc  ldr     r3, [pc, #0x10]
00042fce  str.w   r2, [r0, #0xa4]
00042fd2  add     r3, pc ; -> 0x000f3720  t_flight
00042fd4  ldr     r1, [r3]
00042fd6  b       #0x42f8a
00042fd8  ldr     r3, [pc, #0x364]
00042fda  movs    r0, r0
00042fdc  bl      #0xffdd0fde
00042fe0  lsls    r2, r1, #0x1d
00042fe2  movs    r3, r1
