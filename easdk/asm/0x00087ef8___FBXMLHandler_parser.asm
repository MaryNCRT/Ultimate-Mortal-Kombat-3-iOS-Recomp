========================================================================
-[FBXMLHandler parser  0x00087ef8  36 bytes   FBXMLHandler.m
========================================================================

00087ef8  push    {r4, r5, r7, lr}
00087efa  add     r7, sp, #8
00087efc  ldr     r1, [pc, #0x14]
00087efe  ldr     r2, [pc, #0x18]
00087f00  mov     r5, r0
00087f02  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00087f04  add     r2, pc ; -> 0x000f6048  OBJC_IVAR_$_FBXMLHandler._parseError
00087f06  ldr     r1, [r1]
00087f08  mov     r0, r3
00087f0a  ldr     r4, [r2]
00087f0c  blx     #0xddbfc ; -> objc_msgSend
00087f10  str     r0, [r5, r4]
00087f12  pop     {r4, r5, r7, pc}
00087f14  ldr     r5, [pc, #0x328]
00087f16  movs    r7, r0
00087f18  b       #0x8819c
00087f1a  movs    r6, r0
