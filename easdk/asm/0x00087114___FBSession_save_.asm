========================================================================
-[FBSession save]  0x00087114  348 bytes   FBSession.m
========================================================================

00087114  push    {r4, r5, r6, r7, lr}
00087116  add     r7, sp, #0xc
00087118  ldr     r1, [pc, #0xf0]
0008711a  mov     r5, r0
0008711c  ldr     r0, [pc, #0xf0]
0008711e  add     r1, pc ; -> 0x000fcae0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x168
00087120  add     r0, pc ; -> 0x000fdb84  
00087122  ldr     r1, [r1]
00087124  ldr     r0, [r0]
00087126  blx     #0xddbfc ; -> objc_msgSend
0008712a  ldr     r3, [pc, #0xe8]
0008712c  add     r3, pc ; -> 0x000f5d14  OBJC_IVAR_$_FBSession._uid
0008712e  ldr     r3, [r3]
00087130  add.w   r2, r5, r3
00087134  ldm     r2, {r2, r3}
00087136  orrs.w  r1, r2, r3
0008713a  mov     r4, r0
0008713c  beq     #0x871c4
0008713e  ldr     r1, [pc, #0xd8]
00087140  ldr     r0, [pc, #0xd8]
00087142  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
00087144  add     r0, pc ; -> 0x000fdb48  
00087146  ldr     r6, [r1]
00087148  ldr     r1, [pc, #0xd4]
0008714a  ldr     r0, [r0]
0008714c  add     r1, pc ; -> 0x000fcf00  "'B\x0e"
0008714e  ldr     r1, [r1]
00087150  blx     #0xddbfc ; -> objc_msgSend
00087154  ldr     r3, [pc, #0xcc]
00087156  mov     r1, r6
00087158  add     r3, pc ; -> 0x0017eca4  
0008715a  mov     r2, r0
0008715c  mov     r0, r4
0008715e  blx     #0xddbfc ; -> objc_msgSend
00087162  ldr     r3, [pc, #0xc4]
00087164  add     r3, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
00087166  ldr     r2, [r3]
00087168  ldr     r2, [r5, r2]
0008716a  cmp     r2, #0
0008716c  beq     #0x871d4
0008716e  ldr     r1, [pc, #0xbc]
00087170  ldr     r3, [pc, #0xbc]
00087172  mov     r0, r4
00087174  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
00087176  add     r3, pc ; -> 0x0017ecb4  
00087178  ldr     r1, [r1]
0008717a  blx     #0xddbfc ; -> objc_msgSend
0008717e  ldr     r3, [pc, #0xb4]
00087180  add     r3, pc ; -> 0x000f5d1c  OBJC_IVAR_$_FBSession._sessionSecret
00087182  ldr     r2, [r3]
00087184  ldr     r2, [r5, r2]
00087186  cmp     r2, #0
00087188  beq     #0x871e6
0008718a  ldr     r1, [pc, #0xac]
0008718c  ldr     r3, [pc, #0xac]
0008718e  mov     r0, r4
00087190  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
00087192  add     r3, pc ; -> 0x0017ecc4  
00087194  ldr     r1, [r1]
00087196  blx     #0xddbfc ; -> objc_msgSend
0008719a  ldr     r3, [pc, #0xa4]
0008719c  add     r3, pc ; -> 0x000f5d20  OBJC_IVAR_$_FBSession._expirationDate
0008719e  ldr     r0, [r3]
000871a0  ldr     r2, [r5, r0]
000871a2  cmp     r2, #0
000871a4  beq     #0x871f8
000871a6  ldr     r1, [pc, #0x9c]
000871a8  ldr     r3, [pc, #0x9c]
000871aa  mov     r0, r4
000871ac  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000871ae  add     r3, pc ; -> 0x0017ecd4  
000871b0  ldr     r1, [r1]
000871b2  blx     #0xddbfc ; -> objc_msgSend
000871b6  ldr     r1, [pc, #0x94]
000871b8  mov     r0, r4
000871ba  add     r1, pc ; -> 0x000fcef8  '\x05B\x0e'
000871bc  ldr     r1, [r1]
000871be  blx     #0xddbfc ; -> objc_msgSend
000871c2  pop     {r4, r5, r6, r7, pc}
000871c4  ldr     r1, [pc, #0x88]
000871c6  ldr     r2, [pc, #0x8c]
000871c8  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000871ca  add     r2, pc ; -> 0x0017eca4  
000871cc  ldr     r1, [r1]
000871ce  blx     #0xddbfc ; -> objc_msgSend
000871d2  b       #0x87162
000871d4  ldr     r1, [pc, #0x80]
000871d6  ldr     r2, [pc, #0x84]
000871d8  mov     r0, r4
000871da  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000871dc  add     r2, pc ; -> 0x0017ecb4  
000871de  ldr     r1, [r1]
000871e0  blx     #0xddbfc ; -> objc_msgSend
000871e4  b       #0x8717e
000871e6  ldr     r1, [pc, #0x78]
000871e8  ldr     r2, [pc, #0x78]
000871ea  mov     r0, r4
000871ec  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000871ee  add     r2, pc ; -> 0x0017ecc4  
000871f0  ldr     r1, [r1]
000871f2  blx     #0xddbfc ; -> objc_msgSend
000871f6  b       #0x8719a
000871f8  ldr     r1, [pc, #0x6c]
000871fa  ldr     r2, [pc, #0x70]
000871fc  mov     r0, r4
000871fe  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
00087200  add     r2, pc ; -> 0x0017ecd4  
00087202  ldr     r1, [r1]
00087204  blx     #0xddbfc ; -> objc_msgSend
00087208  b       #0x871b6
0008720a  nop     
0008720c  ldr     r6, [r7, r6]
0008720e  movs    r7, r0
00087210  ldr     r0, [r4, #0x24]
00087212  movs    r7, r0
