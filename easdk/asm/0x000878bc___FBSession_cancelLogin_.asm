========================================================================
-[FBSession cancelLogin]  0x000878bc  236 bytes   FBSession.m
========================================================================

000878bc  push    {r4, r5, r6, r7, lr}
000878be  add     r7, sp, #0xc
000878c0  push.w  {r8, sl, fp}
000878c4  sub     sp, #0x70
000878c6  ldr     r1, [pc, #0xc8]
000878c8  mov     fp, r0
000878ca  add     r1, pc ; -> 0x000fcda4  
000878cc  ldr     r1, [r1]
000878ce  blx     #0xddbfc ; -> objc_msgSend
000878d2  uxtb    r0, r0
000878d4  cbz     r0, #0x878e0
000878d6  sub.w   sp, r7, #0x18
000878da  pop.w   {r8, sl, fp}
000878de  pop     {r4, r5, r6, r7, pc}
000878e0  ldr     r3, [pc, #0xb0]
000878e2  ldr     r1, [pc, #0xb4]
000878e4  str     r0, [sp, #0x50]
000878e6  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
000878e8  str     r0, [sp, #0x54]
000878ea  str     r0, [sp, #0x58]
000878ec  str     r0, [sp, #0x5c]
000878ee  str     r0, [sp, #0x60]
000878f0  str     r0, [sp, #0x64]
000878f2  str     r0, [sp, #0x68]
000878f4  str     r0, [sp, #0x6c]
000878f6  ldr     r0, [r3]
000878f8  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000878fa  movs    r3, #0x10
000878fc  ldr     r1, [r1]
000878fe  ldr.w   r0, [fp, r0]
00087902  str     r3, [sp]
00087904  add     r2, sp, #0x50
00087906  add     r3, sp, r3
00087908  str     r0, [sp, #4]
0008790a  str     r1, [sp, #8]
0008790c  blx     #0xddbfc ; -> objc_msgSend
00087910  cmp     r0, #0
00087912  beq     #0x878d6
00087914  ldr     r1, [pc, #0x84]
00087916  ldr     r3, [sp, #0x58]
00087918  mov     r6, r0
0008791a  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
0008791c  ldr.w   sl, [r1]
00087920  ldr     r1, [pc, #0x7c]
00087922  ldr     r3, [r3]
00087924  add     r1, pc ; -> 0x000fcec0  
00087926  ldr.w   r8, [r1]
0008792a  str     r3, [sp, #0xc]
0008792c  movs    r5, #0
0008792e  b       #0x8793a
00087930  adds    r5, #1
00087932  cmp     r6, r5
00087934  bls     #0x87974
00087936  ldr     r3, [sp, #0x58]
00087938  ldr     r3, [r3]
0008793a  ldr     r2, [sp, #0xc]
0008793c  cmp     r2, r3
0008793e  beq     #0x8794e
00087940  ldr     r3, [pc, #0x60]
00087942  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087944  ldr     r3, [r3]
00087946  ldr.w   r0, [fp, r3]
0008794a  blx     #0xddbe4 ; -> objc_enumerationMutation
0008794e  ldr     r0, [sp, #0x54]
00087950  mov     r1, sl
00087952  mov     r2, r8
00087954  ldr.w   r4, [r0, r5, lsl #2]
00087958  mov     r0, r4
0008795a  blx     #0xddbfc ; -> objc_msgSend
0008795e  tst.w   r0, #0xff
00087962  beq     #0x87930
00087964  mov     r0, r4
00087966  mov     r1, r8
00087968  mov     r2, fp
0008796a  adds    r5, #1
0008796c  blx     #0xddbfc ; -> objc_msgSend
00087970  cmp     r6, r5
00087972  bhi     #0x87936
00087974  movs    r3, #0x10
00087976  ldr     r0, [sp, #4]
00087978  str     r3, [sp]
0008797a  ldr     r1, [sp, #8]
0008797c  add     r2, sp, #0x50
0008797e  add     r3, sp, r3
00087980  blx     #0xddbfc ; -> objc_msgSend
00087984  cmp     r0, #0
00087986  beq     #0x878d6
00087988  ldr     r3, [sp, #0x58]
0008798a  mov     r6, r0
0008798c  ldr     r3, [r3]
0008798e  b       #0x8792c
00087990  strb    r6, [r2, r3]
00087992  movs    r7, r0
00087994  b       #0x871cc
00087996  movs    r6, r0
00087998  str     r4, [r3, r2]
0008799a  movs    r7, r0
0008799c  strh    r2, [r6, r5]
0008799e  movs    r7, r0
000879a0  strb    r0, [r3, r6]
000879a2  movs    r7, r0
000879a4  b       #0x88124
000879a6  movs    r6, r0
