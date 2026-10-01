========================================================================
-[EAMTX_UserInfo setM_ItemsLastUpdatedTime  0x000ca34c  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca34c  push    {r7, lr}
000ca34e  add     r7, sp, #0
000ca350  sub     sp, #8
000ca352  mov     r3, r2
000ca354  ldr     r2, [pc, #0x18]
000ca356  mov.w   ip, #0
000ca35a  add     r2, pc ; -> 0x000f850c  OBJC_IVAR_$_EAMTX_UserInfo.m_ItemsLastUpdatedTime
000ca35c  ldr     r2, [r2]
000ca35e  str.w   ip, [sp]
000ca362  str.w   ip, [sp, #4]
000ca366  blx     #0xddc20 ; -> objc_setProperty
000ca36a  sub.w   sp, r7, #0
000ca36e  pop     {r7, pc}
000ca370  b       #0xca6d0
000ca372  movs    r2, r0
