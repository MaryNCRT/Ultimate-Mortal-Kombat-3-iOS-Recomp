========================================================================
-[FBDialog updateWebOrientation]  0x00083028  124 bytes   FBDialog.m
========================================================================

00083028  push    {r4, r7, lr}
0008302a  add     r7, sp, #4
0008302c  ldr     r1, [pc, #0x50]
0008302e  mov     r4, r0
00083030  ldr     r0, [pc, #0x50]
00083032  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
00083034  add     r0, pc ; -> 0x000fdb80  
00083036  ldr     r1, [r1]
00083038  ldr     r0, [r0]
0008303a  blx     #0xddbfc ; -> objc_msgSend
0008303e  ldr     r1, [pc, #0x48]
00083040  add     r1, pc ; -> 0x000fcd58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3e0
00083042  ldr     r1, [r1]
00083044  blx     #0xddbfc ; -> objc_msgSend
00083048  subs    r0, #3
0008304a  cmp     r0, #1
0008304c  bls     #0x83066
0008304e  ldr     r3, [pc, #0x3c]
00083050  ldr     r1, [pc, #0x3c]
00083052  ldr     r2, [pc, #0x40]
00083054  add     r3, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
00083056  add     r1, pc ; -> 0x000fcd40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c8
00083058  ldr     r0, [r3]
0008305a  add     r2, pc ; -> 0x0017e854  
0008305c  ldr     r1, [r1]
0008305e  ldr     r0, [r4, r0]
00083060  blx     #0xddbfc ; -> objc_msgSend
00083064  pop     {r4, r7, pc}
00083066  ldr     r3, [pc, #0x30]
00083068  ldr     r1, [pc, #0x30]
0008306a  ldr     r2, [pc, #0x34]
0008306c  add     r3, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
0008306e  add     r1, pc ; -> 0x000fcd40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c8
00083070  ldr     r0, [r3]
00083072  add     r2, pc ; -> 0x0017e844  
00083074  ldr     r1, [r1]
00083076  ldr     r0, [r4, r0]
00083078  blx     #0xddbfc ; -> objc_msgSend
0008307c  b       #0x83064
0008307e  nop     
00083080  ldr     r2, [sp, #0x328]
00083082  movs    r7, r0
00083084  add     r3, sp, #0x120
00083086  movs    r7, r0
00083088  ldr     r5, [sp, #0x50]
0008308a  movs    r7, r0
0008308c  movs    r1, #0x70
0008308e  movs    r7, r0
00083090  ldr     r4, [sp, #0x398]
00083092  movs    r7, r0
