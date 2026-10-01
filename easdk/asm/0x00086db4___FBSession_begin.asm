========================================================================
-[FBSession begin  0x00086db4  120 bytes   FBSession.m
========================================================================

00086db4  push    {r4, r5, r6, r7, lr}
00086db6  add     r7, sp, #0xc
00086db8  ldr     r1, [pc, #0x54]
00086dba  mov     r6, r0
00086dbc  add     r1, pc ; -> 0x000f5d14  OBJC_IVAR_$_FBSession._uid
00086dbe  ldr     r1, [r1]
00086dc0  add     r1, r0
00086dc2  stm.w   r1, {r2, r3}
00086dc6  ldr     r1, [pc, #0x4c]
00086dc8  ldr     r3, [pc, #0x4c]
00086dca  ldr     r0, [sp, #0x14]
00086dcc  add     r1, pc ; -> 0x000fce18  
00086dce  add     r3, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
00086dd0  ldr     r5, [r1]
00086dd2  ldr     r4, [r3]
00086dd4  mov     r1, r5
00086dd6  blx     #0xddbfc ; -> objc_msgSend
00086dda  ldr     r3, [pc, #0x40]
00086ddc  mov     r1, r5
00086dde  add     r3, pc ; -> 0x000f5d1c  OBJC_IVAR_$_FBSession._sessionSecret
00086de0  str     r0, [r6, r4]
00086de2  ldr     r0, [sp, #0x18]
00086de4  ldr     r4, [r3]
00086de6  blx     #0xddbfc ; -> objc_msgSend
00086dea  ldr     r1, [pc, #0x34]
00086dec  ldr     r3, [pc, #0x34]
00086dee  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00086df0  add     r3, pc ; -> 0x000f5d20  OBJC_IVAR_$_FBSession._expirationDate
00086df2  ldr     r1, [r1]
00086df4  str     r0, [r6, r4]
00086df6  ldr     r0, [sp, #0x1c]
00086df8  ldr     r4, [r3]
00086dfa  blx     #0xddbfc ; -> objc_msgSend
00086dfe  ldr     r1, [pc, #0x28]
00086e00  add     r1, pc ; -> 0x000fcecc  'e@\x0e'
00086e02  ldr     r1, [r1]
00086e04  str     r0, [r6, r4]
00086e06  mov     r0, r6
00086e08  blx     #0xddbfc ; -> objc_msgSend
00086e0c  pop     {r4, r5, r6, r7, pc}
00086e0e  nop     
00086e10  vhadd.s16 d16, d4, d6
00086e14  str     r0, [r1, #4]
00086e16  movs    r7, r0
00086e18  vhadd.s8 d16, d6, d6
