========================================================================
-[EAMTX_Controller mFreeSpace]  0x000ca4dc  16 bytes   EAMTX_Controller.mm
========================================================================

000ca4dc  ldr     r3, [pc, #8]
000ca4de  add     r3, pc ; -> 0x000f9158  OBJC_IVAR_$_EAMTX_Controller.mFreeSpace
000ca4e0  ldr     r3, [r3]
000ca4e2  adds    r0, r0, r3
000ca4e4  ldm     r0, {r0, r1}
000ca4e6  bx      lr
000ca4e8  ldcl    p0, c0, [r6], #-8
