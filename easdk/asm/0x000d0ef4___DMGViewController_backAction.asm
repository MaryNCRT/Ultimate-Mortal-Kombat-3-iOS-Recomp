========================================================================
-[DMGViewController backAction  0x000d0ef4  344 bytes   DMGViewController.mm
========================================================================

000d0ef4  push    {r4, r5, r6, r7, lr}
000d0ef6  add     r7, sp, #0xc
000d0ef8  push.w  {r8, sl, fp}
000d0efc  sub     sp, #0x70
000d0efe  ldr     r4, [pc, #0x11c]
000d0f00  ldr     r1, [pc, #0x11c]
000d0f02  mov     sl, r0
000d0f04  add     r4, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d0f06  add     r1, pc ; -> 0x000fda4c  '{\x14\x0f'
000d0f08  ldr     r3, [r4]
000d0f0a  ldr     r1, [r1]
000d0f0c  ldr     r0, [r0, r3]
000d0f0e  blx     #0xddbfc ; -> objc_msgSend
000d0f12  tst.w   r0, #0xff
000d0f16  bne     #0xd1010
000d0f18  ldr     r1, [pc, #0x108]
000d0f1a  ldr     r3, [r4]
000d0f1c  add     r1, pc ; -> 0x000fda48  
000d0f1e  ldr.w   r0, [sl, r3]
000d0f22  ldr     r1, [r1]
000d0f24  blx     #0xddbfc ; -> objc_msgSend
000d0f28  tst.w   r0, #0xff
000d0f2c  beq     #0xd1000
000d0f2e  b       #0xd1010
000d0f30  ldr     r1, [pc, #0xf4]
000d0f32  add     r1, pc ; -> 0x000fcc50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2d8
000d0f34  ldr     r1, [r1]
000d0f36  blx     #0xddbfc ; -> objc_msgSend
000d0f3a  ldr     r3, [pc, #0xf0]
000d0f3c  add     r3, pc ; -> 0x000fa2b4  OBJC_IVAR_$_DMGViewController.webLoadingStarted
000d0f3e  ldr     r3, [r3]
000d0f40  ldrsb.w r3, [sl, r3]
000d0f44  cbz     r3, #0xd0f5a
000d0f46  ldr     r3, [pc, #0xe8]
000d0f48  ldr     r1, [pc, #0xe8]
000d0f4a  add     r3, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d0f4c  add     r1, pc ; -> 0x000fda50  
000d0f4e  ldr     r3, [r3]
000d0f50  ldr     r1, [r1]
000d0f52  ldr.w   r0, [sl, r3]
000d0f56  blx     #0xddbfc ; -> objc_msgSend
000d0f5a  ldr     r1, [pc, #0xdc]
000d0f5c  mov     r0, sl
000d0f5e  movs    r3, #0
000d0f60  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000d0f62  str     r3, [sp, #0x50]
000d0f64  ldr     r1, [r1]
000d0f66  str     r3, [sp, #0x54]
000d0f68  str     r3, [sp, #0x58]
000d0f6a  str     r3, [sp, #0x5c]
000d0f6c  str     r3, [sp, #0x60]
000d0f6e  str     r3, [sp, #0x64]
000d0f70  str     r3, [sp, #0x68]
000d0f72  str     r3, [sp, #0x6c]
000d0f74  str     r1, [sp, #4]
000d0f76  blx     #0xddbfc ; -> objc_msgSend
000d0f7a  ldr     r1, [pc, #0xc0]
000d0f7c  add     r1, pc ; -> 0x000fda44  
000d0f7e  ldr.w   fp, [r1]
000d0f82  mov     r1, fp
000d0f84  blx     #0xddbfc ; -> objc_msgSend
000d0f88  ldr     r1, [pc, #0xb4]
000d0f8a  movs    r3, #0x10
000d0f8c  add     r2, sp, #0x50
000d0f8e  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000d0f90  str     r3, [sp]
000d0f92  ldr     r1, [r1]
000d0f94  add     r3, sp, r3
000d0f96  str     r1, [sp, #0xc]
000d0f98  str     r0, [sp, #8]
000d0f9a  blx     #0xddbfc ; -> objc_msgSend
000d0f9e  cmp     r0, #0
000d0fa0  beq     #0xd0ffa
000d0fa2  ldr     r1, [pc, #0xa0]
000d0fa4  ldr     r3, [sp, #0x58]
000d0fa6  mov     r5, r0
000d0fa8  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000d0faa  ldr.w   r8, [r3]
000d0fae  ldr     r6, [r1]
000d0fb0  b       #0xd0fb4
000d0fb2  ldr     r3, [sp, #0x58]
000d0fb4  movs    r4, #0
000d0fb6  b       #0xd0fba
000d0fb8  ldr     r3, [sp, #0x58]
000d0fba  ldr     r3, [r3]
000d0fbc  cmp     r3, r8
000d0fbe  beq     #0xd0fd2
000d0fc0  ldr     r1, [sp, #4]
000d0fc2  mov     r0, sl
000d0fc4  blx     #0xddbfc ; -> objc_msgSend
000d0fc8  mov     r1, fp
000d0fca  blx     #0xddbfc ; -> objc_msgSend
000d0fce  blx     #0xddbe4 ; -> objc_enumerationMutation
000d0fd2  ldr     r3, [sp, #0x54]
000d0fd4  mov     r1, r6
000d0fd6  ldr.w   r0, [r3, r4, lsl #2]
000d0fda  adds    r4, #1
000d0fdc  blx     #0xddbfc ; -> objc_msgSend
000d0fe0  cmp     r5, r4
000d0fe2  bhi     #0xd0fb8
000d0fe4  movs    r3, #0x10
000d0fe6  ldr     r0, [sp, #8]
000d0fe8  str     r3, [sp]
000d0fea  ldr     r1, [sp, #0xc]
000d0fec  add     r2, sp, #0x50
000d0fee  add     r3, sp, r3
000d0ff0  blx     #0xddbfc ; -> objc_msgSend
000d0ff4  mov     r5, r0
000d0ff6  cmp     r0, #0
000d0ff8  bne     #0xd0fb2
000d0ffa  bl      #0xcfbf0 ; -> Z20MTXDMG_ExitMoreGamesv
000d0ffe  b       #0xd1010
000d1000  ldr     r3, [pc, #0x44]
000d1002  add     r3, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d1004  ldr     r0, [r3]
000d1006  ldr.w   r0, [sl, r0]
000d100a  cmp     r0, #0
000d100c  bne     #0xd0f30
000d100e  b       #0xd0f3a
000d1010  sub.w   sp, r7, #0x18
000d1014  pop.w   {r8, sl, fp}
000d1018  pop     {r4, r5, r6, r7, pc}
000d101a  nop     
000d101c  str     r3, [sp, #0x270]
000d101e  movs    r2, r0
000d1020  ldm     r3!, {r1, r6}
000d1022  movs    r2, r0
000d1024  ldm     r3, {r3, r5}
000d1026  movs    r2, r0
000d1028  pop     {r1, r3, r4, pc}
000d102a  movs    r2, r0
000d102c  str     r3, [sp, #0x1d0]
000d102e  movs    r2, r0
000d1030  str     r3, [sp, #0x148]
000d1032  movs    r2, r0
