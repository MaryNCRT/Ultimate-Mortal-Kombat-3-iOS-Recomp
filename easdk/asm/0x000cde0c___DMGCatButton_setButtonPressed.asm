========================================================================
-[DMGCatButton setButtonPressed  0x000cde0c  16 bytes   DMGCatButton.m
========================================================================

000cde0c  ldr     r3, [pc, #8]
000cde0e  add     r3, pc ; -> 0x000f9a20  OBJC_IVAR_$_DMGCatButton.m_bButPressed
000cde10  ldr     r3, [r3]
000cde12  strb    r2, [r0, r3]
000cde14  bx      lr
000cde16  nop     
000cde18  pop     {r1, r2, r3}
000cde1a  movs    r2, r0
