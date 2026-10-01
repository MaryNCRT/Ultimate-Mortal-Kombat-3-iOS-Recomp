========================================================================
-[FBLoginDialog dealloc]  0x00085258  92 bytes   FBLoginDialog.m
========================================================================

00085258  push    {r4, r5, r7, lr}
0008525a  add     r7, sp, #8
0008525c  sub     sp, #8
0008525e  ldr     r4, [pc, #0x40]
00085260  ldr     r1, [pc, #0x40]
00085262  mov     r5, r0
00085264  add     r4, pc ; -> 0x000f5520  OBJC_IVAR_$_FBLoginDialog._getSessionRequest
00085266  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
00085268  ldr     r3, [r4]
0008526a  movs    r2, #0
0008526c  ldr     r1, [r1]
0008526e  ldr     r0, [r0, r3]
00085270  blx     #0xddbfc ; -> objc_msgSend
00085274  ldr     r1, [pc, #0x30]
00085276  ldr     r3, [r4]
00085278  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
0008527a  ldr     r0, [r5, r3]
0008527c  ldr     r1, [r1]
0008527e  blx     #0xddbfc ; -> objc_msgSend
00085282  ldr     r3, [pc, #0x28]
00085284  ldr     r1, [pc, #0x28]
00085286  mov     r0, sp
00085288  add     r3, pc ; -> 0x000fdd40  
0008528a  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
0008528c  ldr     r3, [r3]
0008528e  ldr     r1, [r1]
00085290  str     r5, [sp]
00085292  str     r3, [sp, #4]
00085294  blx     #0xddc08 ; -> objc_msgSendSuper2
00085298  sub.w   sp, r7, #8
0008529c  pop     {r4, r5, r7, pc}
0008529e  nop     
000852a0  lsls    r0, r7, #0xa
000852a2  movs    r7, r0
000852a4  ldrb    r6, [r1, #8]
000852a6  movs    r7, r0
000852a8  strb    r0, [r0, #0x1c]
000852aa  movs    r7, r0
000852ac  ldrh    r4, [r6, #0x14]
000852ae  movs    r7, r0
000852b0  strb    r2, [r2, #0x1c]
000852b2  movs    r7, r0
