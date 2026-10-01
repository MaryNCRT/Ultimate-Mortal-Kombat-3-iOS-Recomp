========================================================================
-[EAMTX_Message messageId]  0x000d267c  16 bytes   EAMTX_Message.mm
========================================================================

000d267c  ldr     r3, [pc, #8]
000d267e  add     r3, pc ; -> 0x000fa2e8  OBJC_IVAR_$_EAMTX_Message.mID
000d2680  ldr     r3, [r3]
000d2682  ldr     r0, [r0, r3]
000d2684  bx      lr
000d2686  nop     
000d2688  ldrb    r6, [r4, #0x11]
000d268a  movs    r2, r0
