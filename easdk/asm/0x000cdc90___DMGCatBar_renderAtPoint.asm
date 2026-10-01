========================================================================
-[DMGCatBar renderAtPoint  0x000cdc90  380 bytes   DMGCatBar.mm
========================================================================

000cdc90  push    {r4, r5, r6, r7, lr}
000cdc92  add     r7, sp, #0xc
000cdc94  push.w  {r8, sl}
000cdc98  vpush   {d8}
000cdc9c  sub     sp, #0x28
000cdc9e  ldr     r3, [pc, #0x138]
000cdca0  ldr     r5, [pc, #0x138]
000cdca2  mov     r4, r0
000cdca4  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000cdca6  add     r5, pc ; -> 0x000f9800  OBJC_IVAR_$_DMGCatBar.background
000cdca8  ldr     r3, [r3]
000cdcaa  ldr     r0, [r5]
000cdcac  ldr     r1, [pc, #0x130]
000cdcae  ldr     r2, [pc, #0x134]
000cdcb0  ldr     r3, [r3]
000cdcb2  ldr     r6, [r4, r0]
000cdcb4  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
000cdcb6  add     r0, sp, #0x18
000cdcb8  vldr    s16, [pc, #0x118]
000cdcbc  ldr.w   lr, [r1]
000cdcc0  str     r2, [sp, #0x24]
000cdcc2  str     r3, [sp, #0x20]
000cdcc4  vstr    s16, [sp, #0x1c]
000cdcc8  vstr    s16, [sp, #0x18]
000cdccc  ldm     r0, {r0, r1, r2, r3}
000cdcce  add.w   ip, sp, #8
000cdcd2  stm.w   ip, {r0, r1, r2, r3}
000cdcd6  add     r0, sp, #0x10
000cdcd8  ldm     r0, {r0, r1}
000cdcda  stm.w   sp, {r0, r1}
000cdcde  mov     r1, lr
000cdce0  ldm.w   ip, {r2, r3}
000cdce4  mov     r0, r6
000cdce6  blx     #0xddbfc ; -> objc_msgSend
000cdcea  ldr     r1, [pc, #0xfc]
000cdcec  mov     r0, r4
000cdcee  vmov    r6, s16
000cdcf2  add     r1, pc ; -> 0x000fdb0c  "\r'\x0f"
000cdcf4  ldr     r1, [r1]
000cdcf6  blx     #0xddbfc ; -> objc_msgSend
000cdcfa  ldr     r1, [pc, #0xf0]
000cdcfc  ldr     r3, [r5]
000cdcfe  mov     r0, r4
000cdd00  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000cdd02  ldr     r2, [r4, r3]
000cdd04  ldr     r1, [r1]
000cdd06  blx     #0xddbfc ; -> objc_msgSend
000cdd0a  ldr     r3, [pc, #0xe4]
000cdd0c  ldr     r1, [pc, #0xe4]
000cdd0e  add     r3, pc ; -> 0x000f97f4  OBJC_IVAR_$_DMGCatBar.buttonYou
000cdd10  add     r1, pc ; -> 0x000fdb08  "M'\x0f"
000cdd12  ldr     r3, [r3]
000cdd14  ldr.w   r8, [r1]
000cdd18  ldr     r0, [r4, r3]
000cdd1a  ldr     r3, [pc, #0xdc]
000cdd1c  mov     r1, r8
000cdd1e  add     r3, pc ; -> 0x000f3310  DMG_BUTTON_WIDTH
000cdd20  ldr.w   sl, [r3]
000cdd24  vmov    r3, s16
000cdd28  vldr    s14, [sl]
000cdd2c  vmul.f32 d5, d7, d8
000cdd30  vmov    r2, s10
000cdd34  str     r4, [sp]
000cdd36  blx     #0xddbfc ; -> objc_msgSend
000cdd3a  ldr     r3, [pc, #0xc0]
000cdd3c  ldr.w   r5, [sl]
000cdd40  mov     r1, r8
000cdd42  add     r3, pc ; -> 0x000f97ec  OBJC_IVAR_$_DMGCatBar.buttonNew
000cdd44  ldr     r3, [r3]
000cdd46  mov     r2, r5
000cdd48  str     r4, [sp]
000cdd4a  ldr     r0, [r4, r3]
000cdd4c  vmov    r3, s16
000cdd50  blx     #0xddbfc ; -> objc_msgSend
000cdd54  ldr     r3, [pc, #0xa8]
000cdd56  vldr    s14, [sl]
000cdd5a  mov     r1, r8
000cdd5c  add     r3, pc ; -> 0x000f97f0  OBJC_IVAR_$_DMGCatBar.buttonHot
000cdd5e  vadd.f32 d7, d7, d7
000cdd62  ldr     r3, [r3]
000cdd64  vmov    r2, s14
000cdd68  str     r4, [sp]
000cdd6a  ldr     r0, [r4, r3]
000cdd6c  vmov    r3, s16
000cdd70  blx     #0xddbfc ; -> objc_msgSend
000cdd74  vmov.f32 s14, #3.000000e+00
000cdd78  ldr     r3, [pc, #0x88]
000cdd7a  vldr    s12, [sl]
000cdd7e  mov     r1, r8
000cdd80  add     r3, pc ; -> 0x000f97f8  OBJC_IVAR_$_DMGCatBar.buttonAll
000cdd82  ldr     r3, [r3]
000cdd84  str     r4, [sp]
000cdd86  vmul.f32 d5, d6, d7
000cdd8a  ldr     r0, [r4, r3]
000cdd8c  vmov    r2, s10
000cdd90  vmov    r3, s16
000cdd94  blx     #0xddbfc ; -> objc_msgSend
000cdd98  vmov.f32 s14, #4.000000e+00
000cdd9c  ldr     r3, [pc, #0x68]
000cdd9e  vldr    s12, [sl]
000cdda2  mov     r1, r8
000cdda4  add     r3, pc ; -> 0x000f97fc  OBJC_IVAR_$_DMGCatBar.buttonSoon
000cdda6  ldr     r3, [r3]
000cdda8  str     r4, [sp]
000cddaa  vmul.f32 d5, d6, d7
000cddae  ldr     r0, [r4, r3]
000cddb0  vmov    r2, s10
000cddb4  vmov    r3, s16
000cddb8  vmov    r5, s10
000cddbc  blx     #0xddbfc ; -> objc_msgSend
000cddc0  sub.w   sp, r7, #0x1c
000cddc4  vpop    {d8}
000cddc8  sub.w   sp, r7, #0x14
000cddcc  pop.w   {r8, sl}
000cddd0  pop     {r4, r5, r6, r7, pc}
000cddd2  nop     
000cddd4  movs    r0, r0
000cddd6  movs    r0, r0
000cddd8  ldrsb   r0, [r6, r2]
000cddda  movs    r2, r0
000cdddc  cbnz    r6, #0xcde34
000cddde  movs    r2, r0
000cdde0  eors    r0, r8, #2
000cdde4  movs    r0, r0
000cdde6  rsbs    r0, r1, #0
000cdde8  cdp2    p0, #1, c0, c6, c2, #0
000cddec  cdp     p0, #4, c0, c0, c2, #0
000cddf0  revsh   r2, r4
000cddf2  movs    r2, r0
000cddf4  ldc2l   p0, c0, [r4, #8]!
000cddf8  strb    r6, [r5, r7]
000cddfa  movs    r2, r0
