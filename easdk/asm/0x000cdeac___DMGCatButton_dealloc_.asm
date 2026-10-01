========================================================================
-[DMGCatButton dealloc]  0x000cdeac  144 bytes   DMGCatButton.m
========================================================================

000cdeac  push    {r4, r5, r7, lr}
000cdeae  add     r7, sp, #8
000cdeb0  sub     sp, #8
000cdeb2  ldr     r3, [pc, #0x68]
000cdeb4  ldr     r1, [pc, #0x68]
000cdeb6  mov     r5, r0
000cdeb8  add     r3, pc ; -> 0x000f9a18  OBJC_IVAR_$_DMGCatButton.m_SelImg
000cdeba  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cdebc  ldr     r3, [r3]
000cdebe  ldr     r4, [r1]
000cdec0  ldr     r0, [r0, r3]
000cdec2  mov     r1, r4
000cdec4  blx     #0xddbfc ; -> objc_msgSend
000cdec8  ldr     r3, [pc, #0x58]
000cdeca  mov     r1, r4
000cdecc  add     r3, pc ; -> 0x000f9a1c  OBJC_IVAR_$_DMGCatButton.m_RegImg
000cdece  ldr     r3, [r3]
000cded0  ldr     r0, [r5, r3]
000cded2  blx     #0xddbfc ; -> objc_msgSend
000cded6  ldr     r3, [pc, #0x50]
000cded8  mov     r1, r4
000cdeda  add     r3, pc ; -> 0x000f9a10  OBJC_IVAR_$_DMGCatButton.myImgView
000cdedc  ldr     r3, [r3]
000cdede  ldr     r0, [r5, r3]
000cdee0  blx     #0xddbfc ; -> objc_msgSend
000cdee4  ldr     r3, [pc, #0x44]
000cdee6  mov     r1, r4
000cdee8  add     r3, pc ; -> 0x000f9a14  OBJC_IVAR_$_DMGCatButton.m_Title
000cdeea  ldr     r3, [r3]
000cdeec  ldr     r0, [r5, r3]
000cdeee  blx     #0xddbfc ; -> objc_msgSend
000cdef2  ldr     r3, [pc, #0x3c]
000cdef4  mov     r1, r4
000cdef6  add     r3, pc ; -> 0x000f9a0c  OBJC_IVAR_$_DMGCatButton.myTitleLabel
000cdef8  ldr     r3, [r3]
000cdefa  ldr     r0, [r5, r3]
000cdefc  blx     #0xddbfc ; -> objc_msgSend
000cdf00  ldr     r3, [pc, #0x30]
000cdf02  ldr     r1, [pc, #0x34]
000cdf04  mov     r0, sp
000cdf06  add     r3, pc ; -> 0x000fddb8  
000cdf08  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000cdf0a  ldr     r3, [r3]
000cdf0c  ldr     r1, [r1]
000cdf0e  str     r5, [sp]
000cdf10  str     r3, [sp, #4]
000cdf12  blx     #0xddc08 ; -> objc_msgSendSuper2
000cdf16  sub.w   sp, r7, #8
000cdf1a  pop     {r4, r5, r7, pc}
000cdf1c  cbnz    r4, #0xcdf76
000cdf1e  movs    r2, r0
