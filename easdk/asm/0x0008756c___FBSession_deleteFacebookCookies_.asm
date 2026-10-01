========================================================================
-[FBSession deleteFacebookCookies]  0x0008756c  228 bytes   FBSession.m
========================================================================

0008756c  push    {r4, r5, r6, r7, lr}
0008756e  add     r7, sp, #0xc
00087570  push.w  {r8, sl, fp}
00087574  sub     sp, #0x68
00087576  ldr     r0, [pc, #0xb8]
00087578  ldr     r1, [pc, #0xb8]
0008757a  add     r0, pc ; -> 0x000fdbdc  
0008757c  add     r1, pc ; -> 0x000fcbf4  '\x04+\x0e'
0008757e  ldr     r0, [r0]
00087580  ldr     r1, [r1]
00087582  blx     #0xddbfc ; -> objc_msgSend
00087586  ldr     r1, [pc, #0xb0]
00087588  ldr     r2, [pc, #0xb0]
0008758a  add     r1, pc ; -> 0x000fceac  
0008758c  add     r2, pc ; -> 0x0017ece4  
0008758e  ldr     r4, [r1]
00087590  ldr     r1, [pc, #0xac]
00087592  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
00087594  ldr     r1, [r1]
00087596  mov     fp, r0
00087598  ldr     r0, [pc, #0xa8]
0008759a  add     r0, pc ; -> 0x000fdb64  
0008759c  ldr     r0, [r0]
0008759e  blx     #0xddbfc ; -> objc_msgSend
000875a2  mov     r1, r4
000875a4  mov     r2, r0
000875a6  mov     r0, fp
000875a8  blx     #0xddbfc ; -> objc_msgSend
000875ac  ldr     r1, [pc, #0x98]
000875ae  movs    r3, #0
000875b0  add     r2, sp, #0x48
000875b2  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000875b4  str     r3, [sp, #0x48]
000875b6  ldr     r1, [r1]
000875b8  str     r3, [sp, #0x4c]
000875ba  str     r3, [sp, #0x50]
000875bc  str     r3, [sp, #0x54]
000875be  str     r3, [sp, #0x58]
000875c0  str     r3, [sp, #0x5c]
000875c2  str     r3, [sp, #0x60]
000875c4  str     r3, [sp, #0x64]
000875c6  adds    r3, #0x10
000875c8  str     r3, [sp]
000875ca  add     r3, sp, #8
000875cc  str     r1, [sp, #4]
000875ce  mov     sl, r0
000875d0  blx     #0xddbfc ; -> objc_msgSend
000875d4  cbz     r0, #0x87626
000875d6  ldr     r3, [sp, #0x50]
000875d8  ldr     r1, [pc, #0x70]
000875da  mov     r5, r0
000875dc  add     r1, pc ; -> 0x000fcea8  
000875de  ldr.w   r8, [r3]
000875e2  ldr     r6, [r1]
000875e4  mov     r3, r8
000875e6  movs    r4, #0
000875e8  b       #0x875ee
000875ea  ldr     r3, [sp, #0x50]
000875ec  ldr     r3, [r3]
000875ee  cmp     r8, r3
000875f0  beq     #0x875f8
000875f2  mov     r0, sl
000875f4  blx     #0xddbe4 ; -> objc_enumerationMutation
000875f8  ldr     r3, [sp, #0x4c]
000875fa  mov     r0, fp
000875fc  mov     r1, r6
000875fe  ldr.w   r2, [r3, r4, lsl #2]
00087602  adds    r4, #1
00087604  blx     #0xddbfc ; -> objc_msgSend
00087608  cmp     r5, r4
0008760a  bhi     #0x875ea
0008760c  movs    r3, #0x10
0008760e  mov     r0, sl
00087610  str     r3, [sp]
00087612  ldr     r1, [sp, #4]
00087614  add     r2, sp, #0x48
00087616  add     r3, sp, #8
00087618  blx     #0xddbfc ; -> objc_msgSend
0008761c  cbz     r0, #0x87626
0008761e  ldr     r3, [sp, #0x50]
00087620  mov     r5, r0
00087622  ldr     r3, [r3]
00087624  b       #0x875e6
00087626  sub.w   sp, r7, #0x18
0008762a  pop.w   {r8, sl, fp}
0008762e  pop     {r4, r5, r6, r7, pc}
00087630  str     r6, [r3, #0x64]
00087632  movs    r7, r0
00087634  ldrsb   r4, [r6, r1]
00087636  movs    r7, r0
00087638  ldr     r6, [r3, r4]
0008763a  movs    r7, r0
0008763c  strb    r4, [r2, #0x1d]
0008763e  movs    r7, r1
00087640  ldrsb   r2, [r3, r0]
00087642  movs    r7, r0
00087644  str     r6, [r0, #0x5c]
00087646  movs    r7, r0
00087648  strh    r2, [r4, r7]
0008764a  movs    r7, r0
0008764c  ldr     r0, [r1, r3]
0008764e  movs    r7, r0
