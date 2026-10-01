========================================================================
t_random_do  0x00072e4c  160 bytes   mkdrone.c
========================================================================

00072e4c  push    {r4, r5, r7, lr}
00072e4e  add     r7, sp, #8
00072e50  ldr.w   r2, [r0, #0xa4]
00072e54  mov     r4, r0
00072e56  ldr.w   r5, [r0, #0x108]
00072e5a  adds    r3, r2, #1
00072e5c  ldr.w   r3, [r0, r3, lsl #3]
00072e60  cbz     r3, #0x72e68
00072e62  mvn     r0, #2
00072e66  pop     {r4, r5, r7, pc}
00072e68  cmp     r2, #0
00072e6a  ble     #0x72ecc
00072e6c  subs    r3, r2, #1
00072e6e  str.w   r3, [r0, #0xa4]
00072e72  ldr.w   r1, [r4, #0xa4]
00072e76  adds    r3, r1, #1
00072e78  lsls    r2, r3, #3
00072e7a  adds    r2, r2, r4
00072e7c  ldr     r0, [r2, #4]
00072e7e  adds    r2, r3, #1
00072e80  ldr.w   r2, [r4, r2, lsl #3]
00072e84  str.w   r2, [r4, r3, lsl #3]
00072e88  lsls    r3, r1, #3
00072e8a  adds    r3, r3, r4
00072e8c  str     r0, [r3, #4]
00072e8e  ldr     r3, [r5, #0x64]
00072e90  mov     r0, r5
00072e92  str     r3, [r5, #0x1c]
00072e94  ldr     r3, [r5, #0x68]
00072e96  str     r3, [r5, #0x20]
00072e98  bl      #0x58714 ; -> randu
00072e9c  ldr     r3, [r5, #0x1c]
00072e9e  ldr     r1, [r5, #0x20]
00072ea0  movs    r0, #0
00072ea2  subs    r3, #1
00072ea4  str     r3, [r5, #0x1c]
00072ea6  lsls    r2, r3, #2
00072ea8  add.w   r3, r2, r1
00072eac  str     r3, [r5, #0x20]
00072eae  ldr     r3, [r2, r1]
00072eb0  ldr     r2, [pc, #0x30]
00072eb2  str     r3, [r5, #0x1c]
00072eb4  ldr.w   r3, [r4, #0xa4]
00072eb8  add     r2, pc ; -> 0x00067535  t_ochar_do
00072eba  lsls    r3, r3, #3
00072ebc  adds    r3, r3, r4
00072ebe  str     r2, [r3, #4]
00072ec0  ldr.w   r3, [r4, #0xa4]
00072ec4  adds    r3, #1
00072ec6  str.w   r0, [r4, r3, lsl #3]
00072eca  b       #0x72e66
00072ecc  ldr     r1, [pc, #0x18]
00072ece  lsls    r2, r2, #3
00072ed0  adds    r2, r2, r0
00072ed2  add     r1, pc ; -> 0x000f3708  t_local_reaction_exit
00072ed4  ldr     r1, [r1]
00072ed6  str     r1, [r2, #4]
00072ed8  ldr.w   r2, [r0, #0xa4]
00072edc  adds    r2, #1
00072ede  str.w   r3, [r0, r2, lsl #3]
00072ee2  b       #0x72e72
00072ee4  mov     r1, pc
00072ee6  vqshrun.s64 d16, q9, #1
00072eea  movs    r0, r1
