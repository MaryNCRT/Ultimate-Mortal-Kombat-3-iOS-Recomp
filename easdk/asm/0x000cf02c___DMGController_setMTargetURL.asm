========================================================================
-[DMGController setMTargetURL  0x000cf02c  40 bytes   DMGController.mm
========================================================================

000cf02c  push    {r7, lr}
000cf02e  add     r7, sp, #0
000cf030  sub     sp, #8
000cf032  mov     r3, r2
000cf034  ldr     r2, [pc, #0x18]
000cf036  mov.w   ip, #0
000cf03a  add     r2, pc ; -> 0x000f9a38  OBJC_IVAR_$_DMGController.mTargetURL
000cf03c  ldr     r2, [r2]
000cf03e  str.w   ip, [sp]
000cf042  str.w   ip, [sp, #4]
000cf046  blx     #0xddc20 ; -> objc_setProperty
000cf04a  sub.w   sp, r7, #0
000cf04e  pop     {r7, pc}
000cf050  add     r1, sp, #0x3e8
000cf052  movs    r2, r0
