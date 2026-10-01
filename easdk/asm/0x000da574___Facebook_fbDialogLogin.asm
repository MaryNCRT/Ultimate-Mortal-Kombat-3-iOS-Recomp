========================================================================
-[Facebook fbDialogLogin  0x000da574  108 bytes   Facebook.m
========================================================================

000da574  push    {r4, r5, r7, lr}
000da576  add     r7, sp, #8
000da578  ldr     r1, [pc, #0x4c]
000da57a  mov     r5, r3
000da57c  mov     r4, r0
000da57e  add     r1, pc ; -> 0x000fdab4  't#\x0f'
000da580  ldr     r1, [r1]
000da582  blx     #0xddbfc ; -> objc_msgSend
000da586  ldr     r1, [pc, #0x44]
000da588  mov     r2, r5
000da58a  mov     r0, r4
000da58c  add     r1, pc ; -> 0x000fdab0  
000da58e  ldr     r1, [r1]
000da590  blx     #0xddbfc ; -> objc_msgSend
000da594  ldr     r1, [pc, #0x38]
000da596  mov     r0, r4
000da598  add     r1, pc ; -> 0x000fdac4  
000da59a  ldr     r1, [r1]
000da59c  blx     #0xddbfc ; -> objc_msgSend
000da5a0  ldr     r1, [pc, #0x30]
000da5a2  add     r1, pc ; -> 0x000fdaac  'C\x1b\x0f'
000da5a4  ldr     r5, [r1]
000da5a6  ldr     r1, [pc, #0x30]
000da5a8  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000da5aa  mov     r2, r5
000da5ac  ldr     r1, [r1]
000da5ae  blx     #0xddbfc ; -> objc_msgSend
000da5b2  tst.w   r0, #0xff
000da5b6  beq     #0xda5c6
000da5b8  ldr     r3, [pc, #0x20]
000da5ba  mov     r1, r5
000da5bc  add     r3, pc ; -> 0x000fc50c  OBJC_IVAR_$_Facebook._sessionDelegate
000da5be  ldr     r0, [r3]
000da5c0  ldr     r0, [r4, r0]
000da5c2  blx     #0xddbfc ; -> objc_msgSend
000da5c6  pop     {r4, r5, r7, pc}
000da5c8  adds    r5, #0x32
000da5ca  movs    r2, r0
000da5cc  adds    r5, #0x20
000da5ce  movs    r2, r0
000da5d0  adds    r5, #0x28
000da5d2  movs    r2, r0
000da5d4  adds    r5, #6
000da5d6  movs    r2, r0
000da5d8  movs    r6, #0xe4
000da5da  movs    r2, r0
000da5dc  subs    r4, r1, #5
000da5de  movs    r2, r0
