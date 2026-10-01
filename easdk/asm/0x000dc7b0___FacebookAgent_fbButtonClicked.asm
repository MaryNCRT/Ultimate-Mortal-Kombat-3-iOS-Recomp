========================================================================
-[FacebookAgent fbButtonClicked  0x000dc7b0  76 bytes   FacebookAgent.mm
========================================================================

000dc7b0  push    {r4, r7, lr}
000dc7b2  add     r7, sp, #4
000dc7b4  ldr     r3, [pc, #0x34]
000dc7b6  ldr     r1, [pc, #0x38]
000dc7b8  mov     r4, r0
000dc7ba  add     r3, pc ; -> 0x000fc8b4  OBJC_IVAR_$_FacebookAgent.fbButton
000dc7bc  add     r1, pc ; -> 0x000fcf40  
000dc7be  ldr     r3, [r3]
000dc7c0  ldr     r1, [r1]
000dc7c2  ldr     r0, [r0, r3]
000dc7c4  blx     #0xddbfc ; -> objc_msgSend
000dc7c8  tst.w   r0, #0xff
000dc7cc  beq     #0xdc7de
000dc7ce  ldr     r1, [pc, #0x24]
000dc7d0  mov     r0, r4
000dc7d2  movs    r2, #0
000dc7d4  add     r1, pc ; -> 0x000fd390  
000dc7d6  ldr     r1, [r1]
000dc7d8  blx     #0xddbfc ; -> objc_msgSend
000dc7dc  b       #0xdc7ea
000dc7de  ldr     r1, [pc, #0x18]
000dc7e0  mov     r0, r4
000dc7e2  add     r1, pc ; -> 0x000fd480  
000dc7e4  ldr     r1, [r1]
000dc7e6  blx     #0xddbfc ; -> objc_msgSend
000dc7ea  pop     {r4, r7, pc}
000dc7ec  lsls    r6, r6, #3
000dc7ee  movs    r2, r0
000dc7f0  lsls    r0, r0, #0x1e
000dc7f2  movs    r2, r0
000dc7f4  lsrs    r0, r7, #0xe
000dc7f6  movs    r2, r0
000dc7f8  lsrs    r2, r3, #0x12
000dc7fa  movs    r2, r0
