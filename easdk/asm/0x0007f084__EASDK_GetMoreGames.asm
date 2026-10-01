========================================================================
EASDK_GetMoreGames  0x0007f084  124 bytes   EASDK_Handler.mm
========================================================================

0007f084  push    {r4, r5, r7, lr}
0007f086  add     r7, sp, #8
0007f088  mov     r4, r0
0007f08a  mov     r5, r1
0007f08c  cbz     r0, #0x7f0b6
0007f08e  ldr     r0, [pc, #0x54]
0007f090  ldr     r1, [pc, #0x54]
0007f092  add     r0, pc ; -> 0x000fdb5c  
0007f094  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f096  ldr     r0, [r0]
0007f098  ldr     r1, [r1]
0007f09a  blx     #0xddbfc ; -> objc_msgSend
0007f09e  ldr     r1, [pc, #0x4c]
0007f0a0  mov     r2, r4
0007f0a2  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f0a4  ldr     r1, [r1]
0007f0a6  blx     #0xddbfc ; -> objc_msgSend
0007f0aa  ldr     r1, [pc, #0x44]
0007f0ac  add     r1, pc ; -> 0x000fcbcc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x254
0007f0ae  ldr     r1, [r1]
0007f0b0  blx     #0xddbfc ; -> objc_msgSend
0007f0b4  mov     r4, r0
0007f0b6  cbz     r5, #0x7f0de
0007f0b8  ldr     r0, [pc, #0x38]
0007f0ba  ldr     r1, [pc, #0x3c]
0007f0bc  add     r0, pc ; -> 0x000fdb5c  
0007f0be  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f0c0  ldr     r0, [r0]
0007f0c2  ldr     r1, [r1]
0007f0c4  blx     #0xddbfc ; -> objc_msgSend
0007f0c8  ldr     r1, [pc, #0x30]
0007f0ca  mov     r2, r5
0007f0cc  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f0ce  ldr     r1, [r1]
0007f0d0  blx     #0xddbfc ; -> objc_msgSend
0007f0d4  mov     r1, r0
0007f0d6  mov     r0, r4
0007f0d8  bl      #0xbdeb0 ; -> Z17MTX_ShowMoreGamesP8NSStringS0_
0007f0dc  pop     {r4, r5, r7, pc}
0007f0de  mov     r1, r5
0007f0e0  b       #0x7f0d6
0007f0e2  nop     
0007f0e4  pkhbt   r0, r6, r7
0007f0e8  bhi     #0x7f0c4
0007f0ea  movs    r7, r0
0007f0ec  blt     #0x7f124
0007f0ee  movs    r7, r0
0007f0f0  blt     #0x7f12c
0007f0f2  movs    r7, r0
0007f0f4  eors.w  r0, ip, r7
0007f0f8  bhi     #0x7f080
0007f0fa  movs    r7, r0
0007f0fc  bge     #0x7f0e0
0007f0fe  movs    r7, r0
