========================================================================
-[DMGController mClientType]  0x000ce4d4  16 bytes   DMGController.mm
========================================================================

000ce4d4  ldr     r3, [pc, #8]
000ce4d6  add     r3, pc ; -> 0x000f9e58  OBJC_IVAR_$_DMGController.mClientType
000ce4d8  ldr     r3, [r3]
000ce4da  ldr     r0, [r0, r3]
000ce4dc  bx      lr
000ce4de  nop     
000ce4e0  cbnz    r6, #0xce502
000ce4e2  movs    r2, r0
