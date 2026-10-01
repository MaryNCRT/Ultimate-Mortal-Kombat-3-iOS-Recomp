========================================================================
-[FBStreamDialog setAttachment  0x00087e18  44 bytes   FBStreamDialog.m
========================================================================

00087e18  push    {r7, lr}
00087e1a  add     r7, sp, #0
00087e1c  sub     sp, #8
00087e1e  mov     r3, r2
00087e20  ldr     r2, [pc, #0x1c]
00087e22  mov.w   ip, #0
00087e26  add     r2, pc ; -> 0x000f5e9c  OBJC_IVAR_$_FBStreamDialog._attachment
00087e28  ldr     r2, [r2]
00087e2a  str.w   ip, [sp]
00087e2e  add.w   ip, ip, #1
00087e32  str.w   ip, [sp, #4]
00087e36  blx     #0xddc20 ; -> objc_setProperty
00087e3a  sub.w   sp, r7, #0
00087e3e  pop     {r7, pc}
00087e40  b       #0x87f28
00087e42  movs    r6, r0
