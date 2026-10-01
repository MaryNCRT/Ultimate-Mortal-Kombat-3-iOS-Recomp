========================================================================
-[EAMTX_UserInfo setM_DeviceToken  0x000ca2fc  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca2fc  push    {r7, lr}
000ca2fe  add     r7, sp, #0
000ca300  sub     sp, #8
000ca302  mov     r3, r2
000ca304  ldr     r2, [pc, #0x18]
000ca306  mov.w   ip, #0
000ca30a  add     r2, pc ; -> 0x000f8504  OBJC_IVAR_$_EAMTX_UserInfo.m_DeviceToken
000ca30c  ldr     r2, [r2]
000ca30e  str.w   ip, [sp]
000ca312  str.w   ip, [sp, #4]
000ca316  blx     #0xddc20 ; -> objc_setProperty
000ca31a  sub.w   sp, r7, #0
000ca31e  pop     {r7, pc}
000ca320  b       #0xca710
000ca322  movs    r2, r0
