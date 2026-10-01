========================================================================
-[FacebookAgent fbLikeId]  0x000db520  16 bytes   FacebookAgent.mm
========================================================================

000db520  ldr     r3, [pc, #8]
000db522  add     r3, pc ; -> 0x000fc550  OBJC_IVAR_$_FacebookAgent.fbLikeId
000db524  ldr     r3, [r3]
000db526  ldr     r0, [r0, r3]
000db528  bx      lr
000db52a  nop     
000db52c  asrs    r2, r5, #0x20
000db52e  movs    r2, r0
