========================================================================
ZN12FBConnection14loginSucceededEv  0x00088a04  16 bytes   FBConnection.mm
========================================================================

00088a04  push    {r7, lr}
00088a06  add     r7, sp, #0
00088a08  movs    r3, #2
00088a0a  str     r3, [r0, #0x28]
00088a0c  bl      #0x889d0 ; -> ZN12FBConnection10deactivateEv
00088a10  pop     {r7, pc}
00088a12  nop     
