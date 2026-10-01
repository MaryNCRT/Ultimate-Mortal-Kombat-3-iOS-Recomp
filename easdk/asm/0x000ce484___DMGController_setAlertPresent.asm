========================================================================
-[DMGController setAlertPresent  0x000ce484  16 bytes   DMGController.mm
========================================================================

000ce484  ldr     r3, [pc, #8]
000ce486  add     r3, pc ; -> 0x000f9e64  OBJC_IVAR_$_DMGController.alertPresent
000ce488  ldr     r3, [r3]
000ce48a  strb    r2, [r0, r3]
000ce48c  bx      lr
000ce48e  nop     
000ce490  cbnz    r2, #0xce4ca
000ce492  movs    r2, r0
