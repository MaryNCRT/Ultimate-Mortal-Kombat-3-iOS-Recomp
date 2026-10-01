========================================================================
-[DMGController alertPresent]  0x000ce474  16 bytes   DMGController.mm
========================================================================

000ce474  ldr     r3, [pc, #8]
000ce476  add     r3, pc ; -> 0x000f9e64  OBJC_IVAR_$_DMGController.alertPresent
000ce478  ldr     r3, [r3]
000ce47a  ldrsb   r0, [r0, r3]
000ce47c  bx      lr
000ce47e  nop     
000ce480  cbnz    r2, #0xce4be
000ce482  movs    r2, r0
