========================================================================
-[EAMTX_UserInfo m_bUserLoggingDisabled]  0x000c9348  16 bytes   EAMTX_UserInfo.mm
========================================================================

000c9348  ldr     r3, [pc, #8]
000c934a  add     r3, pc ; -> 0x000f8bd4  OBJC_IVAR_$_EAMTX_UserInfo.m_bUserLoggingDisabled
000c934c  ldr     r3, [r3]
000c934e  ldrb    r0, [r0, r3]
000c9350  bx      lr
000c9352  nop     
000c9354  strb.w  r0, [r6, #2]
