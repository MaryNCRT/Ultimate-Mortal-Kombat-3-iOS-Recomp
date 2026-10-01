========================================================================
-[FBConnectionImpl dialogDidCancel  0x00088a14  44 bytes   FBConnection.mm
========================================================================

00088a14  push    {r7, lr}
00088a16  add     r7, sp, #0
00088a18  ldr     r0, [pc, #0x18]
00088a1a  add     r0, pc ; -> 0x00379bd0  m_connection
00088a1c  ldr     r0, [r0]
00088a1e  bl      #0x889f4 ; -> ZN12FBConnection13loginCanceledEv
00088a22  ldr     r3, [pc, #0x14]
00088a24  ldr     r0, [pc, #0x14]
00088a26  movs    r2, #0
00088a28  add     r3, pc ; -> 0x00379be0  m_showing
00088a2a  add     r0, pc ; -> 0x0017ee24  
00088a2c  strb    r2, [r3]
00088a2e  blx     #0xdd3e0 ; -> NSLog
00088a32  pop     {r7, pc}
00088a34  asrs    r2, r6, #6
00088a36  movs    r7, r5
00088a38  asrs    r4, r6, #6
00088a3a  movs    r7, r5
00088a3c  str     r6, [r6, #0x3c]
00088a3e  movs    r7, r1
