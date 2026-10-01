========================================================================
-[FBLoginButton touchUpInside]  0x00084994  140 bytes   FBLoginButton.m
========================================================================

00084994  push    {r4, r5, r7, lr}
00084996  add     r7, sp, #8
00084998  ldr     r4, [pc, #0x60]
0008499a  ldr     r1, [pc, #0x64]
0008499c  mov     r5, r0
0008499e  add     r4, pc ; -> 0x000f53e8  OBJC_IVAR_$_FBLoginButton._session
000849a0  add     r1, pc ; -> 0x000fcda4  
000849a2  ldr     r3, [r4]
000849a4  ldr     r1, [r1]
000849a6  ldr     r0, [r0, r3]
000849a8  blx     #0xddbfc ; -> objc_msgSend
000849ac  tst.w   r0, #0xff
000849b0  beq     #0x849c2
000849b2  ldr     r1, [pc, #0x50]
000849b4  ldr     r0, [r4]
000849b6  add     r1, pc ; -> 0x000fcd90  
000849b8  ldr     r0, [r5, r0]
000849ba  ldr     r1, [r1]
000849bc  blx     #0xddbfc ; -> objc_msgSend
000849c0  pop     {r4, r5, r7, pc}
000849c2  ldr     r0, [pc, #0x44]
000849c4  ldr     r1, [pc, #0x44]
000849c6  add     r0, pc ; -> 0x000fdbec  
000849c8  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000849ca  ldr     r0, [r0]
000849cc  ldr     r1, [r1]
000849ce  blx     #0xddbfc ; -> objc_msgSend
000849d2  ldr     r3, [pc, #0x3c]
000849d4  ldr     r1, [pc, #0x3c]
000849d6  add     r3, pc ; -> 0x000f53e8  OBJC_IVAR_$_FBLoginButton._session
000849d8  add     r1, pc ; -> 0x000fccd8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x360
000849da  ldr     r3, [r3]
000849dc  ldr     r1, [r1]
000849de  ldr     r2, [r5, r3]
000849e0  blx     #0xddbfc ; -> objc_msgSend
000849e4  ldr     r1, [pc, #0x30]
000849e6  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000849e8  ldr     r1, [r1]
000849ea  blx     #0xddbfc ; -> objc_msgSend
000849ee  ldr     r1, [pc, #0x2c]
000849f0  add     r1, pc ; -> 0x000fcd8c  
000849f2  ldr     r1, [r1]
000849f4  blx     #0xddbfc ; -> objc_msgSend
000849f8  b       #0x849c0
000849fa  nop     
000849fc  lsrs    r6, r0, #9
000849fe  movs    r7, r0
00084a00  strh    r0, [r0, #0x20]
00084a02  movs    r7, r0
00084a04  strh    r6, [r2, #0x1e]
00084a06  movs    r7, r0
00084a08  str     r2, [sp, #0x88]
00084a0a  movs    r7, r0
00084a0c  ldrb    r0, [r7, #0x1e]
00084a0e  movs    r7, r0
00084a10  lsrs    r6, r1, #8
00084a12  movs    r7, r0
00084a14  strh    r4, [r7, #0x16]
00084a16  movs    r7, r0
00084a18  strh    r6, [r5, #2]
00084a1a  movs    r7, r0
00084a1c  strh    r0, [r3, #0x1c]
00084a1e  movs    r7, r0
