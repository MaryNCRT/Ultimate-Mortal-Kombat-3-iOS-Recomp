========================================================================
-[FBConnectionImpl requestFriendsList]  0x00088aec  68 bytes   FBConnection.mm
========================================================================

00088aec  push    {r7, lr}
00088aee  add     r7, sp, #0
00088af0  ldr     r1, [pc, #0x28]
00088af2  mov     r2, r0
00088af4  ldr     r0, [pc, #0x28]
00088af6  add     r1, pc ; -> 0x000fcf70  
00088af8  add     r0, pc ; -> 0x000fdbf0  
00088afa  ldr     r1, [r1]
00088afc  ldr     r0, [r0]
00088afe  blx     #0xddbfc ; -> objc_msgSend
00088b02  ldr     r1, [pc, #0x20]
00088b04  ldr     r2, [pc, #0x20]
00088b06  movs    r3, #0
00088b08  add     r1, pc ; -> 0x000fcde4  '\x0c5\x0e'
00088b0a  add     r2, pc ; -> 0x0017ee84  
00088b0c  ldr     r1, [r1]
00088b0e  blx     #0xddbfc ; -> objc_msgSend
00088b12  ldr     r0, [pc, #0x18]
00088b14  add     r0, pc ; -> 0x0017ee94  
00088b16  blx     #0xdd3e0 ; -> NSLog
00088b1a  pop     {r7, pc}
00088b1c  add     r6, lr
00088b1e  movs    r7, r0
00088b20  str     r4, [r6, r3]
00088b22  movs    r7, r0
00088b24  cmn     r0, r3
00088b26  movs    r7, r0
00088b28  str     r6, [r6, #0x34]
00088b2a  movs    r7, r1
00088b2c  str     r4, [r7, #0x34]
00088b2e  movs    r7, r1
