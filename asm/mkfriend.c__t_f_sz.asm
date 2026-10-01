========================================================================
t_f_sz  0x000a5e78  132 bytes   mkfriend.c
========================================================================

000a5e78  push    {r4, r5, r7, lr}
000a5e7a  add     r7, sp, #8
000a5e7c  mov     r4, r0
000a5e7e  ldr.w   r2, [r4, #0xa4]
000a5e82  ldr.w   r0, [r0, #0x108]
000a5e86  adds    r3, r2, #1
000a5e88  ldr.w   r5, [r4, r3, lsl #3]
000a5e8c  cbnz    r5, #0xa5eca
000a5e8e  ldr     r3, [pc, #0x60]
000a5e90  str     r5, [r0, #0x1c]
000a5e92  add     r3, pc ; -> 0x00177a7c  a_sz_friend
000a5e94  str     r3, [r0, #0x40]
000a5e96  bl      #0x57be4 ; -> ochar_sound
000a5e9a  ldr.w   r3, [r4, #0xa4]
000a5e9e  movw    r2, #0x2d3
000a5ea2  mov     r0, r5
000a5ea4  adds    r3, #1
000a5ea6  str.w   r2, [r4, r3, lsl #3]
000a5eaa  ldr.w   r3, [r4, #0xa4]
000a5eae  ldr     r2, [pc, #0x44]
000a5eb0  adds    r3, #1
000a5eb2  str.w   r3, [r4, #0xa4]
000a5eb6  lsls    r3, r3, #3
000a5eb8  adds    r3, r3, r4
000a5eba  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5ebc  str     r2, [r3, #4]
000a5ebe  ldr.w   r3, [r4, #0xa4]
000a5ec2  adds    r3, #1
000a5ec4  str.w   r5, [r4, r3, lsl #3]
000a5ec8  pop     {r4, r5, r7, pc}
000a5eca  movw    r3, #0x2d3
000a5ece  cmp     r5, r3
000a5ed0  it      ne
000a5ed2  mvnne   r0, #2
000a5ed6  bne     #0xa5ec8
000a5ed8  ldr     r1, [pc, #0x1c]
000a5eda  lsls    r3, r2, #3
000a5edc  adds    r3, r3, r4
000a5ede  add     r1, pc ; -> 0x000a5991  t_friendship_complete
000a5ee0  str     r1, [r3, #4]
000a5ee2  ldr.w   r3, [r4, #0xa4]
000a5ee6  movs    r0, #0
000a5ee8  adds    r3, #1
000a5eea  str.w   r0, [r4, r3, lsl #3]
000a5eee  b       #0xa5ec8
000a5ef0  subs    r6, r4, r7
000a5ef2  movs    r5, r1
000a5ef4  bl      #0x89ef6
