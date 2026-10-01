========================================================================
EASOC_StatPostFailed  0x0007f2cc  68 bytes   EASDK_Handler.mm
========================================================================

0007f2cc  push    {r4, r7, lr}
0007f2ce  add     r7, sp, #4
0007f2d0  sub     sp, #4
0007f2d2  ldr     r4, [pc, #0x30]
0007f2d4  add     r4, pc ; -> 0x0017e5e4  
0007f2d6  mov     r0, r4
0007f2d8  blx     #0xdd3e0 ; -> NSLog
0007f2dc  ldr     r0, [pc, #0x28]
0007f2de  add     r0, pc ; -> 0x0017e5f4  
0007f2e0  blx     #0xdd3e0 ; -> NSLog
0007f2e4  mov     r0, r4
0007f2e6  blx     #0xdd3e0 ; -> NSLog
0007f2ea  ldr     r2, [pc, #0x20]
0007f2ec  movs    r3, #0
0007f2ee  movw    r0, #0x3f5
0007f2f2  add     r2, pc ; -> 0x00175794  'Score not posted'
0007f2f4  movs    r1, #0xf
0007f2f6  str     r3, [sp]
0007f2f8  bl      #0x7f1e4 ; -> EASDK_LogEventEnumEnumString
0007f2fc  sub.w   sp, r7, #4
0007f300  pop     {r4, r7, pc}
0007f302  nop     
0007f304  ssat    r0, #0x10, ip
