========================================================================
-[EAMTX_Ticker m_URL]  0x000cd0bc  16 bytes   EAMTX_Ticker.mm
========================================================================

000cd0bc  ldr     r3, [pc, #8]
000cd0be  add     r3, pc ; -> 0x000f94a8  OBJC_IVAR_$_EAMTX_Ticker.m_URL
000cd0c0  ldr     r3, [r3]
000cd0c2  ldr     r0, [r0, r3]
000cd0c4  bx      lr
000cd0c6  nop     
000cd0c8  stm     r3!, {r1, r2, r5, r6, r7}
000cd0ca  movs    r2, r0
