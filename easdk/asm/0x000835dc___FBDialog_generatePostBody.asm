========================================================================
-[FBDialog generatePostBody  0x000835dc  408 bytes   FBDialog.m
========================================================================

000835dc  push    {r4, r5, r6, r7, lr}
000835de  add     r7, sp, #0xc
000835e0  push.w  {r8, sl, fp}
000835e4  sub     sp, #0x8c
000835e6  mov     fp, r2
000835e8  cmp     r2, #0
000835ea  beq.w   #0x83732
000835ee  ldr     r0, [pc, #0x150]
000835f0  ldr.w   r1, [pc, #0x150]
000835f4  add     r0, pc ; -> 0x000fdbbc  
000835f6  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000835f8  ldr     r0, [r0]
000835fa  ldr     r1, [r1]
000835fc  blx     #0xddbfc ; -> objc_msgSend
00083600  ldr     r3, [pc, #0x144]
00083602  ldr     r1, [pc, #0x148]
00083604  ldr     r2, [pc, #0x148]
00083606  add     r3, pc ; -> 0x0017d9e0  kStringBoundary
00083608  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
0008360a  ldr     r4, [r3]
0008360c  ldr     r1, [r1]
0008360e  add     r2, pc ; -> 0x0017e864  
00083610  mov     r3, r4
00083612  str     r1, [sp, #8]
00083614  mov     sl, r0
00083616  ldr     r0, [pc, #0x13c]
00083618  add     r0, pc ; -> 0x000fdb5c  
0008361a  ldr     r0, [r0]
0008361c  str     r0, [sp, #4]
0008361e  blx     #0xddbfc ; -> objc_msgSend
00083622  ldr     r1, [pc, #0x134]
00083624  ldr     r2, [pc, #0x134]
00083626  mov     r3, r4
00083628  add     r1, pc ; -> 0x000fcd0c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x394
0008362a  add     r2, pc ; -> 0x0017e874  
0008362c  ldr.w   r8, [r1]
00083630  ldr     r1, [sp, #8]
00083632  str     r0, [sp, #0xc]
00083634  ldr     r0, [sp, #4]
00083636  blx     #0xddbfc ; -> objc_msgSend
0008363a  ldr     r1, [pc, #0x124]
0008363c  movs    r2, #4
0008363e  add     r1, pc ; -> 0x000fcd10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x398
00083640  ldr     r6, [r1]
00083642  mov     r1, r6
00083644  blx     #0xddbfc ; -> objc_msgSend
00083648  mov     r1, r8
0008364a  mov     r2, r0
0008364c  mov     r0, sl
0008364e  blx     #0xddbfc ; -> objc_msgSend
00083652  ldr     r1, [pc, #0x110]
00083654  mov     r0, fp
00083656  movs    r3, #0
00083658  add     r1, pc ; -> 0x000fcd18  '^z\x0e'
0008365a  str     r3, [sp, #0x6c]
0008365c  ldr     r1, [r1]
0008365e  str     r3, [sp, #0x70]
00083660  str     r3, [sp, #0x74]
00083662  str     r3, [sp, #0x78]
00083664  str     r3, [sp, #0x7c]
00083666  str     r3, [sp, #0x80]
00083668  str     r3, [sp, #0x84]
0008366a  str     r3, [sp, #0x88]
0008366c  str     r1, [sp, #0x10]
0008366e  blx     #0xddbfc ; -> objc_msgSend
00083672  ldr     r1, [pc, #0xf4]
00083674  movs    r3, #0x10
00083676  add     r2, sp, #0x6c
00083678  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
0008367a  str     r3, [sp]
0008367c  ldr     r1, [r1]
0008367e  add     r3, sp, #0x2c
00083680  str     r1, [sp, #0x18]
00083682  str     r0, [sp, #0x14]
00083684  blx     #0xddbfc ; -> objc_msgSend
00083688  cmp     r0, #0
0008368a  beq     #0x83734
0008368c  ldr     r1, [pc, #0xdc]
0008368e  ldr     r3, [sp, #0x74]
00083690  ldr     r2, [pc, #0xdc]
00083692  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
00083694  ldr     r3, [r3]
00083696  ldr     r1, [r1]
00083698  add     r2, pc ; -> 0x0017e884  
0008369a  str     r0, [sp, #0x20]
0008369c  str     r3, [sp, #0x24]
0008369e  str     r2, [sp, #0x28]
000836a0  str     r1, [sp, #0x1c]
000836a2  movs    r5, #0
000836a4  b       #0x836aa
000836a6  ldr     r3, [sp, #0x74]
000836a8  ldr     r3, [r3]
000836aa  ldr     r2, [sp, #0x24]
000836ac  cmp     r2, r3
000836ae  beq     #0x836bc
000836b0  ldr     r1, [sp, #0x10]
000836b2  mov     r0, fp
000836b4  blx     #0xddbfc ; -> objc_msgSend
000836b8  blx     #0xddbe4 ; -> objc_enumerationMutation
000836bc  ldr     r2, [sp, #0x70]
000836be  ldr     r1, [sp, #8]
000836c0  ldr     r0, [sp, #4]
000836c2  ldr.w   r4, [r2, r5, lsl #2]
000836c6  ldr     r2, [sp, #0x28]
000836c8  adds    r5, #1
000836ca  mov     r3, r4
000836cc  blx     #0xddbfc ; -> objc_msgSend
000836d0  movs    r2, #4
000836d2  mov     r1, r6
000836d4  blx     #0xddbfc ; -> objc_msgSend
000836d8  mov     r1, r8
000836da  mov     r2, r0
000836dc  mov     r0, sl
000836de  blx     #0xddbfc ; -> objc_msgSend
000836e2  ldr     r1, [sp, #0x1c]
000836e4  mov     r2, r4
000836e6  mov     r0, fp
000836e8  blx     #0xddbfc ; -> objc_msgSend
000836ec  movs    r2, #4
000836ee  mov     r1, r6
000836f0  blx     #0xddbfc ; -> objc_msgSend
000836f4  mov     r1, r8
000836f6  mov     r2, r0
000836f8  mov     r0, sl
000836fa  blx     #0xddbfc ; -> objc_msgSend
000836fe  movs    r2, #4
00083700  mov     r1, r6
00083702  ldr     r0, [sp, #0xc]
00083704  blx     #0xddbfc ; -> objc_msgSend
00083708  mov     r1, r8
0008370a  mov     r2, r0
0008370c  mov     r0, sl
0008370e  blx     #0xddbfc ; -> objc_msgSend
00083712  ldr     r3, [sp, #0x20]
00083714  cmp     r3, r5
00083716  bhi     #0x836a6
00083718  movs    r3, #0x10
0008371a  ldr     r0, [sp, #0x14]
0008371c  str     r3, [sp]
0008371e  ldr     r1, [sp, #0x18]
00083720  add     r2, sp, #0x6c
00083722  add     r3, sp, #0x2c
00083724  blx     #0xddbfc ; -> objc_msgSend
00083728  cbz     r0, #0x83734
0008372a  ldr     r3, [sp, #0x74]
0008372c  ldr     r3, [r3]
0008372e  str     r0, [sp, #0x20]
00083730  b       #0x836a2
00083732  mov     sl, r2
00083734  mov     r0, sl
00083736  sub.w   sp, r7, #0x18
0008373a  pop.w   {r8, sl, fp}
0008373e  pop     {r4, r5, r6, r7, pc}
00083740  adr     r5, #0x310
00083742  movs    r7, r0
00083744  str     r7, [sp, #0x68]
00083746  movs    r7, r0
00083748  adr     r3, #0x358
0008374a  movs    r7, r1
0008374c  str     r4, [sp, #0x250]
0008374e  movs    r7, r0
00083750  sxtb    r2, r2
00083752  movs    r7, r1
00083754  adr     r5, #0x100
00083756  movs    r7, r0
00083758  str     r6, [sp, #0x380]
0008375a  movs    r7, r0
0008375c  sxtb    r6, r0
0008375e  movs    r7, r1
00083760  str     r6, [sp, #0x338]
00083762  movs    r7, r0
00083764  str     r6, [sp, #0x2f0]
00083766  movs    r7, r0
00083768  str     r3, [sp, #0x70]
0008376a  movs    r7, r0
0008376c  str     r4, [sp, #0x168]
0008376e  movs    r7, r0
00083770  cbz     r0, #0x837ae
00083772  movs    r7, r1
