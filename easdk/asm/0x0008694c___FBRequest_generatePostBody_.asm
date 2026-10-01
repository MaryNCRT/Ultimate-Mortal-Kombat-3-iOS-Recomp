========================================================================
-[FBRequest generatePostBody]  0x0008694c  668 bytes   FBRequest.m
========================================================================

0008694c  push    {r4, r5, r6, r7, lr}
0008694e  add     r7, sp, #0xc
00086950  push.w  {r8, sl, fp}
00086954  sub     sp, #0x90
00086956  ldr     r1, [pc, #0x220]
00086958  mov     r6, r0
0008695a  ldr     r0, [pc, #0x220]
0008695c  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
0008695e  add     r0, pc ; -> 0x000fdbbc  
00086960  ldr     r1, [r1]
00086962  ldr     r0, [r0]
00086964  blx     #0xddbfc ; -> objc_msgSend
00086968  ldr     r3, [pc, #0x214]
0008696a  ldr     r1, [pc, #0x218]
0008696c  ldr     r2, [pc, #0x218]
0008696e  add     r3, pc ; -> 0x0017d9f0  kStringBoundary
00086970  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00086972  ldr     r4, [r3]
00086974  ldr     r1, [r1]
00086976  add     r2, pc ; -> 0x0017e864  
00086978  mov     r3, r4
0008697a  str     r1, [sp, #0xc]
0008697c  mov     sl, r0
0008697e  ldr     r0, [pc, #0x20c]
00086980  add     r0, pc ; -> 0x000fdb5c  
00086982  ldr     r0, [r0]
00086984  str     r0, [sp, #8]
00086986  blx     #0xddbfc ; -> objc_msgSend
0008698a  ldr     r1, [pc, #0x204]
0008698c  ldr     r2, [pc, #0x204]
0008698e  mov     r3, r4
00086990  add     r1, pc ; -> 0x000fce68  
00086992  add     r2, pc ; -> 0x0017e874  
00086994  ldr.w   r8, [r1]
00086998  ldr     r1, [sp, #0xc]
0008699a  str     r0, [sp, #0x24]
0008699c  ldr     r0, [sp, #8]
0008699e  blx     #0xddbfc ; -> objc_msgSend
000869a2  mov     r2, sl
000869a4  mov     r1, r8
000869a6  mov     r3, r0
000869a8  mov     r0, r6
000869aa  blx     #0xddbfc ; -> objc_msgSend
000869ae  movs    r3, #0
000869b0  str     r3, [sp, #0x70]
000869b2  str     r3, [sp, #0x74]
000869b4  str     r3, [sp, #0x78]
000869b6  str     r3, [sp, #0x7c]
000869b8  str     r3, [sp, #0x80]
000869ba  str     r3, [sp, #0x84]
000869bc  str     r3, [sp, #0x88]
000869be  str     r3, [sp, #0x8c]
000869c0  ldr     r3, [pc, #0x1d4]
000869c2  ldr     r1, [pc, #0x1d8]
000869c4  add     r3, pc ; -> 0x000f59d0  OBJC_IVAR_$_FBRequest._params
000869c6  add     r1, pc ; -> 0x000fcd18  '^z\x0e'
000869c8  ldr     r0, [r3]
000869ca  ldr     r1, [r1]
000869cc  ldr     r0, [r6, r0]
000869ce  str     r1, [sp, #0x14]
000869d0  str     r0, [sp, #0x10]
000869d2  blx     #0xddbfc ; -> objc_msgSend
000869d6  ldr     r1, [pc, #0x1c8]
000869d8  movs    r3, #0x10
000869da  add     r2, sp, #0x70
000869dc  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000869de  str     r3, [sp]
000869e0  ldr     r1, [r1]
000869e2  add     r3, sp, #0x30
000869e4  str     r1, [sp, #0x1c]
000869e6  str     r0, [sp, #0x18]
000869e8  blx     #0xddbfc ; -> objc_msgSend
000869ec  cmp     r0, #0
000869ee  beq     #0x86a8a
000869f0  ldr     r1, [pc, #0x1b0]
000869f2  ldr     r3, [sp, #0x78]
000869f4  ldr     r2, [pc, #0x1b0]
000869f6  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000869f8  mov     fp, r0
000869fa  ldr     r3, [r3]
000869fc  add     r2, pc ; -> 0x0017e884  
000869fe  ldr     r1, [r1]
00086a00  str     r2, [sp, #0x2c]
00086a02  ldr     r2, [pc, #0x1a8]
00086a04  str     r3, [sp, #0x28]
00086a06  str     r1, [sp, #0x20]
00086a08  str     r2, [sp, #4]
00086a0a  movs    r5, #0
00086a0c  b       #0x86a12
00086a0e  ldr     r3, [sp, #0x78]
00086a10  ldr     r3, [r3]
00086a12  ldr     r2, [sp, #0x28]
00086a14  cmp     r2, r3
00086a16  beq     #0x86a24
00086a18  ldr     r1, [sp, #0x14]
00086a1a  ldr     r0, [sp, #0x10]
00086a1c  blx     #0xddbfc ; -> objc_msgSend
00086a20  blx     #0xddbe4 ; -> objc_enumerationMutation
00086a24  ldr     r2, [sp, #0x74]
00086a26  ldr     r1, [sp, #0xc]
00086a28  ldr     r0, [sp, #8]
00086a2a  ldr.w   r4, [r2, r5, lsl #2]
00086a2e  ldr     r2, [sp, #0x2c]
00086a30  adds    r5, #1
00086a32  mov     r3, r4
00086a34  blx     #0xddbfc ; -> objc_msgSend
00086a38  mov     r1, r8
00086a3a  mov     r2, sl
00086a3c  mov     r3, r0
00086a3e  mov     r0, r6
00086a40  blx     #0xddbfc ; -> objc_msgSend
00086a44  ldr     r3, [sp, #4]
00086a46  ldr     r1, [sp, #0x20]
00086a48  mov     r2, r4
00086a4a  add     r3, pc
00086a4c  ldr     r3, [r3]
00086a4e  ldr     r0, [r6, r3]
00086a50  blx     #0xddbfc ; -> objc_msgSend
00086a54  mov     r1, r8
00086a56  mov     r2, sl
00086a58  mov     r3, r0
00086a5a  mov     r0, r6
00086a5c  blx     #0xddbfc ; -> objc_msgSend
00086a60  mov     r0, r6
00086a62  mov     r1, r8
00086a64  mov     r2, sl
00086a66  ldr     r3, [sp, #0x24]
00086a68  blx     #0xddbfc ; -> objc_msgSend
00086a6c  cmp     fp, r5
00086a6e  bhi     #0x86a0e
00086a70  movs    r3, #0x10
00086a72  ldr     r0, [sp, #0x18]
00086a74  str     r3, [sp]
00086a76  ldr     r1, [sp, #0x1c]
00086a78  add     r2, sp, #0x70
00086a7a  add     r3, sp, #0x30
00086a7c  blx     #0xddbfc ; -> objc_msgSend
00086a80  cbz     r0, #0x86a8a
00086a82  ldr     r3, [sp, #0x78]
00086a84  mov     fp, r0
00086a86  ldr     r3, [r3]
00086a88  b       #0x86a0a
00086a8a  ldr     r5, [pc, #0x124]
00086a8c  add     r5, pc ; -> 0x000f59d4  OBJC_IVAR_$_FBRequest._dataParam
00086a8e  ldr     r0, [r5]
00086a90  ldr     r4, [r6, r0]
00086a92  cmp     r4, #0
00086a94  beq     #0x86b12
00086a96  ldr     r1, [pc, #0x11c]
00086a98  ldr     r0, [pc, #0x11c]
00086a9a  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
00086a9c  add     r0, pc ; -> 0x000fdba8  
00086a9e  ldr.w   fp, [r1]
00086aa2  ldr     r1, [pc, #0x118]
00086aa4  ldr     r0, [r0]
00086aa6  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
00086aa8  ldr     r1, [r1]
00086aaa  blx     #0xddbfc ; -> objc_msgSend
00086aae  mov     r1, fp
00086ab0  mov     r2, r0
00086ab2  mov     r0, r4
00086ab4  blx     #0xddbfc ; -> objc_msgSend
00086ab8  tst.w   r0, #0xff
00086abc  bne     #0x86b2a
00086abe  ldr     r2, [pc, #0x100]
00086ac0  ldr     r1, [sp, #0xc]
00086ac2  ldr     r0, [sp, #8]
00086ac4  add     r2, pc ; -> 0x0017ec54  
00086ac6  blx     #0xddbfc ; -> objc_msgSend
00086aca  mov     r1, r8
00086acc  mov     r2, sl
00086ace  mov     r3, r0
00086ad0  mov     r0, r6
00086ad2  blx     #0xddbfc ; -> objc_msgSend
00086ad6  ldr     r1, [pc, #0xec]
00086ad8  ldr     r2, [pc, #0xec]
00086ada  ldr     r0, [sp, #8]
00086adc  add     r1, pc ; -> 0x000fcb24  '\x1c=\x0e'
00086ade  add     r2, pc ; -> 0x0017ec64  
00086ae0  ldr     r1, [r1]
00086ae2  blx     #0xddbfc ; -> objc_msgSend
00086ae6  mov     r1, r8
00086ae8  mov     r2, sl
00086aea  mov     r3, r0
00086aec  mov     r0, r6
00086aee  blx     #0xddbfc ; -> objc_msgSend
00086af2  ldr     r3, [pc, #0xd8]
00086af4  ldr     r1, [pc, #0xd8]
00086af6  mov     r0, sl
00086af8  add     r3, pc ; -> 0x000f59d4  OBJC_IVAR_$_FBRequest._dataParam
00086afa  add     r1, pc ; -> 0x000fcd0c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x394
00086afc  ldr     r3, [r3]
00086afe  ldr     r1, [r1]
00086b00  ldr     r2, [r6, r3]
00086b02  blx     #0xddbfc ; -> objc_msgSend
00086b06  mov     r0, r6
00086b08  mov     r1, r8
00086b0a  mov     r2, sl
00086b0c  ldr     r3, [sp, #0x24]
00086b0e  blx     #0xddbfc ; -> objc_msgSend
00086b12  ldr     r1, [pc, #0xc0]
00086b14  mov     r0, sl
00086b16  add     r1, pc ; -> 0x000fca90  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x118
00086b18  ldr     r1, [r1]
00086b1a  blx     #0xddbfc ; -> objc_msgSend
00086b1e  mov     r0, sl
00086b20  sub.w   sp, r7, #0x18
00086b24  pop.w   {r8, sl, fp}
00086b28  pop     {r4, r5, r6, r7, pc}
00086b2a  ldr     r3, [r5]
00086b2c  ldr     r0, [r6, r3]
00086b2e  blx     #0xdd4a0 ; -> UIImagePNGRepresentation
00086b32  ldr     r2, [pc, #0xa4]
00086b34  ldr     r1, [sp, #0xc]
00086b36  add     r2, pc ; -> 0x0017ec34  
00086b38  mov     r4, r0
00086b3a  ldr     r0, [sp, #8]
00086b3c  blx     #0xddbfc ; -> objc_msgSend
00086b40  mov     r1, r8
00086b42  mov     r2, sl
00086b44  mov     r3, r0
00086b46  mov     r0, r6
00086b48  blx     #0xddbfc ; -> objc_msgSend
00086b4c  ldr     r1, [pc, #0x8c]
00086b4e  ldr     r2, [pc, #0x90]
00086b50  ldr     r0, [sp, #8]
00086b52  add     r1, pc ; -> 0x000fcb24  '\x1c=\x0e'
00086b54  add     r2, pc ; -> 0x0017ec44  
00086b56  ldr     r1, [r1]
00086b58  blx     #0xddbfc ; -> objc_msgSend
00086b5c  mov     r1, r8
00086b5e  mov     r2, sl
00086b60  mov     r3, r0
00086b62  mov     r0, r6
00086b64  blx     #0xddbfc ; -> objc_msgSend
00086b68  ldr     r1, [pc, #0x78]
00086b6a  mov     r0, sl
00086b6c  mov     r2, r4
00086b6e  add     r1, pc ; -> 0x000fcd0c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x394
00086b70  ldr     r1, [r1]
00086b72  blx     #0xddbfc ; -> objc_msgSend
00086b76  b       #0x86b06
00086b78  str     r4, [r6, #0x38]
00086b7a  movs    r7, r0
00086b7c  strb    r2, [r3, #9]
00086b7e  movs    r7, r0
00086b80  strb    r6, [r7, #1]
00086b82  movs    r7, r1
00086b84  str     r4, [r5, #0x10]
00086b86  movs    r7, r0
00086b88  ldrb    r2, [r5, #0x1b]
00086b8a  movs    r7, r1
00086b8c  strb    r0, [r3, #7]
00086b8e  movs    r7, r0
00086b90  str     r4, [r2, #0x4c]
00086b92  movs    r7, r0
00086b94  ldrb    r6, [r3, #0x1b]
00086b96  movs    r7, r1
00086b98  and     r0, r8, #6
00086b9c  str     r6, [r1, #0x34]
00086b9e  movs    r7, r0
00086ba0  ldrsh   r0, [r7, r6]
00086ba2  movs    r7, r0
00086ba4  str     r6, [r6, #0xc]
00086ba6  movs    r7, r0
00086ba8  ldrb    r4, [r0, #0x1a]
00086baa  movs    r7, r1
00086bac  vaddl.s8 q0, d2, d6
00086bb0  vhadd.s8 d16, d4, d6
00086bb4  str     r2, [r4, #0x3c]
00086bb6  movs    r7, r0
00086bb8  strb    r0, [r1, #4]
00086bba  movs    r7, r0
00086bbc  ldrsh   r2, [r4, r5]
00086bbe  movs    r7, r0
00086bc0  strh    r4, [r1, #0xc]
00086bc2  movs    r7, r1
00086bc4  str     r4, [r0, #4]
00086bc6  movs    r7, r0
00086bc8  strh    r2, [r0, #0xc]
00086bca  movs    r7, r1
00086bcc  cdp     p0, #0xd, c0, c8, c6, #0
00086bd0  str     r6, [r1, #0x20]
00086bd2  movs    r7, r0
00086bd4  ldrsh   r6, [r6, r5]
00086bd6  movs    r7, r0
00086bd8  strh    r2, [r7, #6]
00086bda  movs    r7, r1
00086bdc  ldrsh   r6, [r1, r7]
00086bde  movs    r7, r0
00086be0  strh    r4, [r5, #6]
00086be2  movs    r7, r1
00086be4  str     r2, [r3, #0x18]
00086be6  movs    r7, r0
