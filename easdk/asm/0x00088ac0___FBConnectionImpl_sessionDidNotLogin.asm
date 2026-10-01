========================================================================
-[FBConnectionImpl sessionDidNotLogin  0x00088ac0  44 bytes   FBConnection.mm
========================================================================

00088ac0  push    {r7, lr}
00088ac2  add     r7, sp, #0
00088ac4  ldr     r0, [pc, #0x18]
00088ac6  add     r0, pc ; -> 0x0017ee74  
00088ac8  blx     #0xdd3e0 ; -> NSLog
00088acc  ldr     r3, [pc, #0x14]
00088ace  ldr     r0, [pc, #0x18]
00088ad0  movs    r2, #0
00088ad2  add     r3, pc ; -> 0x00379bd4  m_loggedIn
00088ad4  add     r0, pc ; -> 0x00379bd0  m_connection
00088ad6  strb    r2, [r3]
00088ad8  ldr     r0, [r0]
00088ada  bl      #0x889d0 ; -> ZN12FBConnection10deactivateEv
00088ade  pop     {r7, pc}
00088ae0  str     r2, [r5, #0x38]
00088ae2  movs    r7, r1
00088ae4  asrs    r6, r7, #3
00088ae6  movs    r7, r5
00088ae8  asrs    r0, r7, #3
00088aea  movs    r7, r5
