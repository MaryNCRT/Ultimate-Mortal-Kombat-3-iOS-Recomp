========================================================================
-[FBLoginDialog loadLoginPage]  0x0008506c  200 bytes   FBLoginDialog.m
========================================================================

0008506c  push    {r4, r5, r6, r7, lr}
0008506e  add     r7, sp, #0xc
00085070  push.w  {r8, sl, fp}
00085074  sub     sp, #0x20
00085076  ldr     r3, [pc, #0x84]
00085078  ldr     r1, [pc, #0x84]
0008507a  mov     fp, r0
0008507c  add     r3, pc ; -> 0x000f342c  OBJC_IVAR_$_FBDialog._session
0008507e  ldr     r0, [pc, #0x84]
00085080  ldr     r3, [r3]
00085082  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
00085084  add     r0, pc ; -> 0x000fdb44  
00085086  ldr.w   sl, [r1]
0008508a  ldr     r1, [pc, #0x7c]
0008508c  ldr     r0, [r0]
0008508e  ldr     r3, [r3]
00085090  add     r1, pc ; -> 0x000fcdd4  
00085092  ldr.w   r8, [pc, #0x78]
00085096  str     r0, [sp, #0x1c]
00085098  ldr     r1, [r1]
0008509a  ldr.w   r0, [fp, r3]
0008509e  blx     #0xddbfc ; -> objc_msgSend
000850a2  ldr     r6, [pc, #0x6c]
000850a4  ldr     r1, [pc, #0x6c]
000850a6  ldr     r2, [pc, #0x70]
000850a8  ldr     r3, [pc, #0x70]
000850aa  add     r8, pc ; -> 0x0017e764  
000850ac  add     r6, pc ; -> 0x0017e7f4  
000850ae  ldr     r5, [pc, #0x70]
000850b0  ldr     r4, [pc, #0x70]
000850b2  add     r1, pc ; -> 0x0017e9e4  
000850b4  add     r2, pc ; -> 0x0017e9f4  
000850b6  str     r1, [sp, #0xc]
000850b8  str     r2, [sp, #0x10]
000850ba  mov     r1, sl
000850bc  mov     r2, r8
000850be  add     r3, pc ; -> 0x0017ea04  
000850c0  str     r3, [sp, #0x14]
000850c2  mov     r3, r6
000850c4  add     r5, pc ; -> 0x0017e9c4  
000850c6  add     r4, pc ; -> 0x0017e9d4  
000850c8  str     r5, [sp]
000850ca  str     r4, [sp, #4]
000850cc  movs    r4, #0
000850ce  str     r4, [sp, #0x18]
000850d0  str     r0, [sp, #8]
000850d2  ldr     r0, [sp, #0x1c]
000850d4  blx     #0xddbfc ; -> objc_msgSend
000850d8  ldr     r1, [pc, #0x4c]
000850da  ldr     r2, [pc, #0x50]
000850dc  ldr     r3, [pc, #0x50]
000850de  add     r1, pc ; -> 0x000fcdd8  ',D\x0e'
000850e0  add     r2, pc ; -> 0x0017d9e8  kLoginURL
000850e2  add     r3, pc ; -> 0x0017ea14  
000850e4  ldr     r1, [r1]
000850e6  ldr     r2, [r2]
000850e8  str     r4, [sp, #4]
000850ea  str     r0, [sp]
000850ec  mov     r0, fp
000850ee  blx     #0xddbfc ; -> objc_msgSend
000850f2  sub.w   sp, r7, #0x18
000850f6  pop.w   {r8, sl, fp}
000850fa  pop     {r4, r5, r6, r7, pc}
000850fc  b       #0x85858
000850fe  movs    r6, r0
00085100  ldrb    r6, [r6, #5]
00085102  movs    r7, r0
00085104  ldrh    r4, [r7, #0x14]
00085106  movs    r7, r0
00085108  ldrb    r0, [r0, #0x15]
0008510a  movs    r7, r0
0008510c  str     r6, [sp, #0x2d8]
0008510e  movs    r7, r1
00085110  str     r7, [sp, #0x110]
00085112  movs    r7, r1
00085114  ldr     r1, [sp, #0xb8]
00085116  movs    r7, r1
00085118  ldr     r1, [sp, #0xf0]
0008511a  movs    r7, r1
0008511c  ldr     r1, [sp, #0x108]
0008511e  movs    r7, r1
00085120  ldr     r0, [sp, #0x3f0]
00085122  movs    r7, r1
00085124  ldr     r1, [sp, #0x28]
00085126  movs    r7, r1
00085128  ldrb    r6, [r6, #0x13]
0008512a  movs    r7, r0
0008512c  ldrh    r4, [r0, #8]
0008512e  movs    r7, r1
00085130  ldr     r1, [sp, #0xb8]
00085132  movs    r7, r1
