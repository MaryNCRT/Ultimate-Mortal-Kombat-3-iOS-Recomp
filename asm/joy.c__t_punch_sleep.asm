========================================================================
t_punch_sleep  0x00030eec  208 bytes   joy.c
========================================================================

00030eec  push    {r4, r5, r7, lr}
00030eee  add     r7, sp, #8
00030ef0  ldr.w   r2, [r0, #0xa4]
00030ef4  mov     r5, r0
00030ef6  ldr.w   r4, [r0, #0x108]
00030efa  adds    r3, r2, #1
00030efc  ldr.w   r3, [r0, r3, lsl #3]
00030f00  cmp     r3, #0
00030f02  beq     #0x30f5e
00030f04  movw    r2, #0x67d
00030f08  cmp     r3, r2
00030f0a  it      ne
00030f0c  mvnne   r0, #2
00030f10  beq     #0x30f14
00030f12  pop     {r4, r5, r7, pc}
00030f14  ldr     r3, [r4, #0x48]
00030f16  cmp     r3, #0
00030f18  str     r3, [r4, #0x1c]
00030f1a  blt     #0x30f22
00030f1c  mov     r0, r4
00030f1e  bl      #0x2f7d8 ; -> punch_strike_check
00030f22  mov     r0, r4
00030f24  bl      #0x308c4 ; -> get_last_button
00030f28  ldr     r3, [r4]
00030f2a  ldr     r2, [r4, #0x1c]
00030f2c  ldr     r3, [r3, #0x30]
00030f2e  cmp     r3, r2
00030f30  str     r3, [r4, #0x20]
00030f32  beq     #0x30f4e
00030f34  mov     r0, r4
00030f36  bl      #0x551f0 ; -> am_i_facing_him
00030f3a  str     r0, [r4, #0x5c]
00030f3c  ldr.w   r3, [r5, #0xa4]
00030f40  cmp     r3, #0
00030f42  ble     #0x30f84
00030f44  subs    r3, #1
00030f46  movs    r0, #0
00030f48  str.w   r3, [r5, #0xa4]
00030f4c  b       #0x30f12
00030f4e  ldr     r3, [r4, #0x44]
00030f50  subs    r3, #1
00030f52  cmp     r3, #0
00030f54  str     r3, [r4, #0x44]
00030f56  it      gt
00030f58  ldrgt.w r2, [r5, #0xa4]
00030f5c  ble     #0x30f70
00030f5e  adds    r3, r2, #1
00030f60  movs    r0, #1
00030f62  movw    r2, #0x67d
00030f66  str.w   r2, [r5, r3, lsl #3]
00030f6a  str.w   r0, [r5, #0xfc]
00030f6e  b       #0x30f12
00030f70  movs    r0, #0
00030f72  str     r0, [r4, #0x5c]
00030f74  ldr.w   r3, [r5, #0xa4]
00030f78  cmp     r3, r0
00030f7a  ble     #0x30f9c
00030f7c  subs    r2, r3, #1
00030f7e  str.w   r2, [r5, #0xa4]
00030f82  b       #0x30f12
00030f84  ldr     r2, [pc, #0x2c]
00030f86  lsls    r3, r3, #3
00030f88  adds    r3, r3, r5
00030f8a  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
00030f8c  str     r2, [r3, #4]
00030f8e  ldr.w   r3, [r5, #0xa4]
00030f92  movs    r0, #0
00030f94  adds    r3, #1
00030f96  str.w   r0, [r5, r3, lsl #3]
00030f9a  b       #0x30f12
00030f9c  ldr     r2, [pc, #0x18]
00030f9e  lsls    r3, r3, #3
00030fa0  adds    r3, r3, r5
00030fa2  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
00030fa4  str     r2, [r3, #4]
00030fa6  ldr.w   r3, [r5, #0xa4]
00030faa  adds    r3, #1
00030fac  str.w   r0, [r5, r3, lsl #3]
00030fb0  b       #0x30f12
00030fb2  nop     
00030fb4  bl      #0x104fb6
00030fb8  bl      #0xecfba
