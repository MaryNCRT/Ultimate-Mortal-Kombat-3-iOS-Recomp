========================================================================
-[DMGCatButton setM_Title  0x000cdf8c  40 bytes   DMGCatButton.m
========================================================================

000cdf8c  push    {r7, lr}
000cdf8e  add     r7, sp, #0
000cdf90  sub     sp, #8
000cdf92  mov     r3, r2
000cdf94  ldr     r2, [pc, #0x18]
000cdf96  mov.w   ip, #0
000cdf9a  add     r2, pc ; -> 0x000f9a14  OBJC_IVAR_$_DMGCatButton.m_Title
000cdf9c  ldr     r2, [r2]
000cdf9e  str.w   ip, [sp]
000cdfa2  str.w   ip, [sp, #4]
000cdfa6  blx     #0xddc20 ; -> objc_setProperty
000cdfaa  sub.w   sp, r7, #0
000cdfae  pop     {r7, pc}
000cdfb0  rev16   r6, r6
000cdfb2  movs    r2, r0
