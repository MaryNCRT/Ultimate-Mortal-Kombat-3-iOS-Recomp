========================================================================
-[EAMTX_Controller setBForcePostEventsData  0x000ca590  16 bytes   EAMTX_Controller.mm
========================================================================

000ca590  ldr     r3, [pc, #8]
000ca592  add     r3, pc ; -> 0x000f914c  OBJC_IVAR_$_EAMTX_Controller.bForcePostEventsData
000ca594  ldr     r3, [r3]
000ca596  strb    r2, [r0, r3]
000ca598  bx      lr
000ca59a  nop     
000ca59c  subs.w  r0, r6, r2
