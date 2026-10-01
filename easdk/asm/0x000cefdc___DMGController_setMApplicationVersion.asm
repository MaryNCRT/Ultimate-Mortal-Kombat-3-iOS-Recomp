========================================================================
-[DMGController setMApplicationVersion  0x000cefdc  40 bytes   DMGController.mm
========================================================================

000cefdc  push    {r7, lr}
000cefde  add     r7, sp, #0
000cefe0  sub     sp, #8
000cefe2  mov     r3, r2
000cefe4  ldr     r2, [pc, #0x18]
000cefe6  mov.w   ip, #0
000cefea  add     r2, pc ; -> 0x000f9a3c  OBJC_IVAR_$_DMGController.mApplicationVersion
000cefec  ldr     r2, [r2]
000cefee  str.w   ip, [sp]
000ceff2  str.w   ip, [sp, #4]
000ceff6  blx     #0xddc20 ; -> objc_setProperty
000ceffa  sub.w   sp, r7, #0
000ceffe  pop     {r7, pc}
000cf000  add     r2, sp, #0x138
000cf002  movs    r2, r0
