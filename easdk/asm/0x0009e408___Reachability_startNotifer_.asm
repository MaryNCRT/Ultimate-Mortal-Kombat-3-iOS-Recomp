========================================================================
-[Reachability startNotifer]  0x0009e408  100 bytes   Reachability.m
========================================================================

0009e408  push    {r4, r7, lr}
0009e40a  add     r7, sp, #4
0009e40c  sub     sp, #0x14
0009e40e  movs    r3, #0
0009e410  str     r3, [sp]
0009e412  str     r3, [sp, #8]
0009e414  str     r3, [sp, #0xc]
0009e416  str     r3, [sp, #0x10]
0009e418  ldr     r3, [pc, #0x40]
0009e41a  ldr     r1, [pc, #0x44]
0009e41c  mov     r4, r0
0009e41e  add     r3, pc ; -> 0x000f6660  OBJC_IVAR_$_Reachability.reachabilityRef
0009e420  str     r0, [sp, #4]
0009e422  ldr     r3, [r3]
0009e424  add     r1, pc ; -> 0x0009e46d  ReachabilityCallback
0009e426  mov     r2, sp
0009e428  ldr     r0, [r0, r3]
0009e42a  blx     #0xdd464 ; -> SCNetworkReachabilitySetCallback
0009e42e  cbz     r0, #0x9e452
0009e430  ldr     r3, [pc, #0x30]
0009e432  add     r3, pc ; -> 0x000f6660  OBJC_IVAR_$_Reachability.reachabilityRef
0009e434  ldr     r0, [r3]
0009e436  ldr     r4, [r4, r0]
0009e438  blx     #0xdd164 ; -> CFRunLoopGetCurrent
0009e43c  ldr     r2, [pc, #0x28]
0009e43e  add     r2, pc ; -> 0x000f3448  0x0
0009e440  ldr     r2, [r2]
0009e442  ldr     r2, [r2]
0009e444  mov     r1, r0
0009e446  mov     r0, r4
0009e448  blx     #0xdd458 ; -> SCNetworkReachabilityScheduleWithRunLoop
0009e44c  subs    r0, #0
0009e44e  it      ne
0009e450  movne   r0, #1
0009e452  sxtb    r0, r0
0009e454  sub.w   sp, r7, #4
0009e458  pop     {r4, r7, pc}
0009e45a  nop     
0009e45c  strh    r6, [r7, #0x10]
0009e45e  movs    r5, r0
0009e460  lsls    r5, r0, #1
0009e462  movs    r0, r0
0009e464  strh    r2, [r5, #0x10]
0009e466  movs    r5, r0
0009e468  str     r6, [r0, r0]
0009e46a  movs    r5, r0
