========================================================================
-[EAMTX_UserInfo m_bAppLoggingDisabled]  0x000c9328  16 bytes   EAMTX_UserInfo.mm
========================================================================

000c9328  ldr     r3, [pc, #8]
000c932a  add     r3, pc ; -> 0x000f8bd0  OBJC_IVAR_$_EAMTX_UserInfo.m_bAppLoggingDisabled
000c932c  ldr     r3, [r3]
000c932e  ldrb    r0, [r0, r3]
000c9330  bx      lr
000c9332  nop     
000c9334  strh.w  r0, [r2, #2]
