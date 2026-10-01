========================================================================
-[Reachability dealloc]  0x0009e508  76 bytes   Reachability.m
========================================================================

0009e508  push    {r4, r7, lr}
0009e50a  add     r7, sp, #4
0009e50c  sub     sp, #8
0009e50e  ldr     r1, [pc, #0x34]
0009e510  mov     r4, r0
0009e512  add     r1, pc ; -> 0x000fd01c  '\x19\\\x0e'
0009e514  ldr     r1, [r1]
0009e516  blx     #0xddbfc ; -> objc_msgSend
0009e51a  ldr     r3, [pc, #0x2c]
0009e51c  add     r3, pc ; -> 0x000f6660  OBJC_IVAR_$_Reachability.reachabilityRef
0009e51e  ldr     r0, [r3]
0009e520  ldr     r0, [r4, r0]
0009e522  cbz     r0, #0x9e528
0009e524  blx     #0xdd14c ; -> CFRelease
0009e528  ldr     r3, [pc, #0x20]
0009e52a  ldr     r1, [pc, #0x24]
0009e52c  mov     r0, sp
0009e52e  add     r3, pc ; -> 0x000fdd60  
0009e530  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
0009e532  ldr     r3, [r3]
0009e534  ldr     r1, [r1]
0009e536  str     r4, [sp]
0009e538  str     r3, [sp, #4]
0009e53a  blx     #0xddc08 ; -> objc_msgSendSuper2
0009e53e  sub.w   sp, r7, #4
0009e542  pop     {r4, r7, pc}
0009e544  add.w   r0, r6, r5
0009e548  strh    r0, [r0, #0xa]
0009e54a  movs    r5, r0
0009e54c  strh.w  r0, [lr, r5]
0009e550  b       #0x9de2c
0009e552  movs    r5, r0
