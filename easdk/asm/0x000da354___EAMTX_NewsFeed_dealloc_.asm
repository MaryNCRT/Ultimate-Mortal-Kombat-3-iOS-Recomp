========================================================================
-[EAMTX_NewsFeed dealloc]  0x000da354  164 bytes   EAMTX_NewsFeed.m
========================================================================

000da354  push    {r4, r5, r7, lr}
000da356  add     r7, sp, #8
000da358  sub     sp, #8
000da35a  ldr     r3, [pc, #0x78]
000da35c  ldr     r1, [pc, #0x78]
000da35e  mov     r4, r0
000da360  add     r3, pc ; -> 0x000fc2a0  OBJC_IVAR_$_EAMTX_NewsFeed.actionLink
000da362  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000da364  ldr     r3, [r3]
000da366  ldr     r5, [r1]
000da368  ldr     r0, [r0, r3]
000da36a  mov     r1, r5
000da36c  blx     #0xddbfc ; -> objc_msgSend
000da370  ldr     r3, [pc, #0x68]
000da372  mov     r1, r5
000da374  add     r3, pc ; -> 0x000fc29c  OBJC_IVAR_$_EAMTX_NewsFeed.categoryLabel
000da376  ldr     r3, [r3]
000da378  ldr     r0, [r4, r3]
000da37a  blx     #0xddbfc ; -> objc_msgSend
000da37e  ldr     r3, [pc, #0x60]
000da380  mov     r1, r5
000da382  add     r3, pc ; -> 0x000fc298  OBJC_IVAR_$_EAMTX_NewsFeed.createdDate
000da384  ldr     r3, [r3]
000da386  ldr     r0, [r4, r3]
000da388  blx     #0xddbfc ; -> objc_msgSend
000da38c  ldr     r3, [pc, #0x54]
000da38e  mov     r1, r5
000da390  add     r3, pc ; -> 0x000fc294  OBJC_IVAR_$_EAMTX_NewsFeed.imageURL
000da392  ldr     r3, [r3]
000da394  ldr     r0, [r4, r3]
000da396  blx     #0xddbfc ; -> objc_msgSend
000da39a  ldr     r3, [pc, #0x4c]
000da39c  mov     r1, r5
000da39e  add     r3, pc ; -> 0x000fc290  OBJC_IVAR_$_EAMTX_NewsFeed.message
000da3a0  ldr     r3, [r3]
000da3a2  ldr     r0, [r4, r3]
000da3a4  blx     #0xddbfc ; -> objc_msgSend
000da3a8  ldr     r3, [pc, #0x40]
000da3aa  mov     r1, r5
000da3ac  add     r3, pc ; -> 0x000fc28c  OBJC_IVAR_$_EAMTX_NewsFeed.metadata
000da3ae  ldr     r3, [r3]
000da3b0  ldr     r0, [r4, r3]
000da3b2  blx     #0xddbfc ; -> objc_msgSend
000da3b6  ldr     r3, [pc, #0x38]
000da3b8  ldr     r1, [pc, #0x38]
000da3ba  mov     r0, sp
000da3bc  add     r3, pc ; -> 0x000fddfc  
000da3be  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000da3c0  ldr     r3, [r3]
000da3c2  ldr     r1, [r1]
000da3c4  str     r4, [sp]
000da3c6  str     r3, [sp, #4]
000da3c8  blx     #0xddc08 ; -> objc_msgSendSuper2
000da3cc  sub.w   sp, r7, #8
000da3d0  pop     {r4, r5, r7, pc}
000da3d2  nop     
000da3d4  subs    r4, r7, #4
000da3d6  movs    r2, r0
000da3d8  movs    r6, #0x16
000da3da  movs    r2, r0
000da3dc  subs    r4, r4, #4
000da3de  movs    r2, r0
000da3e0  subs    r2, r2, #4
000da3e2  movs    r2, r0
000da3e4  subs    r0, r0, #4
000da3e6  movs    r2, r0
000da3e8  subs    r6, r5, #3
000da3ea  movs    r2, r0
000da3ec  subs    r4, r3, #3
000da3ee  movs    r2, r0
000da3f0  subs    r2, #0x3c
000da3f2  movs    r2, r0
000da3f4  movs    r5, #0xde
000da3f6  movs    r2, r0
