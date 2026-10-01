========================================================================
-[FBXMLHandler topObject  0x000883e0  176 bytes   FBXMLHandler.m
========================================================================

000883e0  push    {r4, r5, r6, r7, lr}
000883e2  add     r7, sp, #0xc
000883e4  push.w  {r8, sl, fp}
000883e8  ldr     r1, [pc, #0x84]
000883ea  ldr     r6, [pc, #0x88]
000883ec  mov     sl, r0
000883ee  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000883f0  add     r6, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
000883f2  ldr     r5, [r1]
000883f4  ldr     r1, [pc, #0x80]
000883f6  ldr     r0, [r6]
000883f8  sxtb.w  fp, r2
000883fc  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000883fe  ldr.w   r4, [sl, r0]
00088402  ldr.w   r8, [r1]
00088406  mov     r0, r4
00088408  mov     r1, r8
0008840a  blx     #0xddbfc ; -> objc_msgSend
0008840e  mov     r1, r5
00088410  subs    r2, r0, #1
00088412  mov     r0, r4
00088414  blx     #0xddbfc ; -> objc_msgSend
00088418  ldr     r1, [pc, #0x60]
0008841a  add     r1, pc ; -> 0x000fcf34  
0008841c  ldr     r1, [r1]
0008841e  mov     r4, r0
00088420  ldr     r0, [pc, #0x5c]
00088422  add     r0, pc ; -> 0x000fdc0c  
00088424  ldr     r0, [r0]
00088426  blx     #0xddbfc ; -> objc_msgSend
0008842a  cmp     r4, r0
0008842c  beq     #0x88436
0008842e  mov     r0, r4
00088430  pop.w   {r8, sl, fp}
00088434  pop     {r4, r5, r6, r7, pc}
00088436  cmp.w   fp, #0
0008843a  beq     #0x8842e
0008843c  ldr     r0, [pc, #0x44]
0008843e  ldr     r1, [pc, #0x48]
00088440  add     r0, pc ; -> 0x000fdbf4  
00088442  add     r1, pc ; -> 0x000fcf30  '\x07G\x0e'
00088444  ldr     r0, [r0]
00088446  ldr     r1, [r1]
00088448  blx     #0xddbfc ; -> objc_msgSend
0008844c  ldr     r1, [pc, #0x3c]
0008844e  add     r1, pc ; -> 0x000fcf2c  
00088450  mov     r4, r0
00088452  ldr     r0, [r6]
00088454  ldr     r6, [r1]
00088456  mov     r1, r8
00088458  ldr.w   r5, [sl, r0]
0008845c  mov     r0, r5
0008845e  blx     #0xddbfc ; -> objc_msgSend
00088462  mov     r1, r6
00088464  mov     r3, r4
00088466  subs    r2, r0, #1
00088468  mov     r0, r5
0008846a  blx     #0xddbfc ; -> objc_msgSend
0008846e  b       #0x8842e
00088470  mov     sl, r1
00088472  movs    r7, r0
00088474  bgt     #0x884f8
00088476  movs    r6, r0
00088478  mov     r8, r0
0008847a  movs    r7, r0
0008847c  ldr     r3, [pc, #0x58]
0008847e  movs    r7, r0
00088480  ldrsb   r6, [r4, r7]
00088482  movs    r7, r0
00088484  ldrsb   r0, [r6, r6]
00088486  movs    r7, r0
00088488  ldr     r2, [pc, #0x3a8]
0008848a  movs    r7, r0
0008848c  ldr     r2, [pc, #0x368]
0008848e  movs    r7, r0
