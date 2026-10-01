========================================================================
+[FBSession sessionForApplication  0x00087270  108 bytes   FBSession.m
========================================================================

00087270  push    {r4, r5, r7, lr}
00087272  add     r7, sp, #8
00087274  sub     sp, #4
00087276  ldr     r0, [pc, #0x4c]
00087278  ldr     r1, [pc, #0x4c]
0008727a  mov     r4, r3
0008727c  add     r0, pc ; -> 0x000fdbc0  
0008727e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00087280  ldr     r0, [r0]
00087282  ldr     r1, [r1]
00087284  mov     r5, r2
00087286  blx     #0xddbfc ; -> objc_msgSend
0008728a  ldr     r1, [pc, #0x40]
0008728c  mov     r2, r5
0008728e  movs    r3, #0
00087290  add     r1, pc ; -> 0x000fcf04  
00087292  str     r4, [sp]
00087294  ldr     r1, [r1]
00087296  blx     #0xddbfc ; -> objc_msgSend
0008729a  ldr     r1, [pc, #0x34]
0008729c  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008729e  ldr     r1, [r1]
000872a0  blx     #0xddbfc ; -> objc_msgSend
000872a4  ldr     r1, [pc, #0x2c]
000872a6  add     r1, pc ; -> 0x000fcd78  'T2\x0e'
000872a8  ldr     r1, [r1]
000872aa  mov     r4, r0
000872ac  blx     #0xddbfc ; -> objc_msgSend
000872b0  ldr     r1, [pc, #0x24]
000872b2  ldr     r2, [sp, #0x14]
000872b4  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000872b6  ldr     r1, [r1]
000872b8  blx     #0xddbfc ; -> objc_msgSend
000872bc  mov     r0, r4
000872be  sub.w   sp, r7, #8
000872c2  pop     {r4, r5, r7, pc}
000872c4  ldr     r0, [r0, #0x14]
000872c6  movs    r7, r0
000872c8  ldrsb   r2, [r0, r4]
000872ca  movs    r7, r0
000872cc  ldrb    r0, [r6, r1]
000872ce  movs    r7, r0
000872d0  ldrsb   r0, [r7, r6]
000872d2  movs    r7, r0
000872d4  ldrh    r6, [r1, r3]
000872d6  movs    r7, r0
000872d8  ldrsb   r4, [r1, r7]
000872da  movs    r7, r0
