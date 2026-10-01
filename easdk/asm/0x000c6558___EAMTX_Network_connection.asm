========================================================================
-[EAMTX_Network connection  0x000c6558  68 bytes   EAMTX_Network.mm
========================================================================

000c6558  push    {r4, r5, r7, lr}
000c655a  add     r7, sp, #8
000c655c  ldr     r4, [pc, #0x2c]
000c655e  ldr     r1, [pc, #0x30]
000c6560  mov     r5, r0
000c6562  add     r4, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c6564  add     r1, pc ; -> 0x000fcd0c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x394
000c6566  ldr     r2, [r4]
000c6568  ldr     r1, [r1]
000c656a  ldr     r0, [r0, r2]
000c656c  mov     r2, r3
000c656e  blx     #0xddbfc ; -> objc_msgSend
000c6572  ldr     r1, [pc, #0x20]
000c6574  ldr     r0, [r4]
000c6576  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000c6578  ldr     r0, [r5, r0]
000c657a  ldr     r1, [r1]
000c657c  blx     #0xddbfc ; -> objc_msgSend
000c6580  ldr     r3, [pc, #0x14]
000c6582  add     r3, pc ; -> 0x000f3334  downloadedBytesSize
000c6584  ldr     r3, [r3]
000c6586  str     r0, [r3]
000c6588  pop     {r4, r5, r7, pc}
000c658a  nop     
000c658c  adds    r6, r6, r0
000c658e  movs    r3, r0
000c6590  str     r4, [r4, #0x78]
000c6592  movs    r3, r0
000c6594  str     r6, [r7, #0x4c]
000c6596  movs    r3, r0
000c6598  ldm     r5, {r1, r2, r3, r5, r7}
000c659a  movs    r2, r0
