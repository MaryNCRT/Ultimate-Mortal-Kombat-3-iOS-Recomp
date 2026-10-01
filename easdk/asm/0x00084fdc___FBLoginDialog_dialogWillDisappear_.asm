========================================================================
-[FBLoginDialog dialogWillDisappear]  0x00084fdc  124 bytes   FBLoginDialog.m
========================================================================

00084fdc  push    {r4, r5, r7, lr}
00084fde  add     r7, sp, #8
00084fe0  ldr     r3, [pc, #0x54]
00084fe2  ldr     r1, [pc, #0x58]
00084fe4  ldr     r2, [pc, #0x58]
00084fe6  add     r3, pc ; -> 0x000f339c  OBJC_IVAR_$_FBDialog._webView
00084fe8  add     r1, pc ; -> 0x000fcd40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c8
00084fea  ldr     r3, [r3]
00084fec  mov     r4, r0
00084fee  add     r2, pc ; -> 0x0017e9b4  
00084ff0  ldr     r1, [r1]
00084ff2  ldr     r3, [r3]
00084ff4  ldr     r0, [r0, r3]
00084ff6  blx     #0xddbfc ; -> objc_msgSend
00084ffa  ldr     r3, [pc, #0x48]
00084ffc  ldr     r1, [pc, #0x48]
00084ffe  add     r3, pc ; -> 0x000f5520  OBJC_IVAR_$_FBLoginDialog._getSessionRequest
00085000  add     r1, pc ; -> 0x000fcc9c  'p$\x0e'
00085002  ldr     r3, [r3]
00085004  ldr     r1, [r1]
00085006  ldr     r0, [r4, r3]
00085008  blx     #0xddbfc ; -> objc_msgSend
0008500c  ldr     r3, [pc, #0x3c]
0008500e  ldr     r1, [pc, #0x40]
00085010  add     r3, pc ; -> 0x000f342c  OBJC_IVAR_$_FBDialog._session
00085012  add     r1, pc ; -> 0x000fcda4  
00085014  ldr     r5, [r3]
00085016  ldr     r1, [r1]
00085018  ldr     r3, [r5]
0008501a  ldr     r0, [r4, r3]
0008501c  blx     #0xddbfc ; -> objc_msgSend
00085020  tst.w   r0, #0xff
00085024  bne     #0x85034
00085026  ldr     r1, [pc, #0x2c]
00085028  ldr     r0, [r5]
0008502a  add     r1, pc ; -> 0x000fcdcc  
0008502c  ldr     r0, [r4, r0]
0008502e  ldr     r1, [r1]
00085030  blx     #0xddbfc ; -> objc_msgSend
00085034  pop     {r4, r5, r7, pc}
00085036  nop     
00085038  b       #0x857a0
0008503a  movs    r6, r0
0008503c  ldrb    r4, [r2, #0x15]
0008503e  movs    r7, r0
00085040  ldr     r1, [sp, #0x308]
00085042  movs    r7, r1
00085044  lsls    r6, r3, #0x14
00085046  movs    r7, r0
00085048  ldrb    r0, [r3, #0x12]
0008504a  movs    r7, r0
0008504c  b       #0x84880
0008504e  movs    r6, r0
00085050  ldrb    r6, [r1, #0x16]
00085052  movs    r7, r0
00085054  ldrb    r6, [r3, #0x16]
00085056  movs    r7, r0
