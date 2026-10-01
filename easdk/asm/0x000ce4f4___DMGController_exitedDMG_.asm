========================================================================
-[DMGController exitedDMG]  0x000ce4f4  16 bytes   DMGController.mm
========================================================================

000ce4f4  ldr     r3, [pc, #8]
000ce4f6  add     r3, pc ; -> 0x000f9e54  OBJC_IVAR_$_DMGController.exitedDMG
000ce4f8  ldr     r3, [r3]
000ce4fa  ldrsb   r0, [r0, r3]
000ce4fc  bx      lr
000ce4fe  nop     
000ce500  cbnz    r2, #0xce51a
000ce502  movs    r2, r0
