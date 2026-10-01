========================================================================
c_react_flipk  0x0006cb6c  112 bytes   mkdrone.c
========================================================================

0006cb6c  push    {r4, r5, r6, r7, lr}
0006cb6e  add     r7, sp, #0xc
0006cb70  ldr.w   r3, [r0, #0xa4]
0006cb74  mov     r4, r0
0006cb76  ldr.w   r5, [r0, #0x108]
0006cb7a  adds    r3, #1
0006cb7c  ldr.w   r6, [r0, r3, lsl #3]
0006cb80  cbnz    r6, #0x6cba8
0006cb82  mov     r0, r5
0006cb84  bl      #0x6c9f4 ; -> should_i_promove
0006cb88  ldr     r3, [r5, #0x5c]
0006cb8a  cbnz    r3, #0x6cbae
0006cb8c  ldr     r2, [pc, #0x40]
0006cb8e  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006cb90  ldr.w   r3, [r4, #0xa4]
0006cb94  mov     r0, r6
0006cb96  lsls    r3, r3, #3
0006cb98  adds    r3, r3, r4
0006cb9a  str     r2, [r3, #4]
0006cb9c  ldr.w   r3, [r4, #0xa4]
0006cba0  adds    r3, #1
0006cba2  str.w   r6, [r4, r3, lsl #3]
0006cba6  b       #0x6cbac
0006cba8  mvn     r0, #2
0006cbac  pop     {r4, r5, r6, r7, pc}
0006cbae  ldr     r3, [r5]
0006cbb0  ldr     r3, [r3, #4]
0006cbb2  ldr     r3, [r3, #0x24]
0006cbb4  cmp     r3, #0x17
0006cbb6  ble     #0x6cbbe
0006cbb8  ldr     r2, [pc, #0x18]
0006cbba  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006cbbc  b       #0x6cb90
0006cbbe  ldr     r3, [r5, #8]
0006cbc0  ldr     r2, [pc, #0x14]
0006cbc2  ldr     r3, [r3, #0x24]
0006cbc4  add     r2, pc ; -> 0x00171e5c  tab_react_flipk
0006cbc6  ldr.w   r2, [r2, r3, lsl #2]
0006cbca  str     r2, [r5, #0x1c]
0006cbcc  b       #0x6cb90
0006cbce  nop     
0006cbd0  bl      #0xffe60bd2
0006cbd4  bl      #0xffe34bd6
0006cbd8  strh    r4, [r2, r2]
0006cbda  movs    r0, r2
