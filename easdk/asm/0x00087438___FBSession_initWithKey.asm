========================================================================
-[FBSession initWithKey  0x00087438  308 bytes   FBSession.m
========================================================================

00087438  push    {r4, r5, r6, r7, lr}
0008743a  add     r7, sp, #0xc
0008743c  push.w  {r8, sl, fp}
00087440  sub     sp, #8
00087442  ldr     r1, [pc, #0xe0]
00087444  mov     sl, r3
00087446  ldr     r3, [pc, #0xe0]
00087448  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0008744a  str     r0, [sp]
0008744c  add     r3, pc ; -> 0x000fdd4c  
0008744e  ldr.w   fp, [r1]
00087452  ldr     r3, [r3]
00087454  mov     r0, sp
00087456  mov     r8, r2
00087458  mov     r1, fp
0008745a  str     r3, [sp, #4]
0008745c  blx     #0xddc08 ; -> objc_msgSendSuper2
00087460  mov     r4, r0
00087462  cmp     r0, #0
00087464  beq     #0x87512
00087466  ldr     r2, [pc, #0xc4]
00087468  add     r2, pc ; -> 0x006bc128  sharedSession
0008746a  ldr     r3, [r2]
0008746c  cmp     r3, #0
0008746e  beq     #0x8751e
00087470  ldr     r3, [pc, #0xbc]
00087472  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087474  ldr     r5, [r3]
00087476  bl      #0x824c0 ; -> FBCreateNonRetainingArray
0008747a  ldr     r1, [pc, #0xb8]
0008747c  ldr     r3, [pc, #0xb8]
0008747e  add     r1, pc ; -> 0x000fce18  
00087480  add     r3, pc ; -> 0x000f5d08  OBJC_IVAR_$_FBSession._apiKey
00087482  str     r0, [r4, r5]
00087484  ldr     r5, [r1]
00087486  mov     r0, r8
00087488  ldr     r6, [r3]
0008748a  mov     r1, r5
0008748c  blx     #0xddbfc ; -> objc_msgSend
00087490  ldr     r3, [pc, #0xa8]
00087492  mov     r1, r5
00087494  add     r3, pc ; -> 0x000f5d0c  OBJC_IVAR_$_FBSession._apiSecret
00087496  str     r0, [r4, r6]
00087498  mov     r0, sl
0008749a  ldr     r6, [r3]
0008749c  blx     #0xddbfc ; -> objc_msgSend
000874a0  ldr     r3, [pc, #0x9c]
000874a2  mov     r1, r5
000874a4  movs    r5, #0
000874a6  add     r3, pc ; -> 0x000f5d10  OBJC_IVAR_$_FBSession._getSessionProxy
000874a8  str     r0, [r4, r6]
000874aa  ldr     r0, [sp, #0x28]
000874ac  ldr     r6, [r3]
000874ae  blx     #0xddbfc ; -> objc_msgSend
000874b2  ldr     r3, [pc, #0x90]
000874b4  movs    r2, #0
000874b6  movs    r1, #0
000874b8  add     r3, pc ; -> 0x000f5d14  OBJC_IVAR_$_FBSession._uid
000874ba  str     r0, [r4, r6]
000874bc  ldr     r3, [r3]
000874be  ldr     r0, [pc, #0x88]
000874c0  add     r3, r4
000874c2  add     r0, pc ; -> 0x000fdb70  
000874c4  stm.w   r3, {r1, r2}
000874c8  ldr     r3, [pc, #0x80]
000874ca  ldr     r1, [pc, #0x84]
000874cc  ldr     r0, [r0]
000874ce  add     r3, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
000874d0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000874d2  ldr     r3, [r3]
000874d4  ldr     r1, [r1]
000874d6  str     r5, [r4, r3]
000874d8  ldr     r3, [pc, #0x78]
000874da  add     r3, pc ; -> 0x000f5d1c  OBJC_IVAR_$_FBSession._sessionSecret
000874dc  ldr     r3, [r3]
000874de  str     r5, [r4, r3]
000874e0  ldr     r3, [pc, #0x74]
000874e2  add     r3, pc ; -> 0x000f5d20  OBJC_IVAR_$_FBSession._expirationDate
000874e4  ldr     r3, [r3]
000874e6  str     r5, [r4, r3]
000874e8  ldr     r3, [pc, #0x70]
000874ea  add     r3, pc ; -> 0x000f5d24  OBJC_IVAR_$_FBSession._requestQueue
000874ec  ldr     r6, [r3]
000874ee  blx     #0xddbfc ; -> objc_msgSend
000874f2  mov     r1, fp
000874f4  blx     #0xddbfc ; -> objc_msgSend
000874f8  ldr     r3, [pc, #0x64]
000874fa  add     r3, pc ; -> 0x000f5d28  OBJC_IVAR_$_FBSession._lastRequestTime
000874fc  str     r0, [r4, r6]
000874fe  ldr     r3, [r3]
00087500  str     r5, [r4, r3]
00087502  ldr     r3, [pc, #0x60]
00087504  add     r3, pc ; -> 0x000f5d2c  OBJC_IVAR_$_FBSession._requestBurstCount
00087506  ldr     r3, [r3]
00087508  str     r5, [r4, r3]
0008750a  ldr     r3, [pc, #0x5c]
0008750c  add     r3, pc ; -> 0x000f5d30  OBJC_IVAR_$_FBSession._requestTimer
0008750e  ldr     r3, [r3]
00087510  str     r5, [r4, r3]
00087512  mov     r0, r4
00087514  sub.w   sp, r7, #0x18
00087518  pop.w   {r8, sl, fp}
0008751c  pop     {r4, r5, r6, r7, pc}
0008751e  str     r0, [r2]
00087520  b       #0x87470
00087522  nop     
00087524  strb    r4, [r6, r4]
00087526  movs    r7, r0
00087528  ldr     r4, [r7, #0xc]
0008752a  movs    r7, r0
0008752c  ldr     r4, [pc, #0x2f0]
0008752e  lsls    r3, r4, #1
00087530  stm.w   lr, {r1, r2}
00087534  ldr     r6, [r2, r6]
00087536  movs    r7, r0
00087538  stm.w   r4, {r1, r2}
0008753c  ldrd    r0, r0, [r4], #-0x18
00087540  strd    r0, r0, [r6], #-0x18
