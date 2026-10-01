========================================================================
-[EAMTX_Network setNetworkState  0x000c5cd4  16 bytes   EAMTX_Network.mm
========================================================================

000c5cd4  ldr     r3, [pc, #8]
000c5cd6  add     r3, pc ; -> 0x000f7d88  OBJC_IVAR_$_EAMTX_Network.networkState
000c5cd8  ldr     r3, [r3]
000c5cda  str     r2, [r0, r3]
000c5cdc  bx      lr
000c5cde  nop     
000c5ce0  movs    r0, #0xae
000c5ce2  movs    r3, r0
