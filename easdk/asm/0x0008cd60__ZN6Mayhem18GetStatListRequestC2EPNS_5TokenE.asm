========================================================================
ZN6Mayhem18GetStatListRequestC2EPNS_5TokenE  0x0008cd60  68 bytes   Mayhem.mm
========================================================================

0008cd60  push    {r4, r7, lr}
0008cd62  add     r7, sp, #4
0008cd64  mov     r4, r0
0008cd66  bl      #0x8cb8c ; -> ZN6Mayhem7RequestC2EPNS_5TokenE
0008cd6a  ldr     r3, [pc, #0x2c]
0008cd6c  add     r3, pc ; -> 0x0017da64  ZTVN6Mayhem18GetStatListRequestE
0008cd6e  adds    r3, #8
0008cd70  str     r3, [r4]
0008cd72  ldr     r3, [pc, #0x28]
0008cd74  add     r3, pc ; -> 0x000f3370  0x0
0008cd76  ldr     r3, [r3]
0008cd78  add.w   r2, r3, #0xc
0008cd7c  mvn     r3, #0x80000000
0008cd80  str     r2, [r4, #0x50]
0008cd82  str     r3, [r4, #0x58]
0008cd84  str     r2, [r4, #0x54]
0008cd86  movs    r3, #0
0008cd88  str     r2, [r4, #0x7c]
0008cd8a  str     r3, [r4, #0x5c]
0008cd8c  str     r3, [r4, #0x60]
0008cd8e  str     r3, [r4, #0x64]
0008cd90  str     r3, [r4, #0x68]
0008cd92  str     r3, [r4, #0x6c]
0008cd94  str     r3, [r4, #0x70]
0008cd96  pop     {r4, r7, pc}
0008cd98  lsrs    r4, r6, #0x13
0008cd9a  movs    r7, r1
0008cd9c  str     r0, [r7, #0x5c]
0008cd9e  movs    r6, r0
0008cda0  nop     
0008cda2  nop     
