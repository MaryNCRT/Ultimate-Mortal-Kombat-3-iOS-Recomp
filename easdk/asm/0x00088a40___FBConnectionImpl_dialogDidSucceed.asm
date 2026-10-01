========================================================================
-[FBConnectionImpl dialogDidSucceed  0x00088a40  44 bytes   FBConnection.mm
========================================================================

00088a40  push    {r7, lr}
00088a42  add     r7, sp, #0
00088a44  ldr     r0, [pc, #0x18]
00088a46  add     r0, pc ; -> 0x00379bd0  m_connection
00088a48  ldr     r0, [r0]
00088a4a  bl      #0x88a04 ; -> ZN12FBConnection14loginSucceededEv
00088a4e  ldr     r3, [pc, #0x14]
00088a50  ldr     r0, [pc, #0x14]
00088a52  movs    r2, #0
00088a54  add     r3, pc ; -> 0x00379be0  m_showing
00088a56  add     r0, pc ; -> 0x0017ee34  
00088a58  strb    r2, [r3]
00088a5a  blx     #0xdd3e0 ; -> NSLog
00088a5e  pop     {r7, pc}
00088a60  asrs    r6, r0, #6
00088a62  movs    r7, r5
00088a64  asrs    r0, r1, #6
00088a66  movs    r7, r5
00088a68  str     r2, [r3, #0x3c]
00088a6a  movs    r7, r1
