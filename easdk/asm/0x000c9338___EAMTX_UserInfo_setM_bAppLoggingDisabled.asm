========================================================================
-[EAMTX_UserInfo setM_bAppLoggingDisabled  0x000c9338  16 bytes   EAMTX_UserInfo.mm
========================================================================

000c9338  ldr     r3, [pc, #8]
000c933a  add     r3, pc ; -> 0x000f8bd0  OBJC_IVAR_$_EAMTX_UserInfo.m_bAppLoggingDisabled
000c933c  ldr     r3, [r3]
000c933e  strb    r2, [r0, r3]
000c9340  bx      lr
000c9342  nop     
000c9344  ldrb.w  r0, [r2, #2]
