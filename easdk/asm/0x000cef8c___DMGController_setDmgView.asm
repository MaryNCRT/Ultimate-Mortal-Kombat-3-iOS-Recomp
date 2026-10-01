========================================================================
-[DMGController setDmgView  0x000cef8c  40 bytes   DMGController.mm
========================================================================

000cef8c  push    {r7, lr}
000cef8e  add     r7, sp, #0
000cef90  sub     sp, #8
000cef92  mov     r3, r2
000cef94  ldr     r2, [pc, #0x18]
000cef96  mov.w   ip, #0
000cef9a  add     r2, pc ; -> 0x000f9a28  OBJC_IVAR_$_DMGController.dmgView
000cef9c  ldr     r2, [r2]
000cef9e  str.w   ip, [sp]
000cefa2  str.w   ip, [sp, #4]
000cefa6  blx     #0xddc20 ; -> objc_setProperty
000cefaa  sub.w   sp, r7, #0
000cefae  pop     {r7, pc}
000cefb0  add     r2, sp, #0x228
000cefb2  movs    r2, r0
