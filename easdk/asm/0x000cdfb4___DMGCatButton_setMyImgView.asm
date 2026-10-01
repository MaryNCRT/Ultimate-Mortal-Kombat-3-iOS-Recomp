========================================================================
-[DMGCatButton setMyImgView  0x000cdfb4  40 bytes   DMGCatButton.m
========================================================================

000cdfb4  push    {r7, lr}
000cdfb6  add     r7, sp, #0
000cdfb8  sub     sp, #8
000cdfba  mov     r3, r2
000cdfbc  ldr     r2, [pc, #0x18]
000cdfbe  mov.w   ip, #0
000cdfc2  add     r2, pc ; -> 0x000f9a10  OBJC_IVAR_$_DMGCatButton.myImgView
000cdfc4  ldr     r2, [r2]
000cdfc6  str.w   ip, [sp]
000cdfca  str.w   ip, [sp, #4]
000cdfce  blx     #0xddc20 ; -> objc_setProperty
000cdfd2  sub.w   sp, r7, #0
000cdfd6  pop     {r7, pc}
000cdfd8  rev16   r2, r1
000cdfda  movs    r2, r0
