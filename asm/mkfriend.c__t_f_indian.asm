========================================================================
t_f_indian  0x000a5f14  180 bytes   mkfriend.c
========================================================================

000a5f14  push    {r4, r5, r7, lr}
000a5f16  add     r7, sp, #8
000a5f18  mov     r4, r0
000a5f1a  ldr.w   r3, [r4, #0xa4]
000a5f1e  ldr.w   r0, [r0, #0x108]
000a5f22  adds    r3, #1
000a5f24  ldr.w   r5, [r4, r3, lsl #3]
000a5f28  cmp.w   r5, #0x280
000a5f2c  beq     #0xa5fa8
000a5f2e  movw    r3, #0x281
000a5f32  cmp     r5, r3
000a5f34  beq     #0xa5f82
000a5f36  cbz     r5, #0xa5f3e
000a5f38  mvn     r0, #2
000a5f3c  pop     {r4, r5, r7, pc}
000a5f3e  ldr     r3, [pc, #0x78]
000a5f40  add     r3, pc ; -> 0x00177a44  a_ind_friend
000a5f42  str     r3, [r0, #0x40]
000a5f44  movs    r3, #0xc
000a5f46  str     r3, [r0, #0x20]
000a5f48  subs    r3, #8
000a5f4a  str     r3, [r0, #0x1c]
000a5f4c  bl      #0xa5efc ; -> other_ochar_sound
000a5f50  ldr.w   r3, [r4, #0xa4]
000a5f54  mov.w   r2, #0x280
000a5f58  mov     r0, r5
000a5f5a  adds    r3, #1
000a5f5c  str.w   r2, [r4, r3, lsl #3]
000a5f60  ldr.w   r3, [r4, #0xa4]
000a5f64  ldr.w   r2, [pc, #0x54]
000a5f68  adds    r3, #1
000a5f6a  str.w   r3, [r4, #0xa4]
000a5f6e  lsls    r3, r3, #3
000a5f70  adds    r3, r3, r4
000a5f72  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a5f74  str     r2, [r3, #4]
000a5f76  ldr.w   r3, [r4, #0xa4]
000a5f7a  adds    r3, #1
000a5f7c  str.w   r5, [r4, r3, lsl #3]
000a5f80  b       #0xa5f3c
000a5f82  ldr     r1, [pc, #0x3c]
000a5f84  add     r1, pc ; -> 0x000a6b95  t_arcade
000a5f86  bl      #0x58a10 ; -> NewThread
000a5f8a  ldr     r3, [pc, #0x38]
000a5f8c  movs    r0, #0
000a5f8e  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a5f90  ldr     r2, [r3]
000a5f92  ldr.w   r3, [r4, #0xa4]
000a5f96  lsls    r3, r3, #3
000a5f98  adds    r3, r3, r4
000a5f9a  str     r2, [r3, #4]
000a5f9c  ldr.w   r3, [r4, #0xa4]
000a5fa0  adds    r3, #1
000a5fa2  str.w   r0, [r4, r3, lsl #3]
000a5fa6  b       #0xa5f3c
000a5fa8  movs    r0, #0x20
000a5faa  movw    r2, #0x281
000a5fae  str.w   r2, [r4, r3, lsl #3]
000a5fb2  str.w   r0, [r4, #0xfc]
000a5fb6  b       #0xa5f3c
000a5fb8  subs    r0, r0, r4
000a5fba  movs    r5, r1
000a5fbc  bl      #0xfffd1fbe
000a5fc0  lsrs    r5, r1, #0x10
000a5fc2  movs    r0, r0
000a5fc4  bvc     #0xa5eec
000a5fc6  movs    r4, r0
