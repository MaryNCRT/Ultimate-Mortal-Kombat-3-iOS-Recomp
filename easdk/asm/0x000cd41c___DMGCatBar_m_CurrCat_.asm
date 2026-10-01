========================================================================
-[DMGCatBar m_CurrCat]  0x000cd41c  16 bytes   DMGCatBar.mm
========================================================================

000cd41c  ldr     r3, [pc, #8]
000cd41e  add     r3, pc ; -> 0x000f9648  OBJC_IVAR_$_DMGCatBar.m_CurrCat
000cd420  ldr     r3, [r3]
000cd422  ldr     r0, [r0, r3]
000cd424  bx      lr
000cd426  nop     
000cd428  stm     r2!, {r1, r2, r5}
000cd42a  movs    r2, r0
