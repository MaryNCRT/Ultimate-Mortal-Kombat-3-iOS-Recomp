========================================================================
t_fall_on_my_back  0x00041efc  144 bytes   mkreact.c
========================================================================

00041efc  ldr.w   ip, [r0, #0xa4]
00041f00  ldr.w   r2, [r0, #0x108]
00041f04  add.w   r3, ip, #1
00041f08  ldr.w   r1, [r0, r3, lsl #3]
00041f0c  cbnz    r1, #0x41f56
00041f0e  mov.w   r3, #0x8000
00041f12  str     r3, [r2, #0x24]
00041f14  movs    r3, #5
00041f16  str     r1, [r2, #0x1c]
00041f18  str     r3, [r2, #0x28]
00041f1a  str     r1, [r2, #0x20]
00041f1c  adds    r3, #0x19
00041f1e  str     r3, [r2, #0x40]
00041f20  ldr.w   r3, [r0, #0xa4]
00041f24  movw    r2, #0x1474
00041f28  adds    r3, #1
00041f2a  str.w   r2, [r0, r3, lsl #3]
00041f2e  ldr.w   r3, [r0, #0xa4]
00041f32  adds    r2, r3, #1
00041f34  ldr     r3, [pc, #0x4c]
00041f36  str.w   r2, [r0, #0xa4]
00041f3a  add     r3, pc ; -> 0x000f3720  t_flight
00041f3c  ldr.w   ip, [r3]
00041f40  lsls    r3, r2, #3
00041f42  adds    r3, r3, r0
00041f44  str.w   ip, [r3, #4]
00041f48  ldr.w   r3, [r0, #0xa4]
00041f4c  adds    r3, #1
00041f4e  str.w   r1, [r0, r3, lsl #3]
00041f52  mov     r0, r1
00041f54  bx      lr
00041f56  movw    r3, #0x1474
00041f5a  cmp     r1, r3
00041f5c  it      ne
00041f5e  mvnne   r0, #2
00041f62  bne     #0x41f54
00041f64  ldr.w   r2, [pc, #0x20]
00041f68  lsl.w   r3, ip, #3
00041f6c  adds    r3, r3, r0
00041f6e  add     r2, pc ; -> 0x000425b9  t_reaction_land
00041f70  str     r2, [r3, #4]
00041f72  ldr.w   r3, [r0, #0xa4]
00041f76  movs    r1, #0
00041f78  adds    r3, #1
00041f7a  str.w   r1, [r0, r3, lsl #3]
00041f7e  mov     r0, r1
00041f80  b       #0x41f54
00041f82  nop     
00041f84  asrs    r2, r4, #0x1f
00041f86  movs    r3, r1
00041f88  lsls    r7, r0, #0x19
00041f8a  movs    r0, r0
