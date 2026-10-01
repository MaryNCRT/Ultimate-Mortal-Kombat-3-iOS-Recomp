========================================================================
-[FBStreamDialog setUserMessagePrompt  0x00087e9c  44 bytes   FBStreamDialog.m
========================================================================

00087e9c  push    {r7, lr}
00087e9e  add     r7, sp, #0
00087ea0  sub     sp, #8
00087ea2  mov     r3, r2
00087ea4  ldr     r2, [pc, #0x1c]
00087ea6  mov.w   ip, #0
00087eaa  add     r2, pc ; -> 0x000f5e90  OBJC_IVAR_$_FBStreamDialog._userMessagePrompt
00087eac  ldr     r2, [r2]
00087eae  str.w   ip, [sp]
00087eb2  add.w   ip, ip, #1
00087eb6  str.w   ip, [sp, #4]
00087eba  blx     #0xddc20 ; -> objc_setProperty
00087ebe  sub.w   sp, r7, #0
00087ec2  pop     {r7, pc}
00087ec4  svc     #0xe2
00087ec6  movs    r6, r0
