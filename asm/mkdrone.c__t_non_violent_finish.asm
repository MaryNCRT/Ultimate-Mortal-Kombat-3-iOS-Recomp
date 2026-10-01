========================================================================
t_non_violent_finish  0x00068f54  148 bytes   mkdrone.c
========================================================================

00068f54  ldr.w   r3, [r0, #0xa4]
00068f58  ldr.w   r1, [r0, #0x108]
00068f5c  adds    r3, #1
00068f5e  ldr.w   r2, [r0, r3, lsl #3]
00068f62  cbnz    r2, #0x68f8e
00068f64  movw    r1, #0x96b
00068f68  str.w   r1, [r0, r3, lsl #3]
00068f6c  ldr.w   r3, [r0, #0xa4]
00068f70  ldr     r1, [pc, #0x68]
00068f72  adds    r3, #1
00068f74  str.w   r3, [r0, #0xa4]
00068f78  lsls    r3, r3, #3
00068f7a  adds    r3, r3, r0
00068f7c  add     r1, pc ; -> 0x0006e69d  t_d_get_close_2_u
00068f7e  str     r1, [r3, #4]
00068f80  ldr.w   r3, [r0, #0xa4]
00068f84  adds    r3, #1
00068f86  str.w   r2, [r0, r3, lsl #3]
00068f8a  mov     r0, r2
00068f8c  bx      lr
00068f8e  movw    r3, #0x96b
00068f92  cmp     r2, r3
00068f94  it      ne
00068f96  mvnne   r0, #2
00068f9a  bne     #0x68f8c
00068f9c  ldr.w   r3, [pc, #0x40]
00068fa0  movw    r2, #0x975
00068fa4  add     r3, pc ; -> 0x00172490  funcs.10049
00068fa6  str     r3, [r1, #0x68]
00068fa8  movs    r3, #3
00068faa  str     r3, [r1, #0x64]
00068fac  ldr.w   r3, [r0, #0xa4]
00068fb0  adds    r3, #1
00068fb2  str.w   r2, [r0, r3, lsl #3]
00068fb6  ldr.w   r3, [r0, #0xa4]
00068fba  ldr     r2, [pc, #0x28]
00068fbc  adds    r3, #1
00068fbe  str.w   r3, [r0, #0xa4]
00068fc2  lsls    r3, r3, #3
00068fc4  adds    r3, r3, r0
00068fc6  add     r2, pc ; -> 0x00072e4d  t_random_do
00068fc8  str     r2, [r3, #4]
00068fca  ldr.w   r3, [r0, #0xa4]
00068fce  movs    r2, #0
00068fd0  adds    r3, #1
00068fd2  str.w   r2, [r0, r3, lsl #3]
00068fd6  mov     r0, r2
00068fd8  b       #0x68f8c
00068fda  nop     
00068fdc  ldrsb   r5, [r3, r4]
00068fde  movs    r0, r0
00068fe0  str     r4, [sp, #0x3a0]
00068fe2  movs    r0, r2
00068fe4  ldr     r6, [sp, #0x20c]
00068fe6  movs    r0, r0
