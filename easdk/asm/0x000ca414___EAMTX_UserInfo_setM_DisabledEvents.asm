========================================================================
-[EAMTX_UserInfo setM_DisabledEvents  0x000ca414  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca414  push    {r7, lr}
000ca416  add     r7, sp, #0
000ca418  sub     sp, #8
000ca41a  mov     r3, r2
000ca41c  ldr     r2, [pc, #0x18]
000ca41e  mov.w   ip, #0
000ca422  add     r2, pc ; -> 0x000f8518  OBJC_IVAR_$_EAMTX_UserInfo.m_DisabledEvents
000ca424  ldr     r2, [r2]
000ca426  str.w   ip, [sp]
000ca42a  str.w   ip, [sp, #4]
000ca42e  blx     #0xddc20 ; -> objc_setProperty
000ca432  sub.w   sp, r7, #0
000ca436  pop     {r7, pc}
000ca438  b       #0xca620
000ca43a  movs    r2, r0
