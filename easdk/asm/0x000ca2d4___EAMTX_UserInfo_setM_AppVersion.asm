========================================================================
-[EAMTX_UserInfo setM_AppVersion  0x000ca2d4  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca2d4  push    {r7, lr}
000ca2d6  add     r7, sp, #0
000ca2d8  sub     sp, #8
000ca2da  mov     r3, r2
000ca2dc  ldr     r2, [pc, #0x18]
000ca2de  mov.w   ip, #0
000ca2e2  add     r2, pc ; -> 0x000f8500  OBJC_IVAR_$_EAMTX_UserInfo.m_AppVersion
000ca2e4  ldr     r2, [r2]
000ca2e6  str.w   ip, [sp]
000ca2ea  str.w   ip, [sp, #4]
000ca2ee  blx     #0xddc20 ; -> objc_setProperty
000ca2f2  sub.w   sp, r7, #0
000ca2f6  pop     {r7, pc}
000ca2f8  b       #0xca730
000ca2fa  movs    r2, r0
