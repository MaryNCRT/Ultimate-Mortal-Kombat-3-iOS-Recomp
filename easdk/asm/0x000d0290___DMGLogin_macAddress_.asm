========================================================================
-[DMGLogin macAddress]  0x000d0290  216 bytes   DMGLogin.mm
========================================================================

000d0290  push    {r4, r5, r6, r7, lr}
000d0292  add     r7, sp, #0xc
000d0294  push.w  {r8, sl}
000d0298  sub     sp, #0x18
000d029a  ldr.w   r8, [pc, #0xb0]
000d029e  add     r0, sp, #0x18
000d02a0  movs    r3, #0
000d02a2  str     r3, [r0, #-0x4]!
000d02a6  add     r8, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d02a8  blx     #0xdd7d0 ; -> getifaddrs
000d02ac  cmp     r0, #0
000d02ae  bne     #0xd033e
000d02b0  ldr     r1, [pc, #0x9c]
000d02b2  ldr     r0, [pc, #0xa0]
000d02b4  ldr     r4, [sp, #0x14]
000d02b6  add     r1, pc ; -> 0x000fd77c  
000d02b8  add     r0, pc ; -> 0x000fdb5c  
000d02ba  ldr     r6, [r1]
000d02bc  ldr     r1, [pc, #0x98]
000d02be  ldr.w   sl, [r0]
000d02c2  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000d02c4  ldr     r5, [r1]
000d02c6  b       #0xd0334
000d02c8  ldr     r3, [r4, #0xc]
000d02ca  ldrb    r3, [r3, #1]
000d02cc  cmp     r3, #0x12
000d02ce  bne     #0xd0332
000d02d0  ldr     r2, [r4, #4]
000d02d2  mov     r1, r6
000d02d4  mov     r0, sl
000d02d6  blx     #0xddbfc ; -> objc_msgSend
000d02da  ldr     r2, [pc, #0x80]
000d02dc  mov     r1, r5
000d02de  add     r2, pc ; -> 0x001821c4  
000d02e0  blx     #0xddbfc ; -> objc_msgSend
000d02e4  tst.w   r0, #0xff
000d02e8  beq     #0xd0332
000d02ea  ldr     r3, [r4, #0xc]
000d02ec  cbz     r3, #0xd0332
000d02ee  ldrb    r2, [r3, #6]
000d02f0  cmp     r2, #6
000d02f2  bne     #0xd0332
000d02f4  add.w   r0, r3, #8
000d02f8  ldrb    r3, [r3, #5]
000d02fa  ldr     r1, [pc, #0x64]
000d02fc  ldr     r2, [pc, #0x64]
000d02fe  add.w   ip, r0, r3
000d0302  ldrb    r3, [r0, r3]
000d0304  ldrb.w  r0, [ip, #1]
000d0308  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d030a  add     r2, pc ; -> 0x001821d4  
000d030c  ldr     r1, [r1]
000d030e  str     r0, [sp]
000d0310  ldrb.w  r0, [ip, #2]
000d0314  str     r0, [sp, #4]
000d0316  ldrb.w  r0, [ip, #3]
000d031a  str     r0, [sp, #8]
000d031c  ldrb.w  r0, [ip, #4]
000d0320  str     r0, [sp, #0xc]
000d0322  ldrb.w  r0, [ip, #5]
000d0326  str     r0, [sp, #0x10]
000d0328  mov     r0, sl
000d032a  blx     #0xddbfc ; -> objc_msgSend
000d032e  mov     r8, r0
000d0330  b       #0xd0338
000d0332  ldr     r4, [r4]
000d0334  cmp     r4, #0
000d0336  bne     #0xd02c8
000d0338  ldr     r0, [sp, #0x14]
000d033a  blx     #0xdd7b8 ; -> freeifaddrs
000d033e  mov     r0, r8
000d0340  sub.w   sp, r7, #0x14
000d0344  pop.w   {r8, sl}
000d0348  pop     {r4, r5, r6, r7, pc}
000d034a  nop     
000d034c  b       #0xd03e4
000d034e  movs    r2, r1
000d0350  bmi     #0xd02d8
000d0352  movs    r2, r0
000d0354  bhi     #0xd0298
000d0356  movs    r2, r0
000d0358  ldm     r0!, {r1, r6}
000d035a  movs    r2, r0
000d035c  subs    r2, r4, #3
000d035e  movs    r3, r1
000d0360  stm     r7!, {r2, r4, r7}
000d0362  movs    r2, r0
000d0364  subs    r6, r0, #3
000d0366  movs    r3, r1
