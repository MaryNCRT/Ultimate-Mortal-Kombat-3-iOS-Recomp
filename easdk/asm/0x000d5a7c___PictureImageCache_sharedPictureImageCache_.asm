========================================================================
+[PictureImageCache sharedPictureImageCache]  0x000d5a7c  88 bytes   PictureImageCache.m
========================================================================

000d5a7c  push    {r4, r5, r7, lr}
000d5a7e  add     r7, sp, #8
000d5a80  ldr     r3, [pc, #0x38]
000d5a82  add     r3, pc ; -> 0x006bc164  synchro
000d5a84  ldrsb.w r5, [r3]
000d5a88  cbnz    r5, #0xd5ab2
000d5a8a  ldr     r4, [pc, #0x34]
000d5a8c  movs    r2, #1
000d5a8e  strb    r2, [r3]
000d5a90  add     r4, pc ; -> 0x006bc160  sharedPictureImageCache
000d5a92  ldr     r3, [r4]
000d5a94  cbnz    r3, #0xd5aac
000d5a96  ldr     r1, [pc, #0x2c]
000d5a98  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d5a9a  ldr     r1, [r1]
000d5a9c  blx     #0xddbfc ; -> objc_msgSend
000d5aa0  ldr     r1, [pc, #0x24]
000d5aa2  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d5aa4  ldr     r1, [r1]
000d5aa6  blx     #0xddbfc ; -> objc_msgSend
000d5aaa  str     r0, [r4]
000d5aac  ldr     r3, [pc, #0x1c]
000d5aae  add     r3, pc ; -> 0x006bc164  synchro
000d5ab0  strb    r5, [r3]
000d5ab2  ldr     r0, [pc, #0x1c]
000d5ab4  add     r0, pc ; -> 0x006bc160  sharedPictureImageCache
000d5ab6  ldr     r0, [r0]
000d5ab8  pop     {r4, r5, r7, pc}
000d5aba  nop     
000d5abc  str     r6, [r3, #0x6c]
000d5abe  lsls    r6, r3, #1
000d5ac0  str     r4, [r1, #0x6c]
000d5ac2  lsls    r6, r3, #1
000d5ac4  ldr     r0, [r5, #0x6c]
000d5ac6  movs    r2, r0
000d5ac8  ldr     r2, [r3, #0x6c]
000d5aca  movs    r2, r0
000d5acc  str     r2, [r6, #0x68]
000d5ace  lsls    r6, r3, #1
000d5ad0  str     r0, [r5, #0x68]
000d5ad2  lsls    r6, r3, #1
