========================================================================
-[DMGController setWindow  0x000cef64  40 bytes   DMGController.mm
========================================================================

000cef64  push    {r7, lr}
000cef66  add     r7, sp, #0
000cef68  sub     sp, #8
000cef6a  mov     r3, r2
000cef6c  ldr     r2, [pc, #0x18]
000cef6e  mov.w   ip, #0
000cef72  add     r2, pc ; -> 0x000f9a2c  OBJC_IVAR_$_DMGController.window
000cef74  ldr     r2, [r2]
000cef76  str.w   ip, [sp]
000cef7a  str.w   ip, [sp, #4]
000cef7e  blx     #0xddc20 ; -> objc_setProperty
000cef82  sub.w   sp, r7, #0
000cef86  pop     {r7, pc}
000cef88  add     r2, sp, #0x2d8
000cef8a  movs    r2, r0
