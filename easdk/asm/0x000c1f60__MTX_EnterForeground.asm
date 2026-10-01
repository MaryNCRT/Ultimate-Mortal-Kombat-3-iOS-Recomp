========================================================================
MTX_EnterForeground  0x000c1f60  520 bytes   EAMTX_Main.mm
========================================================================

000c1f60  push    {r4, r5, r6, r7, lr}
000c1f62  add     r7, sp, #0xc
000c1f64  push.w  {r8, sl, fp}
000c1f68  sub     sp, #8
000c1f6a  ldr     r0, [pc, #0x18c]
000c1f6c  ldr     r1, [pc, #0x18c]
000c1f6e  add     r0, pc ; -> 0x000fdb50  
000c1f70  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000c1f72  ldr     r6, [r0]
000c1f74  ldr     r5, [r1]
000c1f76  mov     r0, r6
000c1f78  mov     r1, r5
000c1f7a  blx     #0xddbfc ; -> objc_msgSend
000c1f7e  ldr     r1, [pc, #0x180]
000c1f80  add     r1, pc ; -> 0x000fd3b0  
000c1f82  ldr     r4, [r1]
000c1f84  ldr     r1, [pc, #0x17c]
000c1f86  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000c1f88  mov     r2, r4
000c1f8a  ldr     r1, [r1]
000c1f8c  blx     #0xddbfc ; -> objc_msgSend
000c1f90  tst.w   r0, #0xff
000c1f94  beq.w   #0xc20ba
000c1f98  mov     r1, r5
000c1f9a  mov     r0, r6
000c1f9c  blx     #0xddbfc ; -> objc_msgSend
000c1fa0  mov     r1, r4
000c1fa2  blx     #0xddbfc ; -> objc_msgSend
000c1fa6  tst.w   r0, #0xff
000c1faa  beq.w   #0xc20ba
000c1fae  ldr     r5, [pc, #0x158]
000c1fb0  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c1fb2  ldr     r0, [r5]
000c1fb4  cmp     r0, #0
000c1fb6  beq     #0xc2056
000c1fb8  ldr     r1, [pc, #0x150]
000c1fba  add     r1, pc ; -> 0x000fd66c  
000c1fbc  ldr     r6, [r1]
000c1fbe  mov     r1, r6
000c1fc0  blx     #0xddbfc ; -> objc_msgSend
000c1fc4  cmp     r0, #0
000c1fc6  beq     #0xc2056
000c1fc8  ldr     r1, [pc, #0x144]
000c1fca  ldr     r0, [r5]
000c1fcc  add     r1, pc ; -> 0x000fd65c  
000c1fce  ldr     r4, [r1]
000c1fd0  mov     r1, r4
000c1fd2  blx     #0xddbfc ; -> objc_msgSend
000c1fd6  cmp     r0, #0
000c1fd8  beq     #0xc2056
000c1fda  mov     r1, r4
000c1fdc  ldr     r0, [r5]
000c1fde  blx     #0xddbfc ; -> objc_msgSend
000c1fe2  ldr     r1, [pc, #0x130]
000c1fe4  ldr     r3, [pc, #0x130]
000c1fe6  ldr     r2, [pc, #0x134]
000c1fe8  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000c1fea  add     r3, pc ; -> 0x0038c110  sessionId
000c1fec  ldr     r4, [r1]
000c1fee  ldr     r1, [pc, #0x130]
000c1ff0  ldr     r3, [r3]
000c1ff2  add     r2, pc ; -> 0x00180ff4  
000c1ff4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c1ff6  ldr.w   sl, [r1]
000c1ffa  str     r3, [sp]
000c1ffc  movw    r3, #0x4e20
000c2000  mov     r1, sl
000c2002  mov     r8, r0
000c2004  ldr     r0, [pc, #0x11c]
000c2006  add     r0, pc ; -> 0x000fdb5c  
000c2008  ldr.w   fp, [r0]
000c200c  mov     r0, fp
000c200e  blx     #0xddbfc ; -> objc_msgSend
000c2012  mov     r1, r4
000c2014  ldr     r4, [pc, #0x110]
000c2016  add     r4, pc ; -> 0x0017e374  kGraphBaseURL+0x244
000c2018  mov     r2, r0
000c201a  mov     r0, r8
000c201c  blx     #0xddbfc ; -> objc_msgSend
000c2020  ldr     r2, [pc, #0x108]
000c2022  mov     r1, r6
000c2024  ldr     r0, [r5]
000c2026  add     r2, pc ; -> 0x0038c114  stepNum
000c2028  ldr     r3, [r2]
000c202a  subs    r3, #1
000c202c  str     r3, [r2]
000c202e  blx     #0xddbfc ; -> objc_msgSend
000c2032  ldr     r1, [pc, #0xfc]
000c2034  ldr     r2, [pc, #0xfc]
000c2036  movw    r3, #0x4e20
000c203a  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000c203c  add     r2, pc ; -> 0x0017e5c4  
000c203e  ldr     r5, [r1]
000c2040  mov     r1, sl
000c2042  mov     r6, r0
000c2044  mov     r0, fp
000c2046  blx     #0xddbfc ; -> objc_msgSend
000c204a  mov     r1, r5
000c204c  mov     r2, r4
000c204e  mov     r3, r0
000c2050  mov     r0, r6
000c2052  blx     #0xddbfc ; -> objc_msgSend
000c2056  ldr     r0, [pc, #0xe0]
000c2058  ldr     r1, [pc, #0xe0]
000c205a  ldr     r4, [pc, #0xe4]
000c205c  add     r0, pc ; -> 0x000fdb5c  
000c205e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2060  ldr.w   r8, [r0]
000c2064  ldr     r6, [r1]
000c2066  ldr     r2, [pc, #0xdc]
000c2068  add     r4, pc ; -> 0x0038c110  sessionId
000c206a  mov     r0, r8
000c206c  add     r2, pc ; -> 0x00181004  
000c206e  ldr     r3, [r4]
000c2070  mov     r1, r6
000c2072  blx     #0xddbfc ; -> objc_msgSend
000c2076  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c207a  bl      #0xbe4ec ; -> Z15generateSessionv
000c207e  ldr     r3, [pc, #0xc8]
000c2080  ldr     r2, [pc, #0xc8]
000c2082  movs    r5, #0
000c2084  add     r3, pc ; -> 0x0038c114  stepNum
000c2086  add     r2, pc ; -> 0x00181014  
000c2088  mov     r1, r6
000c208a  str     r5, [r3]
000c208c  mov     r0, r8
000c208e  ldr     r3, [r4]
000c2090  blx     #0xddbfc ; -> objc_msgSend
000c2094  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c2098  ldr     r0, [pc, #0xb4]
000c209a  ldr     r1, [pc, #0xb8]
000c209c  add     r0, pc ; -> 0x000fdbb4  
000c209e  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000c20a0  ldr     r0, [r0]
000c20a2  ldr     r1, [r1]
000c20a4  blx     #0xddbfc ; -> objc_msgSend
000c20a8  mov     r1, r5
000c20aa  mov     r2, r5
000c20ac  mov     r3, r5
000c20ae  str     r5, [sp]
000c20b0  str     r0, [sp, #4]
000c20b2  movw    r0, #0x2714
000c20b6  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
000c20ba  ldr     r3, [pc, #0x9c]
000c20bc  add     r3, pc ; -> 0x000f3264  bShowingMoreGames
000c20be  ldr     r3, [r3]
000c20c0  ldrb    r3, [r3]
000c20c2  cbz     r3, #0xc20c8
000c20c4  bl      #0xcf878 ; -> Z22MTXDMG_EnterForegroundv
000c20c8  ldr     r4, [pc, #0x90]
000c20ca  add     r4, pc ; -> 0x0038c0e4  mtxController
000c20cc  ldr     r3, [r4]
000c20ce  cbz     r3, #0xc20e4
000c20d0  bl      #0xbe47c ; -> Z12getFreeSpacev
000c20d4  mov     r3, r1
000c20d6  ldr     r1, [pc, #0x88]
000c20d8  mov     r2, r0
000c20da  ldr     r0, [r4]
000c20dc  add     r1, pc ; -> 0x000fd3ac  
000c20de  ldr     r1, [r1]
000c20e0  blx     #0xddbfc ; -> objc_msgSend
000c20e4  ldr     r3, [pc, #0x7c]
000c20e6  movs    r2, #0
000c20e8  add     r3, pc ; -> 0x0038c0b9  bRequiredToShowAlert
000c20ea  strb    r2, [r3]
000c20ec  sub.w   sp, r7, #0x18
000c20f0  pop.w   {r8, sl, fp}
000c20f4  pop     {r4, r5, r6, r7, pc}
000c20f6  nop     
000c20f8  cbnz    r6, #0xc2172
000c20fa  movs    r3, r0
000c20fc  add     r2, sp, #0x1f0
000c20fe  movs    r3, r0
000c2100  push    {r2, r3, r5}
000c2102  movs    r3, r0
000c2104  add     r5, sp, #0x18
000c2106  movs    r3, r0
000c2108  adr     r1, #0xd0
000c210a  movs    r4, r5
