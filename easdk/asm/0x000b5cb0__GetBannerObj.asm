========================================================================
GetBannerObj  0x000b5cb0  416 bytes   EAMTX_Main.mm
========================================================================

000b5cb0  push    {r4, r5, r6, r7, lr}
000b5cb2  add     r7, sp, #0xc
000b5cb4  push.w  {r8, sl}
000b5cb8  mov     sl, r0
000b5cba  ldr     r0, [pc, #0x128]
000b5cbc  add     r0, pc ; -> 0x0038c138  m_CurrBanner
000b5cbe  ldr     r0, [r0]
000b5cc0  cbz     r0, #0xb5ccc
000b5cc2  ldr     r1, [pc, #0x124]
000b5cc4  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b5cc6  ldr     r1, [r1]
000b5cc8  blx     #0xddbfc ; -> objc_msgSend
000b5ccc  ldr     r0, [pc, #0x11c]
000b5cce  ldr     r1, [pc, #0x120]
000b5cd0  ldr.w   r8, [pc, #0x120]
000b5cd4  add     r0, pc ; -> 0x000fdc94  
000b5cd6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b5cd8  ldr     r0, [r0]
000b5cda  ldr     r1, [r1]
000b5cdc  blx     #0xddbfc ; -> objc_msgSend
000b5ce0  ldr     r1, [pc, #0x114]
000b5ce2  add     r8, pc ; -> 0x0038c138  m_CurrBanner
000b5ce4  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b5ce6  ldr     r1, [r1]
000b5ce8  blx     #0xddbfc ; -> objc_msgSend
000b5cec  ldr     r1, [pc, #0x10c]
000b5cee  ldr     r2, [pc, #0x110]
000b5cf0  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b5cf2  add     r2, pc ; -> 0x0017fe84  
000b5cf4  ldr     r6, [r1]
000b5cf6  mov     r1, r6
000b5cf8  str.w   r0, [r8]
000b5cfc  mov     r0, sl
000b5cfe  blx     #0xddbfc ; -> objc_msgSend
000b5d02  ldr     r1, [pc, #0x100]
000b5d04  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b5d06  ldr     r1, [r1]
000b5d08  blx     #0xddbfc ; -> objc_msgSend
000b5d0c  ldr     r1, [pc, #0xf8]
000b5d0e  add     r1, pc ; -> 0x000fd430  
000b5d10  ldr     r1, [r1]
000b5d12  mov     r2, r0
000b5d14  ldr.w   r0, [r8]
000b5d18  blx     #0xddbfc ; -> objc_msgSend
000b5d1c  ldr     r2, [pc, #0xec]
000b5d1e  mov     r1, r6
000b5d20  mov     r0, sl
000b5d22  add     r2, pc ; -> 0x0017fe24  
000b5d24  blx     #0xddbfc ; -> objc_msgSend
000b5d28  ldr     r1, [pc, #0xe4]
000b5d2a  add     r1, pc ; -> 0x000fd20c  
000b5d2c  ldr     r1, [r1]
000b5d2e  mov     r2, r0
000b5d30  ldr.w   r0, [r8]
000b5d34  blx     #0xddbfc ; -> objc_msgSend
000b5d38  ldr     r2, [pc, #0xd8]
000b5d3a  mov     r1, r6
000b5d3c  mov     r0, sl
000b5d3e  add     r2, pc ; -> 0x0017fe34  
000b5d40  blx     #0xddbfc ; -> objc_msgSend
000b5d44  ldr     r1, [pc, #0xd0]
000b5d46  add     r1, pc ; -> 0x000fd208  
000b5d48  ldr     r1, [r1]
000b5d4a  mov     r2, r0
000b5d4c  ldr.w   r0, [r8]
000b5d50  blx     #0xddbfc ; -> objc_msgSend
000b5d54  ldr     r2, [pc, #0xc4]
000b5d56  mov     r1, r6
000b5d58  mov     r0, sl
000b5d5a  add     r2, pc ; -> 0x0017e754  
000b5d5c  blx     #0xddbfc ; -> objc_msgSend
000b5d60  ldr     r1, [pc, #0xbc]
000b5d62  add     r1, pc ; -> 0x000fd200  
000b5d64  ldr     r1, [r1]
000b5d66  mov     r2, r0
000b5d68  ldr.w   r0, [r8]
000b5d6c  blx     #0xddbfc ; -> objc_msgSend
000b5d70  ldr     r0, [pc, #0xb0]
000b5d72  ldr     r1, [pc, #0xb4]
000b5d74  ldr     r2, [pc, #0xb4]
000b5d76  add     r0, pc ; -> 0x0038c0e4  mtxController
000b5d78  add     r1, pc ; -> 0x000fd460  
000b5d7a  ldr     r5, [r0]
000b5d7c  ldr     r4, [r1]
000b5d7e  add     r2, pc ; -> 0x0017fe94  
000b5d80  mov     r1, r6
000b5d82  mov     r0, sl
000b5d84  blx     #0xddbfc ; -> objc_msgSend
000b5d88  mov     r1, r4
000b5d8a  ldr     r4, [pc, #0xa4]
000b5d8c  add     r4, pc ; -> 0x0038c1cc  bannersUpdatedTime
000b5d8e  mov     r2, r0
000b5d90  mov     r0, r5
000b5d92  blx     #0xddbfc ; -> objc_msgSend
000b5d96  ldr     r1, [pc, #0x9c]
000b5d98  add     r1, pc ; -> 0x000fd42c  
000b5d9a  ldr     r1, [r1]
000b5d9c  mov     r2, r0
000b5d9e  ldr.w   r0, [r8]
000b5da2  blx     #0xddbfc ; -> objc_msgSend
000b5da6  ldr     r0, [r4]
000b5da8  cbz     r0, #0xb5db8
000b5daa  ldr     r1, [pc, #0x8c]
000b5dac  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b5dae  ldr     r1, [r1]
000b5db0  blx     #0xddbfc ; -> objc_msgSend
000b5db4  movs    r3, #0
000b5db6  str     r3, [r4]
000b5db8  ldr     r0, [pc, #0x80]
000b5dba  ldr     r1, [pc, #0x84]
000b5dbc  add     r0, pc ; -> 0x000fdbb4  
000b5dbe  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000b5dc0  ldr     r0, [r0]
000b5dc2  ldr     r1, [r1]
000b5dc4  blx     #0xddbfc ; -> objc_msgSend
000b5dc8  ldr     r1, [pc, #0x78]
000b5dca  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000b5dcc  ldr     r1, [r1]
000b5dce  blx     #0xddbfc ; -> objc_msgSend
000b5dd2  ldr     r3, [pc, #0x74]
000b5dd4  add     r3, pc ; -> 0x0038c1cc  bannersUpdatedTime
000b5dd6  str     r0, [r3]
000b5dd8  ldr     r0, [pc, #0x70]
000b5dda  add     r0, pc ; -> 0x0038c138  m_CurrBanner
000b5ddc  ldr     r0, [r0]
000b5dde  pop.w   {r8, sl}
000b5de2  pop     {r4, r5, r6, r7, pc}
000b5de4  str     r0, [r7, #0x44]
000b5de6  movs    r5, r5
000b5de8  ldr     r4, [r6, #0x48]
000b5dea  movs    r4, r0
000b5dec  ldrb    r4, [r7, #0x1e]
000b5dee  movs    r4, r0
000b5df0  ldr     r2, [r5, #0x48]
000b5df2  movs    r4, r0
000b5df4  str     r2, [r2, #0x44]
000b5df6  movs    r5, r5
000b5df8  ldr     r0, [r3, #0x48]
000b5dfa  movs    r4, r0
000b5dfc  ldr     r4, [r7, #0x5c]
000b5dfe  movs    r4, r0
000b5e00  adr     r1, #0x238
000b5e02  movs    r4, r1
000b5e04  ldr     r0, [r4, #0x5c]
000b5e06  movs    r4, r0
000b5e08  strb    r6, [r3, #0x1c]
000b5e0a  movs    r4, r0
000b5e0c  adr     r0, #0x3f8
000b5e0e  movs    r4, r1
000b5e10  strb    r6, [r3, #0x13]
000b5e12  movs    r4, r0
000b5e14  adr     r0, #0x3c8
000b5e16  movs    r4, r1
000b5e18  strb    r6, [r7, #0x12]
000b5e1a  movs    r4, r0
000b5e1c  ldrh    r6, [r6, #0xe]
000b5e1e  movs    r4, r1
000b5e20  strb    r2, [r3, #0x12]
000b5e22  movs    r4, r0
000b5e24  str     r2, [r5, #0x34]
000b5e26  movs    r5, r5
000b5e28  strb    r4, [r4, #0x1b]
000b5e2a  movs    r4, r0
000b5e2c  adr     r1, #0x48
000b5e2e  movs    r4, r1
000b5e30  str     r4, [r7, #0x40]
000b5e32  movs    r5, r5
000b5e34  strb    r0, [r2, #0x1a]
000b5e36  movs    r4, r0
000b5e38  ldr     r4, [r1, #0x3c]
000b5e3a  movs    r4, r0
000b5e3c  ldrb    r4, [r6, #0x17]
000b5e3e  movs    r4, r0
000b5e40  ldr     r6, [r0, #0x60]
000b5e42  movs    r4, r0
000b5e44  ldr     r2, [r0, #0x70]
000b5e46  movs    r4, r0
000b5e48  str     r4, [r6, #0x3c]
000b5e4a  movs    r5, r5
000b5e4c  str     r2, [r3, #0x34]
000b5e4e  movs    r5, r5
