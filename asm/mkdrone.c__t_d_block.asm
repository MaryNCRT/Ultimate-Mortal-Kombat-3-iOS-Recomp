========================================================================
t_d_block  0x0006fa20  184 bytes   mkdrone.c
========================================================================

0006fa20  push    {r4, r5, r6, r7, lr}
0006fa22  add     r7, sp, #0xc
0006fa24  mov     r4, r0
0006fa26  ldr.w   r2, [r4, #0xa4]
0006fa2a  movw    r6, #0x839
0006fa2e  ldr.w   r0, [r0, #0x108]
0006fa32  adds    r3, r2, #1
0006fa34  ldr.w   r5, [r4, r3, lsl #3]
0006fa38  cmp     r5, r6
0006fa3a  beq     #0x6fa98
0006fa3c  movw    r3, #0x83b
0006fa40  cmp     r5, r3
0006fa42  beq     #0x6fa7e
0006fa44  cbz     r5, #0x6fa4c
0006fa46  mvn     r0, #2
0006fa4a  pop     {r4, r5, r6, r7, pc}
0006fa4c  bl      #0x55388 ; -> face_opponent
0006fa50  ldr.w   r3, [r4, #0xa4]
0006fa54  mov     r0, r5
0006fa56  adds    r3, #1
0006fa58  str.w   r6, [r4, r3, lsl #3]
0006fa5c  ldr.w   r3, [r4, #0xa4]
0006fa60  adds    r2, r3, #1
0006fa62  ldr     r3, [pc, #0x68]
0006fa64  str.w   r2, [r4, #0xa4]
0006fa68  add     r3, pc ; -> 0x000f37d8  t_do_block_hi
0006fa6a  ldr     r1, [r3]
0006fa6c  lsls    r3, r2, #3
0006fa6e  adds    r3, r3, r4
0006fa70  str     r1, [r3, #4]
0006fa72  ldr.w   r3, [r4, #0xa4]
0006fa76  adds    r3, #1
0006fa78  str.w   r5, [r4, r3, lsl #3]
0006fa7c  b       #0x6fa4a
0006fa7e  ldr     r3, [pc, #0x50]
0006fa80  movs    r0, #0
0006fa82  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006fa84  ldr     r1, [r3]
0006fa86  lsls    r3, r2, #3
0006fa88  adds    r3, r3, r4
0006fa8a  str     r1, [r3, #4]
0006fa8c  ldr.w   r3, [r4, #0xa4]
0006fa90  adds    r3, #1
0006fa92  str.w   r0, [r4, r3, lsl #3]
0006fa96  b       #0x6fa4a
0006fa98  movs    r3, #0x80
0006fa9a  str     r3, [r0, #0x44]
0006fa9c  ldr.w   r3, [r4, #0xa4]
0006faa0  movw    r2, #0x83b
0006faa4  movs    r0, #0
0006faa6  adds    r3, #1
0006faa8  str.w   r2, [r4, r3, lsl #3]
0006faac  ldr.w   r3, [r4, #0xa4]
0006fab0  ldr     r2, [pc, #0x20]
0006fab2  adds    r3, #1
0006fab4  str.w   r3, [r4, #0xa4]
0006fab8  lsls    r3, r3, #3
0006faba  adds    r3, r3, r4
0006fabc  add     r2, pc ; -> 0x0006c77d  t_d_wait_nonattack
0006fabe  str     r2, [r3, #4]
0006fac0  ldr.w   r3, [r4, #0xa4]
0006fac4  adds    r3, #1
0006fac6  str.w   r0, [r4, r3, lsl #3]
0006faca  b       #0x6fa4a
0006facc  subs    r5, #0x6c
0006face  movs    r0, r1
0006fad0  subs    r4, #0x82
0006fad2  movs    r0, r1
0006fad4  ldm     r4, {r0, r2, r3, r4, r5, r7}
