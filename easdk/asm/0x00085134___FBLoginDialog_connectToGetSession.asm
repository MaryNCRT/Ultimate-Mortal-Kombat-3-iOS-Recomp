========================================================================
-[FBLoginDialog connectToGetSession  0x00085134  292 bytes   FBLoginDialog.m
========================================================================

00085134  push    {r4, r5, r6, r7, lr}
00085136  add     r7, sp, #0xc
00085138  push.w  {r8, sl, fp}
0008513c  ldr     r3, [pc, #0xd0]
0008513e  mov     r4, r0
00085140  ldr     r1, [pc, #0xd0]
00085142  add     r3, pc ; -> 0x000f5520  OBJC_IVAR_$_FBLoginDialog._getSessionRequest
00085144  ldr     r0, [pc, #0xd0]
00085146  ldr     r5, [r3]
00085148  ldr     r3, [pc, #0xd0]
0008514a  add     r0, pc ; -> 0x000fdbf0  
0008514c  add     r1, pc ; -> 0x000fcdf0  'H5\x0e'
0008514e  add     r3, pc ; -> 0x000f342c  OBJC_IVAR_$_FBDialog._session
00085150  mov     r6, r2
00085152  ldr.w   sl, [r3]
00085156  ldr     r1, [r1]
00085158  ldr     r0, [r0]
0008515a  ldr.w   r3, [sl]
0008515e  ldr     r2, [r4, r3]
00085160  mov     r3, r4
00085162  blx     #0xddbfc ; -> objc_msgSend
00085166  ldr     r1, [pc, #0xb8]
00085168  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
0008516a  ldr     r1, [r1]
0008516c  blx     #0xddbfc ; -> objc_msgSend
00085170  ldr     r1, [pc, #0xb0]
00085172  ldr     r3, [pc, #0xb4]
00085174  mov     r2, r6
00085176  add     r1, pc ; -> 0x000fcdec  '(5\x0e'
00085178  add     r3, pc ; -> 0x0017ea24  
0008517a  ldr     r1, [r1]
0008517c  str     r0, [r4, r5]
0008517e  ldr     r0, [pc, #0xac]
00085180  add     r0, pc ; -> 0x000fdbf4  
00085182  ldr     r0, [r0]
00085184  blx     #0xddbfc ; -> objc_msgSend
00085188  ldr     r1, [pc, #0xa4]
0008518a  ldr.w   r3, [sl]
0008518e  add     r1, pc ; -> 0x000fcde0  '<=\x0e'
00085190  ldr     r1, [r1]
00085192  mov     fp, r0
00085194  ldr     r0, [r4, r3]
00085196  blx     #0xddbfc ; -> objc_msgSend
0008519a  cmp     r0, #0
0008519c  beq     #0x851fa
0008519e  ldr     r1, [pc, #0x94]
000851a0  ldr.w   r3, [sl]
000851a4  add     r1, pc ; -> 0x000fcddc  
000851a6  ldr     r6, [r1]
000851a8  ldr     r0, [r4, r3]
000851aa  mov     r1, r6
000851ac  blx     #0xddbfc ; -> objc_msgSend
000851b0  cbz     r0, #0x851e0
000851b2  ldr     r3, [pc, #0x84]
000851b4  ldr     r1, [pc, #0x84]
000851b6  add     r3, pc ; -> 0x000f5520  OBJC_IVAR_$_FBLoginDialog._getSessionRequest
000851b8  add     r1, pc ; -> 0x000fcde8  '\x195\x0e'
000851ba  ldr     r0, [r3]
000851bc  ldr     r5, [r1]
000851be  mov     r1, r6
000851c0  ldr.w   r8, [r4, r0]
000851c4  ldr.w   r0, [sl]
000851c8  ldr     r0, [r4, r0]
000851ca  blx     #0xddbfc ; -> objc_msgSend
000851ce  mov     r1, r5
000851d0  mov     r3, fp
000851d2  mov     r2, r0
000851d4  mov     r0, r8
000851d6  blx     #0xddbfc ; -> objc_msgSend
000851da  pop.w   {r8, sl, fp}
000851de  pop     {r4, r5, r6, r7, pc}
000851e0  ldr     r3, [pc, #0x5c]
000851e2  ldr     r1, [pc, #0x60]
000851e4  ldr     r2, [pc, #0x60]
000851e6  add     r3, pc ; -> 0x000f5520  OBJC_IVAR_$_FBLoginDialog._getSessionRequest
000851e8  add     r1, pc ; -> 0x000fcde4  '\x0c5\x0e'
000851ea  ldr     r0, [r3]
000851ec  add     r2, pc ; -> 0x0017ea44  
000851ee  ldr     r1, [r1]
000851f0  mov     r3, fp
000851f2  ldr     r0, [r4, r0]
000851f4  blx     #0xddbfc ; -> objc_msgSend
000851f8  b       #0x851da
000851fa  ldr     r1, [pc, #0x50]
000851fc  ldr     r2, [pc, #0x50]
000851fe  ldr     r3, [pc, #0x54]
00085200  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
00085202  add     r2, pc ; -> 0x0017e764  
00085204  add     r3, pc ; -> 0x0017ea34  
00085206  ldr     r1, [r1]
00085208  mov     r0, fp
0008520a  blx     #0xddbfc ; -> objc_msgSend
0008520e  b       #0x8519e
00085210  lsls    r2, r3, #0xf
00085212  movs    r7, r0
00085214  ldrb    r0, [r4, #0x12]
00085216  movs    r7, r0
00085218  ldrh    r2, [r4, #0x14]
0008521a  movs    r7, r0
0008521c  b       #0x857d4
0008521e  movs    r6, r0
00085220  ldrb    r4, [r4, #0xd]
00085222  movs    r7, r0
00085224  ldrb    r2, [r6, #0x11]
00085226  movs    r7, r0
00085228  ldr     r0, [sp, #0x2a0]
0008522a  movs    r7, r1
0008522c  ldrh    r0, [r6, #0x12]
0008522e  movs    r7, r0
00085230  ldrb    r6, [r1, #0x11]
00085232  movs    r7, r0
00085234  ldrb    r4, [r6, #0x10]
00085236  movs    r7, r0
00085238  lsls    r6, r4, #0xd
0008523a  movs    r7, r0
0008523c  ldrb    r4, [r5, #0x10]
0008523e  movs    r7, r0
00085240  lsls    r6, r6, #0xc
00085242  movs    r7, r0
00085244  ldrb    r0, [r7, #0xf]
00085246  movs    r7, r0
00085248  ldr     r0, [sp, #0x150]
0008524a  movs    r7, r1
0008524c  ldrb    r4, [r2, #3]
0008524e  movs    r7, r0
00085250  str     r5, [sp, #0x178]
00085252  movs    r7, r1
00085254  ldr     r0, [sp, #0xb0]
00085256  movs    r7, r1
