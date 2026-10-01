========================================================================
-[DMGCatButton myTitleLabel]  0x000cde1c  16 bytes   DMGCatButton.m
========================================================================

000cde1c  ldr     r3, [pc, #8]
000cde1e  add     r3, pc ; -> 0x000f9a0c  OBJC_IVAR_$_DMGCatButton.myTitleLabel
000cde20  ldr     r3, [r3]
000cde22  ldr     r0, [r0, r3]
000cde24  bx      lr
000cde26  nop     
000cde28  cbnz    r2, #0xcdea6
000cde2a  movs    r2, r0
