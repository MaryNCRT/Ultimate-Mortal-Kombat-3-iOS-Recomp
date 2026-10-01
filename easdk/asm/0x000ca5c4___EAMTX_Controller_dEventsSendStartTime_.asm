========================================================================
-[EAMTX_Controller dEventsSendStartTime]  0x000ca5c4  16 bytes   EAMTX_Controller.mm
========================================================================

000ca5c4  ldr     r3, [pc, #8]
000ca5c6  add     r3, pc ; -> 0x000f9144  OBJC_IVAR_$_EAMTX_Controller.dEventsSendStartTime
000ca5c8  ldr     r3, [r3]
000ca5ca  adds    r0, r0, r3
000ca5cc  ldm     r0, {r0, r1}
000ca5ce  bx      lr
000ca5d0  sbcs.w  r0, sl, r2
