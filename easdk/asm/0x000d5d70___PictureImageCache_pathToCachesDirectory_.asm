========================================================================
-[PictureImageCache pathToCachesDirectory]  0x000d5d70  32 bytes   PictureImageCache.m
========================================================================

000d5d70  push    {r7, lr}
000d5d72  add     r7, sp, #0
000d5d74  movs    r1, #1
000d5d76  movs    r0, #0xd
000d5d78  mov     r2, r1
000d5d7a  blx     #0xdd3ec ; -> NSSearchPathForDirectoriesInDomains
000d5d7e  ldr     r1, [pc, #0xc]
000d5d80  movs    r2, #0
000d5d82  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000d5d84  ldr     r1, [r1]
000d5d86  blx     #0xddbfc ; -> objc_msgSend
000d5d8a  pop     {r7, pc}
000d5d8c  ldr     r6, [r6, #0x4c]
000d5d8e  movs    r2, r0
