========================================================================
t_sonya_delayed_bike  0x00069ef8  192 bytes   mkdrone.c
========================================================================

00069ef8  push    {lr}
00069efa  ldr.w   ip, [r0, #0xa4]
00069efe  movw    lr, #0xd5c
00069f02  ldr.w   r1, [r0, #0x108]
00069f06  add.w   r3, ip, #1
00069f0a  ldr.w   r2, [r0, r3, lsl #3]
00069f0e  cmp     r2, lr
00069f10  beq     #0x69f7a
00069f12  movw    r3, #0xd5e
00069f16  cmp     r2, r3
00069f18  beq     #0x69f5a
00069f1a  cbz     r2, #0x69f22
00069f1c  mvn     r0, #2
00069f20  pop     {pc}
00069f22  movs    r3, #0x40
00069f24  str     r3, [r1, #0x44]
00069f26  ldr     r3, [pc, #0x80]
00069f28  add     r3, pc ; -> 0x0006e365  q_is_he_bike_close
00069f2a  str     r3, [r1, #0x48]
00069f2c  ldr.w   r3, [r0, #0xa4]
00069f30  ldr.w   r1, [pc, #0x78]
00069f34  adds    r3, #1
00069f36  add     r1, pc ; -> 0x00072a2d  t_stalk_wait_yes
00069f38  str.w   lr, [r0, r3, lsl #3]
00069f3c  ldr.w   r3, [r0, #0xa4]
00069f40  adds    r3, #1
00069f42  str.w   r3, [r0, #0xa4]
00069f46  lsls    r3, r3, #3
00069f48  adds    r3, r3, r0
00069f4a  str     r1, [r3, #4]
00069f4c  ldr.w   r3, [r0, #0xa4]
00069f50  adds    r3, #1
00069f52  str.w   r2, [r0, r3, lsl #3]
00069f56  mov     r0, r2
00069f58  b       #0x69f20
00069f5a  ldr.w   r3, [pc, #0x54]
00069f5e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00069f60  ldr     r2, [r3]
00069f62  lsl.w   r3, ip, #3
00069f66  adds    r3, r3, r0
00069f68  str     r2, [r3, #4]
00069f6a  ldr.w   r3, [r0, #0xa4]
00069f6e  movs    r2, #0
00069f70  adds    r3, #1
00069f72  str.w   r2, [r0, r3, lsl #3]
00069f76  mov     r0, r2
00069f78  b       #0x69f20
00069f7a  movs    r3, #1
00069f7c  str     r3, [r1, #0x1c]
00069f7e  ldr.w   r3, [r0, #0xa4]
00069f82  movw    r2, #0xd5e
00069f86  adds    r3, #1
00069f88  str.w   r2, [r0, r3, lsl #3]
00069f8c  ldr.w   r3, [r0, #0xa4]
00069f90  adds    r2, r3, #1
00069f92  ldr.w   r3, [pc, #0x20]
00069f96  str.w   r2, [r0, #0xa4]
00069f9a  add     r3, pc ; -> 0x000f31a0  t_do_body_propell
00069f9c  ldr     r1, [r3]
00069f9e  lsls    r3, r2, #3
00069fa0  adds    r3, r3, r0
00069fa2  str     r1, [r3, #4]
00069fa4  b       #0x69f6a
00069fa6  nop     
00069fa8  add     r1, r7
00069faa  movs    r0, r0
00069fac  ldrh    r3, [r6, #0x16]
00069fae  movs    r0, r0
00069fb0  str     r7, [sp, #0x298]
00069fb2  movs    r0, r1
00069fb4  str     r2, [sp, #8]
00069fb6  movs    r0, r1
