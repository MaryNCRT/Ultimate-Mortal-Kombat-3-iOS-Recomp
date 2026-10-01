========================================================================
t_skc_propell  0x000a8e34  84 bytes   mkboss.c
========================================================================

000a8e34  push    {r4, r5, r6, r7, lr}
000a8e36  add     r7, sp, #0xc
000a8e38  ldr.w   r3, [r0, #0xa4]
000a8e3c  mov     r4, r0
000a8e3e  ldr.w   r5, [r0, #0x108]
000a8e42  adds    r3, #1
000a8e44  ldr.w   r6, [r0, r3, lsl #3]
000a8e48  cbnz    r6, #0xa8e74
000a8e4a  mov     r0, r5
000a8e4c  bl      #0x2f3a0 ; -> get_x_dist
000a8e50  ldr     r0, [r5, #0x28]
000a8e52  cmp     r0, #0x90
000a8e54  bgt     #0xa8e7a
000a8e56  ldr     r3, [pc, #0x28]
000a8e58  add     r3, pc ; -> 0x000f3418  t_d_block
000a8e5a  ldr     r2, [r3]
000a8e5c  ldr.w   r3, [r4, #0xa4]
000a8e60  mov     r0, r6
000a8e62  lsls    r3, r3, #3
000a8e64  adds    r3, r3, r4
000a8e66  str     r2, [r3, #4]
000a8e68  ldr.w   r3, [r4, #0xa4]
000a8e6c  adds    r3, #1
000a8e6e  str.w   r6, [r4, r3, lsl #3]
000a8e72  b       #0xa8e78
000a8e74  mvn     r0, #2
000a8e78  pop     {r4, r5, r6, r7, pc}
000a8e7a  ldr     r2, [pc, #8]
000a8e7c  add     r2, pc ; -> 0x000a858d  t_b_return_to_beware_4get
000a8e7e  b       #0xa8e5c
000a8e80  adr     r5, #0x2f0
000a8e82  movs    r4, r0
000a8e84  bl      #0xfffb6e86
