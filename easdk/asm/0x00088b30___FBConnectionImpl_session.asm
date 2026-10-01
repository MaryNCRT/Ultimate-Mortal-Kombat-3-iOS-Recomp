========================================================================
-[FBConnectionImpl session  0x00088b30  320 bytes   FBConnection.mm
========================================================================

00088b30  sub     sp, #4
00088b32  push    {r4, r5, r6, r7, lr}
00088b34  add     r7, sp, #0xc
00088b36  push.w  {r8, sl, fp}
00088b3a  sub     sp, #8
00088b3c  str     r0, [sp, #4]
00088b3e  ldr     r0, [pc, #0xe8]
00088b40  mov     sl, r2
00088b42  str     r3, [sp, #0x28]
00088b44  add     r0, pc ; -> 0x0017eea4  
00088b46  blx     #0xdd3e0 ; -> NSLog
00088b4a  ldr     r1, [pc, #0xe0]
00088b4c  ldr     r0, [pc, #0xe0]
00088b4e  ldr     r5, [pc, #0xe4]
00088b50  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00088b52  add     r0, pc ; -> 0x000fdb5c  
00088b54  ldr     r6, [r1]
00088b56  ldr     r1, [pc, #0xe0]
00088b58  ldr.w   r8, [r0]
00088b5c  mov     r0, sl
00088b5e  add     r1, pc ; -> 0x000fcf64  '\x143\x0e'
00088b60  add     r5, pc ; -> 0x0017eeb4  
00088b62  ldr.w   fp, [r1]
00088b66  mov     r1, fp
00088b68  blx     #0xddbfc ; -> objc_msgSend
00088b6c  mov     r2, r5
00088b6e  ldr     r5, [pc, #0xcc]
00088b70  add     r5, pc ; -> 0x00379bd0  m_connection
00088b72  mov     r3, r0
00088b74  str     r1, [sp]
00088b76  mov     r0, r8
00088b78  mov     r1, r6
00088b7a  blx     #0xddbfc ; -> objc_msgSend
00088b7e  ldr     r1, [pc, #0xc0]
00088b80  ldr     r3, [pc, #0xc0]
00088b82  movs    r6, #1
00088b84  add     r1, pc ; -> 0x000fcdec  '(5\x0e'
00088b86  add     r3, pc ; -> 0x0017eec4  
00088b88  ldr     r1, [r1]
00088b8a  mov     r2, r0
00088b8c  ldr     r0, [pc, #0xb8]
00088b8e  add     r0, pc ; -> 0x000fdb44  
00088b90  ldr     r0, [r0]
00088b92  blx     #0xddbfc ; -> objc_msgSend
00088b96  ldr     r1, [pc, #0xb4]
00088b98  ldr     r2, [sp, #4]
00088b9a  add     r1, pc ; -> 0x000fcf70  
00088b9c  ldr     r1, [r1]
00088b9e  mov     r4, r0
00088ba0  ldr     r0, [pc, #0xac]
00088ba2  add     r0, pc ; -> 0x000fdbf0  
00088ba4  ldr     r0, [r0]
00088ba6  blx     #0xddbfc ; -> objc_msgSend
00088baa  ldr     r1, [pc, #0xa8]
00088bac  ldr     r2, [pc, #0xa8]
00088bae  mov     r3, r4
00088bb0  add     r1, pc ; -> 0x000fcde4  '\x0c5\x0e'
00088bb2  add     r2, pc ; -> 0x0017eed4  
00088bb4  ldr     r1, [r1]
00088bb6  blx     #0xddbfc ; -> objc_msgSend
00088bba  ldr     r3, [pc, #0xa0]
00088bbc  ldr     r1, [pc, #0xa0]
00088bbe  ldr     r2, [pc, #0xa4]
00088bc0  add     r3, pc ; -> 0x00379bd4  m_loggedIn
00088bc2  add     r1, pc ; -> 0x000fca38  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc0
00088bc4  add     r2, pc ; -> 0x000fcf6c  '\x1bJ\x0e'
00088bc6  strb    r6, [r3]
00088bc8  ldr     r2, [r2]
00088bca  movs    r3, #0
00088bcc  ldr     r0, [sp, #4]
00088bce  ldr     r1, [r1]
00088bd0  str     r6, [sp]
00088bd2  blx     #0xddbfc ; -> objc_msgSend
00088bd6  mov     r0, sl
00088bd8  mov     r1, fp
00088bda  ldr     r4, [r5]
00088bdc  blx     #0xddbfc ; -> objc_msgSend
00088be0  str     r0, [r4, #4]
00088be2  str     r1, [r4, #8]
00088be4  ldr     r1, [pc, #0x80]
00088be6  mov     r0, sl
00088be8  ldr.w   r8, [r5]
00088bec  add     r1, pc ; -> 0x000fcdfc  'L<\x0e'
00088bee  ldr     r1, [r1]
00088bf0  blx     #0xddbfc ; -> objc_msgSend
00088bf4  ldr     r1, [pc, #0x74]
00088bf6  mov     r2, r6
00088bf8  add     r1, pc ; -> 0x000fcf68  
00088bfa  ldr     r1, [r1]
00088bfc  blx     #0xddbfc ; -> objc_msgSend
00088c00  mov     r4, r0
00088c02  blx     #0xdde0c ; -> strlen
00088c06  mov     r1, r4
00088c08  mov     r2, r0
00088c0a  add.w   r0, r8, #0xc
00088c0e  blx     #0xdd50c ; -> ZNSs6assignEPKcm
00088c12  ldr     r0, [r5]
00088c14  bl      #0x889d0 ; -> ZN12FBConnection10deactivateEv
00088c18  sub.w   sp, r7, #0x18
00088c1c  pop.w   {r8, sl, fp}
00088c20  pop.w   {r4, r5, r6, r7, lr}
00088c24  add     sp, #4
00088c26  bx      lr
00088c28  str     r4, [r3, #0x34]
00088c2a  movs    r7, r1
00088c2c  subs    r7, #0x4c
00088c2e  movs    r7, r0
00088c30  str     r6, [r0, r0]
00088c32  movs    r7, r0
00088c34  str     r0, [r2, #0x34]
00088c36  movs    r7, r1
00088c38  add     r2, r0
00088c3a  movs    r7, r0
00088c3c  asrs    r4, r3, #1
00088c3e  movs    r7, r5
00088c40  rsbs    r4, r4, #0
00088c42  movs    r7, r0
00088c44  str     r2, [r7, #0x30]
00088c46  movs    r7, r1
00088c48  ldr     r7, [pc, #0x2c8]
00088c4a  movs    r7, r0
00088c4c  mvns    r2, r2
00088c4e  movs    r7, r0
00088c50  str     r2, [r1, r1]
00088c52  movs    r7, r0
00088c54  tst     r0, r6
00088c56  movs    r7, r0
00088c58  str     r6, [r3, #0x30]
00088c5a  movs    r7, r1
00088c5c  asrs    r0, r2, #0x20
00088c5e  movs    r7, r5
00088c60  subs    r6, #0x72
00088c62  movs    r7, r0
00088c64  bics    r4, r4
00088c66  movs    r7, r0
00088c68  tst     r4, r1
00088c6a  movs    r7, r0
00088c6c  muls    r4, r5, r4
00088c6e  movs    r7, r0
