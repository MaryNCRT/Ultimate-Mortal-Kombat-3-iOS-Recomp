========================================================================
-[FacebookAgent tokenExpired  0x000dc014  88 bytes   FacebookAgent.mm
========================================================================

000dc014  push    {r4, r5, r6, r7, lr}
000dc016  add     r7, sp, #0xc
000dc018  str     r8, [sp, #-0x4]!
000dc01c  ldr     r1, [pc, #0x3c]
000dc01e  ldr     r4, [pc, #0x40]
000dc020  mov     r6, r0
000dc022  add     r1, pc ; -> 0x000fd9c4  
000dc024  add     r4, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dc026  ldr     r5, [r1]
000dc028  ldr     r1, [pc, #0x38]
000dc02a  ldr     r3, [r4]
000dc02c  mov     r8, r2
000dc02e  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dc030  mov     r2, r5
000dc032  ldr     r0, [r0, r3]
000dc034  ldr     r1, [r1]
000dc036  blx     #0xddbfc ; -> objc_msgSend
000dc03a  tst.w   r0, #0xff
000dc03e  beq     #0xdc04a
000dc040  ldr     r0, [r4]
000dc042  mov     r1, r5
000dc044  ldr     r0, [r6, r0]
000dc046  blx     #0xddbfc ; -> objc_msgSend
000dc04a  ldr     r1, [pc, #0x1c]
000dc04c  mov     r0, r8
000dc04e  add     r1, pc ; -> 0x000fc9b0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x38
000dc050  ldr     r1, [r1]
000dc052  blx     #0xddbfc ; -> objc_msgSend
000dc056  ldr     r8, [sp], #4
000dc05a  pop     {r4, r5, r6, r7, pc}
000dc05c  adds    r6, r3, r6
000dc05e  movs    r2, r0
000dc060  lsrs    r0, r1, #2
000dc062  movs    r2, r0
000dc064  lsrs    r6, r3, #0x11
000dc066  movs    r2, r0
000dc068  lsrs    r6, r3, #5
000dc06a  movs    r2, r0
