========================================================================
-[FBConnectionImpl publishFeed  0x00088698  172 bytes   FBConnection.mm
========================================================================

00088698  push    {r4, r5, r6, r7, lr}
0008869a  add     r7, sp, #0xc
0008869c  ldr     r1, [pc, #0x74]
0008869e  mov     r5, r0
000886a0  ldr     r0, [pc, #0x74]
000886a2  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000886a4  mov     r6, r2
000886a6  add     r0, pc ; -> 0x000fdc18  
000886a8  ldr     r1, [r1]
000886aa  ldr     r0, [r0]
000886ac  blx     #0xddbfc ; -> objc_msgSend
000886b0  ldr     r1, [pc, #0x68]
000886b2  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000886b4  ldr     r1, [r1]
000886b6  blx     #0xddbfc ; -> objc_msgSend
000886ba  ldr     r1, [pc, #0x64]
000886bc  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000886be  ldr     r1, [r1]
000886c0  blx     #0xddbfc ; -> objc_msgSend
000886c4  ldr     r1, [pc, #0x5c]
000886c6  mov     r2, r5
000886c8  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000886ca  ldr     r1, [r1]
000886cc  mov     r4, r0
000886ce  blx     #0xddbfc ; -> objc_msgSend
000886d2  ldr     r1, [pc, #0x54]
000886d4  ldr     r2, [pc, #0x54]
000886d6  mov     r0, r4
000886d8  add     r1, pc ; -> 0x000fcf50  'PC\x0e'
000886da  add     r2, pc ; -> 0x0017eda4  
000886dc  ldr     r1, [r1]
000886de  blx     #0xddbfc ; -> objc_msgSend
000886e2  ldr     r0, [pc, #0x4c]
000886e4  ldr     r1, [pc, #0x4c]
000886e6  ldr     r2, [pc, #0x50]
000886e8  add     r0, pc ; -> 0x000fdb5c  
000886ea  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000886ec  mov     r3, r6
000886ee  add     r2, pc ; -> 0x0017edb4  
000886f0  ldr     r1, [r1]
000886f2  ldr     r0, [r0]
000886f4  blx     #0xddbfc ; -> objc_msgSend
000886f8  ldr     r1, [pc, #0x40]
000886fa  add     r1, pc ; -> 0x000fcf4c  '\x07C\x0e'
000886fc  ldr     r1, [r1]
000886fe  mov     r2, r0
00088700  mov     r0, r4
00088702  blx     #0xddbfc ; -> objc_msgSend
00088706  ldr     r1, [pc, #0x38]
00088708  mov     r0, r4
0008870a  add     r1, pc ; -> 0x000fcd8c  
0008870c  ldr     r1, [r1]
0008870e  blx     #0xddbfc ; -> objc_msgSend
00088712  pop     {r4, r5, r6, r7, pc}
00088714  cmn     r6, r3
00088716  movs    r7, r0
00088718  strb    r6, [r5, r5]
0008871a  movs    r7, r0
0008871c  cmn     r2, r1
0008871e  movs    r7, r0
00088720  bics    r0, r3
00088722  movs    r7, r0
00088724  cmp     ip, r5
00088726  movs    r7, r0
00088728  ldr     r0, [pc, #0x1d0]
0008872a  movs    r7, r0
0008872c  str     r6, [r0, #0x6c]
0008872e  movs    r7, r1
00088730  strb    r0, [r6, r1]
00088732  movs    r7, r0
00088734  bics    r2, r6
00088736  movs    r7, r0
00088738  str     r2, [r0, #0x6c]
0008873a  movs    r7, r1
0008873c  ldr     r0, [pc, #0x138]
0008873e  movs    r7, r0
00088740  mov     r6, pc
00088742  movs    r7, r0
