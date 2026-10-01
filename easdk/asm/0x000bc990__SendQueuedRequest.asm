========================================================================
SendQueuedRequest  0x000bc990  2584 bytes   EAMTX_Main.mm
========================================================================

000bc990  push    {r4, r5, r6, r7, lr}
000bc992  add     r7, sp, #0xc
000bc994  push.w  {r8, sl, fp}
000bc998  sub     sp, #0x70
000bc99a  ldr.w   r1, [pc, #0x7e0]
000bc99e  ldr.w   r2, [pc, #0x7e0]
000bc9a2  str     r0, [sp, #4]
000bc9a4  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000bc9a6  add     r2, pc ; -> 0x001805e4  
000bc9a8  ldr     r1, [r1]
000bc9aa  ldr.w   r4, [pc, #0x7d8]
000bc9ae  str     r1, [sp, #8]
000bc9b0  blx     #0xddbfc ; -> objc_msgSend
000bc9b4  ldr.w   r1, [pc, #0x7d0]
000bc9b8  add     r4, pc ; -> 0x0038c0e4  mtxController
000bc9ba  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000bc9bc  ldr     r5, [r1]
000bc9be  mov     r1, r5
000bc9c0  blx     #0xddbfc ; -> objc_msgSend
000bc9c4  ldr.w   r1, [pc, #0x7c4]
000bc9c8  add     r1, pc ; -> 0x000fd4f0  
000bc9ca  ldr     r1, [r1]
000bc9cc  str     r1, [sp, #0xc]
000bc9ce  mov     r2, r0
000bc9d0  ldr     r0, [r4]
000bc9d2  blx     #0xddbfc ; -> objc_msgSend
000bc9d6  ldr.w   r2, [pc, #0x7b8]
000bc9da  ldr     r1, [sp, #8]
000bc9dc  ldr     r0, [sp, #4]
000bc9de  add     r2, pc ; -> 0x001805f4  
000bc9e0  blx     #0xddbfc ; -> objc_msgSend
000bc9e4  mov     r1, r5
000bc9e6  blx     #0xddbfc ; -> objc_msgSend
000bc9ea  ldr.w   r1, [pc, #0x7a8]
000bc9ee  add     r1, pc ; -> 0x000fd6b4  
000bc9f0  ldr     r1, [r1]
000bc9f2  mov     r2, r0
000bc9f4  ldr     r0, [r4]
000bc9f6  blx     #0xddbfc ; -> objc_msgSend
000bc9fa  ldr.w   r2, [pc, #0x79c]
000bc9fe  ldr     r1, [sp, #8]
000bca00  ldr     r0, [sp, #4]
000bca02  add     r2, pc ; -> 0x0017fed4  
000bca04  blx     #0xddbfc ; -> objc_msgSend
000bca08  mov     r1, r5
000bca0a  blx     #0xddbfc ; -> objc_msgSend
000bca0e  ldr.w   r1, [pc, #0x78c]
000bca12  ldr.w   r3, [pc, #0x78c]
000bca16  add     r1, pc ; -> 0x000fd55c  
000bca18  add     r3, pc ; -> 0x0038c168  iItemSellId
000bca1a  ldr     r1, [r1]
000bca1c  str     r1, [sp, #0x10]
000bca1e  str     r0, [r3]
000bca20  ldr     r0, [r4]
000bca22  blx     #0xddbfc ; -> objc_msgSend
000bca26  cmp     r0, #0x17
000bca28  bne.w   #0xbd15c
000bca2c  ldr.w   r0, [pc, #0x774]
000bca30  ldr.w   r1, [pc, #0x774]
000bca34  add     r0, pc ; -> 0x0038c0c4  mtxtransObserver
000bca36  add     r1, pc ; -> 0x000fd4ec  
000bca38  ldr     r0, [r0]
000bca3a  ldr     r1, [r1]
000bca3c  blx     #0xddbfc ; -> objc_msgSend
000bca40  cmp     r0, #0
000bca42  beq.w   #0xbd15c
000bca46  ldr.w   r1, [pc, #0x764]
000bca4a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bca4c  b       #0xbd152
000bca4e  ldr.w   r1, [pc, #0x760]
000bca52  ldr     r0, [sp, #4]
000bca54  ldr.w   r8, [pc, #0x75c]
000bca58  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bca5a  ldr.w   r4, [pc, #0x75c]
000bca5e  ldr     r1, [r1]
000bca60  blx     #0xddbfc ; -> objc_msgSend
000bca64  ldr.w   r1, [pc, #0x754]
000bca68  ldr.w   r0, [pc, #0x754]
000bca6c  add     r8, pc ; -> 0x0017e5c4  
000bca6e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bca70  add     r0, pc ; -> 0x000fdbf4  
000bca72  ldr     r1, [r1]
000bca74  ldr     r0, [r0]
000bca76  add     r4, pc ; -> 0x00180614  
000bca78  str     r1, [sp, #0x14]
000bca7a  blx     #0xddbfc ; -> objc_msgSend
000bca7e  ldr.w   r1, [pc, #0x744]
000bca82  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bca84  ldr     r1, [r1]
000bca86  str     r1, [sp, #0x18]
000bca88  blx     #0xddbfc ; -> objc_msgSend
000bca8c  ldr.w   r1, [pc, #0x738]
000bca90  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000bca92  ldr     r1, [r1]
000bca94  str     r1, [sp, #0x1c]
000bca96  blx     #0xddbfc ; -> objc_msgSend
000bca9a  ldr.w   r1, [pc, #0x730]
000bca9e  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bcaa0  ldr.w   sl, [r1]
000bcaa4  ldr.w   r1, [pc, #0x728]
000bcaa8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bcaaa  ldr     r1, [r1]
000bcaac  str     r1, [sp, #0x24]
000bcaae  ldr     r1, [sp, #0x10]
000bcab0  mov     fp, r0
000bcab2  ldr.w   r0, [pc, #0x720]
000bcab6  add     r0, pc ; -> 0x000fdb5c  
000bcab8  ldr     r0, [r0]
000bcaba  str     r0, [sp, #0x20]
000bcabc  ldr     r0, [r6]
000bcabe  blx     #0xddbfc ; -> objc_msgSend
000bcac2  ldr     r1, [sp, #0x24]
000bcac4  mov     r2, r8
000bcac6  mov     r3, r0
000bcac8  ldr     r0, [sp, #0x20]
000bcaca  blx     #0xddbfc ; -> objc_msgSend
000bcace  ldr.w   r3, [pc, #0x708]
000bcad2  mov     r1, sl
000bcad4  add     r3, pc ; -> 0x00180604  
000bcad6  mov     r2, r0
000bcad8  mov     r0, fp
000bcada  blx     #0xddbfc ; -> objc_msgSend
000bcade  ldr.w   r1, [pc, #0x6fc]
000bcae2  mov     r2, r4
000bcae4  ldr     r0, [sp, #4]
000bcae6  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bcae8  ldr     r1, [r1]
000bcaea  blx     #0xddbfc ; -> objc_msgSend
000bcaee  mov     r1, r5
000bcaf0  blx     #0xddbfc ; -> objc_msgSend
000bcaf4  ldr     r1, [sp, #0x24]
000bcaf6  mov     r2, r8
000bcaf8  mov     r3, r0
000bcafa  ldr     r0, [sp, #0x20]
000bcafc  blx     #0xddbfc ; -> objc_msgSend
000bcb00  mov     r3, r4
000bcb02  mov     r1, sl
000bcb04  mov     r2, r0
000bcb06  mov     r0, fp
000bcb08  blx     #0xddbfc ; -> objc_msgSend
000bcb0c  ldr.w   r0, [pc, #0x6d0]
000bcb10  ldr     r1, [sp, #0x14]
000bcb12  add     r0, pc ; -> 0x000fdb6c  
000bcb14  ldr     r0, [r0]
000bcb16  blx     #0xddbfc ; -> objc_msgSend
000bcb1a  ldr     r1, [sp, #0x18]
000bcb1c  blx     #0xddbfc ; -> objc_msgSend
000bcb20  ldr     r1, [sp, #0x1c]
000bcb22  blx     #0xddbfc ; -> objc_msgSend
000bcb26  ldr.w   r3, [pc, #0x6bc]
000bcb2a  mov     r1, sl
000bcb2c  add     r3, pc ; -> 0x00180624  
000bcb2e  mov     r2, r0
000bcb30  mov     r0, fp
000bcb32  blx     #0xddbfc ; -> objc_msgSend
000bcb36  ldr.w   r1, [pc, #0x6b0]
000bcb3a  ldr     r0, [r6]
000bcb3c  add     r1, pc ; -> 0x000fd4bc  
000bcb3e  ldr     r1, [r1]
000bcb40  blx     #0xddbfc ; -> objc_msgSend
000bcb44  ldr.w   r1, [pc, #0x6a4]
000bcb48  mov     r2, fp
000bcb4a  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000bcb4c  ldr     r1, [r1]
000bcb4e  blx     #0xddbfc ; -> objc_msgSend
000bcb52  b       #0xbd170
000bcb54  ldr.w   r0, [pc, #0x698]
000bcb58  ldr     r1, [sp, #0x10]
000bcb5a  add     r0, pc ; -> 0x0038c0e4  mtxController
000bcb5c  ldr     r0, [r0]
000bcb5e  blx     #0xddbfc ; -> objc_msgSend
000bcb62  ldr.w   r3, [pc, #0x690]
000bcb66  add     r3, pc ; -> 0x0038c0f0  iNetworkState
000bcb68  str     r0, [r3]
000bcb6a  cmp     r0, #3
000bcb6c  ite     ne
000bcb6e  movne   r3, #0
000bcb70  moveq   r3, #1
000bcb72  cmp     r0, #6
000bcb74  it      eq
000bcb76  orreq   r3, r3, #1
000bcb7a  cbnz    r3, #0xbcb80
000bcb7c  cmp     r0, #1
000bcb7e  bne     #0xbcb96
000bcb80  ldr.w   r0, [pc, #0x674]
000bcb84  ldr.w   r1, [pc, #0x674]
000bcb88  movs    r2, #1
000bcb8a  add     r0, pc ; -> 0x0038c0e4  mtxController
000bcb8c  add     r1, pc ; -> 0x000fd4e8  
000bcb8e  ldr     r0, [r0]
000bcb90  ldr     r1, [r1]
000bcb92  blx     #0xddbfc ; -> objc_msgSend
000bcb96  ldr.w   r0, [pc, #0x668]
000bcb9a  ldr.w   r1, [pc, #0x668]
000bcb9e  ldr.w   r4, [pc, #0x668]
000bcba2  add     r0, pc ; -> 0x000fdc7c  
000bcba4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bcba6  ldr     r0, [r0]
000bcba8  ldr     r1, [r1]
000bcbaa  blx     #0xddbfc ; -> objc_msgSend
000bcbae  ldr.w   r1, [pc, #0x65c]
000bcbb2  add     r4, pc ; -> 0x00180484  
000bcbb4  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bcbb6  ldr     r1, [r1]
000bcbb8  blx     #0xddbfc ; -> objc_msgSend
000bcbbc  ldr.w   r1, [pc, #0x650]
000bcbc0  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000bcbc2  ldr     r1, [r1]
000bcbc4  blx     #0xddbfc ; -> objc_msgSend
000bcbc8  ldr.w   r1, [pc, #0x648]
000bcbcc  movs    r2, #0
000bcbce  add     r1, pc ; -> 0x000fd4e4  
000bcbd0  ldr     r1, [r1]
000bcbd2  str     r1, [sp, #0x2c]
000bcbd4  str     r0, [sp, #0x28]
000bcbd6  blx     #0xddbfc ; -> objc_msgSend
000bcbda  ldr.w   r1, [pc, #0x63c]
000bcbde  ldr     r0, [sp, #0x28]
000bcbe0  movs    r2, #0
000bcbe2  add     r1, pc ; -> 0x000fd4e0  
000bcbe4  ldr     r1, [r1]
000bcbe6  str     r1, [sp, #0x30]
000bcbe8  blx     #0xddbfc ; -> objc_msgSend
000bcbec  ldr.w   r1, [pc, #0x62c]
000bcbf0  ldr.w   r2, [pc, #0x62c]
000bcbf4  ldr     r0, [sp, #0x28]
000bcbf6  add     r1, pc ; -> 0x000fd4dc  
000bcbf8  add     r2, pc ; -> 0x0038c0f0  iNetworkState
000bcbfa  ldr     r1, [r1]
000bcbfc  ldr     r2, [r2]
000bcbfe  blx     #0xddbfc ; -> objc_msgSend
000bcc02  ldr.w   r2, [pc, #0x620]
000bcc06  ldr     r1, [sp, #8]
000bcc08  ldr     r0, [sp, #4]
000bcc0a  add     r2, pc ; -> 0x00180634  
000bcc0c  blx     #0xddbfc ; -> objc_msgSend
000bcc10  mov     r1, r5
000bcc12  blx     #0xddbfc ; -> objc_msgSend
000bcc16  ldr.w   r1, [pc, #0x610]
000bcc1a  add     r1, pc ; -> 0x000fd4d8  
000bcc1c  ldr     r1, [r1]
000bcc1e  mov     r2, r0
000bcc20  ldr     r0, [sp, #0x28]
000bcc22  blx     #0xddbfc ; -> objc_msgSend
000bcc26  ldr.w   r2, [pc, #0x604]
000bcc2a  ldr     r1, [sp, #8]
000bcc2c  ldr     r0, [sp, #4]
000bcc2e  add     r2, pc ; -> 0x00180644  
000bcc30  blx     #0xddbfc ; -> objc_msgSend
000bcc34  mov     r1, r5
000bcc36  blx     #0xddbfc ; -> objc_msgSend
000bcc3a  ldr.w   r1, [pc, #0x5f4]
000bcc3e  add     r1, pc ; -> 0x000fd4d4  
000bcc40  ldr     r1, [r1]
000bcc42  mov     r2, r0
000bcc44  ldr     r0, [sp, #0x28]
000bcc46  blx     #0xddbfc ; -> objc_msgSend
000bcc4a  ldr.w   r1, [pc, #0x5e8]
000bcc4e  ldr.w   r2, [pc, #0x5e8]
000bcc52  ldr     r0, [sp, #4]
000bcc54  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bcc56  add     r2, pc ; -> 0x00180614  
000bcc58  ldr     r1, [r1]
000bcc5a  str     r1, [sp, #0x64]
000bcc5c  blx     #0xddbfc ; -> objc_msgSend
000bcc60  mov     r1, r5
000bcc62  blx     #0xddbfc ; -> objc_msgSend
000bcc66  ldr.w   r1, [pc, #0x5d4]
000bcc6a  add     r1, pc ; -> 0x000fd600  
000bcc6c  ldr     r1, [r1]
000bcc6e  mov     r2, r0
000bcc70  ldr     r0, [sp, #0x28]
000bcc72  blx     #0xddbfc ; -> objc_msgSend
000bcc76  ldr     r0, [sp, #4]
000bcc78  ldr     r1, [sp, #0x64]
000bcc7a  mov     r2, r4
000bcc7c  blx     #0xddbfc ; -> objc_msgSend
000bcc80  cbz     r0, #0xbcc9e
000bcc82  ldr.w   r1, [pc, #0x5bc]
000bcc86  mov     r2, r4
000bcc88  ldr     r0, [sp, #4]
000bcc8a  add     r1, pc ; -> 0x000fd4d0  
000bcc8c  ldr     r5, [r1]
000bcc8e  ldr     r1, [sp, #0x64]
000bcc90  blx     #0xddbfc ; -> objc_msgSend
000bcc94  mov     r1, r5
000bcc96  mov     r2, r0
000bcc98  ldr     r0, [sp, #0x28]
000bcc9a  blx     #0xddbfc ; -> objc_msgSend
000bcc9e  ldr.w   r1, [pc, #0x5a4]
000bcca2  ldr.w   r2, [pc, #0x5a4]
000bcca6  ldr     r0, [sp, #0x28]
000bcca8  add     r1, pc ; -> 0x000fd4cc  
000bccaa  add     r2, pc ; -> 0x0038c168  iItemSellId
000bccac  ldr     r1, [r1]
000bccae  ldr     r2, [r2]
000bccb0  blx     #0xddbfc ; -> objc_msgSend
000bccb4  ldr.w   r2, [pc, #0x594]
000bccb8  ldr     r1, [sp, #8]
000bccba  ldr     r0, [sp, #4]
000bccbc  add     r2, pc ; -> 0x0017fe34  
000bccbe  blx     #0xddbfc ; -> objc_msgSend
000bccc2  ldr.w   r1, [pc, #0x58c]
000bccc6  ldr.w   r4, [pc, #0x58c]
000bccca  add     r1, pc ; -> 0x000fd6b0  
000bcccc  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000bccce  ldr.w   sl, [r1]
000bccd2  mov     r1, sl
000bccd4  mov     r8, r0
000bccd6  ldr     r0, [r4]
000bccd8  blx     #0xddbfc ; -> objc_msgSend
000bccdc  cmp     r0, #0
000bccde  ble     #0xbcda6
000bcce0  ldr.w   r2, [pc, #0x574]
000bcce4  ldr.w   r5, [pc, #0x574]
000bcce8  add     r0, sp, #0x68
000bccea  add     r2, pc ; -> 0x000fcdc8  
000bccec  add     r5, pc ; -> 0x00180654  
000bccee  ldr.w   fp, [r2]
000bccf2  mov     r3, r5
000bccf4  mov     r1, r8
000bccf6  mov     r2, fp
000bccf8  blx     #0xddc14 ; -> objc_msgSend_stret
000bccfc  ldr     r3, [sp, #0x6c]
000bccfe  cbz     r3, #0xbcd46
000bcd00  ldr.w   r1, [pc, #0x55c]
000bcd04  ldr.w   r0, [pc, #0x55c]
000bcd08  ldr.w   r6, [pc, #0x55c]
000bcd0c  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000bcd0e  add     r0, pc ; -> 0x000fdb5c  
000bcd10  ldr     r1, [r1]
000bcd12  ldr     r0, [r0]
000bcd14  add     r6, pc ; -> 0x00180664  
000bcd16  str     r1, [sp, #0x34]
000bcd18  ldr.w   r1, [pc, #0x550]
000bcd1c  str     r0, [sp, #0x38]
000bcd1e  ldr     r0, [r4]
000bcd20  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bcd22  ldr     r1, [r1]
000bcd24  str     r1, [sp, #0x44]
000bcd26  mov     r1, sl
000bcd28  blx     #0xddbfc ; -> objc_msgSend
000bcd2c  ldr     r1, [sp, #0x44]
000bcd2e  mov     r2, r6
000bcd30  mov     r3, r0
000bcd32  ldr     r0, [sp, #0x38]
000bcd34  blx     #0xddbfc ; -> objc_msgSend
000bcd38  ldr     r1, [sp, #0x34]
000bcd3a  mov     r2, r5
000bcd3c  mov     r3, r0
000bcd3e  mov     r0, r8
000bcd40  blx     #0xddbfc ; -> objc_msgSend
000bcd44  mov     r8, r0
000bcd46  ldr.w   r4, [pc, #0x528]
000bcd4a  add     r0, sp, #0x68
000bcd4c  mov     r1, r8
000bcd4e  add     r4, pc ; -> 0x00180674  
000bcd50  mov     r2, fp
000bcd52  mov     r3, r4
000bcd54  blx     #0xddc14 ; -> objc_msgSend_stret
000bcd58  ldr     r3, [sp, #0x6c]
000bcd5a  cbz     r3, #0xbcda6
000bcd5c  ldr.w   r1, [pc, #0x514]
000bcd60  ldr.w   r0, [pc, #0x514]
000bcd64  ldr.w   r5, [pc, #0x514]
000bcd68  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000bcd6a  add     r0, pc ; -> 0x000fdb5c  
000bcd6c  ldr     r1, [r1]
000bcd6e  ldr.w   fp, [r0]
000bcd72  ldr.w   r0, [pc, #0x50c]
000bcd76  add     r5, pc ; -> 0x00180664  
000bcd78  str     r1, [sp, #0x4c]
000bcd7a  ldr.w   r1, [pc, #0x508]
000bcd7e  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bcd80  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bcd82  ldr     r0, [r0]
000bcd84  ldr     r6, [r1]
000bcd86  mov     r1, sl
000bcd88  blx     #0xddbfc ; -> objc_msgSend
000bcd8c  mov     r2, r5
000bcd8e  mov     r1, r6
000bcd90  mov     r3, r0
000bcd92  mov     r0, fp
000bcd94  blx     #0xddbfc ; -> objc_msgSend
000bcd98  ldr     r1, [sp, #0x4c]
000bcd9a  mov     r2, r4
000bcd9c  mov     r3, r0
000bcd9e  mov     r0, r8
000bcda0  blx     #0xddbfc ; -> objc_msgSend
000bcda4  mov     r8, r0
000bcda6  ldr.w   r1, [pc, #0x4e0]
000bcdaa  ldr.w   r5, [pc, #0x4e0]
000bcdae  add     r1, pc ; -> 0x000fd5d8  
000bcdb0  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000bcdb2  ldr.w   fp, [r1]
000bcdb6  ldr     r0, [r5]
000bcdb8  mov     r1, fp
000bcdba  blx     #0xddbfc ; -> objc_msgSend
000bcdbe  cmp     r0, #0
000bcdc0  ble.w   #0xbcede
000bcdc4  ldr.w   r2, [pc, #0x4c8]
000bcdc8  ldr.w   r6, [pc, #0x4c8]
000bcdcc  add     r0, sp, #0x68
000bcdce  add     r2, pc ; -> 0x000fcdc8  
000bcdd0  add     r6, pc ; -> 0x00180684  
000bcdd2  ldr     r4, [r2]
000bcdd4  mov     r3, r6
000bcdd6  mov     r1, r8
000bcdd8  mov     r2, r4
000bcdda  blx     #0xddc14 ; -> objc_msgSend_stret
000bcdde  ldr     r3, [sp, #0x6c]
000bcde0  cbz     r3, #0xbce24
000bcde2  ldr.w   r1, [pc, #0x4b4]
000bcde6  ldr.w   r0, [pc, #0x4b4]
000bcdea  ldr.w   r4, [pc, #0x4b4]
000bcdee  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000bcdf0  add     r0, pc ; -> 0x000fdb5c  
000bcdf2  ldr     r1, [r1]
000bcdf4  ldr     r0, [r0]
000bcdf6  add     r4, pc ; -> 0x00180694  
000bcdf8  str     r1, [sp, #0x50]
000bcdfa  ldr.w   r1, [pc, #0x4a8]
000bcdfe  str     r0, [sp, #0x3c]
000bce00  ldr     r0, [r5]
000bce02  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bce04  ldr.w   sl, [r1]
000bce08  mov     r1, fp
000bce0a  blx     #0xddbfc ; -> objc_msgSend
000bce0e  mov     r2, r4
000bce10  mov     r1, sl
000bce12  mov     r3, r0
000bce14  ldr     r0, [sp, #0x3c]
000bce16  blx     #0xddbfc ; -> objc_msgSend
000bce1a  ldr     r1, [sp, #0x50]
000bce1c  mov     r2, r6
000bce1e  mov     r3, r0
000bce20  mov     r0, r8
000bce22  b       #0xbced8
000bce24  ldr.w   r5, [pc, #0x480]
000bce28  add     r0, sp, #0x68
000bce2a  mov     r1, r8
000bce2c  add     r5, pc ; -> 0x001806a4  
000bce2e  mov     r2, r4
000bce30  mov     r3, r5
000bce32  blx     #0xddc14 ; -> objc_msgSend_stret
000bce36  ldr     r3, [sp, #0x6c]
000bce38  cbz     r3, #0xbce7e
000bce3a  ldr.w   r1, [pc, #0x470]
000bce3e  ldr.w   r0, [pc, #0x470]
000bce42  ldr.w   r4, [pc, #0x470]
000bce46  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000bce48  add     r0, pc ; -> 0x000fdb5c  
000bce4a  ldr     r1, [r1]
000bce4c  ldr.w   sl, [r0]
000bce50  ldr.w   r0, [pc, #0x464]
000bce54  add     r4, pc ; -> 0x00180694  
000bce56  str     r1, [sp, #0x54]
000bce58  ldr.w   r1, [pc, #0x460]
000bce5c  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bce5e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bce60  ldr     r0, [r0]
000bce62  ldr     r6, [r1]
000bce64  mov     r1, fp
000bce66  blx     #0xddbfc ; -> objc_msgSend
000bce6a  mov     r2, r4
000bce6c  mov     r1, r6
000bce6e  mov     r3, r0
000bce70  mov     r0, sl
000bce72  blx     #0xddbfc ; -> objc_msgSend
000bce76  ldr     r1, [sp, #0x54]
000bce78  mov     r3, r0
000bce7a  mov     r0, r8
000bce7c  b       #0xbced6
000bce7e  ldr.w   r5, [pc, #0x440]
000bce82  add     r0, sp, #0x68
000bce84  mov     r1, r8
000bce86  add     r5, pc ; -> 0x001806b4  
000bce88  mov     r2, r4
000bce8a  mov     r3, r5
000bce8c  blx     #0xddc14 ; -> objc_msgSend_stret
000bce90  ldr     r3, [sp, #0x6c]
000bce92  cbz     r3, #0xbcede
000bce94  ldr.w   r1, [pc, #0x42c]
000bce98  ldr.w   r0, [pc, #0x42c]
000bce9c  ldr.w   r4, [pc, #0x42c]
000bcea0  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000bcea2  add     r0, pc ; -> 0x000fdb5c  
000bcea4  ldr     r1, [r1]
000bcea6  ldr.w   sl, [r0]
000bceaa  ldr.w   r0, [pc, #0x424]
000bceae  add     r4, pc ; -> 0x00180694  
000bceb0  str     r1, [sp, #0x58]
000bceb2  ldr.w   r1, [pc, #0x420]
000bceb6  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bceb8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bceba  ldr     r0, [r0]
000bcebc  ldr     r6, [r1]
000bcebe  mov     r1, fp
000bcec0  blx     #0xddbfc ; -> objc_msgSend
000bcec4  mov     r2, r4
000bcec6  mov     r1, r6
000bcec8  mov     r3, r0
000bceca  mov     r0, sl
000bcecc  blx     #0xddbfc ; -> objc_msgSend
000bced0  ldr     r1, [sp, #0x58]
000bced2  mov     r3, r0
000bced4  mov     r0, r8
000bced6  mov     r2, r5
000bced8  blx     #0xddbfc ; -> objc_msgSend
000bcedc  mov     r8, r0
000bcede  ldr     r1, [pc, #0x3f8]
000bcee0  ldr.w   r4, [pc, #0x3f8]
000bcee4  add     r1, pc ; -> 0x000fd6a4  
000bcee6  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000bcee8  ldr.w   sl, [r1]
000bceec  ldr     r0, [r4]
000bceee  mov     r1, sl
000bcef0  blx     #0xddbfc ; -> objc_msgSend
000bcef4  cmp     r0, #0
000bcef6  ble     #0xbcfa6
000bcef8  ldr     r2, [pc, #0x3e4]
000bcefa  ldr     r5, [pc, #0x3e8]
000bcefc  add     r0, sp, #0x68
000bcefe  add     r2, pc ; -> 0x000fcdc8  
000bcf00  add     r5, pc ; -> 0x001806c4  
000bcf02  ldr.w   fp, [r2]
000bcf06  mov     r3, r5
000bcf08  mov     r1, r8
000bcf0a  mov     r2, fp
000bcf0c  blx     #0xddc14 ; -> objc_msgSend_stret
000bcf10  ldr     r3, [sp, #0x6c]
000bcf12  cbz     r3, #0xbcf52
000bcf14  ldr     r1, [pc, #0x3d0]
000bcf16  ldr     r0, [pc, #0x3d4]
000bcf18  ldr     r6, [pc, #0x3d4]
000bcf1a  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000bcf1c  add     r0, pc ; -> 0x000fdb5c  
000bcf1e  ldr     r1, [r1]
000bcf20  ldr     r0, [r0]
000bcf22  add     r6, pc ; -> 0x001806d4  
000bcf24  str     r1, [sp, #0x5c]
000bcf26  ldr     r1, [pc, #0x3cc]
000bcf28  str     r0, [sp, #0x40]
000bcf2a  ldr     r0, [r4]
000bcf2c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bcf2e  ldr     r1, [r1]
000bcf30  str     r1, [sp, #0x48]
000bcf32  mov     r1, sl
000bcf34  blx     #0xddbfc ; -> objc_msgSend
000bcf38  ldr     r1, [sp, #0x48]
000bcf3a  mov     r2, r6
000bcf3c  mov     r3, r0
000bcf3e  ldr     r0, [sp, #0x40]
000bcf40  blx     #0xddbfc ; -> objc_msgSend
000bcf44  ldr     r1, [sp, #0x5c]
000bcf46  mov     r2, r5
000bcf48  mov     r3, r0
000bcf4a  mov     r0, r8
000bcf4c  blx     #0xddbfc ; -> objc_msgSend
000bcf50  mov     r8, r0
000bcf52  ldr     r4, [pc, #0x3a4]
000bcf54  add     r0, sp, #0x68
000bcf56  mov     r1, r8
000bcf58  add     r4, pc ; -> 0x001806e4  
000bcf5a  mov     r2, fp
000bcf5c  mov     r3, r4
000bcf5e  blx     #0xddc14 ; -> objc_msgSend_stret
000bcf62  ldr     r3, [sp, #0x6c]
000bcf64  cbz     r3, #0xbcfa6
000bcf66  ldr     r1, [pc, #0x394]
000bcf68  ldr     r0, [pc, #0x394]
000bcf6a  ldr     r5, [pc, #0x398]
000bcf6c  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000bcf6e  add     r0, pc ; -> 0x000fdb5c  
000bcf70  ldr     r1, [r1]
000bcf72  ldr.w   fp, [r0]
000bcf76  ldr     r0, [pc, #0x390]
000bcf78  add     r5, pc ; -> 0x001806f4  
000bcf7a  str     r1, [sp, #0x60]
000bcf7c  ldr     r1, [pc, #0x38c]
000bcf7e  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bcf80  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bcf82  ldr     r0, [r0]
000bcf84  ldr     r6, [r1]
000bcf86  mov     r1, sl
000bcf88  blx     #0xddbfc ; -> objc_msgSend
000bcf8c  mov     r2, r5
000bcf8e  mov     r1, r6
000bcf90  mov     r3, r0
000bcf92  mov     r0, fp
000bcf94  blx     #0xddbfc ; -> objc_msgSend
000bcf98  ldr     r1, [sp, #0x60]
000bcf9a  mov     r2, r4
000bcf9c  mov     r3, r0
000bcf9e  mov     r0, r8
000bcfa0  blx     #0xddbfc ; -> objc_msgSend
000bcfa4  mov     r8, r0
000bcfa6  ldr     r2, [pc, #0x368]
000bcfa8  ldr     r1, [sp, #8]
000bcfaa  ldr     r0, [sp, #4]
000bcfac  add     r2, pc ; -> 0x00180704  
000bcfae  blx     #0xddbfc ; -> objc_msgSend
000bcfb2  ldr     r2, [pc, #0x360]
000bcfb4  ldr     r1, [sp, #8]
000bcfb6  add     r2, pc ; -> 0x00180714  
000bcfb8  mov     r4, r0
000bcfba  ldr     r0, [sp, #4]
000bcfbc  blx     #0xddbfc ; -> objc_msgSend
000bcfc0  ldr     r3, [pc, #0x354]
000bcfc2  add     r3, pc ; -> 0x0017e7a4  
000bcfc4  cmp     r0, r3
000bcfc6  bne     #0xbcfe4
000bcfc8  ldr     r2, [pc, #0x350]
000bcfca  ldr     r1, [sp, #8]
000bcfcc  ldr     r0, [sp, #4]
000bcfce  add     r2, pc ; -> 0x00180724  
000bcfd0  blx     #0xddbfc ; -> objc_msgSend
000bcfd4  ldr     r1, [pc, #0x348]
000bcfd6  str     r4, [sp]
000bcfd8  mov     r2, r8
000bcfda  add     r1, pc ; -> 0x000fd4c8  
000bcfdc  ldr     r1, [r1]
000bcfde  mov     r3, r0
000bcfe0  ldr     r0, [sp, #0x28]
000bcfe2  b       #0xbd0ec
000bcfe4  ldr     r3, [pc, #0x33c]
000bcfe6  add     r3, pc ; -> 0x00180734  
000bcfe8  cmp     r0, r3
000bcfea  bne     #0xbcff6
000bcfec  ldr     r1, [pc, #0x338]
000bcfee  str     r0, [sp]
000bcff0  add     r1, pc ; -> 0x000fd4c4  
000bcff2  ldr     r1, [r1]
000bcff4  b       #0xbd0e6
000bcff6  ldr     r0, [pc, #0x334]
000bcff8  ldr     r1, [sp, #0x10]
000bcffa  add     r0, pc ; -> 0x0038c0e4  mtxController
000bcffc  ldr     r0, [r0]
000bcffe  blx     #0xddbfc ; -> objc_msgSend
000bd002  cmp     r0, #0xb
000bd004  bne     #0xbd0da
000bd006  ldr     r2, [pc, #0x328]
000bd008  add     r2, pc ; -> 0x0038c1ae  downloadingAsset
000bd00a  ldrb    r6, [r2]
000bd00c  cmp     r6, #0
000bd00e  bne     #0xbd0da
000bd010  ldr     r0, [pc, #0x320]
000bd012  ldr     r1, [pc, #0x324]
000bd014  ldr     r5, [pc, #0x324]
000bd016  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bd018  ldr     r2, [pc, #0x324]
000bd01a  ldr.w   sl, [r0]
000bd01e  ldr     r0, [pc, #0x324]
000bd020  add     r5, pc ; -> 0x0038c168  iItemSellId
000bd022  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bd024  add     r0, pc ; -> 0x000fdb5c  
000bd026  ldr     r3, [r5]
000bd028  add     r2, pc ; -> 0x0017e5c4  
000bd02a  ldr     r1, [r1]
000bd02c  ldr     r0, [r0]
000bd02e  blx     #0xddbfc ; -> objc_msgSend
000bd032  ldr     r1, [sp, #0x64]
000bd034  mov     r2, r0
000bd036  mov     r0, sl
000bd038  blx     #0xddbfc ; -> objc_msgSend
000bd03c  ldr     r3, [pc, #0x308]
000bd03e  add     r3, pc ; -> 0x0038c198  m_iDSellId
000bd040  ldr     r2, [r3]
000bd042  ldr     r3, [r5]
000bd044  cmp     r2, r3
000bd046  mov     sl, r0
000bd048  bne     #0xbd096
000bd04a  ldr     r5, [pc, #0x300]
000bd04c  add     r5, pc ; -> 0x0038c0cc  dCachedData
000bd04e  ldr     r3, [r5]
000bd050  cbnz    r3, #0xbd06e
000bd052  ldr     r0, [pc, #0x2fc]
000bd054  ldr     r1, [pc, #0x2fc]
000bd056  add     r0, pc ; -> 0x000fdbbc  
000bd058  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000bd05a  ldr     r0, [r0]
000bd05c  ldr     r1, [r1]
000bd05e  blx     #0xddbfc ; -> objc_msgSend
000bd062  ldr     r1, [pc, #0x2f4]
000bd064  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000bd066  ldr     r1, [r1]
000bd068  blx     #0xddbfc ; -> objc_msgSend
000bd06c  str     r0, [r5]
000bd06e  ldr     r0, [sp, #0x28]
000bd070  ldr     r1, [sp, #0x2c]
000bd072  movs    r2, #1
000bd074  blx     #0xddbfc ; -> objc_msgSend
000bd078  ldr     r0, [pc, #0x2e0]
000bd07a  add     r0, pc ; -> 0x0038c0cc  dCachedData
000bd07c  ldr     r0, [r0]
000bd07e  cbnz    r0, #0xbd084
000bd080  mov     r2, r6
000bd082  b       #0xbd090
000bd084  ldr     r1, [pc, #0x2d8]
000bd086  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000bd088  ldr     r1, [r1]
000bd08a  blx     #0xddbfc ; -> objc_msgSend
000bd08e  mov     r2, r0
000bd090  ldr     r0, [sp, #0x28]
000bd092  ldr     r1, [sp, #0x30]
000bd094  b       #0xbd0bc
000bd096  ldr     r5, [pc, #0x2cc]
000bd098  add     r5, pc ; -> 0x0038c0cc  dCachedData
000bd09a  ldr     r0, [r5]
000bd09c  cbz     r0, #0xbd0aa
000bd09e  ldr     r1, [pc, #0x2c8]
000bd0a0  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bd0a2  ldr     r1, [r1]
000bd0a4  blx     #0xddbfc ; -> objc_msgSend
000bd0a8  str     r6, [r5]
000bd0aa  ldr     r3, [pc, #0x2c0]
000bd0ac  ldr     r2, [pc, #0x2c0]
000bd0ae  ldr     r0, [sp, #0x28]
000bd0b0  add     r3, pc ; -> 0x0038c168  iItemSellId
000bd0b2  ldr     r1, [sp, #0x30]
000bd0b4  ldr     r3, [r3]
000bd0b6  add     r2, pc ; -> 0x0038c198  m_iDSellId
000bd0b8  str     r3, [r2]
000bd0ba  mov     r2, r6
000bd0bc  blx     #0xddbfc ; -> objc_msgSend
000bd0c0  ldr     r1, [pc, #0x2b0]
000bd0c2  mov     r0, sl
000bd0c4  add     r1, pc ; -> 0x000fd6a0  
000bd0c6  ldr     r1, [r1]
000bd0c8  blx     #0xddbfc ; -> objc_msgSend
000bd0cc  ldr     r1, [pc, #0x2a8]
000bd0ce  add     r1, pc ; -> 0x000fd4c0  
000bd0d0  ldr     r1, [r1]
000bd0d2  subs    r2, r0, #1
000bd0d4  ldr     r0, [sp, #0x28]
000bd0d6  blx     #0xddbfc ; -> objc_msgSend
000bd0da  ldr     r1, [pc, #0x2a0]
000bd0dc  ldr     r3, [pc, #0x2a0]
000bd0de  add     r1, pc ; -> 0x000fd4c4  
000bd0e0  add     r3, pc ; -> 0x0017ea14  
000bd0e2  ldr     r1, [r1]
000bd0e4  str     r3, [sp]
000bd0e6  ldr     r0, [sp, #0x28]
000bd0e8  mov     r2, r8
000bd0ea  mov     r3, r4
000bd0ec  blx     #0xddbfc ; -> objc_msgSend
000bd0f0  ldr.w   r8, [pc, #0x290]
000bd0f4  ldr     r1, [pc, #0x290]
000bd0f6  ldr     r4, [pc, #0x294]
000bd0f8  add     r8, pc ; -> 0x0038c0e4  mtxController
000bd0fa  add     r1, pc ; -> 0x000fd68c  
000bd0fc  ldr.w   r0, [r8]
000bd100  ldr     r1, [r1]
000bd102  blx     #0xddbfc ; -> objc_msgSend
000bd106  ldr     r1, [pc, #0x288]
000bd108  add     r4, pc ; -> 0x0017e5c4  
000bd10a  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bd10c  ldr.w   sl, [r1]
000bd110  ldr     r1, [pc, #0x280]
000bd112  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bd114  ldr     r5, [r1]
000bd116  ldr     r1, [pc, #0x280]
000bd118  add     r1, pc ; -> 0x000fd684  
000bd11a  ldr     r1, [r1]
000bd11c  mov     fp, r0
000bd11e  ldr     r0, [pc, #0x27c]
000bd120  add     r0, pc ; -> 0x000fdb5c  
000bd122  ldr     r6, [r0]
000bd124  ldr     r0, [sp, #0x28]
000bd126  blx     #0xddbfc ; -> objc_msgSend
000bd12a  mov     r1, r5
000bd12c  mov     r2, r4
000bd12e  mov     r3, r0
000bd130  mov     r0, r6
000bd132  blx     #0xddbfc ; -> objc_msgSend
000bd136  mov     r1, sl
000bd138  ldr     r2, [sp, #0x28]
000bd13a  mov     r3, r0
000bd13c  mov     r0, fp
000bd13e  blx     #0xddbfc ; -> objc_msgSend
000bd142  ldr     r1, [sp, #0xc]
000bd144  ldr.w   r0, [r8]
000bd148  movs    r2, #2
000bd14a  blx     #0xddbfc ; -> objc_msgSend
000bd14e  ldr     r1, [pc, #0x250]
000bd150  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bd152  ldr     r1, [r1]
000bd154  ldr     r0, [sp, #4]
000bd156  blx     #0xddbfc ; -> objc_msgSend
000bd15a  b       #0xbd170
000bd15c  ldr     r6, [pc, #0x244]
000bd15e  ldr     r1, [sp, #0x10]
000bd160  add     r6, pc ; -> 0x0038c0e4  mtxController
000bd162  ldr     r0, [r6]
000bd164  blx     #0xddbfc ; -> objc_msgSend
000bd168  cmp     r0, #0xa
000bd16a  bne.w   #0xbcb54
000bd16e  b       #0xbca4e
000bd170  movs    r0, #1
000bd172  sub.w   sp, r7, #0x18
000bd176  pop.w   {r8, sl, fp}
000bd17a  pop     {r4, r5, r6, r7, pc}
000bd17c  lsls    r4, r5, #4
000bd17e  movs    r4, r0
000bd180  subs    r4, #0x3a
000bd182  movs    r4, r1
