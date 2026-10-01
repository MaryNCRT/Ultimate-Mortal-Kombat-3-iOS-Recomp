========================================================================
ReachabilityCallback  0x0009e46c  112 bytes   Reachability.m
========================================================================

0009e46c  push    {r4, r5, r7, lr}
0009e46e  add     r7, sp, #8
0009e470  ldr     r0, [pc, #0x48]
0009e472  ldr     r1, [pc, #0x4c]
0009e474  mov     r5, r2
0009e476  add     r0, pc ; -> 0x000fdb3c  
0009e478  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0009e47a  ldr     r0, [r0]
0009e47c  ldr     r1, [r1]
0009e47e  blx     #0xddbfc ; -> objc_msgSend
0009e482  ldr     r1, [pc, #0x40]
0009e484  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0009e486  ldr     r1, [r1]
0009e488  blx     #0xddbfc ; -> objc_msgSend
0009e48c  ldr     r1, [pc, #0x38]
0009e48e  add     r1, pc ; -> 0x000fca30  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xb8
0009e490  ldr     r1, [r1]
0009e492  mov     r4, r0
0009e494  ldr     r0, [pc, #0x34]
0009e496  add     r0, pc ; -> 0x000fdb68  
0009e498  ldr     r0, [r0]
0009e49a  blx     #0xddbfc ; -> objc_msgSend
0009e49e  ldr     r1, [pc, #0x30]
0009e4a0  ldr     r2, [pc, #0x30]
0009e4a2  mov     r3, r5
0009e4a4  add     r1, pc ; -> 0x000fca2c  'B\\\x0e'
0009e4a6  add     r2, pc ; -> 0x0017f414  
0009e4a8  ldr     r1, [r1]
0009e4aa  blx     #0xddbfc ; -> objc_msgSend
0009e4ae  ldr     r1, [pc, #0x28]
0009e4b0  mov     r0, r4
0009e4b2  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
0009e4b4  ldr     r1, [r1]
0009e4b6  blx     #0xddbfc ; -> objc_msgSend
0009e4ba  pop     {r4, r5, r7, pc}
0009e4bc  movt    r0, #0x2805
0009e4c0  b       #0x9ded4
0009e4c2  movs    r5, r0
0009e4c4  b       #0x9deb8
0009e4c6  movs    r5, r0
0009e4c8  b       #0x9e008
0009e4ca  movs    r5, r0
0009e4cc  movt    r0, #0xe805
0009e4d0  b       #0x9dfdc
0009e4d2  movs    r5, r0
0009e4d4  lsrs    r2, r5, #0x1d
0009e4d6  movs    r6, r1
0009e4d8  b       #0x9de68
0009e4da  movs    r5, r0
