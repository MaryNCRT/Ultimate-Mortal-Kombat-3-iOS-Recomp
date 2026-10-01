========================================================================
-[DMGController setMContext  0x000cf004  40 bytes   DMGController.mm
========================================================================

000cf004  push    {r7, lr}
000cf006  add     r7, sp, #0
000cf008  sub     sp, #8
000cf00a  mov     r3, r2
000cf00c  ldr     r2, [pc, #0x18]
000cf00e  mov.w   ip, #0
000cf012  add     r2, pc ; -> 0x000f9a30  OBJC_IVAR_$_DMGController.mContext
000cf014  ldr     r2, [r2]
000cf016  str.w   ip, [sp]
000cf01a  str.w   ip, [sp, #4]
000cf01e  blx     #0xddc20 ; -> objc_setProperty
000cf022  sub.w   sp, r7, #0
000cf026  pop     {r7, pc}
000cf028  add     r2, sp, #0x68
000cf02a  movs    r2, r0
