========================================================================
t_f_sonya  0x000a5c1c  152 bytes   mkfriend.c
========================================================================

000a5c1c  push    {r4, r5, r6, r7, lr}
000a5c1e  add     r7, sp, #0xc
000a5c20  ldr.w   r3, [r0, #0xa4]
000a5c24  mov     r5, r0
000a5c26  ldr.w   r4, [r0, #0x108]
000a5c2a  adds    r3, #1
000a5c2c  ldr.w   r3, [r0, r3, lsl #3]
000a5c30  cbnz    r3, #0xa5c62
000a5c32  ldr     r6, [pc, #0x78]
000a5c34  movs    r3, #1
000a5c36  str     r3, [r4, #0x44]
000a5c38  mov     r1, r6
000a5c3a  mov     r0, r4
000a5c3c  add     r1, pc
000a5c3e  bl      #0x58a10 ; -> NewThread
000a5c42  ldr     r3, [r4, #0x44]
000a5c44  subs    r3, #1
000a5c46  cmp     r3, #0
000a5c48  str     r3, [r4, #0x44]
000a5c4a  bgt     #0xa5c38
000a5c4c  ldr.w   r3, [r5, #0xa4]
000a5c50  mov.w   r2, #0x21c
000a5c54  movs    r0, #0x30
000a5c56  adds    r3, #1
000a5c58  str.w   r2, [r5, r3, lsl #3]
000a5c5c  str.w   r0, [r5, #0xfc]
000a5c60  pop     {r4, r5, r6, r7, pc}
000a5c62  cmp.w   r3, #0x21c
000a5c66  it      ne
000a5c68  mvnne   r0, #2
000a5c6c  bne     #0xa5c60
000a5c6e  mov     r0, r4
000a5c70  bl      #0x336e8 ; -> death_blow_complete
000a5c74  mov     r0, r4
000a5c76  bl      #0x57488 ; -> player_normpal
000a5c7a  ldr.w   r3, [r5, #0xa4]
000a5c7e  mov.w   r2, #0x220
000a5c82  movs    r0, #0
000a5c84  adds    r3, #1
000a5c86  str.w   r2, [r5, r3, lsl #3]
000a5c8a  ldr.w   r3, [r5, #0xa4]
000a5c8e  adds    r2, r3, #1
000a5c90  ldr     r3, [pc, #0x1c]
000a5c92  str.w   r2, [r5, #0xa4]
000a5c96  add     r3, pc ; -> 0x000f36e4  t_victory_animation
000a5c98  ldr     r1, [r3]
000a5c9a  lsls    r3, r2, #3
000a5c9c  adds    r3, r3, r5
000a5c9e  str     r1, [r3, #4]
000a5ca0  ldr.w   r3, [r5, #0xa4]
000a5ca4  adds    r3, #1
000a5ca6  str.w   r0, [r5, r3, lsl #3]
000a5caa  b       #0xa5c60
000a5cac  asrs    r1, r1, #1
000a5cae  movs    r0, r0
000a5cb0  bge     #0xa5d48
000a5cb2  movs    r4, r0
