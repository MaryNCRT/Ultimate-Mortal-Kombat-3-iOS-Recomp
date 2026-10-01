========================================================================
-[FBRequest call  0x0008598c  604 bytes   FBRequest.m
========================================================================

0008598c  push    {r4, r5, r6, r7, lr}
0008598e  add     r7, sp, #0xc
00085990  push.w  {r8, sl}
00085994  ldr     r1, [pc, #0x1bc]
00085996  mov     r8, r3
00085998  ldr     r3, [pc, #0x1bc]
0008599a  add     r1, pc ; -> 0x000fce1c  '8;\x0e'
0008599c  mov     r6, r2
0008599e  add     r3, pc ; -> 0x000f59c8  OBJC_IVAR_$_FBRequest._url
000859a0  ldr     r1, [r1]
000859a2  ldr     r5, [r3]
000859a4  mov     r4, r0
000859a6  blx     #0xddbfc ; -> objc_msgSend
000859aa  ldr     r1, [pc, #0x1b0]
000859ac  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000859ae  ldr     r1, [r1]
000859b0  blx     #0xddbfc ; -> objc_msgSend
000859b4  ldr     r1, [pc, #0x1a8]
000859b6  ldr     r3, [pc, #0x1ac]
000859b8  add     r1, pc ; -> 0x000fce18  
000859ba  add     r3, pc ; -> 0x000f59cc  OBJC_IVAR_$_FBRequest._method
000859bc  ldr     r1, [r1]
000859be  str     r0, [r4, r5]
000859c0  mov     r0, r6
000859c2  ldr     r5, [r3]
000859c4  blx     #0xddbfc ; -> objc_msgSend
000859c8  ldr     r3, [pc, #0x19c]
000859ca  add     r3, pc ; -> 0x000f59d0  OBJC_IVAR_$_FBRequest._params
000859cc  str     r0, [r4, r5]
000859ce  ldr     r5, [r3]
000859d0  cmp.w   r8, #0
000859d4  beq.w   #0x85b38
000859d8  ldr     r0, [pc, #0x190]
000859da  ldr.w   r1, [pc, #0x194]
000859de  add     r0, pc ; -> 0x000fdbf4  
000859e0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000859e2  ldr     r0, [r0]
000859e4  ldr     r1, [r1]
000859e6  blx     #0xddbfc ; -> objc_msgSend
000859ea  ldr     r1, [pc, #0x188]
000859ec  mov     r2, r8
000859ee  add     r1, pc ; -> 0x000fce14  'r<\x0e'
000859f0  ldr     r1, [r1]
000859f2  blx     #0xddbfc ; -> objc_msgSend
000859f6  ldr     r3, [pc, #0x180]
000859f8  str     r0, [r4, r5]
000859fa  ldr.w   r8, [pc, #0x180]
000859fe  add     r3, pc ; -> 0x000f59d4  OBJC_IVAR_$_FBRequest._dataParam
00085a00  ldr     r1, [pc, #0x17c]
00085a02  ldr     r2, [r3]
00085a04  ldr     r3, [sp, #0x1c]
00085a06  add     r8, pc ; -> 0x000f59d0  OBJC_IVAR_$_FBRequest._params
00085a08  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
00085a0a  ldr.w   sl, [pc, #0x178]
00085a0e  str     r3, [r4, r2]
00085a10  ldr     r2, [pc, #0x174]
00085a12  ldr.w   r3, [r8]
00085a16  ldr     r6, [r1]
00085a18  add     r2, pc ; -> 0x000f59cc  OBJC_IVAR_$_FBRequest._method
00085a1a  add     sl, pc ; -> 0x000f59c0  OBJC_IVAR_$_FBRequest._session
00085a1c  ldr     r2, [r2]
00085a1e  ldr     r0, [r4, r3]
00085a20  ldr     r3, [pc, #0x168]
00085a22  mov     r1, r6
00085a24  ldr     r2, [r4, r2]
00085a26  add     r3, pc ; -> 0x0017eae4  
00085a28  blx     #0xddbfc ; -> objc_msgSend
00085a2c  ldr     r1, [pc, #0x160]
00085a2e  ldr.w   r0, [r8]
00085a32  ldr.w   r3, [sl]
00085a36  add     r1, pc ; -> 0x000fcdd4  
00085a38  ldr     r5, [r4, r0]
00085a3a  ldr     r1, [r1]
00085a3c  ldr     r0, [r4, r3]
00085a3e  blx     #0xddbfc ; -> objc_msgSend
00085a42  ldr     r3, [pc, #0x150]
00085a44  mov     r1, r6
00085a46  add     r3, pc ; -> 0x0017e9e4  
00085a48  mov     r2, r0
00085a4a  mov     r0, r5
00085a4c  blx     #0xddbfc ; -> objc_msgSend
00085a50  ldr.w   r3, [r8]
00085a54  ldr     r2, [pc, #0x140]
00085a56  mov     r1, r6
00085a58  ldr     r0, [r4, r3]
00085a5a  ldr     r3, [pc, #0x140]
00085a5c  add     r2, pc ; -> 0x0017d9f8  kAPIVersion
00085a5e  add     r3, pc ; -> 0x0017eaf4  
00085a60  ldr     r2, [r2]
00085a62  blx     #0xddbfc ; -> objc_msgSend
00085a66  ldr.w   r3, [r8]
00085a6a  ldr     r2, [pc, #0x134]
00085a6c  mov     r1, r6
00085a6e  ldr     r0, [r4, r3]
00085a70  ldr     r3, [pc, #0x130]
00085a72  add     r2, pc ; -> 0x0017d9fc  kAPIFormat
00085a74  add     r3, pc ; -> 0x0017eb04  
00085a76  ldr     r2, [r2]
00085a78  blx     #0xddbfc ; -> objc_msgSend
00085a7c  ldr     r1, [pc, #0x128]
00085a7e  mov     r0, r4
00085a80  add     r1, pc ; -> 0x000fce78  'F;\x0e'
00085a82  ldr     r1, [r1]
00085a84  blx     #0xddbfc ; -> objc_msgSend
00085a88  tst.w   r0, #0xff
00085a8c  beq     #0x85aca
00085a8e  ldr     r3, [pc, #0x11c]
00085a90  ldr     r1, [pc, #0x11c]
00085a92  add     r3, pc ; -> 0x000f59d0  OBJC_IVAR_$_FBRequest._params
00085a94  add     r1, pc ; -> 0x000fce0c  '\x0e;\x0e'
00085a96  ldr     r0, [r3]
00085a98  ldr     r1, [r1]
00085a9a  ldr     r5, [r4, r0]
00085a9c  mov     r0, r4
00085a9e  blx     #0xddbfc ; -> objc_msgSend
00085aa2  ldr     r3, [pc, #0x110]
00085aa4  mov     r1, r6
00085aa6  add     r3, pc ; -> 0x0017eb34  
00085aa8  mov     r2, r0
00085aaa  mov     r0, r5
00085aac  blx     #0xddbfc ; -> objc_msgSend
00085ab0  ldr     r3, [pc, #0x104]
00085ab2  ldr     r1, [pc, #0x108]
00085ab4  mov     r2, r4
00085ab6  add     r3, pc ; -> 0x000f59c0  OBJC_IVAR_$_FBRequest._session
00085ab8  add     r1, pc ; -> 0x000fce08  'Z<\x0e'
00085aba  ldr     r3, [r3]
00085abc  ldr     r1, [r1]
00085abe  ldr     r0, [r4, r3]
00085ac0  blx     #0xddbfc ; -> objc_msgSend
00085ac4  pop.w   {r8, sl}
00085ac8  pop     {r4, r5, r6, r7, pc}
00085aca  ldr     r1, [pc, #0xf4]
00085acc  ldr.w   r0, [r8]
00085ad0  ldr.w   r3, [sl]
00085ad4  add     r1, pc ; -> 0x000fcdfc  'L<\x0e'
00085ad6  ldr     r5, [r4, r0]
00085ad8  ldr     r1, [r1]
00085ada  ldr     r0, [r4, r3]
00085adc  blx     #0xddbfc ; -> objc_msgSend
00085ae0  ldr     r3, [pc, #0xe0]
00085ae2  mov     r1, r6
00085ae4  add     r3, pc ; -> 0x0017e984  
00085ae6  mov     r2, r0
00085ae8  mov     r0, r5
00085aea  blx     #0xddbfc ; -> objc_msgSend
00085aee  ldr     r1, [pc, #0xd8]
00085af0  ldr.w   r0, [r8]
00085af4  add     r1, pc ; -> 0x000fce10  '\x1a;\x0e'
00085af6  ldr     r5, [r4, r0]
00085af8  ldr     r1, [r1]
00085afa  mov     r0, r4
00085afc  blx     #0xddbfc ; -> objc_msgSend
00085b00  ldr     r3, [pc, #0xc8]
00085b02  mov     r1, r6
00085b04  add     r3, pc ; -> 0x0017eb14  
00085b06  mov     r2, r0
00085b08  mov     r0, r5
00085b0a  blx     #0xddbfc ; -> objc_msgSend
00085b0e  ldr     r1, [pc, #0xc0]
00085b10  ldr.w   r3, [sl]
00085b14  add     r1, pc ; -> 0x000fce6c  '.=\x0e'
00085b16  ldr     r0, [r4, r3]
00085b18  ldr     r1, [r1]
00085b1a  blx     #0xddbfc ; -> objc_msgSend
00085b1e  cmp     r0, #0
00085b20  beq     #0x85a8e
00085b22  ldr.w   r3, [r8]
00085b26  ldr     r2, [pc, #0xac]
00085b28  mov     r1, r6
00085b2a  ldr     r0, [r4, r3]
00085b2c  ldr     r3, [pc, #0xa8]
00085b2e  add     r2, pc ; -> 0x0017e764  
00085b30  add     r3, pc ; -> 0x0017eb24  
00085b32  blx     #0xddbfc ; -> objc_msgSend
00085b36  b       #0x85a8e
00085b38  ldr     r0, [pc, #0xa0]
00085b3a  ldr     r1, [pc, #0xa4]
00085b3c  add     r0, pc ; -> 0x000fdbf4  
00085b3e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00085b40  ldr     r0, [r0]
00085b42  ldr     r1, [r1]
00085b44  blx     #0xddbfc ; -> objc_msgSend
00085b48  ldr     r1, [pc, #0x98]
00085b4a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
00085b4c  ldr     r1, [r1]
00085b4e  blx     #0xddbfc ; -> objc_msgSend
00085b52  b       #0x859f6
00085b54  strb    r6, [r7, #0x11]
00085b56  movs    r7, r0
00085b58  movs    r6, r4
00085b5a  movs    r7, r0
00085b5c  strb    r0, [r4, #0xc]
00085b5e  movs    r7, r0
00085b60  strb    r4, [r3, #0x11]
00085b62  movs    r7, r0
00085b64  movs    r6, r1
00085b66  movs    r7, r0
00085b68  movs    r2, r0
00085b6a  movs    r7, r0
00085b6c  strh    r2, [r2, #0x10]
00085b6e  movs    r7, r0
00085b70  ldr     r0, [r4, #0x78]
00085b72  movs    r7, r0
00085b74  strb    r2, [r4, #0x10]
00085b76  movs    r7, r0
00085b78  vaddl.u16 q8, d2, d6
00085b7c  vaddl.u8 q8, d6, d6
00085b80  strb    r4, [r1, #3]
00085b82  movs    r7, r0
00085b84  vaddl.u32 q0, d2, d6
00085b88  vrev64.8 d0, d6
00085b8c  str     r0, [sp, #0x2e8]
00085b8e  movs    r7, r1
00085b90  strb    r2, [r3, #0xe]
00085b92  movs    r7, r0
00085b94  ldrh    r2, [r3, #0x3c]
00085b96  movs    r7, r1
00085b98  ldrb    r0, [r3, #0x1e]
00085b9a  movs    r7, r1
00085b9c  str     r0, [sp, #0x248]
00085b9e  movs    r7, r1
00085ba0  ldrb    r6, [r0, #0x1e]
00085ba2  movs    r7, r1
00085ba4  str     r0, [sp, #0x230]
00085ba6  movs    r7, r1
00085ba8  strb    r4, [r6, #0xf]
00085baa  movs    r7, r0
