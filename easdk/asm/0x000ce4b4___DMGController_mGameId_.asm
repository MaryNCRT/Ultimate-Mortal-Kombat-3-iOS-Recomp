========================================================================
-[DMGController mGameId]  0x000ce4b4  16 bytes   DMGController.mm
========================================================================

000ce4b4  ldr     r3, [pc, #8]
000ce4b6  add     r3, pc ; -> 0x000f9e5c  OBJC_IVAR_$_DMGController.mGameId
000ce4b8  ldr     r3, [r3]
000ce4ba  ldr     r0, [r0, r3]
000ce4bc  bx      lr
000ce4be  nop     
000ce4c0  cbnz    r2, #0xce4ec
000ce4c2  movs    r2, r0
