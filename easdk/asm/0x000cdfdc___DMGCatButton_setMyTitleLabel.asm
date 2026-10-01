========================================================================
-[DMGCatButton setMyTitleLabel  0x000cdfdc  40 bytes   DMGCatButton.m
========================================================================

000cdfdc  push    {r7, lr}
000cdfde  add     r7, sp, #0
000cdfe0  sub     sp, #8
000cdfe2  mov     r3, r2
000cdfe4  ldr     r2, [pc, #0x18]
000cdfe6  mov.w   ip, #0
000cdfea  add     r2, pc ; -> 0x000f9a0c  OBJC_IVAR_$_DMGCatButton.myTitleLabel
000cdfec  ldr     r2, [r2]
000cdfee  str.w   ip, [sp]
000cdff2  str.w   ip, [sp, #4]
000cdff6  blx     #0xddc20 ; -> objc_setProperty
000cdffa  sub.w   sp, r7, #0
000cdffe  pop     {r7, pc}
000ce000  rev     r6, r3
000ce002  movs    r2, r0
