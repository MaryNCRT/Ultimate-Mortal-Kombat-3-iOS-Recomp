========================================================================
-[EAMTX_TransObserver restoreTransaction  0x000c7abc  816 bytes   EAMTX_TransObserver.mm
========================================================================

000c7abc  push    {r4, r5, r6, r7, lr}
000c7abe  add     r7, sp, #0xc
000c7ac0  push.w  {r8, sl, fp}
000c7ac4  sub     sp, #0x1c
000c7ac6  ldr     r3, [pc, #0x274]
000c7ac8  mov     sl, r0
000c7aca  mov     r8, r2
000c7acc  add     r3, pc ; -> 0x000f3280  bRequiredToShowAlert
000c7ace  ldr     r3, [r3]
000c7ad0  ldrb    r3, [r3]
000c7ad2  cmp     r3, #0
000c7ad4  bne.w   #0xc7d32
000c7ad8  ldr     r3, [pc, #0x264]
000c7ada  add     r3, pc ; -> 0x000f7fd0  OBJC_IVAR_$_EAMTX_TransObserver.m_RestoreState
000c7adc  ldr     r3, [r3]
000c7ade  ldr     r3, [r0, r3]
000c7ae0  cmp     r3, #1
000c7ae2  bne.w   #0xc7cde
000c7ae6  ldr.w   r1, [pc, #0x25c]
000c7aea  ldr.w   r0, [pc, #0x25c]
000c7aee  ldr     r4, [pc, #0x25c]
000c7af0  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c7af2  add     r0, pc ; -> 0x000fdb5c  
000c7af4  ldr     r1, [r1]
000c7af6  ldr     r0, [r0]
000c7af8  add     r4, pc ; -> 0x00181594  
000c7afa  str     r1, [sp, #8]
000c7afc  ldr     r1, [pc, #0x250]
000c7afe  str     r0, [sp, #4]
000c7b00  mov     r0, r2
000c7b02  add     r1, pc ; -> 0x000fd720  
000c7b04  ldr     r1, [r1]
000c7b06  str     r1, [sp, #0xc]
000c7b08  blx     #0xddbfc ; -> objc_msgSend
000c7b0c  ldr     r1, [pc, #0x244]
000c7b0e  add     r1, pc ; -> 0x000fd724  
000c7b10  ldr.w   fp, [r1]
000c7b14  mov     r1, fp
000c7b16  blx     #0xddbfc ; -> objc_msgSend
000c7b1a  mov     r2, r4
000c7b1c  mov     r3, r8
000c7b1e  ldr     r1, [sp, #8]
000c7b20  ldr     r4, [pc, #0x234]
000c7b22  add     r4, pc ; -> 0x0017ef54  
000c7b24  str     r0, [sp]
000c7b26  ldr     r0, [sp, #4]
000c7b28  blx     #0xddbfc ; -> objc_msgSend
000c7b2c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7b30  ldr     r1, [pc, #0x228]
000c7b32  mov     r0, r8
000c7b34  add     r1, pc ; -> 0x000fd71c  
000c7b36  ldr     r1, [r1]
000c7b38  blx     #0xddbfc ; -> objc_msgSend
000c7b3c  ldr     r3, [pc, #0x220]
000c7b3e  ldr     r1, [pc, #0x224]
000c7b40  add     r3, pc ; -> 0x000f3284  transId
000c7b42  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c7b44  ldr     r3, [r3]
000c7b46  ldr     r1, [r1]
000c7b48  str     r1, [sp, #0x10]
000c7b4a  str     r0, [r3]
000c7b4c  blx     #0xddbfc ; -> objc_msgSend
000c7b50  ldr     r1, [pc, #0x214]
000c7b52  mov     r0, r8
000c7b54  add     r1, pc ; -> 0x000fd718  
000c7b56  ldr     r1, [r1]
000c7b58  blx     #0xddbfc ; -> objc_msgSend
000c7b5c  mov     r2, r4
000c7b5e  ldr     r1, [sp, #8]
000c7b60  mov     r3, r0
000c7b62  ldr     r0, [sp, #4]
000c7b64  blx     #0xddbfc ; -> objc_msgSend
000c7b68  ldr     r3, [pc, #0x200]
000c7b6a  ldr     r1, [sp, #0x10]
000c7b6c  add     r3, pc ; -> 0x000f3268  receipt
000c7b6e  ldr     r3, [r3]
000c7b70  str     r0, [r3]
000c7b72  blx     #0xddbfc ; -> objc_msgSend
000c7b76  ldr     r1, [sp, #0xc]
000c7b78  mov     r0, r8
000c7b7a  blx     #0xddbfc ; -> objc_msgSend
000c7b7e  mov     r1, fp
000c7b80  blx     #0xddbfc ; -> objc_msgSend
000c7b84  ldr     r2, [pc, #0x1e8]
000c7b86  ldr     r3, [pc, #0x1ec]
000c7b88  add     r2, pc ; -> 0x000fd5f0  
000c7b8a  add     r3, pc ; -> 0x0017e364  kGraphBaseURL+0x234
000c7b8c  ldr     r2, [r2]
000c7b8e  mov     r1, r0
000c7b90  movs    r0, #4
000c7b92  str     r0, [sp]
000c7b94  add     r0, sp, #0x14
000c7b96  blx     #0xddc14 ; -> objc_msgSend_stret
000c7b9a  add     r4, sp, #0x14
000c7b9c  ldm     r4, {r4, r5}
000c7b9e  mvn     r3, #0x80000000
000c7ba2  cmp     r3, r4
000c7ba4  mov     r6, r4
000c7ba6  beq.w   #0xc7d16
000c7baa  ldr     r1, [sp, #0xc]
000c7bac  mov     r0, r8
000c7bae  blx     #0xddbfc ; -> objc_msgSend
000c7bb2  mov     r1, fp
000c7bb4  blx     #0xddbfc ; -> objc_msgSend
000c7bb8  ldr     r1, [pc, #0x1bc]
000c7bba  add.w   r2, r4, r5
000c7bbe  add     r1, pc ; -> 0x000fcdc4  
000c7bc0  ldr     r1, [r1]
000c7bc2  blx     #0xddbfc ; -> objc_msgSend
000c7bc6  ldr.w   r1, [pc, #0x1b4]
000c7bca  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c7bcc  ldr     r1, [r1]
000c7bce  mov     r4, r0
000c7bd0  ldr     r0, [pc, #0x1ac]
000c7bd2  mov     r2, r4
000c7bd4  add     r0, pc ; -> 0x000f3274  mtxProdsList
000c7bd6  ldr     r0, [r0]
000c7bd8  ldr     r0, [r0]
000c7bda  blx     #0xddbfc ; -> objc_msgSend
000c7bde  mov     r5, r0
000c7be0  cmp     r0, #0
000c7be2  beq     #0xc7cce
000c7be4  ldr     r1, [pc, #0x19c]
000c7be6  add     r1, pc ; -> 0x000fd6a0  
000c7be8  ldr     r1, [r1]
000c7bea  blx     #0xddbfc ; -> objc_msgSend
000c7bee  mov     r4, r0
000c7bf0  bl      #0xbe47c ; -> Z12getFreeSpacev
000c7bf4  mov     r2, r4
000c7bf6  asr.w   r3, r2, #0x1f
000c7bfa  cmp     r3, r1
000c7bfc  bhi     #0xc7c8e
000c7bfe  bne     #0xc7c04
000c7c00  cmp     r2, r0
000c7c02  bhi     #0xc7c8e
000c7c04  ldr     r1, [pc, #0x180]
000c7c06  mov     r0, r5
000c7c08  add     r1, pc ; -> 0x000fd3d8  
000c7c0a  ldr     r1, [r1]
000c7c0c  blx     #0xddbfc ; -> objc_msgSend
000c7c10  ldr     r3, [pc, #0x178]
000c7c12  ldr     r1, [pc, #0x17c]
000c7c14  add     r3, pc ; -> 0x000f3318  iItemSellId
000c7c16  add     r1, pc ; -> 0x000fd608  
000c7c18  ldr     r3, [r3]
000c7c1a  ldr     r1, [r1]
000c7c1c  str     r0, [r3]
000c7c1e  mov     r0, r5
000c7c20  blx     #0xddbfc ; -> objc_msgSend
000c7c24  ldr     r3, [pc, #0x16c]
000c7c26  add     r3, pc ; -> 0x000f327c  iItemPrice
000c7c28  ldr     r3, [r3]
000c7c2a  stm.w   r3, {r0, r1}
000c7c2e  ldr     r3, [pc, #0x168]
000c7c30  add     r3, pc ; -> 0x000f331c  currency
000c7c32  ldr     r4, [r3]
000c7c34  ldr     r0, [r4]
000c7c36  cbz     r0, #0xc7c42
000c7c38  ldr     r1, [pc, #0x160]
000c7c3a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c7c3c  ldr     r1, [r1]
000c7c3e  blx     #0xddbfc ; -> objc_msgSend
000c7c42  ldr     r1, [pc, #0x15c]
000c7c44  mov     r0, r5
000c7c46  add     r1, pc ; -> 0x000fd714  '|\x02\x0f'
000c7c48  ldr     r1, [r1]
000c7c4a  blx     #0xddbfc ; -> objc_msgSend
000c7c4e  ldr     r1, [sp, #0x10]
000c7c50  str     r0, [r4]
000c7c52  blx     #0xddbfc ; -> objc_msgSend
000c7c56  ldr     r0, [pc, #0x14c]
000c7c58  ldr     r1, [pc, #0x14c]
000c7c5a  add     r0, pc ; -> 0x000f3270  mtxController
000c7c5c  add     r1, pc ; -> 0x000fd450  
000c7c5e  ldr     r4, [r0]
000c7c60  ldr     r1, [r1]
000c7c62  ldr     r0, [r4]
000c7c64  blx     #0xddbfc ; -> objc_msgSend
000c7c68  ldr     r1, [pc, #0x140]
000c7c6a  add     r1, pc ; -> 0x000fd604  
000c7c6c  ldr     r1, [r1]
000c7c6e  mov     r2, r0
000c7c70  ldr     r0, [r4]
000c7c72  adds    r2, #1
000c7c74  blx     #0xddbfc ; -> objc_msgSend
000c7c78  ldr     r3, [pc, #0x134]
000c7c7a  ldr     r1, [pc, #0x138]
000c7c7c  ldr     r0, [r4]
000c7c7e  add     r3, pc ; -> 0x000f7fcc  OBJC_IVAR_$_EAMTX_TransObserver.requestId
000c7c80  add     r1, pc ; -> 0x000fd6d4  
000c7c82  ldr     r3, [r3]
000c7c84  ldr     r1, [r1]
000c7c86  movs    r2, #0x17
000c7c88  ldr.w   r3, [sl, r3]
000c7c8c  b       #0xc7cc8
000c7c8e  ldr     r1, [sp, #0xc]
000c7c90  mov     r0, r8
000c7c92  blx     #0xddbfc ; -> objc_msgSend
000c7c96  mov     r1, fp
000c7c98  blx     #0xddbfc ; -> objc_msgSend
000c7c9c  ldr     r4, [pc, #0x118]
000c7c9e  ldr     r1, [sp, #8]
000c7ca0  add     r4, pc ; -> 0x001815a4  
000c7ca2  mov     r2, r4
000c7ca4  mov     r3, r0
000c7ca6  ldr     r0, [sp, #4]
000c7ca8  blx     #0xddbfc ; -> objc_msgSend
000c7cac  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7cb0  ldr     r3, [pc, #0x108]
000c7cb2  ldr     r1, [pc, #0x10c]
000c7cb4  movs    r2, #3
000c7cb6  add     r3, pc ; -> 0x000f7fd0  OBJC_IVAR_$_EAMTX_TransObserver.m_RestoreState
000c7cb8  add     r1, pc ; -> 0x000fd734  
000c7cba  ldr     r3, [r3]
000c7cbc  ldr     r1, [r1]
000c7cbe  mov     r0, sl
000c7cc0  str.w   r2, [sl, r3]
000c7cc4  ldr     r3, [pc, #0xfc]
000c7cc6  adds    r2, #0x11
000c7cc8  blx     #0xddbfc ; -> objc_msgSend
000c7ccc  b       #0xc7d16
000c7cce  ldr     r2, [pc, #0xf8]
000c7cd0  ldr     r0, [sp, #4]
000c7cd2  ldr     r1, [sp, #8]
000c7cd4  add     r2, pc ; -> 0x001815b4  
000c7cd6  mov     r3, r4
000c7cd8  blx     #0xddbfc ; -> objc_msgSend
000c7cdc  b       #0xc7d12
000c7cde  ldr     r1, [pc, #0xec]
000c7ce0  ldr     r0, [pc, #0xec]
000c7ce2  ldr     r4, [pc, #0xf0]
000c7ce4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c7ce6  add     r0, pc ; -> 0x000fdb5c  
000c7ce8  ldr     r5, [r1]
000c7cea  ldr     r1, [pc, #0xec]
000c7cec  ldr     r6, [r0]
000c7cee  mov     r0, r2
000c7cf0  add     r1, pc ; -> 0x000fd720  
000c7cf2  add     r4, pc ; -> 0x001815c4  
000c7cf4  ldr     r1, [r1]
000c7cf6  blx     #0xddbfc ; -> objc_msgSend
000c7cfa  ldr     r1, [pc, #0xe0]
000c7cfc  add     r1, pc ; -> 0x000fd724  
000c7cfe  ldr     r1, [r1]
000c7d00  blx     #0xddbfc ; -> objc_msgSend
000c7d04  mov     r1, r5
000c7d06  mov     r2, r4
000c7d08  mov     r3, r8
000c7d0a  str     r0, [sp]
000c7d0c  mov     r0, r6
000c7d0e  blx     #0xddbfc ; -> objc_msgSend
000c7d12  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7d16  ldr     r0, [pc, #0xc8]
000c7d18  ldr     r1, [pc, #0xc8]
000c7d1a  add     r0, pc ; -> 0x000fdc6c  
000c7d1c  add     r1, pc ; -> 0x000fd644  
000c7d1e  ldr     r0, [r0]
000c7d20  ldr     r1, [r1]
000c7d22  blx     #0xddbfc ; -> objc_msgSend
000c7d26  ldr     r1, [pc, #0xc0]
000c7d28  mov     r2, r8
000c7d2a  add     r1, pc ; -> 0x000fd72c  
000c7d2c  ldr     r1, [r1]
000c7d2e  blx     #0xddbfc ; -> objc_msgSend
000c7d32  sub.w   sp, r7, #0x18
000c7d36  pop.w   {r8, sl, fp}
000c7d3a  pop     {r4, r5, r6, r7, pc}
