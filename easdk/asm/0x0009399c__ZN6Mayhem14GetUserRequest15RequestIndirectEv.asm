========================================================================
ZN6Mayhem14GetUserRequest15RequestIndirectEv  0x0009399c  1624 bytes   Mayhem.mm
========================================================================

0009399c  push    {r4, r5, r6, r7, lr}
0009399e  add     r7, sp, #0xc
000939a0  push.w  {r8, sl, fp}
000939a4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000939a8  sub     sp, #0xf4
000939aa  ldr.w   r3, [pc, #0x580]
000939ae  str     r0, [sp, #0x10]
000939b0  add     r0, sp, #0x88
000939b2  add     r3, pc ; -> 0x000f3438  0x0
000939b4  str     r7, [sp, #0xa8]
000939b6  ldr     r3, [r3]
000939b8  str.w   sp, [sp, #0xb0]
000939bc  str     r3, [sp, #0xa0]
000939be  ldr.w   r3, [pc, #0x570]
000939c2  add     r3, pc ; -> 0x000ee47e  GCC_except_table83
000939c4  str     r3, [sp, #0xa4]
000939c6  ldr.w   r3, [pc, #0x56c]
000939ca  add     r3, pc ; -> 0x00093e00  
000939cc  orr     r3, r3, #1
000939d0  str     r3, [sp, #0xac]
000939d2  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000939d6  ldr     r1, [sp, #0x10]
000939d8  add.w   r2, r1, #0x5c
000939dc  ldm     r2, {r2, r3}
000939de  cmp.w   r2, #-1
000939e2  beq.w   #0x93c1c
000939e6  ldr.w   r5, [pc, #0x550]
000939ea  ldr.w   r0, [pc, #0x550]
000939ee  ldr.w   r1, [pc, #0x550]
000939f2  add     r5, pc ; -> 0x0017f264  
000939f4  str     r5, [sp, #0x50]
000939f6  ldr     r5, [sp, #0x10]
000939f8  ldr.w   r2, [pc, #0x548]
000939fc  add     r0, pc ; -> 0x000fdb5c  
000939fe  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00093a00  add.w   r3, r5, #0x5c
00093a04  ldm     r3, {r3, r4}
00093a06  ldr     r0, [r0]
00093a08  ldr     r1, [r1]
00093a0a  add     r2, pc ; -> 0x0017ede4  
00093a0c  mov.w   ip, #-1
00093a10  str     r4, [sp]
00093a12  str.w   ip, [sp, #0x8c]
00093a16  blx     #0xddbfc ; -> objc_msgSend
00093a1a  str     r0, [sp, #0x54]
00093a1c  ldr.w   r3, [pc, #0x528]
00093a20  ldr.w   lr, [pc, #0x528]
00093a24  add     r0, sp, #0xe8
00093a26  add     r3, pc ; -> 0x000fdb5c  
00093a28  ldr     r3, [r3]
00093a2a  mov     r1, lr
00093a2c  add     r1, pc
00093a2e  str     r1, [sp, #0xc]
00093a30  str     r3, [sp, #0x14]
00093a32  ldr.w   r3, [pc, #0x51c]
00093a36  add     r3, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00093a38  ldr     r3, [r3]
00093a3a  str     r3, [sp, #0x84]
00093a3c  mov.w   r3, #-1
00093a40  str     r3, [sp, #0x8c]
00093a42  bl      #0x8bb28 ; -> ZN6Mayhem12getMayhemURLEv
00093a46  ldr     r2, [sp, #0xe8]
00093a48  ldr     r3, [sp, #0x50]
00093a4a  ldr     r4, [sp, #0x54]
00093a4c  ldr     r0, [sp, #0x14]
00093a4e  str     r2, [sp, #0x70]
00093a50  str     r3, [sp]
00093a52  str     r4, [sp, #4]
00093a54  movs    r3, #6
00093a56  ldr     r1, [sp, #0x84]
00093a58  str     r3, [sp, #0x8c]
00093a5a  ldr     r2, [sp, #0xc]
00093a5c  ldr     r3, [sp, #0x70]
00093a5e  blx     #0xddbfc ; -> objc_msgSend
00093a62  ldr.w   r3, [pc, #0x4f0]
00093a66  ldr     r5, [sp, #0x70]
00093a68  str     r0, [sp, #0x18]
00093a6a  add     r3, pc ; -> 0x000f3370  0x0
00093a6c  sub.w   r0, r5, #0xc
00093a70  ldr     r3, [r3]
00093a72  cmp     r0, r3
00093a74  str     r3, [sp, #0x74]
00093a76  bne.w   #0x93da8
00093a7a  ldr.w   r3, [pc, #0x4dc]
00093a7e  ldr     r0, [sp, #0x14]
00093a80  add     r3, pc ; -> 0x000fcf68  
00093a82  ldr     r3, [r3]
00093a84  str     r3, [sp, #0x1c]
00093a86  ldr.w   r3, [pc, #0x4d4]
00093a8a  add     r3, pc ; -> 0x000fcf58  
00093a8c  ldr     r3, [r3]
00093a8e  str     r3, [sp, #0x20]
00093a90  ldr     r1, [sp, #0x20]
00093a92  mov.w   r3, #-1
00093a96  str     r3, [sp, #0x8c]
00093a98  blx     #0xddbfc ; -> objc_msgSend
00093a9c  ldr     r1, [sp, #0x1c]
00093a9e  mov     r2, r0
00093aa0  ldr     r0, [sp, #0x18]
00093aa2  blx     #0xddbfc ; -> objc_msgSend
00093aa6  movs    r3, #5
00093aa8  add.w   r2, sp, #0xf3
00093aac  str     r3, [sp, #0x8c]
00093aae  mov     r1, r0
00093ab0  add     r0, sp, #0xe4
00093ab2  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00093ab6  movs    r3, #4
00093ab8  add     r0, sp, #0xbc
00093aba  str     r3, [sp, #0x8c]
00093abc  add     r1, sp, #0xe4
00093abe  bl      #0x8b474 ; -> ZN6Mayhem11HTTPRequestC1ERKSs
00093ac2  ldr     r3, [sp, #0xe4]
00093ac4  ldr     r2, [sp, #0x74]
00093ac6  sub.w   r0, r3, #0xc
00093aca  cmp     r2, r0
00093acc  bne.w   #0x93d7c
00093ad0  ldr.w   r1, [pc, #0x48c]
00093ad4  movs    r3, #2
00093ad6  add     r0, sp, #0xe0
00093ad8  add     r1, pc ; -> 0x00175e60  'GET'
00093ada  str     r3, [sp, #0x8c]
00093adc  add.w   r2, sp, #0xf2
00093ae0  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00093ae4  movs    r3, #1
00093ae6  add     r0, sp, #0xbc
00093ae8  str     r3, [sp, #0x8c]
00093aea  add     r1, sp, #0xe0
00093aec  bl      #0x8b3e8 ; -> ZN6Mayhem11HTTPRequest9SetMethodERKSs
00093af0  ldr     r3, [sp, #0xe0]
00093af2  ldr     r2, [sp, #0x74]
00093af4  sub.w   r0, r3, #0xc
00093af8  cmp     r2, r0
00093afa  bne.w   #0x93d52
00093afe  ldr.w   r0, [pc, #0x464]
00093b02  movs    r1, #3
00093b04  str     r1, [sp, #0x8c]
00093b06  add     r0, pc ; -> 0x0017f284  
00093b08  blx     #0xdd3e0 ; -> NSLog
00093b0c  movs    r2, #3
00093b0e  add     r0, sp, #0xbc
00093b10  str     r2, [sp, #0x8c]
00093b12  bl      #0x8f6f0 ; -> ZN6Mayhem11HTTPRequest9DoRequestEv
00093b16  str     r0, [sp, #0x24]
00093b18  ldr.w   r0, [pc, #0x44c]
00093b1c  add     r0, pc ; -> 0x0017f294  
00093b1e  blx     #0xdd3e0 ; -> NSLog
00093b22  ldr.w   r0, [pc, #0x448]
00093b26  ldr.w   r1, [pc, #0x448]
00093b2a  add     r0, pc ; -> 0x000fdc00  
00093b2c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00093b2e  ldr     r0, [r0]
00093b30  ldr     r1, [r1]
00093b32  blx     #0xddbfc ; -> objc_msgSend
00093b36  ldr.w   r1, [pc, #0x43c]
00093b3a  ldr     r2, [sp, #0x24]
00093b3c  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
00093b3e  ldr     r1, [r1]
00093b40  blx     #0xddbfc ; -> objc_msgSend
00093b44  ldr.w   r1, [pc, #0x430]
00093b48  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
00093b4a  ldr     r1, [r1]
00093b4c  blx     #0xddbfc ; -> objc_msgSend
00093b50  ldr     r3, [sp, #0x10]
00093b52  ldr.w   r1, [pc, #0x428]
00093b56  str     r0, [sp, #0x28]
00093b58  ldr     r3, [r3, #0x18]
00093b5a  add     r1, pc ; -> 0x000fcfa4  
00093b5c  ldr     r1, [r1]
00093b5e  str     r3, [sp, #0x2c]
00093b60  mov     r0, r3
00093b62  blx     #0xddbfc ; -> objc_msgSend
00093b66  ldr.w   r1, [pc, #0x418]
00093b6a  ldr     r0, [sp, #0x28]
00093b6c  ldr     r2, [sp, #0x2c]
00093b6e  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
00093b70  ldr     r1, [r1]
00093b72  blx     #0xddbfc ; -> objc_msgSend
00093b76  ldr.w   r1, [pc, #0x40c]
00093b7a  ldr     r0, [sp, #0x28]
00093b7c  add     r1, pc ; -> 0x000fce60  '8U\x0e'
00093b7e  ldr     r1, [r1]
00093b80  blx     #0xddbfc ; -> objc_msgSend
00093b84  uxtb    r0, r0
00093b86  str     r0, [sp, #0x58]
00093b88  ldr     r0, [pc, #0x3fc]
00093b8a  add     r0, pc ; -> 0x0017f2a4  
00093b8c  blx     #0xdd3e0 ; -> NSLog
00093b90  ldr     r4, [sp, #0x58]
00093b92  cbz     r4, #0x93bbe
00093b94  ldr.w   r3, [pc, #0x3f4]
00093b98  ldr     r0, [sp, #0x2c]
00093b9a  add     r3, pc ; -> 0x000fcf9c  
00093b9c  ldr     r3, [r3]
00093b9e  str     r3, [sp, #0x30]
00093ba0  mov     r1, r3
00093ba2  blx     #0xddbfc ; -> objc_msgSend
00093ba6  ldr     r3, [pc, #0x3e8]
00093ba8  ldr     r2, [pc, #0x3e8]
00093baa  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00093bac  add     r2, pc ; -> 0x0017f064  
00093bae  ldr     r3, [r3]
00093bb0  str     r3, [sp, #0x34]
00093bb2  mov     r1, r3
00093bb4  blx     #0xddbfc ; -> objc_msgSend
00093bb8  str     r0, [sp, #0x38]
00093bba  cmp     r0, #0
00093bbc  beq     #0x93c4a
00093bbe  ldr     r1, [pc, #0x3d8]
00093bc0  ldr     r5, [sp, #0x10]
00093bc2  movs    r3, #3
00093bc4  add     r1, pc ; -> 0x000fcf9c  
00093bc6  adds    r5, #8
00093bc8  ldr     r1, [r1]
00093bca  str     r5, [sp, #0x80]
00093bcc  str     r3, [sp, #0x8c]
00093bce  ldr     r0, [sp, #0x2c]
00093bd0  blx     #0xddbfc ; -> objc_msgSend
00093bd4  mov     r1, r0
00093bd6  movs    r3, #3
00093bd8  ldr     r0, [sp, #0x80]
00093bda  str     r3, [sp, #0x8c]
00093bdc  bl      #0x8b870 ; -> ZN6Mayhem7Request11HandleErrorEPv
00093be0  ldr     r4, [sp, #0x10]
00093be2  movs    r1, #2
00093be4  add.w   r0, r4, #8
00093be8  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00093bec  ldr     r0, [pc, #0x3ac]
00093bee  movs    r3, #3
00093bf0  str     r3, [sp, #0x8c]
00093bf2  add     r0, pc ; -> 0x0017f354  
00093bf4  blx     #0xdd3e0 ; -> NSLog
00093bf8  add     r0, sp, #0xbc
00093bfa  mov.w   r3, #-1
00093bfe  str     r3, [sp, #0x8c]
00093c00  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
00093c04  add     r0, sp, #0x88
00093c06  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00093c0a  sub.w   sp, r7, #0x58
00093c0e  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00093c12  sub.w   sp, r7, #0x18
00093c16  pop.w   {r8, sl, fp}
00093c1a  pop     {r4, r5, r6, r7, pc}
00093c1c  cmp.w   r3, #-1
00093c20  bne.w   #0x939e6
00093c24  ldr     r0, [pc, #0x378]
00093c26  ldr     r1, [pc, #0x37c]
00093c28  ldr     r4, [pc, #0x37c]
00093c2a  add     r0, pc ; -> 0x000fdb50  
00093c2c  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
00093c2e  ldr     r0, [r0]
00093c30  ldr     r1, [r1]
00093c32  str     r3, [sp, #0x8c]
00093c34  add     r4, pc ; -> 0x0017f254  
00093c36  str     r4, [sp, #0x50]
00093c38  blx     #0xddbfc ; -> objc_msgSend
00093c3c  ldr     r1, [pc, #0x36c]
00093c3e  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
00093c40  ldr     r1, [r1]
00093c42  blx     #0xddbfc ; -> objc_msgSend
00093c46  str     r0, [sp, #0x54]
00093c48  b       #0x93a1c
00093c4a  ldr     r0, [pc, #0x364]
00093c4c  add     r0, pc ; -> 0x0017f2b4  
00093c4e  blx     #0xdd3e0 ; -> NSLog
00093c52  ldr     r0, [sp, #0x2c]
00093c54  ldr     r1, [sp, #0x30]
00093c56  blx     #0xddbfc ; -> objc_msgSend
00093c5a  ldr     r2, [pc, #0x358]
00093c5c  ldr     r1, [sp, #0x34]
00093c5e  add     r2, pc ; -> 0x0017f194  
00093c60  blx     #0xddbfc ; -> objc_msgSend
00093c64  str     r0, [sp, #0x3c]
00093c66  ldr     r0, [pc, #0x350]
00093c68  add     r0, pc ; -> 0x0017f2c4  
00093c6a  blx     #0xdd3e0 ; -> NSLog
00093c6e  ldr     r3, [pc, #0x34c]
00093c70  ldr     r0, [sp, #0x3c]
00093c72  ldr     r2, [sp, #0x38]
00093c74  add     r3, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00093c76  ldr     r3, [r3]
00093c78  str     r3, [sp, #0x40]
00093c7a  mov     r1, r3
00093c7c  blx     #0xddbfc ; -> objc_msgSend
00093c80  ldr     r1, [pc, #0x33c]
00093c82  add     r1, pc ; -> 0x000fcfa0  
00093c84  ldr     r1, [r1]
00093c86  blx     #0xddbfc ; -> objc_msgSend
00093c8a  ldr     r2, [pc, #0x338]
00093c8c  ldr     r1, [sp, #0x34]
00093c8e  add     r2, pc ; -> 0x0017f2d4  
00093c90  blx     #0xddbfc ; -> objc_msgSend
00093c94  str     r0, [sp, #0x44]
00093c96  ldr     r0, [pc, #0x330]
00093c98  add     r0, pc ; -> 0x0017f2e4  
00093c9a  blx     #0xdd3e0 ; -> NSLog
00093c9e  ldr     r0, [sp, #0x44]
00093ca0  ldr     r1, [sp, #0x40]
00093ca2  ldr     r2, [sp, #0x38]
00093ca4  blx     #0xddbfc ; -> objc_msgSend
00093ca8  str     r0, [sp, #0x48]
00093caa  ldr     r0, [pc, #0x320]
00093cac  add     r0, pc ; -> 0x0017f2f4  
00093cae  blx     #0xdd3e0 ; -> NSLog
00093cb2  ldr     r1, [pc, #0x31c]
00093cb4  ldr     r0, [sp, #0x48]
00093cb6  add     r1, pc ; -> 0x000fcc28  'tS\x0e'
00093cb8  ldr     r1, [r1]
00093cba  blx     #0xddbfc ; -> objc_msgSend
00093cbe  str     r0, [sp, #0x5c]
00093cc0  ldr     r0, [pc, #0x310]
00093cc2  ldr     r1, [sp, #0x5c]
00093cc4  add     r0, pc ; -> 0x0017f304  
00093cc6  blx     #0xdd3e0 ; -> NSLog
00093cca  ldr     r1, [pc, #0x30c]
00093ccc  ldr     r2, [pc, #0x30c]
00093cce  ldr     r0, [sp, #0x5c]
00093cd0  add     r1, pc ; -> 0x000fcf98  '\x1bU\x0e'
00093cd2  add     r2, pc ; -> 0x0017e794  
00093cd4  ldr     r1, [r1]
00093cd6  blx     #0xddbfc ; -> objc_msgSend
00093cda  str     r0, [sp, #0x60]
00093cdc  ldr     r0, [pc, #0x300]
00093cde  add     r0, pc ; -> 0x0017f314  
00093ce0  blx     #0xdd3e0 ; -> NSLog
00093ce4  ldr     r0, [sp, #0x60]
00093ce6  ldr     r1, [sp, #0x40]
00093ce8  movs    r2, #2
00093cea  blx     #0xddbfc ; -> objc_msgSend
00093cee  str     r0, [sp, #0x4c]
00093cf0  ldr     r1, [sp, #0x20]
00093cf2  ldr     r0, [sp, #0x14]
00093cf4  blx     #0xddbfc ; -> objc_msgSend
00093cf8  mov     r2, r0
00093cfa  ldr     r1, [sp, #0x1c]
00093cfc  ldr     r0, [sp, #0x4c]
00093cfe  blx     #0xddbfc ; -> objc_msgSend
00093d02  ldr     r5, [sp, #0x10]
00093d04  str     r0, [sp, #0x7c]
00093d06  adds    r5, #0x58
00093d08  str     r5, [sp, #0x78]
00093d0a  blx     #0xdde0c ; -> strlen
00093d0e  ldr     r1, [sp, #0x7c]
00093d10  mov     r2, r0
00093d12  ldr     r0, [sp, #0x78]
00093d14  blx     #0xdd50c ; -> ZNSs6assignEPKcm
00093d18  ldr     r0, [pc, #0x2c8]
00093d1a  add     r0, pc ; -> 0x0017f324  
00093d1c  blx     #0xdd3e0 ; -> NSLog
00093d20  ldr     r1, [sp, #0x10]
00093d22  ldrb.w  r3, [r1, #0x64]
00093d26  cbnz    r3, #0x93d38
00093d28  mov     r0, r1
00093d2a  bl      #0x93540 ; -> ZN6Mayhem14GetUserRequest13RequestDirectEv
00093d2e  ldr     r0, [pc, #0x2b8]
00093d30  add     r0, pc ; -> 0x0017f334  
00093d32  blx     #0xdd3e0 ; -> NSLog
00093d36  b       #0x93bec
00093d38  ldr     r2, [sp, #0x10]
00093d3a  movs    r3, #3
00093d3c  movs    r1, #1
00093d3e  add.w   r0, r2, #8
00093d42  str     r3, [sp, #0x8c]
00093d44  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00093d48  ldr     r0, [pc, #0x2a0]
00093d4a  add     r0, pc ; -> 0x0017f344  
00093d4c  blx     #0xdd3e0 ; -> NSLog
00093d50  b       #0x93bec
00093d52  subs    r2, r3, #4
00093d54  ldr     r3, [r3, #-0x4]
00093d58  subs    r1, r3, #1
00093d5a  dmb     ish
00093d5e  mov     ip, r3
00093d60  ldrex   r4, [r2]
00093d64  cmp     r4, r3
00093d66  beq     #0x93df2
00093d68  cmp     r4, ip
00093d6a  mov     r3, r4
00093d6c  bne     #0x93d58
00093d6e  cmp     r4, #0
00093d70  bgt.w   #0x93afe
00093d74  add     r1, sp, #0xec
00093d76  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093d7a  b       #0x93afe
00093d7c  subs    r2, r3, #4
00093d7e  ldr     r3, [r3, #-0x4]
00093d82  subs    r1, r3, #1
00093d84  dmb     ish
00093d88  mov     ip, r3
00093d8a  ldrex   r4, [r2]
00093d8e  cmp     r4, r3
00093d90  beq     #0x93de4
00093d92  cmp     r4, ip
00093d94  mov     r3, r4
00093d96  bne     #0x93d82
00093d98  cmp     r4, #0
00093d9a  bgt.w   #0x93ad0
00093d9e  add.w   r1, sp, #0xee
00093da2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093da6  b       #0x93ad0
00093da8  ldr     r3, [r5, #-0x4]
00093dac  subs    r2, r5, #4
00093dae  subs    r1, r3, #1
00093db0  dmb     ish
00093db4  mov     ip, r3
00093db6  ldrex   lr, [r2]
00093dba  cmp     lr, r3
00093dbc  beq     #0x93dd6
00093dbe  cmp     lr, ip
00093dc0  mov     r3, lr
00093dc2  bne     #0x93dae
00093dc4  cmp.w   lr, #0
00093dc8  bgt.w   #0x93a7a
00093dcc  add.w   r1, sp, #0xf1
00093dd0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093dd4  b       #0x93a7a
00093dd6  strex   r4, r1, [r2]
00093dda  cmp     r4, #0
00093ddc  bne     #0x93db6
00093dde  dmb     ish
00093de2  b       #0x93dbe
00093de4  strex   r5, r1, [r2]
00093de8  cmp     r5, #0
00093dea  bne     #0x93d8a
00093dec  dmb     ish
00093df0  b       #0x93d92
00093df2  strex   r5, r1, [r2]
00093df6  cmp     r5, #0
00093df8  bne     #0x93d60
00093dfa  dmb     ish
00093dfe  b       #0x93d68
00093e00  ldr     r3, [sp, #0x8c]
00093e02  ldr.w   lr, [sp, #0x90]
00093e06  cmp     r3, #1
00093e08  str.w   lr, [sp, #8]
00093e0c  beq     #0x93e32
00093e0e  cmp     r3, #2
00093e10  beq     #0x93e32
00093e12  cmp     r3, #3
00093e14  beq     #0x93e48
00093e16  cmp     r3, #4
00093e18  beq     #0x93e3c
00093e1a  cmp     r3, #5
00093e1c  beq     #0x93e88
00093e1e  ldr     r3, [sp, #0xe0]
00093e20  ldr     r2, [sp, #0x74]
00093e22  str.w   lr, [sp, #0x6c]
00093e26  sub.w   r0, r3, #0xc
00093e2a  cmp     r2, r0
00093e2c  bne     #0x93e5e
00093e2e  ldr     r1, [sp, #0x6c]
00093e30  str     r1, [sp, #8]
00093e32  add     r0, sp, #0xbc
00093e34  movs    r3, #0
00093e36  str     r3, [sp, #0x8c]
00093e38  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
00093e3c  ldr     r0, [sp, #8]
00093e3e  mov.w   r3, #-1
00093e42  str     r3, [sp, #0x8c]
00093e44  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00093e48  ldr     r3, [sp, #0xe4]
00093e4a  ldr     r4, [sp, #0x74]
00093e4c  ldr     r2, [sp, #8]
00093e4e  sub.w   r0, r3, #0xc
00093e52  cmp     r4, r0
00093e54  str     r2, [sp, #0x68]
00093e56  bne     #0x93eae
00093e58  ldr     r1, [sp, #0x68]
00093e5a  str     r1, [sp, #8]
00093e5c  b       #0x93e3c
00093e5e  subs    r2, r3, #4
00093e60  ldr     r3, [r3, #-0x4]
00093e64  subs    r1, r3, #1
00093e66  dmb     ish
00093e6a  mov     ip, r3
00093e6c  ldrex   r4, [r2]
00093e70  cmp     r4, r3
00093e72  beq     #0x93f10
00093e74  cmp     r4, ip
00093e76  mov     r3, r4
00093e78  bne     #0x93e64
00093e7a  cmp     r4, #0
00093e7c  bgt     #0x93e2e
00093e7e  add.w   r1, sp, #0xed
00093e82  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093e86  b       #0x93e2e
00093e88  ldr.w   r3, [pc, #0x164]
00093e8c  ldr     r1, [sp, #0x70]
00093e8e  ldr     r5, [sp, #8]
00093e90  add     r3, pc ; -> 0x000f3370  0x0
00093e92  sub.w   r0, r1, #0xc
00093e96  ldr     r3, [r3]
00093e98  str     r5, [sp, #0x64]
00093e9a  cmp     r0, r3
00093e9c  bne     #0x93ed8
00093e9e  ldr     r1, [sp, #0x64]
00093ea0  mov.w   r3, #-1
00093ea4  str     r3, [sp, #0x8c]
00093ea6  mov     r0, r1
00093ea8  str     r1, [sp, #8]
00093eaa  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00093eae  subs    r2, r3, #4
00093eb0  ldr     r3, [r3, #-0x4]
00093eb4  subs    r1, r3, #1
00093eb6  dmb     ish
00093eba  mov     ip, r3
00093ebc  ldrex   r5, [r2]
00093ec0  cmp     r5, r3
00093ec2  beq     #0x93f00
00093ec4  cmp     r5, ip
00093ec6  mov     r3, r5
00093ec8  bne     #0x93eb4
00093eca  cmp     r5, #0
00093ecc  bgt     #0x93e58
00093ece  add.w   r1, sp, #0xef
00093ed2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093ed6  b       #0x93e58
00093ed8  ldr     r3, [r1, #-0x4]
00093edc  subs    r2, r1, #4
00093ede  subs    r1, r3, #1
00093ee0  dmb     ish
00093ee4  mov     ip, r3
00093ee6  ldrex   r4, [r2]
00093eea  cmp     r4, r3
00093eec  beq     #0x93f1e
00093eee  cmp     r4, ip
00093ef0  mov     r3, r4
00093ef2  bne     #0x93ede
00093ef4  cmp     r4, #0
00093ef6  bgt     #0x93e9e
00093ef8  add     r1, sp, #0xf0
00093efa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093efe  b       #0x93e9e
00093f00  strex   lr, r1, [r2]
00093f04  cmp.w   lr, #0
00093f08  bne     #0x93ebc
00093f0a  dmb     ish
00093f0e  b       #0x93ec4
00093f10  strex   r5, r1, [r2]
00093f14  cmp     r5, #0
00093f16  bne     #0x93e6c
00093f18  dmb     ish
00093f1c  b       #0x93e74
00093f1e  strex   r5, r1, [r2]
00093f22  cmp     r5, #0
00093f24  bne     #0x93ee6
00093f26  dmb     ish
00093f2a  b       #0x93eee
