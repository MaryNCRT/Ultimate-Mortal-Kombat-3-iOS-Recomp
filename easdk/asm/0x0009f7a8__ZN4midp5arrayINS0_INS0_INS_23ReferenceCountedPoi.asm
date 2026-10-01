========================================================================
ZN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEE7discardEv  0x0009f7a8  96 bytes   LocaleManager.mm
========================================================================

0009f7a8  push    {r4, r5, r6, r7, lr}
0009f7aa  add     r7, sp, #0xc
0009f7ac  str     r8, [sp, #-0x4]!
0009f7b0  mov     r2, r0
0009f7b2  ldr     r6, [r0, #8]
0009f7b4  ldr     r0, [r0, #0xc]
0009f7b6  cmp     r0, #0
0009f7b8  beq     #0x9f800
0009f7ba  ldrb    r3, [r0, #0x14]
0009f7bc  ldr.w   r8, [r0, #8]
0009f7c0  cmp     r3, #0
0009f7c2  ite     ne
0009f7c4  movne   r4, #1
0009f7c6  moveq   r4, #0
0009f7c8  movs    r5, #0
0009f7ca  str     r5, [r2, #0xc]
0009f7cc  str     r5, [r2, #8]
0009f7ce  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009f7d2  cbz     r0, #0x9f7f8
0009f7d4  cbz     r4, #0x9f7f8
0009f7d6  cmp.w   r8, #0
0009f7da  beq     #0x9f7f8
0009f7dc  cmp     r6, r5
0009f7de  ble     #0x9f7f2
0009f7e0  mov     r4, r8
0009f7e2  ldr     r3, [r4]
0009f7e4  mov     r0, r4
0009f7e6  adds    r5, #1
0009f7e8  adds    r4, #0x14
0009f7ea  ldr     r3, [r3]
0009f7ec  blx     r3
0009f7ee  cmp     r5, r6
0009f7f0  bne     #0x9f7e2
0009f7f2  mov     r0, r8
0009f7f4  blx     #0xdd5a8 ; -> ZdlPv
0009f7f8  movs    r0, #0
0009f7fa  ldr     r8, [sp], #4
0009f7fe  pop     {r4, r5, r6, r7, pc}
0009f800  mov     r8, r0
0009f802  mov     r4, r0
0009f804  b       #0x9f7c8
0009f806  nop     
