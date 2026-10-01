========================================================================
-[DMGCatBar dealloc]  0x000cd42c  180 bytes   DMGCatBar.mm
========================================================================

000cd42c  push    {r4, r5, r7, lr}
000cd42e  add     r7, sp, #8
000cd430  sub     sp, #8
000cd432  ldr     r3, [pc, #0x84]
000cd434  ldr     r1, [pc, #0x84]
000cd436  mov     r5, r0
000cd438  add     r3, pc ; -> 0x000f9648  OBJC_IVAR_$_DMGCatBar.m_CurrCat
000cd43a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cd43c  ldr     r3, [r3]
000cd43e  ldr     r4, [r1]
000cd440  ldr     r0, [r0, r3]
000cd442  mov     r1, r4
000cd444  blx     #0xddbfc ; -> objc_msgSend
000cd448  ldr     r3, [pc, #0x74]
000cd44a  mov     r1, r4
000cd44c  add     r3, pc ; -> 0x000f9800  OBJC_IVAR_$_DMGCatBar.background
000cd44e  ldr     r3, [r3]
000cd450  ldr     r0, [r5, r3]
000cd452  blx     #0xddbfc ; -> objc_msgSend
000cd456  ldr     r3, [pc, #0x6c]
000cd458  mov     r1, r4
000cd45a  add     r3, pc ; -> 0x000f97ec  OBJC_IVAR_$_DMGCatBar.buttonNew
000cd45c  ldr     r3, [r3]
000cd45e  ldr     r0, [r5, r3]
000cd460  blx     #0xddbfc ; -> objc_msgSend
000cd464  ldr     r3, [pc, #0x60]
000cd466  mov     r1, r4
000cd468  add     r3, pc ; -> 0x000f97fc  OBJC_IVAR_$_DMGCatBar.buttonSoon
000cd46a  ldr     r3, [r3]
000cd46c  ldr     r0, [r5, r3]
000cd46e  blx     #0xddbfc ; -> objc_msgSend
000cd472  ldr     r3, [pc, #0x58]
000cd474  mov     r1, r4
000cd476  add     r3, pc ; -> 0x000f97f8  OBJC_IVAR_$_DMGCatBar.buttonAll
000cd478  ldr     r3, [r3]
000cd47a  ldr     r0, [r5, r3]
000cd47c  blx     #0xddbfc ; -> objc_msgSend
000cd480  ldr     r3, [pc, #0x4c]
000cd482  mov     r1, r4
000cd484  add     r3, pc ; -> 0x000f97f0  OBJC_IVAR_$_DMGCatBar.buttonHot
000cd486  ldr     r3, [r3]
000cd488  ldr     r0, [r5, r3]
000cd48a  blx     #0xddbfc ; -> objc_msgSend
000cd48e  ldr     r3, [pc, #0x44]
000cd490  mov     r1, r4
000cd492  add     r3, pc ; -> 0x000f97f4  OBJC_IVAR_$_DMGCatBar.buttonYou
000cd494  ldr     r3, [r3]
000cd496  ldr     r0, [r5, r3]
000cd498  blx     #0xddbfc ; -> objc_msgSend
000cd49c  ldr     r3, [pc, #0x38]
000cd49e  ldr     r1, [pc, #0x3c]
000cd4a0  mov     r0, sp
000cd4a2  add     r3, pc ; -> 0x000fddb4  
000cd4a4  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000cd4a6  ldr     r3, [r3]
000cd4a8  ldr     r1, [r1]
000cd4aa  str     r5, [sp]
000cd4ac  str     r3, [sp, #4]
000cd4ae  blx     #0xddc08 ; -> objc_msgSendSuper2
000cd4b2  sub.w   sp, r7, #8
000cd4b6  pop     {r4, r5, r7, pc}
000cd4b8  stm     r2!, {r2, r3}
000cd4ba  movs    r2, r0
