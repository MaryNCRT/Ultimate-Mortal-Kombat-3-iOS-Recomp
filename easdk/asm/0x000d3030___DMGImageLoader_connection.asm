========================================================================
-[DMGImageLoader connection  0x000d3030  36 bytes   DMGImageLoader.mm
========================================================================

000d3030  push    {r7, lr}
000d3032  add     r7, sp, #0
000d3034  ldr     r2, [pc, #0x14]
000d3036  ldr     r1, [pc, #0x18]
000d3038  add     r2, pc ; -> 0x000fa710  OBJC_IVAR_$_DMGImageLoader.loadedData
000d303a  add     r1, pc ; -> 0x000fcd0c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x394
000d303c  ldr     r2, [r2]
000d303e  ldr     r1, [r1]
000d3040  ldr     r0, [r0, r2]
000d3042  mov     r2, r3
000d3044  blx     #0xddbfc ; -> objc_msgSend
000d3048  pop     {r7, pc}
000d304a  nop     
000d304c  strb    r4, [r2, #0x1b]
000d304e  movs    r2, r0
000d3050  ldr     r4, [sp, #0x338]
000d3052  movs    r2, r0
