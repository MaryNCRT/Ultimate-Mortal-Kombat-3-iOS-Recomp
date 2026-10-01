========================================================================
t_rup3  0x00045ed4  216 bytes   mkreact.c
========================================================================

00045ed4  push    {r4, r5, r6, r7, lr}
00045ed6  add     r7, sp, #0xc
00045ed8  ldr.w   r2, [r0, #0xa4]
00045edc  mov     r4, r0
00045ede  ldr.w   r5, [r0, #0x108]
00045ee2  adds    r3, r2, #1
00045ee4  ldr.w   r6, [r0, r3, lsl #3]
00045ee8  cbnz    r6, #0x45f40
00045eea  mov     r0, r5
00045eec  movs    r3, #0xe
00045eee  str     r3, [r5, #0x1c]
00045ef0  bl      #0x58d70 ; -> create_fx
00045ef4  mov.w   r3, #0x20000
00045ef8  str     r3, [r5, #0x1c]
00045efa  ldr     r3, [pc, #0x98]
00045efc  add     r3, pc ; -> 0x000f3534  RoundParam
00045efe  ldr     r2, [r3]
00045f00  ldr     r3, [r2, #8]
00045f02  cmp     r3, #0
00045f04  bne     #0x45f68
00045f06  ldrsb.w r3, [r2, #0x30]
00045f0a  cmp     r3, #0
00045f0c  beq     #0x45f86
00045f0e  ldr     r3, [pc, #0x88]
00045f10  str     r3, [r5, #0x20]
00045f12  mov.w   r3, #0x5800
00045f16  str     r3, [r5, #0x24]
00045f18  movs    r3, #5
00045f1a  str     r3, [r5, #0x28]
00045f1c  adds    r3, #0x19
00045f1e  str     r3, [r5, #0x40]
00045f20  ldr.w   r3, [r4, #0xa4]
00045f24  movw    r2, #0x786
00045f28  adds    r3, #1
00045f2a  str.w   r2, [r4, r3, lsl #3]
00045f2e  ldr.w   r3, [r4, #0xa4]
00045f32  adds    r2, r3, #1
00045f34  ldr     r3, [pc, #0x64]
00045f36  str.w   r2, [r4, #0xa4]
00045f3a  add     r3, pc ; -> 0x000f3720  t_flight
00045f3c  ldr     r1, [r3]
00045f3e  b       #0x45f54
00045f40  movw    r3, #0x786
00045f44  cmp     r6, r3
00045f46  it      ne
00045f48  mvnne   r0, #2
00045f4c  beq     #0x45f50
00045f4e  pop     {r4, r5, r6, r7, pc}
00045f50  ldr     r1, [pc, #0x4c]
00045f52  add     r1, pc ; -> 0x000425b9  t_reaction_land
00045f54  lsls    r3, r2, #3
00045f56  adds    r3, r3, r4
00045f58  movs    r0, #0
00045f5a  str     r1, [r3, #4]
00045f5c  ldr.w   r3, [r4, #0xa4]
00045f60  adds    r3, #1
00045f62  str.w   r0, [r4, r3, lsl #3]
00045f66  b       #0x45f4e
00045f68  ldr.w   r3, [r4, #0xa4]
00045f6c  ldr.w   r2, [pc, #0x34]
00045f70  mov     r0, r6
00045f72  lsls    r3, r3, #3
00045f74  adds    r3, r3, r4
00045f76  add     r2, pc ; -> 0x00047ced  t_blast_through_anything
00045f78  str     r2, [r3, #4]
00045f7a  ldr.w   r3, [r4, #0xa4]
00045f7e  adds    r3, #1
00045f80  str.w   r6, [r4, r3, lsl #3]
00045f84  b       #0x45f4e
00045f86  ldr     r3, [pc, #0x20]
00045f88  str     r3, [r5, #0x20]
00045f8a  add.w   r3, r3, #0xc6000
00045f8e  str     r3, [r5, #0x24]
00045f90  b       #0x45f18
00045f92  nop     
00045f94  bvs     #0x46000
00045f96  movs    r2, r1
00045f98  movs    r0, r0
