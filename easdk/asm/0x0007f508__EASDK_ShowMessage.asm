========================================================================
EASDK_ShowMessage  0x0007f508  108 bytes   EASDK_Handler.mm
========================================================================

0007f508  push    {r4, r5, r7, lr}
0007f50a  add     r7, sp, #8
0007f50c  ldr     r5, [pc, #0x48]
0007f50e  add     r5, pc ; -> 0x0017588c  msgShown
0007f510  ldr     r3, [r5]
0007f512  cbnz    r3, #0x7f556
0007f514  ldr     r0, [pc, #0x44]
0007f516  ldr     r1, [pc, #0x48]
0007f518  add     r0, pc ; -> 0x000fdb5c  
0007f51a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f51c  ldr     r0, [r0]
0007f51e  ldr     r1, [r1]
0007f520  blx     #0xddbfc ; -> objc_msgSend
0007f524  ldr     r2, [pc, #0x3c]
0007f526  ldr     r1, [pc, #0x40]
0007f528  add     r2, pc ; -> 0x000f34c0  Language
0007f52a  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f52c  ldr     r2, [r2]
0007f52e  ldr     r1, [r1]
0007f530  blx     #0xddbfc ; -> objc_msgSend
0007f534  ldr     r1, [pc, #0x34]
0007f536  add     r1, pc ; -> 0x000fcbcc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x254
0007f538  ldr     r1, [r1]
0007f53a  blx     #0xddbfc ; -> objc_msgSend
0007f53e  mov     r4, r0
0007f540  ldr     r0, [pc, #0x2c]
0007f542  mov     r1, r4
0007f544  add     r0, pc ; -> 0x0017e614  
0007f546  blx     #0xdd3e0 ; -> NSLog
0007f54a  movs    r2, #1
0007f54c  mov     r0, r4
0007f54e  movs    r1, #4
0007f550  str     r2, [r5]
0007f552  bl      #0xbdf4c ; -> Z14MTX_GetMessageP8NSStringib
0007f556  pop     {r4, r5, r7, pc}
0007f558  str     r2, [r7, #0x34]
0007f55a  movs    r7, r1
0007f55c  b       #0x7f1e0
0007f55e  movs    r7, r0
0007f560  bmi     #0x7f630
0007f562  movs    r7, r0
0007f564  subs    r7, #0x94
0007f566  movs    r7, r0
0007f568  bvs     #0x7f490
0007f56a  movs    r7, r0
0007f56c  bvs     #0x7f494
0007f56e  movs    r7, r0
