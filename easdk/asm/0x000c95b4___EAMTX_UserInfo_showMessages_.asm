========================================================================
-[EAMTX_UserInfo showMessages]  0x000c95b4  92 bytes   EAMTX_UserInfo.mm
========================================================================

000c95b4  push    {r4, r5, r7, lr}
000c95b6  add     r7, sp, #8
000c95b8  ldr     r4, [pc, #0x40]
000c95ba  ldr     r1, [pc, #0x44]
000c95bc  mov     r5, r0
000c95be  add     r4, pc ; -> 0x000f851c  OBJC_IVAR_$_EAMTX_UserInfo.m_Messages
000c95c0  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c95c2  ldr     r3, [r4]
000c95c4  ldr     r1, [r1]
000c95c6  ldr     r0, [r0, r3]
000c95c8  blx     #0xddbfc ; -> objc_msgSend
000c95cc  cbz     r0, #0xc95f8
000c95ce  ldr     r1, [pc, #0x34]
000c95d0  ldr     r3, [r4]
000c95d2  movs    r2, #0
000c95d4  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c95d6  ldr     r0, [r5, r3]
000c95d8  ldr     r1, [r1]
000c95da  blx     #0xddbfc ; -> objc_msgSend
000c95de  ldr     r1, [pc, #0x28]
000c95e0  mov     r2, r5
000c95e2  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000c95e4  ldr     r1, [r1]
000c95e6  mov     r4, r0
000c95e8  blx     #0xddbfc ; -> objc_msgSend
000c95ec  ldr     r1, [pc, #0x1c]
000c95ee  mov     r0, r4
000c95f0  add     r1, pc ; -> 0x000fcd8c  
000c95f2  ldr     r1, [r1]
000c95f4  blx     #0xddbfc ; -> objc_msgSend
000c95f8  pop     {r4, r5, r7, pc}
000c95fa  nop     
000c95fc  vhadd.s16 d16, d10, d2
000c9600  adds    r4, #0xbc
000c9602  movs    r3, r0
000c9604  adds    r4, #0xa4
000c9606  movs    r3, r0
000c9608  adds    r6, #0x92
000c960a  movs    r3, r0
000c960c  adds    r7, #0x98
000c960e  movs    r3, r0
