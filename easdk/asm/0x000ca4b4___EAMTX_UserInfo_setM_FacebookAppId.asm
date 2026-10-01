========================================================================
-[EAMTX_UserInfo setM_FacebookAppId  0x000ca4b4  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca4b4  push    {r7, lr}
000ca4b6  add     r7, sp, #0
000ca4b8  sub     sp, #8
000ca4ba  mov     r3, r2
000ca4bc  ldr     r2, [pc, #0x18]
000ca4be  mov.w   ip, #0
000ca4c2  add     r2, pc ; -> 0x000f852c  OBJC_IVAR_$_EAMTX_UserInfo.m_FacebookAppId
000ca4c4  ldr     r2, [r2]
000ca4c6  str.w   ip, [sp]
000ca4ca  str.w   ip, [sp, #4]
000ca4ce  blx     #0xddc20 ; -> objc_setProperty
000ca4d2  sub.w   sp, r7, #0
000ca4d6  pop     {r7, pc}
000ca4d8  b       #0xca5a8
000ca4da  movs    r2, r0
