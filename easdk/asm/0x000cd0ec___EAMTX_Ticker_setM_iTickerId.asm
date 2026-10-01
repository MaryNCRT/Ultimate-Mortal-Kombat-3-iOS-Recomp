========================================================================
-[EAMTX_Ticker setM_iTickerId  0x000cd0ec  16 bytes   EAMTX_Ticker.mm
========================================================================

000cd0ec  ldr     r3, [pc, #8]
000cd0ee  add     r3, pc ; -> 0x000f9644  OBJC_IVAR_$_EAMTX_Ticker.m_iTickerId
000cd0f0  ldr     r3, [r3]
000cd0f2  str     r2, [r0, r3]
000cd0f4  bx      lr
000cd0f6  nop     
000cd0f8  stm     r5!, {r1, r4, r6}
000cd0fa  movs    r2, r0
