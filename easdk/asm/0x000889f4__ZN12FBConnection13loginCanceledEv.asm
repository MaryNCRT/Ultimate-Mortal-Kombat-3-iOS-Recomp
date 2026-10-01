========================================================================
ZN12FBConnection13loginCanceledEv  0x000889f4  16 bytes   FBConnection.mm
========================================================================

000889f4  push    {r7, lr}
000889f6  add     r7, sp, #0
000889f8  movs    r3, #3
000889fa  str     r3, [r0, #0x28]
000889fc  bl      #0x889d0 ; -> ZN12FBConnection10deactivateEv
00088a00  pop     {r7, pc}
00088a02  nop     
