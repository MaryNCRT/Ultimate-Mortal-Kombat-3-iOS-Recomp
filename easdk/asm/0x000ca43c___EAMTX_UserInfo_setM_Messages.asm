========================================================================
-[EAMTX_UserInfo setM_Messages  0x000ca43c  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca43c  push    {r7, lr}
000ca43e  add     r7, sp, #0
000ca440  sub     sp, #8
000ca442  mov     r3, r2
000ca444  ldr     r2, [pc, #0x18]
000ca446  mov.w   ip, #0
000ca44a  add     r2, pc ; -> 0x000f851c  OBJC_IVAR_$_EAMTX_UserInfo.m_Messages
000ca44c  ldr     r2, [r2]
000ca44e  str.w   ip, [sp]
000ca452  str.w   ip, [sp, #4]
000ca456  blx     #0xddc20 ; -> objc_setProperty
000ca45a  sub.w   sp, r7, #0
000ca45e  pop     {r7, pc}
000ca460  b       #0xca600
000ca462  movs    r2, r0
