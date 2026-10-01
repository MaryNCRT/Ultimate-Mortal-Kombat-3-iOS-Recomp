========================================================================
-[EAMTX_UserInfo setM_ListLastUpdatedTime  0x000ca324  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca324  push    {r7, lr}
000ca326  add     r7, sp, #0
000ca328  sub     sp, #8
000ca32a  mov     r3, r2
000ca32c  ldr     r2, [pc, #0x18]
000ca32e  mov.w   ip, #0
000ca332  add     r2, pc ; -> 0x000f8508  OBJC_IVAR_$_EAMTX_UserInfo.m_ListLastUpdatedTime
000ca334  ldr     r2, [r2]
000ca336  str.w   ip, [sp]
000ca33a  str.w   ip, [sp, #4]
000ca33e  blx     #0xddc20 ; -> objc_setProperty
000ca342  sub.w   sp, r7, #0
000ca346  pop     {r7, pc}
000ca348  b       #0xca6f0
000ca34a  movs    r2, r0
