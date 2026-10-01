========================================================================
-[DMGCatButton m_bButPressed]  0x000cde8c  16 bytes   DMGCatButton.m
========================================================================

000cde8c  ldr     r3, [pc, #8]
000cde8e  add     r3, pc ; -> 0x000f9a20  OBJC_IVAR_$_DMGCatButton.m_bButPressed
000cde90  ldr     r3, [r3]
000cde92  ldrsb   r0, [r0, r3]
000cde94  bx      lr
000cde96  nop     
000cde98  cbnz    r6, #0xcdefe
000cde9a  movs    r2, r0
