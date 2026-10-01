========================================================================
-[DMGController getString  0x000ce6a8  36 bytes   DMGController.mm
========================================================================

000ce6a8  push    {r7, lr}
000ce6aa  add     r7, sp, #0
000ce6ac  ldr     r3, [pc, #0x14]
000ce6ae  add     r3, pc ; -> 0x000f9e44  OBJC_IVAR_$_DMGController.strings
000ce6b0  ldr     r3, [r3]
000ce6b2  ldr     r0, [r0, r3]
000ce6b4  cbz     r0, #0xce6c0
000ce6b6  ldr     r1, [pc, #0x10]
000ce6b8  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000ce6ba  ldr     r1, [r1]
000ce6bc  blx     #0xddbfc ; -> objc_msgSend
000ce6c0  pop     {r7, pc}
000ce6c2  nop     
