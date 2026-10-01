========================================================================
-[FBConnectionImpl isLoggedIn]  0x00088638  64 bytes   FBConnection.mm
========================================================================

00088638  push    {r4, r7, lr}
0008863a  add     r7, sp, #4
0008863c  ldr     r4, [pc, #0x28]
0008863e  add     r4, pc ; -> 0x00379bd4  m_loggedIn
00088640  ldrb    r3, [r4]
00088642  cbnz    r3, #0x88660
00088644  ldr     r0, [pc, #0x24]
00088646  ldr     r1, [pc, #0x28]
00088648  add     r0, pc ; -> 0x00379bc8  session
0008864a  add     r1, pc ; -> 0x000fcda8  
0008864c  ldr     r0, [r0]
0008864e  ldr     r1, [r1]
00088650  blx     #0xddbfc ; -> objc_msgSend
00088654  tst.w   r0, #0xff
00088658  ite     eq
0008865a  moveq   r3, #0
0008865c  movne   r3, #1
0008865e  strb    r3, [r4]
00088660  ldr     r3, [pc, #0x10]
00088662  add     r3, pc ; -> 0x00379bd4  m_loggedIn
00088664  ldrb    r0, [r3]
00088666  pop     {r4, r7, pc}
00088668  asrs    r2, r2, #0x16
0008866a  movs    r7, r5
0008866c  asrs    r4, r7, #0x15
0008866e  movs    r7, r5
00088670  bx      fp
00088672  movs    r7, r0
00088674  asrs    r6, r5, #0x15
00088676  movs    r7, r5
