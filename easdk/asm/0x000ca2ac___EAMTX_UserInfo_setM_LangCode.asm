========================================================================
-[EAMTX_UserInfo setM_LangCode  0x000ca2ac  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca2ac  push    {r7, lr}
000ca2ae  add     r7, sp, #0
000ca2b0  sub     sp, #8
000ca2b2  mov     r3, r2
000ca2b4  ldr     r2, [pc, #0x18]
000ca2b6  mov.w   ip, #0
000ca2ba  add     r2, pc ; -> 0x000f84fc  OBJC_IVAR_$_EAMTX_UserInfo.m_LangCode
000ca2bc  ldr     r2, [r2]
000ca2be  str.w   ip, [sp]
000ca2c2  str.w   ip, [sp, #4]
000ca2c6  blx     #0xddc20 ; -> objc_setProperty
000ca2ca  sub.w   sp, r7, #0
000ca2ce  pop     {r7, pc}
000ca2d0  b       #0xca750
000ca2d2  movs    r2, r0
