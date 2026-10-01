========================================================================
-[EAMTX_Message message]  0x000d265c  16 bytes   EAMTX_Message.mm
========================================================================

000d265c  ldr     r3, [pc, #8]
000d265e  add     r3, pc ; -> 0x000fa2d4  OBJC_IVAR_$_EAMTX_Message.mMessage
000d2660  ldr     r3, [r3]
000d2662  ldr     r0, [r0, r3]
000d2664  bx      lr
000d2666  nop     
000d2668  ldrb    r2, [r6, #0x11]
000d266a  movs    r2, r0
