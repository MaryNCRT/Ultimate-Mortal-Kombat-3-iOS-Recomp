========================================================================
t_f_kitana  0x000a6ddc  236 bytes   mkfriend.c
========================================================================

000a6ddc  push    {r4, r5, r6, r7, lr}
000a6dde  add     r7, sp, #0xc
000a6de0  ldr.w   r2, [r0, #0xa4]
000a6de4  mov     r4, r0
000a6de6  ldr.w   r5, [r0, #0x108]
000a6dea  adds    r3, r2, #1
000a6dec  ldr.w   r6, [r0, r3, lsl #3]
000a6df0  cmp.w   r6, #0x19c
000a6df4  beq     #0xa6e6e
000a6df6  ble     #0xa6e0c
000a6df8  movw    r3, #0x19d
000a6dfc  cmp     r6, r3
000a6dfe  beq     #0xa6e7e
000a6e00  adds    r3, #6
000a6e02  cmp     r6, r3
000a6e04  beq     #0xa6e56
000a6e06  mvn     r0, #2
000a6e0a  pop     {r4, r5, r6, r7, pc}
000a6e0c  cmp     r6, #0
000a6e0e  bne     #0xa6e06
000a6e10  ldr     r3, [pc, #0xa0]
000a6e12  mov     r0, r5
000a6e14  add     r3, pc ; -> 0x000f370c  center_around_me
000a6e16  ldr     r3, [r3]
000a6e18  str     r3, [r5, #0x1c]
000a6e1a  bl      #0x5710c ; -> call_a0_for_him
000a6e1e  ldr.w   r3, [pc, #0x98]
000a6e22  mov.w   r2, #0x19c
000a6e26  mov     r0, r6
000a6e28  str     r3, [r5, #0x40]
000a6e2a  ldr.w   r3, [r4, #0xa4]
000a6e2e  adds    r3, #1
000a6e30  str.w   r2, [r4, r3, lsl #3]
000a6e34  ldr.w   r3, [r4, #0xa4]
000a6e38  adds    r2, r3, #1
000a6e3a  ldr     r3, [pc, #0x80]
000a6e3c  str.w   r2, [r4, #0xa4]
000a6e40  add     r3, pc ; -> 0x000f36c0  t_animate2_a9
000a6e42  ldr     r1, [r3]
000a6e44  lsls    r3, r2, #3
000a6e46  adds    r3, r3, r4
000a6e48  str     r1, [r3, #4]
000a6e4a  ldr.w   r3, [r4, #0xa4]
000a6e4e  adds    r3, #1
000a6e50  str.w   r6, [r4, r3, lsl #3]
000a6e54  b       #0xa6e0a
000a6e56  ldr     r1, [pc, #0x68]
000a6e58  add     r1, pc ; -> 0x000a5991  t_friendship_complete
000a6e5a  lsls    r3, r2, #3
000a6e5c  adds    r3, r3, r4
000a6e5e  movs    r0, #0
000a6e60  str     r1, [r3, #4]
000a6e62  ldr.w   r3, [r4, #0xa4]
000a6e66  adds    r3, #1
000a6e68  str.w   r0, [r4, r3, lsl #3]
000a6e6c  b       #0xa6e0a
000a6e6e  movw    r2, #0x19d
000a6e72  str.w   r2, [r0, r3, lsl #3]
000a6e76  movs    r0, #0x70
000a6e78  str.w   r0, [r4, #0xfc]
000a6e7c  b       #0xa6e0a
000a6e7e  mov     r0, r5
000a6e80  bl      #0x56d20 ; -> delete_slave
000a6e84  mov     r0, r5
000a6e86  movs    r3, #6
000a6e88  str     r3, [r5, #0x40]
000a6e8a  bl      #0x55460 ; -> find_ani2_part2
000a6e8e  movs    r3, #4
000a6e90  str     r3, [r5, #0x1c]
000a6e92  ldr.w   r3, [r4, #0xa4]
000a6e96  movw    r2, #0x1a3
000a6e9a  adds    r3, #1
000a6e9c  str.w   r2, [r4, r3, lsl #3]
000a6ea0  ldr.w   r3, [r4, #0xa4]
000a6ea4  adds    r2, r3, #1
000a6ea6  ldr     r3, [pc, #0x1c]
000a6ea8  str.w   r2, [r4, #0xa4]
000a6eac  add     r3, pc ; -> 0x000f37cc  t_mframew
000a6eae  ldr     r1, [r3]
000a6eb0  b       #0xa6e5a
000a6eb2  nop     
000a6eb4  ldm     r0!, {r2, r4, r5, r6, r7}
000a6eb6  movs    r4, r0
000a6eb8  movs    r0, r1
000a6eba  movs    r5, r0
000a6ebc  ldm     r0!, {r2, r3, r4, r5, r6}
000a6ebe  movs    r4, r0
