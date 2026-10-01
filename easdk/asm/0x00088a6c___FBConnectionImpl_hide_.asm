========================================================================
-[FBConnectionImpl hide]  0x00088a6c  20 bytes   FBConnection.mm
========================================================================

00088a6c  push    {r7, lr}
00088a6e  add     r7, sp, #0
00088a70  ldr     r0, [pc, #8]
00088a72  add     r0, pc ; -> 0x0017ee44  
00088a74  blx     #0xdd3e0 ; -> NSLog
00088a78  pop     {r7, pc}
00088a7a  nop     
00088a7c  str     r6, [r1, #0x3c]
00088a7e  movs    r7, r1
