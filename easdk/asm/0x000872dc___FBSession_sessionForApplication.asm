========================================================================
+[FBSession sessionForApplication  0x000872dc  112 bytes   FBSession.m
========================================================================

000872dc  push    {r4, r5, r7, lr}
000872de  add     r7, sp, #8
000872e0  sub     sp, #4
000872e2  ldr     r0, [pc, #0x50]
000872e4  ldr     r1, [pc, #0x50]
000872e6  mov     r5, r3
000872e8  add     r0, pc ; -> 0x000fdbc0  
000872ea  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000872ec  ldr     r0, [r0]
000872ee  ldr     r1, [r1]
000872f0  mov     r4, r2
000872f2  blx     #0xddbfc ; -> objc_msgSend
000872f6  ldr     r1, [pc, #0x44]
000872f8  mov     r2, r4
000872fa  movs    r3, #0
000872fc  add     r1, pc ; -> 0x000fcf04  
000872fe  str     r3, [sp]
00087300  ldr     r1, [r1]
00087302  mov     r3, r5
00087304  blx     #0xddbfc ; -> objc_msgSend
00087308  ldr     r1, [pc, #0x34]
0008730a  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008730c  ldr     r1, [r1]
0008730e  blx     #0xddbfc ; -> objc_msgSend
00087312  ldr     r1, [pc, #0x30]
00087314  add     r1, pc ; -> 0x000fcd78  'T2\x0e'
00087316  ldr     r1, [r1]
00087318  mov     r4, r0
0008731a  blx     #0xddbfc ; -> objc_msgSend
0008731e  ldr     r1, [pc, #0x28]
00087320  ldr     r2, [sp, #0x14]
00087322  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
00087324  ldr     r1, [r1]
00087326  blx     #0xddbfc ; -> objc_msgSend
0008732a  mov     r0, r4
0008732c  sub.w   sp, r7, #8
00087330  pop     {r4, r5, r7, pc}
00087332  nop     
00087334  ldr     r4, [r2, #0xc]
00087336  movs    r7, r0
00087338  ldrsb   r6, [r2, r2]
0008733a  movs    r7, r0
0008733c  ldrb    r4, [r0, r0]
0008733e  movs    r7, r0
00087340  ldrsb   r2, [r1, r5]
00087342  movs    r7, r0
00087344  ldrh    r0, [r4, r1]
00087346  movs    r7, r0
00087348  ldrsb   r6, [r3, r5]
0008734a  movs    r7, r0
