========================================================================
-[DMGController refreshView]  0x000ce8f0  192 bytes   DMGController.mm
========================================================================

000ce8f0  push    {r4, r5, r6, r7, lr}
000ce8f2  add     r7, sp, #0xc
000ce8f4  push.w  {r8, sl, fp}
000ce8f8  ldr.w   r8, [pc, #0x90]
000ce8fc  ldr     r1, [pc, #0x90]
000ce8fe  mov     r5, r0
000ce900  add     r8, pc ; -> 0x000f9a28  OBJC_IVAR_$_DMGController.dmgView
000ce902  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000ce904  ldr.w   r3, [r8]
000ce908  ldr.w   fp, [r1]
000ce90c  ldr     r4, [pc, #0x84]
000ce90e  ldr     r0, [r0, r3]
000ce910  mov     r1, fp
000ce912  blx     #0xddbfc ; -> objc_msgSend
000ce916  ldr     r1, [pc, #0x80]
000ce918  add     r4, pc ; -> 0x000f9a2c  OBJC_IVAR_$_DMGController.window
000ce91a  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000ce91c  ldr     r1, [r1]
000ce91e  blx     #0xddbfc ; -> objc_msgSend
000ce922  ldr     r1, [pc, #0x78]
000ce924  ldr.w   r3, [r8]
000ce928  ldr     r0, [r4]
000ce92a  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000ce92c  ldr     r6, [r1]
000ce92e  ldr.w   sl, [r5, r0]
000ce932  mov     r1, fp
000ce934  ldr     r0, [r5, r3]
000ce936  blx     #0xddbfc ; -> objc_msgSend
000ce93a  mov     r1, r6
000ce93c  mov     r2, r0
000ce93e  mov     r0, sl
000ce940  blx     #0xddbfc ; -> objc_msgSend
000ce944  ldr     r1, [pc, #0x58]
000ce946  ldr     r3, [r4]
000ce948  ldr.w   sl, [pc, #0x58]
000ce94c  add     r1, pc ; -> 0x000fcac4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x14c
000ce94e  ldr     r0, [r5, r3]
000ce950  ldr     r1, [r1]
000ce952  blx     #0xddbfc ; -> objc_msgSend
000ce956  ldr     r1, [pc, #0x50]
000ce958  add     r1, pc ; -> 0x000fd8d8  '\x0f\x16\x0f'
000ce95a  ldr.w   r8, [r1]
000ce95e  ldr     r1, [pc, #0x4c]
000ce960  add     r1, pc ; -> 0x000fd8dc  ' \x16\x0f'
000ce962  ldr     r6, [r1]
000ce964  b       #0xce970
000ce966  ldr     r3, [r4]
000ce968  mov     r1, r6
000ce96a  ldr     r0, [r5, r3]
000ce96c  blx     #0xddbfc ; -> objc_msgSend
000ce970  mov     r4, sl
000ce972  add     r4, pc
000ce974  mov     r1, r8
000ce976  ldr     r3, [r4]
000ce978  ldr     r0, [r5, r3]
000ce97a  blx     #0xddbfc ; -> objc_msgSend
000ce97e  tst.w   r0, #0xff
000ce982  beq     #0xce966
000ce984  pop.w   {r8, sl, fp}
000ce988  pop     {r4, r5, r6, r7, pc}
000ce98a  nop     
000ce98c  cbz     r4, #0xce998
000ce98e  movs    r2, r0
000ce990  b       #0xcedf0
000ce992  movs    r2, r0
000ce994  cbz     r0, #0xce99c
000ce996  movs    r2, r0
000ce998  b       #0xcf140
000ce99a  movs    r2, r0
000ce99c  b       #0xcedcc
000ce99e  movs    r2, r0
000ce9a0  b       #0xcec8c
000ce9a2  movs    r2, r0
000ce9a4  sub     sp, #0xd8
000ce9a6  movs    r2, r0
