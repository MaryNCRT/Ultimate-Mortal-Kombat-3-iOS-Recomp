========================================================================
-[DMGCatButton setM_bButPressed  0x000cde9c  16 bytes   DMGCatButton.m
========================================================================

000cde9c  ldr     r3, [pc, #8]
000cde9e  add     r3, pc ; -> 0x000f9a20  OBJC_IVAR_$_DMGCatButton.m_bButPressed
000cdea0  ldr     r3, [r3]
000cdea2  strb    r2, [r0, r3]
000cdea4  bx      lr
000cdea6  nop     
000cdea8  cbnz    r6, #0xcdf0a
000cdeaa  movs    r2, r0
