========================================================================
-[FacebookAgent setDelegate  0x000db550  16 bytes   FacebookAgent.mm
========================================================================

000db550  ldr     r3, [pc, #8]
000db552  add     r3, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db554  ldr     r3, [r3]
000db556  str     r2, [r0, r3]
000db558  bx      lr
000db55a  nop     
000db55c  asrs    r2, r3, #0xd
000db55e  movs    r2, r0
