========================================================================
-[EAMTX_Ticker m_iTickerId]  0x000cd0dc  16 bytes   EAMTX_Ticker.mm
========================================================================

000cd0dc  ldr     r3, [pc, #8]
000cd0de  add     r3, pc ; -> 0x000f9644  OBJC_IVAR_$_EAMTX_Ticker.m_iTickerId
000cd0e0  ldr     r3, [r3]
000cd0e2  ldr     r0, [r0, r3]
000cd0e4  bx      lr
000cd0e6  nop     
000cd0e8  stm     r5!, {r1, r5, r6}
000cd0ea  movs    r2, r0
