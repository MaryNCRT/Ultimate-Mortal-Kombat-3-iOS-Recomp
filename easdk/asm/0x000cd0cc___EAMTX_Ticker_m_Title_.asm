========================================================================
-[EAMTX_Ticker m_Title]  0x000cd0cc  16 bytes   EAMTX_Ticker.mm
========================================================================

000cd0cc  ldr     r3, [pc, #8]
000cd0ce  add     r3, pc ; -> 0x000f94a4  OBJC_IVAR_$_EAMTX_Ticker.m_Title
000cd0d0  ldr     r3, [r3]
000cd0d2  ldr     r0, [r0, r3]
000cd0d4  bx      lr
000cd0d6  nop     
000cd0d8  stm     r3!, {r1, r4, r6, r7}
000cd0da  movs    r2, r0
