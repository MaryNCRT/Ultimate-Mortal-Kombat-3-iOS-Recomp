========================================================================
-[EAMTX_UserInfo setM_Country  0x000ca3c4  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca3c4  push    {r7, lr}
000ca3c6  add     r7, sp, #0
000ca3c8  sub     sp, #8
000ca3ca  mov     r3, r2
000ca3cc  ldr     r2, [pc, #0x18]
000ca3ce  mov.w   ip, #0
000ca3d2  add     r2, pc ; -> 0x000f8530  OBJC_IVAR_$_EAMTX_UserInfo.m_Country
000ca3d4  ldr     r2, [r2]
000ca3d6  str.w   ip, [sp]
000ca3da  str.w   ip, [sp, #4]
000ca3de  blx     #0xddc20 ; -> objc_setProperty
000ca3e2  sub.w   sp, r7, #0
000ca3e6  pop     {r7, pc}
000ca3e8  b       #0xca6a0
000ca3ea  movs    r2, r0
