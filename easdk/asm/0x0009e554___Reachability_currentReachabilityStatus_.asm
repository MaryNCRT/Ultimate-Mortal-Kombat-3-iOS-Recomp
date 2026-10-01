========================================================================
-[Reachability currentReachabilityStatus]  0x0009e554  88 bytes   Reachability.m
========================================================================

0009e554  push    {r4, r7, lr}
0009e556  add     r7, sp, #4
0009e558  sub     sp, #4
0009e55a  ldr     r3, [pc, #0x40]
0009e55c  mov     r4, r0
0009e55e  mov     r1, sp
0009e560  add     r3, pc ; -> 0x000f6660  OBJC_IVAR_$_Reachability.reachabilityRef
0009e562  ldr     r3, [r3]
0009e564  ldr     r0, [r0, r3]
0009e566  blx     #0xdd44c ; -> SCNetworkReachabilityGetFlags
0009e56a  cbz     r0, #0x9e584
0009e56c  ldr     r3, [pc, #0x30]
0009e56e  add     r3, pc ; -> 0x000f665c  OBJC_IVAR_$_Reachability.localWiFiRef
0009e570  ldr     r3, [r3]
0009e572  ldrsb   r3, [r4, r3]
0009e574  cbz     r3, #0x9e58a
0009e576  ldr     r1, [pc, #0x2c]
0009e578  mov     r0, r4
0009e57a  ldr     r2, [sp]
0009e57c  add     r1, pc ; -> 0x000fd014  
0009e57e  ldr     r1, [r1]
0009e580  blx     #0xddbfc ; -> objc_msgSend
0009e584  sub.w   sp, r7, #4
0009e588  pop     {r4, r7, pc}
0009e58a  ldr     r1, [pc, #0x1c]
0009e58c  mov     r0, r4
0009e58e  ldr     r2, [sp]
0009e590  add     r1, pc ; -> 0x000fd010  
0009e592  ldr     r1, [r1]
0009e594  blx     #0xddbfc ; -> objc_msgSend
0009e598  b       #0x9e584
0009e59a  nop     
0009e59c  strh    r4, [r7, #6]
0009e59e  movs    r5, r0
0009e5a0  strh    r2, [r5, #6]
0009e5a2  movs    r5, r0
0009e5a4  eors.w  r0, r4, r5
0009e5a8  orns    r0, ip, r5
