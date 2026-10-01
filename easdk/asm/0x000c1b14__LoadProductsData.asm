========================================================================
LoadProductsData  0x000c1b14  328 bytes   EAMTX_Main.mm
========================================================================

000c1b14  push    {r4, r5, r6, r7, lr}
000c1b16  add     r7, sp, #0xc
000c1b18  push.w  {r8, sl, fp}
000c1b1c  ldr     r0, [pc, #0xf4]
000c1b1e  ldr     r4, [pc, #0xf8]
000c1b20  add     r0, pc ; -> 0x00180fa4  
000c1b22  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c1b26  ldr     r0, [pc, #0xf4]
000c1b28  ldr     r1, [pc, #0xf4]
000c1b2a  add     r4, pc ; -> 0x00180934  
000c1b2c  add     r0, pc ; -> 0x000fdc2c  
000c1b2e  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000c1b30  ldr     r0, [r0]
000c1b32  ldr     r1, [r1]
000c1b34  blx     #0xddbfc ; -> objc_msgSend
000c1b38  ldr     r1, [pc, #0xe8]
000c1b3a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c1b3c  ldr     r5, [r1]
000c1b3e  mov     r8, r0
000c1b40  ldr     r0, [pc, #0xe4]
000c1b42  add     r0, pc ; -> 0x000fdb5c  
000c1b44  ldr     r6, [r0]
000c1b46  blx     #0xdd41c ; -> NSTemporaryDirectory
000c1b4a  mov     r1, r5
000c1b4c  mov     r2, r4
000c1b4e  mov     r3, r0
000c1b50  mov     r0, r6
000c1b52  blx     #0xddbfc ; -> objc_msgSend
000c1b56  ldr     r1, [pc, #0xd4]
000c1b58  add     r1, pc ; -> 0x000fd21c  
000c1b5a  ldr     r1, [r1]
000c1b5c  mov     r2, r0
000c1b5e  mov     r0, r8
000c1b60  blx     #0xddbfc ; -> objc_msgSend
000c1b64  mov     r2, r0
000c1b66  cmp     r0, #0
000c1b68  beq     #0xc1c0e
000c1b6a  ldr     r0, [pc, #0xc4]
000c1b6c  ldr     r1, [pc, #0xc4]
000c1b6e  add     r0, pc ; -> 0x000fdb8c  
000c1b70  add     r1, pc ; -> 0x000fcad0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x158
000c1b72  ldr     r0, [r0]
000c1b74  ldr     r1, [r1]
000c1b76  blx     #0xddbfc ; -> objc_msgSend
000c1b7a  mov     r4, r0
000c1b7c  cmp     r0, #0
000c1b7e  beq     #0xc1c0e
000c1b80  ldr     r1, [pc, #0xb4]
000c1b82  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c1b84  ldr     r1, [r1]
000c1b86  blx     #0xddbfc ; -> objc_msgSend
000c1b8a  cmp     r0, #2
000c1b8c  bls     #0xc1c0e
000c1b8e  ldr     r1, [pc, #0xac]
000c1b90  movs    r2, #0
000c1b92  mov     r0, r4
000c1b94  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c1b96  ldr     r6, [r1]
000c1b98  mov     r1, r6
000c1b9a  blx     #0xddbfc ; -> objc_msgSend
000c1b9e  ldr     r1, [pc, #0xa0]
000c1ba0  ldr     r3, [pc, #0xa0]
000c1ba2  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c1ba4  add     r3, pc ; -> 0x0038c0e8  mtxUserInfo
000c1ba6  ldr     r1, [r1]
000c1ba8  str     r0, [r3]
000c1baa  blx     #0xddbfc ; -> objc_msgSend
000c1bae  ldr     r0, [pc, #0x98]
000c1bb0  ldr     r1, [pc, #0x98]
000c1bb2  add     r0, pc ; -> 0x000fdbf4  
000c1bb4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c1bb6  ldr.w   fp, [r0]
000c1bba  ldr.w   r8, [r1]
000c1bbe  mov     r0, fp
000c1bc0  mov     r1, r8
000c1bc2  blx     #0xddbfc ; -> objc_msgSend
000c1bc6  ldr     r1, [pc, #0x88]
000c1bc8  movs    r2, #1
000c1bca  add     r1, pc ; -> 0x000fce14  'r<\x0e'
000c1bcc  ldr.w   sl, [r1]
000c1bd0  mov     r1, r6
000c1bd2  mov     r5, r0
000c1bd4  mov     r0, r4
000c1bd6  blx     #0xddbfc ; -> objc_msgSend
000c1bda  mov     r1, sl
000c1bdc  mov     r2, r0
000c1bde  mov     r0, r5
000c1be0  blx     #0xddbfc ; -> objc_msgSend
000c1be4  ldr     r3, [pc, #0x6c]
000c1be6  mov     r1, r8
000c1be8  add     r3, pc ; -> 0x0038c0bc  mtxProdsList
000c1bea  str     r0, [r3]
000c1bec  mov     r0, fp
000c1bee  blx     #0xddbfc ; -> objc_msgSend
000c1bf2  mov     r1, r6
000c1bf4  movs    r2, #2
000c1bf6  mov     r5, r0
000c1bf8  mov     r0, r4
000c1bfa  blx     #0xddbfc ; -> objc_msgSend
000c1bfe  mov     r1, sl
000c1c00  mov     r2, r0
000c1c02  mov     r0, r5
000c1c04  blx     #0xddbfc ; -> objc_msgSend
000c1c08  ldr     r3, [pc, #0x4c]
000c1c0a  add     r3, pc ; -> 0x0038c194  m_BadgesDict
000c1c0c  str     r0, [r3]
000c1c0e  pop.w   {r8, sl, fp}
000c1c12  pop     {r4, r5, r6, r7, pc}
000c1c14  eor     r0, r0, #0x8b0000
000c1c18  cdp     p0, #0, c0, c6, c11, #0
000c1c1c  stm     r0!, {r2, r3, r4, r5, r6, r7}
000c1c1e  movs    r3, r0
000c1c20  push    {r1, r2, r4, r6, r7}
000c1c22  movs    r3, r0
000c1c24  add     r7, sp, #0x188
000c1c26  movs    r3, r0
000c1c28  stm     r0!, {r1, r2, r4}
000c1c2a  movs    r3, r0
