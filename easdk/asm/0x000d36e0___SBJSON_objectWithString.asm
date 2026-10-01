========================================================================
-[SBJSON objectWithString  0x000d36e0  120 bytes   SBJSON.m
========================================================================

000d36e0  push    {r4, r5, r6, r7, lr}
000d36e2  add     r7, sp, #0xc
000d36e4  str     r8, [sp, #-0x4]!
000d36e8  ldr     r4, [pc, #0x54]
000d36ea  ldr     r1, [pc, #0x58]
000d36ec  mov     r6, r0
000d36ee  add     r4, pc ; -> 0x000fa888  OBJC_IVAR_$_SBJSON.jsonParser
000d36f0  add     r1, pc ; -> 0x000fd4b4  
000d36f2  ldr     r3, [r4]
000d36f4  ldr     r1, [r1]
000d36f6  ldr     r0, [r0, r3]
000d36f8  blx     #0xddbfc ; -> objc_msgSend
000d36fc  mov     r5, r0
000d36fe  cbnz    r0, #0xd3738
000d3700  ldr     r3, [pc, #0x44]
000d3702  ldr     r1, [pc, #0x48]
000d3704  add     r3, pc ; -> 0x000f3320  OBJC_IVAR_$_SBJsonBase.errorTrace
000d3706  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d3708  ldr.w   r8, [r3]
000d370c  ldr     r1, [r1]
000d370e  ldr.w   r3, [r8]
000d3712  ldr     r0, [r6, r3]
000d3714  blx     #0xddbfc ; -> objc_msgSend
000d3718  ldr     r1, [pc, #0x34]
000d371a  ldr     r3, [r4]
000d371c  ldr.w   r8, [r8]
000d3720  add     r1, pc ; -> 0x000fd76c  
000d3722  ldr     r0, [r6, r3]
000d3724  ldr     r1, [r1]
000d3726  blx     #0xddbfc ; -> objc_msgSend
000d372a  ldr     r1, [pc, #0x28]
000d372c  add     r1, pc ; -> 0x000fcf10  'sF\x0e'
000d372e  ldr     r1, [r1]
000d3730  blx     #0xddbfc ; -> objc_msgSend
000d3734  str.w   r0, [r6, r8]
000d3738  mov     r0, r5
000d373a  ldr     r8, [sp], #4
000d373e  pop     {r4, r5, r6, r7, pc}
000d3740  strb    r6, [r2, #6]
000d3742  movs    r2, r0
000d3744  ldr     r5, [sp, #0x300]
000d3746  movs    r2, r0
