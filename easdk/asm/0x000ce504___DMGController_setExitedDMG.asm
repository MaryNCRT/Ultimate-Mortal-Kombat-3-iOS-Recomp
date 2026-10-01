========================================================================
-[DMGController setExitedDMG  0x000ce504  16 bytes   DMGController.mm
========================================================================

000ce504  ldr     r3, [pc, #8]
000ce506  add     r3, pc ; -> 0x000f9e54  OBJC_IVAR_$_DMGController.exitedDMG
000ce508  ldr     r3, [r3]
000ce50a  strb    r2, [r0, r3]
000ce50c  bx      lr
000ce50e  nop     
000ce510  cbnz    r2, #0xce526
000ce512  movs    r2, r0
