========================================================================
EASDK_GetLoadedTicker  0x0007ed90  84 bytes   EASDK_Handler.mm
========================================================================

0007ed90  push    {r4, r5, r6, r7, lr}
0007ed92  add     r7, sp, #0xc
0007ed94  ldr     r4, [pc, #0x3c]
0007ed96  mov     r5, r0
0007ed98  add     r4, pc ; -> 0x00175890  tickers
0007ed9a  ldr     r0, [r4]
0007ed9c  cbnz    r0, #0x7eda2
0007ed9e  movs    r0, #0
0007eda0  pop     {r4, r5, r6, r7, pc}
0007eda2  ldr     r1, [pc, #0x34]
0007eda4  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
0007eda6  ldr     r6, [r1]
0007eda8  mov     r1, r6
0007edaa  blx     #0xddbfc ; -> objc_msgSend
0007edae  subs    r0, #1
0007edb0  cmp     r5, r0
0007edb2  bhi     #0x7ed9e
0007edb4  ldr     r0, [r4]
0007edb6  mov     r1, r6
0007edb8  blx     #0xddbfc ; -> objc_msgSend
0007edbc  cmp     r0, #0
0007edbe  beq     #0x7ed9e
0007edc0  ldr     r0, [pc, #0x18]
0007edc2  ldr     r1, [pc, #0x1c]
0007edc4  mov     r2, r5
0007edc6  add     r0, pc ; -> 0x00175890  tickers
0007edc8  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
0007edca  ldr     r0, [r0]
0007edcc  ldr     r1, [r1]
0007edce  blx     #0xddbfc ; -> objc_msgSend
0007edd2  b       #0x7eda0
0007edd4  ldr     r4, [r6, #0x2c]
0007edd6  movs    r7, r1
0007edd8  bgt     #0x7ed8c
0007edda  movs    r7, r0
0007eddc  ldr     r6, [r0, #0x2c]
0007edde  movs    r7, r1
0007ede0  bgt     #0x7ed44
0007ede2  movs    r7, r0
