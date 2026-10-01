========================================================================
-[Facebook parseURLParams  0x000db2b4  316 bytes   Facebook.m
========================================================================

000db2b4  push    {r4, r5, r6, r7, lr}
000db2b6  add     r7, sp, #0xc
000db2b8  push.w  {r8, sl, fp}
000db2bc  sub     sp, #0x80
000db2be  ldr     r1, [pc, #0x104]
000db2c0  mov     r0, r2
000db2c2  ldr     r2, [pc, #0x104]
000db2c4  add     r1, pc ; -> 0x000fcf98  '\x1bU\x0e'
000db2c6  ldr     r1, [r1]
000db2c8  add     r2, pc ; -> 0x0017e8a4  
000db2ca  str     r1, [sp, #8]
000db2cc  blx     #0xddbfc ; -> objc_msgSend
000db2d0  ldr     r1, [pc, #0xf8]
000db2d2  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000db2d4  ldr     r1, [r1]
000db2d6  str     r0, [sp, #0x18]
000db2d8  ldr     r0, [pc, #0xf4]
000db2da  add     r0, pc ; -> 0x000fdbf4  
000db2dc  ldr     r0, [r0]
000db2de  blx     #0xddbfc ; -> objc_msgSend
000db2e2  ldr     r1, [pc, #0xf0]
000db2e4  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000db2e6  ldr     r1, [r1]
000db2e8  blx     #0xddbfc ; -> objc_msgSend
000db2ec  ldr     r1, [pc, #0xe8]
000db2ee  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000db2f0  ldr     r1, [r1]
000db2f2  blx     #0xddbfc ; -> objc_msgSend
000db2f6  ldr     r1, [pc, #0xe4]
000db2f8  movs    r3, #0
000db2fa  add     r2, sp, #0x60
000db2fc  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000db2fe  str     r3, [sp, #0x60]
000db300  ldr     r1, [r1]
000db302  str     r3, [sp, #0x64]
000db304  str     r3, [sp, #0x68]
000db306  str     r3, [sp, #0x6c]
000db308  str     r3, [sp, #0x70]
000db30a  str     r3, [sp, #0x74]
000db30c  str     r3, [sp, #0x78]
000db30e  str     r3, [sp, #0x7c]
000db310  adds    r3, #0x10
000db312  str     r3, [sp]
000db314  add     r3, sp, #0x20
000db316  str     r1, [sp, #0x10]
000db318  str     r0, [sp, #0xc]
000db31a  ldr     r0, [sp, #0x18]
000db31c  blx     #0xddbfc ; -> objc_msgSend
000db320  cmp     r0, #0
000db322  beq     #0xdb3b6
000db324  ldr     r1, [pc, #0xb8]
000db326  ldr     r3, [sp, #0x68]
000db328  mov     sl, r0
000db32a  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000db32c  ldr.w   r8, [r1]
000db330  ldr     r1, [pc, #0xb0]
000db332  ldr     r2, [r3]
000db334  add     r1, pc ; -> 0x000fd774  
000db336  ldr     r1, [r1]
000db338  str     r2, [sp, #0x1c]
000db33a  ldr     r2, [pc, #0xac]
000db33c  str     r1, [sp, #0x14]
000db33e  ldr     r1, [pc, #0xac]
000db340  str     r2, [sp, #4]
000db342  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000db344  ldr.w   fp, [r1]
000db348  b       #0xdb34c
000db34a  ldr     r3, [sp, #0x68]
000db34c  movs    r6, #0
000db34e  b       #0xdb352
000db350  ldr     r3, [sp, #0x68]
000db352  ldr     r3, [r3]
000db354  ldr     r2, [sp, #0x1c]
000db356  cmp     r3, r2
000db358  beq     #0xdb360
000db35a  ldr     r0, [sp, #0x18]
000db35c  blx     #0xddbe4 ; -> objc_enumerationMutation
000db360  ldr     r3, [sp, #0x64]
000db362  ldr     r2, [sp, #4]
000db364  ldr     r1, [sp, #8]
000db366  ldr.w   r0, [r3, r6, lsl #2]
000db36a  add     r2, pc
000db36c  blx     #0xddbfc ; -> objc_msgSend
000db370  movs    r2, #1
000db372  mov     r1, r8
000db374  adds    r6, #1
000db376  mov     r4, r0
000db378  blx     #0xddbfc ; -> objc_msgSend
000db37c  movs    r2, #4
000db37e  ldr     r1, [sp, #0x14]
000db380  blx     #0xddbfc ; -> objc_msgSend
000db384  movs    r2, #0
000db386  mov     r1, r8
000db388  mov     r5, r0
000db38a  mov     r0, r4
000db38c  blx     #0xddbfc ; -> objc_msgSend
000db390  mov     r1, fp
000db392  mov     r2, r5
000db394  mov     r3, r0
000db396  ldr     r0, [sp, #0xc]
000db398  blx     #0xddbfc ; -> objc_msgSend
000db39c  cmp     sl, r6
000db39e  bhi     #0xdb350
000db3a0  movs    r3, #0x10
000db3a2  ldr     r0, [sp, #0x18]
000db3a4  str     r3, [sp]
000db3a6  ldr     r1, [sp, #0x10]
000db3a8  add     r2, sp, #0x60
000db3aa  add     r3, sp, #0x20
000db3ac  blx     #0xddbfc ; -> objc_msgSend
000db3b0  mov     sl, r0
000db3b2  cmp     r0, #0
000db3b4  bne     #0xdb34a
000db3b6  ldr     r0, [sp, #0xc]
000db3b8  sub.w   sp, r7, #0x18
000db3bc  pop.w   {r8, sl, fp}
000db3c0  pop     {r4, r5, r6, r7, pc}
000db3c2  nop     
000db3c4  adds    r0, r2, #3
000db3c6  movs    r2, r0
000db3c8  adds    r5, #0xd8
000db3ca  movs    r2, r1
000db3cc  asrs    r6, r5, #0x1a
000db3ce  movs    r2, r0
000db3d0  cmp     r1, #0x16
000db3d2  movs    r2, r0
000db3d4  asrs    r0, r3, #0x1a
000db3d6  movs    r2, r0
000db3d8  asrs    r6, r4, #0x1d
000db3da  movs    r2, r0
000db3dc  asrs    r0, r3, #0x1a
000db3de  movs    r2, r0
000db3e0  asrs    r6, r1, #0x1d
000db3e2  movs    r2, r0
000db3e4  movs    r4, #0x3c
000db3e6  movs    r2, r0
000db3e8  subs    r0, #0x96
000db3ea  movs    r2, r1
000db3ec  asrs    r2, r2, #0x1e
000db3ee  movs    r2, r0
