========================================================================
-[Facebook authorizeWithFBAppAuth  0x000dabc0  776 bytes   Facebook.m
========================================================================

000dabc0  push    {r4, r5, r6, r7, lr}
000dabc2  add     r7, sp, #0xc
000dabc4  push.w  {r8, sl, fp}
000dabc8  sub     sp, #0x2c
000dabca  sxtb.w  fp, r2
000dabce  ldr     r2, [pc, #0x230]
000dabd0  ldr.w   ip, [pc, #0x230]
000dabd4  mov     r6, r0
000dabd6  add     r2, pc ; -> 0x000fc51c  OBJC_IVAR_$_Facebook._appId
000dabd8  add     ip, pc ; -> 0x0017e754  
000dabda  ldr     r2, [r2]
000dabdc  str.w   ip, [sp, #4]
000dabe0  ldr.w   ip, [pc, #0x224]
000dabe4  ldr     r0, [pc, #0x224]
000dabe6  ldr     r1, [pc, #0x228]
000dabe8  add     ip, pc ; -> 0x0017e11c  kRedirectURL
000dabea  sxtb    r3, r3
000dabec  ldr.w   ip, [ip]
000dabf0  str     r3, [sp, #0x24]
000dabf2  ldr     r3, [pc, #0x220]
000dabf4  add     r0, pc ; -> 0x000fdbf4  
000dabf6  str.w   ip, [sp, #8]
000dabfa  ldr.w   ip, [pc, #0x21c]
000dabfe  ldr.w   lr, [pc, #0x21c]
000dac02  ldr.w   sl, [pc, #0x21c]
000dac06  add     ip, pc ; -> 0x0017e118  kSDKVersion
000dac08  ldr     r4, [pc, #0x218]
000dac0a  ldr.w   ip, [ip]
000dac0e  ldr.w   sb, [pc, #0x218]
000dac12  ldr     r5, [pc, #0x218]
000dac14  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dac16  add     r3, pc ; -> 0x00182a04  
000dac18  ldr     r1, [r1]
000dac1a  ldr     r2, [r6, r2]
000dac1c  ldr     r0, [r0]
000dac1e  add     lr, pc ; -> 0x00182984  
000dac20  add     sb, pc ; -> 0x0017ea74  
000dac22  str.w   lr, [sp]
000dac26  str.w   sb, [sp, #0x14]
000dac2a  str.w   ip, [sp, #0x18]
000dac2e  add     sl, pc ; -> 0x00182974  
000dac30  mov.w   ip, #0
000dac34  add     r4, pc ; -> 0x0017e9c4  
000dac36  str.w   ip, [sp, #0x20]
000dac3a  add     r5, pc ; -> 0x00182964  
000dac3c  str.w   sl, [sp, #0xc]
000dac40  str     r4, [sp, #0x10]
000dac42  str     r5, [sp, #0x1c]
000dac44  blx     #0xddbfc ; -> objc_msgSend
000dac48  ldr     r1, [pc, #0x1e4]
000dac4a  ldr     r2, [pc, #0x1e8]
000dac4c  add     r1, pc ; -> 0x000fcfe4  
000dac4e  add     r2, pc ; -> 0x0017e124  kLogin
000dac50  ldr     r1, [r1]
000dac52  ldr     r2, [r2]
000dac54  mov     r8, r0
000dac56  ldr     r0, [pc, #0x1e0]
000dac58  add     r0, pc ; -> 0x0017e120  kDialogBaseURL
000dac5a  ldr     r0, [r0]
000dac5c  blx     #0xddbfc ; -> objc_msgSend
000dac60  ldr     r3, [pc, #0x1d8]
000dac62  add     r3, pc ; -> 0x000fc520  OBJC_IVAR_$_Facebook._permissions
000dac64  str     r0, [sp, #0x28]
000dac66  ldr     r0, [r3]
000dac68  ldr     r0, [r6, r0]
000dac6a  cbz     r0, #0xdac8c
000dac6c  ldr     r1, [pc, #0x1d0]
000dac6e  ldr     r2, [pc, #0x1d4]
000dac70  add     r1, pc ; -> 0x000fcd1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a4
000dac72  add     r2, pc ; -> 0x0017fe54  
000dac74  ldr     r1, [r1]
000dac76  blx     #0xddbfc ; -> objc_msgSend
000dac7a  ldr     r1, [pc, #0x1cc]
000dac7c  ldr     r3, [pc, #0x1cc]
000dac7e  add     r1, pc ; -> 0x000fd5e0  
000dac80  add     r3, pc ; -> 0x00182a14  
000dac82  ldr     r1, [r1]
000dac84  mov     r2, r0
000dac86  mov     r0, r8
000dac88  blx     #0xddbfc ; -> objc_msgSend
000dac8c  ldr     r0, [pc, #0x1c0]
000dac8e  ldr     r1, [pc, #0x1c4]
000dac90  add     r0, pc ; -> 0x000fdb50  
000dac92  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000dac94  ldr     r0, [r0]
000dac96  ldr     r1, [r1]
000dac98  blx     #0xddbfc ; -> objc_msgSend
000dac9c  ldr     r1, [pc, #0x1b8]
000dac9e  add     r1, pc ; -> 0x000fd3b0  
000daca0  ldr     r4, [r1]
000daca2  ldr     r1, [pc, #0x1b8]
000daca4  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000daca6  mov     r2, r4
000daca8  ldr     r1, [r1]
000dacaa  mov     r5, r0
000dacac  blx     #0xddbfc ; -> objc_msgSend
000dacb0  tst.w   r0, #0xff
000dacb4  beq     #0xdadb2
000dacb6  mov     r0, r5
000dacb8  mov     r1, r4
000dacba  blx     #0xddbfc ; -> objc_msgSend
000dacbe  tst.w   r0, #0xff
000dacc2  beq     #0xdadb2
000dacc4  cmp.w   fp, #0
000dacc8  bne     #0xdacce
000dacca  mov     r0, fp
000daccc  b       #0xdad1e
000dacce  ldr     r0, [pc, #0x190]
000dacd0  ldr     r1, [pc, #0x190]
000dacd2  ldr     r2, [pc, #0x194]
000dacd4  add     r0, pc ; -> 0x000fdbf0  
000dacd6  add     r1, pc ; -> 0x000fdae8  
000dacd8  add     r2, pc ; -> 0x0017e128  kFBAppAuthURL
000dacda  mov     r3, r8
000dacdc  ldr     r2, [r2]
000dacde  ldr     r1, [r1]
000dace0  ldr     r0, [r0]
000dace2  blx     #0xddbfc ; -> objc_msgSend
000dace6  ldr     r1, [pc, #0x184]
000dace8  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000dacea  ldr     r1, [r1]
000dacec  mov     fp, r0
000dacee  ldr     r0, [pc, #0x180]
000dacf0  add     r0, pc ; -> 0x000fdb80  
000dacf2  ldr     r0, [r0]
000dacf4  blx     #0xddbfc ; -> objc_msgSend
000dacf8  ldr     r1, [pc, #0x178]
000dacfa  mov     r2, fp
000dacfc  add     r1, pc ; -> 0x000fcbac  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x234
000dacfe  ldr     r4, [r1]
000dad00  ldr     r1, [pc, #0x174]
000dad02  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000dad04  ldr     r1, [r1]
000dad06  mov     r5, r0
000dad08  ldr     r0, [pc, #0x170]
000dad0a  add     r0, pc ; -> 0x000fdb64  
000dad0c  ldr     r0, [r0]
000dad0e  blx     #0xddbfc ; -> objc_msgSend
000dad12  mov     r1, r4
000dad14  mov     r2, r0
000dad16  mov     r0, r5
000dad18  blx     #0xddbfc ; -> objc_msgSend
000dad1c  uxtb    r0, r0
000dad1e  ldr     r2, [sp, #0x24]
000dad20  tst.w   r0, #0xff
000dad24  ite     ne
000dad26  movne   r3, #0
000dad28  moveq   r3, #1
000dad2a  cmp     r2, #0
000dad2c  ite     eq
000dad2e  moveq   r3, #0
000dad30  andne   r3, r3, #1
000dad34  cmp     r3, #0
000dad36  beq     #0xdadb0
000dad38  ldr     r3, [pc, #0x144]
000dad3a  ldr     r0, [pc, #0x148]
000dad3c  ldr     r1, [pc, #0x148]
000dad3e  add     r3, pc ; -> 0x000fc51c  OBJC_IVAR_$_Facebook._appId
000dad40  ldr     r2, [pc, #0x148]
000dad42  ldr     r3, [r3]
000dad44  add     r0, pc ; -> 0x000fdb5c  
000dad46  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dad48  add     r2, pc ; -> 0x001829b4  
000dad4a  ldr     r1, [r1]
000dad4c  ldr     r3, [r6, r3]
000dad4e  ldr     r0, [r0]
000dad50  blx     #0xddbfc ; -> objc_msgSend
000dad54  ldr     r1, [pc, #0x138]
000dad56  mov     r3, sl
000dad58  add     r1, pc ; -> 0x000fd5e0  
000dad5a  ldr     r1, [r1]
000dad5c  mov     r2, r0
000dad5e  mov     r0, r8
000dad60  blx     #0xddbfc ; -> objc_msgSend
000dad64  ldr     r0, [pc, #0x12c]
000dad66  ldr     r1, [pc, #0x130]
000dad68  mov     r3, r8
000dad6a  add     r0, pc ; -> 0x000fdbf0  
000dad6c  add     r1, pc ; -> 0x000fdae8  
000dad6e  ldr     r2, [sp, #0x28]
000dad70  ldr     r1, [r1]
000dad72  ldr     r0, [r0]
000dad74  blx     #0xddbfc ; -> objc_msgSend
000dad78  ldr     r1, [pc, #0x120]
000dad7a  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000dad7c  ldr     r1, [r1]
000dad7e  mov     sl, r0
000dad80  ldr     r0, [pc, #0x11c]
000dad82  add     r0, pc ; -> 0x000fdb80  
000dad84  ldr     r0, [r0]
000dad86  blx     #0xddbfc ; -> objc_msgSend
000dad8a  ldr     r1, [pc, #0x118]
000dad8c  mov     r2, sl
000dad8e  add     r1, pc ; -> 0x000fcbac  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x234
000dad90  ldr     r4, [r1]
000dad92  ldr     r1, [pc, #0x114]
000dad94  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000dad96  ldr     r1, [r1]
000dad98  mov     r5, r0
000dad9a  ldr     r0, [pc, #0x110]
000dad9c  add     r0, pc ; -> 0x000fdb64  
000dad9e  ldr     r0, [r0]
000dada0  blx     #0xddbfc ; -> objc_msgSend
000dada4  mov     r1, r4
000dada6  mov     r2, r0
000dada8  mov     r0, r5
000dadaa  blx     #0xddbfc ; -> objc_msgSend
000dadae  uxtb    r0, r0
000dadb0  cbnz    r0, #0xdadf6
000dadb2  ldr     r4, [pc, #0xfc]
000dadb4  ldr     r1, [pc, #0xfc]
000dadb6  add     r4, pc ; -> 0x000fc514  OBJC_IVAR_$_Facebook._loginDialog
000dadb8  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000dadba  ldr     r3, [r4]
000dadbc  ldr     r1, [r1]
000dadbe  ldr     r0, [r6, r3]
000dadc0  blx     #0xddbfc ; -> objc_msgSend
000dadc4  ldr     r0, [pc, #0xf0]
000dadc6  ldr     r1, [pc, #0xf4]
000dadc8  ldr     r5, [r4]
000dadca  add     r0, pc ; -> 0x000fdbec  
000dadcc  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000dadce  ldr     r0, [r0]
000dadd0  ldr     r1, [r1]
000dadd2  blx     #0xddbfc ; -> objc_msgSend
000dadd6  ldr     r1, [pc, #0xe8]
000dadd8  ldr     r2, [sp, #0x28]
000dadda  mov     r3, r8
000daddc  add     r1, pc ; -> 0x000fdae4  
000dadde  str     r6, [sp]
000dade0  ldr     r1, [r1]
000dade2  blx     #0xddbfc ; -> objc_msgSend
000dade6  ldr     r1, [pc, #0xdc]
000dade8  add     r1, pc ; -> 0x000fcd8c  
000dadea  ldr     r1, [r1]
000dadec  str     r0, [r6, r5]
000dadee  ldr     r0, [r4]
000dadf0  ldr     r0, [r6, r0]
000dadf2  blx     #0xddbfc ; -> objc_msgSend
000dadf6  sub.w   sp, r7, #0x18
000dadfa  pop.w   {r8, sl, fp}
000dadfe  pop     {r4, r5, r6, r7, pc}
000dae00  adds    r2, r0, r5
000dae02  movs    r2, r0
000dae04  subs    r3, #0x78
000dae06  movs    r2, r1
000dae08  adds    r5, #0x30
000dae0a  movs    r2, r1
000dae0c  cmp     r7, #0xfc
000dae0e  movs    r2, r0
000dae10  adds    r4, r4, #7
000dae12  movs    r2, r0
000dae14  ldrb    r2, [r5, #0x17]
000dae16  movs    r2, r1
000dae18  adds    r5, #0xe
000dae1a  movs    r2, r1
000dae1c  ldrb    r2, [r4, #0x15]
000dae1e  movs    r2, r1
000dae20  ldrb    r2, [r0, #0x15]
000dae22  movs    r2, r1
000dae24  subs    r5, #0x8c
000dae26  movs    r2, r1
000dae28  subs    r6, #0x50
000dae2a  movs    r2, r1
000dae2c  ldrb    r6, [r4, #0x14]
000dae2e  movs    r2, r1
000dae30  movs    r3, #0x94
000dae32  movs    r2, r0
000dae34  adds    r4, #0xd2
000dae36  movs    r2, r1
000dae38  adds    r4, #0xc4
000dae3a  movs    r2, r1
000dae3c  adds    r2, r7, r2
000dae3e  movs    r2, r0
000dae40  movs    r0, #0xa8
000dae42  movs    r2, r0
000dae44  str     r6, [r3, r7]
000dae46  movs    r2, r1
000dae48  cmp     r1, #0x5e
000dae4a  movs    r2, r0
000dae4c  ldrb    r0, [r2, #0x16]
000dae4e  movs    r2, r1
000dae50  cmp     r6, #0xbc
000dae52  movs    r2, r0
000dae54  adds    r2, r3, #5
000dae56  movs    r2, r0
000dae58  movs    r7, #0xe
000dae5a  movs    r2, r0
000dae5c  subs    r0, r5, #7
000dae5e  movs    r2, r0
000dae60  cmp     r7, #0x18
000dae62  movs    r2, r0
000dae64  cmp     r6, #0xe
000dae66  movs    r2, r0
000dae68  adds    r4, #0x4c
000dae6a  movs    r2, r1
000dae6c  subs    r4, r2, #0
000dae6e  movs    r2, r0
000dae70  cmp     r6, #0x8c
000dae72  movs    r2, r0
000dae74  subs    r4, r5, #2
000dae76  movs    r2, r0
000dae78  subs    r2, r5, #2
000dae7a  movs    r2, r0
000dae7c  cmp     r6, #0x56
000dae7e  movs    r2, r0
000dae80  asrs    r2, r3, #0x1f
000dae82  movs    r2, r0
000dae84  cmp     r6, #0x14
000dae86  movs    r2, r0
000dae88  adds    r6, r2, #5
000dae8a  movs    r2, r0
000dae8c  ldrb    r0, [r5, #0x11]
000dae8e  movs    r2, r1
000dae90  cmp     r0, #0x84
000dae92  movs    r2, r0
000dae94  cmp     r6, #0x82
000dae96  movs    r2, r0
000dae98  cmp     r5, #0x78
000dae9a  movs    r2, r0
000dae9c  adds    r2, r0, #6
000dae9e  movs    r2, r0
000daea0  cmp     r5, #0xfa
000daea2  movs    r2, r0
000daea4  subs    r2, r3, #0
000daea6  movs    r2, r0
000daea8  subs    r0, r3, #0
000daeaa  movs    r2, r0
000daeac  cmp     r5, #0xc4
000daeae  movs    r2, r0
000daeb0  asrs    r2, r3, #0x1d
000daeb2  movs    r2, r0
000daeb4  subs    r0, r0, r7
000daeb6  movs    r2, r0
000daeb8  cmp     r6, #0x1e
000daeba  movs    r2, r0
000daebc  subs    r4, r6, r6
000daebe  movs    r2, r0
000daec0  cmp     r5, #4
000daec2  movs    r2, r0
000daec4  subs    r0, r4, #6
000daec6  movs    r2, r0
