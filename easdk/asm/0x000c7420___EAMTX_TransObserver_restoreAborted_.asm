========================================================================
-[EAMTX_TransObserver restoreAborted]  0x000c7420  24 bytes   EAMTX_TransObserver.mm
========================================================================

000c7420  ldr     r3, [pc, #0x10]
000c7422  add     r3, pc ; -> 0x000f7fd0  OBJC_IVAR_$_EAMTX_TransObserver.m_RestoreState
000c7424  ldr     r3, [r3]
000c7426  ldr     r0, [r0, r3]
000c7428  cmp     r0, #1
000c742a  ite     ls
000c742c  movls   r0, #0
000c742e  movhi   r0, #1
000c7430  bx      lr
000c7432  nop     
000c7434  lsrs    r2, r5, #0xe
000c7436  movs    r3, r0
