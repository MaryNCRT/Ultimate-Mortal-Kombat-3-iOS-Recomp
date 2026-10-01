========================================================================
GetTickerList  0x000b5ba4  268 bytes   EAMTX_Main.mm
========================================================================

000b5ba4  push    {r4, r5, r6, r7, lr}
000b5ba6  add     r7, sp, #0xc
000b5ba8  push.w  {r8, sl, fp}
000b5bac  ldr     r1, [pc, #0xbc]
000b5bae  mov     r4, r0
000b5bb0  ldr     r0, [pc, #0xbc]
000b5bb2  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b5bb4  movs    r5, #0
000b5bb6  add     r0, pc ; -> 0x000fdb70  
000b5bb8  ldr     r1, [r1]
000b5bba  ldr     r0, [r0]
000b5bbc  blx     #0xddbfc ; -> objc_msgSend
000b5bc0  ldr     r1, [pc, #0xb0]
000b5bc2  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b5bc4  ldr     r1, [r1]
000b5bc6  blx     #0xddbfc ; -> objc_msgSend
000b5bca  ldr     r3, [pc, #0xac]
000b5bcc  ldr     r1, [pc, #0xac]
000b5bce  ldr     r2, [pc, #0xb0]
000b5bd0  add     r3, pc ; -> 0x0038c148  m_TickersList
000b5bd2  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b5bd4  add     r2, pc ; -> 0x0017fe74  
000b5bd6  ldr     r1, [r1]
000b5bd8  str     r0, [r3]
000b5bda  mov     r0, r4
000b5bdc  blx     #0xddbfc ; -> objc_msgSend
000b5be0  ldr     r1, [pc, #0xa0]
000b5be2  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b5be4  ldr.w   fp, [r1]
000b5be8  ldr     r1, [pc, #0x9c]
000b5bea  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000b5bec  ldr.w   sl, [r1]
000b5bf0  ldr     r1, [pc, #0x98]
000b5bf2  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000b5bf4  ldr.w   r8, [r1]
000b5bf8  mov     r6, r0
000b5bfa  b       #0xb5c1c
000b5bfc  ldr     r0, [pc, #0x90]
000b5bfe  mov     r2, r5
000b5c00  mov     r1, r8
000b5c02  add     r0, pc ; -> 0x0038c148  m_TickersList
000b5c04  adds    r5, #1
000b5c06  ldr     r4, [r0]
000b5c08  mov     r0, r6
000b5c0a  blx     #0xddbfc ; -> objc_msgSend
000b5c0e  bl      #0xb5a8c ; -> Z12GetTickerObjP12NSDictionary
000b5c12  mov     r1, sl
000b5c14  mov     r2, r0
000b5c16  mov     r0, r4
000b5c18  blx     #0xddbfc ; -> objc_msgSend
000b5c1c  mov     r0, r6
000b5c1e  mov     r1, fp
000b5c20  blx     #0xddbfc ; -> objc_msgSend
000b5c24  cmp     r0, r5
000b5c26  bhi     #0xb5bfc
000b5c28  ldr     r4, [pc, #0x68]
000b5c2a  add     r4, pc ; -> 0x0038c1c8  tickersUpdatedtime
000b5c2c  ldr     r0, [r4]
000b5c2e  cbz     r0, #0xb5c3e
000b5c30  ldr     r1, [pc, #0x64]
000b5c32  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b5c34  ldr     r1, [r1]
000b5c36  blx     #0xddbfc ; -> objc_msgSend
000b5c3a  movs    r3, #0
000b5c3c  str     r3, [r4]
000b5c3e  ldr     r0, [pc, #0x5c]
000b5c40  ldr     r1, [pc, #0x5c]
000b5c42  add     r0, pc ; -> 0x000fdbb4  
000b5c44  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000b5c46  ldr     r0, [r0]
000b5c48  ldr     r1, [r1]
000b5c4a  blx     #0xddbfc ; -> objc_msgSend
000b5c4e  ldr     r1, [pc, #0x54]
000b5c50  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000b5c52  ldr     r1, [r1]
000b5c54  blx     #0xddbfc ; -> objc_msgSend
000b5c58  ldr     r3, [pc, #0x4c]
000b5c5a  add     r3, pc ; -> 0x0038c1c8  tickersUpdatedtime
000b5c5c  str     r0, [r3]
000b5c5e  ldr     r0, [pc, #0x4c]
000b5c60  add     r0, pc ; -> 0x0038c148  m_TickersList
000b5c62  ldr     r0, [r0]
000b5c64  pop.w   {r8, sl, fp}
000b5c68  pop     {r4, r5, r6, r7, pc}
000b5c6a  nop     
000b5c6c  ldr     r6, [r1, #0x5c]
000b5c6e  movs    r4, r0
000b5c70  ldrb    r6, [r6, #0x1e]
000b5c72  movs    r4, r0
000b5c74  ldr     r2, [r7, #0x58]
000b5c76  movs    r4, r0
000b5c78  str     r4, [r6, #0x54]
000b5c7a  movs    r5, r5
000b5c7c  ldr     r2, [r3, #0x70]
000b5c7e  movs    r4, r0
000b5c80  adr     r2, #0x270
000b5c82  movs    r4, r1
000b5c84  ldr     r2, [r3, #0x68]
000b5c86  movs    r4, r0
000b5c88  ldr     r6, [r2, #0x68]
000b5c8a  movs    r4, r0
000b5c8c  ldr     r6, [r0, #0x68]
000b5c8e  movs    r4, r0
000b5c90  str     r2, [r0, #0x54]
000b5c92  movs    r5, r5
000b5c94  str     r2, [r3, #0x58]
000b5c96  movs    r5, r5
000b5c98  ldr     r6, [r0, #0x54]
000b5c9a  movs    r4, r0
000b5c9c  ldrb    r6, [r5, #0x1d]
000b5c9e  movs    r4, r0
000b5ca0  ldr     r0, [r0, #0x78]
000b5ca2  movs    r4, r0
000b5ca4  strb    r4, [r7, #1]
000b5ca6  movs    r4, r0
000b5ca8  str     r2, [r5, #0x54]
000b5caa  movs    r5, r5
000b5cac  str     r4, [r4, #0x4c]
000b5cae  movs    r5, r5
