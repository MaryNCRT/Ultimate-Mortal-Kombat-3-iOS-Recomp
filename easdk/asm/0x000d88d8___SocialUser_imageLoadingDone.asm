========================================================================
-[SocialUser imageLoadingDone  0x000d88d8  52 bytes   SocialUser.m
========================================================================

000d88d8  push    {r4, r7, lr}
000d88da  add     r7, sp, #4
000d88dc  ldr     r1, [pc, #0x20]
000d88de  mov     r4, r0
000d88e0  mov     r0, r2
000d88e2  ldr     r2, [pc, #0x20]
000d88e4  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d88e6  add     r2, pc ; -> 0x0017fe94  
000d88e8  ldr     r1, [r1]
000d88ea  blx     #0xddbfc ; -> objc_msgSend
000d88ee  ldr     r1, [pc, #0x18]
000d88f0  add     r1, pc ; -> 0x000fd2c0  
000d88f2  ldr     r1, [r1]
000d88f4  mov     r2, r0
000d88f6  mov     r0, r4
000d88f8  blx     #0xddbfc ; -> objc_msgSend
000d88fc  pop     {r4, r7, pc}
000d88fe  nop     
000d8900  rors    r4, r5
000d8902  movs    r2, r0
000d8904  strb    r2, [r5, #0x16]
000d8906  movs    r2, r1
000d8908  ldr     r1, [pc, #0x330]
000d890a  movs    r2, r0
