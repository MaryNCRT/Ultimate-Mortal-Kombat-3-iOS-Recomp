========================================================================
-[FacebookAgent requestWasCancelled  0x000db50c  16 bytes   FacebookAgent.mm
========================================================================

000db50c  ldr     r3, [pc, #8]
000db50e  movs    r2, #0
000db510  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db512  ldr     r3, [r3]
000db514  str     r2, [r0, r3]
000db516  bx      lr
000db518  asrs    r4, r6, #0xe
000db51a  movs    r2, r0
