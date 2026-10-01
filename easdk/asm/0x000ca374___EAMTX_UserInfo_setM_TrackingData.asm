========================================================================
-[EAMTX_UserInfo setM_TrackingData  0x000ca374  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca374  push    {r7, lr}
000ca376  add     r7, sp, #0
000ca378  sub     sp, #8
000ca37a  mov     r3, r2
000ca37c  ldr     r2, [pc, #0x18]
000ca37e  mov.w   ip, #0
000ca382  add     r2, pc ; -> 0x000f8510  OBJC_IVAR_$_EAMTX_UserInfo.m_TrackingData
000ca384  ldr     r2, [r2]
000ca386  str.w   ip, [sp]
000ca38a  str.w   ip, [sp, #4]
000ca38e  blx     #0xddc20 ; -> objc_setProperty
000ca392  sub.w   sp, r7, #0
000ca396  pop     {r7, pc}
000ca398  b       #0xca6b0
000ca39a  movs    r2, r0
