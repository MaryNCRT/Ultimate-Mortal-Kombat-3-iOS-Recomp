========================================================================
-[SBJsonBase clearErrorTrace]  0x000d39cc  84 bytes   SBJsonBase.m
========================================================================

000d39cc  push    {r4, r5, r6, r7, lr}
000d39ce  add     r7, sp, #0xc
000d39d0  ldr     r6, [pc, #0x38]
000d39d2  ldr     r1, [pc, #0x3c]
000d39d4  ldr     r4, [pc, #0x3c]
000d39d6  add     r6, pc ; -> 0x001821e4  
000d39d8  add     r1, pc ; -> 0x000fd8fc  '+\x17\x0f'
000d39da  mov     r2, r6
000d39dc  add     r4, pc ; -> 0x000faa08  OBJC_IVAR_$_SBJsonBase.errorTrace
000d39de  ldr     r1, [r1]
000d39e0  mov     r5, r0
000d39e2  blx     #0xddbfc ; -> objc_msgSend
000d39e6  ldr     r1, [pc, #0x30]
000d39e8  ldr     r3, [r4]
000d39ea  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d39ec  ldr     r0, [r5, r3]
000d39ee  ldr     r1, [r1]
000d39f0  blx     #0xddbfc ; -> objc_msgSend
000d39f4  ldr     r1, [pc, #0x24]
000d39f6  ldr     r3, [r4]
000d39f8  movs    r2, #0
000d39fa  add     r1, pc ; -> 0x000fd8f8  '\x15\x17\x0f'
000d39fc  mov     r0, r5
000d39fe  str     r2, [r5, r3]
000d3a00  ldr     r1, [r1]
000d3a02  mov     r2, r6
000d3a04  blx     #0xddbfc ; -> objc_msgSend
000d3a08  pop     {r4, r5, r6, r7, pc}
000d3a0a  nop     
