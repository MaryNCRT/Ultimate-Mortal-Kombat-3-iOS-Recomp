========================================================================
-[FacebookAgent fbApplicationId]  0x000db530  16 bytes   FacebookAgent.mm
========================================================================

000db530  ldr     r3, [pc, #8]
000db532  add     r3, pc ; -> 0x000fc54c  OBJC_IVAR_$_FacebookAgent.fbApplicationId
000db534  ldr     r3, [r3]
000db536  ldr     r0, [r0, r3]
000db538  bx      lr
000db53a  nop     
000db53c  asrs    r6, r2, #0x20
000db53e  movs    r2, r0
