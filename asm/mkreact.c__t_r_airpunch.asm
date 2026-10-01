========================================================================
t_r_airpunch  0x00042cd4  220 bytes   mkreact.c
========================================================================

00042cd4  push    {r4, r5, r6, r7, lr}
00042cd6  add     r7, sp, #0xc
00042cd8  str     r8, [sp, #-0x4]!
00042cdc  ldr.w   r2, [r0, #0xa4]
00042ce0  movw    r8, #0xea1
00042ce4  mov     r4, r0
00042ce6  adds    r3, r2, #1
00042ce8  ldr.w   r5, [r0, #0x108]
00042cec  ldr.w   r6, [r0, r3, lsl #3]
00042cf0  cmp     r6, r8
00042cf2  beq     #0x42d66
00042cf4  cmp.w   r6, #0xeb0
00042cf8  beq     #0x42d4e
00042cfa  cbz     r6, #0x42d06
00042cfc  mvn     r0, #2
00042d00  ldr     r8, [sp], #4
00042d04  pop     {r4, r5, r6, r7, pc}
00042d06  mov     r0, r5
00042d08  movs    r1, #8
00042d0a  bl      #0x57dbc ; -> rsnd_func
00042d0e  mov     r0, r5
00042d10  bl      #0x420e4 ; -> rsnd_react_voice
00042d14  ldr     r2, [r5]
00042d16  movw    r3, #0x619
00042d1a  str     r3, [r5, #0x1c]
00042d1c  mov     r0, r6
00042d1e  str     r3, [r2, #0x18]
00042d20  movs    r3, #2
00042d22  str     r3, [r5, #0x20]
00042d24  ldr.w   r3, [r4, #0xa4]
00042d28  ldr     r2, [pc, #0x78]
00042d2a  adds    r3, #1
00042d2c  add     r2, pc ; -> 0x00047b51  t_avoid_corner_trap
00042d2e  str.w   r8, [r4, r3, lsl #3]
00042d32  ldr.w   r3, [r4, #0xa4]
00042d36  adds    r3, #1
00042d38  str.w   r3, [r4, #0xa4]
00042d3c  lsls    r3, r3, #3
00042d3e  adds    r3, r3, r4
00042d40  str     r2, [r3, #4]
00042d42  ldr.w   r3, [r4, #0xa4]
00042d46  adds    r3, #1
00042d48  str.w   r6, [r4, r3, lsl #3]
00042d4c  b       #0x42d00
00042d4e  ldr     r1, [pc, #0x58]
00042d50  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00042d52  lsls    r3, r2, #3
00042d54  adds    r3, r3, r4
00042d56  movs    r0, #0
00042d58  str     r1, [r3, #4]
00042d5a  ldr.w   r3, [r4, #0xa4]
00042d5e  adds    r3, #1
00042d60  str.w   r0, [r4, r3, lsl #3]
00042d64  b       #0x42d00
00042d66  mov.w   r3, #0x30000
00042d6a  str     r3, [r5, #0x1c]
00042d6c  sub.w   r3, r3, #0x90000
00042d70  str     r3, [r5, #0x20]
00042d72  add.w   r3, r3, #0x67000
00042d76  str     r3, [r5, #0x24]
00042d78  movs    r3, #5
00042d7a  str     r3, [r5, #0x28]
00042d7c  adds    r3, #0x19
00042d7e  str     r3, [r5, #0x40]
00042d80  ldr.w   r3, [r0, #0xa4]
00042d84  mov.w   r2, #0xeb0
00042d88  adds    r3, #1
00042d8a  str.w   r2, [r0, r3, lsl #3]
00042d8e  ldr.w   r3, [r0, #0xa4]
00042d92  adds    r2, r3, #1
00042d94  ldr.w   r3, [pc, #0x14]
00042d98  str.w   r2, [r0, #0xa4]
00042d9c  add     r3, pc ; -> 0x000f3720  t_flight
00042d9e  ldr     r1, [r3]
00042da0  b       #0x42d52
00042da2  nop     
00042da4  ldr     r6, [pc, #0x84]
00042da6  movs    r0, r0
00042da8  bl      #0x8daa
00042dac  lsrs    r0, r0, #6
00042dae  movs    r3, r1
