========================================================================
t_joyd3  0x0002ee30  72 bytes   joy.c
========================================================================

0002ee30  push    {r4, r5, r7, lr}
0002ee32  add     r7, sp, #8
0002ee34  mov     r4, r0
0002ee36  ldr.w   r3, [r4, #0xa4]
0002ee3a  ldr.w   r0, [r0, #0x108]
0002ee3e  adds    r3, #1
0002ee40  ldr.w   r5, [r4, r3, lsl #3]
0002ee44  cbnz    r5, #0x2ee6a
0002ee46  ldr     r1, [pc, #0x28]
0002ee48  add     r1, pc ; -> 0x001655d4  bt_duck
0002ee4a  bl      #0x2ec50 ; -> stuff_buttons
0002ee4e  ldr.w   r3, [r4, #0xa4]
0002ee52  ldr     r2, [pc, #0x20]
0002ee54  mov     r0, r5
0002ee56  lsls    r3, r3, #3
0002ee58  adds    r3, r3, r4
0002ee5a  add     r2, pc ; -> 0x0002fad5  t_joyd4
0002ee5c  str     r2, [r3, #4]
0002ee5e  ldr.w   r3, [r4, #0xa4]
0002ee62  adds    r3, #1
0002ee64  str.w   r5, [r4, r3, lsl #3]
0002ee68  pop     {r4, r5, r7, pc}
0002ee6a  mvn     r0, #2
0002ee6e  b       #0x2ee68
0002ee70  str     r0, [r1, #0x78]
0002ee72  movs    r3, r2
0002ee74  lsrs    r7, r6, #0x11
0002ee76  movs    r0, r0
