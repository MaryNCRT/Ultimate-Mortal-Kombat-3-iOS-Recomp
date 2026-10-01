========================================================================
t_f_liu  0x000a59dc  296 bytes   mkfriend.c
========================================================================

000a59dc  push    {r4, r5, r6, r7, lr}
000a59de  add     r7, sp, #0xc
000a59e0  str     r8, [sp, #-0x4]!
000a59e4  ldr.w   r2, [r0, #0xa4]
000a59e8  movw    r1, #0x5a6
000a59ec  mov     r4, r0
000a59ee  adds    r3, r2, #1
000a59f0  ldr.w   r6, [r0, #0x108]
000a59f4  ldr.w   r5, [r0, r3, lsl #3]
000a59f8  cmp     r5, r1
000a59fa  beq     #0xa5adc
000a59fc  ble     #0xa5a18
000a59fe  cmp.w   r5, #0x5a8
000a5a02  beq     #0xa5aa2
000a5a04  blt     #0xa5a64
000a5a06  movw    r3, #0x5a9
000a5a0a  cmp     r5, r3
000a5a0c  beq     #0xa5ab2
000a5a0e  mvn     r0, #2
000a5a12  ldr     r8, [sp], #4
000a5a16  pop     {r4, r5, r6, r7, pc}
000a5a18  movw    r8, #0x5a4
000a5a1c  cmp     r5, r8
000a5a1e  beq     #0xa5acc
000a5a20  bgt     #0xa5a8e
000a5a22  cmp     r5, #0
000a5a24  bne     #0xa5a0e
000a5a26  ldr     r1, [pc, #0xc4]
000a5a28  mov     r0, r6
000a5a2a  add     r1, pc ; -> 0x000a614d  t_wall_dragon_proc
000a5a2c  bl      #0x58a10 ; -> NewThread
000a5a30  ldr.w   r3, [pc, #0xbc]
000a5a34  ldr     r2, [pc, #0xbc]
000a5a36  mov     r0, r5
000a5a38  add     r3, pc ; -> 0x00177e2c  a_kang_friend
000a5a3a  str     r3, [r6, #0x40]
000a5a3c  ldr.w   r3, [r4, #0xa4]
000a5a40  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5a42  adds    r3, #1
000a5a44  str.w   r8, [r4, r3, lsl #3]
000a5a48  ldr.w   r3, [r4, #0xa4]
000a5a4c  adds    r3, #1
000a5a4e  str.w   r3, [r4, #0xa4]
000a5a52  lsls    r3, r3, #3
000a5a54  adds    r3, r3, r4
000a5a56  str     r2, [r3, #4]
000a5a58  ldr.w   r3, [r4, #0xa4]
000a5a5c  adds    r3, #1
000a5a5e  str.w   r5, [r4, r3, lsl #3]
000a5a62  b       #0xa5a12
000a5a64  mov.w   r2, #0x5a8
000a5a68  str.w   r2, [r0, r3, lsl #3]
000a5a6c  ldr     r2, [pc, #0x88]
000a5a6e  ldr.w   r3, [r0, #0xa4]
000a5a72  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5a74  adds    r3, #1
000a5a76  str.w   r3, [r0, #0xa4]
000a5a7a  lsls    r3, r3, #3
000a5a7c  adds    r3, r3, r4
000a5a7e  movs    r0, #0
000a5a80  str     r2, [r3, #4]
000a5a82  ldr.w   r3, [r4, #0xa4]
000a5a86  adds    r3, #1
000a5a88  str.w   r0, [r4, r3, lsl #3]
000a5a8c  b       #0xa5a12
000a5a8e  str.w   r1, [r0, r3, lsl #3]
000a5a92  ldr     r2, [pc, #0x68]
000a5a94  ldr.w   r3, [r0, #0xa4]
000a5a98  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5a9a  adds    r3, #1
000a5a9c  str.w   r3, [r0, #0xa4]
000a5aa0  b       #0xa5a7a
000a5aa2  movw    r2, #0x5a9
000a5aa6  str.w   r2, [r0, r3, lsl #3]
000a5aaa  movs    r0, #0x30
000a5aac  str.w   r0, [r4, #0xfc]
000a5ab0  b       #0xa5a12
000a5ab2  ldr.w   r1, [pc, #0x4c]
000a5ab6  lsls    r3, r2, #3
000a5ab8  adds    r3, r3, r0
000a5aba  add     r1, pc ; -> 0x000a5991  t_friendship_complete
000a5abc  str     r1, [r3, #4]
000a5abe  ldr.w   r3, [r0, #0xa4]
000a5ac2  movs    r0, #0
000a5ac4  adds    r3, #1
000a5ac6  str.w   r0, [r4, r3, lsl #3]
000a5aca  b       #0xa5a12
000a5acc  movw    r2, #0x5a5
000a5ad0  str.w   r2, [r0, r3, lsl #3]
000a5ad4  movs    r0, #0x20
000a5ad6  str.w   r0, [r4, #0xfc]
000a5ada  b       #0xa5a12
000a5adc  movw    r2, #0x5a7
000a5ae0  str.w   r2, [r0, r3, lsl #3]
000a5ae4  movs    r0, #0xa
000a5ae6  str.w   r0, [r4, #0xfc]
000a5aea  b       #0xa5a12
000a5aec  lsls    r7, r3, #0x1c
000a5aee  movs    r0, r0
000a5af0  movs    r3, #0xf0
000a5af2  movs    r5, r1
000a5af4  mrrc2   p15, #0xf, pc, sp, c15
000a5af8  stc2    p15, c15, [fp], #-0x3fc
