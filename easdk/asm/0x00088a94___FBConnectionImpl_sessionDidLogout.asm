========================================================================
-[FBConnectionImpl sessionDidLogout  0x00088a94  44 bytes   FBConnection.mm
========================================================================

00088a94  push    {r7, lr}
00088a96  add     r7, sp, #0
00088a98  ldr     r0, [pc, #0x18]
00088a9a  add     r0, pc ; -> 0x0017ee64  
00088a9c  blx     #0xdd3e0 ; -> NSLog
00088aa0  ldr     r3, [pc, #0x14]
00088aa2  ldr     r0, [pc, #0x18]
00088aa4  movs    r2, #0
00088aa6  add     r3, pc ; -> 0x00379bd4  m_loggedIn
00088aa8  add     r0, pc ; -> 0x00379bd0  m_connection
00088aaa  strb    r2, [r3]
00088aac  ldr     r0, [r0]
00088aae  bl      #0x889d0 ; -> ZN12FBConnection10deactivateEv
00088ab2  pop     {r7, pc}
00088ab4  str     r6, [r0, #0x3c]
00088ab6  movs    r7, r1
00088ab8  asrs    r2, r5, #4
00088aba  movs    r7, r5
00088abc  asrs    r4, r4, #4
00088abe  movs    r7, r5
