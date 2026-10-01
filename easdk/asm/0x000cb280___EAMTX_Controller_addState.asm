========================================================================
-[EAMTX_Controller addState  0x000cb280  208 bytes   EAMTX_Controller.mm
========================================================================

000cb280  push    {r4, r5, r6, r7, lr}
000cb282  add     r7, sp, #0xc
000cb284  str     r8, [sp, #-0x4]!
000cb288  mov     r5, r3
000cb28a  ldr     r3, [pc, #0xb0]
000cb28c  mov     r4, r0
000cb28e  add     r3, pc ; -> 0x000f912c  OBJC_IVAR_$_EAMTX_Controller.iCurrState
000cb290  ldr     r3, [r3]
000cb292  str     r2, [r0, r3]
000cb294  subs    r3, r2, #1
000cb296  cmp     r3, #0x35
000cb298  bhi     #0xcb334
000cb29a  tbb     [pc, r3]
000cb29e  ldr     r3, [pc, #0x70]
000cb2a0  adds    r4, r3, #0
000cb2a2  adds    r3, r1, #1
000cb2a4  adds    r3, r1, #1
000cb2a6  adds    r4, r3, #0
000cb2a8  adds    r4, r3, #0
000cb2aa  adds    r4, r3, #0
000cb2ac  adds    r4, r3, #0
000cb2ae  adds    r4, r3, #0
000cb2b0  adds    r4, r3, #0
000cb2b2  adds    r4, r3, #0
000cb2b4  adds    r4, r3, #0
000cb2b6  adds    r4, r3, #0
000cb2b8  adds    r4, r3, #0
000cb2ba  adds    r4, r3, #0
000cb2bc  adds    r3, r1, #1
000cb2be  adds    r4, r3, #0
000cb2c0  adds    r4, r3, #0
000cb2c2  adds    r4, r3, #0
000cb2c4  adds    r4, r3, #0
000cb2c6  adds    r4, r3, #0
000cb2c8  adds    r4, r3, #0
000cb2ca  adds    r4, r3, #0
000cb2cc  adds    r4, r3, #0
000cb2ce  adds    r3, r1, #1
000cb2d0  adds    r4, r3, #0
000cb2d2  adds    r4, r3, #0
000cb2d4  lsls    r3, r1, #1
000cb2d6  cmp     r2, #6
000cb2d8  beq     #0xcb32e
000cb2da  ldr     r1, [pc, #0x64]
000cb2dc  add     r1, pc ; -> 0x000fd5c0  
000cb2de  ldr     r1, [r1]
000cb2e0  blx     #0xddbfc ; -> objc_msgSend
000cb2e4  cbnz    r0, #0xcb32e
000cb2e6  ldr     r0, [pc, #0x5c]
000cb2e8  ldr     r1, [pc, #0x5c]
000cb2ea  add     r0, pc ; -> 0x000f3324  mtxUserInfo
000cb2ec  add     r1, pc ; -> 0x000fd5d8  
000cb2ee  ldr.w   r8, [r0]
000cb2f2  ldr     r6, [r1]
000cb2f4  ldr.w   r0, [r8]
000cb2f8  mov     r1, r6
000cb2fa  blx     #0xddbfc ; -> objc_msgSend
000cb2fe  cmp     r0, #0
000cb300  ble     #0xcb314
000cb302  ldr.w   r0, [r8]
000cb306  mov     r1, r6
000cb308  blx     #0xddbfc ; -> objc_msgSend
000cb30c  movw    r3, #0x2697
000cb310  cmp     r0, r3
000cb312  bne     #0xcb32e
000cb314  ldr     r6, [pc, #0x34]
000cb316  mov     r0, r5
000cb318  movs    r3, #6
000cb31a  add     r6, pc ; -> 0x000f912c  OBJC_IVAR_$_EAMTX_Controller.iCurrState
000cb31c  ldr     r2, [r6]
000cb31e  ldr.w   r8, [r4, r2]
000cb322  str     r3, [r4, r2]
000cb324  bl      #0xc2754 ; -> Z22PrepareAndQueueRequesti
000cb328  ldr     r3, [r6]
000cb32a  str.w   r8, [r4, r3]
000cb32e  mov     r0, r5
000cb330  bl      #0xc2754 ; -> Z22PrepareAndQueueRequesti
000cb334  ldr     r8, [sp], #4
000cb338  pop     {r4, r5, r6, r7, pc}
000cb33a  nop     
000cb33c  udf     #0x9a
000cb33e  movs    r2, r0
000cb340  movs    r2, #0xe0
000cb342  movs    r3, r0
000cb344  strh    r6, [r6]
000cb346  movs    r2, r0
000cb348  movs    r2, #0xe8
000cb34a  movs    r3, r0
000cb34c  udf     #0xe
000cb34e  movs    r2, r0
