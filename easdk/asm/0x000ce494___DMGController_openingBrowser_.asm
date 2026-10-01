========================================================================
-[DMGController openingBrowser]  0x000ce494  16 bytes   DMGController.mm
========================================================================

000ce494  ldr     r3, [pc, #8]
000ce496  add     r3, pc ; -> 0x000f9e60  OBJC_IVAR_$_DMGController.openingBrowser
000ce498  ldr     r3, [r3]
000ce49a  ldrsb   r0, [r0, r3]
000ce49c  bx      lr
000ce49e  nop     
000ce4a0  cbnz    r6, #0xce4d4
000ce4a2  movs    r2, r0
