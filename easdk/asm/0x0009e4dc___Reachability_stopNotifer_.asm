========================================================================
-[Reachability stopNotifer]  0x0009e4dc  44 bytes   Reachability.m
========================================================================

0009e4dc  push    {r4, r7, lr}
0009e4de  add     r7, sp, #4
0009e4e0  ldr     r3, [pc, #0x1c]
0009e4e2  add     r3, pc ; -> 0x000f6660  OBJC_IVAR_$_Reachability.reachabilityRef
0009e4e4  ldr     r3, [r3]
0009e4e6  ldr     r4, [r0, r3]
0009e4e8  cbz     r4, #0x9e4fe
0009e4ea  blx     #0xdd164 ; -> CFRunLoopGetCurrent
0009e4ee  ldr     r2, [pc, #0x14]
0009e4f0  add     r2, pc ; -> 0x000f3448  0x0
0009e4f2  ldr     r2, [r2]
0009e4f4  ldr     r2, [r2]
0009e4f6  mov     r1, r0
0009e4f8  mov     r0, r4
0009e4fa  blx     #0xdd470 ; -> SCNetworkReachabilityUnscheduleFromRunLoop
0009e4fe  pop     {r4, r7, pc}
0009e500  strh    r2, [r7, #0xa]
0009e502  movs    r5, r0
0009e504  ldr     r7, [pc, #0x150]
0009e506  movs    r5, r0
