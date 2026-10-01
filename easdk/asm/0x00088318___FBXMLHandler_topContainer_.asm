========================================================================
-[FBXMLHandler topContainer]  0x00088318  200 bytes   FBXMLHandler.m
========================================================================

00088318  push    {r4, r5, r6, r7, lr}
0008831a  add     r7, sp, #0xc
0008831c  push.w  {r8, sl}
00088320  ldr     r3, [pc, #0x98]
00088322  ldr     r1, [pc, #0x9c]
00088324  mov     r8, r0
00088326  add     r3, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
00088328  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
0008832a  ldr     r3, [r3]
0008832c  ldr     r6, [r1]
0008832e  ldr     r0, [r0, r3]
00088330  mov     r1, r6
00088332  blx     #0xddbfc ; -> objc_msgSend
00088336  cmp     r0, #1
00088338  bls     #0x8837e
0008833a  ldr.w   sl, [pc, #0x88]
0008833e  ldr     r1, [pc, #0x88]
00088340  add     sl, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
00088342  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00088344  ldr.w   r0, [sl]
00088348  ldr     r5, [r1]
0008834a  mov     r1, r6
0008834c  ldr.w   r4, [r8, r0]
00088350  mov     r0, r4
00088352  blx     #0xddbfc ; -> objc_msgSend
00088356  mov     r1, r5
00088358  subs    r2, r0, #2
0008835a  mov     r0, r4
0008835c  blx     #0xddbfc ; -> objc_msgSend
00088360  ldr     r1, [pc, #0x68]
00088362  add     r1, pc ; -> 0x000fcf34  
00088364  ldr     r1, [r1]
00088366  mov     r4, r0
00088368  ldr     r0, [pc, #0x64]
0008836a  add     r0, pc ; -> 0x000fdc0c  
0008836c  ldr     r0, [r0]
0008836e  blx     #0xddbfc ; -> objc_msgSend
00088372  cmp     r4, r0
00088374  beq     #0x88382
00088376  mov     r0, r4
00088378  pop.w   {r8, sl}
0008837c  pop     {r4, r5, r6, r7, pc}
0008837e  movs    r4, #0
00088380  b       #0x88376
00088382  ldr     r0, [pc, #0x50]
00088384  ldr     r1, [pc, #0x50]
00088386  add     r0, pc ; -> 0x000fdbf4  
00088388  add     r1, pc ; -> 0x000fcf30  '\x07G\x0e'
0008838a  ldr     r0, [r0]
0008838c  ldr     r1, [r1]
0008838e  blx     #0xddbfc ; -> objc_msgSend
00088392  ldr     r1, [pc, #0x48]
00088394  add     r1, pc ; -> 0x000fcf2c  
00088396  mov     r4, r0
00088398  ldr.w   r0, [sl]
0008839c  ldr.w   r5, [r8, r0]
000883a0  ldr.w   r8, [r1]
000883a4  mov     r1, r6
000883a6  mov     r0, r5
000883a8  blx     #0xddbfc ; -> objc_msgSend
000883ac  mov     r1, r8
000883ae  mov     r3, r4
000883b0  subs    r2, r0, #2
000883b2  mov     r0, r5
000883b4  blx     #0xddbfc ; -> objc_msgSend
000883b8  b       #0x88376
000883ba  nop     
000883bc  ble     #0x883d4
000883be  movs    r6, r0
000883c0  bxns    sl
000883c2  movs    r7, r0
000883c4  bgt     #0x883a8
000883c6  movs    r6, r0
000883c8  bxns    r6
000883ca  movs    r7, r0
000883cc  ldr     r3, [pc, #0x338]
000883ce  movs    r7, r0
000883d0  ldr     r6, [r3, r2]
000883d2  movs    r7, r0
000883d4  ldr     r2, [r5, r1]
000883d6  movs    r7, r0
000883d8  ldr     r3, [pc, #0x290]
000883da  movs    r7, r0
000883dc  ldr     r3, [pc, #0x250]
000883de  movs    r7, r0
