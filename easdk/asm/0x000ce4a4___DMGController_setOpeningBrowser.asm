========================================================================
-[DMGController setOpeningBrowser  0x000ce4a4  16 bytes   DMGController.mm
========================================================================

000ce4a4  ldr     r3, [pc, #8]
000ce4a6  add     r3, pc ; -> 0x000f9e60  OBJC_IVAR_$_DMGController.openingBrowser
000ce4a8  ldr     r3, [r3]
000ce4aa  strb    r2, [r0, r3]
000ce4ac  bx      lr
000ce4ae  nop     
000ce4b0  cbnz    r6, #0xce4e0
000ce4b2  movs    r2, r0
