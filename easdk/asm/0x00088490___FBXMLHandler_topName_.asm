========================================================================
-[FBXMLHandler topName]  0x00088490  32 bytes   FBXMLHandler.m
========================================================================

00088490  push    {r7, lr}
00088492  add     r7, sp, #0
00088494  ldr     r3, [pc, #0x10]
00088496  ldr     r1, [pc, #0x14]
00088498  add     r3, pc ; -> 0x000f6038  OBJC_IVAR_$_FBXMLHandler._nameStack
0008849a  add     r1, pc ; -> 0x000fcf38  '\x12G\x0e'
0008849c  ldr     r3, [r3]
0008849e  ldr     r1, [r1]
000884a0  ldr     r0, [r0, r3]
000884a2  blx     #0xddbfc ; -> objc_msgSend
000884a6  pop     {r7, pc}
000884a8  blt     #0x883e4
000884aa  movs    r6, r0
000884ac  ldr     r2, [pc, #0x268]
000884ae  movs    r7, r0
