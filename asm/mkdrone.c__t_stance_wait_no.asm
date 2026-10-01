========================================================================
t_stance_wait_no  0x00071ee4  256 bytes   mkdrone.c
========================================================================

00071ee4  push    {r4, r5, r7, lr}
00071ee6  add     r7, sp, #8
00071ee8  ldr.w   r3, [r0, #0xa4]
00071eec  movw    r2, #0x64d
00071ef0  mov     r4, r0
00071ef2  adds    r3, #1
00071ef4  ldr.w   r5, [r0, #0x108]
00071ef8  ldr.w   r3, [r0, r3, lsl #3]
00071efc  cmp     r3, r2
00071efe  beq     #0x71f78
00071f00  adds    r2, #6
00071f02  cmp     r3, r2
00071f04  beq     #0x71f4a
00071f06  cbnz    r3, #0x71f44
00071f08  mov     r0, r5
00071f0a  bl      #0x71e0c ; -> d_stance_setup
00071f0e  mov     r0, r5
00071f10  bl      #0x5a680 ; -> next_anirate
00071f14  ldr.w   r3, [r4, #0xa4]
00071f18  movw    r2, #0x64d
00071f1c  movs    r0, #0
00071f1e  adds    r3, #1
00071f20  str.w   r2, [r4, r3, lsl #3]
00071f24  ldr.w   r3, [r4, #0xa4]
00071f28  ldr     r2, [pc, #0xac]
00071f2a  adds    r3, #1
00071f2c  str.w   r3, [r4, #0xa4]
00071f30  lsls    r3, r3, #3
00071f32  adds    r3, r3, r4
00071f34  add     r2, pc ; -> 0x0006c40d  t_d_beware
00071f36  str     r2, [r3, #4]
00071f38  ldr.w   r3, [r4, #0xa4]
00071f3c  adds    r3, #1
00071f3e  str.w   r0, [r4, r3, lsl #3]
00071f42  b       #0x71f48
00071f44  mvn     r0, #2
00071f48  pop     {r4, r5, r7, pc}
00071f4a  ldr     r3, [r5, #0x44]
00071f4c  subs    r3, #1
00071f4e  cmp     r3, #0
00071f50  str     r3, [r5, #0x44]
00071f52  bgt     #0x71f0e
00071f54  movs    r0, #0
00071f56  str     r0, [r5, #0x5c]
00071f58  ldr.w   r3, [r4, #0xa4]
00071f5c  cmp     r3, r0
00071f5e  bgt     #0x71fb2
00071f60  ldr     r2, [pc, #0x78]
00071f62  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00071f64  ldr     r2, [r2]
00071f66  lsls    r3, r3, #3
00071f68  adds    r3, r3, r4
00071f6a  str     r2, [r3, #4]
00071f6c  ldr.w   r3, [r4, #0xa4]
00071f70  adds    r3, #1
00071f72  str.w   r0, [r4, r3, lsl #3]
00071f76  b       #0x71f48
00071f78  ldr.w   r1, [r0, #0xf8]
00071f7c  ldr     r2, [r5, #0x44]
00071f7e  lsls    r3, r1, #2
00071f80  adds    r3, r3, r0
00071f82  str.w   r2, [r3, #0xa8]
00071f86  adds    r3, r1, #1
00071f88  str.w   r3, [r0, #0xf8]
00071f8c  mov     r0, r5
00071f8e  ldr     r3, [r5, #0x48]
00071f90  blx     r3
00071f92  ldr.w   r3, [r4, #0xf8]
00071f96  subs    r3, #1
00071f98  str.w   r3, [r4, #0xf8]
00071f9c  lsls    r3, r3, #2
00071f9e  adds    r3, r3, r4
00071fa0  ldr     r0, [r5, #0x5c]
00071fa2  ldr.w   r3, [r3, #0xa8]
00071fa6  str     r3, [r5, #0x44]
00071fa8  cbnz    r0, #0x71fba
00071faa  ldr.w   r3, [r4, #0xa4]
00071fae  cmp     r3, #0
00071fb0  ble     #0x71fd0
00071fb2  subs    r3, #1
00071fb4  str.w   r3, [r4, #0xa4]
00071fb8  b       #0x71f48
00071fba  ldr.w   r3, [r4, #0xa4]
00071fbe  movs    r0, #1
00071fc0  movw    r2, #0x653
00071fc4  adds    r3, #1
00071fc6  str.w   r2, [r4, r3, lsl #3]
00071fca  str.w   r0, [r4, #0xfc]
00071fce  b       #0x71f48
00071fd0  ldr.w   r2, [pc, #0xc]
00071fd4  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00071fd6  b       #0x71f64
00071fd8  adr     r4, #0x354
