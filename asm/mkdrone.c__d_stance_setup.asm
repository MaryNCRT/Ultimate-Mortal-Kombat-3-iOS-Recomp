========================================================================
d_stance_setup  0x00071e0c  92 bytes   mkdrone.c
========================================================================

00071e0c  push    {r4, r7, lr}
00071e0e  add     r7, sp, #4
00071e10  mov     r4, r0
00071e12  bl      #0x55c04 ; -> stop_me_player
00071e16  ldr     r3, [r4, #0x40]
00071e18  mov     r0, r4
00071e1a  str     r3, [r4, #0x30]
00071e1c  bl      #0x553c4 ; -> stance_setup
00071e20  mov     r0, r4
00071e22  bl      #0x59e24 ; -> do_next_a9_frame
00071e26  ldr     r1, [r4, #0x40]
00071e28  mov     r3, r1
00071e2a  subs    r1, #4
00071e2c  str     r1, [r4, #0x40]
00071e2e  ldr     r3, [r3, #-0x4]
00071e32  cmp     r3, #8
00071e34  str     r3, [r4, #0x2c]
00071e36  bne     #0x71e46
00071e38  mov     r3, r1
00071e3a  adds    r1, #0x14
00071e3c  str     r1, [r4, #0x40]
00071e3e  ldr     r3, [r3, #0x14]
00071e40  cmp     r3, #8
00071e42  str     r3, [r4, #0x2c]
00071e44  beq     #0x71e38
00071e46  mov     r3, r1
00071e48  str     r1, [r4, #0x2c]
00071e4a  mov     r0, r3
00071e4c  ldr     r2, [r3], #4
00071e50  cmp     r2, #1
00071e52  str     r2, [r4, #0x20]
00071e54  str     r3, [r4, #0x2c]
00071e56  bne     #0x71e4a
00071e58  ldr     r3, [r4, #0x30]
00071e5a  subs    r2, r0, #4
00071e5c  str     r2, [r4, #0x2c]
00071e5e  cmp     r3, r1
00071e60  itt     ge
00071e62  cmpge   r2, r3
00071e64  strge   r3, [r4, #0x40]
00071e66  pop     {r4, r7, pc}
