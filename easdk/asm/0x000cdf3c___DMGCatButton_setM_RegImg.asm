========================================================================
-[DMGCatButton setM_RegImg  0x000cdf3c  40 bytes   DMGCatButton.m
========================================================================

000cdf3c  push    {r7, lr}
000cdf3e  add     r7, sp, #0
000cdf40  sub     sp, #8
000cdf42  mov     r3, r2
000cdf44  ldr     r2, [pc, #0x18]
000cdf46  mov.w   ip, #0
000cdf4a  add     r2, pc ; -> 0x000f9a1c  OBJC_IVAR_$_DMGCatButton.m_RegImg
000cdf4c  ldr     r2, [r2]
000cdf4e  str.w   ip, [sp]
000cdf52  str.w   ip, [sp, #4]
000cdf56  blx     #0xddc20 ; -> objc_setProperty
000cdf5a  sub.w   sp, r7, #0
000cdf5e  pop     {r7, pc}
000cdf60  revsh   r6, r1
000cdf62  movs    r2, r0
