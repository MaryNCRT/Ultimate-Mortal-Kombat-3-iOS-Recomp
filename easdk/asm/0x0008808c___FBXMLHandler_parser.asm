========================================================================
-[FBXMLHandler parser  0x0008808c  60 bytes   FBXMLHandler.m
========================================================================

0008808c  push    {r4, r5, r7, lr}
0008808e  add     r7, sp, #8
00088090  ldr     r1, [pc, #0x28]
00088092  mov     r5, r0
00088094  mov     r2, r3
00088096  add     r1, pc ; -> 0x000f6044  OBJC_IVAR_$_FBXMLHandler._chars
00088098  ldr     r4, [r1]
0008809a  ldr     r0, [r0, r4]
0008809c  cbz     r0, #0x880aa
0008809e  ldr     r1, [pc, #0x20]
000880a0  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000880a2  ldr     r1, [r1]
000880a4  blx     #0xddbfc ; -> objc_msgSend
000880a8  pop     {r4, r5, r7, pc}
000880aa  ldr     r1, [pc, #0x18]
000880ac  mov     r0, r3
000880ae  add     r1, pc ; -> 0x000fcf10  'sF\x0e'
000880b0  ldr     r1, [r1]
000880b2  blx     #0xddbfc ; -> objc_msgSend
000880b6  str     r0, [r5, r4]
000880b8  b       #0x880a8
000880ba  nop     
000880bc  svc     #0xaa
000880be  movs    r6, r0
000880c0  ldr     r5, [pc, #0x360]
000880c2  movs    r7, r0
000880c4  ldr     r6, [pc, #0x178]
000880c6  movs    r7, r0
