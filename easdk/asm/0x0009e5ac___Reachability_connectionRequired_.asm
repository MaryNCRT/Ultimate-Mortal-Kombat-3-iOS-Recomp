========================================================================
-[Reachability connectionRequired]  0x0009e5ac  44 bytes   Reachability.m
========================================================================

0009e5ac  push    {r7, lr}
0009e5ae  add     r7, sp, #0
0009e5b0  sub     sp, #4
0009e5b2  ldr     r3, [pc, #0x20]
0009e5b4  mov     r1, sp
0009e5b6  add     r3, pc ; -> 0x000f6660  OBJC_IVAR_$_Reachability.reachabilityRef
0009e5b8  ldr     r3, [r3]
0009e5ba  ldr     r0, [r0, r3]
0009e5bc  blx     #0xdd44c ; -> SCNetworkReachabilityGetFlags
0009e5c0  cbz     r0, #0x9e5ca
0009e5c2  ldrb.w  r0, [sp]
0009e5c6  and     r0, r0, #4
0009e5ca  sxtb    r0, r0
0009e5cc  sub.w   sp, r7, #0
0009e5d0  pop     {r7, pc}
0009e5d2  nop     
0009e5d4  strh    r6, [r4, #4]
0009e5d6  movs    r5, r0
