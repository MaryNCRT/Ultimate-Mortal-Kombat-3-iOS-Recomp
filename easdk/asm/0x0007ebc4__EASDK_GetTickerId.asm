========================================================================
EASDK_GetTickerId  0x0007ebc4  16 bytes   EASDK_Handler.mm
========================================================================

0007ebc4  ldr     r3, [pc, #8]
0007ebc6  add     r3, pc ; -> 0x000f3374  OBJC_IVAR_$_EAMTX_Ticker.m_iTickerId
0007ebc8  ldr     r3, [r3]
0007ebca  ldr     r3, [r3]
0007ebcc  ldr     r0, [r0, r3]
0007ebce  bx      lr
