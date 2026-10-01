========================================================================
-[FBRequest setUserInfo  0x00086cb0  40 bytes   FBRequest.m
========================================================================

00086cb0  push    {r7, lr}
00086cb2  add     r7, sp, #0
00086cb4  sub     sp, #8
00086cb6  mov     r3, r2
00086cb8  ldr     r2, [pc, #0x18]
00086cba  mov.w   ip, #0
00086cbe  add     r2, pc ; -> 0x000f59bc  OBJC_IVAR_$_FBRequest._userInfo
00086cc0  ldr     r2, [r2]
00086cc2  str.w   ip, [sp]
00086cc6  str.w   ip, [sp, #4]
00086cca  blx     #0xddc20 ; -> objc_setProperty
00086cce  sub.w   sp, r7, #0
00086cd2  pop     {r7, pc}
00086cd4  ldcl    p0, c0, [sl], #0x18
