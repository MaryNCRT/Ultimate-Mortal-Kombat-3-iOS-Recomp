========================================================================
-[EAMTX_UserInfo m_bUserRegistered]  0x000c9398  16 bytes   EAMTX_UserInfo.mm
========================================================================

000c9398  ldr     r3, [pc, #8]
000c939a  add     r3, pc ; -> 0x000f8bcc  OBJC_IVAR_$_EAMTX_UserInfo.m_bUserRegistered
000c939c  ldr     r3, [r3]
000c939e  ldrb    r0, [r0, r3]
000c93a0  bx      lr
000c93a2  nop     
000c93a4  strh.w  r0, [lr, r2]
