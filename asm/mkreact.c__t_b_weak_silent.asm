========================================================================
t_b_weak_silent  0x00041d40  132 bytes   mkreact.c
========================================================================

00041d40  ldr.w   ip, [r0, #0xa4]
00041d44  ldr.w   r2, [r0, #0x108]
00041d48  add.w   r3, ip, #1
00041d4c  ldr.w   r1, [r0, r3, lsl #3]
00041d50  cbnz    r1, #0x41d8e
00041d52  ldr     r3, [pc, #0x64]
00041d54  str     r1, [r2, #0x30]
00041d56  str     r1, [r2, #0x34]
00041d58  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
00041d5a  str     r3, [r2, #0x38]
00041d5c  ldr.w   r3, [r0, #0xa4]
00041d60  movw    r2, #0x13bd
00041d64  adds    r3, #1
00041d66  str.w   r2, [r0, r3, lsl #3]
00041d6a  ldr.w   r3, [r0, #0xa4]
00041d6e  ldr.w   r2, [pc, #0x4c]
00041d72  adds    r3, #1
00041d74  str.w   r3, [r0, #0xa4]
00041d78  lsls    r3, r3, #3
00041d7a  adds    r3, r3, r0
00041d7c  add     r2, pc ; -> 0x000475a1  t_blocked_start
00041d7e  str     r2, [r3, #4]
00041d80  ldr.w   r3, [r0, #0xa4]
00041d84  adds    r3, #1
00041d86  str.w   r1, [r0, r3, lsl #3]
00041d8a  mov     r0, r1
00041d8c  bx      lr
00041d8e  movw    r3, #0x13bd
00041d92  cmp     r1, r3
00041d94  it      ne
00041d96  mvnne   r0, #2
00041d9a  bne     #0x41d8c
00041d9c  ldr     r2, [pc, #0x20]
00041d9e  lsl.w   r3, ip, #3
00041da2  adds    r3, r3, r0
00041da4  add     r2, pc ; -> 0x00041dc5  t_weak3
00041da6  str     r2, [r3, #4]
00041da8  ldr.w   r3, [r0, #0xa4]
00041dac  movs    r1, #0
00041dae  adds    r3, #1
00041db0  str.w   r1, [r0, r3, lsl #3]
00041db4  mov     r0, r1
00041db6  b       #0x41d8c
