========================================================================
-[EAMTX_UserInfo messageFinished  0x000c9538  124 bytes   EAMTX_UserInfo.mm
========================================================================

000c9538  push    {r4, r5, r6, r7, lr}
000c953a  add     r7, sp, #0xc
000c953c  str     r8, [sp, #-0x4]!
000c9540  ldr     r4, [pc, #0x58]
000c9542  ldr     r1, [pc, #0x5c]
000c9544  sxtb.w  r8, r3
000c9548  add     r4, pc ; -> 0x000f851c  OBJC_IVAR_$_EAMTX_UserInfo.m_Messages
000c954a  add     r1, pc ; -> 0x000fd6e0  
000c954c  ldr     r3, [r4]
000c954e  mov     r5, r0
000c9550  ldr     r1, [r1]
000c9552  mov     r6, r2
000c9554  ldr     r0, [r0, r3]
000c9556  blx     #0xddbfc ; -> objc_msgSend
000c955a  cmp.w   r8, #0
000c955e  bne     #0xc9594
000c9560  ldr     r1, [pc, #0x40]
000c9562  ldr     r3, [r4]
000c9564  mov     r2, r6
000c9566  add     r1, pc ; -> 0x000fcd7c  'lz\x0e'
000c9568  ldr     r0, [r5, r3]
000c956a  ldr     r1, [r1]
000c956c  blx     #0xddbfc ; -> objc_msgSend
000c9570  ldr     r1, [pc, #0x34]
000c9572  ldr     r3, [pc, #0x38]
000c9574  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c9576  add     r3, pc ; -> 0x000f8520  OBJC_IVAR_$_EAMTX_UserInfo.m_ExcludedMessageIds
000c9578  ldr     r4, [r1]
000c957a  ldr     r1, [pc, #0x34]
000c957c  ldr     r0, [r3]
000c957e  add     r1, pc ; -> 0x000fd79c  
000c9580  ldr     r5, [r5, r0]
000c9582  ldr     r1, [r1]
000c9584  mov     r0, r6
000c9586  blx     #0xddbfc ; -> objc_msgSend
000c958a  mov     r1, r4
000c958c  mov     r2, r0
000c958e  mov     r0, r5
000c9590  blx     #0xddbfc ; -> objc_msgSend
000c9594  ldr     r8, [sp], #4
000c9598  pop     {r4, r5, r6, r7, pc}
000c959a  nop     
000c959c  vaddl.s16 q8, d0, d2
000c95a0  sbcs    r2, r2
000c95a2  movs    r3, r0
000c95a4  subs    r0, #0x12
000c95a6  movs    r3, r0
000c95a8  adds    r5, #0xc
000c95aa  movs    r3, r0
000c95ac  vaddl.s32 q0, d6, d2
000c95b0  tst     r2, r3
000c95b2  movs    r3, r0
