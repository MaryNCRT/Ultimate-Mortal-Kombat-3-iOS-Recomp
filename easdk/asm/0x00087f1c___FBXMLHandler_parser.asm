========================================================================
-[FBXMLHandler parser  0x00087f1c  368 bytes   FBXMLHandler.m
========================================================================

00087f1c  push    {r4, r5, r6, r7, lr}
00087f1e  add     r7, sp, #0xc
00087f20  push.w  {r8, sl, fp}
00087f24  sub     sp, #4
00087f26  ldr     r1, [pc, #0x120]
00087f28  mov     r5, r0
00087f2a  ldr     r6, [pc, #0x120]
00087f2c  add     r1, pc ; -> 0x000fcf14  
00087f2e  ldr     r1, [r1]
00087f30  blx     #0xddbfc ; -> objc_msgSend
00087f34  ldr     r1, [pc, #0x118]
00087f36  movs    r2, #0
00087f38  mov     r0, r5
00087f3a  add     r1, pc ; -> 0x000fcf0c  
00087f3c  add     r6, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
00087f3e  ldr.w   sl, [r1]
00087f42  mov     r1, sl
00087f44  blx     #0xddbfc ; -> objc_msgSend
00087f48  ldr     r1, [pc, #0x108]
00087f4a  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00087f4c  ldr.w   r8, [r1]
00087f50  mov     r1, r8
00087f52  blx     #0xddbfc ; -> objc_msgSend
00087f56  ldr     r1, [pc, #0x100]
00087f58  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
00087f5a  ldr     r4, [r1]
00087f5c  mov     r1, r4
00087f5e  blx     #0xddbfc ; -> objc_msgSend
00087f62  ldr     r1, [pc, #0xf8]
00087f64  add     r1, pc ; -> 0x000fcf18  
00087f66  ldr     r1, [r1]
00087f68  mov     fp, r0
00087f6a  mov     r0, r5
00087f6c  blx     #0xddbfc ; -> objc_msgSend
00087f70  mov     r1, r8
00087f72  blx     #0xddbfc ; -> objc_msgSend
00087f76  mov     r1, r4
00087f78  blx     #0xddbfc ; -> objc_msgSend
00087f7c  ldr     r1, [pc, #0xe0]
00087f7e  ldr     r3, [r6]
00087f80  add     r1, pc ; -> 0x000fcf08  'aF\x0e'
00087f82  ldr     r4, [r1]
00087f84  mov     r1, r4
00087f86  str     r0, [sp]
00087f88  ldr     r0, [r5, r3]
00087f8a  blx     #0xddbfc ; -> objc_msgSend
00087f8e  ldr     r3, [pc, #0xd4]
00087f90  mov     r1, r4
00087f92  add     r3, pc ; -> 0x000f6038  OBJC_IVAR_$_FBXMLHandler._nameStack
00087f94  ldr     r3, [r3]
00087f96  ldr     r0, [r5, r3]
00087f98  blx     #0xddbfc ; -> objc_msgSend
00087f9c  ldr     r1, [pc, #0xc8]
00087f9e  ldr     r3, [r6]
00087fa0  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
00087fa2  ldr     r0, [r5, r3]
00087fa4  ldr     r1, [r1]
00087fa6  blx     #0xddbfc ; -> objc_msgSend
00087faa  cbnz    r0, #0x87fd6
00087fac  ldr     r3, [pc, #0xbc]
00087fae  mov     r1, r8
00087fb0  mov     r0, fp
00087fb2  add     r3, pc ; -> 0x000f603c  OBJC_IVAR_$_FBXMLHandler._rootObject
00087fb4  ldr     r4, [r3]
00087fb6  blx     #0xddbfc ; -> objc_msgSend
00087fba  ldr     r3, [pc, #0xb4]
00087fbc  mov     r1, r8
00087fbe  add     r3, pc ; -> 0x000f6040  OBJC_IVAR_$_FBXMLHandler._rootName
00087fc0  str     r0, [r5, r4]
00087fc2  ldr     r0, [sp]
00087fc4  ldr     r4, [r3]
00087fc6  blx     #0xddbfc ; -> objc_msgSend
00087fca  str     r0, [r5, r4]
00087fcc  sub.w   sp, r7, #0x18
00087fd0  pop.w   {r8, sl, fp}
00087fd4  pop     {r4, r5, r6, r7, pc}
00087fd6  movs    r2, #1
00087fd8  mov     r0, r5
00087fda  mov     r1, sl
00087fdc  blx     #0xddbfc ; -> objc_msgSend
00087fe0  ldr     r1, [pc, #0x90]
00087fe2  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
00087fe4  ldr     r6, [r1]
00087fe6  ldr     r1, [pc, #0x90]
00087fe8  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
00087fea  ldr     r5, [r1]
00087fec  mov     r1, r5
00087fee  mov     r4, r0
00087ff0  ldr     r0, [pc, #0x88]
00087ff2  add     r0, pc ; -> 0x000fdb70  
00087ff4  ldr     r0, [r0]
00087ff6  blx     #0xddbfc ; -> objc_msgSend
00087ffa  mov     r1, r6
00087ffc  mov     r2, r0
00087ffe  mov     r0, r4
00088000  blx     #0xddbfc ; -> objc_msgSend
00088004  tst.w   r0, #0xff
00088008  beq     #0x8801a
0008800a  ldr     r1, [pc, #0x74]
0008800c  mov     r0, r4
0008800e  mov     r2, fp
00088010  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
00088012  ldr     r1, [r1]
00088014  blx     #0xddbfc ; -> objc_msgSend
00088018  b       #0x87fcc
0008801a  ldr     r0, [pc, #0x68]
0008801c  mov     r1, r5
0008801e  add     r0, pc ; -> 0x000fdbf4  
00088020  ldr     r0, [r0]
00088022  blx     #0xddbfc ; -> objc_msgSend
00088026  mov     r1, r6
00088028  mov     r2, r0
0008802a  mov     r0, r4
0008802c  blx     #0xddbfc ; -> objc_msgSend
00088030  tst.w   r0, #0xff
00088034  beq     #0x87fcc
00088036  ldr     r1, [pc, #0x50]
00088038  mov     r0, r4
0008803a  mov     r2, fp
0008803c  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
0008803e  ldr     r3, [sp]
00088040  ldr     r1, [r1]
00088042  blx     #0xddbfc ; -> objc_msgSend
00088046  b       #0x87fcc
00088048  ldr     r7, [pc, #0x390]
0008804a  movs    r7, r0
0008804c  b       #0x88238
0008804e  movs    r6, r0
00088050  ldr     r7, [pc, #0x338]
00088052  movs    r7, r0
00088054  ldr     r5, [pc, #0x208]
00088056  movs    r7, r0
00088058  ldr     r2, [pc, #0x3f0]
0008805a  movs    r7, r0
0008805c  ldr     r7, [pc, #0x2c0]
0008805e  movs    r7, r0
00088060  ldr     r7, [pc, #0x210]
00088062  movs    r7, r0
00088064  b       #0x881ac
00088066  movs    r6, r0
00088068  ldr     r2, [pc, #0x370]
0008806a  movs    r7, r0
0008806c  b       #0x8817c ; -> -[FBXMLHandler flushCharacters]
0008806e  movs    r6, r0
00088070  b       #0x88170
00088072  movs    r6, r0
00088074  ldr     r6, [pc, #0x268]
00088076  movs    r7, r0
00088078  ldr     r2, [pc, #0x80]
0008807a  movs    r7, r0
0008807c  ldrh    r2, [r7, r5]
0008807e  movs    r7, r0
00088080  ldr     r2, [pc, #0x1c0]
00088082  movs    r7, r0
00088084  ldrh    r2, [r2, r7]
00088086  movs    r7, r0
00088088  ldr     r2, [pc, #0x260]
0008808a  movs    r7, r0
