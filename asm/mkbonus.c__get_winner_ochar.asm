========================================================================
get_winner_ochar  0x0007cb80  96 bytes   mkbonus.c
========================================================================

0007cb80  ldr     r3, [pc, #0x48]
0007cb82  add     r3, pc ; -> 0x000f357c  G
0007cb84  ldr     r3, [r3]
0007cb86  ldrsh.w r3, [r3, #0x45c]
0007cb8a  cmp     r3, #1
0007cb8c  str     r3, [r0, #0x54]
0007cb8e  beq     #0x7cbb8
0007cb90  ldr     r3, [pc, #0x3c]
0007cb92  add     r3, pc ; -> 0x000f321c  Plyr
0007cb94  ldr     r3, [r3]
0007cb96  adds    r3, #0x6c
0007cb98  str     r3, [r0, #0x20]
0007cb9a  ldr     r3, [pc, #0x38]
0007cb9c  add     r3, pc ; -> 0x000f320c  GrObj
0007cb9e  ldr     r3, [r3]
0007cba0  ldr     r3, [r3, #0x70]
0007cba2  str     r3, [r0, #0x1c]
0007cba4  ldr     r3, [r0, #0x20]
0007cba6  ldr     r3, [r3]
0007cba8  ldr     r3, [r3, #0x10]
0007cbaa  tst.w   r3, #0x200
0007cbae  str     r3, [r0, #0x2c]
0007cbb0  beq     #0x7cbb6
0007cbb2  movs    r3, #0xc
0007cbb4  str     r3, [r0, #0x1c]
0007cbb6  bx      lr
0007cbb8  ldr     r3, [pc, #0x1c]
0007cbba  add     r3, pc ; -> 0x000f321c  Plyr
0007cbbc  ldr     r3, [r3]
0007cbbe  str     r3, [r0, #0x20]
0007cbc0  ldr     r3, [pc, #0x18]
0007cbc2  add     r3, pc ; -> 0x000f320c  GrObj
0007cbc4  ldr     r3, [r3]
0007cbc6  ldr     r3, [r3, #0x24]
0007cbc8  str     r3, [r0, #0x1c]
0007cbca  b       #0x7cba4
0007cbcc  ldr     r6, [r6, #0x1c]
0007cbce  movs    r7, r0
0007cbd0  str     r6, [r0, #0x68]
0007cbd2  movs    r7, r0
0007cbd4  str     r4, [r5, #0x64]
0007cbd6  movs    r7, r0
0007cbd8  str     r6, [r3, #0x64]
0007cbda  movs    r7, r0
0007cbdc  str     r6, [r0, #0x64]
0007cbde  movs    r7, r0
