========================================================================
-[FacebookAgent dialogWillAppear  0x000db630  64 bytes   FacebookAgent.mm
========================================================================

000db630  push    {r4, r5, r6, r7, lr}
000db632  add     r7, sp, #0xc
000db634  ldr     r1, [pc, #0x2c]
000db636  ldr     r4, [pc, #0x30]
000db638  mov     r6, r0
000db63a  add     r1, pc ; -> 0x000fcc18  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2a0
000db63c  add     r4, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db63e  ldr     r5, [r1]
000db640  ldr     r1, [pc, #0x28]
000db642  ldr     r3, [r4]
000db644  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db646  mov     r2, r5
000db648  ldr     r0, [r0, r3]
000db64a  ldr     r1, [r1]
000db64c  blx     #0xddbfc ; -> objc_msgSend
000db650  tst.w   r0, #0xff
000db654  beq     #0xdb660
000db656  ldr     r0, [r4]
000db658  mov     r1, r5
000db65a  ldr     r0, [r6, r0]
000db65c  blx     #0xddbfc ; -> objc_msgSend
000db660  pop     {r4, r5, r6, r7, pc}
000db662  nop     
000db664  asrs    r2, r3, #0x17
000db666  movs    r2, r0
000db668  asrs    r0, r6, #9
000db66a  movs    r2, r0
000db66c  asrs    r0, r1, #0x19
000db66e  movs    r2, r0
