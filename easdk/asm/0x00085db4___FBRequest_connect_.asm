========================================================================
-[FBRequest connect]  0x00085db4  472 bytes   FBRequest.m
========================================================================

00085db4  push    {r4, r5, r6, r7, lr}
00085db6  add     r7, sp, #0xc
00085db8  sub     sp, #8
00085dba  ldr     r1, [pc, #0x150]
00085dbc  ldr     r4, [pc, #0x150]
00085dbe  mov     r5, r0
00085dc0  add     r1, pc ; -> 0x000fce3c  '(L\x0e'
00085dc2  add     r4, pc ; -> 0x000f59c4  OBJC_IVAR_$_FBRequest._delegate
00085dc4  ldr     r6, [r1]
00085dc6  ldr     r1, [pc, #0x14c]
00085dc8  ldr     r3, [r4]
00085dca  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
00085dcc  mov     r2, r6
00085dce  ldr     r0, [r0, r3]
00085dd0  ldr     r1, [r1]
00085dd2  blx     #0xddbfc ; -> objc_msgSend
00085dd6  tst.w   r0, #0xff
00085dda  bne.w   #0x85eee
00085dde  ldr     r3, [pc, #0x138]
00085de0  add     r3, pc ; -> 0x000f59cc  OBJC_IVAR_$_FBRequest._method
00085de2  ldr     r3, [r3]
00085de4  ldr     r3, [r5, r3]
00085de6  cmp     r3, #0
00085de8  beq.w   #0x85efc
00085dec  ldr.w   r3, [pc, #0x12c]
00085df0  add     r3, pc ; -> 0x000f59c8  OBJC_IVAR_$_FBRequest._url
00085df2  ldr     r0, [r3]
00085df4  ldr     r2, [r5, r0]
00085df6  ldr.w   r0, [pc, #0x128]
00085dfa  ldr     r1, [pc, #0x128]
00085dfc  add     r0, pc ; -> 0x000fdbe4  
00085dfe  add     r1, pc ; -> 0x000fce34  
00085e00  ldr     r6, [r0]
00085e02  ldr     r4, [r1]
00085e04  ldr     r0, [pc, #0x120]
00085e06  ldr     r1, [pc, #0x124]
00085e08  add     r0, pc ; -> 0x000fdb64  
00085e0a  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
00085e0c  ldr     r0, [r0]
00085e0e  ldr     r1, [r1]
00085e10  blx     #0xddbfc ; -> objc_msgSend
00085e14  ldr     r1, [pc, #0x118]
00085e16  movs    r3, #1
00085e18  mov     r2, r0
00085e1a  movs    r0, #0
00085e1c  stm.w   sp, {r0, r1}
00085e20  mov     r1, r4
00085e22  mov     r0, r6
00085e24  blx     #0xddbfc ; -> objc_msgSend
00085e28  ldr     r1, [pc, #0x108]
00085e2a  ldr     r2, [pc, #0x10c]
00085e2c  ldr     r3, [pc, #0x10c]
00085e2e  add     r1, pc ; -> 0x000fcbdc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x264
00085e30  add     r2, pc ; -> 0x0017d9f4  kUserAgent
00085e32  ldr     r4, [r1]
00085e34  add     r3, pc ; -> 0x0017eb54  
00085e36  ldr     r2, [r2]
00085e38  mov     r1, r4
00085e3a  mov     r6, r0
00085e3c  blx     #0xddbfc ; -> objc_msgSend
00085e40  ldr     r3, [pc, #0xfc]
00085e42  add     r3, pc ; -> 0x000f59cc  OBJC_IVAR_$_FBRequest._method
00085e44  ldr     r3, [r3]
00085e46  ldr     r3, [r5, r3]
00085e48  cmp     r3, #0
00085e4a  beq     #0x85ea0
00085e4c  ldr     r1, [pc, #0xf4]
00085e4e  ldr     r2, [pc, #0xf8]
00085e50  mov     r0, r6
00085e52  add     r1, pc ; -> 0x000fcbe0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x268
00085e54  add     r2, pc ; -> 0x0017e7a4  
00085e56  ldr     r1, [r1]
00085e58  blx     #0xddbfc ; -> objc_msgSend
00085e5c  ldr     r0, [pc, #0xec]
00085e5e  ldr     r1, [pc, #0xf0]
00085e60  ldr     r3, [pc, #0xf0]
00085e62  ldr     r2, [pc, #0xf4]
00085e64  add     r0, pc ; -> 0x000fdb5c  
00085e66  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00085e68  add     r3, pc ; -> 0x0017d9f0  kStringBoundary
00085e6a  add     r2, pc ; -> 0x0017e7b4  
00085e6c  ldr     r1, [r1]
00085e6e  ldr     r3, [r3]
00085e70  ldr     r0, [r0]
00085e72  blx     #0xddbfc ; -> objc_msgSend
00085e76  ldr     r3, [pc, #0xe4]
00085e78  mov     r1, r4
00085e7a  add     r3, pc ; -> 0x0017e7c4  
00085e7c  mov     r2, r0
00085e7e  mov     r0, r6
00085e80  blx     #0xddbfc ; -> objc_msgSend
00085e84  ldr     r1, [pc, #0xd8]
00085e86  mov     r0, r5
00085e88  add     r1, pc ; -> 0x000fcbd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x25c
00085e8a  ldr     r4, [r1]
00085e8c  ldr     r1, [pc, #0xd4]
00085e8e  add     r1, pc ; -> 0x000fce30  
00085e90  ldr     r1, [r1]
00085e92  blx     #0xddbfc ; -> objc_msgSend
00085e96  mov     r1, r4
00085e98  mov     r2, r0
00085e9a  mov     r0, r6
00085e9c  blx     #0xddbfc ; -> objc_msgSend
00085ea0  ldr     r0, [pc, #0xc4]
00085ea2  ldr     r1, [pc, #0xc8]
00085ea4  ldr     r3, [pc, #0xc8]
00085ea6  add     r0, pc ; -> 0x000fdbb4  
00085ea8  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
00085eaa  add     r3, pc ; -> 0x000f59d8  OBJC_IVAR_$_FBRequest._timestamp
00085eac  ldr     r1, [r1]
00085eae  ldr     r0, [r0]
00085eb0  ldr     r4, [r3]
00085eb2  blx     #0xddbfc ; -> objc_msgSend
00085eb6  ldr     r1, [pc, #0xbc]
00085eb8  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00085eba  ldr     r1, [r1]
00085ebc  blx     #0xddbfc ; -> objc_msgSend
00085ec0  ldr     r1, [pc, #0xb4]
00085ec2  ldr     r3, [pc, #0xb8]
00085ec4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00085ec6  add     r3, pc ; -> 0x000f59dc  OBJC_IVAR_$_FBRequest._connection
00085ec8  ldr     r1, [r1]
00085eca  str     r0, [r5, r4]
00085ecc  ldr     r0, [pc, #0xb0]
00085ece  ldr     r4, [r3]
00085ed0  add     r0, pc ; -> 0x000fdc08  
00085ed2  ldr     r0, [r0]
00085ed4  blx     #0xddbfc ; -> objc_msgSend
00085ed8  ldr     r1, [pc, #0xa8]
00085eda  mov     r2, r6
00085edc  mov     r3, r5
00085ede  add     r1, pc ; -> 0x000fce2c  
00085ee0  ldr     r1, [r1]
00085ee2  blx     #0xddbfc ; -> objc_msgSend
00085ee6  str     r0, [r5, r4]
00085ee8  sub.w   sp, r7, #0xc
00085eec  pop     {r4, r5, r6, r7, pc}
00085eee  ldr     r3, [r4]
00085ef0  mov     r1, r6
00085ef2  mov     r2, r5
00085ef4  ldr     r0, [r5, r3]
00085ef6  blx     #0xddbfc ; -> objc_msgSend
00085efa  b       #0x85dde
00085efc  ldr     r1, [pc, #0x88]
00085efe  mov     r0, r5
00085f00  add     r1, pc ; -> 0x000fce38  ');\x0e'
00085f02  ldr     r1, [r1]
00085f04  blx     #0xddbfc ; -> objc_msgSend
00085f08  mov     r2, r0
00085f0a  b       #0x85df6
00085f0c  strb    r0, [r7, #1]
00085f0e  movs    r7, r0
