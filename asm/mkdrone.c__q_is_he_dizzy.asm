========================================================================
q_is_he_dizzy  0x00068ea0  40 bytes   mkdrone.c
========================================================================

00068ea0  ldr     r3, [r0]
00068ea2  ldr     r3, [r3]
00068ea4  ldr     r2, [r3, #4]
00068ea6  ldr.w   r3, [r2, #0xa4]
00068eaa  lsls    r3, r3, #3
00068eac  adds    r3, r3, r2
00068eae  ldr     r2, [r3, #4]
00068eb0  ldr     r3, [pc, #0x10]
00068eb2  add     r3, pc ; -> 0x000f3868  t_dizzy_sleep
00068eb4  str     r2, [r0, #0x38]
00068eb6  ldr     r3, [r3]
00068eb8  cmp     r2, r3
00068eba  ite     ne
00068ebc  movne   r3, #0
00068ebe  moveq   r3, #1
00068ec0  str     r3, [r0, #0x5c]
00068ec2  bx      lr
00068ec4  add     r1, sp, #0x2c8
00068ec6  movs    r0, r1
