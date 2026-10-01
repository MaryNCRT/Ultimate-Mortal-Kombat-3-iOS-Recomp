========================================================================
t_motaro_stupid_stance  0x000a9898  76 bytes   mkboss.c
========================================================================

000a9898  push    {r4, r5, r6, r7, lr}
000a989a  add     r7, sp, #0xc
000a989c  ldr.w   r3, [r0, #0xa4]
000a98a0  mov     r4, r0
000a98a2  ldr.w   r5, [r0, #0x108]
000a98a6  adds    r3, #1
000a98a8  ldr.w   r6, [r0, r3, lsl #3]
000a98ac  cbnz    r6, #0xa98da
000a98ae  mov     r0, r5
000a98b0  movs    r3, #0x30
000a98b2  str     r3, [r5, #0x1c]
000a98b4  str     r3, [r5, #0x20]
000a98b6  bl      #0x58764 ; -> randu_minimum
000a98ba  ldr     r3, [r5, #0x1c]
000a98bc  ldr     r2, [pc, #0x20]
000a98be  mov     r0, r6
000a98c0  str     r3, [r5, #0x44]
000a98c2  ldr.w   r3, [r4, #0xa4]
000a98c6  add     r2, pc ; -> 0x000ab3d9  t_ss1
000a98c8  lsls    r3, r3, #3
000a98ca  adds    r3, r3, r4
000a98cc  str     r2, [r3, #4]
000a98ce  ldr.w   r3, [r4, #0xa4]
000a98d2  adds    r3, #1
000a98d4  str.w   r6, [r4, r3, lsl #3]
000a98d8  pop     {r4, r5, r6, r7, pc}
000a98da  mvn     r0, #2
000a98de  b       #0xa98d8
000a98e0  subs    r7, r1, r4
000a98e2  movs    r0, r0
