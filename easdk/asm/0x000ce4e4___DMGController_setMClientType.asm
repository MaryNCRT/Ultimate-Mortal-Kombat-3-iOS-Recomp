========================================================================
-[DMGController setMClientType  0x000ce4e4  16 bytes   DMGController.mm
========================================================================

000ce4e4  ldr     r3, [pc, #8]
000ce4e6  add     r3, pc ; -> 0x000f9e58  OBJC_IVAR_$_DMGController.mClientType
000ce4e8  ldr     r3, [r3]
000ce4ea  str     r2, [r0, r3]
000ce4ec  bx      lr
000ce4ee  nop     
000ce4f0  cbnz    r6, #0xce50e
000ce4f2  movs    r2, r0
