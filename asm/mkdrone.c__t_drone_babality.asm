========================================================================
t_drone_babality  0x00071e68  124 bytes   mkdrone.c
========================================================================

00071e68  push    {r4, r5, r7, lr}
00071e6a  add     r7, sp, #8
00071e6c  ldr.w   r3, [r0, #0xa4]
00071e70  mov     r4, r0
00071e72  ldr.w   r5, [r0, #0x108]
00071e76  adds    r3, #1
00071e78  ldr.w   r3, [r0, r3, lsl #3]
00071e7c  cbnz    r3, #0x71eaa
00071e7e  mov     r0, r5
00071e80  bl      #0x55388 ; -> face_opponent
00071e84  mov     r0, r5
00071e86  bl      #0x71e0c ; -> d_stance_setup
00071e8a  movs    r3, #0x40
00071e8c  str     r3, [r5, #0x44]
00071e8e  mov     r0, r5
00071e90  bl      #0x5a680 ; -> next_anirate
00071e94  ldr.w   r3, [r4, #0xa4]
00071e98  movw    r2, #0x999
00071e9c  movs    r0, #1
00071e9e  adds    r3, #1
00071ea0  str.w   r2, [r4, r3, lsl #3]
00071ea4  str.w   r0, [r4, #0xfc]
00071ea8  pop     {r4, r5, r7, pc}
00071eaa  movw    r2, #0x999
00071eae  cmp     r3, r2
00071eb0  it      ne
00071eb2  mvnne   r0, #2
00071eb6  bne     #0x71ea8
00071eb8  ldr     r3, [r5, #0x44]
00071eba  subs    r0, r3, #1
00071ebc  str     r0, [r5, #0x44]
00071ebe  cmp     r0, #0
00071ec0  bne     #0x71e8e
00071ec2  ldr     r3, [pc, #0x1c]
00071ec4  add     r3, pc ; -> 0x000f3034  tl_do_babality
00071ec6  ldr     r2, [r3]
00071ec8  ldr.w   r3, [r4, #0xa4]
00071ecc  lsls    r3, r3, #3
00071ece  adds    r3, r3, r4
00071ed0  str     r2, [r3, #4]
00071ed2  ldr.w   r3, [r4, #0xa4]
00071ed6  adds    r3, #1
00071ed8  str.w   r0, [r4, r3, lsl #3]
00071edc  b       #0x71ea8
00071ede  nop     
00071ee0  asrs    r4, r5, #5
00071ee2  movs    r0, r1
