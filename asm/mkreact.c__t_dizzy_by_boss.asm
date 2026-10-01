========================================================================
t_dizzy_by_boss  0x00043f18  152 bytes   mkreact.c
========================================================================

00043f18  push    {r4, r5, r6, r7, lr}
00043f1a  add     r7, sp, #0xc
00043f1c  ldr.w   r2, [r0, #0xa4]
00043f20  mov     r4, r0
00043f22  ldr.w   r5, [r0, #0x108]
00043f26  adds    r3, r2, #1
00043f28  ldr.w   r6, [r0, r3, lsl #3]
00043f2c  cmp     r6, #0
00043f2e  bne     #0x43f7a
00043f30  ldr     r3, [r5]
00043f32  mov     r0, r5
00043f34  mov.w   r2, #0x620
00043f38  str     r2, [r5, #0x1c]
00043f3a  str     r2, [r3, #0x18]
00043f3c  movs    r3, #0x25
00043f3e  str     r3, [r5, #0x40]
00043f40  bl      #0x5520c ; -> get_char_ani
00043f44  ldr     r3, [pc, #0x5c]
00043f46  movw    r2, #0xd8d
00043f4a  mov     r0, r6
00043f4c  str     r3, [r5, #0x1c]
00043f4e  ldr.w   r3, [r4, #0xa4]
00043f52  adds    r3, #1
00043f54  str.w   r2, [r4, r3, lsl #3]
00043f58  ldr.w   r3, [r4, #0xa4]
00043f5c  adds    r2, r3, #1
00043f5e  ldr     r3, [pc, #0x48]
00043f60  str.w   r2, [r4, #0xa4]
00043f64  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
00043f66  ldr     r1, [r3]
00043f68  lsls    r3, r2, #3
00043f6a  adds    r3, r3, r4
00043f6c  str     r1, [r3, #4]
00043f6e  ldr.w   r3, [r4, #0xa4]
00043f72  adds    r3, #1
00043f74  str.w   r6, [r4, r3, lsl #3]
00043f78  pop     {r4, r5, r6, r7, pc}
00043f7a  movw    r3, #0xd8d
00043f7e  cmp     r6, r3
00043f80  it      ne
00043f82  mvnne   r0, #2
00043f86  bne     #0x43f78
00043f88  ldr     r3, [pc, #0x20]
00043f8a  movs    r0, #0
00043f8c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00043f8e  ldr     r1, [r3]
00043f90  lsls    r3, r2, #3
00043f92  adds    r3, r3, r4
00043f94  str     r1, [r3, #4]
00043f96  ldr.w   r3, [r4, #0xa4]
00043f9a  adds    r3, #1
00043f9c  str.w   r0, [r4, r3, lsl #3]
00043fa0  b       #0x43f78
00043fa2  nop     
00043fa4  movs    r0, r2
00043fa6  movs    r5, r0
