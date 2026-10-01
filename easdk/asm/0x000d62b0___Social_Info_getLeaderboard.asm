========================================================================
-[Social_Info getLeaderboard  0x000d62b0  72 bytes   Social_Info.mm
========================================================================

000d62b0  push    {r4, r5, r7, lr}
000d62b2  add     r7, sp, #8
000d62b4  mov     r3, r2
000d62b6  ldr     r2, [pc, #0x2c]
000d62b8  ldr     r1, [pc, #0x2c]
000d62ba  add     r2, pc ; -> 0x000fb76c  OBJC_IVAR_$_Social_Info.leaderboardsIndex
000d62bc  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000d62be  ldr     r2, [r2]
000d62c0  ldr     r4, [r1]
000d62c2  ldr     r1, [pc, #0x28]
000d62c4  ldr     r5, [r0, r2]
000d62c6  ldr     r0, [pc, #0x28]
000d62c8  ldr     r2, [pc, #0x28]
000d62ca  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d62cc  add     r0, pc ; -> 0x000fdb5c  
000d62ce  add     r2, pc ; -> 0x0017e5c4  
000d62d0  ldr     r1, [r1]
000d62d2  ldr     r0, [r0]
000d62d4  blx     #0xddbfc ; -> objc_msgSend
000d62d8  mov     r1, r4
000d62da  mov     r2, r0
000d62dc  mov     r0, r5
000d62de  blx     #0xddbfc ; -> objc_msgSend
000d62e2  pop     {r4, r5, r7, pc}
000d62e4  strb    r6, [r5, r2]
000d62e6  movs    r2, r0
000d62e8  ldr     r0, [r6]
000d62ea  movs    r2, r0
000d62ec  str     r2, [r2, #0x7c]
000d62ee  movs    r2, r0
000d62f0  ldrb    r4, [r1, #2]
000d62f2  movs    r2, r0
000d62f4  strh    r2, [r6, #0x16]
000d62f6  movs    r2, r1
