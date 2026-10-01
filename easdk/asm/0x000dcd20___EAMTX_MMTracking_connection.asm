========================================================================
-[EAMTX_MMTracking connection  0x000dcd20  60 bytes   EAMTX_MMTracking.mm
========================================================================

000dcd20  push    {r7, lr}
000dcd22  add     r7, sp, #0
000dcd24  ldr     r1, [pc, #0x24]
000dcd26  add     r1, pc ; -> 0x000fc978  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn
000dcd28  ldr     r1, [r1]
000dcd2a  ldr     r1, [r0, r1]
000dcd2c  cmp     r1, r2
000dcd2e  bne     #0xdcd48
000dcd30  ldr     r0, [pc, #0x1c]
000dcd32  ldr     r1, [pc, #0x20]
000dcd34  ldr     r2, [pc, #0x20]
000dcd36  add     r0, pc ; -> 0x000fdb5c  
000dcd38  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dcd3a  add     r2, pc ; -> 0x00181d64  
000dcd3c  ldr     r1, [r1]
000dcd3e  ldr     r0, [r0]
000dcd40  blx     #0xddbfc ; -> objc_msgSend
000dcd44  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000dcd48  pop     {r7, pc}
000dcd4a  nop     
000dcd4c  mcrr2   p0, #0, r0, lr, c1
000dcd50  lsrs    r2, r4, #0x18
000dcd52  movs    r2, r0
000dcd54  stc2l   p0, c0, [r4, #-4]!
000dcd58  str     r6, [r4, r0]
000dcd5a  movs    r2, r1
