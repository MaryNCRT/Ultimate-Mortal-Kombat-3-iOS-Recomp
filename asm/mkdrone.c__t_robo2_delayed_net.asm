========================================================================
t_robo2_delayed_net  0x00069a60  132 bytes   mkdrone.c
========================================================================

00069a60  ldr.w   r1, [r0, #0xa4]
00069a64  ldr.w   ip, [r0, #0x108]
00069a68  adds    r3, r1, #1
00069a6a  ldr.w   r2, [r0, r3, lsl #3]
00069a6e  cbnz    r2, #0x69ab0
00069a70  movs    r3, #0x40
00069a72  str.w   r3, [ip, #0x44]
00069a76  ldr     r3, [pc, #0x60]
00069a78  movw    r1, #0xce7
00069a7c  add     r3, pc ; -> 0x00069a35  q_is_he_net_close
00069a7e  str.w   r3, [ip, #0x48]
00069a82  ldr.w   r3, [r0, #0xa4]
00069a86  adds    r3, #1
00069a88  str.w   r1, [r0, r3, lsl #3]
00069a8c  ldr.w   r3, [r0, #0xa4]
00069a90  ldr.w   r1, [pc, #0x48]
00069a94  adds    r3, #1
00069a96  str.w   r3, [r0, #0xa4]
00069a9a  lsls    r3, r3, #3
00069a9c  adds    r3, r3, r0
00069a9e  add     r1, pc ; -> 0x000726e9  t_retreat_wait_yes
00069aa0  str     r1, [r3, #4]
00069aa2  ldr.w   r3, [r0, #0xa4]
00069aa6  adds    r3, #1
00069aa8  str.w   r2, [r0, r3, lsl #3]
00069aac  mov     r0, r2
00069aae  bx      lr
00069ab0  movw    r3, #0xce7
00069ab4  cmp     r2, r3
00069ab6  it      ne
00069ab8  mvnne   r0, #2
00069abc  bne     #0x69aae
00069abe  ldr     r2, [pc, #0x20]
00069ac0  lsls    r3, r1, #3
00069ac2  adds    r3, r3, r0
00069ac4  add     r2, pc ; -> 0x00067f91  t_d_zap
00069ac6  str     r2, [r3, #4]
00069ac8  ldr.w   r3, [r0, #0xa4]
00069acc  movs    r2, #0
00069ace  adds    r3, #1
00069ad0  str.w   r2, [r0, r3, lsl #3]
00069ad4  mov     r0, r2
00069ad6  b       #0x69aae
