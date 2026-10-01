========================================================================
-[EAMTX_Controller setMFreeSpace  0x000ca4ec  20 bytes   EAMTX_Controller.mm
========================================================================

000ca4ec  ldr     r1, [pc, #0xc]
000ca4ee  add     r1, pc ; -> 0x000f9158  OBJC_IVAR_$_EAMTX_Controller.mFreeSpace
000ca4f0  ldr     r1, [r1]
000ca4f2  adds    r0, r0, r1
000ca4f4  stm.w   r0, {r2, r3}
000ca4f8  bx      lr
000ca4fa  nop     
000ca4fc  stcl    p0, c0, [r6], #-8
