========================================================================
-[DMGCatButton setM_SelImg  0x000cdf64  40 bytes   DMGCatButton.m
========================================================================

000cdf64  push    {r7, lr}
000cdf66  add     r7, sp, #0
000cdf68  sub     sp, #8
000cdf6a  mov     r3, r2
000cdf6c  ldr     r2, [pc, #0x18]
000cdf6e  mov.w   ip, #0
000cdf72  add     r2, pc ; -> 0x000f9a18  OBJC_IVAR_$_DMGCatButton.m_SelImg
000cdf74  ldr     r2, [r2]
000cdf76  str.w   ip, [sp]
000cdf7a  str.w   ip, [sp, #4]
000cdf7e  blx     #0xddc20 ; -> objc_setProperty
000cdf82  sub.w   sp, r7, #0
000cdf86  pop     {r7, pc}
