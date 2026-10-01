========================================================================
-[EAMTX_Network NetworkingURLRequest  0x000c6b7c  992 bytes   EAMTX_Network.mm
========================================================================

000c6b7c  push    {r4, r5, r6, r7, lr}
000c6b7e  add     r7, sp, #0xc
000c6b80  push.w  {r8, sl, fp}
000c6b84  sub     sp, #0x8c
000c6b86  str     r3, [sp, #0xc]
000c6b88  ldr     r3, [pc, #0x300]
000c6b8a  str     r0, [sp, #0x10]
000c6b8c  ldr     r1, [sp, #0x10]
000c6b8e  add     r3, pc ; -> 0x000f7da8  OBJC_IVAR_$_EAMTX_Network.m_LastRequestURL
000c6b90  mov     r6, r2
000c6b92  ldr     r0, [r3]
000c6b94  ldr.w   r8, [sp, #0xac]
000c6b98  ldr     r0, [r1, r0]
000c6b9a  cbz     r0, #0xc6bd8
000c6b9c  ldr     r1, [pc, #0x2f0]
000c6b9e  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000c6ba0  ldr     r1, [r1]
000c6ba2  blx     #0xddbfc ; -> objc_msgSend
000c6ba6  uxtb    r4, r0
000c6ba8  cmp     r4, #0
000c6baa  beq.w   #0xc6e6e
000c6bae  b       #0xc6bfe
000c6bb0  ldr     r1, [pc, #0x2e0]
000c6bb2  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c6bb4  ldr     r1, [r1]
000c6bb6  blx     #0xddbfc ; -> objc_msgSend
000c6bba  cbz     r0, #0xc6bd8
000c6bbc  ldr.w   r5, [pc, #0x2d8]
000c6bc0  ldr     r1, [pc, #0x2d8]
000c6bc2  ldr     r2, [sp, #0x10]
000c6bc4  add     r5, pc ; -> 0x000f7da8  OBJC_IVAR_$_EAMTX_Network.m_LastRequestURL
000c6bc6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c6bc8  ldr     r3, [r5]
000c6bca  ldr     r1, [r1]
000c6bcc  ldr     r0, [r2, r3]
000c6bce  blx     #0xddbfc ; -> objc_msgSend
000c6bd2  ldr     r3, [r5]
000c6bd4  ldr     r0, [sp, #0x10]
000c6bd6  str     r4, [r0, r3]
000c6bd8  ldr     r0, [pc, #0x2c4]
000c6bda  ldr     r1, [pc, #0x2c8]
000c6bdc  ldr     r3, [pc, #0x2c8]
000c6bde  add     r0, pc ; -> 0x000fdb5c  
000c6be0  add     r1, pc ; -> 0x000fcb24  '\x1c=\x0e'
000c6be2  add     r3, pc ; -> 0x000f7da8  OBJC_IVAR_$_EAMTX_Network.m_LastRequestURL
000c6be4  ldr     r1, [r1]
000c6be6  mov     r2, r6
000c6be8  ldr     r0, [r0]
000c6bea  ldr     r4, [r3]
000c6bec  blx     #0xddbfc ; -> objc_msgSend
000c6bf0  ldr     r1, [pc, #0x2b8]
000c6bf2  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c6bf4  ldr     r1, [r1]
000c6bf6  blx     #0xddbfc ; -> objc_msgSend
000c6bfa  ldr     r1, [sp, #0x10]
000c6bfc  str     r0, [r1, r4]
000c6bfe  ldr     r1, [pc, #0x2b0]
000c6c00  movs    r2, #4
000c6c02  mov     r0, r6
000c6c04  add     r1, pc ; -> 0x000fcd20  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a8
000c6c06  ldr     r1, [r1]
000c6c08  blx     #0xddbfc ; -> objc_msgSend
000c6c0c  ldr     r1, [pc, #0x2a4]
000c6c0e  add     r1, pc ; -> 0x000fce34  
000c6c10  ldr     r4, [r1]
000c6c12  ldr     r1, [pc, #0x2a4]
000c6c14  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000c6c16  ldr     r1, [r1]
000c6c18  mov     r2, r0
000c6c1a  ldr     r0, [pc, #0x2a0]
000c6c1c  add     r0, pc ; -> 0x000fdbe4  
000c6c1e  ldr     r5, [r0]
000c6c20  ldr     r0, [pc, #0x29c]
000c6c22  add     r0, pc ; -> 0x000fdb64  
000c6c24  ldr     r0, [r0]
000c6c26  blx     #0xddbfc ; -> objc_msgSend
000c6c2a  ldr     r1, [pc, #0x298]
000c6c2c  movs    r3, #0
000c6c2e  mov     r2, r0
000c6c30  movs    r0, #0
000c6c32  stm.w   sp, {r0, r1}
000c6c36  mov     r0, r5
000c6c38  mov     r1, r4
000c6c3a  blx     #0xddbfc ; -> objc_msgSend
000c6c3e  str     r0, [sp, #0x14]
000c6c40  cmp.w   r8, #0
000c6c44  beq     #0xc6c6a
000c6c46  ldr     r1, [pc, #0x280]
000c6c48  ldr     r2, [pc, #0x280]
000c6c4a  mov     r0, r8
000c6c4c  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000c6c4e  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000c6c50  ldr     r1, [r1]
000c6c52  blx     #0xddbfc ; -> objc_msgSend
000c6c56  tst.w   r0, #0xff
000c6c5a  bne     #0xc6c6a
000c6c5c  ldr     r1, [pc, #0x270]
000c6c5e  ldr     r0, [sp, #0x14]
000c6c60  mov     r2, r8
000c6c62  add     r1, pc ; -> 0x000fcbe0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x268
000c6c64  ldr     r1, [r1]
000c6c66  blx     #0xddbfc ; -> objc_msgSend
000c6c6a  ldr     r0, [pc, #0x268]
000c6c6c  add     r0, pc ; -> 0x00181b64  
000c6c6e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6c72  ldr     r0, [pc, #0x264]
000c6c74  ldr     r1, [pc, #0x264]
000c6c76  ldr     r3, [pc, #0x268]
000c6c78  add     r0, pc ; -> 0x000fdb5c  
000c6c7a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c6c7c  add     r3, pc ; -> 0x000f7d8c  OBJC_IVAR_$_EAMTX_Network.requestId
000c6c7e  ldr.w   fp, [r1]
000c6c82  ldr     r0, [r0]
000c6c84  ldr     r1, [sp, #0x10]
000c6c86  ldr     r3, [r3]
000c6c88  ldr     r2, [pc, #0x258]
000c6c8a  str     r0, [sp, #0x18]
000c6c8c  add     r2, pc ; -> 0x00181064  
000c6c8e  ldr     r3, [r1, r3]
000c6c90  mov     r1, fp
000c6c92  blx     #0xddbfc ; -> objc_msgSend
000c6c96  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6c9a  ldr     r2, [pc, #0x24c]
000c6c9c  mov     r1, fp
000c6c9e  mov     r3, r6
000c6ca0  add     r2, pc ; -> 0x00181b74  
000c6ca2  ldr     r0, [sp, #0x18]
000c6ca4  blx     #0xddbfc ; -> objc_msgSend
000c6ca8  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6cac  ldr     r2, [pc, #0x23c]
000c6cae  mov     r1, fp
000c6cb0  mov     r3, r8
000c6cb2  add     r2, pc ; -> 0x00181bd4  
000c6cb4  ldr     r0, [sp, #0x18]
000c6cb6  blx     #0xddbfc ; -> objc_msgSend
000c6cba  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6cbe  ldr     r0, [pc, #0x230]
000c6cc0  add     r0, pc ; -> 0x00181b94  
000c6cc2  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6cc6  ldr     r2, [sp, #0xc]
000c6cc8  cmp     r2, #0
000c6cca  beq     #0xc6da0
000c6ccc  ldr     r1, [pc, #0x224]
000c6cce  mov     r0, r2
000c6cd0  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c6cd2  ldr     r1, [r1]
000c6cd4  blx     #0xddbfc ; -> objc_msgSend
000c6cd8  cmp     r0, #0
000c6cda  beq     #0xc6da0
000c6cdc  ldr     r1, [pc, #0x218]
000c6cde  ldr     r0, [sp, #0xc]
000c6ce0  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000c6ce2  ldr     r1, [r1]
000c6ce4  blx     #0xddbfc ; -> objc_msgSend
000c6ce8  ldr     r1, [pc, #0x210]
000c6cea  movs    r3, #0
000c6cec  add     r2, sp, #0x6c
000c6cee  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000c6cf0  str     r3, [sp, #0x6c]
000c6cf2  ldr     r1, [r1]
000c6cf4  str     r3, [sp, #0x70]
000c6cf6  str     r3, [sp, #0x74]
000c6cf8  str     r3, [sp, #0x78]
000c6cfa  str     r3, [sp, #0x7c]
000c6cfc  str     r3, [sp, #0x80]
000c6cfe  str     r3, [sp, #0x84]
000c6d00  str     r3, [sp, #0x88]
000c6d02  adds    r3, #0x10
000c6d04  str     r3, [sp]
000c6d06  add     r3, sp, #0x2c
000c6d08  str     r1, [sp, #0x1c]
000c6d0a  str     r0, [sp, #0x24]
000c6d0c  blx     #0xddbfc ; -> objc_msgSend
000c6d10  cmp     r0, #0
000c6d12  beq     #0xc6da0
000c6d14  ldr     r3, [sp, #0x74]
000c6d16  ldr     r2, [pc, #0x1e8]
000c6d18  mov     sl, r0
000c6d1a  ldr     r1, [r3]
000c6d1c  str     r2, [sp, #8]
000c6d1e  str     r1, [sp, #0x28]
000c6d20  ldr     r1, [pc, #0x1e0]
000c6d22  add     r1, pc ; -> 0x000fcbdc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x264
000c6d24  ldr     r1, [r1]
000c6d26  str     r1, [sp, #0x20]
000c6d28  ldr     r1, [pc, #0x1dc]
000c6d2a  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000c6d2c  ldr.w   r8, [r1]
000c6d30  b       #0xc6d34
000c6d32  ldr     r3, [sp, #0x74]
000c6d34  movs    r6, #0
000c6d36  b       #0xc6d3a
000c6d38  ldr     r3, [sp, #0x74]
000c6d3a  ldr     r3, [r3]
000c6d3c  ldr     r0, [sp, #0x28]
000c6d3e  cmp     r3, r0
000c6d40  beq     #0xc6d48
000c6d42  ldr     r0, [sp, #0x24]
000c6d44  blx     #0xddbe4 ; -> objc_enumerationMutation
000c6d48  ldr     r2, [sp, #0x70]
000c6d4a  mov     r1, r8
000c6d4c  ldr     r0, [sp, #0xc]
000c6d4e  ldr.w   r4, [r2, r6, lsl #2]
000c6d52  adds    r6, #1
000c6d54  mov     r2, r4
000c6d56  blx     #0xddbfc ; -> objc_msgSend
000c6d5a  mov     r3, r4
000c6d5c  ldr     r1, [sp, #0x20]
000c6d5e  mov     r2, r0
000c6d60  ldr     r0, [sp, #0x14]
000c6d62  blx     #0xddbfc ; -> objc_msgSend
000c6d66  mov     r1, r8
000c6d68  mov     r2, r4
000c6d6a  ldr     r0, [sp, #0xc]
000c6d6c  ldr     r5, [sp, #8]
000c6d6e  blx     #0xddbfc ; -> objc_msgSend
000c6d72  mov     r1, fp
000c6d74  add     r5, pc
000c6d76  mov     r3, r4
000c6d78  mov     r2, r5
000c6d7a  str     r0, [sp]
000c6d7c  ldr     r0, [sp, #0x18]
000c6d7e  blx     #0xddbfc ; -> objc_msgSend
000c6d82  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6d86  cmp     sl, r6
000c6d88  bhi     #0xc6d38
000c6d8a  movs    r3, #0x10
000c6d8c  ldr     r0, [sp, #0x24]
000c6d8e  str     r3, [sp]
000c6d90  ldr     r1, [sp, #0x1c]
000c6d92  add     r2, sp, #0x6c
000c6d94  add     r3, sp, #0x2c
000c6d96  blx     #0xddbfc ; -> objc_msgSend
000c6d9a  mov     sl, r0
000c6d9c  cmp     r0, #0
000c6d9e  bne     #0xc6d32
000c6da0  ldr     r0, [pc, #0x168]
000c6da2  add     r0, pc ; -> 0x00181bc4  
000c6da4  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6da8  ldr     r3, [pc, #0x164]
000c6daa  ldr     r1, [sp, #0x10]
000c6dac  add     r3, pc ; -> 0x000f7d78  OBJC_IVAR_$_EAMTX_Network.startingByteIdx
000c6dae  ldr     r3, [r3]
000c6db0  ldr     r3, [r1, r3]
000c6db2  cmp     r3, #0
000c6db4  ble     #0xc6de2
000c6db6  ldr     r1, [pc, #0x15c]
000c6db8  ldr     r0, [sp, #0x10]
000c6dba  ldr     r2, [pc, #0x15c]
000c6dbc  add     r1, pc ; -> 0x000fcbdc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x264
000c6dbe  ldr     r4, [r1]
000c6dc0  ldr     r1, [pc, #0x158]
000c6dc2  add     r2, pc ; -> 0x00181be4  
000c6dc4  add     r1, pc ; -> 0x000f7d7c  OBJC_IVAR_$_EAMTX_Network.endingByteIdx
000c6dc6  ldr     r1, [r1]
000c6dc8  ldr     r1, [r0, r1]
000c6dca  ldr     r0, [sp, #0x18]
000c6dcc  str     r1, [sp]
000c6dce  mov     r1, fp
000c6dd0  blx     #0xddbfc ; -> objc_msgSend
000c6dd4  ldr     r3, [pc, #0x148]
000c6dd6  mov     r1, r4
000c6dd8  add     r3, pc ; -> 0x00181bf4  
000c6dda  mov     r2, r0
000c6ddc  ldr     r0, [sp, #0x14]
000c6dde  blx     #0xddbfc ; -> objc_msgSend
000c6de2  ldr     r0, [pc, #0x140]
000c6de4  ldr     r1, [pc, #0x140]
000c6de6  movs    r6, #1
000c6de8  add     r0, pc ; -> 0x000fdbb4  
000c6dea  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000c6dec  ldr     r0, [r0]
000c6dee  ldr     r1, [r1]
000c6df0  blx     #0xddbfc ; -> objc_msgSend
000c6df4  ldr     r1, [pc, #0x134]
000c6df6  add     r1, pc ; -> 0x000fd7c8  'J\x05\x0f'
000c6df8  ldr     r1, [r1]
000c6dfa  mov     r2, r0
000c6dfc  ldr     r0, [pc, #0x130]
000c6dfe  add     r0, pc ; -> 0x000f3270  mtxController
000c6e00  ldr     r4, [r0]
000c6e02  ldr     r0, [r4]
000c6e04  blx     #0xddbfc ; -> objc_msgSend
000c6e08  ldr     r1, [pc, #0x128]
000c6e0a  ldr     r0, [r4]
000c6e0c  movs    r2, #0
000c6e0e  add     r1, pc ; -> 0x000fd7c4  '_\x05\x0f'
000c6e10  ldr     r4, [pc, #0x124]
000c6e12  ldr     r1, [r1]
000c6e14  blx     #0xddbfc ; -> objc_msgSend
000c6e18  ldr     r0, [pc, #0x120]
000c6e1a  ldr     r1, [pc, #0x124]
000c6e1c  add     r4, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c6e1e  add     r0, pc ; -> 0x000fdc08  
000c6e20  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c6e22  ldr     r0, [r0]
000c6e24  ldr     r1, [r1]
000c6e26  ldr     r5, [r4]
000c6e28  blx     #0xddbfc ; -> objc_msgSend
000c6e2c  ldr     r1, [pc, #0x114]
000c6e2e  ldr     r3, [sp, #0x10]
000c6e30  ldr     r2, [sp, #0x14]
000c6e32  add     r1, pc ; -> 0x000fd7c0  'Z\t\x0f'
000c6e34  str     r6, [sp]
000c6e36  ldr     r1, [r1]
000c6e38  blx     #0xddbfc ; -> objc_msgSend
000c6e3c  ldr     r1, [sp, #0x10]
000c6e3e  str     r0, [r1, r5]
000c6e40  ldr     r3, [r4]
000c6e42  ldr     r0, [r1, r3]
000c6e44  cbz     r0, #0xc6e80
000c6e46  ldr     r0, [pc, #0x100]
000c6e48  ldr     r1, [pc, #0x100]
000c6e4a  ldr     r3, [pc, #0x104]
000c6e4c  add     r0, pc ; -> 0x000fdbbc  
000c6e4e  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000c6e50  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c6e52  ldr     r1, [r1]
000c6e54  ldr     r0, [r0]
000c6e56  ldr     r4, [r3]
000c6e58  blx     #0xddbfc ; -> objc_msgSend
000c6e5c  ldr     r1, [pc, #0xf4]
000c6e5e  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c6e60  ldr     r1, [r1]
000c6e62  blx     #0xddbfc ; -> objc_msgSend
000c6e66  ldr     r2, [sp, #0x10]
000c6e68  str     r0, [r2, r4]
000c6e6a  mov     r0, r6
000c6e6c  b       #0xc6e80
000c6e6e  ldr     r3, [pc, #0xe8]
000c6e70  add     r3, pc ; -> 0x000f7da8  OBJC_IVAR_$_EAMTX_Network.m_LastRequestURL
000c6e72  ldr     r0, [r3]
000c6e74  ldr     r3, [sp, #0x10]
000c6e76  ldr     r0, [r3, r0]
000c6e78  cmp     r0, #0
000c6e7a  bne.w   #0xc6bb0
000c6e7e  b       #0xc6bd8
000c6e80  sub.w   sp, r7, #0x18
000c6e84  pop.w   {r8, sl, fp}
000c6e88  pop     {r4, r5, r6, r7, pc}
000c6e8a  nop     
000c6e8c  asrs    r6, r2, #8
000c6e8e  movs    r3, r0
000c6e90  str     r2, [r0, #0xc]
000c6e92  movs    r3, r0
000c6e94  ldr     r6, [r2, #0x40]
000c6e96  movs    r3, r0
000c6e98  asrs    r0, r4, #7
000c6e9a  movs    r3, r0
000c6e9c  ldrb    r2, [r6, r6]
000c6e9e  movs    r3, r0
000c6ea0  ldr     r2, [r7, #0x74]
000c6ea2  movs    r3, r0
000c6ea4  ldrsh   r0, [r0, r5]
000c6ea6  movs    r3, r0
000c6ea8  asrs    r2, r0, #7
000c6eaa  movs    r3, r0
000c6eac  str     r2, [r3, #0xc]
000c6eae  movs    r3, r0
000c6eb0  str     r0, [r3, #0x10]
000c6eb2  movs    r3, r0
000c6eb4  str     r2, [r4, #0x20]
000c6eb6  movs    r3, r0
000c6eb8  ldrsh   r0, [r3, r6]
000c6eba  movs    r3, r0
000c6ebc  ldr     r4, [r0, #0x7c]
000c6ebe  movs    r3, r0
000c6ec0  ldr     r6, [r7, #0x70]
000c6ec2  movs    r3, r0
000c6ec4  movs    r0, r0
000c6ec6  eors    r4, r0
000c6ec8  ldrsh   r0, [r7, r2]
000c6eca  movs    r3, r0
000c6ecc  strb    r2, [r4, #0x1a]
000c6ece  movs    r3, r1
000c6ed0  ldrsh   r2, [r7, r5]
000c6ed2  movs    r3, r0
000c6ed4  add     r6, sp, #0x3d0
000c6ed6  movs    r3, r1
000c6ed8  ldr     r0, [r4, #0x6c]
000c6eda  movs    r3, r0
000c6edc  ldrsh   r2, [r4, r0]
000c6ede  movs    r3, r0
000c6ee0  asrs    r4, r1, #4
000c6ee2  movs    r3, r0
000c6ee4  adr     r3, #0x350
000c6ee6  movs    r3, r1
000c6ee8  add     r6, sp, #0x340
000c6eea  movs    r3, r1
000c6eec  add     r7, sp, #0x78
000c6eee  movs    r3, r1
000c6ef0  add     r6, sp, #0x340
000c6ef2  movs    r3, r1
000c6ef4  ldrb    r4, [r5, r6]
000c6ef6  movs    r3, r0
000c6ef8  str     r4, [r1, #0x18]
000c6efa  movs    r3, r0
000c6efc  ldrb    r6, [r4, r2]
000c6efe  movs    r3, r0
000c6f00  add     r6, sp, #0xb0
000c6f02  movs    r3, r1
000c6f04  ldrsh   r6, [r6, r2]
000c6f06  movs    r3, r0
000c6f08  ldrb    r6, [r4, r6]
000c6f0a  movs    r3, r0
000c6f0c  add     r6, sp, #0x78
000c6f0e  movs    r3, r1
000c6f10  lsrs    r0, r1, #0x1f
000c6f12  movs    r3, r0
000c6f14  ldrsh   r4, [r3, r0]
000c6f16  movs    r3, r0
000c6f18  add     r6, sp, #0x78
000c6f1a  movs    r3, r1
000c6f1c  lsrs    r4, r6, #0x1e
000c6f1e  movs    r3, r0
000c6f20  add     r6, sp, #0x60
000c6f22  movs    r3, r1
000c6f24  ldr     r0, [r1, #0x5c]
000c6f26  movs    r3, r0
000c6f28  ldrb    r2, [r3, r7]
000c6f2a  movs    r3, r0
000c6f2c  ldr     r6, [r1, #0x1c]
000c6f2e  movs    r3, r0
000c6f30  stm     r4!, {r1, r2, r3, r5, r6}
000c6f32  movs    r2, r0
000c6f34  ldr     r2, [r6, #0x18]
000c6f36  movs    r3, r0
000c6f38  lsrs    r4, r0, #0x1e
000c6f3a  movs    r3, r0
000c6f3c  ldr     r6, [r4, #0x5c]
000c6f3e  movs    r3, r0
000c6f40  ldrh    r0, [r4, r5]
000c6f42  movs    r3, r0
000c6f44  ldr     r2, [r1, #0x18]
000c6f46  movs    r3, r0
000c6f48  ldr     r4, [r5, #0x54]
000c6f4a  movs    r3, r0
000c6f4c  ldrsh   r2, [r0, r3]
000c6f4e  movs    r3, r0
000c6f50  lsrs    r0, r1, #0x1d
000c6f52  movs    r3, r0
000c6f54  ldrsh   r6, [r5, r1]
000c6f56  movs    r3, r0
000c6f58  lsrs    r4, r6, #0x1c
000c6f5a  movs    r3, r0
