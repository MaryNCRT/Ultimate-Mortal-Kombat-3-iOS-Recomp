========================================================================
-[Social_Info setLeaderboard  0x000d62f8  76 bytes   Social_Info.mm
========================================================================

000d62f8  push    {r4, r5, r6, r7, lr}
000d62fa  add     r7, sp, #0xc
000d62fc  mov     r6, r2
000d62fe  ldr     r2, [pc, #0x30]
000d6300  ldr     r1, [pc, #0x30]
000d6302  add     r2, pc ; -> 0x000fb76c  OBJC_IVAR_$_Social_Info.leaderboardsIndex
000d6304  add     r1, pc ; -> 0x000fd5e0  
000d6306  ldr     r2, [r2]
000d6308  ldr     r4, [r1]
000d630a  ldr     r1, [pc, #0x2c]
000d630c  ldr     r5, [r0, r2]
000d630e  ldr     r0, [pc, #0x2c]
000d6310  ldr     r2, [pc, #0x2c]
000d6312  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6314  add     r0, pc ; -> 0x000fdb5c  
000d6316  add     r2, pc ; -> 0x0017e5c4  
000d6318  ldr     r1, [r1]
000d631a  ldr     r0, [r0]
000d631c  blx     #0xddbfc ; -> objc_msgSend
000d6320  mov     r1, r4
000d6322  mov     r2, r6
000d6324  mov     r3, r0
000d6326  mov     r0, r5
000d6328  blx     #0xddbfc ; -> objc_msgSend
000d632c  pop     {r4, r5, r6, r7, pc}
000d632e  nop     
000d6330  strb    r6, [r4, r1]
000d6332  movs    r2, r0
000d6334  strb    r0, [r3, #0xb]
000d6336  movs    r2, r0
000d6338  str     r2, [r1, #0x78]
000d633a  movs    r2, r0
000d633c  ldrb    r4, [r0, #1]
000d633e  movs    r2, r0
000d6340  strh    r2, [r5, #0x14]
000d6342  movs    r2, r1
