========================================================================
-[FBSession unsave]  0x0008709c  120 bytes   FBSession.m
========================================================================

0008709c  push    {r4, r5, r7, lr}
0008709e  add     r7, sp, #8
000870a0  ldr     r0, [pc, #0x50]
000870a2  ldr     r1, [pc, #0x54]
000870a4  add     r0, pc ; -> 0x000fdb84  
000870a6  add     r1, pc ; -> 0x000fcae0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x168
000870a8  ldr     r0, [r0]
000870aa  ldr     r1, [r1]
000870ac  blx     #0xddbfc ; -> objc_msgSend
000870b0  ldr     r1, [pc, #0x48]
000870b2  ldr     r2, [pc, #0x4c]
000870b4  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000870b6  add     r2, pc ; -> 0x0017eca4  
000870b8  ldr     r4, [r1]
000870ba  mov     r1, r4
000870bc  mov     r5, r0
000870be  blx     #0xddbfc ; -> objc_msgSend
000870c2  ldr     r2, [pc, #0x40]
000870c4  mov     r0, r5
000870c6  mov     r1, r4
000870c8  add     r2, pc ; -> 0x0017ecb4  
000870ca  blx     #0xddbfc ; -> objc_msgSend
000870ce  ldr     r2, [pc, #0x38]
000870d0  mov     r0, r5
000870d2  mov     r1, r4
000870d4  add     r2, pc ; -> 0x0017ecc4  
000870d6  blx     #0xddbfc ; -> objc_msgSend
000870da  ldr     r2, [pc, #0x30]
000870dc  mov     r0, r5
000870de  mov     r1, r4
000870e0  add     r2, pc ; -> 0x0017ecd4  
000870e2  blx     #0xddbfc ; -> objc_msgSend
000870e6  ldr     r1, [pc, #0x28]
000870e8  mov     r0, r5
000870ea  add     r1, pc ; -> 0x000fcef8  '\x05B\x0e'
000870ec  ldr     r1, [r1]
000870ee  blx     #0xddbfc ; -> objc_msgSend
000870f2  pop     {r4, r5, r7, pc}
000870f4  ldr     r4, [r3, #0x2c]
000870f6  movs    r7, r0
000870f8  ldrh    r6, [r6, r0]
000870fa  movs    r7, r0
000870fc  ldrsh   r4, [r0, r1]
000870fe  movs    r7, r0
00087100  ldrb    r2, [r5, #0xf]
00087102  movs    r7, r1
00087104  ldrb    r0, [r5, #0xf]
00087106  movs    r7, r1
00087108  ldrb    r4, [r5, #0xf]
0008710a  movs    r7, r1
0008710c  ldrb    r0, [r6, #0xf]
0008710e  movs    r7, r1
00087110  ldrsh   r2, [r1, r0]
00087112  movs    r7, r0
