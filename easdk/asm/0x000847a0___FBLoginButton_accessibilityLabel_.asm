========================================================================
-[FBLoginButton accessibilityLabel]  0x000847a0  164 bytes   FBLoginButton.m
========================================================================

000847a0  push    {r4, r7, lr}
000847a2  add     r7, sp, #4
000847a4  sub     sp, #4
000847a6  ldr     r3, [pc, #0x6c]
000847a8  ldr     r1, [pc, #0x6c]
000847aa  add     r3, pc ; -> 0x000f53e8  OBJC_IVAR_$_FBLoginButton._session
000847ac  add     r1, pc ; -> 0x000fcda4  
000847ae  ldr     r3, [r3]
000847b0  ldr     r1, [r1]
000847b2  ldr     r0, [r0, r3]
000847b4  blx     #0xddbfc ; -> objc_msgSend
000847b8  uxtb    r4, r0
000847ba  cbz     r4, #0x847ec
000847bc  ldr     r0, [pc, #0x5c]
000847be  ldr     r1, [pc, #0x60]
000847c0  add     r0, pc ; -> 0x000fdb60  
000847c2  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000847c4  ldr     r0, [r0]
000847c6  ldr     r1, [r1]
000847c8  blx     #0xddbfc ; -> objc_msgSend
000847cc  ldr     r1, [pc, #0x54]
000847ce  ldr     r2, [pc, #0x58]
000847d0  ldr     r3, [pc, #0x58]
000847d2  add     r1, pc ; -> 0x000fcd60  '&2\x0e'
000847d4  add     r2, pc ; -> 0x0017e904  
000847d6  add     r3, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000847d8  ldr     r1, [r1]
000847da  mov.w   ip, #0
000847de  str.w   ip, [sp]
000847e2  blx     #0xddbfc ; -> objc_msgSend
000847e6  sub.w   sp, r7, #4
000847ea  pop     {r4, r7, pc}
000847ec  ldr     r0, [pc, #0x40]
000847ee  ldr     r1, [pc, #0x44]
000847f0  add     r0, pc ; -> 0x000fdb60  
000847f2  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000847f4  ldr     r0, [r0]
000847f6  ldr     r1, [r1]
000847f8  blx     #0xddbfc ; -> objc_msgSend
000847fc  ldr     r1, [pc, #0x38]
000847fe  ldr     r2, [pc, #0x3c]
00084800  ldr     r3, [pc, #0x3c]
00084802  add     r1, pc ; -> 0x000fcd60  '&2\x0e'
00084804  add     r2, pc ; -> 0x0017e8f4  
00084806  add     r3, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
00084808  ldr     r1, [r1]
0008480a  str     r4, [sp]
0008480c  blx     #0xddbfc ; -> objc_msgSend
00084810  b       #0x847e6
00084812  nop     
00084814  lsrs    r2, r7, #0x10
00084816  movs    r7, r0
00084818  strh    r4, [r6, #0x2e]
0008481a  movs    r7, r0
0008481c  str     r3, [sp, #0x270]
0008481e  movs    r7, r0
00084820  strh    r6, [r2, #0x12]
00084822  movs    r7, r0
00084824  strh    r2, [r1, #0x2c]
00084826  movs    r7, r0
00084828  adr     r1, #0xb0
0008482a  movs    r7, r1
0008482c  ldr     r3, [sp, #0x68]
0008482e  movs    r7, r1
00084830  str     r3, [sp, #0x1b0]
00084832  movs    r7, r0
00084834  strh    r6, [r4, #0x10]
00084836  movs    r7, r0
00084838  strh    r2, [r3, #0x2a]
0008483a  movs    r7, r0
0008483c  adr     r0, #0x3b0
0008483e  movs    r7, r1
00084840  ldr     r2, [sp, #0x3a8]
00084842  movs    r7, r1
