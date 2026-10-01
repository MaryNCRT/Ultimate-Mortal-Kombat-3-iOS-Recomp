========================================================================
-[DMGController exitDMG]  0x000ce858  152 bytes   DMGController.mm
========================================================================

000ce858  push    {r4, r7, lr}
000ce85a  add     r7, sp, #4
000ce85c  ldr     r3, [pc, #0x64]
000ce85e  movs    r2, #1
000ce860  ldr     r1, [pc, #0x64]
000ce862  add     r3, pc ; -> 0x000f9e54  OBJC_IVAR_$_DMGController.exitedDMG
000ce864  mov     r4, r0
000ce866  ldr     r3, [r3]
000ce868  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000ce86a  ldr     r1, [r1]
000ce86c  strb    r2, [r0, r3]
000ce86e  ldr     r3, [pc, #0x5c]
000ce870  add     r3, pc ; -> 0x000f9a28  OBJC_IVAR_$_DMGController.dmgView
000ce872  ldr     r3, [r3]
000ce874  ldr     r0, [r0, r3]
000ce876  blx     #0xddbfc ; -> objc_msgSend
000ce87a  ldr     r1, [pc, #0x54]
000ce87c  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000ce87e  ldr     r1, [r1]
000ce880  blx     #0xddbfc ; -> objc_msgSend
000ce884  ldr     r3, [pc, #0x4c]
000ce886  ldr     r1, [pc, #0x50]
000ce888  add     r3, pc ; -> 0x000f9a2c  OBJC_IVAR_$_DMGController.window
000ce88a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000ce88c  ldr     r3, [r3]
000ce88e  ldr     r1, [r1]
000ce890  ldr     r0, [r4, r3]
000ce892  blx     #0xddbfc ; -> objc_msgSend
000ce896  ldr     r3, [pc, #0x44]
000ce898  add     r3, pc ; -> 0x000f9e58  OBJC_IVAR_$_DMGController.mClientType
000ce89a  ldr     r0, [r3]
000ce89c  ldr     r0, [r4, r0]
000ce89e  cmp     r0, #1
000ce8a0  beq     #0xce8c2
000ce8a2  ldr     r0, [pc, #0x3c]
000ce8a4  ldr     r1, [pc, #0x3c]
000ce8a6  add     r0, pc ; -> 0x000fdb80  
000ce8a8  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000ce8aa  ldr     r0, [r0]
000ce8ac  ldr     r1, [r1]
000ce8ae  blx     #0xddbfc ; -> objc_msgSend
000ce8b2  ldr     r1, [pc, #0x34]
000ce8b4  ldr     r2, [pc, #0x34]
000ce8b6  add     r1, pc ; -> 0x000fcafc  ']\x1a\x0e'
000ce8b8  add     r2, pc ; -> 0x0038c1e8  prevOrientation
000ce8ba  ldr     r1, [r1]
000ce8bc  ldr     r2, [r2]
000ce8be  blx     #0xddbfc ; -> objc_msgSend
000ce8c2  pop     {r4, r7, pc}
000ce8c4  push    {r1, r2, r3, r5, r6, r7, lr}
000ce8c6  movs    r2, r0
000ce8c8  b       #0xcee5c
000ce8ca  movs    r2, r0
000ce8cc  cbz     r4, #0xce8fc
000ce8ce  movs    r2, r0
000ce8d0  b       #0xce1b4
000ce8d2  movs    r2, r0
000ce8d4  cbz     r0, #0xce900
000ce8d6  movs    r2, r0
000ce8d8  b       #0xceab8
000ce8da  movs    r2, r0
000ce8dc  push    {r2, r3, r4, r5, r7, lr}
000ce8de  movs    r2, r0
