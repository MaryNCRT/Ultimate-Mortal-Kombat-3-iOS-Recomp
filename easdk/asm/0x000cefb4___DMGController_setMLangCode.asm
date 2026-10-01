========================================================================
-[DMGController setMLangCode  0x000cefb4  40 bytes   DMGController.mm
========================================================================

000cefb4  push    {r7, lr}
000cefb6  add     r7, sp, #0
000cefb8  sub     sp, #8
000cefba  mov     r3, r2
000cefbc  ldr     r2, [pc, #0x18]
000cefbe  mov.w   ip, #0
000cefc2  add     r2, pc ; -> 0x000f9a34  OBJC_IVAR_$_DMGController.mLangCode
000cefc4  ldr     r2, [r2]
000cefc6  str.w   ip, [sp]
000cefca  str.w   ip, [sp, #4]
000cefce  blx     #0xddc20 ; -> objc_setProperty
000cefd2  sub.w   sp, r7, #0
000cefd6  pop     {r7, pc}
000cefd8  add     r2, sp, #0x1b8
000cefda  movs    r2, r0
