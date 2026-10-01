========================================================================
t_f_cyrax  0x000a5b90  140 bytes   mkfriend.c
========================================================================

000a5b90  push    {r4, r5, r6, r7, lr}
000a5b92  add     r7, sp, #0xc
000a5b94  ldr.w   r2, [r0, #0xa4]
000a5b98  mov     r4, r0
000a5b9a  ldr.w   r6, [r0, #0x108]
000a5b9e  adds    r3, r2, #1
000a5ba0  ldr.w   r5, [r0, r3, lsl #3]
000a5ba4  cbnz    r5, #0xa5be6
000a5ba6  ldr     r1, [pc, #0x64]
000a5ba8  mov     r0, r6
000a5baa  add     r1, pc ; -> 0x000a5809  t_end_friend_proc
000a5bac  bl      #0x58a10 ; -> NewThread
000a5bb0  ldr     r3, [pc, #0x5c]
000a5bb2  movw    r2, #0x427
000a5bb6  mov     r0, r5
000a5bb8  add     r3, pc ; -> 0x00177ca0  a_robo2_friend
000a5bba  str     r3, [r6, #0x40]
000a5bbc  ldr.w   r3, [r4, #0xa4]
000a5bc0  adds    r3, #1
000a5bc2  str.w   r2, [r4, r3, lsl #3]
000a5bc6  ldr.w   r3, [r4, #0xa4]
000a5bca  ldr     r2, [pc, #0x48]
000a5bcc  adds    r3, #1
000a5bce  str.w   r3, [r4, #0xa4]
000a5bd2  lsls    r3, r3, #3
000a5bd4  adds    r3, r3, r4
000a5bd6  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5bd8  str     r2, [r3, #4]
000a5bda  ldr.w   r3, [r4, #0xa4]
000a5bde  adds    r3, #1
000a5be0  str.w   r5, [r4, r3, lsl #3]
000a5be4  pop     {r4, r5, r6, r7, pc}
000a5be6  movw    r3, #0x427
000a5bea  cmp     r5, r3
000a5bec  it      ne
000a5bee  mvnne   r0, #2
000a5bf2  bne     #0xa5be4
000a5bf4  ldr     r1, [pc, #0x20]
000a5bf6  lsls    r3, r2, #3
000a5bf8  adds    r3, r3, r4
000a5bfa  add     r1, pc ; -> 0x000a5991  t_friendship_complete
000a5bfc  str     r1, [r3, #4]
000a5bfe  ldr.w   r3, [r4, #0xa4]
000a5c02  movs    r0, #0
000a5c04  adds    r3, #1
000a5c06  str.w   r0, [r4, r3, lsl #3]
000a5c0a  b       #0xa5be4
000a5c0c  mrrc2   p15, #0xf, pc, fp, c15
000a5c10  movs    r0, #0xe4
000a5c12  movs    r5, r1
