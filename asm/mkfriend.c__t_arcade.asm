========================================================================
t_arcade  0x000a6b94  244 bytes   mkfriend.c
========================================================================

000a6b94  push    {r4, r5, r6, r7, lr}
000a6b96  add     r7, sp, #0xc
000a6b98  str     r8, [sp, #-0x4]!
000a6b9c  ldr.w   r3, [r0, #0xa4]
000a6ba0  movw    r8, #0x26a
000a6ba4  mov     r4, r0
000a6ba6  adds    r3, #1
000a6ba8  ldr.w   r5, [r0, #0x108]
000a6bac  ldr.w   r6, [r0, r3, lsl #3]
000a6bb0  cmp     r6, r8
000a6bb2  beq     #0xa6c3e
000a6bb4  movw    r3, #0x272
000a6bb8  cmp     r6, r3
000a6bba  beq     #0xa6c1a
000a6bbc  cbz     r6, #0xa6bc8
000a6bbe  mvn     r0, #2
000a6bc2  ldr     r8, [sp], #4
000a6bc6  pop     {r4, r5, r6, r7, pc}
000a6bc8  ldr     r2, [r5, #8]
000a6bca  mov     r0, r5
000a6bcc  movw    r3, #0x1b36
000a6bd0  str     r3, [r2, #0x2c]
000a6bd2  mvn     r3, #0x6f
000a6bd6  str     r3, [r5, #0x1c]
000a6bd8  subs    r3, #0x90
000a6bda  str     r3, [r5, #0x20]
000a6bdc  bl      #0x570ac ; -> multi_adjust_xy
000a6be0  mov.w   r3, #0x20000
000a6be4  str     r3, [r5, #0x20]
000a6be6  sub.w   r3, r3, #0x1a000
000a6bea  str     r3, [r5, #0x44]
000a6bec  ldr.w   r3, [r4, #0xa4]
000a6bf0  mov     r0, r6
000a6bf2  adds    r3, #1
000a6bf4  str.w   r8, [r4, r3, lsl #3]
000a6bf8  ldr.w   r3, [r4, #0xa4]
000a6bfc  adds    r2, r3, #1
000a6bfe  ldr     r3, [pc, #0x80]
000a6c00  str.w   r2, [r4, #0xa4]
000a6c04  add     r3, pc ; -> 0x000f33f4  t_gravity_ani_ysize
000a6c06  ldr     r1, [r3]
000a6c08  lsls    r3, r2, #3
000a6c0a  adds    r3, r3, r4
000a6c0c  str     r1, [r3, #4]
000a6c0e  ldr.w   r3, [r4, #0xa4]
000a6c12  adds    r3, #1
000a6c14  str.w   r6, [r4, r3, lsl #3]
000a6c18  b       #0xa6bc2
000a6c1a  mov     r0, r5
000a6c1c  bl      #0x336e8 ; -> death_blow_complete
000a6c20  ldr     r3, [pc, #0x60]
000a6c22  movs    r0, #0
000a6c24  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a6c26  ldr     r2, [r3]
000a6c28  ldr.w   r3, [r4, #0xa4]
000a6c2c  lsls    r3, r3, #3
000a6c2e  adds    r3, r3, r4
000a6c30  str     r2, [r3, #4]
000a6c32  ldr.w   r3, [r4, #0xa4]
000a6c36  adds    r3, #1
000a6c38  str.w   r0, [r4, r3, lsl #3]
000a6c3c  b       #0xa6bc2
000a6c3e  mov     r0, r5
000a6c40  bl      #0x424fc ; -> shake_n_sound
000a6c44  mov     r0, r5
000a6c46  bl      #0x586cc ; -> mk_random
000a6c4a  ands    r2, r0, #0x100
000a6c4e  bne     #0xa6c70
000a6c50  movs    r0, #3
000a6c52  movs    r1, #8
000a6c54  mov     r3, r2
000a6c56  bl      #0x31a28 ; -> MKEvent_Add
000a6c5a  ldr.w   r3, [r4, #0xa4]
000a6c5e  movs    r0, #0x40
000a6c60  movw    r2, #0x272
000a6c64  adds    r3, #1
000a6c66  str.w   r2, [r4, r3, lsl #3]
000a6c6a  str.w   r0, [r4, #0xfc]
000a6c6e  b       #0xa6bc2
000a6c70  movs    r2, #0
000a6c72  movs    r0, #3
000a6c74  movs    r1, #7
000a6c76  mov     r3, r2
000a6c78  bl      #0x31a28 ; -> MKEvent_Add
000a6c7c  b       #0xa6c5a
000a6c7e  nop     
000a6c80  stm     r7!, {r2, r3, r5, r6, r7}
000a6c82  movs    r4, r0
000a6c84  ldm     r2, {r2, r3, r4, r5, r6, r7}
000a6c86  movs    r4, r0
