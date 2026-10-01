========================================================================
-[EAMTX_Ticker m_Message]  0x000cd0ac  16 bytes   EAMTX_Ticker.mm
========================================================================

000cd0ac  ldr     r3, [pc, #8]
000cd0ae  add     r3, pc ; -> 0x000f94ac  OBJC_IVAR_$_EAMTX_Ticker.m_Message
000cd0b0  ldr     r3, [r3]
000cd0b2  ldr     r0, [r0, r3]
000cd0b4  bx      lr
000cd0b6  nop     
000cd0b8  stm     r3!, {r1, r3, r4, r5, r6, r7}
000cd0ba  movs    r2, r0
