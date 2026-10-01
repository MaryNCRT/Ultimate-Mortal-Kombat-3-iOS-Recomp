========================================================================
+[DMGController serverAddress]  0x000ce80c  76 bytes   DMGController.mm
========================================================================

000ce80c  push    {r7, lr}
000ce80e  add     r7, sp, #0
000ce810  ldr     r0, [pc, #0x2c]
000ce812  ldr     r1, [pc, #0x30]
000ce814  add     r0, pc ; -> 0x000fdb60  
000ce816  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000ce818  ldr     r0, [r0]
000ce81a  ldr     r1, [r1]
000ce81c  blx     #0xddbfc ; -> objc_msgSend
000ce820  ldr     r1, [pc, #0x24]
000ce822  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000ce824  ldr     r1, [r1]
000ce826  blx     #0xddbfc ; -> objc_msgSend
000ce82a  ldr     r1, [pc, #0x20]
000ce82c  ldr     r2, [pc, #0x20]
000ce82e  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000ce830  add     r2, pc ; -> 0x00182084  
000ce832  ldr     r1, [r1]
000ce834  blx     #0xddbfc ; -> objc_msgSend
000ce838  cbnz    r0, #0xce83e
000ce83a  ldr     r0, [pc, #0x18]
000ce83c  add     r0, pc ; -> 0x00182094  
000ce83e  pop     {r7, pc}
000ce840  sbfx    r0, r8, #0, #3
000ce844  b       #0xcec4c
000ce846  movs    r2, r0
000ce848  b       #0xcede8
000ce84a  movs    r2, r0
000ce84c  b       #0xcedcc
000ce84e  movs    r2, r0
000ce850  subs    r0, #0x50
000ce852  movs    r3, r1
000ce854  subs    r0, #0x54
000ce856  movs    r3, r1
