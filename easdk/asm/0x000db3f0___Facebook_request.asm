========================================================================
-[Facebook request  0x000db3f0  20 bytes   Facebook.m
========================================================================

000db3f0  push    {r7, lr}
000db3f2  add     r7, sp, #0
000db3f4  ldr     r0, [pc, #8]
000db3f6  add     r0, pc ; -> 0x00182a54  
000db3f8  blx     #0xdd3e0 ; -> NSLog
000db3fc  pop     {r7, pc}
000db3fe  nop     
000db400  strb    r2, [r3, #0x19]
000db402  movs    r2, r1
