========================================================================
-[DMGCatButton initWithTitle  0x000ce004  464 bytes   DMGCatButton.m
========================================================================

000ce004  push    {r4, r5, r6, r7, lr}
000ce006  add     r7, sp, #0xc
000ce008  push.w  {r8, sl, fp}
000ce00c  sub     sp, #0x20
000ce00e  ldr     r1, [pc, #0x160]
000ce010  mov     fp, r3
000ce012  ldr     r3, [pc, #0x160]
000ce014  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000ce016  str     r0, [sp, #0x18]
000ce018  add     r3, pc ; -> 0x000fddb8  
000ce01a  ldr.w   sl, [r1]
000ce01e  ldr     r3, [r3]
000ce020  add     r0, sp, #0x18
000ce022  mov     r5, r2
000ce024  mov     r1, sl
000ce026  ldrsb.w r6, [sp, #0x40]
000ce02a  str     r3, [sp, #0x1c]
000ce02c  blx     #0xddc08 ; -> objc_msgSendSuper2
000ce030  mov     r4, r0
000ce032  cmp     r0, #0
000ce034  beq.w   #0xce162
000ce038  ldr     r1, [pc, #0x13c]
000ce03a  mov     r2, r5
000ce03c  add     r1, pc ; -> 0x000fd20c  
000ce03e  ldr     r1, [r1]
000ce040  blx     #0xddbfc ; -> objc_msgSend
000ce044  ldr.w   r1, [pc, #0x134]
000ce048  mov     r2, r6
000ce04a  mov     r0, r4
000ce04c  add     r1, pc ; -> 0x000fdb38  
000ce04e  ldr     r1, [r1]
000ce050  blx     #0xddbfc ; -> objc_msgSend
000ce054  ldr     r1, [pc, #0x128]
000ce056  ldr     r0, [pc, #0x12c]
000ce058  ldr     r3, [pc, #0x12c]
000ce05a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000ce05c  add     r0, pc ; -> 0x000fdbc8  
000ce05e  ldr.w   r8, [r1]
000ce062  add     r3, pc ; -> 0x000f9a10  OBJC_IVAR_$_DMGCatButton.myImgView
000ce064  ldr     r0, [r0]
000ce066  ldr     r5, [r3]
000ce068  mov     r1, r8
000ce06a  blx     #0xddbfc ; -> objc_msgSend
000ce06e  ldr     r3, [pc, #0x11c]
000ce070  ldr     r1, [pc, #0x11c]
000ce072  add     r3, pc ; -> 0x000f3310  DMG_BUTTON_WIDTH
000ce074  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000ce076  ldr     r3, [r3]
000ce078  ldr.w   ip, [r1]
000ce07c  ldr     r2, [r3]
000ce07e  ldr     r3, [pc, #0x114]
000ce080  add     r3, pc ; -> 0x000f330c  DMG_BUTTON_HEIGHT
000ce082  str     r2, [sp, #0x10]
000ce084  ldr     r3, [r3]
000ce086  add     r2, sp, #8
000ce088  ldr     r3, [r3]
000ce08a  str     r3, [sp, #0x14]
000ce08c  movs    r3, #0
000ce08e  str     r3, [sp, #0xc]
000ce090  str     r3, [sp, #8]
000ce092  mov     lr, r0
000ce094  add     r0, sp, #0x10
000ce096  ldm     r0, {r0, r1}
000ce098  stm.w   sp, {r0, r1}
000ce09c  mov     r1, ip
000ce09e  mov     r0, lr
000ce0a0  ldm     r2, {r2, r3}
000ce0a2  blx     #0xddbfc ; -> objc_msgSend
000ce0a6  mov     r1, r8
000ce0a8  str     r0, [r4, r5]
000ce0aa  ldr     r0, [pc, #0xec]
000ce0ac  ldr     r5, [pc, #0xec]
000ce0ae  add     r0, pc ; -> 0x000fdbd0  
000ce0b0  add     r5, pc ; -> 0x000f9a0c  OBJC_IVAR_$_DMGCatButton.myTitleLabel
000ce0b2  ldr     r0, [r0]
000ce0b4  ldr     r6, [r5]
000ce0b6  blx     #0xddbfc ; -> objc_msgSend
000ce0ba  mov     r1, sl
000ce0bc  blx     #0xddbfc ; -> objc_msgSend
000ce0c0  ldr     r1, [pc, #0xdc]
000ce0c2  mov     r2, fp
000ce0c4  add     r1, pc ; -> 0x000fcc80  '\x1e,\x0e'
000ce0c6  ldr     r1, [r1]
000ce0c8  str     r0, [r4, r6]
000ce0ca  ldr     r3, [r5]
000ce0cc  ldr     r0, [r4, r3]
000ce0ce  blx     #0xddbfc ; -> objc_msgSend
000ce0d2  ldr     r0, [pc, #0xd0]
000ce0d4  ldr     r1, [pc, #0xd0]
000ce0d6  add     r0, pc ; -> 0x000fdbc4  
000ce0d8  add     r1, pc ; -> 0x000fcccc  '%-\x0e'
000ce0da  ldr     r6, [r0]
000ce0dc  ldr     r1, [r1]
000ce0de  mov     r0, r6
000ce0e0  blx     #0xddbfc ; -> objc_msgSend
000ce0e4  ldr     r1, [pc, #0xc4]
000ce0e6  ldr     r3, [r5]
000ce0e8  add     r1, pc ; -> 0x000fccc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x350
000ce0ea  ldr     r1, [r1]
000ce0ec  mov     r2, r0
000ce0ee  ldr     r0, [r4, r3]
000ce0f0  blx     #0xddbfc ; -> objc_msgSend
000ce0f4  ldr     r1, [pc, #0xb8]
000ce0f6  mov     r0, r6
000ce0f8  add     r1, pc ; -> 0x000fcca0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x328
000ce0fa  ldr     r1, [r1]
000ce0fc  blx     #0xddbfc ; -> objc_msgSend
000ce100  ldr     r1, [pc, #0xb0]
000ce102  ldr     r3, [r5]
000ce104  add     r1, pc ; -> 0x000fcc7c  '\x10,\x0e'
000ce106  ldr     r1, [r1]
000ce108  mov     r2, r0
000ce10a  ldr     r0, [r4, r3]
000ce10c  blx     #0xddbfc ; -> objc_msgSend
000ce110  ldr     r1, [pc, #0xa4]
000ce112  ldr     r3, [r5]
000ce114  movs    r2, #1
000ce116  add     r1, pc ; -> 0x000fdaf8  '\x1f&\x0f'
000ce118  ldr     r0, [r4, r3]
000ce11a  ldr     r1, [r1]
000ce11c  blx     #0xddbfc ; -> objc_msgSend
000ce120  ldr     r0, [pc, #0x98]
000ce122  ldr     r1, [pc, #0x9c]
000ce124  ldr     r2, [pc, #0x9c]
000ce126  add     r0, pc ; -> 0x000fdba0  
000ce128  add     r1, pc ; -> 0x000fcb80  ',\x1f\x0e'
000ce12a  ldr     r0, [r0]
000ce12c  ldr     r1, [r1]
000ce12e  blx     #0xddbfc ; -> objc_msgSend
000ce132  ldr     r1, [pc, #0x94]
000ce134  ldr     r3, [r5]
000ce136  add     r1, pc ; -> 0x000fcc88  'E,\x0e'
000ce138  ldr     r1, [r1]
000ce13a  mov     r2, r0
000ce13c  ldr     r0, [r4, r3]
000ce13e  blx     #0xddbfc ; -> objc_msgSend
000ce142  ldr     r1, [pc, #0x88]
000ce144  ldr     r3, [r5]
000ce146  movs    r2, #4
000ce148  add     r1, pc ; -> 0x000fdb34  'K(\x0f'
000ce14a  ldr     r0, [r4, r3]
000ce14c  ldr     r1, [r1]
000ce14e  blx     #0xddbfc ; -> objc_msgSend
000ce152  ldr     r1, [pc, #0x7c]
000ce154  ldr     r3, [r5]
000ce156  movs    r2, #2
000ce158  add     r1, pc ; -> 0x000fdb30  '9(\x0f'
000ce15a  ldr     r0, [r4, r3]
000ce15c  ldr     r1, [r1]
000ce15e  blx     #0xddbfc ; -> objc_msgSend
000ce162  mov     r0, r4
000ce164  sub.w   sp, r7, #0x18
000ce168  pop.w   {r8, sl, fp}
000ce16c  pop     {r4, r5, r6, r7, pc}
000ce16e  nop     
000ce170  strd    r0, r0, [r8, #-0x8]!
000ce174  ldc2    p0, c0, [ip, #8]
000ce178  rsb.w   r0, ip, #2
