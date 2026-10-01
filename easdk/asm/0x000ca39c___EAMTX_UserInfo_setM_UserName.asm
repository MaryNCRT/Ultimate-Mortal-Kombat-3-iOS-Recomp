========================================================================
-[EAMTX_UserInfo setM_UserName  0x000ca39c  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca39c  push    {r7, lr}
000ca39e  add     r7, sp, #0
000ca3a0  sub     sp, #8
000ca3a2  mov     r3, r2
000ca3a4  ldr     r2, [pc, #0x18]
000ca3a6  mov.w   ip, #0
000ca3aa  add     r2, pc ; -> 0x000f8534  OBJC_IVAR_$_EAMTX_UserInfo.m_UserName
000ca3ac  ldr     r2, [r2]
000ca3ae  str.w   ip, [sp]
000ca3b2  str.w   ip, [sp, #4]
000ca3b6  blx     #0xddc20 ; -> objc_setProperty
000ca3ba  sub.w   sp, r7, #0
000ca3be  pop     {r7, pc}
000ca3c0  b       #0xca6d0
000ca3c2  movs    r2, r0
