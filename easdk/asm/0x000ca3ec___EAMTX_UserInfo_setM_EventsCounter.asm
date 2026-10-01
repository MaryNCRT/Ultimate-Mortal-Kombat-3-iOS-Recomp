========================================================================
-[EAMTX_UserInfo setM_EventsCounter  0x000ca3ec  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca3ec  push    {r7, lr}
000ca3ee  add     r7, sp, #0
000ca3f0  sub     sp, #8
000ca3f2  mov     r3, r2
000ca3f4  ldr     r2, [pc, #0x18]
000ca3f6  mov.w   ip, #0
000ca3fa  add     r2, pc ; -> 0x000f8514  OBJC_IVAR_$_EAMTX_UserInfo.m_EventsCounter
000ca3fc  ldr     r2, [r2]
000ca3fe  str.w   ip, [sp]
000ca402  str.w   ip, [sp, #4]
000ca406  blx     #0xddc20 ; -> objc_setProperty
000ca40a  sub.w   sp, r7, #0
000ca40e  pop     {r7, pc}
000ca410  b       #0xca640
000ca412  movs    r2, r0
