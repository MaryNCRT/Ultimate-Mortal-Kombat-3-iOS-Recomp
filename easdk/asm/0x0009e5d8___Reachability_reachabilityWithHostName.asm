========================================================================
+[Reachability reachabilityWithHostName  0x0009e5d8  108 bytes   Reachability.m
========================================================================

0009e5d8  push    {r4, r5, r7, lr}
0009e5da  add     r7, sp, #8
0009e5dc  ldr     r1, [pc, #0x4c]
0009e5de  mov     r5, r0
0009e5e0  mov     r0, r2
0009e5e2  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
0009e5e4  ldr     r1, [r1]
0009e5e6  blx     #0xddbfc ; -> objc_msgSend
0009e5ea  mov     r1, r0
0009e5ec  movs    r0, #0
0009e5ee  blx     #0xdd440 ; -> SCNetworkReachabilityCreateWithName
0009e5f2  mov     r4, r0
0009e5f4  cbz     r0, #0x9e62a
0009e5f6  ldr     r1, [pc, #0x38]
0009e5f8  mov     r0, r5
0009e5fa  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0009e5fc  ldr     r1, [r1]
0009e5fe  blx     #0xddbfc ; -> objc_msgSend
0009e602  ldr     r1, [pc, #0x30]
0009e604  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0009e606  ldr     r1, [r1]
0009e608  blx     #0xddbfc ; -> objc_msgSend
0009e60c  ldr     r1, [pc, #0x28]
0009e60e  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0009e610  ldr     r1, [r1]
0009e612  blx     #0xddbfc ; -> objc_msgSend
0009e616  cbz     r0, #0x9e62a
0009e618  ldr     r3, [pc, #0x20]
0009e61a  movs    r2, #0
0009e61c  add     r3, pc ; -> 0x000f6660  OBJC_IVAR_$_Reachability.reachabilityRef
0009e61e  ldr     r3, [r3]
0009e620  str     r4, [r0, r3]
0009e622  ldr     r3, [pc, #0x1c]
0009e624  add     r3, pc ; -> 0x000f665c  OBJC_IVAR_$_Reachability.localWiFiRef
0009e626  ldr     r3, [r3]
0009e628  strb    r2, [r0, r3]
0009e62a  pop     {r4, r5, r7, pc}
0009e62c  b       #0x9dea4
0009e62e  movs    r5, r0
0009e630  b       #0x9ed40
0009e632  movs    r5, r0
0009e634  b       #0x9ed28
0009e636  movs    r5, r0
0009e638  b       #0x9dec8
0009e63a  movs    r5, r0
0009e63c  strh    r0, [r0, #2]
0009e63e  movs    r5, r0
0009e640  strh    r4, [r6]
0009e642  movs    r5, r0
