========================================================================
-[FBSession dealloc]  0x0008734c  236 bytes   FBSession.m
========================================================================

0008734c  push    {r4, r5, r7, lr}
0008734e  add     r7, sp, #8
00087350  sub     sp, #8
00087352  ldr     r3, [pc, #0xb0]
00087354  mov     r5, r0
00087356  add     r3, pc ; -> 0x006bc128  sharedSession
00087358  ldr     r2, [r3]
0008735a  cmp     r2, r0
0008735c  beq     #0x873fe
0008735e  ldr     r3, [pc, #0xa8]
00087360  ldr     r1, [pc, #0xa8]
00087362  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087364  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00087366  ldr     r3, [r3]
00087368  ldr     r4, [r1]
0008736a  ldr     r0, [r5, r3]
0008736c  mov     r1, r4
0008736e  blx     #0xddbfc ; -> objc_msgSend
00087372  ldr     r3, [pc, #0x9c]
00087374  mov     r1, r4
00087376  add     r3, pc ; -> 0x000f5d24  OBJC_IVAR_$_FBSession._requestQueue
00087378  ldr     r3, [r3]
0008737a  ldr     r0, [r5, r3]
0008737c  blx     #0xddbfc ; -> objc_msgSend
00087380  ldr     r3, [pc, #0x90]
00087382  mov     r1, r4
00087384  add     r3, pc ; -> 0x000f5d08  OBJC_IVAR_$_FBSession._apiKey
00087386  ldr     r3, [r3]
00087388  ldr     r0, [r5, r3]
0008738a  blx     #0xddbfc ; -> objc_msgSend
0008738e  ldr     r3, [pc, #0x88]
00087390  mov     r1, r4
00087392  add     r3, pc ; -> 0x000f5d0c  OBJC_IVAR_$_FBSession._apiSecret
00087394  ldr     r3, [r3]
00087396  ldr     r0, [r5, r3]
00087398  blx     #0xddbfc ; -> objc_msgSend
0008739c  ldr     r3, [pc, #0x7c]
0008739e  mov     r1, r4
000873a0  add     r3, pc ; -> 0x000f5d10  OBJC_IVAR_$_FBSession._getSessionProxy
000873a2  ldr     r3, [r3]
000873a4  ldr     r0, [r5, r3]
000873a6  blx     #0xddbfc ; -> objc_msgSend
000873aa  ldr     r3, [pc, #0x74]
000873ac  mov     r1, r4
000873ae  add     r3, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
000873b0  ldr     r3, [r3]
000873b2  ldr     r0, [r5, r3]
000873b4  blx     #0xddbfc ; -> objc_msgSend
000873b8  ldr     r3, [pc, #0x68]
000873ba  mov     r1, r4
000873bc  add     r3, pc ; -> 0x000f5d1c  OBJC_IVAR_$_FBSession._sessionSecret
000873be  ldr     r3, [r3]
000873c0  ldr     r0, [r5, r3]
000873c2  blx     #0xddbfc ; -> objc_msgSend
000873c6  ldr     r3, [pc, #0x60]
000873c8  mov     r1, r4
000873ca  add     r3, pc ; -> 0x000f5d20  OBJC_IVAR_$_FBSession._expirationDate
000873cc  ldr     r3, [r3]
000873ce  ldr     r0, [r5, r3]
000873d0  blx     #0xddbfc ; -> objc_msgSend
000873d4  ldr     r3, [pc, #0x54]
000873d6  mov     r1, r4
000873d8  add     r3, pc ; -> 0x000f5d28  OBJC_IVAR_$_FBSession._lastRequestTime
000873da  ldr     r3, [r3]
000873dc  ldr     r0, [r5, r3]
000873de  blx     #0xddbfc ; -> objc_msgSend
000873e2  ldr     r3, [pc, #0x4c]
000873e4  ldr     r1, [pc, #0x4c]
000873e6  mov     r0, sp
000873e8  add     r3, pc ; -> 0x000fdd4c  
000873ea  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000873ec  ldr     r3, [r3]
000873ee  ldr     r1, [r1]
000873f0  str     r5, [sp]
000873f2  str     r3, [sp, #4]
000873f4  blx     #0xddc08 ; -> objc_msgSendSuper2
000873f8  sub.w   sp, r7, #8
000873fc  pop     {r4, r5, r7, pc}
000873fe  movs    r2, #0
00087400  str     r2, [r3]
00087402  b       #0x8735e
00087404  ldr     r5, [pc, #0x338]
00087406  lsls    r3, r4, #1
