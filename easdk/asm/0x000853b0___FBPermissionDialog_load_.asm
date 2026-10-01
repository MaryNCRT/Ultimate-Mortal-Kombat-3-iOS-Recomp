========================================================================
-[FBPermissionDialog load]  0x000853b0  272 bytes   FBPermissionDialog.m
========================================================================

000853b0  push    {r4, r5, r6, r7, lr}
000853b2  add     r7, sp, #0xc
000853b4  push.w  {r8, sl, fp}
000853b8  sub     sp, #0x34
000853ba  ldr     r1, [pc, #0xbc]
000853bc  ldr     r3, [pc, #0xbc]
000853be  mov     r5, r0
000853c0  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000853c2  add     r3, pc ; -> 0x000f342c  OBJC_IVAR_$_FBDialog._session
000853c4  ldr     r1, [r1]
000853c6  ldr     r0, [pc, #0xb8]
000853c8  ldr     r6, [r3]
000853ca  ldr     r4, [pc, #0xb8]
000853cc  add     r0, pc ; -> 0x000fdb44  
000853ce  str     r1, [sp, #0x30]
000853d0  ldr     r1, [pc, #0xb4]
000853d2  ldr     r3, [r6]
000853d4  ldr     r0, [r0]
000853d6  add     r1, pc ; -> 0x000fcdd4  
000853d8  add     r4, pc ; -> 0x0017e9e4  
000853da  ldr     r1, [r1]
000853dc  str     r0, [sp, #0x2c]
000853de  ldr     r0, [r5, r3]
000853e0  blx     #0xddbfc ; -> objc_msgSend
000853e4  ldr     r1, [pc, #0xa4]
000853e6  ldr     r3, [r6]
000853e8  ldr.w   fp, [pc, #0xa4]
000853ec  add     r1, pc ; -> 0x000fcdfc  'L<\x0e'
000853ee  ldr.w   sl, [pc, #0xa4]
000853f2  ldr     r1, [r1]
000853f4  add     fp, pc ; -> 0x0017e9c4  
000853f6  add     sl, pc ; -> 0x0017ea74  
000853f8  mov     r8, r0
000853fa  ldr     r0, [r5, r3]
000853fc  blx     #0xddbfc ; -> objc_msgSend
00085400  ldr     r3, [pc, #0x94]
00085402  str     r4, [sp, #4]
00085404  str.w   r8, [sp]
00085408  add     r3, pc ; -> 0x0017e984  
0008540a  str     r3, [sp, #0xc]
0008540c  ldr     r3, [pc, #0x8c]
0008540e  ldr     r1, [pc, #0x90]
00085410  ldr     r2, [pc, #0x90]
00085412  add     r3, pc ; -> 0x000f5674  OBJC_IVAR_$_FBPermissionDialog._permission
00085414  ldr.w   sb, [pc, #0x90]
00085418  ldr.w   lr, [pc, #0x90]
0008541c  ldr.w   ip, [pc, #0x90]
00085420  add     r1, pc ; -> 0x0017eaa4  
00085422  add     r2, pc ; -> 0x0017e804  
00085424  add     sb, pc ; -> 0x0017ea84  
00085426  add     lr, pc ; -> 0x0017ea94  
00085428  add     ip, pc ; -> 0x0017ea04  
0008542a  movs    r4, #0
0008542c  str     r0, [sp, #8]
0008542e  ldr     r3, [r3]
00085430  ldr     r0, [sp, #0x2c]
00085432  str     r1, [sp, #0x20]
00085434  str     r2, [sp, #0x24]
00085436  ldr     r3, [r5, r3]
00085438  ldr     r1, [sp, #0x30]
0008543a  mov     r2, fp
0008543c  str.w   sb, [sp, #0x14]
00085440  str     r3, [sp, #0x10]
00085442  mov     r3, sl
00085444  str.w   lr, [sp, #0x18]
00085448  str.w   ip, [sp, #0x1c]
0008544c  str     r4, [sp, #0x28]
0008544e  blx     #0xddbfc ; -> objc_msgSend
00085452  ldr     r1, [pc, #0x60]
00085454  ldr     r2, [pc, #0x60]
00085456  ldr     r3, [pc, #0x64]
00085458  add     r1, pc ; -> 0x000fcdd8  ',D\x0e'
0008545a  add     r2, pc ; -> 0x0017d9ec  kPermissionURL
0008545c  add     r3, pc ; -> 0x0017ea14  
0008545e  ldr     r1, [r1]
00085460  ldr     r2, [r2]
00085462  str     r4, [sp, #4]
00085464  str     r0, [sp]
00085466  mov     r0, r5
00085468  blx     #0xddbfc ; -> objc_msgSend
0008546c  sub.w   sp, r7, #0x18
00085470  pop.w   {r8, sl, fp}
00085474  pop     {r4, r5, r6, r7, pc}
00085476  nop     
00085478  strb    r0, [r7, #0x18]
0008547a  movs    r7, r0
0008547c  b       #0x8554c
0008547e  movs    r6, r0
00085480  strh    r4, [r6, #0x3a]
00085482  movs    r7, r0
00085484  str     r6, [sp, #0x20]
00085486  movs    r7, r1
00085488  ldrb    r2, [r7, #7]
0008548a  movs    r7, r0
0008548c  ldrb    r4, [r1, #8]
0008548e  movs    r7, r0
00085490  str     r5, [sp, #0x330]
00085492  movs    r7, r1
00085494  str     r6, [sp, #0x1e8]
00085496  movs    r7, r1
00085498  str     r5, [sp, #0x1e0]
0008549a  movs    r7, r1
0008549c  lsls    r6, r3, #9
0008549e  movs    r7, r0
000854a0  str     r6, [sp, #0x200]
000854a2  movs    r7, r1
000854a4  str     r3, [sp, #0x378]
000854a6  movs    r7, r1
000854a8  str     r6, [sp, #0x170]
000854aa  movs    r7, r1
000854ac  str     r6, [sp, #0x1a8]
000854ae  movs    r7, r1
000854b0  str     r5, [sp, #0x360]
000854b2  movs    r7, r1
000854b4  ldrb    r4, [r7, #5]
000854b6  movs    r7, r0
000854b8  strh    r6, [r1, #0x2c]
000854ba  movs    r7, r1
000854bc  str     r5, [sp, #0x2d0]
000854be  movs    r7, r1
