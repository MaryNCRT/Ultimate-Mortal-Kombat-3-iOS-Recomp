========================================================================
t_sk_block_zap  0x000a9ddc  196 bytes   mkboss.c
========================================================================

000a9ddc  push    {r4, r5, r6, r7, lr}
000a9dde  add     r7, sp, #0xc
000a9de0  mov     r4, r0
000a9de2  ldr.w   r2, [r4, #0xa4]
000a9de6  movw    r6, #0x5a7
000a9dea  ldr.w   r0, [r0, #0x108]
000a9dee  adds    r3, r2, #1
000a9df0  ldr.w   r5, [r4, r3, lsl #3]
000a9df4  cmp     r5, r6
000a9df6  beq     #0xa9e60
000a9df8  ble     #0xa9e0e
000a9dfa  cmp.w   r5, #0x5a8
000a9dfe  beq     #0xa9e78
000a9e00  movw    r3, #0x5a9
000a9e04  cmp     r5, r3
000a9e06  beq     #0xa9e44
000a9e08  mvn     r0, #2
000a9e0c  pop     {r4, r5, r6, r7, pc}
000a9e0e  cmp     r5, #0
000a9e10  bne     #0xa9e08
000a9e12  bl      #0x55388 ; -> face_opponent
000a9e16  ldr.w   r3, [r4, #0xa4]
000a9e1a  mov     r0, r5
000a9e1c  adds    r3, #1
000a9e1e  str.w   r6, [r4, r3, lsl #3]
000a9e22  ldr.w   r3, [r4, #0xa4]
000a9e26  adds    r2, r3, #1
000a9e28  ldr     r3, [pc, #0x64]
000a9e2a  str.w   r2, [r4, #0xa4]
000a9e2e  add     r3, pc ; -> 0x000f37d8  t_do_block_hi
000a9e30  ldr     r1, [r3]
000a9e32  lsls    r3, r2, #3
000a9e34  adds    r3, r3, r4
000a9e36  str     r1, [r3, #4]
000a9e38  ldr.w   r3, [r4, #0xa4]
000a9e3c  adds    r3, #1
000a9e3e  str.w   r5, [r4, r3, lsl #3]
000a9e42  b       #0xa9e0c
000a9e44  ldr.w   r3, [pc, #0x4c]
000a9e48  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a9e4a  ldr     r1, [r3]
000a9e4c  lsls    r3, r2, #3
000a9e4e  adds    r3, r3, r4
000a9e50  movs    r0, #0
000a9e52  str     r1, [r3, #4]
000a9e54  ldr.w   r3, [r4, #0xa4]
000a9e58  adds    r3, #1
000a9e5a  str.w   r0, [r4, r3, lsl #3]
000a9e5e  b       #0xa9e0c
000a9e60  mov.w   r2, #0x5a8
000a9e64  str.w   r2, [r4, r3, lsl #3]
000a9e68  ldr.w   r3, [r4, #0xa4]
000a9e6c  adds    r2, r3, #1
000a9e6e  ldr     r3, [pc, #0x28]
000a9e70  str.w   r2, [r4, #0xa4]
000a9e74  add     r3, pc ; -> 0x000f328c  t_wait_proj_spawn
000a9e76  b       #0xa9e4a
000a9e78  movw    r2, #0x5a9
000a9e7c  str.w   r2, [r4, r3, lsl #3]
000a9e80  ldr.w   r3, [r4, #0xa4]
000a9e84  adds    r2, r3, #1
000a9e86  ldr     r3, [pc, #0x14]
000a9e88  str.w   r2, [r4, #0xa4]
000a9e8c  add     r3, pc ; -> 0x000f3400  t_wait_proj_pass
000a9e8e  b       #0xa9e4a
000a9e90  ldr     r1, [sp, #0x298]
000a9e92  movs    r4, r0
000a9e94  ldr     r0, [sp, #0x2f0]
000a9e96  movs    r4, r0
000a9e98  str     r4, [sp, #0x50]
000a9e9a  movs    r4, r0
000a9e9c  str     r5, [sp, #0x1c0]
000a9e9e  movs    r4, r0
