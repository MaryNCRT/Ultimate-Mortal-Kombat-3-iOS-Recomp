========================================================================
ask_mr_diff  0x0006c9c8  44 bytes   mkdrone.c
========================================================================

0006c9c8  push    {r7, lr}
0006c9ca  add     r7, sp, #0
0006c9cc  ldr     r3, [pc, #0x20]
0006c9ce  add     r3, pc ; -> 0x000f357c  G
0006c9d0  ldr     r3, [r3]
0006c9d2  ldrsh.w r3, [r3, #0x44c]
0006c9d6  cmp     r3, #9
0006c9d8  str     r3, [r0, #0x20]
0006c9da  bls     #0x6c9e0
0006c9dc  movs    r3, #7
0006c9de  str     r3, [r0, #0x20]
0006c9e0  ldr     r2, [r0, #0x20]
0006c9e2  ldr     r3, [r0, #0x1c]
0006c9e4  ldrsh.w r3, [r3, r2, lsl #1]
0006c9e8  str     r3, [r0, #0x1c]
0006c9ea  bl      #0x586dc ; -> randper
0006c9ee  pop     {r7, pc}
0006c9f0  ldr     r2, [r5, #0x38]
0006c9f2  movs    r0, r1
