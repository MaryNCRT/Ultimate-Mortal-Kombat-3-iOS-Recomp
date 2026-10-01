========================================================================
SocialResponse_CallBack  0x000b7954  13764 bytes   EAMTX_Main.mm
========================================================================

000b7954  push    {r4, r5, r6, r7, lr}
000b7956  add     r7, sp, #0xc
000b7958  push.w  {r8, sl, fp}
000b795c  sub.w   sp, sp, #0xb20
000b7960  sub     sp, #0x18
000b7962  mov     r5, r1
000b7964  ldr.w   r1, [pc, #0xb84]
000b7968  str     r0, [sp, #0x100]
000b796a  ldr.w   r0, [pc, #0xb84]
000b796e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b7970  str     r3, [sp, #0xfc]
000b7972  ldr     r1, [r1]
000b7974  add     r0, pc ; -> 0x000fdb5c  
000b7976  ldr.w   r4, [pc, #0xb7c]
000b797a  ldr     r0, [r0]
000b797c  str     r1, [sp, #0x108]
000b797e  ldr.w   r1, [pc, #0xb78]
000b7982  add     r4, pc ; -> 0x001801a4  
000b7984  str     r0, [sp, #0x104]
000b7986  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000b7988  mov     r0, r5
000b798a  ldr     r1, [r1]
000b798c  str     r1, [sp, #0x10c]
000b798e  blx     #0xddbfc ; -> objc_msgSend
000b7992  ldr     r1, [sp, #0x100]
000b7994  mov     r2, r4
000b7996  mov     r3, r5
000b7998  str     r1, [sp, #4]
000b799a  ldr     r1, [sp, #0x108]
000b799c  str     r0, [sp]
000b799e  ldr     r0, [sp, #0x104]
000b79a0  blx     #0xddbfc ; -> objc_msgSend
000b79a4  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000b79a8  ldr     r2, [sp, #0x100]
000b79aa  cmp     r2, #0x2f
000b79ac  beq.w   #0xbabb8
000b79b0  ldr.w   r1, [pc, #0xb48]
000b79b4  ldr.w   r0, [pc, #0xb48]
000b79b8  movs    r4, #0
000b79ba  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b79bc  add     r0, pc ; -> 0x000fdca4  
000b79be  ldr     r1, [r1]
000b79c0  ldr     r0, [r0]
000b79c2  str     r1, [sp, #0x110]
000b79c4  blx     #0xddbfc ; -> objc_msgSend
000b79c8  ldr.w   r1, [pc, #0xb38]
000b79cc  mov     r2, r5
000b79ce  mov     r3, r4
000b79d0  add     r1, pc ; -> 0x000fd318  
000b79d2  str     r4, [sp]
000b79d4  ldr     r1, [r1]
000b79d6  blx     #0xddbfc ; -> objc_msgSend
000b79da  ldr.w   r1, [pc, #0xb2c]
000b79de  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000b79e0  ldr     r1, [r1]
000b79e2  str     r1, [sp, #0x114]
000b79e4  blx     #0xddbfc ; -> objc_msgSend
000b79e8  ldr.w   r1, [pc, #0xb20]
000b79ec  ldr.w   r2, [pc, #0xb20]
000b79f0  mov     r3, r4
000b79f2  add     r1, pc ; -> 0x000fd314  
000b79f4  add     r2, pc ; -> 0x001801b4  
000b79f6  ldr.w   r8, [r1]
000b79fa  mov     r1, r8
000b79fc  mov     r6, r0
000b79fe  blx     #0xddbfc ; -> objc_msgSend
000b7a02  ldr.w   r1, [pc, #0xb10]
000b7a06  movs    r3, #0x10
000b7a08  add.w   r2, sp, #0xb00
000b7a0c  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000b7a0e  str     r3, [sp]
000b7a10  ldr     r1, [r1]
000b7a12  add.w   r3, sp, #0x8a0
000b7a16  adds    r2, #0x14
000b7a18  adds    r3, #0x14
000b7a1a  str.w   r4, [sp, #0xb14]
000b7a1e  str.w   r4, [sp, #0xb18]
000b7a22  str.w   r4, [sp, #0xb1c]
000b7a26  str.w   r4, [sp, #0xb20]
000b7a2a  str.w   r4, [sp, #0xb24]
000b7a2e  str.w   r4, [sp, #0xb28]
000b7a32  str.w   r4, [sp, #0xb2c]
000b7a36  str.w   r4, [sp, #0xb30]
000b7a3a  str     r1, [sp, #0x118]
000b7a3c  blx     #0xddbfc ; -> objc_msgSend
000b7a40  cmp     r0, #0
000b7a42  beq.w   #0xb7ccc
000b7a46  ldr.w   r1, [pc, #0xad0]
000b7a4a  ldr.w   r0, [sp, #0xb18]
000b7a4e  ldr.w   r4, [pc, #0xacc]
000b7a52  add     r1, pc ; -> 0x000fd310  
000b7a54  ldr     r6, [r0]
000b7a56  ldr     r5, [r1]
000b7a58  add     r4, pc ; -> 0x0017e754  
000b7a5a  mov     r0, r6
000b7a5c  mov     r1, r5
000b7a5e  mov     r2, r4
000b7a60  blx     #0xddbfc ; -> objc_msgSend
000b7a64  cbz     r0, #0xb7a80
000b7a66  mov     r1, r5
000b7a68  mov     r2, r4
000b7a6a  mov     r0, r6
000b7a6c  blx     #0xddbfc ; -> objc_msgSend
000b7a70  ldr.w   r1, [pc, #0xaac]
000b7a74  add     r1, pc ; -> 0x000fd30c  
000b7a76  ldr     r1, [r1]
000b7a78  blx     #0xddbfc ; -> objc_msgSend
000b7a7c  str     r0, [sp, #0x288]
000b7a7e  b       #0xb7a88
000b7a80  ldr.w   r3, [pc, #0xaa0]
000b7a84  add     r3, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b7a86  str     r3, [sp, #0x288]
000b7a88  ldr.w   r4, [pc, #0xa9c]
000b7a8c  mov     r0, r6
000b7a8e  mov     r1, r5
000b7a90  add     r4, pc ; -> 0x0017f084  
000b7a92  mov     r2, r4
000b7a94  blx     #0xddbfc ; -> objc_msgSend
000b7a98  cbz     r0, #0xb7ab4
000b7a9a  mov     r1, r5
000b7a9c  mov     r2, r4
000b7a9e  mov     r0, r6
000b7aa0  blx     #0xddbfc ; -> objc_msgSend
000b7aa4  ldr.w   r1, [pc, #0xa84]
000b7aa8  add     r1, pc ; -> 0x000fd30c  
000b7aaa  ldr     r1, [r1]
000b7aac  blx     #0xddbfc ; -> objc_msgSend
000b7ab0  mov     fp, r0
000b7ab2  b       #0xb7aba
000b7ab4  ldr.w   fp, [pc, #0xa78]
000b7ab8  add     fp, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b7aba  ldr.w   r4, [pc, #0xa78]
000b7abe  mov     r0, r6
000b7ac0  mov     r1, r5
000b7ac2  add     r4, pc ; -> 0x0017f074  
000b7ac4  mov     r2, r4
000b7ac6  blx     #0xddbfc ; -> objc_msgSend
000b7aca  cbz     r0, #0xb7ae6
000b7acc  mov     r1, r5
000b7ace  mov     r2, r4
000b7ad0  mov     r0, r6
000b7ad2  blx     #0xddbfc ; -> objc_msgSend
000b7ad6  ldr.w   r1, [pc, #0xa60]
000b7ada  add     r1, pc ; -> 0x000fd30c  
000b7adc  ldr     r1, [r1]
000b7ade  blx     #0xddbfc ; -> objc_msgSend
000b7ae2  mov     sl, r0
000b7ae4  b       #0xb7aec
000b7ae6  ldr.w   sl, [pc, #0xa54]
000b7aea  add     sl, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b7aec  ldr.w   r4, [pc, #0xa50]
000b7af0  mov     r0, r6
000b7af2  mov     r1, r5
000b7af4  add     r4, pc ; -> 0x001801c4  
000b7af6  mov     r2, r4
000b7af8  blx     #0xddbfc ; -> objc_msgSend
000b7afc  cbz     r0, #0xb7b18
000b7afe  mov     r1, r5
000b7b00  mov     r2, r4
000b7b02  mov     r0, r6
000b7b04  blx     #0xddbfc ; -> objc_msgSend
000b7b08  ldr.w   r1, [pc, #0xa38]
000b7b0c  add     r1, pc ; -> 0x000fd30c  
000b7b0e  ldr     r1, [r1]
000b7b10  blx     #0xddbfc ; -> objc_msgSend
000b7b14  mov     r8, r0
000b7b16  b       #0xb7b1e
000b7b18  ldr.w   r8, [pc, #0xa2c]
000b7b1c  add     r8, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b7b1e  ldr.w   r4, [pc, #0xa2c]
000b7b22  mov     r0, r6
000b7b24  mov     r1, r5
000b7b26  add     r4, pc ; -> 0x001801d4  
000b7b28  mov     r2, r4
000b7b2a  blx     #0xddbfc ; -> objc_msgSend
000b7b2e  cbz     r0, #0xb7b4a
000b7b30  mov     r0, r6
000b7b32  mov     r1, r5
000b7b34  mov     r2, r4
000b7b36  blx     #0xddbfc ; -> objc_msgSend
000b7b3a  ldr.w   r1, [pc, #0xa14]
000b7b3e  add     r1, pc ; -> 0x000fd30c  
000b7b40  ldr     r1, [r1]
000b7b42  blx     #0xddbfc ; -> objc_msgSend
000b7b46  mov     r6, r0
000b7b48  b       #0xb7b50
000b7b4a  ldr.w   r6, [pc, #0xa08]
000b7b4e  add     r6, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b7b50  ldr.w   r0, [pc, #0xa04]
000b7b54  ldr     r1, [sp, #0x110]
000b7b56  add     r0, pc ; -> 0x000fdbf4  
000b7b58  ldr     r0, [r0]
000b7b5a  blx     #0xddbfc ; -> objc_msgSend
000b7b5e  ldr.w   r1, [pc, #0x9fc]
000b7b62  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b7b64  ldr     r1, [r1]
000b7b66  blx     #0xddbfc ; -> objc_msgSend
000b7b6a  ldr     r1, [sp, #0x114]
000b7b6c  blx     #0xddbfc ; -> objc_msgSend
000b7b70  ldr.w   r1, [pc, #0x9ec]
000b7b74  ldr.w   r3, [pc, #0x9ec]
000b7b78  ldr     r2, [sp, #0x288]
000b7b7a  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b7b7c  add     r3, pc ; -> 0x001801e4  
000b7b7e  ldr     r4, [r1]
000b7b80  mov     r1, r4
000b7b82  mov     r5, r0
000b7b84  blx     #0xddbfc ; -> objc_msgSend
000b7b88  ldr.w   r3, [pc, #0x9dc]
000b7b8c  mov     r1, r4
000b7b8e  mov     r0, r5
000b7b90  add     r3, pc ; -> 0x001801f4  
000b7b92  mov     r2, fp
000b7b94  blx     #0xddbfc ; -> objc_msgSend
000b7b98  ldr.w   r3, [pc, #0x9d0]
000b7b9c  mov     r1, r4
000b7b9e  mov     r0, r5
000b7ba0  add     r3, pc ; -> 0x00180204  
000b7ba2  mov     r2, sl
000b7ba4  blx     #0xddbfc ; -> objc_msgSend
000b7ba8  ldr.w   r3, [pc, #0x9c4]
000b7bac  mov     r1, r4
000b7bae  mov     r0, r5
000b7bb0  add     r3, pc ; -> 0x00180214  
000b7bb2  mov     r2, r8
000b7bb4  blx     #0xddbfc ; -> objc_msgSend
000b7bb8  ldr.w   r3, [pc, #0x9b8]
000b7bbc  mov     r1, r4
000b7bbe  mov     r0, r5
000b7bc0  add     r3, pc ; -> 0x00180224  
000b7bc2  mov     r2, r6
000b7bc4  blx     #0xddbfc ; -> objc_msgSend
000b7bc8  ldr     r4, [sp, #0x100]
000b7bca  cmp     r4, #0x23
000b7bcc  beq     #0xb7bfc
000b7bce  ldr.w   r1, [pc, #0x9a8]
000b7bd2  ldr.w   r2, [pc, #0x9a8]
000b7bd6  mov     r0, sl
000b7bd8  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000b7bda  add     r2, pc ; -> 0x00180234  
000b7bdc  ldr     r1, [r1]
000b7bde  blx     #0xddbfc ; -> objc_msgSend
000b7be2  tst.w   r0, #0xff
000b7be6  beq     #0xb7bfc
000b7be8  ldr.w   r0, [pc, #0x994]
000b7bec  ldr.w   r1, [pc, #0x994]
000b7bf0  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b7bf2  add     r1, pc ; -> 0x000fd33c  
000b7bf4  ldr     r0, [r0]
000b7bf6  ldr     r1, [r1]
000b7bf8  blx     #0xddbfc ; -> objc_msgSend
000b7bfc  ldr     r6, [sp, #0x100]
000b7bfe  sub.w   r0, r6, #0x20
000b7c02  cmp     r0, #0x10
000b7c04  bhi     #0xb7cbe
000b7c06  tbb     [pc, r0]
000b7c0a  cmp     r2, #9
000b7c0c  asrs    r5, r7, #0x10
000b7c0e  ldr     r2, [pc, #0x168]
000b7c10  ldr     r4, [pc, #0x168]
000b7c12  ldr     r2, [r3, r1]
000b7c14  str     r6, [r1, r1]
000b7c16  strb    r2, [r2, r1]
000b7c18  ldrh    r2, [r2, r1]
000b7c1a  ldrh    r6, [r2, r1]
000b7c1c  ldr.w   r0, [pc, #0x968]
000b7c20  ldr.w   r1, [pc, #0x968]
000b7c24  movs    r2, #0x21
000b7c26  add     r0, pc ; -> 0x0038c0e4  mtxController
000b7c28  add     r1, pc ; -> 0x000fd6d4  
000b7c2a  ldr     r0, [r0]
000b7c2c  ldr     r1, [r1]
000b7c2e  b.w     #0xba416
000b7c32  ldr.w   r3, [pc, #0x95c]
000b7c36  add     r3, pc ; -> 0x0038c1b9  isLoggingOut
000b7c38  ldrsb.w r3, [r3]
000b7c3c  cbz     r3, #0xb7c42
000b7c3e  movs    r0, #0x3b
000b7c40  b       #0xb7cc0
000b7c42  ldr.w   r0, [pc, #0x950]
000b7c46  ldr.w   r1, [pc, #0x950]
000b7c4a  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b7c4c  add     r1, pc ; -> 0x000fd444  
000b7c4e  ldr     r0, [r0]
000b7c50  ldr     r1, [r1]
000b7c52  blx     #0xddbfc ; -> objc_msgSend
000b7c56  ldr.w   r1, [pc, #0x944]
000b7c5a  add     r1, pc ; -> 0x000fd390  
000b7c5c  b       #0xb7c78
000b7c5e  ldr.w   r0, [pc, #0x940]
000b7c62  ldr.w   r1, [pc, #0x940]
000b7c66  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b7c68  add     r1, pc ; -> 0x000fd444  
000b7c6a  ldr     r0, [r0]
000b7c6c  ldr     r1, [r1]
000b7c6e  blx     #0xddbfc ; -> objc_msgSend
000b7c72  ldr.w   r1, [pc, #0x934]
000b7c76  add     r1, pc ; -> 0x000fd390  
000b7c78  ldr     r1, [r1]
000b7c7a  movs    r2, #1
000b7c7c  blx     #0xddbfc ; -> objc_msgSend
000b7c80  movs    r0, #0x39
000b7c82  b       #0xb7cc0
000b7c84  ldr.w   r0, [pc, #0x924]
000b7c88  ldr.w   r1, [pc, #0x924]
000b7c8c  movs    r2, #0
000b7c8e  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b7c90  add     r1, pc ; -> 0x000fd308  
000b7c92  ldr     r0, [r0]
000b7c94  ldr     r1, [r1]
000b7c96  blx     #0xddbfc ; -> objc_msgSend
000b7c9a  movs    r0, #0x43
000b7c9c  b       #0xb7cc0
000b7c9e  movs    r0, #0x45
000b7ca0  b       #0xb7cc0
000b7ca2  movs    r0, #0x47
000b7ca4  b       #0xb7cc0
000b7ca6  movs    r0, #0x4d
000b7ca8  b       #0xb7cc0
000b7caa  movs    r0, #0x4f
000b7cac  b       #0xb7cc0
000b7cae  movs    r0, #0x49
000b7cb0  b       #0xb7cc0
000b7cb2  movs    r0, #0x4b
000b7cb4  b       #0xb7cc0
000b7cb6  movs    r0, #0x56
000b7cb8  b       #0xb7cc0
000b7cba  movs    r0, #0x51
000b7cbc  b       #0xb7cc0
000b7cbe  movs    r0, #0x37
000b7cc0  ldr     r1, [sp, #0xfc]
000b7cc2  mov     r2, r5
000b7cc4  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000b7cc8  b.w     #0xbadce
000b7ccc  ldr     r2, [sp, #0x100]
000b7cce  sub.w   r3, r2, #0x20
000b7cd2  cmp     r3, #0x10
000b7cd4  bhi.w   #0xbad8a
000b7cd8  adr     r4, #4
000b7cda  add.w   r4, r4, r3, lsl #2
000b7cde  mov     pc, r4
000b7ce0  b.w     #0xb7d28
000b7ce4  b.w     #0xb7ff0
000b7ce8  b.w     #0xb8006
000b7cec  b.w     #0xb8822
000b7cf0  b.w     #0xb8b26
000b7cf4  b.w     #0xb951e
000b7cf8  b.w     #0xb8f2e
000b7cfc  b.w     #0xb9ee0
000b7d00  b.w     #0xbad8a
000b7d04  b.w     #0xb9ee6
000b7d08  b.w     #0xba660
000b7d0c  b.w     #0xba664
000b7d10  b.w     #0xba8b4
000b7d14  b.w     #0xbabb4
000b7d18  b.w     #0xba668
000b7d1c  b.w     #0xbabb8
000b7d20  b.w     #0xbad80
000b7d24  b.w     #0xbad8a
000b7d28  ldr.w   r2, [pc, #0x888]
000b7d2c  mov     r1, r8
000b7d2e  movs    r3, #0
000b7d30  add     r2, pc ; -> 0x00180244  
000b7d32  mov     r0, r6
000b7d34  blx     #0xddbfc ; -> objc_msgSend
000b7d38  movs    r3, #0
000b7d3a  add.w   r2, sp, #0xae0
000b7d3e  str.w   r3, [sp, #0xaf4]
000b7d42  str.w   r3, [sp, #0xaf8]
000b7d46  str.w   r3, [sp, #0xafc]
000b7d4a  str.w   r3, [sp, #0xb00]
000b7d4e  str.w   r3, [sp, #0xb04]
000b7d52  str.w   r3, [sp, #0xb08]
000b7d56  str.w   r3, [sp, #0xb0c]
000b7d5a  str.w   r3, [sp, #0xb10]
000b7d5e  adds    r3, #0x10
000b7d60  str     r3, [sp]
000b7d62  add.w   r3, sp, #0x860
000b7d66  ldr     r1, [sp, #0x118]
000b7d68  adds    r2, #0x14
000b7d6a  adds    r3, #0x14
000b7d6c  str     r0, [sp, #0x3e4]
000b7d6e  blx     #0xddbfc ; -> objc_msgSend
000b7d72  cmp     r0, #0
000b7d74  beq.w   #0xb7f34
000b7d78  ldr.w   r1, [pc, #0x83c]
000b7d7c  ldr.w   r3, [sp, #0xafc]
000b7d80  add     r1, pc ; -> 0x000fd304  
000b7d82  ldr     r1, [r1]
000b7d84  ldr     r5, [r3]
000b7d86  str     r0, [sp, #0x28c]
000b7d88  str     r1, [sp, #0x11c]
000b7d8a  ldr.w   r1, [pc, #0x830]
000b7d8e  str     r5, [sp, #0x290]
000b7d90  add     r1, pc ; -> 0x000fd300  
000b7d92  ldr     r6, [r1]
000b7d94  ldr.w   r1, [pc, #0x828]
000b7d98  add     r1, pc ; -> 0x000fd30c  
000b7d9a  ldr     r1, [r1]
000b7d9c  str     r1, [sp, #0x3a4]
000b7d9e  ldr.w   r1, [pc, #0x824]
000b7da2  add     r1, pc ; -> 0x000fcb70  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1f8
000b7da4  ldr     r1, [r1]
000b7da6  str     r1, [sp, #0x120]
000b7da8  ldr.w   r1, [pc, #0x81c]
000b7dac  add     r1, pc ; -> 0x000fd16c  
000b7dae  ldr     r1, [r1]
000b7db0  str     r1, [sp, #0x124]
000b7db2  ldr.w   r1, [pc, #0x818]
000b7db6  add     r1, pc ; -> 0x000fcdc4  
000b7db8  ldr     r1, [r1]
000b7dba  str     r1, [sp, #0x128]
000b7dbc  ldr.w   r1, [pc, #0x810]
000b7dc0  add     r1, pc ; -> 0x000fd52c  
000b7dc2  ldr     r1, [r1]
000b7dc4  str     r1, [sp, #0x12c]
000b7dc6  ldr.w   r1, [pc, #0x80c]
000b7dca  add     r1, pc ; -> 0x000fd2fc  
000b7dcc  ldr     r1, [r1]
000b7dce  str     r1, [sp, #0x130]
000b7dd0  ldr.w   r1, [pc, #0x804]
000b7dd4  add     r1, pc ; -> 0x000fd2f8  
000b7dd6  ldr     r1, [r1]
000b7dd8  str     r1, [sp, #0x134]
000b7dda  ldr.w   r1, [pc, #0x800]
000b7dde  add     r1, pc ; -> 0x000fd6b0  
000b7de0  ldr     r1, [r1]
000b7de2  str     r1, [sp, #0x138]
000b7de4  b       #0xb7dea
000b7de6  ldr.w   r3, [sp, #0xafc]
000b7dea  movs    r1, #0
000b7dec  str     r1, [sp, #0x350]
000b7dee  b       #0xb7df4
000b7df0  ldr.w   r3, [sp, #0xafc]
000b7df4  ldr     r3, [r3]
000b7df6  ldr     r2, [sp, #0x290]
000b7df8  cmp     r3, r2
000b7dfa  beq     #0xb7e02
000b7dfc  ldr     r0, [sp, #0x3e4]
000b7dfe  blx     #0xddbe4 ; -> objc_enumerationMutation
000b7e02  ldr.w   r0, [sp, #0xaf8]
000b7e06  ldr     r3, [sp, #0x350]
000b7e08  movs    r4, #0
000b7e0a  ldr.w   r5, [r0, r3, lsl #2]
000b7e0e  b       #0xb7efa
000b7e10  mov     r1, r6
000b7e12  mov     r0, r5
000b7e14  mov     r2, r4
000b7e16  blx     #0xddbfc ; -> objc_msgSend
000b7e1a  ldr     r1, [sp, #0x3a4]
000b7e1c  blx     #0xddbfc ; -> objc_msgSend
000b7e20  cmp     r0, #0
000b7e22  beq     #0xb7ef8
000b7e24  mov     r1, r6
000b7e26  mov     r0, r5
000b7e28  mov     r2, r4
000b7e2a  blx     #0xddbfc ; -> objc_msgSend
000b7e2e  ldr     r1, [sp, #0x120]
000b7e30  blx     #0xddbfc ; -> objc_msgSend
000b7e34  cmp     r0, #0
000b7e36  beq     #0xb7ef8
000b7e38  mov     r2, r4
000b7e3a  mov     r1, r6
000b7e3c  mov     r0, r5
000b7e3e  blx     #0xddbfc ; -> objc_msgSend
000b7e42  ldr     r1, [sp, #0x120]
000b7e44  blx     #0xddbfc ; -> objc_msgSend
000b7e48  ldr.w   r2, [pc, #0x794]
000b7e4c  ldr     r1, [sp, #0x124]
000b7e4e  add     r2, pc ; -> 0x0017f2d4  
000b7e50  blx     #0xddbfc ; -> objc_msgSend
000b7e54  mov     sl, r0
000b7e56  cmp     r0, #0
000b7e58  bne     #0xb7ef8
000b7e5a  mov     r2, r4
000b7e5c  mov     r1, r6
000b7e5e  mov     r0, r5
000b7e60  blx     #0xddbfc ; -> objc_msgSend
000b7e64  ldr     r1, [sp, #0x3a4]
000b7e66  blx     #0xddbfc ; -> objc_msgSend
000b7e6a  movs    r2, #7
000b7e6c  ldr     r1, [sp, #0x128]
000b7e6e  blx     #0xddbfc ; -> objc_msgSend
000b7e72  ldr.w   fp, [pc, #0x770]
000b7e76  ldr     r1, [sp, #0x12c]
000b7e78  add     fp, pc ; -> 0x0038c1b0  mSocialInfo
000b7e7a  mov     r8, r0
000b7e7c  ldr.w   r0, [fp]
000b7e80  blx     #0xddbfc ; -> objc_msgSend
000b7e84  mov     r2, r8
000b7e86  ldr     r1, [sp, #0x130]
000b7e88  blx     #0xddbfc ; -> objc_msgSend
000b7e8c  ldr     r1, [sp, #0x12c]
000b7e8e  ldr.w   r0, [fp]
000b7e92  blx     #0xddbfc ; -> objc_msgSend
000b7e96  ldr     r1, [sp, #0x138]
000b7e98  mov     r8, r0
000b7e9a  ldr.w   r0, [pc, #0x74c]
000b7e9e  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000b7ea0  ldr     r0, [r0]
000b7ea2  blx     #0xddbfc ; -> objc_msgSend
000b7ea6  ldr     r1, [sp, #0x134]
000b7ea8  mov     r2, r0
000b7eaa  mov     r0, r8
000b7eac  blx     #0xddbfc ; -> objc_msgSend
000b7eb0  ldr.w   r3, [pc, #0x738]
000b7eb4  ldr.w   r0, [fp]
000b7eb8  ldr     r1, [sp, #0x12c]
000b7eba  add     r3, pc ; -> 0x0038c1b8  isLoggingOut
000b7ebc  movs    r2, #1
000b7ebe  strb    r2, [r3]
000b7ec0  blx     #0xddbfc ; -> objc_msgSend
000b7ec4  cbz     r0, #0xb7ef8
000b7ec6  ldr.w   r1, [pc, #0x728]
000b7eca  ldr.w   r3, [pc, #0x728]
000b7ece  ldr.w   r0, [fp]
000b7ed2  add     r1, pc ; -> 0x000fd2f4  
000b7ed4  add     r3, pc ; -> 0x0038c1b9  isLoggingOut
000b7ed6  ldr     r1, [r1]
000b7ed8  mov     r2, sl
000b7eda  strb.w  sl, [r3]
000b7ede  blx     #0xddbfc ; -> objc_msgSend
000b7ee2  ldr.w   r0, [pc, #0x714]
000b7ee6  ldr.w   r1, [pc, #0x714]
000b7eea  movs    r2, #0x23
000b7eec  add     r0, pc ; -> 0x0038c0e4  mtxController
000b7eee  add     r1, pc ; -> 0x000fd6d4  
000b7ef0  ldr     r0, [r0]
000b7ef2  ldr     r1, [r1]
000b7ef4  b.w     #0xba416
000b7ef8  adds    r4, #1
000b7efa  mov     r0, r5
000b7efc  ldr     r1, [sp, #0x11c]
000b7efe  blx     #0xddbfc ; -> objc_msgSend
000b7f02  cmp     r0, r4
000b7f04  bhi     #0xb7e10
000b7f06  ldr     r4, [sp, #0x350]
000b7f08  ldr     r5, [sp, #0x28c]
000b7f0a  adds    r4, #1
000b7f0c  cmp     r5, r4
000b7f0e  str     r4, [sp, #0x350]
000b7f10  bhi.w   #0xb7df0
000b7f14  movs    r3, #0x10
000b7f16  add.w   r2, sp, #0xae0
000b7f1a  str     r3, [sp]
000b7f1c  add.w   r3, sp, #0x860
000b7f20  ldr     r0, [sp, #0x3e4]
000b7f22  ldr     r1, [sp, #0x118]
000b7f24  adds    r2, #0x14
000b7f26  adds    r3, #0x14
000b7f28  blx     #0xddbfc ; -> objc_msgSend
000b7f2c  str     r0, [sp, #0x28c]
000b7f2e  cmp     r0, #0
000b7f30  bne.w   #0xb7de6
000b7f34  ldr.w   r0, [pc, #0x6c8]
000b7f38  ldr     r1, [sp, #0x110]
000b7f3a  ldr.w   r6, [pc, #0x6c8]
000b7f3e  add     r0, pc ; -> 0x000fdbf4  
000b7f40  ldr     r0, [r0]
000b7f42  blx     #0xddbfc ; -> objc_msgSend
000b7f46  ldr.w   r1, [pc, #0x6c0]
000b7f4a  add     r6, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b7f4c  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b7f4e  ldr     r1, [r1]
000b7f50  blx     #0xddbfc ; -> objc_msgSend
000b7f54  ldr     r1, [sp, #0x114]
000b7f56  blx     #0xddbfc ; -> objc_msgSend
000b7f5a  ldr.w   r1, [pc, #0x6b0]
000b7f5e  ldr.w   r3, [pc, #0x6b0]
000b7f62  mov     r2, r6
000b7f64  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b7f66  add     r3, pc ; -> 0x001801e4  
000b7f68  ldr     r4, [r1]
000b7f6a  mov     r1, r4
000b7f6c  mov     r5, r0
000b7f6e  blx     #0xddbfc ; -> objc_msgSend
000b7f72  ldr.w   r3, [pc, #0x6a0]
000b7f76  mov     r0, r5
000b7f78  mov     r1, r4
000b7f7a  add     r3, pc ; -> 0x001801f4  
000b7f7c  mov     r2, r6
000b7f7e  blx     #0xddbfc ; -> objc_msgSend
000b7f82  ldr.w   r2, [pc, #0x694]
000b7f86  ldr     r1, [sp, #0x108]
000b7f88  mvn     r3, #0x3e8
000b7f8c  add     r2, pc ; -> 0x0017e5c4  
000b7f8e  ldr     r0, [sp, #0x104]
000b7f90  blx     #0xddbfc ; -> objc_msgSend
000b7f94  ldr.w   r3, [pc, #0x684]
000b7f98  mov     r1, r4
000b7f9a  add     r3, pc ; -> 0x00180204  
000b7f9c  mov     r2, r0
000b7f9e  mov     r0, r5
000b7fa0  blx     #0xddbfc ; -> objc_msgSend
000b7fa4  ldr.w   r3, [pc, #0x678]
000b7fa8  mov     r0, r5
000b7faa  mov     r1, r4
000b7fac  add     r3, pc ; -> 0x00180214  
000b7fae  mov     r2, r6
000b7fb0  blx     #0xddbfc ; -> objc_msgSend
000b7fb4  ldr.w   r3, [pc, #0x66c]
000b7fb8  mov     r2, r6
000b7fba  mov     r0, r5
000b7fbc  add     r3, pc ; -> 0x00180224  
000b7fbe  mov     r1, r4
000b7fc0  blx     #0xddbfc ; -> objc_msgSend
000b7fc4  ldr.w   r0, [pc, #0x660]
000b7fc8  ldr.w   r1, [pc, #0x660]
000b7fcc  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b7fce  add     r1, pc ; -> 0x000fd444  
000b7fd0  ldr     r0, [r0]
000b7fd2  ldr     r1, [r1]
000b7fd4  blx     #0xddbfc ; -> objc_msgSend
000b7fd8  ldr.w   r1, [pc, #0x654]
000b7fdc  movs    r2, #1
000b7fde  add     r1, pc ; -> 0x000fd390  
000b7fe0  ldr     r1, [r1]
000b7fe2  blx     #0xddbfc ; -> objc_msgSend
000b7fe6  ldr     r1, [sp, #0xfc]
000b7fe8  movs    r0, #0x39
000b7fea  mov     r2, r5
000b7fec  b.w     #0xbad86
000b7ff0  ldr.w   r0, [pc, #0x640]
000b7ff4  ldr.w   r1, [pc, #0x640]
000b7ff8  movs    r2, #0x20
000b7ffa  add     r0, pc ; -> 0x0038c0e4  mtxController
000b7ffc  add     r1, pc ; -> 0x000fd6d4  
000b7ffe  ldr     r0, [r0]
000b8000  ldr     r1, [r1]
000b8002  b.w     #0xb8f28
000b8006  ldr.w   r2, [pc, #0x634]
000b800a  mov     r1, r8
000b800c  movs    r3, #0
000b800e  add     r2, pc ; -> 0x00180254  
000b8010  mov     r0, r6
000b8012  blx     #0xddbfc ; -> objc_msgSend
000b8016  movs    r3, #0
000b8018  add.w   r2, sp, #0xac0
000b801c  str.w   r3, [sp, #0xad4]
000b8020  str.w   r3, [sp, #0xad8]
000b8024  str.w   r3, [sp, #0xadc]
000b8028  str.w   r3, [sp, #0xae0]
000b802c  str.w   r3, [sp, #0xae4]
000b8030  str.w   r3, [sp, #0xae8]
000b8034  str.w   r3, [sp, #0xaec]
000b8038  str.w   r3, [sp, #0xaf0]
000b803c  adds    r3, #0x10
000b803e  str     r3, [sp]
000b8040  add.w   r3, sp, #0x820
000b8044  ldr     r1, [sp, #0x118]
000b8046  adds    r2, #0x14
000b8048  adds    r3, #0x14
000b804a  str     r0, [sp, #0x3e8]
000b804c  blx     #0xddbfc ; -> objc_msgSend
000b8050  cmp     r0, #0
000b8052  beq.w   #0xb82cc
000b8056  ldr.w   r1, [pc, #0x5e8]
000b805a  ldr.w   r3, [sp, #0xadc]
000b805e  add     r1, pc ; -> 0x000fd304  
000b8060  ldr     r1, [r1]
000b8062  ldr     r6, [r3]
000b8064  str     r0, [sp, #0x29c]
000b8066  str     r1, [sp, #0x3c8]
000b8068  ldr.w   r1, [pc, #0x5d8]
000b806c  str     r6, [sp, #0x2a4]
000b806e  add     r1, pc ; -> 0x000fd300  
000b8070  ldr.w   sl, [r1]
000b8074  ldr.w   r1, [pc, #0x5d0]
000b8078  add     r1, pc ; -> 0x000fd30c  
000b807a  ldr     r1, [r1]
000b807c  str     r1, [sp, #0x3a8]
000b807e  ldr.w   r1, [pc, #0x5cc]
000b8082  add     r1, pc ; -> 0x000fcb70  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1f8
000b8084  ldr     r1, [r1]
000b8086  str     r1, [sp, #0x388]
000b8088  ldr.w   r1, [pc, #0x5c4]
000b808c  add     r1, pc ; -> 0x000fd16c  
000b808e  ldr.w   fp, [r1]
000b8092  ldr.w   r1, [pc, #0x5c0]
000b8096  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b8098  ldr     r1, [r1]
000b809a  str     r1, [sp, #0x13c]
000b809c  ldr.w   r1, [pc, #0x5b8]
000b80a0  add     r1, pc ; -> 0x000fd37c  
000b80a2  ldr     r1, [r1]
000b80a4  str     r1, [sp, #0x140]
000b80a6  ldr.w   r1, [pc, #0x5b4]
000b80aa  add     r1, pc ; -> 0x000fd530  
000b80ac  ldr     r1, [r1]
000b80ae  str     r1, [sp, #0x148]
000b80b0  ldr.w   r1, [pc, #0x5ac]
000b80b4  add     r1, pc ; -> 0x000fd2fc  
000b80b6  ldr     r1, [r1]
000b80b8  str.w   r1, [sp, #0x44c]
000b80bc  ldr.w   r1, [pc, #0x5a4]
000b80c0  add     r1, pc ; -> 0x000fd2f8  
000b80c2  ldr     r1, [r1]
000b80c4  str.w   r1, [sp, #0x470]
000b80c8  ldr.w   r1, [pc, #0x59c]
000b80cc  str     r1, [sp, #0x64]
000b80ce  b       #0xb80d4
000b80d0  ldr.w   r3, [sp, #0xadc]
000b80d4  movs    r2, #0
000b80d6  str     r2, [sp, #0x354]
000b80d8  b       #0xb80de
000b80da  ldr.w   r3, [sp, #0xadc]
000b80de  ldr     r3, [r3]
000b80e0  ldr     r4, [sp, #0x2a4]
000b80e2  cmp     r3, r4
000b80e4  beq     #0xb80ec
000b80e6  ldr     r0, [sp, #0x3e8]
000b80e8  blx     #0xddbe4 ; -> objc_enumerationMutation
000b80ec  ldr     r5, [sp, #0x354]
000b80ee  ldr.w   r0, [sp, #0xad8]
000b80f2  movs    r6, #0
000b80f4  ldr.w   r4, [r0, r5, lsl #2]
000b80f8  str     r6, [sp, #0x2a0]
000b80fa  mov     r5, r6
000b80fc  b       #0xb81a4
000b80fe  mov     r1, sl
000b8100  mov     r0, r4
000b8102  mov     r2, r5
000b8104  blx     #0xddbfc ; -> objc_msgSend
000b8108  ldr     r1, [sp, #0x3a8]
000b810a  blx     #0xddbfc ; -> objc_msgSend
000b810e  cmp     r0, #0
000b8110  beq     #0xb81a2
000b8112  mov     r1, sl
000b8114  mov     r0, r4
000b8116  mov     r2, r5
000b8118  blx     #0xddbfc ; -> objc_msgSend
000b811c  ldr     r1, [sp, #0x388]
000b811e  blx     #0xddbfc ; -> objc_msgSend
000b8122  cmp     r0, #0
000b8124  beq     #0xb81a2
000b8126  mov     r2, r5
000b8128  mov     r1, sl
000b812a  mov     r0, r4
000b812c  blx     #0xddbfc ; -> objc_msgSend
000b8130  ldr     r1, [sp, #0x388]
000b8132  blx     #0xddbfc ; -> objc_msgSend
000b8136  ldr.w   r2, [pc, #0x534]
000b813a  mov     r1, fp
000b813c  add     r2, pc ; -> 0x0017f1c4  
000b813e  mov     r6, r0
000b8140  blx     #0xddbfc ; -> objc_msgSend
000b8144  cbnz    r0, #0xb8158
000b8146  mov     r1, sl
000b8148  mov     r2, r5
000b814a  mov     r0, r4
000b814c  blx     #0xddbfc ; -> objc_msgSend
000b8150  ldr     r1, [sp, #0x3a8]
000b8152  blx     #0xddbfc ; -> objc_msgSend
000b8156  str     r0, [sp, #0x298]
000b8158  ldr.w   r2, [pc, #0x514]
000b815c  mov     r0, r6
000b815e  mov     r1, fp
000b8160  add     r2, pc ; -> 0x00180264  
000b8162  blx     #0xddbfc ; -> objc_msgSend
000b8166  cbnz    r0, #0xb817a
000b8168  mov     r1, sl
000b816a  mov     r2, r5
000b816c  mov     r0, r4
000b816e  blx     #0xddbfc ; -> objc_msgSend
000b8172  ldr     r1, [sp, #0x3a8]
000b8174  blx     #0xddbfc ; -> objc_msgSend
000b8178  str     r0, [sp, #0x294]
000b817a  ldr.w   r2, [pc, #0x4f8]
000b817e  mov     r0, r6
000b8180  mov     r1, fp
000b8182  add     r2, pc ; -> 0x00180274  
000b8184  blx     #0xddbfc ; -> objc_msgSend
000b8188  cbnz    r0, #0xb81a2
000b818a  mov     r2, r5
000b818c  mov     r1, sl
000b818e  mov     r0, r4
000b8190  blx     #0xddbfc ; -> objc_msgSend
000b8194  ldr     r1, [sp, #0x3a8]
000b8196  blx     #0xddbfc ; -> objc_msgSend
000b819a  ldr     r1, [sp, #0x13c]
000b819c  blx     #0xddbfc ; -> objc_msgSend
000b81a0  str     r0, [sp, #0x2a0]
000b81a2  adds    r5, #1
000b81a4  mov     r0, r4
000b81a6  ldr     r1, [sp, #0x3c8]
000b81a8  blx     #0xddbfc ; -> objc_msgSend
000b81ac  cmp     r5, r0
000b81ae  blo     #0xb80fe
000b81b0  ldr     r0, [sp, #0x64]
000b81b2  ldr     r1, [sp, #0x140]
000b81b4  movs    r3, #0
000b81b6  add     r0, pc
000b81b8  str.w   r3, [sp, #0xab4]
000b81bc  ldr     r0, [r0]
000b81be  str.w   r3, [sp, #0xab8]
000b81c2  str.w   r3, [sp, #0xabc]
000b81c6  str.w   r3, [sp, #0xac0]
000b81ca  str.w   r3, [sp, #0xac4]
000b81ce  str.w   r3, [sp, #0xac8]
000b81d2  str.w   r3, [sp, #0xacc]
000b81d6  str.w   r3, [sp, #0xad0]
000b81da  blx     #0xddbfc ; -> objc_msgSend
000b81de  movs    r3, #0x10
000b81e0  add.w   r2, sp, #0xaa0
000b81e4  str     r3, [sp]
000b81e6  add.w   r3, sp, #0x7f0
000b81ea  ldr     r1, [sp, #0x118]
000b81ec  adds    r2, #0x14
000b81ee  adds    r3, #4
000b81f0  str     r0, [sp, #0x144]
000b81f2  blx     #0xddbfc ; -> objc_msgSend
000b81f6  cmp     r0, #0
000b81f8  beq     #0xb829e
000b81fa  ldr.w   r3, [sp, #0xabc]
000b81fe  ldr.w   r2, [pc, #0x478]
000b8202  mov     r8, r0
000b8204  ldr     r1, [r3]
000b8206  str     r2, [sp, #0x40]
000b8208  str     r1, [sp, #0x2a8]
000b820a  b       #0xb8210
000b820c  ldr.w   r3, [sp, #0xabc]
000b8210  movs    r6, #0
000b8212  b       #0xb8218
000b8214  ldr.w   r3, [sp, #0xabc]
000b8218  ldr     r3, [r3]
000b821a  ldr     r4, [sp, #0x2a8]
000b821c  cmp     r3, r4
000b821e  beq     #0xb8232
000b8220  ldr.w   r0, [pc, #0x458]
000b8224  ldr     r1, [sp, #0x140]
000b8226  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b8228  ldr     r0, [r0]
000b822a  blx     #0xddbfc ; -> objc_msgSend
000b822e  blx     #0xddbe4 ; -> objc_enumerationMutation
000b8232  ldr.w   r0, [sp, #0xab8]
000b8236  ldr     r1, [sp, #0x148]
000b8238  ldr     r5, [sp, #0x40]
000b823a  ldr.w   r4, [r0, r6, lsl #2]
000b823e  add     r5, pc
000b8240  mov     r0, r4
000b8242  blx     #0xddbfc ; -> objc_msgSend
000b8246  mov     r1, r0
000b8248  mov     r0, r5
000b824a  blx     #0xdd3e0 ; -> NSLog
000b824e  ldr     r1, [sp, #0x148]
000b8250  mov     r0, r4
000b8252  blx     #0xddbfc ; -> objc_msgSend
000b8256  mov     r1, fp
000b8258  ldr     r2, [sp, #0x294]
000b825a  blx     #0xddbfc ; -> objc_msgSend
000b825e  cbnz    r0, #0xb827a
000b8260  mov     r0, r4
000b8262  ldr.w   r1, [sp, #0x44c]
000b8266  ldr     r2, [sp, #0x298]
000b8268  blx     #0xddbfc ; -> objc_msgSend
000b826c  mov     r0, r4
000b826e  ldr.w   r1, [sp, #0x470]
000b8272  ldr     r2, [sp, #0x2a0]
000b8274  blx     #0xddbfc ; -> objc_msgSend
000b8278  b       #0xb829e
000b827a  adds    r6, #1
000b827c  cmp     r8, r6
000b827e  bhi     #0xb8214
000b8280  movs    r3, #0x10
000b8282  add.w   r2, sp, #0xaa0
000b8286  str     r3, [sp]
000b8288  add.w   r3, sp, #0x7f0
000b828c  ldr     r0, [sp, #0x144]
000b828e  ldr     r1, [sp, #0x118]
000b8290  adds    r2, #0x14
000b8292  adds    r3, #4
000b8294  blx     #0xddbfc ; -> objc_msgSend
000b8298  mov     r8, r0
000b829a  cmp     r0, #0
000b829c  bne     #0xb820c
000b829e  ldr     r5, [sp, #0x354]
000b82a0  ldr     r6, [sp, #0x29c]
000b82a2  adds    r5, #1
000b82a4  cmp     r6, r5
000b82a6  str     r5, [sp, #0x354]
000b82a8  bhi.w   #0xb80da
000b82ac  movs    r3, #0x10
000b82ae  add.w   r2, sp, #0xac0
000b82b2  str     r3, [sp]
000b82b4  add.w   r3, sp, #0x820
000b82b8  ldr     r0, [sp, #0x3e8]
000b82ba  ldr     r1, [sp, #0x118]
000b82bc  adds    r2, #0x14
000b82be  adds    r3, #0x14
000b82c0  blx     #0xddbfc ; -> objc_msgSend
000b82c4  str     r0, [sp, #0x29c]
000b82c6  cmp     r0, #0
000b82c8  bne.w   #0xb80d0
000b82cc  ldr     r3, [pc, #0x3b0]
000b82ce  add     r3, pc ; -> 0x0038c1b4  gettingLeaderboard
000b82d0  ldrsb.w r3, [r3]
000b82d4  cmp     r3, #0
000b82d6  beq.w   #0xb87e8
000b82da  ldr.w   r5, [pc, #0x3a8]
000b82de  ldr.w   r1, [pc, #0x3a8]
000b82e2  ldr     r4, [pc, #0x3a8]
000b82e4  add     r5, pc ; -> 0x0038c1b0  mSocialInfo
000b82e6  add     r1, pc ; -> 0x000fd52c  
000b82e8  ldr     r0, [r5]
000b82ea  ldr     r1, [r1]
000b82ec  blx     #0xddbfc ; -> objc_msgSend
000b82f0  ldr     r1, [pc, #0x39c]
000b82f2  add     r4, pc ; -> 0x00180294  
000b82f4  add     r1, pc ; -> 0x000fd524  
000b82f6  ldr     r1, [r1]
000b82f8  str     r1, [sp, #0x14c]
000b82fa  blx     #0xddbfc ; -> objc_msgSend
000b82fe  mov     r2, r4
000b8300  ldr     r1, [sp, #0x108]
000b8302  mov     r3, r0
000b8304  ldr     r0, [sp, #0x104]
000b8306  blx     #0xddbfc ; -> objc_msgSend
000b830a  ldr     r1, [pc, #0x388]
000b830c  movs    r3, #0
000b830e  str.w   r3, [sp, #0xa94]
000b8312  add     r1, pc ; -> 0x000fd37c  
000b8314  str.w   r3, [sp, #0xa98]
000b8318  ldr     r1, [r1]
000b831a  str.w   r3, [sp, #0xa9c]
000b831e  str.w   r3, [sp, #0xaa0]
000b8322  str.w   r3, [sp, #0xaa4]
000b8326  str.w   r3, [sp, #0xaa8]
000b832a  str.w   r3, [sp, #0xaac]
000b832e  str.w   r3, [sp, #0xab0]
000b8332  str.w   r1, [sp, #0x460]
000b8336  mov     fp, r0
000b8338  ldr     r0, [r5]
000b833a  blx     #0xddbfc ; -> objc_msgSend
000b833e  movs    r3, #0x10
000b8340  add.w   r2, sp, #0xa80
000b8344  str     r3, [sp]
000b8346  add.w   r3, sp, #0x7b0
000b834a  ldr     r1, [sp, #0x118]
000b834c  adds    r2, #0x14
000b834e  adds    r3, #4
000b8350  str     r0, [sp, #0x150]
000b8352  blx     #0xddbfc ; -> objc_msgSend
000b8356  cmp     r0, #0
000b8358  beq     #0xb83f2
000b835a  ldr     r1, [pc, #0x33c]
000b835c  ldr.w   r3, [sp, #0xa9c]
000b8360  mov     sl, r0
000b8362  add     r1, pc ; -> 0x000fd348  
000b8364  ldr     r1, [r1]
000b8366  ldr.w   r8, [r3]
000b836a  str     r1, [sp, #0x154]
000b836c  b       #0xb8372
000b836e  ldr.w   r3, [sp, #0xa9c]
000b8372  movs    r5, #0
000b8374  b       #0xb837a
000b8376  ldr.w   r3, [sp, #0xa9c]
000b837a  ldr     r3, [r3]
000b837c  cmp     r3, r8
000b837e  beq     #0xb8394
000b8380  ldr.w   r0, [pc, #0x318]
000b8384  ldr.w   r1, [sp, #0x460]
000b8388  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b838a  ldr     r0, [r0]
000b838c  blx     #0xddbfc ; -> objc_msgSend
000b8390  blx     #0xddbe4 ; -> objc_enumerationMutation
000b8394  ldr.w   r0, [sp, #0xa98]
000b8398  ldr     r1, [sp, #0x154]
000b839a  ldr.w   r4, [r0, r5, lsl #2]
000b839e  mov     r0, r4
000b83a0  blx     #0xddbfc ; -> objc_msgSend
000b83a4  cbz     r0, #0xb83ce
000b83a6  mov     r0, r4
000b83a8  ldr     r1, [sp, #0x14c]
000b83aa  blx     #0xddbfc ; -> objc_msgSend
000b83ae  cbz     r0, #0xb83ce
000b83b0  ldr     r1, [sp, #0x14c]
000b83b2  mov     r0, r4
000b83b4  blx     #0xddbfc ; -> objc_msgSend
000b83b8  ldr.w   r6, [pc, #0x2e4]
000b83bc  mov     r3, fp
000b83be  ldr     r1, [sp, #0x108]
000b83c0  add     r6, pc ; -> 0x001802a4  
000b83c2  mov     r2, r6
000b83c4  str     r0, [sp]
000b83c6  ldr     r0, [sp, #0x104]
000b83c8  blx     #0xddbfc ; -> objc_msgSend
000b83cc  mov     fp, r0
000b83ce  adds    r5, #1
000b83d0  cmp     sl, r5
000b83d2  bhi     #0xb8376
000b83d4  movs    r3, #0x10
000b83d6  add.w   r2, sp, #0xa80
000b83da  str     r3, [sp]
000b83dc  add.w   r3, sp, #0x7b0
000b83e0  ldr     r0, [sp, #0x150]
000b83e2  ldr     r1, [sp, #0x118]
000b83e4  adds    r2, #0x14
000b83e6  adds    r3, #4
000b83e8  blx     #0xddbfc ; -> objc_msgSend
000b83ec  mov     sl, r0
000b83ee  cmp     r0, #0
000b83f0  bne     #0xb836e
000b83f2  mov     r0, fp
000b83f4  ldr     r1, [sp, #0x10c]
000b83f6  blx     #0xddbfc ; -> objc_msgSend
000b83fa  cbz     r0, #0xb8416
000b83fc  ldr     r1, [pc, #0x2a4]
000b83fe  mov     r0, fp
000b8400  add     r1, pc ; -> 0x000fd350  
000b8402  ldr     r4, [r1]
000b8404  ldr     r1, [sp, #0x10c]
000b8406  blx     #0xddbfc ; -> objc_msgSend
000b840a  mov     r1, r4
000b840c  subs    r2, r0, #1
000b840e  mov     r0, fp
000b8410  blx     #0xddbfc ; -> objc_msgSend
000b8414  mov     fp, r0
000b8416  ldr     r4, [pc, #0x290]
000b8418  ldr     r1, [pc, #0x290]
000b841a  mov     r2, fp
000b841c  add     r4, pc ; -> 0x0038c1b0  mSocialInfo
000b841e  add     r1, pc ; -> 0x000fd34c  
000b8420  ldr     r0, [r4]
000b8422  ldr     r1, [r1]
000b8424  blx     #0xddbfc ; -> objc_msgSend
000b8428  ldr     r1, [pc, #0x284]
000b842a  ldr     r0, [r4]
000b842c  add     r1, pc ; -> 0x000fd344  
000b842e  ldr     r1, [r1]
000b8430  str     r1, [sp, #0x158]
000b8432  blx     #0xddbfc ; -> objc_msgSend
000b8436  ldr     r1, [pc, #0x27c]
000b8438  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b843a  ldr     r1, [r1]
000b843c  blx     #0xddbfc ; -> objc_msgSend
000b8440  cmp     r0, #0
000b8442  beq.w   #0xb87c2
000b8446  ldr     r1, [sp, #0x158]
000b8448  ldr     r0, [r4]
000b844a  movs    r3, #0
000b844c  str.w   r3, [sp, #0xa74]
000b8450  str.w   r3, [sp, #0xa78]
000b8454  str.w   r3, [sp, #0xa7c]
000b8458  str.w   r3, [sp, #0xa80]
000b845c  str.w   r3, [sp, #0xa84]
000b8460  str.w   r3, [sp, #0xa88]
000b8464  str.w   r3, [sp, #0xa8c]
000b8468  str.w   r3, [sp, #0xa90]
000b846c  blx     #0xddbfc ; -> objc_msgSend
000b8470  ldr     r1, [pc, #0x244]
000b8472  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000b8474  ldr     r1, [r1]
000b8476  str     r1, [sp, #0x160]
000b8478  str     r0, [sp, #0x15c]
000b847a  blx     #0xddbfc ; -> objc_msgSend
000b847e  movs    r3, #0x10
000b8480  add.w   r2, sp, #0xa60
000b8484  str     r3, [sp]
000b8486  add.w   r3, sp, #0x770
000b848a  ldr     r1, [sp, #0x118]
000b848c  adds    r2, #0x14
000b848e  adds    r3, #4
000b8490  str     r0, [sp, #0x164]
000b8492  blx     #0xddbfc ; -> objc_msgSend
000b8496  cmp     r0, #0
000b8498  beq.w   #0xb87a6
000b849c  ldr.w   r3, [sp, #0xa7c]
000b84a0  ldr.w   r2, [pc, #0x218]
000b84a4  ldr     r4, [pc, #0x218]
000b84a6  ldr     r5, [pc, #0x21c]
000b84a8  ldr     r1, [r3]
000b84aa  ldr     r6, [pc, #0x21c]
000b84ac  str     r0, [sp, #0x2ac]
000b84ae  str     r2, [sp, #0x50]
000b84b0  str     r1, [sp, #0x2b0]
000b84b2  ldr     r1, [pc, #0x218]
000b84b4  str     r4, [sp, #0xe4]
000b84b6  str     r5, [sp, #0xe0]
000b84b8  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b84ba  str     r6, [sp, #0x60]
000b84bc  ldr.w   sl, [r1]
000b84c0  ldr     r1, [pc, #0x20c]
000b84c2  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b84c4  ldr.w   fp, [r1]
000b84c8  ldr     r1, [pc, #0x208]
000b84ca  add     r1, pc ; -> 0x000fd600  
000b84cc  ldr     r1, [r1]
000b84ce  str     r1, [sp, #0x168]
000b84d0  ldr     r1, [pc, #0x204]
000b84d2  add     r1, pc ; -> 0x000fd354  
000b84d4  ldr     r1, [r1]
000b84d6  str     r1, [sp, #0x16c]
000b84d8  ldr     r1, [pc, #0x200]
000b84da  add     r1, pc ; -> 0x000fd358  
000b84dc  ldr     r1, [r1]
000b84de  str     r1, [sp, #0x170]
000b84e0  ldr     r1, [pc, #0x1fc]
000b84e2  add     r1, pc ; -> 0x000fd6d4  
000b84e4  ldr     r1, [r1]
000b84e6  str.w   r1, [sp, #0x408]
000b84ea  b       #0xb86e8
000b84ec  str     r6, [r5, r4]
000b84ee  movs    r4, r0
000b84f0  str     r4, [r4, #0x1c]
000b84f2  movs    r4, r0
000b84f4  ldrh    r6, [r3]
000b84f6  movs    r4, r1
000b84f8  str     r6, [r5, r3]
000b84fa  movs    r4, r0
000b84fc  ldr     r7, [pc, #0x318]
000b84fe  movs    r4, r0
000b8500  str     r4, [r4, #0x2c]
000b8502  movs    r4, r0
000b8504  ldr     r4, [r0, r5]
000b8506  movs    r4, r0
000b8508  str     r6, [r6, r1]
000b850a  movs    r4, r0
000b850c  ldr     r6, [r3, r4]
000b850e  movs    r4, r0
000b8510  strh    r4, [r7, #0x3c]
000b8512  movs    r4, r1
000b8514  ldr     r7, [pc, #0x220]
000b8516  movs    r4, r0
000b8518  ldr     r2, [r7, r2]
000b851a  movs    r4, r0
000b851c  ldr     r0, [r7, #0x4c]
000b851e  movs    r4, r1
000b8520  ldr     r4, [r2, r2]
000b8522  movs    r4, r0
000b8524  ldr     r4, [r5, #4]
000b8526  movs    r4, r1
000b8528  strb    r0, [r6, #0x17]
000b852a  movs    r4, r1
000b852c  ldr     r0, [r4, r1]
000b852e  movs    r4, r0
000b8530  ldr     r0, [r7]
000b8532  movs    r4, r1
000b8534  strb    r6, [r5, #0x16]
000b8536  movs    r4, r1
000b8538  ldr     r6, [r5, r0]
000b853a  movs    r4, r0
000b853c  ldr     r6, [r0]
000b853e  movs    r4, r1
000b8540  strh    r4, [r1, #0x36]
000b8542  movs    r4, r1
000b8544  ldrsb   r4, [r7, r7]
000b8546  movs    r4, r0
000b8548  str     r4, [r2, #0x7c]
000b854a  movs    r4, r1
000b854c  strh    r2, [r5, #0x34]
000b854e  movs    r4, r1
000b8550  ldrsb   r2, [r1, r7]
000b8552  movs    r4, r0
000b8554  str     r2, [r4, #0x78]
000b8556  movs    r4, r1
000b8558  str     r2, [r3, #8]
000b855a  movs    r4, r0
000b855c  ldr     r6, [pc, #0x68]
000b855e  movs    r4, r0
000b8560  ldr     r7, [pc, #0x168]
000b8562  movs    r4, r0
000b8564  strh    r4, [r4, #0x32]
000b8566  movs    r4, r1
000b8568  strh    r0, [r4, #0x32]
000b856a  movs    r4, r1
000b856c  strh    r0, [r4, #0x32]
000b856e  movs    r4, r1
000b8570  strh    r0, [r4, #0x32]
000b8572  movs    r4, r1
000b8574  strh    r0, [r4, #0x32]
000b8576  movs    r4, r1
000b8578  str     r0, [r1, r2]
000b857a  movs    r4, r0
000b857c  strh    r6, [r2, #0x32]
000b857e  movs    r4, r1
000b8580  cmp     ip, r7
000b8582  movs    r5, r5
000b8584  ldrsb   r6, [r0, r5]
000b8586  movs    r4, r0
000b8588  add     sl, r7
000b858a  movs    r5, r5
000b858c  ldrh    r0, [r5, r2]
000b858e  movs    r4, r0
000b8590  cmp     r7, pc
000b8592  movs    r5, r5
000b8594  cmp     r2, ip
000b8596  movs    r5, r5
000b8598  ldrsb   r4, [r6, r7]
000b859a  movs    r4, r0
000b859c  ldrsb   r2, [r6, r4]
000b859e  movs    r4, r0
000b85a0  cmp     r6, r8
000b85a2  movs    r5, r5
000b85a4  ldrsb   r0, [r3, r7]
000b85a6  movs    r4, r0
000b85a8  ldrsb   r6, [r2, r4]
000b85aa  movs    r4, r0
000b85ac  cmp     r6, r3
000b85ae  movs    r5, r5
000b85b0  ldrsb   r4, [r6, r1]
000b85b2  movs    r4, r0
000b85b4  strh    r0, [r2, #0x28]
000b85b6  movs    r4, r1
000b85b8  strb    r0, [r0, r6]
000b85ba  movs    r4, r0
000b85bc  strb    r4, [r5, r5]
000b85be  movs    r4, r0
000b85c0  strb    r0, [r6, r5]
000b85c2  movs    r4, r0
000b85c4  ldr     r5, [pc, #0x328]
000b85c6  movs    r4, r0
000b85c8  strh    r4, [r7, r6]
000b85ca  movs    r4, r0
000b85cc  str     r2, [r1, r0]
000b85ce  movs    r4, r0
000b85d0  ldrsb   r0, [r5, r5]
000b85d2  movs    r4, r0
000b85d4  strb    r6, [r5, r4]
000b85d6  movs    r4, r0
000b85d8  strb    r0, [r4, r4]
000b85da  movs    r4, r0
000b85dc  ldr     r6, [r1, r3]
000b85de  movs    r4, r0
000b85e0  strb    r2, [r0, #0x12]
000b85e2  movs    r4, r1
000b85e4  orrs    r4, r6
000b85e6  movs    r5, r5
000b85e8  rsbs    r6, r0, #0
000b85ea  movs    r5, r5
000b85ec  cmn     r2, r7
000b85ee  movs    r5, r5
000b85f0  strb    r6, [r3, r0]
000b85f2  movs    r4, r0
000b85f4  cmn     r1, r4
000b85f6  movs    r5, r5
000b85f8  rors    r4, r6
000b85fa  movs    r5, r5
000b85fc  ldrsb   r2, [r4, r7]
000b85fe  movs    r4, r0
000b8600  ldrb    r2, [r6, r2]
000b8602  movs    r4, r0
000b8604  str     r6, [r4, #0x38]
000b8606  movs    r4, r1
000b8608  ldr     r2, [pc, #0xc0]
000b860a  movs    r4, r0
000b860c  ldr     r3, [pc, #0x1c0]
000b860e  movs    r4, r0
000b8610  strh    r2, [r7, #0x12]
000b8612  movs    r4, r1
000b8614  strh    r6, [r6, #0x12]
000b8616  movs    r4, r1
000b8618  str     r4, [r6, #0x60]
000b861a  movs    r4, r1
000b861c  strh    r6, [r4, #0x12]
000b861e  movs    r4, r1
000b8620  strh    r4, [r4, #0x12]
000b8622  movs    r4, r1
000b8624  strh    r4, [r4, #0x12]
000b8626  movs    r4, r1
000b8628  rors    r0, r4
000b862a  movs    r5, r5
000b862c  strb    r2, [r6, r1]
000b862e  movs    r4, r0
000b8630  strh    r6, [r5, r6]
000b8632  movs    r4, r0
000b8634  lsrs    r6, r4
000b8636  movs    r5, r5
000b8638  ldrsb   r4, [r2, r3]
000b863a  movs    r4, r0
000b863c  strh    r2, [r0, #0x12]
000b863e  movs    r4, r1
000b8640  strh    r2, [r4, r2]
000b8642  movs    r4, r0
000b8644  strh    r6, [r1, r2]
000b8646  movs    r4, r0
000b8648  strh    r0, [r2, r2]
000b864a  movs    r4, r0
000b864c  ldr     r2, [pc, #0x3a8]
000b864e  movs    r4, r0
000b8650  str     r4, [r3, r3]
000b8652  movs    r4, r0
000b8654  ldr     r2, [pc, #0x138]
000b8656  movs    r4, r0
000b8658  strh    r0, [r3, r3]
000b865a  movs    r4, r0
000b865c  strb    r2, [r0, r2]
000b865e  movs    r4, r0
000b8660  strh    r4, [r0, r1]
000b8662  movs    r4, r0
000b8664  strh    r4, [r6, r0]
000b8666  movs    r4, r0
000b8668  subs    r7, #0xf6
000b866a  movs    r5, r5
000b866c  strb    r4, [r0, #2]
000b866e  movs    r4, r1
000b8670  strh    r0, [r0, #8]
000b8672  movs    r4, r1
000b8674  strh    r6, [r5, #6]
000b8676  movs    r4, r1
000b8678  strh    r2, [r0, #2]
000b867a  movs    r4, r1
000b867c  subs    r7, #0x86
000b867e  movs    r5, r5
000b8680  subs    r6, #0xe2
000b8682  movs    r5, r5
000b8684  subs    r6, #0xc8
000b8686  movs    r5, r5
000b8688  strh    r2, [r0, r1]
000b868a  movs    r4, r0
000b868c  ldrb    r6, [r3, #0x1e]
000b868e  movs    r4, r1
000b8690  strh    r4, [r5, r0]
000b8692  movs    r4, r0
000b8694  str     r6, [r4, r1]
000b8696  movs    r4, r0
000b8698  ldr     r7, [pc, #0x388]
000b869a  movs    r4, r0
000b869c  subs    r6, #0x24
000b869e  movs    r5, r5
000b86a0  ldrb    r0, [r4, #0x1b]
000b86a2  movs    r4, r1
000b86a4  ldr     r7, [pc, #0x130]
000b86a6  movs    r4, r0
000b86a8  subs    r5, #0x90
000b86aa  movs    r5, r5
000b86ac  ldr     r7, [pc, #0xa8]
000b86ae  movs    r4, r0
000b86b0  ldr     r7, [pc, #0x50]
000b86b2  movs    r4, r0
000b86b4  mov     r4, r8
000b86b6  movs    r4, r0
000b86b8  ldr     r1, [pc, #0x3e8]
000b86ba  movs    r4, r0
000b86bc  subs    r2, #0x9a
000b86be  movs    r5, r5
000b86c0  ldrb    r0, [r6, #0xd]
000b86c2  movs    r4, r1
000b86c4  ldrb    r2, [r5, #0xd]
000b86c6  movs    r4, r1
000b86c8  subs    r1, #0x76
000b86ca  movs    r5, r5
000b86cc  mov     r4, r6
000b86ce  movs    r4, r0
000b86d0  mov     r2, r4
000b86d2  movs    r4, r0
000b86d4  str     r2, [r6, r4]
000b86d6  movs    r4, r0
000b86d8  ldr     r6, [pc, #0x1f8]
000b86da  movs    r4, r0
000b86dc  ldr     r6, [pc, #0x1e8]
000b86de  movs    r4, r0
000b86e0  str     r6, [r5, r7]
000b86e2  movs    r4, r0
000b86e4  ldr.w   r3, [sp, #0xa7c]
000b86e8  mov.w   r8, #0
000b86ec  b       #0xb86f2
000b86ee  ldr.w   r3, [sp, #0xa7c]
000b86f2  ldr     r3, [r3]
000b86f4  ldr     r1, [sp, #0x2b0]
000b86f6  cmp     r3, r1
000b86f8  beq     #0xb8706
000b86fa  ldr     r1, [sp, #0x160]
000b86fc  ldr     r0, [sp, #0x15c]
000b86fe  blx     #0xddbfc ; -> objc_msgSend
000b8702  blx     #0xddbe4 ; -> objc_enumerationMutation
000b8706  ldr.w   r0, [sp, #0xa78]
000b870a  ldr     r4, [sp, #0x50]
000b870c  ldr     r1, [sp, #0x158]
000b870e  ldr.w   r5, [r0, r8, lsl #2]
000b8712  add     r4, pc
000b8714  add.w   r8, r8, #1
000b8718  ldr     r0, [r4]
000b871a  blx     #0xddbfc ; -> objc_msgSend
000b871e  mov     r2, r5
000b8720  mov     r1, sl
000b8722  blx     #0xddbfc ; -> objc_msgSend
000b8726  mov     r1, fp
000b8728  mov     r6, r0
000b872a  mov     r0, r5
000b872c  blx     #0xddbfc ; -> objc_msgSend
000b8730  ldr     r1, [sp, #0x168]
000b8732  mov     r2, r0
000b8734  ldr     r0, [r4]
000b8736  blx     #0xddbfc ; -> objc_msgSend
000b873a  ldr     r2, [sp, #0xe4]
000b873c  mov     r1, sl
000b873e  mov     r0, r6
000b8740  add     r2, pc
000b8742  blx     #0xddbfc ; -> objc_msgSend
000b8746  ldr     r1, [sp, #0x16c]
000b8748  mov     r2, r0
000b874a  ldr     r0, [r4]
000b874c  blx     #0xddbfc ; -> objc_msgSend
000b8750  ldr     r2, [sp, #0xe0]
000b8752  mov     r1, sl
000b8754  mov     r0, r6
000b8756  add     r2, pc
000b8758  blx     #0xddbfc ; -> objc_msgSend
000b875c  ldr     r1, [sp, #0x170]
000b875e  mov     r2, r0
000b8760  ldr     r0, [r4]
000b8762  blx     #0xddbfc ; -> objc_msgSend
000b8766  ldr     r0, [sp, #0x60]
000b8768  mov     r1, fp
000b876a  add     r0, pc
000b876c  ldr     r4, [r0]
000b876e  mov     r0, r5
000b8770  blx     #0xddbfc ; -> objc_msgSend
000b8774  movs    r2, #0x25
000b8776  ldr.w   r1, [sp, #0x408]
000b877a  mov     r3, r0
000b877c  mov     r0, r4
000b877e  blx     #0xddbfc ; -> objc_msgSend
000b8782  ldr     r2, [sp, #0x2ac]
000b8784  cmp     r2, r8
000b8786  bhi     #0xb86ee
000b8788  movs    r3, #0x10
000b878a  add.w   r2, sp, #0xa60
000b878e  str     r3, [sp]
000b8790  add.w   r3, sp, #0x770
000b8794  ldr     r0, [sp, #0x164]
000b8796  ldr     r1, [sp, #0x118]
000b8798  adds    r2, #0x14
000b879a  adds    r3, #4
000b879c  blx     #0xddbfc ; -> objc_msgSend
000b87a0  str     r0, [sp, #0x2ac]
000b87a2  cmp     r0, #0
000b87a4  bne     #0xb86e4
000b87a6  ldr.w   r0, [pc, #0x4bc]
000b87aa  ldr     r1, [sp, #0x158]
000b87ac  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b87ae  ldr     r0, [r0]
000b87b0  blx     #0xddbfc ; -> objc_msgSend
000b87b4  ldr.w   r1, [pc, #0x4b0]
000b87b8  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000b87ba  ldr     r1, [r1]
000b87bc  blx     #0xddbfc ; -> objc_msgSend
000b87c0  b       #0xb87da
000b87c2  ldr.w   r0, [pc, #0x4a8]
000b87c6  ldr.w   r1, [pc, #0x4a8]
000b87ca  movs    r2, #0x25
000b87cc  add     r0, pc ; -> 0x0038c0e4  mtxController
000b87ce  add     r1, pc ; -> 0x000fd6d4  
000b87d0  ldr     r0, [r0]
000b87d2  ldr     r1, [r1]
000b87d4  ldr     r3, [sp, #0xfc]
000b87d6  blx     #0xddbfc ; -> objc_msgSend
000b87da  ldr.w   r3, [pc, #0x498]
000b87de  movs    r2, #0
000b87e0  add     r3, pc ; -> 0x0038c1b4  gettingLeaderboard
000b87e2  strb    r2, [r3]
000b87e4  b.w     #0xbad8a
000b87e8  ldr.w   r0, [pc, #0x48c]
000b87ec  ldr.w   r1, [pc, #0x48c]
000b87f0  add     r0, pc ; -> 0x000fdb44  
000b87f2  add     r1, pc ; -> 0x000fcdec  '(5\x0e'
000b87f4  ldr     r5, [r0]
000b87f6  ldr     r4, [r1]
000b87f8  ldr.w   r0, [pc, #0x484]
000b87fc  ldr.w   r1, [pc, #0x484]
000b8800  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b8802  add     r1, pc ; -> 0x000fd37c  
000b8804  ldr     r0, [r0]
000b8806  ldr     r1, [r1]
000b8808  blx     #0xddbfc ; -> objc_msgSend
000b880c  ldr.w   r3, [pc, #0x478]
000b8810  mov     r1, r4
000b8812  add     r3, pc ; -> 0x001802d4  
000b8814  mov     r2, r0
000b8816  mov     r0, r5
000b8818  blx     #0xddbfc ; -> objc_msgSend
000b881c  mov     r2, r0
000b881e  movs    r0, #0x42
000b8820  b       #0xb8b20
000b8822  ldr.w   r2, [pc, #0x468]
000b8826  mov     r1, r8
000b8828  movs    r3, #0
000b882a  add     r2, pc ; -> 0x001802e4  
000b882c  mov     r0, r6
000b882e  blx     #0xddbfc ; -> objc_msgSend
000b8832  ldr.w   r3, [pc, #0x45c]
000b8836  add.w   r4, sp, #0x738
000b883a  subs    r4, #4
000b883c  add     r3, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b883e  add.w   r2, sp, #0xa40
000b8842  str     r3, [sp, #0x2b4]
000b8844  movs    r3, #0
000b8846  ldr     r1, [sp, #0x118]
000b8848  str.w   r3, [sp, #0xa54]
000b884c  str.w   r3, [sp, #0xa58]
000b8850  str.w   r3, [sp, #0xa5c]
000b8854  str.w   r3, [sp, #0xa60]
000b8858  str.w   r3, [sp, #0xa64]
000b885c  str.w   r3, [sp, #0xa68]
000b8860  str.w   r3, [sp, #0xa6c]
000b8864  str.w   r3, [sp, #0xa70]
000b8868  adds    r2, #0x14
000b886a  adds    r3, #0x10
000b886c  str     r3, [sp]
000b886e  mov     r3, r4
000b8870  str     r4, [sp, #0x5c]
000b8872  str     r0, [sp, #0x3ec]
000b8874  blx     #0xddbfc ; -> objc_msgSend
000b8878  cmp     r0, #0
000b887a  beq.w   #0xb89ae
000b887e  ldr.w   r1, [pc, #0x414]
000b8882  ldr.w   r3, [sp, #0xa5c]
000b8886  add     r1, pc ; -> 0x000fd304  
000b8888  ldr.w   fp, [r1]
000b888c  ldr.w   r1, [pc, #0x408]
000b8890  ldr     r5, [r3]
000b8892  str     r0, [sp, #0x2b8]
000b8894  add     r1, pc ; -> 0x000fd300  
000b8896  ldr     r6, [r1]
000b8898  ldr.w   r1, [pc, #0x400]
000b889c  str     r5, [sp, #0x2bc]
000b889e  add     r1, pc ; -> 0x000fd30c  
000b88a0  ldr.w   sl, [r1]
000b88a4  ldr     r1, [pc, #0x3f8]
000b88a6  add     r1, pc ; -> 0x000fcb70  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1f8
000b88a8  ldr.w   r8, [r1]
000b88ac  ldr     r1, [pc, #0x3f4]
000b88ae  add     r1, pc ; -> 0x000fd16c  
000b88b0  ldr     r1, [r1]
000b88b2  str     r1, [sp, #0x37c]
000b88b4  ldr     r1, [pc, #0x3f0]
000b88b6  add     r1, pc ; -> 0x000fd2f0  
000b88b8  ldr     r1, [r1]
000b88ba  str     r1, [sp, #0x174]
000b88bc  b       #0xb88c2
000b88be  ldr.w   r3, [sp, #0xa5c]
000b88c2  movs    r1, #0
000b88c4  str     r1, [sp, #0x358]
000b88c6  b       #0xb88cc
000b88c8  ldr.w   r3, [sp, #0xa5c]
000b88cc  ldr     r3, [r3]
000b88ce  ldr     r2, [sp, #0x2bc]
000b88d0  cmp     r3, r2
000b88d2  beq     #0xb88da
000b88d4  ldr     r0, [sp, #0x3ec]
000b88d6  blx     #0xddbe4 ; -> objc_enumerationMutation
000b88da  ldr.w   r0, [sp, #0xa58]
000b88de  ldr     r3, [sp, #0x358]
000b88e0  movs    r5, #0
000b88e2  ldr.w   r4, [r0, r3, lsl #2]
000b88e6  b       #0xb897c
000b88e8  mov     r1, r6
000b88ea  mov     r0, r4
000b88ec  mov     r2, r5
000b88ee  blx     #0xddbfc ; -> objc_msgSend
000b88f2  mov     r1, sl
000b88f4  blx     #0xddbfc ; -> objc_msgSend
000b88f8  cmp     r0, #0
000b88fa  beq     #0xb897a
000b88fc  mov     r1, r6
000b88fe  mov     r0, r4
000b8900  mov     r2, r5
000b8902  blx     #0xddbfc ; -> objc_msgSend
000b8906  mov     r1, r8
000b8908  blx     #0xddbfc ; -> objc_msgSend
000b890c  cmp     r0, #0
000b890e  beq     #0xb897a
000b8910  mov     r2, r5
000b8912  mov     r1, r6
000b8914  mov     r0, r4
000b8916  blx     #0xddbfc ; -> objc_msgSend
000b891a  mov     r1, r8
000b891c  blx     #0xddbfc ; -> objc_msgSend
000b8920  ldr     r2, [pc, #0x388]
000b8922  ldr     r1, [sp, #0x37c]
000b8924  add     r2, pc ; -> 0x0017f0f4  
000b8926  blx     #0xddbfc ; -> objc_msgSend
000b892a  cbnz    r0, #0xb894a
000b892c  mov     r2, r5
000b892e  mov     r1, r6
000b8930  mov     r0, r4
000b8932  blx     #0xddbfc ; -> objc_msgSend
000b8936  mov     r1, sl
000b8938  blx     #0xddbfc ; -> objc_msgSend
000b893c  ldr     r1, [sp, #0x174]
000b893e  mov     r2, r0
000b8940  ldr     r0, [pc, #0x36c]
000b8942  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b8944  ldr     r0, [r0]
000b8946  blx     #0xddbfc ; -> objc_msgSend
000b894a  mov     r2, r5
000b894c  mov     r1, r6
000b894e  mov     r0, r4
000b8950  blx     #0xddbfc ; -> objc_msgSend
000b8954  mov     r1, r8
000b8956  blx     #0xddbfc ; -> objc_msgSend
000b895a  ldr.w   r2, [pc, #0x358]
000b895e  ldr     r1, [sp, #0x37c]
000b8960  add     r2, pc ; -> 0x0017f104  
000b8962  blx     #0xddbfc ; -> objc_msgSend
000b8966  cbnz    r0, #0xb897a
000b8968  mov     r1, r6
000b896a  mov     r2, r5
000b896c  mov     r0, r4
000b896e  blx     #0xddbfc ; -> objc_msgSend
000b8972  mov     r1, sl
000b8974  blx     #0xddbfc ; -> objc_msgSend
000b8978  str     r0, [sp, #0x2b4]
000b897a  adds    r5, #1
000b897c  mov     r0, r4
000b897e  mov     r1, fp
000b8980  blx     #0xddbfc ; -> objc_msgSend
000b8984  cmp     r5, r0
000b8986  blo     #0xb88e8
000b8988  ldr     r4, [sp, #0x358]
000b898a  ldr     r5, [sp, #0x2b8]
000b898c  adds    r4, #1
000b898e  cmp     r5, r4
000b8990  str     r4, [sp, #0x358]
000b8992  bhi     #0xb88c8
000b8994  add.w   r2, sp, #0xa40
000b8998  movs    r3, #0x10
000b899a  ldr     r0, [sp, #0x3ec]
000b899c  str     r3, [sp]
000b899e  ldr     r1, [sp, #0x118]
000b89a0  adds    r2, #0x14
000b89a2  ldr     r3, [sp, #0x5c]
000b89a4  blx     #0xddbfc ; -> objc_msgSend
000b89a8  str     r0, [sp, #0x2b8]
000b89aa  cmp     r0, #0
000b89ac  bne     #0xb88be
000b89ae  ldr     r0, [sp, #0x2b4]
000b89b0  ldr     r1, [sp, #0x10c]
000b89b2  blx     #0xddbfc ; -> objc_msgSend
000b89b6  cmp     r0, #8
000b89b8  bls     #0xb8ab2
000b89ba  ldr     r1, [pc, #0x2fc]
000b89bc  add     r4, sp, #0x178
000b89be  movs    r6, #0
000b89c0  add     r1, pc ; -> 0x000fcdc0  '$]\x0e'
000b89c2  str     r6, [sp, #0x178]
000b89c4  ldr     r5, [r1]
000b89c6  ldr     r0, [sp, #0x2b4]
000b89c8  movs    r1, #1
000b89ca  str     r1, [sp, #0x17c]
000b89cc  mov     r1, r5
000b89ce  ldm.w   r4, {r2, r3}
000b89d2  blx     #0xddbfc ; -> objc_msgSend
000b89d6  ldr     r1, [pc, #0x2e4]
000b89d8  adds    r6, #2
000b89da  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b89dc  ldr     r4, [r1]
000b89de  mov     r1, r4
000b89e0  blx     #0xddbfc ; -> objc_msgSend
000b89e4  ldr     r1, [sp, #0x17c]
000b89e6  str     r6, [sp, #0x180]
000b89e8  add     r6, sp, #0x180
000b89ea  str     r1, [sp, #0x184]
000b89ec  mov     r1, r5
000b89ee  ldm.w   r6, {r2, r3}
000b89f2  add     r6, sp, #0x188
000b89f4  mov     sl, r0
000b89f6  ldr     r0, [sp, #0x2b4]
000b89f8  blx     #0xddbfc ; -> objc_msgSend
000b89fc  mov     r1, r4
000b89fe  blx     #0xddbfc ; -> objc_msgSend
000b8a02  movs    r1, #4
000b8a04  movs    r2, #2
000b8a06  str     r1, [sp, #0x188]
000b8a08  mov     r1, r5
000b8a0a  str     r2, [sp, #0x18c]
000b8a0c  ldm.w   r6, {r2, r3}
000b8a10  mov     r8, r0
000b8a12  ldr     r0, [sp, #0x2b4]
000b8a14  blx     #0xddbfc ; -> objc_msgSend
000b8a18  mov     r1, r4
000b8a1a  blx     #0xddbfc ; -> objc_msgSend
000b8a1e  ldr     r2, [sp, #0x18c]
000b8a20  movs    r1, #7
000b8a22  str     r1, [sp, #0x190]
000b8a24  mov     r1, r5
000b8a26  add     r5, sp, #0x190
000b8a28  str     r2, [sp, #0x194]
000b8a2a  ldm.w   r5, {r2, r3}
000b8a2e  mov     r6, r0
000b8a30  ldr     r0, [sp, #0x2b4]
000b8a32  blx     #0xddbfc ; -> objc_msgSend
000b8a36  mov     r1, r4
000b8a38  blx     #0xddbfc ; -> objc_msgSend
000b8a3c  lsl.w   r2, r8, #4
000b8a40  lsl.w   r3, r8, #8
000b8a44  subs    r3, r3, r2
000b8a46  ldr.w   r1, [pc, #0x278]
000b8a4a  lsls    r2, r3, #4
000b8a4c  subs    r2, r2, r3
000b8a4e  ldr     r3, [pc, #0x274]
000b8a50  add     r1, pc ; -> 0x000fd2ec  
000b8a52  ldr     r5, [r1]
000b8a54  mla     r3, sl, r3, r2
000b8a58  ldr     r1, [pc, #0x26c]
000b8a5a  add     r1, pc ; -> 0x000fc9b8  '~\x07\x0e'
000b8a5c  ldr     r1, [r1]
000b8a5e  add.w   r2, r3, r0
000b8a62  lsls    r3, r6, #2
000b8a64  lsls    r0, r6, #6
000b8a66  subs    r0, r0, r3
000b8a68  add     r0, r2
000b8a6a  vmov    s12, r0
000b8a6e  vcvt.f64.s32 d7, s12
000b8a72  vldr    d6, [pc, #0x1e8]
000b8a76  ldr     r0, [pc, #0x254]
000b8a78  ldr     r3, [pc, #0x254]
000b8a7a  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b8a7c  add     r3, pc ; -> 0x000fd33c  
000b8a7e  vcmpe.f64 d7, d6
000b8a82  ldr     r4, [r0]
000b8a84  ldr     r0, [pc, #0x24c]
000b8a86  ldr     r3, [r3]
000b8a88  vmrs    apsr_nzcv, fpscr
000b8a8c  it      gt
000b8a8e  vsubgt.f64 d7, d7, d6
000b8a92  add     r0, pc ; -> 0x000fdb58  
000b8a94  str     r3, [sp, #4]
000b8a96  ldr     r0, [r0]
000b8a98  movs    r3, #0
000b8a9a  str     r3, [sp, #8]
000b8a9c  str     r3, [sp, #0xc]
000b8a9e  str     r4, [sp]
000b8aa0  vmov    r2, r3, d7
000b8aa4  blx     #0xddbfc ; -> objc_msgSend
000b8aa8  mov     r1, r5
000b8aaa  mov     r2, r0
000b8aac  mov     r0, r4
000b8aae  blx     #0xddbfc ; -> objc_msgSend
000b8ab2  ldr.w   r8, [pc, #0x224]
000b8ab6  ldr     r1, [pc, #0x224]
000b8ab8  add     r8, pc ; -> 0x0038c1b0  mSocialInfo
000b8aba  add     r1, pc ; -> 0x000fd278  
000b8abc  ldr.w   r0, [r8]
000b8ac0  ldr     r1, [r1]
000b8ac2  blx     #0xddbfc ; -> objc_msgSend
000b8ac6  tst.w   r0, #0xff
000b8aca  bne.w   #0xbad8a
000b8ace  ldr     r3, [pc, #0x210]
000b8ad0  add     r3, pc ; -> 0x0038c1b9  isLoggingOut
000b8ad2  ldrsb.w r3, [r3]
000b8ad6  cmp     r3, #0
000b8ad8  bne.w   #0xbad8a
000b8adc  ldr     r1, [pc, #0x204]
000b8ade  ldr.w   r0, [r8]
000b8ae2  add     r1, pc ; -> 0x000fd52c  
000b8ae4  ldr     r4, [r1]
000b8ae6  mov     r1, r4
000b8ae8  blx     #0xddbfc ; -> objc_msgSend
000b8aec  cmp     r0, #0
000b8aee  beq.w   #0xbad8a
000b8af2  ldr.w   r0, [pc, #0x1f4]
000b8af6  ldr.w   r1, [pc, #0x1f4]
000b8afa  add     r0, pc ; -> 0x000fdb44  
000b8afc  add     r1, pc ; -> 0x000fcdec  '(5\x0e'
000b8afe  ldr     r6, [r0]
000b8b00  ldr     r5, [r1]
000b8b02  ldr.w   r0, [r8]
000b8b06  mov     r1, r4
000b8b08  blx     #0xddbfc ; -> objc_msgSend
000b8b0c  ldr.w   r3, [pc, #0x1e0]
000b8b10  mov     r1, r5
000b8b12  add     r3, pc ; -> 0x001802f4  
000b8b14  mov     r2, r0
000b8b16  mov     r0, r6
000b8b18  blx     #0xddbfc ; -> objc_msgSend
000b8b1c  mov     r2, r0
000b8b1e  movs    r0, #0x38
000b8b20  ldr     r1, [sp, #0xfc]
000b8b22  b.w     #0xbad86
000b8b26  ldr     r0, [pc, #0x1cc]
000b8b28  ldr     r1, [sp, #0x110]
000b8b2a  add     r0, pc ; -> 0x000fdbf4  
000b8b2c  ldr     r0, [r0]
000b8b2e  blx     #0xddbfc ; -> objc_msgSend
000b8b32  ldr     r1, [pc, #0x1c4]
000b8b34  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b8b36  ldr     r1, [r1]
000b8b38  blx     #0xddbfc ; -> objc_msgSend
000b8b3c  ldr.w   r2, [pc, #0x1bc]
000b8b40  mov     r1, r8
000b8b42  movs    r3, #0
000b8b44  add     r2, pc ; -> 0x00180304  
000b8b46  str     r0, [sp, #0x198]
000b8b48  mov     r0, r6
000b8b4a  blx     #0xddbfc ; -> objc_msgSend
000b8b4e  ldr     r1, [pc, #0x1b0]
000b8b50  add.w   r2, sp, #0xa20
000b8b54  adds    r2, #0x14
000b8b56  movs    r3, #0
000b8b58  str     r2, [sp, #0x90]
000b8b5a  add     r1, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b8b5c  str.w   r1, [sp, #0x444]
000b8b60  str.w   r3, [sp, #0xa3c]
000b8b64  str.w   r3, [sp, #0xa40]
000b8b68  str.w   r3, [sp, #0xa44]
000b8b6c  str.w   r3, [sp, #0xa48]
000b8b70  str.w   r3, [sp, #0xa4c]
000b8b74  str.w   r3, [sp, #0xa50]
000b8b78  str     r0, [sp, #0x3f0]
000b8b7a  str     r3, [r2]
000b8b7c  add.w   r2, sp, #0xa20
000b8b80  adds    r2, #0x18
000b8b82  str     r3, [r2]
000b8b84  add.w   r3, sp, #0x6f8
000b8b88  subs    r3, #4
000b8b8a  add.w   r2, sp, #0xa20
000b8b8e  str     r3, [sp, #0x68]
000b8b90  adds    r2, #0x14
000b8b92  movs    r3, #0x10
000b8b94  ldr     r0, [sp, #0x3f0]
000b8b96  str     r3, [sp]
000b8b98  ldr     r1, [sp, #0x118]
000b8b9a  ldr     r3, [sp, #0x68]
000b8b9c  blx     #0xddbfc ; -> objc_msgSend
000b8ba0  mov     r2, r0
000b8ba2  cbnz    r0, #0xb8bac
000b8ba4  ldr.w   r4, [sp, #0x444]
000b8ba8  str     r4, [sp, #0x2d0]
000b8baa  b       #0xb8eb4
000b8bac  ldr     r1, [pc, #0x154]
000b8bae  ldr.w   r3, [sp, #0xa3c]
000b8bb2  ldr     r0, [pc, #0x154]
000b8bb4  add     r1, pc ; -> 0x000fd304  
000b8bb6  ldr.w   r6, [sp, #0x444]
000b8bba  ldr     r1, [r1]
000b8bbc  ldr     r5, [r3]
000b8bbe  add     r0, pc ; -> 0x000fdc14  
000b8bc0  str     r2, [sp, #0x2d4]
000b8bc2  str     r1, [sp, #0x3cc]
000b8bc4  ldr     r1, [pc, #0x144]
000b8bc6  ldr     r0, [r0]
000b8bc8  ldr.w   r2, [pc, #0x144]
000b8bcc  add     r1, pc ; -> 0x000fd300  
000b8bce  ldr.w   r4, [pc, #0x144]
000b8bd2  ldr.w   r8, [r1]
000b8bd6  ldr     r1, [pc, #0x140]
000b8bd8  str     r0, [sp, #0x1a8]
000b8bda  ldr     r0, [pc, #0x140]
000b8bdc  add     r1, pc ; -> 0x000fd30c  
000b8bde  str     r5, [sp, #0x2d8]
000b8be0  ldr.w   fp, [r1]
000b8be4  ldr     r1, [pc, #0x138]
000b8be6  add     r0, pc ; -> 0x000fdb44  
000b8be8  str     r6, [sp, #0x2c8]
000b8bea  add     r1, pc ; -> 0x000fcb70  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1f8
000b8bec  ldr     r0, [r0]
000b8bee  ldr     r1, [r1]
000b8bf0  str     r6, [sp, #0x2c4]
000b8bf2  str     r6, [sp, #0x2d0]
000b8bf4  str     r0, [sp, #0x1a0]
000b8bf6  str     r1, [sp, #0x38c]
000b8bf8  ldr     r1, [pc, #0x128]
000b8bfa  str     r2, [sp, #0x6c]
000b8bfc  str     r4, [sp, #0x48]
000b8bfe  add     r1, pc ; -> 0x000fd16c  
000b8c00  ldr.w   sl, [r1]
000b8c04  ldr     r1, [pc, #0x120]
000b8c06  add     r1, pc ; -> 0x000fd2e8  
000b8c08  ldr     r1, [r1]
000b8c0a  str     r1, [sp, #0x19c]
000b8c0c  ldr     r1, [pc, #0x11c]
000b8c0e  add     r1, pc ; -> 0x000fcf5c  
000b8c10  ldr     r1, [r1]
000b8c12  str     r1, [sp, #0x1a4]
000b8c14  ldr     r1, [pc, #0x118]
000b8c16  add     r1, pc ; -> 0x000fcf60  
000b8c18  ldr     r1, [r1]
000b8c1a  str     r1, [sp, #0x1ac]
000b8c1c  ldr     r1, [pc, #0x114]
000b8c1e  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b8c20  ldr     r1, [r1]
000b8c22  str.w   r1, [sp, #0x414]
000b8c26  ldr     r1, [pc, #0x110]
000b8c28  str     r1, [sp, #0x80]
000b8c2a  b       #0xb8c30
000b8c2c  ldr.w   r3, [sp, #0xa3c]
000b8c30  movs    r5, #0
000b8c32  str     r5, [sp, #0x35c]
000b8c34  b       #0xb8c3a
000b8c36  ldr.w   r3, [sp, #0xa3c]
000b8c3a  ldr     r3, [r3]
000b8c3c  ldr     r6, [sp, #0x2d8]
000b8c3e  cmp     r3, r6
000b8c40  beq     #0xb8c48
000b8c42  ldr     r0, [sp, #0x3f0]
000b8c44  blx     #0xddbe4 ; -> objc_enumerationMutation
000b8c48  ldr     r1, [sp, #0x90]
000b8c4a  ldr     r2, [sp, #0x35c]
000b8c4c  ldr.w   r3, [sp, #0x444]
000b8c50  movs    r5, #0
000b8c52  ldr     r0, [r1, #4]
000b8c54  ldr.w   r4, [r0, r2, lsl #2]
000b8c58  str     r3, [sp, #0x2cc]
000b8c5a  b       #0xb8e2c
000b8c5c  movs    r0, r0
000b8c5e  movs    r0, r0
000b8c60  movs    r0, r0
000b8c62  eors    r6, r1
000b8c64  subs    r2, #0
000b8c66  movs    r5, r5
000b8c68  cmn     r0, r2
000b8c6a  movs    r4, r0
000b8c6c  subs    r1, #0x14
000b8c6e  movs    r5, r5
000b8c70  ldr     r7, [pc, #8]
000b8c72  movs    r4, r0
000b8c74  subs    r1, #0xd0
000b8c76  movs    r5, r5
000b8c78  strh    r0, [r2, r5]
000b8c7a  movs    r4, r0
000b8c7c  cmp     lr, lr
000b8c7e  movs    r4, r0
000b8c80  subs    r1, #0xac
000b8c82  movs    r5, r5
000b8c84  ldr     r3, [pc, #0x1d8]
000b8c86  movs    r4, r0
000b8c88  ldrb    r6, [r7, #0xa]
000b8c8a  movs    r4, r1
000b8c8c  ldrb    r6, [r6, #0xa]
000b8c8e  movs    r4, r1
000b8c90  ldrh    r4, [r6, r2]
000b8c92  movs    r4, r1
000b8c94  ldr     r2, [pc, #0x1e8]
000b8c96  movs    r4, r0
000b8c98  ldr     r2, [pc, #0x1a0]
000b8c9a  movs    r4, r0
000b8c9c  ldr     r2, [pc, #0x1a8]
000b8c9e  movs    r4, r0
000b8ca0  cmn     r6, r0
000b8ca2  movs    r4, r0
000b8ca4  ldr     r0, [pc, #0x2e8]
000b8ca6  movs    r4, r0
000b8ca8  ldr     r2, [pc, #0xd8]
000b8caa  movs    r4, r0
000b8cac  str     r4, [r1, #0x7c]
000b8cae  movs    r4, r1
000b8cb0  subs    r0, #0x6a
000b8cb2  movs    r5, r5
000b8cb4  str     r0, [r4, #0x78]
000b8cb6  movs    r4, r1
000b8cb8  mvns    r4, r7
000b8cba  movs    r4, r0
000b8cbc  asrs    r2, r1
000b8cbe  movs    r4, r0
000b8cc0  ldr     r0, [pc, #0x260]
000b8cc2  movs    r4, r0
000b8cc4  str     r0, [r0, r6]
000b8cc6  movs    r1, r0
000b8cc8  subs    r7, #0x5a
000b8cca  movs    r4, r0
000b8ccc  adds    r7, #0x32
000b8cce  movs    r5, r5
000b8cd0  ldr     r0, [pc, #0x2f0]
000b8cd2  movs    r4, r0
000b8cd4  str     r2, [r0, r3]
000b8cd6  movs    r4, r0
000b8cd8  adds    r6, #0xf4
000b8cda  movs    r5, r5
