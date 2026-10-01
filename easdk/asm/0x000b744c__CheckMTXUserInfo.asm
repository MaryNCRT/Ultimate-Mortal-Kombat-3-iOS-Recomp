========================================================================
CheckMTXUserInfo  0x000b744c  116 bytes   EAMTX_Main.mm
========================================================================

000b744c  push    {r4, r5, r6, r7, lr}
000b744e  add     r7, sp, #0xc
000b7450  ldr     r4, [pc, #0x4c]
000b7452  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000b7454  ldr     r3, [r4]
000b7456  cbnz    r3, #0xb749e
000b7458  ldr     r0, [pc, #0x48]
000b745a  ldr     r1, [pc, #0x4c]
000b745c  add     r0, pc ; -> 0x000fdc78  
000b745e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b7460  ldr     r0, [r0]
000b7462  ldr     r1, [r1]
000b7464  blx     #0xddbfc ; -> objc_msgSend
000b7468  ldr     r1, [pc, #0x40]
000b746a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b746c  ldr     r1, [r1]
000b746e  blx     #0xddbfc ; -> objc_msgSend
000b7472  ldr     r1, [pc, #0x3c]
000b7474  ldr     r3, [pc, #0x3c]
000b7476  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b7478  add     r3, pc ; -> 0x000fdb5c  
000b747a  ldr     r5, [r1]
000b747c  ldr     r1, [pc, #0x38]
000b747e  ldr     r6, [r3]
000b7480  add     r1, pc ; -> 0x000fd6b0  
000b7482  ldr     r1, [r1]
000b7484  str     r0, [r4]
000b7486  blx     #0xddbfc ; -> objc_msgSend
000b748a  ldr     r4, [pc, #0x30]
000b748c  mov     r1, r5
000b748e  add     r4, pc ; -> 0x001800d4  
000b7490  mov     r2, r4
000b7492  mov     r3, r0
000b7494  mov     r0, r6
000b7496  blx     #0xddbfc ; -> objc_msgSend
000b749a  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000b749e  pop     {r4, r5, r6, r7, pc}
000b74a0  ldr     r4, [pc, #0x248]
000b74a2  movs    r5, r5
000b74a4  ldr     r0, [r3]
000b74a6  movs    r4, r0
000b74a8  strb    r2, [r4, r4]
000b74aa  movs    r4, r0
000b74ac  strb    r2, [r2, r4]
000b74ae  movs    r4, r0
000b74b0  ldrsb   r6, [r4, r0]
000b74b2  movs    r4, r0
000b74b4  str     r0, [r4, #0x6c]
000b74b6  movs    r4, r0
000b74b8  str     r4, [r5, #0x20]
000b74ba  movs    r4, r0
000b74bc  ldrh    r2, [r0, #0x22]
000b74be  movs    r4, r1
