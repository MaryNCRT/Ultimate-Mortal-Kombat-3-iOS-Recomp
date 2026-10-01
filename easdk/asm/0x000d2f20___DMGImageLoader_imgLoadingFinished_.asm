========================================================================
-[DMGImageLoader imgLoadingFinished]  0x000d2f20  16 bytes   DMGImageLoader.mm
========================================================================

000d2f20  ldr     r3, [pc, #8]
000d2f22  add     r3, pc ; -> 0x000fa718  OBJC_IVAR_$_DMGImageLoader.imgLoadingFinished
000d2f24  ldr     r3, [r3]
000d2f26  ldrsb   r0, [r0, r3]
000d2f28  bx      lr
000d2f2a  nop     
000d2f2c  strb    r2, [r6, #0x1f]
000d2f2e  movs    r2, r0
