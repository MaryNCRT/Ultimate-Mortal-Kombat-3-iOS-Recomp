========================================================================
-[FBLoginButton setSession  0x0008470c  148 bytes   FBLoginButton.m
========================================================================

0008470c  push    {r4, r5, r6, r7, lr}
0008470e  add     r7, sp, #0xc
00084710  push.w  {r8, sl}
00084714  ldr     r6, [pc, #0x6c]
00084716  mov     r4, r0
00084718  mov     r8, r2
0008471a  add     r6, pc ; -> 0x000f53e8  OBJC_IVAR_$_FBLoginButton._session
0008471c  ldr     r0, [r6]
0008471e  ldr     r0, [r4, r0]
00084720  cmp     r0, r2
00084722  beq     #0x8477e
00084724  ldr     r1, [pc, #0x60]
00084726  add     r1, pc ; -> 0x000fcd78  'T2\x0e'
00084728  ldr.w   sl, [r1]
0008472c  mov     r1, sl
0008472e  blx     #0xddbfc ; -> objc_msgSend
00084732  ldr     r1, [pc, #0x58]
00084734  mov     r2, r4
00084736  add     r1, pc ; -> 0x000fcd7c  'lz\x0e'
00084738  ldr     r1, [r1]
0008473a  blx     #0xddbfc ; -> objc_msgSend
0008473e  ldr     r1, [pc, #0x50]
00084740  ldr     r3, [r6]
00084742  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00084744  ldr     r0, [r4, r3]
00084746  ldr     r1, [r1]
00084748  blx     #0xddbfc ; -> objc_msgSend
0008474c  ldr     r1, [pc, #0x44]
0008474e  mov     r0, r8
00084750  ldr     r5, [r6]
00084752  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00084754  ldr     r1, [r1]
00084756  blx     #0xddbfc ; -> objc_msgSend
0008475a  mov     r1, sl
0008475c  str     r0, [r4, r5]
0008475e  ldr     r3, [r6]
00084760  ldr     r0, [r4, r3]
00084762  blx     #0xddbfc ; -> objc_msgSend
00084766  ldr     r1, [pc, #0x30]
00084768  mov     r2, r4
0008476a  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
0008476c  ldr     r1, [r1]
0008476e  blx     #0xddbfc ; -> objc_msgSend
00084772  ldr     r1, [pc, #0x28]
00084774  mov     r0, r4
00084776  add     r1, pc ; -> 0x000fcd68  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3f0
00084778  ldr     r1, [r1]
0008477a  blx     #0xddbfc ; -> objc_msgSend
0008477e  pop.w   {r8, sl}
00084782  pop     {r4, r5, r6, r7, pc}
00084784  lsrs    r2, r1, #0x13
00084786  movs    r7, r0
00084788  strh    r6, [r1, #0x32]
0008478a  movs    r7, r0
0008478c  strh    r2, [r0, #0x32]
0008478e  movs    r7, r0
00084790  strh    r6, [r6, #0x10]
00084792  movs    r7, r0
00084794  strh    r2, [r7, #0x2a]
00084796  movs    r7, r0
00084798  strh    r6, [r2, #0x18]
0008479a  movs    r7, r0
0008479c  strh    r6, [r5, #0x2e]
0008479e  movs    r7, r0
