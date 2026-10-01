========================================================================
-[SocialUser dealloc]  0x000d89b4  216 bytes   SocialUser.m
========================================================================

000d89b4  push    {r4, r5, r7, lr}
000d89b6  add     r7, sp, #8
000d89b8  sub     sp, #8
000d89ba  ldr     r3, [pc, #0xa0]
000d89bc  ldr     r1, [pc, #0xa0]
000d89be  mov     r5, r0
000d89c0  add     r3, pc ; -> 0x000fbd78  OBJC_IVAR_$_SocialUser.first_name
000d89c2  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d89c4  ldr     r3, [r3]
000d89c6  ldr     r4, [r1]
000d89c8  ldr     r0, [r0, r3]
000d89ca  mov     r1, r4
000d89cc  blx     #0xddbfc ; -> objc_msgSend
000d89d0  ldr     r3, [pc, #0x90]
000d89d2  mov     r1, r4
000d89d4  add     r3, pc ; -> 0x000fbd74  OBJC_IVAR_$_SocialUser.last_name
000d89d6  ldr     r3, [r3]
000d89d8  ldr     r0, [r5, r3]
000d89da  blx     #0xddbfc ; -> objc_msgSend
000d89de  ldr     r3, [pc, #0x88]
000d89e0  mov     r1, r4
000d89e2  add     r3, pc ; -> 0x000fbd70  OBJC_IVAR_$_SocialUser.full_name
000d89e4  ldr     r3, [r3]
000d89e6  ldr     r0, [r5, r3]
000d89e8  blx     #0xddbfc ; -> objc_msgSend
000d89ec  ldr     r3, [pc, #0x7c]
000d89ee  mov     r1, r4
000d89f0  add     r3, pc ; -> 0x000fbd6c  OBJC_IVAR_$_SocialUser.pic_square
000d89f2  ldr     r3, [r3]
000d89f4  ldr     r0, [r5, r3]
000d89f6  blx     #0xddbfc ; -> objc_msgSend
000d89fa  ldr     r3, [pc, #0x74]
000d89fc  mov     r1, r4
000d89fe  add     r3, pc ; -> 0x000fbd68  OBJC_IVAR_$_SocialUser.facebookUserId
000d8a00  ldr     r3, [r3]
000d8a02  ldr     r0, [r5, r3]
000d8a04  blx     #0xddbfc ; -> objc_msgSend
000d8a08  ldr     r3, [pc, #0x68]
000d8a0a  mov     r1, r4
000d8a0c  add     r3, pc ; -> 0x000fbd80  OBJC_IVAR_$_SocialUser.picture
000d8a0e  ldr     r3, [r3]
000d8a10  ldr     r0, [r5, r3]
000d8a12  blx     #0xddbfc ; -> objc_msgSend
000d8a16  ldr     r3, [pc, #0x60]
000d8a18  mov     r1, r4
000d8a1a  add     r3, pc ; -> 0x000fbd64  OBJC_IVAR_$_SocialUser.mayhemUserId
000d8a1c  ldr     r3, [r3]
000d8a1e  ldr     r0, [r5, r3]
000d8a20  blx     #0xddbfc ; -> objc_msgSend
000d8a24  ldr     r3, [pc, #0x54]
000d8a26  mov     r1, r4
000d8a28  add     r3, pc ; -> 0x000fbd60  OBJC_IVAR_$_SocialUser.challengeId
000d8a2a  ldr     r3, [r3]
000d8a2c  ldr     r0, [r5, r3]
000d8a2e  blx     #0xddbfc ; -> objc_msgSend
000d8a32  ldr     r3, [pc, #0x4c]
000d8a34  mov     r1, r4
000d8a36  add     r3, pc ; -> 0x000fbd5c  OBJC_IVAR_$_SocialUser.metaData
000d8a38  ldr     r3, [r3]
000d8a3a  ldr     r0, [r5, r3]
000d8a3c  blx     #0xddbfc ; -> objc_msgSend
000d8a40  ldr     r3, [pc, #0x40]
000d8a42  ldr     r1, [pc, #0x44]
000d8a44  mov     r0, sp
000d8a46  add     r3, pc ; -> 0x000fddf0  
000d8a48  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d8a4a  ldr     r3, [r3]
000d8a4c  ldr     r1, [r1]
000d8a4e  str     r5, [sp]
000d8a50  str     r3, [sp, #4]
000d8a52  blx     #0xddc08 ; -> objc_msgSendSuper2
000d8a56  sub.w   sp, r7, #8
000d8a5a  pop     {r4, r5, r7, pc}
000d8a5c  adds    r3, #0xb4
000d8a5e  movs    r2, r0
000d8a60  subs    r7, #0xb6
000d8a62  movs    r2, r0
000d8a64  adds    r3, #0x9c
000d8a66  movs    r2, r0
000d8a68  adds    r3, #0x8a
000d8a6a  movs    r2, r0
000d8a6c  adds    r3, #0x78
000d8a6e  movs    r2, r0
000d8a70  adds    r3, #0x66
000d8a72  movs    r2, r0
000d8a74  adds    r3, #0x70
000d8a76  movs    r2, r0
000d8a78  adds    r3, #0x46
000d8a7a  movs    r2, r0
000d8a7c  adds    r3, #0x34
000d8a7e  movs    r2, r0
000d8a80  adds    r3, #0x22
000d8a82  movs    r2, r0
000d8a84  strh    r6, [r4, r6]
000d8a86  movs    r2, r0
000d8a88  subs    r7, #0x54
000d8a8a  movs    r2, r0
