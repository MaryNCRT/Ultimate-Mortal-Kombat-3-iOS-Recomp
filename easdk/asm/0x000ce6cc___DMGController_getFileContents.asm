========================================================================
-[DMGController getFileContents  0x000ce6cc  320 bytes   DMGController.mm
========================================================================

000ce6cc  push    {r4, r5, r6, r7, lr}
000ce6ce  add     r7, sp, #0xc
000ce6d0  push.w  {r8, sl, fp}
000ce6d4  sub     sp, #0xc
000ce6d6  ldr     r1, [pc, #0x104]
000ce6d8  mov     fp, r0
000ce6da  ldr     r0, [pc, #0x104]
000ce6dc  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000ce6de  mov     r6, r3
000ce6e0  ldr     r4, [r1]
000ce6e2  add     r0, pc ; -> 0x000fdc70  
000ce6e4  mov     r5, r2
000ce6e6  ldr     r0, [r0]
000ce6e8  mov     r1, r4
000ce6ea  blx     #0xddbfc ; -> objc_msgSend
000ce6ee  ldr     r1, [pc, #0xf4]
000ce6f0  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000ce6f2  ldr     r1, [r1]
000ce6f4  blx     #0xddbfc ; -> objc_msgSend
000ce6f8  mov     r1, r4
000ce6fa  movs    r4, #0
000ce6fc  str     r0, [sp, #4]
000ce6fe  ldr     r0, [pc, #0xe8]
000ce700  add     r0, pc ; -> 0x000fdb5c  
000ce702  ldr     r0, [r0]
000ce704  blx     #0xddbfc ; -> objc_msgSend
000ce708  ldr     r1, [pc, #0xe0]
000ce70a  mov     r2, r5
000ce70c  movs    r3, #0xa
000ce70e  add     r1, pc ; -> 0x000fd8c4  
000ce710  str     r4, [sp]
000ce712  ldr     r1, [r1]
000ce714  blx     #0xddbfc ; -> objc_msgSend
000ce718  ldr     r1, [pc, #0xd4]
000ce71a  add     r1, pc ; -> 0x000fd4b4  
000ce71c  ldr     r1, [r1]
000ce71e  str     r0, [sp, #8]
000ce720  ldr     r2, [sp, #8]
000ce722  ldr     r0, [sp, #4]
000ce724  blx     #0xddbfc ; -> objc_msgSend
000ce728  ldr     r1, [pc, #0xc8]
000ce72a  mov     r2, r6
000ce72c  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000ce72e  ldr.w   r8, [r1]
000ce732  mov     r1, r8
000ce734  blx     #0xddbfc ; -> objc_msgSend
000ce738  ldr     r1, [pc, #0xbc]
000ce73a  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000ce73c  ldr.w   sl, [r1]
000ce740  ldr     r1, [pc, #0xb8]
000ce742  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000ce744  ldr     r6, [r1]
000ce746  mov     r5, r0
000ce748  b       #0xce774
000ce74a  mov     r1, r6
000ce74c  mov     r2, r4
000ce74e  mov     r0, r5
000ce750  blx     #0xddbfc ; -> objc_msgSend
000ce754  ldr     r3, [pc, #0xa8]
000ce756  mov     r1, r8
000ce758  add     r3, pc ; -> 0x000f9a34  OBJC_IVAR_$_DMGController.mLangCode
000ce75a  ldr     r3, [r3]
000ce75c  ldr.w   r2, [fp, r3]
000ce760  blx     #0xddbfc ; -> objc_msgSend
000ce764  cbz     r0, #0xce772
000ce766  mov     r1, r6
000ce768  movs    r2, #0
000ce76a  blx     #0xddbfc ; -> objc_msgSend
000ce76e  cbnz    r0, #0xce7a2
000ce770  b       #0xce780
000ce772  adds    r4, #1
000ce774  mov     r0, r5
000ce776  mov     r1, sl
000ce778  blx     #0xddbfc ; -> objc_msgSend
000ce77c  cmp     r0, r4
000ce77e  bhi     #0xce74a
000ce780  movs    r4, #0
000ce782  b       #0xce7a8
000ce784  mov     r1, r6
000ce786  mov     r2, r4
000ce788  mov     r0, r5
000ce78a  blx     #0xddbfc ; -> objc_msgSend
000ce78e  ldr     r2, [pc, #0x74]
000ce790  mov     r1, r8
000ce792  add     r2, pc ; -> 0x00180974  
000ce794  blx     #0xddbfc ; -> objc_msgSend
000ce798  cbz     r0, #0xce7a6
000ce79a  mov     r1, r6
000ce79c  movs    r2, #0
000ce79e  blx     #0xddbfc ; -> objc_msgSend
000ce7a2  mov     sl, r0
000ce7a4  b       #0xce7b8
000ce7a6  adds    r4, #1
000ce7a8  mov     r0, r5
000ce7aa  mov     r1, sl
000ce7ac  blx     #0xddbfc ; -> objc_msgSend
000ce7b0  cmp     r0, r4
000ce7b2  bhi     #0xce784
000ce7b4  mov.w   sl, #0
000ce7b8  ldr     r1, [pc, #0x4c]
000ce7ba  ldr     r0, [sp, #8]
000ce7bc  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000ce7be  ldr     r4, [r1]
000ce7c0  mov     r1, r4
000ce7c2  blx     #0xddbfc ; -> objc_msgSend
000ce7c6  ldr     r0, [sp, #4]
000ce7c8  mov     r1, r4
000ce7ca  blx     #0xddbfc ; -> objc_msgSend
000ce7ce  mov     r0, sl
000ce7d0  sub.w   sp, r7, #0x18
000ce7d4  pop.w   {r8, sl, fp}
000ce7d8  pop     {r4, r5, r6, r7, pc}
000ce7da  nop     
000ce7dc  b       #0xced28
000ce7de  movs    r2, r0
