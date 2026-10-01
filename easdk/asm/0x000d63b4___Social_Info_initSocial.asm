========================================================================
-[Social_Info initSocial  0x000d63b4  260 bytes   Social_Info.mm
========================================================================

000d63b4  push    {r4, r5, r6, r7, lr}
000d63b6  add     r7, sp, #0xc
000d63b8  push.w  {r8, sl}
000d63bc  ldr     r3, [pc, #0xc0]
000d63be  mov     r4, r0
000d63c0  mov     r8, r2
000d63c2  add     r3, pc ; -> 0x000fae60  OBJC_IVAR_$_Social_Info.mFacebookAgent
000d63c4  ldr     r0, [r3]
000d63c6  ldr     r0, [r4, r0]
000d63c8  cbz     r0, #0xd63d4
000d63ca  ldr     r1, [pc, #0xb8]
000d63cc  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d63ce  ldr     r1, [r1]
000d63d0  blx     #0xddbfc ; -> objc_msgSend
000d63d4  ldr     r1, [pc, #0xb0]
000d63d6  ldr     r3, [pc, #0xb4]
000d63d8  ldr     r0, [pc, #0xb4]
000d63da  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d63dc  add     r3, pc ; -> 0x000fb778  OBJC_IVAR_$_Social_Info.renewToken
000d63de  ldr.w   sl, [r1]
000d63e2  ldr     r5, [pc, #0xb0]
000d63e4  ldr     r3, [r3]
000d63e6  add     r0, pc ; -> 0x000fdcd0  
000d63e8  add     r5, pc ; -> 0x000fae60  OBJC_IVAR_$_Social_Info.mFacebookAgent
000d63ea  mov     r1, sl
000d63ec  ldr     r0, [r0]
000d63ee  movs    r2, #0
000d63f0  strb    r2, [r4, r3]
000d63f2  ldr     r6, [r5]
000d63f4  blx     #0xddbfc ; -> objc_msgSend
000d63f8  ldr     r3, [pc, #0x9c]
000d63fa  ldr     r1, [pc, #0xa0]
000d63fc  mov     r2, r8
000d63fe  add     r3, pc ; -> 0x000fb77c  OBJC_IVAR_$_Social_Info.permissions
000d6400  add     r1, pc ; -> 0x000fd7ec  'M\x0c\x0f'
000d6402  ldr     r3, [r3]
000d6404  ldr     r1, [r1]
000d6406  ldr     r3, [r4, r3]
000d6408  blx     #0xddbfc ; -> objc_msgSend
000d640c  ldr     r1, [pc, #0x90]
000d640e  mov     r2, r4
000d6410  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000d6412  ldr     r1, [r1]
000d6414  str     r0, [r4, r6]
000d6416  ldr     r3, [r5]
000d6418  ldr     r0, [r4, r3]
000d641a  blx     #0xddbfc ; -> objc_msgSend
000d641e  ldr     r0, [pc, #0x84]
000d6420  ldr     r3, [pc, #0x84]
000d6422  mov     r1, sl
000d6424  add     r0, pc ; -> 0x000fdbf4  
000d6426  add     r3, pc ; -> 0x000fb76c  OBJC_IVAR_$_Social_Info.leaderboardsIndex
000d6428  ldr     r6, [r0]
000d642a  ldr.w   r8, [r3]
000d642e  mov     r0, r6
000d6430  blx     #0xddbfc ; -> objc_msgSend
000d6434  ldr     r1, [pc, #0x74]
000d6436  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d6438  ldr     r5, [r1]
000d643a  mov     r1, r5
000d643c  blx     #0xddbfc ; -> objc_msgSend
000d6440  ldr     r3, [pc, #0x6c]
000d6442  mov     r1, sl
000d6444  add     r3, pc ; -> 0x000fae64  OBJC_IVAR_$_Social_Info.friendsLBQ
000d6446  str.w   r0, [r4, r8]
000d644a  mov     r0, r6
000d644c  ldr.w   r8, [r3]
000d6450  blx     #0xddbfc ; -> objc_msgSend
000d6454  mov     r1, r5
000d6456  blx     #0xddbfc ; -> objc_msgSend
000d645a  ldr     r3, [pc, #0x58]
000d645c  mov     r1, sl
000d645e  add     r3, pc ; -> 0x000fae68  OBJC_IVAR_$_Social_Info.friendsIdsQ
000d6460  str.w   r0, [r4, r8]
000d6464  mov     r0, r6
000d6466  ldr.w   r8, [r3]
000d646a  blx     #0xddbfc ; -> objc_msgSend
000d646e  mov     r1, r5
000d6470  blx     #0xddbfc ; -> objc_msgSend
000d6474  str.w   r0, [r4, r8]
000d6478  pop.w   {r8, sl}
000d647c  pop     {r4, r5, r6, r7, pc}
000d647e  nop     
000d6480  ldr     r2, [pc, #0x268]
000d6482  movs    r2, r0
000d6484  str     r4, [r5, #0x58]
000d6486  movs    r2, r0
000d6488  str     r6, [r4, #0x58]
000d648a  movs    r2, r0
000d648c  strh    r0, [r3, r6]
000d648e  movs    r2, r0
000d6490  ldrb    r6, [r4, #3]
000d6492  movs    r2, r0
000d6494  ldr     r2, [pc, #0x1d0]
000d6496  movs    r2, r0
000d6498  strh    r2, [r7, r5]
000d649a  movs    r2, r0
000d649c  strb    r0, [r5, #0xf]
000d649e  movs    r2, r0
000d64a0  ldr     r4, [r4, #4]
000d64a2  movs    r2, r0
000d64a4  strb    r4, [r1, #0x1f]
000d64a6  movs    r2, r0
000d64a8  strh    r2, [r0, r5]
000d64aa  movs    r2, r0
000d64ac  str     r6, [r0, #0x54]
000d64ae  movs    r2, r0
000d64b0  ldr     r2, [pc, #0x70]
000d64b2  movs    r2, r0
000d64b4  ldr     r2, [pc, #0x18]
000d64b6  movs    r2, r0
