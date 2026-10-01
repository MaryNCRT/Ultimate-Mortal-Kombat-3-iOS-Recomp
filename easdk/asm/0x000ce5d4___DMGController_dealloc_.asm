========================================================================
-[DMGController dealloc]  0x000ce5d4  180 bytes   DMGController.mm
========================================================================

000ce5d4  push    {r4, r5, r7, lr}
000ce5d6  add     r7, sp, #8
000ce5d8  sub     sp, #8
000ce5da  ldr     r5, [pc, #0x84]
000ce5dc  mov     r4, r0
000ce5de  add     r5, pc ; -> 0x000f9a38  OBJC_IVAR_$_DMGController.mTargetURL
000ce5e0  ldr     r0, [r5]
000ce5e2  ldr     r0, [r4, r0]
000ce5e4  cbz     r0, #0xce5f6
000ce5e6  ldr     r1, [pc, #0x7c]
000ce5e8  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000ce5ea  ldr     r1, [r1]
000ce5ec  blx     #0xddbfc ; -> objc_msgSend
000ce5f0  ldr     r3, [r5]
000ce5f2  movs    r2, #0
000ce5f4  str     r2, [r4, r3]
000ce5f6  ldr     r5, [pc, #0x70]
000ce5f8  add     r5, pc ; -> 0x000f9a34  OBJC_IVAR_$_DMGController.mLangCode
000ce5fa  ldr     r0, [r5]
000ce5fc  ldr     r0, [r4, r0]
000ce5fe  cbz     r0, #0xce610
000ce600  ldr     r1, [pc, #0x68]
000ce602  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000ce604  ldr     r1, [r1]
000ce606  blx     #0xddbfc ; -> objc_msgSend
000ce60a  ldr     r3, [r5]
000ce60c  movs    r2, #0
000ce60e  str     r2, [r4, r3]
000ce610  ldr     r5, [pc, #0x5c]
000ce612  add     r5, pc ; -> 0x000f9e44  OBJC_IVAR_$_DMGController.strings
000ce614  ldr     r0, [r5]
000ce616  ldr     r0, [r4, r0]
000ce618  cbz     r0, #0xce62a
000ce61a  ldr     r1, [pc, #0x58]
000ce61c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000ce61e  ldr     r1, [r1]
000ce620  blx     #0xddbfc ; -> objc_msgSend
000ce624  ldr     r3, [r5]
000ce626  movs    r2, #0
000ce628  str     r2, [r4, r3]
000ce62a  ldr     r5, [pc, #0x4c]
000ce62c  add     r5, pc ; -> 0x000f9a28  OBJC_IVAR_$_DMGController.dmgView
000ce62e  ldr     r0, [r5]
000ce630  ldr     r0, [r4, r0]
000ce632  cbz     r0, #0xce644
000ce634  ldr     r1, [pc, #0x44]
000ce636  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000ce638  ldr     r1, [r1]
000ce63a  blx     #0xddbfc ; -> objc_msgSend
000ce63e  ldr     r3, [r5]
000ce640  movs    r2, #0
000ce642  str     r2, [r4, r3]
000ce644  ldr     r3, [pc, #0x38]
000ce646  ldr     r1, [pc, #0x3c]
000ce648  mov     r0, sp
000ce64a  add     r3, pc ; -> 0x000fddbc  
000ce64c  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000ce64e  ldr     r3, [r3]
000ce650  ldr     r1, [r1]
000ce652  str     r4, [sp]
000ce654  str     r3, [sp, #4]
000ce656  blx     #0xddc08 ; -> objc_msgSendSuper2
000ce65a  sub.w   sp, r7, #8
000ce65e  pop     {r4, r5, r7, pc}
000ce660  push    {r1, r2, r4, r6}
000ce662  movs    r2, r0
000ce664  b       #0xced88
000ce666  movs    r2, r0
000ce668  push    {r3, r4, r5}
000ce66a  movs    r2, r0
000ce66c  b       #0xced5c
000ce66e  movs    r2, r0
