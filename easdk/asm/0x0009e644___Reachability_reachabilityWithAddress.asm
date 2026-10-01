========================================================================
+[Reachability reachabilityWithAddress  0x0009e644  104 bytes   Reachability.m
========================================================================

0009e644  push    {r4, r5, r7, lr}
0009e646  add     r7, sp, #8
0009e648  mov     r5, r0
0009e64a  ldr     r0, [pc, #0x48]
0009e64c  mov     r1, r2
0009e64e  add     r0, pc ; -> 0x000f3020  0x0
0009e650  ldr     r0, [r0]
0009e652  ldr     r0, [r0]
0009e654  blx     #0xdd434 ; -> SCNetworkReachabilityCreateWithAddress
0009e658  mov     r4, r0
0009e65a  cbz     r0, #0x9e690
0009e65c  ldr     r1, [pc, #0x38]
0009e65e  mov     r0, r5
0009e660  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0009e662  ldr     r1, [r1]
0009e664  blx     #0xddbfc ; -> objc_msgSend
0009e668  ldr     r1, [pc, #0x30]
0009e66a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0009e66c  ldr     r1, [r1]
0009e66e  blx     #0xddbfc ; -> objc_msgSend
0009e672  ldr     r1, [pc, #0x2c]
0009e674  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0009e676  ldr     r1, [r1]
0009e678  blx     #0xddbfc ; -> objc_msgSend
0009e67c  cbz     r0, #0x9e690
0009e67e  ldr     r3, [pc, #0x24]
0009e680  movs    r2, #0
0009e682  add     r3, pc ; -> 0x000f6660  OBJC_IVAR_$_Reachability.reachabilityRef
0009e684  ldr     r3, [r3]
0009e686  str     r4, [r0, r3]
0009e688  ldr     r3, [pc, #0x1c]
0009e68a  add     r3, pc ; -> 0x000f665c  OBJC_IVAR_$_Reachability.localWiFiRef
0009e68c  ldr     r3, [r3]
0009e68e  strb    r2, [r0, r3]
0009e690  pop     {r4, r5, r7, pc}
0009e692  nop     
0009e694  ldr     r1, [pc, #0x338]
0009e696  movs    r5, r0
0009e698  b       #0x9ecdc
0009e69a  movs    r5, r0
0009e69c  b       #0x9ecc4
0009e69e  movs    r5, r0
0009e6a0  b       #0x9ee64
0009e6a2  movs    r5, r0
0009e6a4  ldrb    r2, [r3, #0x1f]
0009e6a6  movs    r5, r0
0009e6a8  ldrb    r6, [r1, #0x1f]
0009e6aa  movs    r5, r0
