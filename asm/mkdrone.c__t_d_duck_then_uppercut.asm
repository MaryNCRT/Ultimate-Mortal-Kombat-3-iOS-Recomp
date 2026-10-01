========================================================================
t_d_duck_then_uppercut  0x00068b5c  164 bytes   mkdrone.c
========================================================================

00068b5c  push    {lr}
00068b5e  ldr.w   ip, [r0, #0xa4]
00068b62  movw    lr, #0x7fd
00068b66  ldr.w   r3, [r0, #0x108]
00068b6a  add.w   r1, ip, #1
00068b6e  ldr.w   r2, [r0, r1, lsl #3]
00068b72  cmp     r2, lr
00068b74  beq     #0x68bce
00068b76  movw    r3, #0x7ff
00068b7a  cmp     r2, r3
00068b7c  beq     #0x68bb2
00068b7e  cbz     r2, #0x68b86
00068b80  mvn     r0, #2
00068b84  pop     {pc}
00068b86  str.w   lr, [r0, r1, lsl #3]
00068b8a  ldr.w   r3, [r0, #0xa4]
00068b8e  adds    r1, r3, #1
00068b90  ldr     r3, [pc, #0x60]
00068b92  str.w   r1, [r0, #0xa4]
00068b96  add     r3, pc ; -> 0x000f3884  t_do_duck
00068b98  ldr.w   ip, [r3]
00068b9c  lsls    r3, r1, #3
00068b9e  adds    r3, r3, r0
00068ba0  str.w   ip, [r3, #4]
00068ba4  ldr.w   r3, [r0, #0xa4]
00068ba8  adds    r3, #1
00068baa  str.w   r2, [r0, r3, lsl #3]
00068bae  mov     r0, r2
00068bb0  b       #0x68b84
00068bb2  ldr     r2, [pc, #0x44]
00068bb4  lsl.w   r3, ip, #3
00068bb8  add     r2, pc ; -> 0x000676a1  t_d_uppercut
00068bba  adds    r3, r3, r0
00068bbc  str     r2, [r3, #4]
00068bbe  ldr.w   r3, [r0, #0xa4]
00068bc2  movs    r2, #0
00068bc4  adds    r3, #1
00068bc6  str.w   r2, [r0, r3, lsl #3]
00068bca  mov     r0, r2
00068bcc  b       #0x68b84
00068bce  movs    r2, #0x80
00068bd0  str     r2, [r3, #0x1c]
00068bd2  ldr.w   r3, [r0, #0xa4]
00068bd6  movw    r2, #0x7ff
00068bda  adds    r3, #1
00068bdc  str.w   r2, [r0, r3, lsl #3]
00068be0  ldr.w   r3, [r0, #0xa4]
00068be4  ldr     r2, [pc, #0x14]
00068be6  adds    r3, #1
00068be8  add     r2, pc ; -> 0x0006c77d  t_d_wait_nonattack
00068bea  str.w   r3, [r0, #0xa4]
00068bee  lsls    r3, r3, #3
00068bf0  b       #0x68bba
00068bf2  nop     
00068bf4  add     r4, sp, #0x3a8
00068bf6  movs    r0, r1
