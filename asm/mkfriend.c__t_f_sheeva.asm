========================================================================
t_f_sheeva  0x000a5cb4  216 bytes   mkfriend.c
========================================================================

000a5cb4  push    {r4, r5, r6, r7, lr}
000a5cb6  add     r7, sp, #0xc
000a5cb8  str     r8, [sp, #-0x4]!
000a5cbc  ldr.w   r2, [r0, #0xa4]
000a5cc0  movw    r8, #0x515
000a5cc4  mov     r4, r0
000a5cc6  adds    r3, r2, #1
000a5cc8  ldr.w   r6, [r0, #0x108]
000a5ccc  ldr.w   r5, [r0, r3, lsl #3]
000a5cd0  cmp     r5, r8
000a5cd2  beq     #0xa5d3c
000a5cd4  cmp.w   r5, #0x518
000a5cd8  beq     #0xa5d24
000a5cda  cbz     r5, #0xa5ce6
000a5cdc  mvn     r0, #2
000a5ce0  ldr     r8, [sp], #4
000a5ce4  pop     {r4, r5, r6, r7, pc}
000a5ce6  ldr     r1, [pc, #0x90]
000a5ce8  mov     r0, r6
000a5cea  add     r1, pc ; -> 0x000a5809  t_end_friend_proc
000a5cec  bl      #0x58a10 ; -> NewThread
000a5cf0  ldr.w   r3, [pc, #0x88]
000a5cf4  ldr     r2, [pc, #0x88]
000a5cf6  mov     r0, r5
000a5cf8  add     r3, pc ; -> 0x00177dd8  a_sg_friend
000a5cfa  str     r3, [r6, #0x40]
000a5cfc  ldr.w   r3, [r4, #0xa4]
000a5d00  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5d02  adds    r3, #1
000a5d04  str.w   r8, [r4, r3, lsl #3]
000a5d08  ldr.w   r3, [r4, #0xa4]
000a5d0c  adds    r3, #1
000a5d0e  str.w   r3, [r4, #0xa4]
000a5d12  lsls    r3, r3, #3
000a5d14  adds    r3, r3, r4
000a5d16  str     r2, [r3, #4]
000a5d18  ldr.w   r3, [r4, #0xa4]
000a5d1c  adds    r3, #1
000a5d1e  str.w   r5, [r4, r3, lsl #3]
000a5d22  b       #0xa5ce0
000a5d24  ldr     r1, [pc, #0x5c]
000a5d26  lsls    r3, r2, #3
000a5d28  adds    r3, r3, r0
000a5d2a  add     r1, pc ; -> 0x000a5991  t_friendship_complete
000a5d2c  str     r1, [r3, #4]
000a5d2e  ldr.w   r3, [r0, #0xa4]
000a5d32  movs    r0, #0
000a5d34  adds    r3, #1
000a5d36  str.w   r0, [r4, r3, lsl #3]
000a5d3a  b       #0xa5ce0
000a5d3c  mov     r0, r6
000a5d3e  movs    r3, #6
000a5d40  str     r3, [r6, #0x1c]
000a5d42  bl      #0x57be4 ; -> ochar_sound
000a5d46  ldr.w   r3, [r4, #0xa4]
000a5d4a  mov.w   r2, #0x518
000a5d4e  movs    r0, #0
000a5d50  adds    r3, #1
000a5d52  str.w   r2, [r4, r3, lsl #3]
000a5d56  ldr.w   r3, [r4, #0xa4]
000a5d5a  ldr     r2, [pc, #0x2c]
000a5d5c  adds    r3, #1
000a5d5e  str.w   r3, [r4, #0xa4]
000a5d62  lsls    r3, r3, #3
000a5d64  adds    r3, r3, r4
000a5d66  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5d68  str     r2, [r3, #4]
000a5d6a  ldr.w   r3, [r4, #0xa4]
000a5d6e  adds    r3, #1
000a5d70  str.w   r0, [r4, r3, lsl #3]
000a5d74  b       #0xa5ce0
000a5d76  nop     
