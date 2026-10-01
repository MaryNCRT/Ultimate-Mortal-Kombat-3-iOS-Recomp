========================================================================
-[FBSession startFlushTimer]  0x00087024  120 bytes   FBSession.m
========================================================================

00087024  push    {r4, r5, r6, r7, lr}
00087026  add     r7, sp, #0xc
00087028  sub     sp, #0x10
0008702a  ldr     r4, [pc, #0x58]
0008702c  mov     r6, r0
0008702e  add     r4, pc ; -> 0x000f5d30  OBJC_IVAR_$_FBSession._requestTimer
00087030  ldr     r3, [r4]
00087032  ldr     r5, [r0, r3]
00087034  cbz     r5, #0x8703c
00087036  sub.w   sp, r7, #0xc
0008703a  pop     {r4, r5, r6, r7, pc}
0008703c  ldr     r3, [pc, #0x48]
0008703e  ldr     r1, [pc, #0x4c]
00087040  add     r3, pc ; -> 0x000f5d28  OBJC_IVAR_$_FBSession._lastRequestTime
00087042  add     r1, pc ; -> 0x000fcef4  
00087044  ldr     r3, [r3]
00087046  ldr     r1, [r1]
00087048  ldr     r0, [r0, r3]
0008704a  blx     #0xddbfc ; -> objc_msgSend
0008704e  vmov.f64 d7, #2.000000e+00
00087052  ldr     r3, [pc, #0x3c]
00087054  ldr     r4, [r4]
00087056  str     r6, [sp]
00087058  add     r3, pc ; -> 0x000fcef0  
0008705a  str     r5, [sp, #8]
0008705c  ldr     r3, [r3]
0008705e  str     r5, [sp, #0xc]
00087060  str     r3, [sp, #4]
00087062  vmov    d6, r0, r1
00087066  vadd.f64 d7, d6, d7
0008706a  ldr     r0, [pc, #0x28]
0008706c  ldr     r1, [pc, #0x28]
0008706e  add     r0, pc ; -> 0x000fdb58  
00087070  add     r1, pc ; -> 0x000fc9b8  '~\x07\x0e'
00087072  ldr     r0, [r0]
00087074  ldr     r1, [r1]
00087076  vmov    r2, r3, d7
0008707a  blx     #0xddbfc ; -> objc_msgSend
0008707e  str     r0, [r6, r4]
00087080  b       #0x87036
00087082  nop     
00087084  ldcl    p0, c0, [lr], #0x18
00087088  stcl    p0, c0, [r4], #0x18
0008708c  ldrsh   r6, [r5, r2]
0008708e  movs    r7, r0
00087090  ldrsh   r4, [r2, r2]
00087092  movs    r7, r0
00087094  ldr     r6, [r4, #0x2c]
00087096  movs    r7, r0
00087098  ldr     r4, [r0, r5]
0008709a  movs    r7, r0
