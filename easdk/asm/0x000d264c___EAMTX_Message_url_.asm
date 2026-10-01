========================================================================
-[EAMTX_Message url]  0x000d264c  16 bytes   EAMTX_Message.mm
========================================================================

000d264c  ldr     r3, [pc, #8]
000d264e  add     r3, pc ; -> 0x000fa2cc  OBJC_IVAR_$_EAMTX_Message.mURL
000d2650  ldr     r3, [r3]
000d2652  ldr     r0, [r0, r3]
000d2654  bx      lr
000d2656  nop     
000d2658  ldrb    r2, [r7, #0x11]
000d265a  movs    r2, r0
