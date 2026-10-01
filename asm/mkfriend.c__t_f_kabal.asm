========================================================================
t_f_kabal  0x000a5b04  140 bytes   mkfriend.c
========================================================================

000a5b04  push    {r4, r5, r6, r7, lr}
000a5b06  add     r7, sp, #0xc
000a5b08  ldr.w   r2, [r0, #0xa4]
000a5b0c  mov     r4, r0
000a5b0e  ldr.w   r6, [r0, #0x108]
000a5b12  adds    r3, r2, #1
000a5b14  ldr.w   r5, [r0, r3, lsl #3]
000a5b18  cbnz    r5, #0xa5b5a
000a5b1a  ldr     r1, [pc, #0x64]
000a5b1c  mov     r0, r6
000a5b1e  add     r1, pc ; -> 0x000a5809  t_end_friend_proc
000a5b20  bl      #0x58a10 ; -> NewThread
000a5b24  ldr     r3, [pc, #0x5c]
000a5b26  movw    r2, #0x4f2
000a5b2a  mov     r0, r5
000a5b2c  add     r3, pc ; -> 0x00177d2c  a_tusk_friend
000a5b2e  str     r3, [r6, #0x40]
000a5b30  ldr.w   r3, [r4, #0xa4]
000a5b34  adds    r3, #1
000a5b36  str.w   r2, [r4, r3, lsl #3]
000a5b3a  ldr.w   r3, [r4, #0xa4]
000a5b3e  ldr     r2, [pc, #0x48]
000a5b40  adds    r3, #1
000a5b42  str.w   r3, [r4, #0xa4]
000a5b46  lsls    r3, r3, #3
000a5b48  adds    r3, r3, r4
000a5b4a  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5b4c  str     r2, [r3, #4]
000a5b4e  ldr.w   r3, [r4, #0xa4]
000a5b52  adds    r3, #1
000a5b54  str.w   r5, [r4, r3, lsl #3]
000a5b58  pop     {r4, r5, r6, r7, pc}
000a5b5a  movw    r3, #0x4f2
000a5b5e  cmp     r5, r3
000a5b60  it      ne
000a5b62  mvnne   r0, #2
000a5b66  bne     #0xa5b58
000a5b68  ldr     r1, [pc, #0x20]
000a5b6a  lsls    r3, r2, #3
000a5b6c  adds    r3, r3, r4
000a5b6e  add     r1, pc ; -> 0x000a5991  t_friendship_complete
000a5b70  str     r1, [r3, #4]
000a5b72  ldr.w   r3, [r4, #0xa4]
000a5b76  movs    r0, #0
000a5b78  adds    r3, #1
000a5b7a  str.w   r0, [r4, r3, lsl #3]
000a5b7e  b       #0xa5b58
000a5b80  stc2l   p15, c15, [r7], #0x3fc
000a5b84  movs    r1, #0xfc
000a5b86  movs    r5, r1
