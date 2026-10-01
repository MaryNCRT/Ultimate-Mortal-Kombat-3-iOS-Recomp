========================================================================
-[FacebookAgent delegate]  0x000db540  16 bytes   FacebookAgent.mm
========================================================================

000db540  ldr     r3, [pc, #8]
000db542  add     r3, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db544  ldr     r3, [r3]
000db546  ldr     r0, [r0, r3]
000db548  bx      lr
000db54a  nop     
000db54c  asrs    r2, r5, #0xd
000db54e  movs    r2, r0
