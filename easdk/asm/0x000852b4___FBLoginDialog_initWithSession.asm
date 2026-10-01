========================================================================
-[FBLoginDialog initWithSession  0x000852b4  60 bytes   FBLoginDialog.m
========================================================================

000852b4  push    {r7, lr}
000852b6  add     r7, sp, #0
000852b8  sub     sp, #8
000852ba  ldr     r3, [pc, #0x28]
000852bc  ldr     r1, [pc, #0x28]
000852be  str     r0, [sp]
000852c0  add     r3, pc ; -> 0x000fdd40  
000852c2  add     r1, pc ; -> 0x000fccd8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x360
000852c4  ldr     r3, [r3]
000852c6  ldr     r1, [r1]
000852c8  mov     r0, sp
000852ca  str     r3, [sp, #4]
000852cc  blx     #0xddc08 ; -> objc_msgSendSuper2
000852d0  cbz     r0, #0x852dc
000852d2  ldr     r3, [pc, #0x18]
000852d4  movs    r2, #0
000852d6  add     r3, pc ; -> 0x000f5520  OBJC_IVAR_$_FBLoginDialog._getSessionRequest
000852d8  ldr     r3, [r3]
000852da  str     r2, [r0, r3]
000852dc  sub.w   sp, r7, #0
000852e0  pop     {r7, pc}
000852e2  nop     
000852e4  ldrh    r4, [r7, #0x12]
000852e6  movs    r7, r0
000852e8  ldrb    r2, [r2, #8]
000852ea  movs    r7, r0
000852ec  lsls    r6, r0, #9
000852ee  movs    r7, r0
